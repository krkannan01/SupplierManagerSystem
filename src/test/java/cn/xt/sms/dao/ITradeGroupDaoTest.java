package cn.xt.sms.dao;

import cn.xt.sms.entity.TradeGroup;
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
public class ITradeGroupDaoTest {

    @Autowired
    private ITradeGroupDao tradeGroupDao;

    @Test
    public void insertTradeGroup() {
    }

    @Test
    public void updateTradeGroup() {
    }

    @Test
    public void deleteTradeGroup() {
    }

    @Test
    public void getTradeGroup() {
        List<TradeGroup> tradeGroup = tradeGroupDao.getTradeGroup(1);
        tradeGroup.stream().forEach(e -> log.info(Render.renderInfo(e.toString())));
    }

    @Test
    public void selectIdByName() {
    }
}