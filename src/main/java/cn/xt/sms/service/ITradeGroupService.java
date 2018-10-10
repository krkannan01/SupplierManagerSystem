package cn.xt.sms.service;

import cn.xt.sms.annotation.GetCache;
import cn.xt.sms.entity.TradeGroup;

import java.util.List;

/**
 * @author xietao.x@qq.com
 * @date 2018/3/20
 */
public interface ITradeGroupService {

    /*新增TradeGroup信息*/
    Integer insert(TradeGroup tradeGroup);

    /*更新TradeGroup信息*/
    Integer update(TradeGroup tradeGroup);

    /*删除TradeGroup信息*/
    Integer delete(Integer id);

    /*多行删除TradeGroup信息*/
    Integer multiDelete(List<Integer> ids);

    /*查询所有TradeGroup信息*/
    List<TradeGroup> getTradeGroup(Integer parentId, Integer categoryId);

    /*根据分组名查询id,没有查到则新增*/
    Integer selectIdByNameOrInsert(String name);

}
