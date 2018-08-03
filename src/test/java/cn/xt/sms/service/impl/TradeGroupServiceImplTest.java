package cn.xt.sms.service.impl;

import cn.xt.sms.entity.ProductGroup;
import cn.xt.sms.entity.TradeGroup;
import cn.xt.sms.service.ITradeGroupService;
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
 * @Date: 2018/7/16
 * @Description:
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
@Transactional
@TransactionConfiguration(defaultRollback = false)
@Log4j
public class TradeGroupServiceImplTest {

    @Autowired
    private ITradeGroupService tradeGroupService;

    @Test
    public void insert() {
    }

    @Test
    public void update() {
    }

    @Test
    public void delete() {
    }

    @Test
    public void getTradeGroup() {

        List<TradeGroup> list = tradeGroupService.getTradeGroup(0, 0);
//        System.out.println(list.get(0).toString(""));
//        list.stream().forEach(tradeGroup -> {
//            TradeGroup.toString(tradeGroup, "");
//        });
        System.out.println(Render.renderError("[\n"));
        for (int i = 0; i < list.size(); i ++) {
            System.out.println(Render.renderError(list.get(i).toString("\t")));
            if (list.size() - 1 != i)
                System.out.println(Render.renderError("\t,"));
        }
        System.out.println(Render.renderError("]\n"));

    }

    @Test
    public void getTradeGroupForAllByParentId() {
    }

    @Test
    public void selectIdByNameOrInsert() {
    }
}