package cn.xt.sms.dao;

import cn.xt.sms.condition.SupplierCondition;
import cn.xt.sms.entity.Supplier;
import cn.xt.sms.util.Render;
import lombok.extern.log4j.Log4j;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
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
@Transactional(transactionManager = "transactionManager")
@Rollback(false)
@Log4j
public class ISupplierDaoTest {

    @Autowired
    private ISupplierDao supplierDao;

    @Test
    public void selectContactIdById() {
    }

    @Test
    public void addSupplier() {

    }

    @Test
    public void deleteSupplier() {
    }

    @Test
    public void updateSupplier() {
    }

    @Test
    public void selectSupplier() {
    }

    @Test
    public void selectSimpleSupplier() {
        SupplierCondition condition = new SupplierCondition();
        condition.setCategoryId(2);
        List<Supplier> suppliers = supplierDao.selectSimpleSupplier(10, 0, condition);

        suppliers.stream().forEach(supplier -> {
            System.out.println(Render.renderSuccess(supplier.toString()));
        });
    }

    @Test
    public void selectSupplierCount() {
    }

    @Test
    public void getSupplierById() {
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
    public void getSupplierIdAndName() {
    }

    @Test
    public void getMaxNo() {
        String no = supplierDao.getMaxNo();
        log.info(Render.renderInfo(no));
        Assert.assertNotNull(no);
    }

}