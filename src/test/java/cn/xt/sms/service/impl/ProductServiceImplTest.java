package cn.xt.sms.service.impl;

import cn.xt.sms.service.IProductService;
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

import static org.junit.Assert.*;

/**
 * @Auther: xietao
 * @Date: 2018/7/20
 * @Description:
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
@Transactional
@TransactionConfiguration(defaultRollback = false)
@Log4j
public class ProductServiceImplTest {

    @Autowired
    private IProductService productService;

    @Test
    public void getMaxNo() {
        String result = productService.getMaxNo();
        System.out.println(Render.renderInfo(result));
        Assert.assertNotNull(result);
    }
}