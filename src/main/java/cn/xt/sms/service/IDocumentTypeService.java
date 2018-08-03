package cn.xt.sms.service;

import cn.xt.sms.condition.SupplierDocumentCondition;
import cn.xt.sms.entity.DocumentType;
import cn.xt.sms.entity.SupplierDocument;
import cn.xt.sms.response.DataResponse;

import java.util.List;

/**
 * @Auther: xietao
 * @Date: 2018/7/25
 * @Description: 供应商文档 业务逻辑层
 */
public interface IDocumentTypeService {

    // 添加文档类型
    Integer insertDocumentType(DocumentType type);

    // 删除文档类型
    Integer deleteDocumentType(Integer[] ids);

    // 获取文档类型集合
    DataResponse<DocumentType> getDocumentTypeList();

    // 修改使用频率
    Integer updateUseFrequency(Integer id, Integer increment);

}
