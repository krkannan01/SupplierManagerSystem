package cn.xt.sms.service.impl;

import cn.xt.sms.result.MyResult;
import cn.xt.sms.dao.ITradeGroupDao;
import cn.xt.sms.entity.TradeGroup;
import cn.xt.sms.service.IEnterpriseService;
import cn.xt.sms.service.ITradeGroupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author xietao.x@qq.com
 * @date 2018/3/20
 */
@Service
public class TradeGroupServiceImpl implements ITradeGroupService {

    @Autowired
    private ITradeGroupDao tradeGroupDao;
    @Autowired
    private IEnterpriseService enterpriseService;

    @Override
    public String insert(TradeGroup tradeGroup) {
        return tradeGroupDao.insertTradeGroup(tradeGroup) > 0 ? "success":"fail";
    }

    @Override
    public String update(TradeGroup tradeGroup) {
        return tradeGroupDao.updateTradeGroup(tradeGroup) > 0 ? "success":"fail";
    }

    @Override
    @Transactional
    public String delete(Integer id) {
        List<Integer> ids = enterpriseService.getIdByTradeGroupId(id);
        for (Integer enterpriseId: ids) {
            enterpriseService.deleteEnterprise(enterpriseId);
        }
        return tradeGroupDao.deleteTradeGroup(id) > 0 ? "success":"fail";
    }

    @Override
    public MyResult<TradeGroup> getTradeGroup() {
        return new MyResult<TradeGroup>(null, null, tradeGroupDao.getTradeGroup());
    }

    @Override
    public Integer selectIdByNameOrInsert(String name) {
        Integer id = tradeGroupDao.selectIdByName();
        if (id == null) {
            TradeGroup tradeGroup = new TradeGroup(null, name, null);
            insert(tradeGroup);
            id = tradeGroup.getId();
        }
        return id;
    }

}
