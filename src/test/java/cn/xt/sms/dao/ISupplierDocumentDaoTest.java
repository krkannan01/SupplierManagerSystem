package cn.xt.sms.dao;

import cn.xt.sms.condition.SupplierDocumentCondition;
import cn.xt.sms.entity.DocumentType;
import cn.xt.sms.entity.SupplierDocument;
import cn.xt.sms.util.Render;
import com.sun.org.apache.xalan.internal.xsltc.util.IntegerArray;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import javax.imageio.stream.FileImageInputStream;
import javax.imageio.stream.FileImageOutputStream;
import javax.imageio.stream.ImageInputStream;
import java.io.*;
import java.util.List;

import static cn.xt.sms.util.BasicUtil.byte2image;
import static cn.xt.sms.util.BasicUtil.image2byte;
import static org.junit.Assert.*;

/**
 * @Auther: xietao
 * @Date: 2018/7/24
 * @Description:
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
@Transactional(transactionManager = "transactionManager")
@Rollback(false)
@Log4j
public class ISupplierDocumentDaoTest {

    @Autowired
    private ISupplierDocumentDao supplierDocumentDao;

    @Test
    public void insertSupplierDocument() {
        SupplierDocument supplierDocument = new SupplierDocument();
        supplierDocument.setName("TestName");
        supplierDocument.setType(new DocumentType(9, null, null));
        supplierDocument.setSupplierId(23);
        supplierDocument.setAppendixName("test.sql");
        supplierDocument.setAppendix(image2byte("D:\\安装包资源\\SupplierManagerSystem\\src\\test\\resources\\test.sql"));
        supplierDocumentDao.insertSupplierDocument(supplierDocument);
    }

    @Test
    public void deleteSupplierDocument() {
        Integer[] ids = {new Integer(7)};
        supplierDocumentDao.deleteSupplierDocument(ids);
    }

    @Test
    public void getSupplierDocumentList() {
        SupplierDocumentCondition condition = new SupplierDocumentCondition(null, "name", "asc");
//        condition.setName("基");
//        condition.setTypeId(2);
        condition.setSupplierName("厦门");
        List<SupplierDocument> supplierDocumentList = supplierDocumentDao.getSupplierDocumentList(10, 0, condition);
        supplierDocumentList.stream().forEach(document -> {
            log.info(Render.renderSuccess(document.getName()));
//            if (document.getAppendix() != null && document.getAppendix().length != 0)
//                byte2image(document.getAppendix(), "D:\\安装包资源\\SupplierManagerSystem\\src\\test\\resources\\" + document.getAppendixName());
        });
    }

    public static void main(String[] args) {
        byte[] bytes = image2byte("D:\\安装包资源\\SupplierManagerSystem\\src\\test\\resources\\TestImg.jpg");
        byte2image(bytes, "D:\\安装包资源\\SupplierManagerSystem\\src\\test\\resources\\test2.jpg");
    }

}