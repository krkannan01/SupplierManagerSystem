package cn.xt.sms.service.impl;

import cn.xt.sms.dao.IProductGroupDao;
import cn.xt.sms.entity.Product;
import cn.xt.sms.entity.ProductGroup;
import cn.xt.sms.service.IProductGroupService;
import cn.xt.sms.util.BasicUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

/**
 * @author xietao.x@qq.com
 * @date 2018/4/19
 */
@Service
public class ProductGroupServiceImpl implements IProductGroupService {

    @Autowired
    private IProductGroupDao productGroupDao;

    public List<ProductGroup> getProductGroupList() {
        return productGroupDao.getProductGroupList();
    }

    @Override
    public List<ProductGroup> getProductGroupListAndSupplierCount() {
        /* 1:取出 parentId 为参数中 parentId 的第一级集合，并将第一集集合元素添加道队列中
         * 2:依次为队列中的元素查找子集，并将子集元素已添加到队列中，直至队列全部遍历完成 */
        List<ProductGroup> productGroupList = productGroupDao.getProductGroupListAndSupplierCount();  // 全部分组信息
        List<ProductGroup> resultGroupList = new ArrayList<>();  // 初始化结果集
        Queue<ProductGroup> queue = new LinkedList<>();  // 需要查找子集的元素的队列

        int index = 0;  // 标识已取出的数据的个数

        // 遍历结果集，为结果集设置子集
        resultGroupList = getProductGroupForAllByParentId(productGroupList, 0, index);
        if (resultGroupList.size() > 0) {
            resultGroupList.stream().forEach(e -> queue.offer(e));  // 添加到队列
            index += resultGroupList.size();  // 取出的数量叠加
        } else {
            return null;
        }

        // 循环队列
        while (queue.size() > 0) {
            ProductGroup productGroup = queue.poll();  // 弹出第一个元素并在队列中删除
            productGroup.setChildren(getProductGroupForAllByParentId(productGroupList, productGroup.getId(), index));
            if (productGroup.getChildren().size() > 0) {
                productGroup.getChildren().stream().forEach(e -> queue.offer(e));
                index += productGroup.getChildren().size();
            } else {
                productGroup.setChildren(null);
            }
        }

        return resultGroupList;
    }

    /**
     * @param productGroups 待查询的所有分组集合
     * @param parentId 根据 parengId 查询子集
     * @param invalidIndex 标识 productGroups 中下标 < invalidIndex 的元素无效，不需要遍历
     * @return 返回集合中元素 parentId 等于 参数中 parentId 的元素集合
     */
    public List<ProductGroup> getProductGroupForAllByParentId(List<ProductGroup> productGroups, Integer parentId, int invalidIndex) {
        List<ProductGroup> result = new ArrayList<>();
        for (int i = invalidIndex; i < productGroups.size(); i ++) {
            if (productGroups.get(i).getParentId() == parentId) {
                result.add(productGroups.get(i));
                BasicUtil.swap(productGroups, invalidIndex, i);
                invalidIndex ++;
            }
        }
        return result;
    }

    @Override
    public ProductGroup getProductGroupById(Integer id) {
        return productGroupDao.getProductGroupById(id);
    }

    @Override
    public Integer setIdAndInsertProductGroup(ProductGroup productGroup) {
        if (productGroup != null) {
            /*判断是否已经存在分组名称*/
            Integer groupId = productGroupDao.getIdByName(productGroup.getName());
            if (groupId == null) {
                return productGroupDao.insertProductGroup(productGroup);
            } else {
                productGroup.setId(groupId);
            }
        }
        return 0;
    }

    @Override
    @Transactional
    public Integer deleteProductGroup(Integer id) {
        return productGroupDao.deleteProductGroup(id);
    }

    @Override
    public boolean unique(String name) {
        return productGroupDao.getIdByName(name) != null;
    }

    @Override
    public Integer updateProductGroup(ProductGroup productGroup) {
        return productGroupDao.updateProductGroup(productGroup);
    }

}
