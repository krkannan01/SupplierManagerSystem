package cn.xt.sms.dao;

import cn.xt.sms.Result.MapResult;
import cn.xt.sms.entity.Enterprise;
import cn.xt.sms.Condition.EnterpriseCondition;
import cn.xt.sms.entity.TradeGroup;
import cn.xt.sms.entity.UserDefinedFieldName;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 *
 * @author xietao.x@qq.com
 */
public interface IEnterpriseDao {

    /*根据id查询ContactId*/
    Integer selectContactIdById(Integer id);

    /*添加企业信息*/
    Integer addEnterprise(Enterprise enterprise);

    /*删除企业信息*/
    Integer deleteEnterprise(Integer id);

    /*更新企业信息*/
    Integer updateEnterprise(Enterprise enterprise);

    /*查询所有Enterprise信息【所有字段】*/
    List<Enterprise> selectEnterprise(@Param("pageSize") Integer pageSize,
                                      @Param("offset") Integer offset,
                                      @Param("enterpriseCondition") EnterpriseCondition enterpriseCondition);

    /*查询所有Enterprise信息【部分字段】*/
    List<Enterprise> selectSimpleEnterprise(@Param("pageSize") Integer pageSize,
                                      @Param("offset") Integer offset,
                                      @Param("enterpriseCondition") EnterpriseCondition enterpriseCondition);

    /*查询对应条件下的Enterprise记录数量信息*/
    Integer selectEnterpriseCount(EnterpriseCondition enterpriseCondition);

    /*根据id查询对应Enterprise信息*/
    Enterprise getEnterpriseById(Integer id);

    /*查询用户自定义字段名称信息*/
    UserDefinedFieldName getUserDefinedFieldName();

    /*验证公司名称是否存在*/
    Integer getIdByFullName(String fullName);

    /*根据TradeGroupId查询所有EnterpriseId信息*/
    List<Integer> getIdByTradeGroupId(Integer tradeGroupId);

    /*获取所有企业的id和name信息*/
    List<MapResult> getEnterpriseIdAndName();

}
