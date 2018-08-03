package cn.xt.sms.service.impl;

import cn.xt.sms.entity.ProductGroup;
import cn.xt.sms.service.IProductGroupService;
import cn.xt.sms.util.Render;
import lombok.extern.log4j.Log4j;
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
 * @Date: 2018/7/15
 * @Description:
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
@Transactional
@TransactionConfiguration(defaultRollback = false)
@Log4j
public class ProductGroupServiceImplTest {

    @Autowired
    private IProductGroupService productGroupService;

    @Test
    public void getProductGroupList() {

        List<ProductGroup> list = productGroupService.getProductGroupList(0);
        list.stream().forEach(productGroup -> log.info(Render.renderInfo(productGroup.toString())));

    }
}