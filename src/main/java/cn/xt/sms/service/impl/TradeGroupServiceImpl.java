package cn.xt.sms.service.impl;

import cn.xt.sms.dao.ITradeGroupDao;
import cn.xt.sms.entity.TradeGroup;
import cn.xt.sms.service.ISupplierService;
import cn.xt.sms.service.ITradeGroupService;
import cn.xt.sms.util.BasicUtil;
import cn.xt.sms.util.Render;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

/**
 * @author xietao.x@qq.com
 * @date 2018/3/20
 */
@Log4j
@Service
public class TradeGroupServiceImpl implements ITradeGroupService {

    @Autowired
    private ITradeGroupDao tradeGroupDao;
    @Autowired
    private ISupplierService supplierService;

    @Override
    public Integer insert(TradeGroup tradeGroup) {
        return tradeGroupDao.insertTradeGroup(tradeGroup);
    }

    @Override
    public Integer update(TradeGroup tradeGroup) {
        return tradeGroupDao.updateTradeGroup(tradeGroup);
    }

    @Override
    @Transactional
    public Integer delete(Integer id) {
        List<Integer> ids = supplierService.getIdByTradeGroupId(id);
        for (Integer supplierId: ids) {
            supplierService.deleteSupplier(supplierId);
        }
        return tradeGroupDao.deleteTradeGroup(id);
    }

    @Override
    @Transactional
    public Integer multiDelete(List<Integer> ids) {
        // TODO 这里调用 delete() 的事务会失效
        return ids.stream().mapToInt(id -> delete(id)).sum();
    }

    @Override
    public List<TradeGroup> getTradeGroup(Integer parentId, Integer categoryId) {
        /* 1:取出 parentId 为参数中 parentId 的第一级集合，并将第一集集合元素添加道队列中
         * 2:依次为队列中的元素查找子集，并将子集元素已添加到队列中，直至队列全部遍历完成 */
        List<TradeGroup> tradeGroupList = tradeGroupDao.getTradeGroup(categoryId);  // 全部分组信息
        List<TradeGroup> resultGroupList = new ArrayList<>();  // 初始化结果集
        Queue<TradeGroup> queue = new LinkedList<>();  // 需要查找子集的元素的队列

        int index = 0;  // 标识已取出的数据的个数

        // 初始化查询跟元素
        TradeGroup rootTradeGroup = new TradeGroup(parentId, null, null);
        // 遍历结果集，为结果集设置子集
        resultGroupList = getTradeGroupForAllByParentId(tradeGroupList, rootTradeGroup, index);
        if (resultGroupList.size() > 0) {
            resultGroupList.stream().forEach(e -> queue.offer(e));  // 添加到队列
            index += resultGroupList.size();  // 取出的数量叠加
        } else {
            return null;
        }


        // 循环队列
        while (queue.size() > 0 && index < tradeGroupList.size()) {
            TradeGroup trderGroup = queue.poll();  // 弹出第一个元素并再队列中删除
            trderGroup.setChildren(getTradeGroupForAllByParentId(tradeGroupList, trderGroup, index));
            if (trderGroup.getChildren().size() > 0) {
                trderGroup.getChildren().stream().forEach(e -> queue.offer(e));
                index += trderGroup.getChildren().size();
            } else {
                trderGroup.setChildren(null);
            }
        }

        return resultGroupList;
    }

    /**
     * @param tradeGroups 待查询的所有分组集合
     * @param parent 根据 parent 查询子集
     * @param invalidIndex 标识 productGroups 中下标 < invalidIndex 的元素无效，不需要遍历
     * @return 返回集合中元素 parentId 等于 参数中 parentId 的元素集合
     */
    public List<TradeGroup> getTradeGroupForAllByParentId(List<TradeGroup> tradeGroups, TradeGroup parent, int invalidIndex) {
        List<TradeGroup> result = new ArrayList<>();
        if (parent == null) {
            log.error(Render.renderError("错误的 parent 值, 不能为 null！"));
            return result;
        }
        if (invalidIndex < 0 || invalidIndex >= tradeGroups.size()) {
            log.error(Render.renderError("错误的 invalidIndex 值 {" + invalidIndex + "}, 不能超出 tradeGroups 的下标范围！"));
            return result;
        }
        for (int i = invalidIndex; i < tradeGroups.size(); i ++) {
            if (tradeGroups.get(i).getParentId() == parent.getId()) {
//                log.info(Render.renderInfo(tradeGroups.get(i).getName()));
                tradeGroups.get(i).setParent(parent);
                result.add(tradeGroups.get(i));
                BasicUtil.swap(tradeGroups, invalidIndex, i);
                invalidIndex ++;
            }
        }
        return result;
    }

    @Override
    public Integer selectIdByNameOrInsert(String name) {
        name = name.trim(); //去空格，排重
        Integer id = tradeGroupDao.selectIdByName(name);
        if (id == null) {
            TradeGroup tradeGroup = new TradeGroup(null, name, null);
            insert(tradeGroup);
            id = tradeGroup.getId();
        }
        return id;
    }

}
