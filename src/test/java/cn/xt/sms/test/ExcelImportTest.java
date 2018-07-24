package cn.xt.sms.test;

import cn.xt.sms.entity.Supplier;
import cn.xt.sms.entity.Supplier;
import cn.xt.sms.entity.Supplier;
import cn.xt.sms.service.IEnterpriseService;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.util.List;

/**
 * @author xietao.x@qq.com
 * @date 2018/3/25
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
@Transactional
@TransactionConfiguration(defaultRollback = false)
public class ExcelImportTest {

    @Autowired
    private IEnterpriseService enterpriseService;

    @Test
    public void excelImport() throws IOException, InvalidFormatException {
        List<Supplier> supplierList = ExcelImport.excelImport();
        for (Supplier supplier : supplierList) {
            /*enterpriseService.insertEnterprise(supplier);*/
        }
    }
}
