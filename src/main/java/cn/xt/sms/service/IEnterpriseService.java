package cn.xt.sms.service;

import cn.xt.sms.Result.MapResult;
import cn.xt.sms.entity.Enterprise;
import cn.xt.sms.Condition.EnterpriseCondition;
import cn.xt.sms.Result.MyResult;
import cn.xt.sms.entity.TradeGroup;
import cn.xt.sms.entity.UserDefinedFieldName;
import org.apache.poi.ss.usermodel.Sheet;

import java.util.List;
import java.util.Map;

/**
 * @author xietao.x@qq.com
 * @date 2018/3/13
 */
public interface IEnterpriseService {

    /*查询企业信息*/
    MyResult<Enterprise> getEnterpriseList(EnterpriseCondition enterpriseCondition, Integer currentPage, Integer pageSize);

    /*查询导出数据*/
    List<Enterprise> getEnterpriseList(Integer pageSize, Integer offset, EnterpriseCondition enterpriseCondition);

    /*查询记录条数*/
    Integer getEnterpriseCount(EnterpriseCondition enterpriseCondition);

    /*根据id查询ContactId*/
    Integer selectContactIdById(Integer id);

    /*添加企业信息*/
    String insertEnterprise(Enterprise enterprise);

    /*删除企业信息*/
    String deleteEnterprise(Integer id);

    /*更新企业信息*/
    String updateEnterprise(Enterprise enterprise);

    /*根据id查询对应Enterprise信息*/
    Enterprise getEnterpriseById(Integer id);

    /*获取用户自定义字段名称信息*/
    UserDefinedFieldName getUserDefinedFieldName();

    /*验证公司名称是否存在*/
    Integer getIdByFullName(String fullName);

    /*根据TradeGroupId查询所有EnterpriseId信息*/
    List<Integer> getIdByTradeGroupId(Integer id);

    /*获取所有企业的id和name信息*/
    List<MapResult> getEnterpriseIdAndName();

}
