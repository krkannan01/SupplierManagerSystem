package cn.xt.sms.service;

import cn.xt.sms.condition.SupplierDocumentCondition;
import cn.xt.sms.entity.SupplierDocument;
import cn.xt.sms.response.DataResponse;

import java.util.List;

/**
 * @Auther: xietao
 * @Date: 2018/7/25
 * @Description: 供应商文档 业务逻辑层
 */
public interface ISupplierDocumentService {

    /* 添加文档信息 */
    Integer insertSupplierDocument(SupplierDocument supplierDocument);

    /* 删除文档信息 */
    Integer deleteSupplierDocument(Integer... ids);

    /* 查询文档信息 */
    DataResponse<SupplierDocument> getSupplierDocumentList(Integer currentPage, Integer pageSize, SupplierDocumentCondition condition);

    /* 根据文档Id获取文档信息 */
    SupplierDocument getSupplierDocument(Integer id);

}
