package cn.xt.sms.service;

import cn.xt.sms.result.MyResult;
import cn.xt.sms.entity.TradeGroup;

/**
 * @author xietao.x@qq.com
 * @date 2018/3/20
 */
public interface ITradeGroupService {

    /*新增TradeGroup信息*/
    String insert(TradeGroup tradeGroup);

    /*更新TradeGroup信息*/
    String update(TradeGroup tradeGroup);

    /*删除TradeGroup信息*/
    String delete(Integer id);

    /*查询所有TradeGroup信息*/
    MyResult<TradeGroup> getTradeGroup();

    /*根据分组名查询id,没有查到则新增*/
    Integer selectIdByNameOrInsert(String name);

}
