package cn.xt.sms.service.impl;

import cn.xt.sms.condition.SupplierDocumentCondition;
import cn.xt.sms.dao.IDocumentTypeDao;
import cn.xt.sms.dao.ISupplierDocumentDao;
import cn.xt.sms.entity.DocumentType;
import cn.xt.sms.entity.SupplierDocument;
import cn.xt.sms.response.DataResponse;
import cn.xt.sms.service.IDocumentTypeService;
import cn.xt.sms.service.ISupplierDocumentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Auther: xietao
 * @Date: 2018/7/25
 * @Description:
 */
@Service
public class DecoumentTypeServiceImpl implements IDocumentTypeService {

    @Autowired
    private IDocumentTypeDao documentTypeDao;

    @Override
    public Integer insertDocumentType(DocumentType type) {
        return documentTypeDao.insertDocumentType(type);
    }

    @Override
    public Integer deleteDocumentType(Integer[] ids) {
        return documentTypeDao.deleteDocumentType(ids);
    }

    @Override
    public DataResponse<DocumentType> getDocumentTypeList() {
        List<DocumentType> types = documentTypeDao.getDocumentTypeList();
        if (types != null) {
            return new DataResponse<DocumentType>().setSuccess(types, types.size());
        } else {
            return new DataResponse<DocumentType>().setError();
        }
    }

    @Override
    public Integer updateUseFrequency(Integer id, Integer increment) {
        return documentTypeDao.updateUseFrequency(id, increment);
    }

    @Override
    public Integer updateDocumentType(DocumentType type) {
        return documentTypeDao.updateDocumentType(type);
    }

}
