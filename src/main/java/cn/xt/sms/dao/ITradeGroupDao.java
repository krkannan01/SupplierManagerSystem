package cn.xt.sms.dao;

import cn.xt.sms.entity.TradeGroup;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author xietao.x@qq.com
 * @date 2018/3/20
 */
public interface ITradeGroupDao {

    /*新增TradeGroup信息*/
    Integer insertTradeGroup(TradeGroup tradeGroup);

    /*更新TradeGroup信息*/
    Integer updateTradeGroup(TradeGroup tradeGroup);

    /*删除TradeGroup信息*/
    Integer deleteTradeGroup(Integer id);

    /*查询所有TradeGroup信息*/
    List<TradeGroup> getTradeGroup(@Param("categoryId") Integer categoryId);

    /*根据Name查询Id*/
    Integer selectIdByName();

}
