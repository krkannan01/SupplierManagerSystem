package cn.xt.sms.dao;

import cn.xt.sms.entity.DocumentType;
import cn.xt.sms.util.Render;
import lombok.extern.log4j.Log4j;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static org.junit.Assert.*;

/**
 * @Auther: xietao
 * @Date: 2018/7/31
 * @Description:
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
@Transactional(transactionManager = "transactionManager")
@Rollback(false)
@Log4j
public class IDocumentTypeDaoTest {

    @Autowired
    private IDocumentTypeDao documentTypeDao;

    @Test
    public void insertDocumentType() {
        Integer affectedRowNumber = documentTypeDao.insertDocumentType(new DocumentType(null, "测试", ""));
        Assert.assertNotNull(affectedRowNumber);
    }

    @Test
    public void updateUseFrequency() {
        Integer id = 11;
        Integer increment = 1;
        Integer affectedRowNumber = documentTypeDao.updateUseFrequency(id, increment);
        Assert.assertNotNull(affectedRowNumber);
    }

    @Test
    public void getDocumentTypeList() {
        List<DocumentType> types = documentTypeDao.getDocumentTypeList();
        Assert.assertNotNull(types);
        types.forEach(type -> System.out.println(Render.renderInfo(type.toString())));
    }

    @Test
    public void deleteDocumentType() {
        Integer[] id = {11};
        Integer affectedRowNumber = documentTypeDao.deleteDocumentType(id);
        Assert.assertNotNull(affectedRowNumber);
    }

}