package cn.xt.sms.service.impl;

import cn.xt.sms.condition.SupplierDocumentCondition;
import cn.xt.sms.entity.DocumentType;
import cn.xt.sms.entity.SupplierDocument;
import cn.xt.sms.response.DataResponse;
import cn.xt.sms.service.ISupplierDocumentService;
import cn.xt.sms.util.Render;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static cn.xt.sms.util.BasicUtil.byte2image;
import static cn.xt.sms.util.BasicUtil.image2byte;
import static org.junit.Assert.*;

/**
 * @Auther: xietao
 * @Date: 2018/7/25
 * @Description:
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
@Transactional(transactionManager = "transactionManager")
@Rollback(false)
@Log4j
public class SupplierDecoumentServiceImplTest {

    @Autowired
    private ISupplierDocumentService supplierDocumentService;

    @Test
    public void insertSupplierDocument() {
        SupplierDocument supplierDocument = new SupplierDocument();
        supplierDocument.setName("TestName");
        supplierDocument.setType(new DocumentType(9, null, null));
        supplierDocument.setSupplierId(23);
        supplierDocument.setAppendixName("test.sql");
        supplierDocument.setAppendix(image2byte("D:\\安装包资源\\SupplierManagerSystem\\src\\test\\resources\\test.sql"));
        supplierDocumentService.insertSupplierDocument(supplierDocument);
    }

    @Test
    public void deleteSupplierDocument() {
        Integer[] ids = {new Integer(10), new Integer(11)};
        supplierDocumentService.deleteSupplierDocument(ids);
    }

    @Test
    public void getSupplierDocumentList() {
        DataResponse<SupplierDocument> supplierDocumentList = supplierDocumentService.getSupplierDocumentList(1, 10, new SupplierDocumentCondition(null, "name", "asc"));
        supplierDocumentList.getRows().stream().forEach(document -> {
            log.info(Render.renderSuccess(document.getName()));
            if (document.getAppendix() != null && document.getAppendix().length != 0) {
                System.out.println(document.getAppendix().toString());
                byte2image(document.getAppendix(), "D:\\安装包资源\\SupplierManagerSystem\\src\\test\\resources\\" + document.getAppendixName());
            }
        });
    }
}