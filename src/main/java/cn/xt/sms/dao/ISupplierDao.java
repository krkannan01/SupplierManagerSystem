package cn.xt.sms.dao;

import cn.xt.sms.condition.SupplierCondition;
import cn.xt.sms.entity.Supplier;
import cn.xt.sms.dto.MapDTO;
import cn.xt.sms.entity.UserDefinedFieldName;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 *
 * @author xietao.x@qq.com
 */
public interface ISupplierDao {

    /*根据id查询ContactId*/
    Integer selectContactIdById(Integer id);

    /*添加企业信息*/
    Integer addSupplier(Supplier supplier);

    /*删除企业信息*/
    Integer deleteSupplier(Integer id);

    /*更新企业信息*/
    Integer updateSupplier(Supplier supplier);

    /*查询所有Supplier信息【所有字段】*/
    List<Supplier> selectSupplier(@Param("pageSize") Integer pageSize,
                                    @Param("offset") Integer offset,
                                    @Param("supplierCondition") SupplierCondition supplierCondition);

    /*查询所有Supplier信息【部分字段】*/
    List<Supplier> selectSimpleSupplier(@Param("pageSize") Integer pageSize,
                                          @Param("offset") Integer offset,
                                          @Param("supplierCondition") SupplierCondition supplierCondition);

    /*查询对应条件下的Supplier记录数量信息*/
    Integer selectSupplierCount(SupplierCondition supplierCondition);

    /*根据id查询对应Supplier信息*/
    Supplier getSupplierById(Integer id);

    /*查询用户自定义字段名称信息*/
    UserDefinedFieldName getUserDefinedFieldName();

    /*验证公司名称是否存在*/
    Integer getIdByFullName(String fullName);

    /*根据TradeGroupId查询所有SupplierId信息*/
    List<Integer> getIdByTradeGroupId(Integer tradeGroupId);

    /*获取所有企业的id和name信息*/
    List<MapDTO> getSupplierIdAndName();

    /*获取供应商目前最大的编号*/
    String getMaxNo();

}
