package cn.xt.sms.dao;

import cn.xt.sms.entity.OperLog;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;

import static org.junit.Assert.*;

/**
 * @Auther: xietao
 * @Date: 2018/8/7
 * @Description:
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
@Transactional(transactionManager = "transactionManager")
@Rollback(false)
@Log4j
public class IOperLogDaoTest {

    @Autowired
    private IOperLogDao operLogDao;

    @Test
    public void insertOperlog() {
        OperLog operLog = new OperLog();
        operLog.setTitle("系统管理");
        operLog.setAction("部门管理-修改部门");
        operLogDao.insertOperlog(operLog);
    }

    @Test
    public void selectOperLogList() {
        operLogDao.selectOperLogList(null);
    }

    @Test
    public void batchDeleteOperLog() {
        operLogDao.batchDeleteOperLog(new Integer[]{210,211});
    }

    @Test
    public void selectOperLogById() {
        operLogDao.selectOperLogById(212);
    }
}