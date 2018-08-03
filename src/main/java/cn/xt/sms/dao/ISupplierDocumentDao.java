package cn.xt.sms.dao;

import cn.xt.sms.condition.SupplierDocumentCondition;
import cn.xt.sms.entity.SupplierDocument;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Auther: xietao
 * @Date: 2018/7/24
 * @Description: 供应商文档 数据接口层
 */
public interface ISupplierDocumentDao {

    /* 添加文档信息 */
    Integer insertSupplierDocument(SupplierDocument supplierDocument);

    /* 删除文档信息 */
    Integer deleteSupplierDocument(Integer[] ids);

    /* 查询文档信息 */
    List<SupplierDocument> getSupplierDocumentList(@Param("pageSize") Integer pageSize,
                                                   @Param("offset") Integer offset,
                                                   @Param("condition") SupplierDocumentCondition condition);

    /* 查询文档数量 */
    Integer getSupplierDocumentCount(SupplierDocumentCondition condition);

    /* 查询单个文档信息 */
    SupplierDocument getSupplierDocument(Integer id);

}
