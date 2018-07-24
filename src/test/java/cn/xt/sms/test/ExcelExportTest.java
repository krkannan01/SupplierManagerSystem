package cn.xt.sms.test;

import cn.xt.sms.entity.Supplier;
import cn.xt.sms.result.MyResult;
import cn.xt.sms.entity.Cooperation;
import cn.xt.sms.entity.Product;
import cn.xt.sms.service.IEnterpriseService;
import cn.xt.sms.service.IProductService;
import cn.xt.sms.util.POIUtil;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import java.io.*;
import java.util.List;

/**
 * @author xietao.x@qq.com
 * @date 2018/3/25
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
@Transactional
@TransactionConfiguration(defaultRollback = false)
public class ExcelExportTest {

    @Autowired
    private IEnterpriseService enterpriseService;
    @Autowired
    private IProductService productService;

    @Test
    public void excelExportEnterprise() throws IOException, InvalidFormatException {
        Workbook wb = new XSSFWorkbook();
        Sheet sheet = wb.createSheet("供应商信息");



        int rowPointer = 0;
        Row row = sheet.createRow(rowPointer++);

        row.setHeightInPoints(25.5f); //设置行高

        String[] columns = {"NO", "统一社会信用代码", "企业名称", "企业类型", "法定代表人", "公司网站", "企业简称", "成立日期", "注册资本",
                    "登记机关", "核准日期", "登记状态", "主营产品", "营业期限自", "营业期限至", "信用级别", "所属分组", "住所",
                    "经营范围", "经营异常信息", "严重违法失信信息", "备注", "主要联系人名称", "次要联系人名称", "主要联系方式", "次要联系方式", "备注",
                    "自定义属性1", "自定义属性2", "自定义属性3", "自定义属性4", "自定义属性5", "项目名称", "产品名称", "主要联系人姓名", "次要联系人姓名",
                    "主要联系方式", "次要联系方式", "备注"};

        int[] tags = {0, 1, 1, 1, 1, 2, 2, 1, 2, 1, 1, 1, 1, 2, 2, 2, 1, 1, 1, 2, 2, 2, 3, 4, 4, 4, 4, 6, 6, 6, 6, 6, 8, 8, 8, 8, 8, 8, 8};

        POIUtil util = new POIUtil(wb);
        for (int i=0; i< columns.length; i++) {
            row.createCell(i).setCellValue(columns[i]);
            row.getCell(i).setCellStyle(util.styles[tags[i]]);
        }

        List<Supplier> supplierList = enterpriseService.getEnterpriseList(1, 100, null);

        if (supplierList != null && supplierList.size() > 0) {

            for (Supplier supplier : supplierList) {
                row = sheet.createRow(rowPointer++);
                row.setHeightInPoints(18.5f); //设置行高
                int cellPointer = 0;

                row.createCell(cellPointer++).setCellValue(supplier.getNo());
                row.createCell(cellPointer++).setCellValue(supplier.getUCCcode());
                row.createCell(cellPointer++).setCellValue(supplier.getFullName());
                row.createCell(cellPointer++).setCellValue(supplier.getType());
                row.createCell(cellPointer++).setCellValue(supplier.getLegalRepresentative());
                row.createCell(cellPointer++).setCellValue(supplier.getWebsite());
                row.createCell(cellPointer++).setCellValue(supplier.getSimpleName());
                row.createCell(cellPointer++).setCellValue(POIUtil.FORMAT2.format(supplier.getFoundDate()));
                row.createCell(cellPointer++).setCellValue(supplier.getRegisteredCapital());
                row.createCell(cellPointer++).setCellValue(supplier.getRegisterDepartment());
                row.createCell(cellPointer++).setCellValue(POIUtil.FORMAT2.format(supplier.getApprovalDate()));
                row.createCell(cellPointer++).setCellValue(supplier.getRegisterState());
                row.createCell(cellPointer++).setCellValue(supplier.getMainProduct());
                row.createCell(cellPointer++).setCellValue(supplier.getBusinessDeadlineGo());
                row.createCell(cellPointer++).setCellValue(supplier.getBusinessDeadlineTo());
                row.createCell(cellPointer++).setCellValue(supplier.getLevel());
                row.createCell(cellPointer++).setCellValue(supplier.getTradeGroupId().getName());
                row.createCell(cellPointer++).setCellValue(supplier.getAddress());
                row.createCell(cellPointer++).setCellValue(supplier.getOperateRange());
                row.createCell(cellPointer++).setCellValue(supplier.getExceptionInfo());
                row.createCell(cellPointer++).setCellValue(supplier.getDangerInfo());
                row.createCell(cellPointer++).setCellValue(supplier.getComment());

                if (supplier.getContactId() != null) {
                    row.createCell(cellPointer++).setCellValue(supplier.getContactId().getNameMaster());
                    row.createCell(cellPointer++).setCellValue(supplier.getContactId().getNameSlave());
                    row.createCell(cellPointer++).setCellValue(supplier.getContactId().getPhoneNumberMaster());
                    row.createCell(cellPointer++).setCellValue(supplier.getContactId().getPhoneNumberSlave());
                    row.createCell(cellPointer++).setCellValue(supplier.getContactId().getComment());
                }

                row.createCell(cellPointer++).setCellValue(supplier.getUserDefinedFieldOne());
                row.createCell(cellPointer++).setCellValue(supplier.getUserDefinedFieldTwo());
                row.createCell(cellPointer++).setCellValue(supplier.getUserDefinedFieldThree());
                row.createCell(cellPointer++).setCellValue(supplier.getUserDefinedFieldFour());
                row.createCell(cellPointer++).setCellValue(supplier.getUserDefinedFieldFive());

                List<Cooperation> cooperationList = supplier.getCooperationList();
                if (cooperationList != null && cooperationList.size() > 0) {
                    for (Cooperation cooperation : cooperationList) {
                        row.createCell(cellPointer++).setCellValue(cooperation.getProjectName());
                        row.createCell(cellPointer++).setCellValue(cooperation.getProductName());
                        if (cooperation.getContactId() != null) {
                            row.createCell(cellPointer++).setCellValue(cooperation.getContactId().getNameMaster());
                            row.createCell(cellPointer++).setCellValue(cooperation.getContactId().getNameSlave());
                            row.createCell(cellPointer++).setCellValue(cooperation.getContactId().getPhoneNumberMaster());
                            row.createCell(cellPointer++).setCellValue(cooperation.getContactId().getPhoneNumberSlave());
                            row.createCell(cellPointer++).setCellValue(cooperation.getContactId().getComment());
                        } else {
                            cellPointer += 5;
                        }
                    }
                }

            }

        }

        OutputStream os = new FileOutputStream("D:\\供应商信息.xlsx");
        wb.write(os);
        wb.close();
        os.close();

    }

    @Test
    public void excelExportProduct() throws IOException, InvalidFormatException {
        Workbook wb = new XSSFWorkbook();
        Sheet sheet = wb.createSheet("材料信息");

        int rowPointer = 0;
        Row row = sheet.createRow(rowPointer++);

        row.setHeightInPoints(25.5f); //设置行高

        String[] columns = {"NO", "产品名称", "产品规格", "产品品牌", "产品单位", "产品单价", "技术参数", "备注", "供应商", "产品分组"};

        int[] tags = {0, 1, 2, 2, 1, 1, 2, 2, 1, 1};

        POIUtil util = new POIUtil(wb);
        for (int i = 0; i < columns.length; i++) {
            row.createCell(i).setCellValue(columns[i]);
            row.getCell(i).setCellStyle(util.styles[tags[i]]);
        }

        MyResult<Product> productResult = productService.getProductList(null, 1, 100);

        if (productResult.getRows() != null && productResult.getRows().size() > 0) {
            for (Product product : productResult.getRows()) {
                row = sheet.createRow(rowPointer++);
                row.setHeightInPoints(18.5f); //设置行高
                int cellPointer = 0;

                row.createCell(cellPointer++).setCellValue(rowPointer-1);
                row.createCell(cellPointer++).setCellValue(product.getName());
                row.createCell(cellPointer++).setCellValue(product.getSize());
                if (product.getBrandId() != null)
                    row.createCell(cellPointer++).setCellValue(product.getBrandId().getName());
                row.createCell(cellPointer++).setCellValue(product.getUnit());
                row.createCell(cellPointer++).setCellValue(product.getUnitprice());
                row.createCell(cellPointer++).setCellValue(product.getTechnicalParam());
                row.createCell(cellPointer++).setCellValue(product.getComment());
                row.createCell(cellPointer++).setCellValue(product.getSupplierId().getFullName());
                row.createCell(cellPointer++).setCellValue(product.getGroupId().getName());
            }
        }

        OutputStream os = new FileOutputStream("D:\\材料信息.xlsx");
        wb.write(os);
        wb.close();
        os.close();

    }

}
