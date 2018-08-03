package cn.xt.sms.service;

import cn.xt.sms.entity.Supplier;
import cn.xt.sms.dto.MapDTO;
import cn.xt.sms.condition.SupplierCondition;
import cn.xt.sms.response.DataResponse;
import cn.xt.sms.entity.UserDefinedFieldName;

import javax.servlet.ServletContext;
import java.util.List;

/**
 * @author xietao.x@qq.com
 * @date 2018/3/13
 */
public interface ISupplierService {

    /*查询企业信息*/
    DataResponse<Supplier> getSupplierList(SupplierCondition supplierCondition, Integer currentPage, Integer pageSize);

    /*查询导出数据*/
    List<Supplier> getSupplierList(Integer pageSize, Integer offset, SupplierCondition supplierCondition);

    /*查询记录条数*/
    Integer getSupplierCount(SupplierCondition supplierCondition);

    /*根据id查询ContactId*/
    Integer selectContactIdById(Integer id);

    /*添加企业信息*/
    String insertSupplier(ServletContext context, Supplier supplier);

    /*删除企业信息*/
    String deleteSupplier(Integer id);

    /*更新企业信息*/
    String updateSupplier(Supplier supplier);

    /*根据id查询对应Supplier信息*/
    Supplier getSupplierById(Integer id);

    /*获取用户自定义字段名称信息*/
    UserDefinedFieldName getUserDefinedFieldName();

    /*验证公司名称是否存在*/
    Integer getIdByFullName(String fullName);

    /*根据TradeGroupId查询所有SupplierId信息*/
    List<Integer> getIdByTradeGroupId(Integer id);

    /*获取所有企业的id和name信息*/
    List<MapDTO> getSupplierIdAndName();

    /*查询供应商中的最大编号*/
    String getMaxNo();

}
