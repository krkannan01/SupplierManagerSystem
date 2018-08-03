package cn.xt.sms.service;

import cn.xt.sms.entity.Supplier;
import cn.xt.sms.result.MapResult;
import cn.xt.sms.condition.SupplierCondition;
import cn.xt.sms.result.MyResult;
import cn.xt.sms.entity.UserDefinedFieldName;

import javax.servlet.ServletContext;
import java.util.List;

/**
 * @author xietao.x@qq.com
 * @date 2018/3/13
 */
public interface IEnterpriseService {

    /*查询企业信息*/
    MyResult<Supplier> getEnterpriseList(SupplierCondition supplierCondition, Integer currentPage, Integer pageSize);

    /*查询导出数据*/
    List<Supplier> getEnterpriseList(Integer pageSize, Integer offset, SupplierCondition supplierCondition);

    /*查询记录条数*/
    Integer getEnterpriseCount(SupplierCondition supplierCondition);

    /*根据id查询ContactId*/
    Integer selectContactIdById(Integer id);

    /*添加企业信息*/
    String insertEnterprise(ServletContext context, Supplier supplier);

    /*删除企业信息*/
    String deleteEnterprise(Integer id);

    /*更新企业信息*/
    String updateEnterprise(Supplier supplier);

    /*根据id查询对应Enterprise信息*/
    Supplier getEnterpriseById(Integer id);

    /*获取用户自定义字段名称信息*/
    UserDefinedFieldName getUserDefinedFieldName();

    /*验证公司名称是否存在*/
    Integer getIdByFullName(String fullName);

    /*根据TradeGroupId查询所有EnterpriseId信息*/
    List<Integer> getIdByTradeGroupId(Integer id);

    /*获取所有企业的id和name信息*/
    List<MapResult> getEnterpriseIdAndName();

    /*查询供应商中的最大编号*/
    String getMaxNo();

}
