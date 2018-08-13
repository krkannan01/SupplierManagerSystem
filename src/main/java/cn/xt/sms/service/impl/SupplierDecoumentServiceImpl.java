package cn.xt.sms.service.impl;

import cn.xt.sms.condition.SupplierDocumentCondition;
import cn.xt.sms.dao.IDocumentTypeDao;
import cn.xt.sms.dao.ISupplierDocumentDao;
import cn.xt.sms.entity.Product;
import cn.xt.sms.entity.SupplierDocument;
import cn.xt.sms.response.DataResponse;
import cn.xt.sms.service.ISupplierDocumentService;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Auther: xietao
 * @Date: 2018/7/25
 * @Description:
 */
@Log4j
@Service
public class SupplierDecoumentServiceImpl implements ISupplierDocumentService {

    @Autowired
    private ISupplierDocumentDao supplierDocumentDao;
    @Autowired
    private IDocumentTypeDao documentTypeDao;

    @Override
    public Integer insertSupplierDocument(SupplierDocument supplierDocument) {
        try {
            documentTypeDao.updateUseFrequency(supplierDocument.getType().getId(), 1);
        } catch (Exception e){
            log.error(e.getMessage());
        }
        return supplierDocumentDao.insertSupplierDocument(supplierDocument);
    }

    @Override
    public Integer deleteSupplierDocument(Integer... ids) {
        return supplierDocumentDao.deleteSupplierDocument(ids);
    }

    @Override
    public DataResponse<SupplierDocument> getSupplierDocumentList(Integer currentPage, Integer pageSize, SupplierDocumentCondition condition) {
        /*计算偏移量*/
        pageSize = pageSize == null ? 10:pageSize;
        Integer offset = currentPage == null ? 0:(currentPage-1)*pageSize;
        offset = offset < 0 ? 0:offset;

        Integer count = supplierDocumentDao.getSupplierDocumentCount(condition);

        /*判断偏移量是否超过总数，如果是，降低偏移量*/
        if (offset >= count) {
            offset = (count-1)/pageSize*pageSize;
        }

        List<SupplierDocument> supplierDocumentList = supplierDocumentDao.getSupplierDocumentList(pageSize, offset, condition);

        if (supplierDocumentList != null && count != null) {
            return new DataResponse<SupplierDocument>().setSuccess(supplierDocumentList, count);
        } else {
            return new DataResponse<SupplierDocument>().setError();
        }
    }

    @Override
    public SupplierDocument getSupplierDocument(Integer id) {
        return supplierDocumentDao.getSupplierDocument(id);
    }
}
