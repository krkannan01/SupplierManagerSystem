package cn.xt.sms.dao;

import cn.xt.sms.condition.SupplierCondition;
import cn.xt.sms.entity.Supplier;
import cn.xt.sms.util.Render;
import lombok.extern.log4j.Log4j;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Auther: xietao
 * @Date: 2018/7/17
 * @Description:
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
@Transactional
@TransactionConfiguration(defaultRollback = false)
@Log4j
public class ISupplierDaoTest {

    @Autowired
    private ISupplierDao enterpriseDao;

    @Test
    public void selectContactIdById() {
    }

    @Test
    public void addEnterprise() {

    }

    @Test
    public void deleteEnterprise() {
    }

    @Test
    public void updateEnterprise() {
    }

    @Test
    public void selectEnterprise() {
    }

    @Test
    public void selectSimpleEnterprise() {
        SupplierCondition condition = new SupplierCondition();
        condition.setCategoryId(2);
        List<Supplier> enterprises = enterpriseDao.selectSimpleEnterprise(10, 0, condition);

        enterprises.stream().forEach(enterprise -> {
            System.out.println(Render.renderSuccess(enterprise.toString()));
        });
    }

    @Test
    public void selectEnterpriseCount() {
    }

    @Test
    public void getEnterpriseById() {
    }

    @Test
    public void getUserDefinedFieldName() {
    }

    @Test
    public void getIdByFullName() {
    }

    @Test
    public void getIdByTradeGroupId() {
    }

    @Test
    public void getEnterpriseIdAndName() {
    }

    @Test
    public void getMaxNo() {
        String no = enterpriseDao.getMaxNo();
        log.info(Render.renderInfo(no));
        Assert.assertNotNull(no);
    }

}