package cn.xt.sms.service;

import cn.xt.sms.entity.OperLog;
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
 * @Date: 2018/8/15
 * @Description:
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
@Transactional(transactionManager = "transactionManager")
@Rollback(false)
@Log4j
public class IOperLogServiceTest {

    @Autowired
    private IOperLogService operLogService;

    @Test
    public void insertOperlog() {
        OperLog operLog = new OperLog();
        operLog.setTitle("文档类型管理");
        operLog.setAction("文档类型-查看");
        operLog.setMethod("cn.xt.sms.controller.DocumentTypeController.toSearchDocumentType()");
        operLog.setChannel("web");
        operLog.setLoginName("admin");
        operLog.setOperUrl("/documentType/toSearchDocumentType");
        operLog.setOperIp("127.0.0.1");
        operLog.setOperParam("{}");
        operLog.setStatus(0);
        operLogService.insertOperlog(operLog);
    }

    @Test
    public void selectOperLogList() {
        List<OperLog> list = (List<OperLog>) operLogService.selectOperLogList(null).getRows();
        Assert.assertNotEquals(0, list.size());
        list.stream().forEach((OperLog r) -> System.out.println(Render.renderInfo(r.toString())));
    }

    @Test
    public void batchDeleteOperLog() {
        Integer attectedRowNumber = operLogService.batchDeleteOperLog(new Integer[]{1});
        Assert.assertEquals("1", attectedRowNumber);
    }

    @Test
    public void selectOperLogById() {
        OperLog operLog = operLogService.selectOperLogById(1);
        Assert.assertNotNull(operLog);
        System.out.println(Render.renderSuccess(operLog.toString()));
    }
}