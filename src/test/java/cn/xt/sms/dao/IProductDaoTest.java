package cn.xt.sms.dao;

import cn.xt.sms.entity.Supplier;
import cn.xt.sms.entity.Supplier;
import cn.xt.sms.entity.Product;
import cn.xt.sms.entity.ProductBrand;
import cn.xt.sms.entity.ProductGroup;
import cn.xt.sms.entity.Supplier;
import cn.xt.sms.entity.Supplier;
import cn.xt.sms.service.IProductService;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import static org.junit.Assert.*;

/**
 * @Auther: xietao
 * @Date: 2018/7/20
 * @Description:
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
@Transactional(transactionManager = "transactionManager")
@Rollback(false)
@Log4j
public class IProductDaoTest {

    @Autowired
    private IProductDao productDao;

    @Test
    public void insertProduct() {
        Product product = new Product();
        product.setNo("2018000010");
        product.setName("1");
        product.setGroupId(new ProductGroup("视频监控系统"));
        Supplier supplier = new Supplier();
        supplier.setFullName("深圳讯道实业股份有限公司");
        product.setSupplierId(supplier);
        product.setSize("1");
        product.setUnit("1");
        product.setBrandId(new ProductBrand("Asus"));
        product.setUnitprice(123.0f);

        productDao.insertProduct(product);
    }
}