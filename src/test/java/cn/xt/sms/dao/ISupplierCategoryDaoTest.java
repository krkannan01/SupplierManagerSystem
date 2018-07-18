package cn.xt.sms.dao;

import cn.xt.sms.entity.SupplierCategory;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static org.junit.Assert.*;

/**
 * @Auther: xietao
 * @Date: 2018/7/14
 * @Description:
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
@Transactional
@TransactionConfiguration(defaultRollback = false)
public class ISupplierCategoryDaoTest {

    @Autowired
    private ISupplierCategoryDao supplierCategoryDao;

    @Test
    public void selectSupplierCategoryList() {
        List<SupplierCategory> supplierCategories = supplierCategoryDao.selectSupplierCategoryList();
        supplierCategories.stream().forEach(supplierCategory -> System.out.println(supplierCategory));
        Assert.assertNotNull("0", supplierCategories.size());
    }

    @Test
    public void insertSupplierCategory() {
        SupplierCategory supplierCategory = new SupplierCategory();
        supplierCategory.setId(4);
        supplierCategory.setName("其它供应商");
        supplierCategory.setDescription("其它");
        Integer result = supplierCategoryDao.insertSupplierCategory(supplierCategory);
        Assert.assertNotNull("0", result);
    }

    @Test
    public void deleteSupplierCategory() {
        Integer id = 4;
        Integer result = supplierCategoryDao.deleteSupplierCategory(id);
        Assert.assertNotNull("0", result);
    }

    @Test
    public void updateSupplierCategory() {
        SupplierCategory supplierCategory = new SupplierCategory();
        supplierCategory.setId(4);
        supplierCategory.setName("其它供应商");
        supplierCategory.setDescription("其它的");
        Integer result = supplierCategoryDao.updateSupplierCategory(supplierCategory);
        Assert.assertNotNull("0", result);
    }
}