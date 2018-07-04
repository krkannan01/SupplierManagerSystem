package cn.xt.sms.test;

import cn.xt.sms.entity.*;
import cn.xt.sms.exception.NullCellValueException;
import cn.xt.sms.util.POIUtil;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.*;
import org.springframework.expression.spel.ast.Projection;

import static org.fusesource.jansi.Ansi.*;
import static org.fusesource.jansi.Ansi.Color.*;

import javax.validation.constraints.Null;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author xietao.x@qq.com
 * @date 2018/3/25
 */
public class ExcelImport {
    /*公用日期转换器*/
    private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd");

    public static void main(String[] args) throws IOException, InvalidFormatException {
        excelImport();
    }

    public static List<Enterprise> excelImport() throws IOException, org.apache.poi.openxml4j.exceptions.InvalidFormatException {
        /*读取信用信息表*/
        File f = new File("C:\\Users\\Administrator\\Desktop\\项目资源\\模板.xlsx");
        Workbook wb = WorkbookFactory.create(f);
        /*读取供应商信息表*/
//        File f2 = new File("C:/Users/Administrator/Desktop/供应商汇总表--孙纯.xlsx");
//        Workbook wb2 = WorkbookFactory.create(f2);
        /*数据集合*/
//        List<Enterprise> enterpriseList = new ArrayList<Enterprise>();
        /*开始循环读取 以信用信息表为主*/
        Sheet sheet = wb.getSheetAt(0);
//        Sheet sheet2 = wb2.getSheetAt(0);
        int index = 0;
        List<Enterprise> enterpriseList = null;
        for (Row row: sheet) {
            if (row.getRowNum() == 0) continue;
            index++;
            int pointer = 1;
            System.out.println("\n" + ansi().eraseScreen().render("@|blue --------\t正在读取第"+ index +"条记录\t--------|@"));
            Enterprise enterprise = null;
            try {
                // 统一社会信用代码 (String)
                String uCCcode = POIUtil.getStringValue(row.getCell(pointer++), "统一社会信用代码");
                // 企业名称 (String)
                String fullName = POIUtil.getStringValue(row.getCell(pointer++), "企业名称");
                // 企业类型 (String)
                String type = POIUtil.getStringValue(row.getCell(pointer++), "企业类型");
                // 法定代表人 (String)
                String legalRepresentative = POIUtil.getStringValue(row.getCell(pointer++), "法定代表人");
                // 公司网站 (String)
                String website = POIUtil.getStringValue(row.getCell(pointer++));
                // 企业简称 (String)
                String simpleName = POIUtil.getStringValue(row.getCell(pointer++));
                // 成立日期 ()
                Date foundDate = POIUtil.getDateValue(row.getCell(pointer++), "成立日期");
                // 注册资本 (String)
                String registeredCapital = POIUtil.getStringValue(row.getCell(pointer++));
                // 登记机关
                String registerDepartment = POIUtil.getStringValue(row.getCell(pointer++), "登记机关");
                // 核准日期
                Date approvalDate = POIUtil.getDateValue(row.getCell(pointer++), "核准日期");
                // 登记状态
                String registerState = POIUtil.getStringValue(row.getCell(pointer++), "登记状态");
                // 主营产品
                String mainProduct = POIUtil.getStringValue(row.getCell(pointer++), "主营产品");
                // 营业期限自
                Date businessDeadlineGo = POIUtil.getDateValue(row.getCell(pointer++), "营业期限自");
                // 营业期限至
                Date businessDeadlineTo = POIUtil.getDateValue(row.getCell(pointer++), "营业期限至");
                // 信用级别
                Float level = POIUtil.getFloatValue(row.getCell(pointer++), "信用级别");
                // 所属分组
                String tradeGroup = POIUtil.getStringValue(row.getCell(pointer++), "所属分组");
                // 住所
                String address = POIUtil.getStringValue(row.getCell(pointer++), "住所");
                // 经营范围
                String operateRange = POIUtil.getStringValue(row.getCell(pointer++), "经营范围");
                // 经营异常信息
                String exceptionInfo = POIUtil.getStringValue(row.getCell(pointer++));
                // 严重违法失信信息
                String dangerInfo = POIUtil.getStringValue(row.getCell(pointer++));
                // 备注
                String comment = POIUtil.getStringValue(row.getCell(pointer++));

                enterprise = new Enterprise();

                enterprise.setUCCcode(uCCcode);
                enterprise.setFullName(fullName);
                enterprise.setType(type);
                enterprise.setLegalRepresentative(legalRepresentative);
                enterprise.setWebsite(website);
                enterprise.setSimpleName(simpleName);
                enterprise.setFoundDate(foundDate);
                enterprise.setRegisteredCapital(registeredCapital);
                enterprise.setApprovalDate(approvalDate);
                enterprise.setRegisterDepartment(registerDepartment);
                enterprise.setRegisterState(registerState);
                enterprise.setMainProduct(mainProduct);
                enterprise.setBusinessDeadlineGo(sdf.format(businessDeadlineGo));
                enterprise.setBusinessDeadlineTo(sdf.format(businessDeadlineTo));
                enterprise.setLevel(level);
                enterprise.setTradeGroupId(new TradeGroup(null, tradeGroup, null));
                enterprise.setAddress(address);
                enterprise.setOperateRange(operateRange);
                enterprise.setExceptionInfo(exceptionInfo);
                enterprise.setDangerInfo(dangerInfo);
                enterprise.setComment(comment);

                System.out.println(ansi().eraseScreen().render("@|green --------\t信息读取成功\t--------|@"));

            } catch (NullCellValueException ncve) {
                System.out.println(ansi().eraseScreen().render("@|red --------\t信息读取失败:\t" + ncve.getMessage() + "\t--------|@"));
                continue;
            }

            Contact contact = null;
            int tempPointer = 0;
            try {
                tempPointer = pointer;
                // 主要联系人名称
                String nameMaster = POIUtil.getStringValue(row.getCell(pointer++), "主要联系人名称");
                // 次要联系人名称
                String nameSlave = POIUtil.getStringValue(row.getCell(pointer++));
                // 主要联系方式
                String phoneNumberMaster = POIUtil.getStringValue(row.getCell(pointer++));
                // 次要联系方式
                String phoneNumberSlave = POIUtil.getStringValue(row.getCell(pointer++));
                // 备注
                String comment = POIUtil.getStringValue(row.getCell(pointer++));

                contact = new Contact();
                contact.setNameMaster(nameMaster);
                contact.setNameSlave(nameSlave);
                contact.setPhoneNumberMaster(phoneNumberMaster);
                contact.setPhoneNumberSlave(phoneNumberSlave);
                contact.setComment(comment);

                enterprise.setContactId(contact);

            } catch (NullCellValueException ncve) {
                pointer = tempPointer + 5;
                System.out.println(ansi().eraseScreen().render("@|yellow \t--------\t联系人信息为空\t--------|@"));
            }

            // 自定义属性1
            String userDefinedFieldOne = POIUtil.getStringValue(row.getCell(pointer++));
            // 自定义属性2
            String userDefinedFieldTwo = POIUtil.getStringValue(row.getCell(pointer++));
            // 自定义属性3
            String userDefinedFieldThree = POIUtil.getStringValue(row.getCell(pointer++));
            // 自定义属性4
            String userDefinedFieldFour = POIUtil.getStringValue(row.getCell(pointer++));
            // 自定义属性5
            Date userDefinedFieldFive = POIUtil.getDateValue(row.getCell(pointer++));

            enterprise.setUserDefinedFieldOne(userDefinedFieldOne);
            enterprise.setUserDefinedFieldTwo(userDefinedFieldTwo);
            enterprise.setUserDefinedFieldThree(userDefinedFieldThree);
            enterprise.setUserDefinedFieldFour(userDefinedFieldFour);
            enterprise.setUserDefinedFieldFive(userDefinedFieldFive);

            List<Cooperation> cooperationList = new ArrayList<Cooperation>();
            for (int i=0; i<2; i++) {
                Cooperation cooperation = null;
                try {
                    tempPointer = pointer;
                    // 项目名称
                    String projectName = POIUtil.getStringValue(row.getCell(pointer++), "项目名称");
                    // 产品名称
                    String productName = POIUtil.getStringValue(row.getCell(pointer++), "项目名称");

                    cooperation = new Cooperation();
                    cooperation.setProjectName(projectName);
                    cooperation.setProductName(productName);

                } catch (NullCellValueException ncve) {
                    pointer = tempPointer + 2;
                    System.out.println(ansi().eraseScreen().render("@|yellow \t--------\t合作情况信息为空|@\t--------"));
                    break;
                }

                try {
                    tempPointer = pointer;
                    // 主要联系人名称
                    String nameMaster = POIUtil.getStringValue(row.getCell(pointer++), "主要联系人名称");
                    // 次要联系人名称
                    String nameSlave = POIUtil.getStringValue(row.getCell(pointer++));
                    // 主要联系方式
                    String phoneNumberMaster = POIUtil.getStringValue(row.getCell(pointer++));
                    // 次要联系方式
                    String phoneNumberSlave = POIUtil.getStringValue(row.getCell(pointer++));
                    // 备注
                    String comment = POIUtil.getStringValue(row.getCell(pointer++));

                    Contact contactTemp = new Contact();
                    contactTemp.setNameMaster(nameMaster);
                    contactTemp.setNameSlave(nameSlave);
                    contactTemp.setPhoneNumberMaster(phoneNumberMaster);
                    contactTemp.setPhoneNumberSlave(phoneNumberSlave);
                    contactTemp.setComment(comment);

                    cooperation.setContactId(contactTemp);

                } catch (NullCellValueException ncve) {
                    pointer = tempPointer + 5;
                    System.out.println(ansi().eraseScreen().render("@|yellow \t\t--------\t联系人信息为空|@\t--------"));
                }

                cooperationList.add(cooperation);

            }

            if (cooperationList.size() > 0) enterprise.setCooperationList(cooperationList);

            enterpriseList.add(enterprise);

        }

//        readGYSHZ(sheet2, enterpriseList);
//        readXYXX(sheet, sheet2, enterpriseList);
        System.out.println("debug");
        return null;
    }

    public static void readGYSHZ(Sheet sheet, List<Enterprise> enterpriseList) {
        /*NO 产品范围 序号 企业名称 企业简称 公司网站 联系人 联系方式1 联系方式2
            主营产品 合作情况 合作项目 产品名称 姓名 联系电话 地址*/
        Integer no = 0;
        for (Row row: sheet) {
            System.out.println("\tRow " + row.getRowNum());
            if (row.getRowNum() == 0 || row.getRowNum() == 1) continue;
            if (row.getRowNum() == 10) break;
            Enterprise enterprise = new Enterprise();
            try {
                int temp = (int)row.getCell(0).getNumericCellValue();
                if (temp > 0) {
                    no = temp;
                }
                System.out.println("\t\tNO " + no);
                System.out.println("\t\t企业名称 " + row.getCell(3).getStringCellValue());
                System.out.println("\t\t企业简称 " + row.getCell(4).getStringCellValue());
                System.out.println("\t\t公司网站 " + row.getCell(5).getStringCellValue());
                System.out.println("\t\t联系人 " + row.getCell(6).getStringCellValue());
                row.getCell(7).setCellType(CellType.STRING);
                System.out.println("\t\t联系方式1 " + row.getCell(7).getStringCellValue());
                row.getCell(8).setCellType(CellType.STRING);
                System.out.println("\t\t联系方式2 " + row.getCell(8).getStringCellValue());
                System.out.println("\t\t主营产品 " + row.getCell(9).getStringCellValue());
                System.out.println("\t\t合作情况 " + row.getCell(10).getStringCellValue());
                System.out.println("\t\t合作项目 " + row.getCell(11).getStringCellValue());
                System.out.println("\t\t产品名称 " + row.getCell(12).getStringCellValue());
                System.out.println("\t\t姓名 " + row.getCell(13).getStringCellValue());
                System.out.println("\t\t联系电话 " + row.getCell(14).getStringCellValue());
                System.out.println("\t\t地址 " + row.getCell(15).getStringCellValue());
            } catch (NullPointerException npe) { continue; }
        }
    }

    public static void readXYXX(Sheet sheet, Sheet sheet2, List<Enterprise> enterpriseList) {
        int rowIndex = 30,rowIndex2 = 31,no = 3;
        while(true) {
            Row row = sheet.getRow(rowIndex);

            Enterprise enterprise = new Enterprise();
            /*企业名称 全名 统一社会信用代码 法定代表人
            成立日期 类型 注册资本 营业期限自 营业期限至*/
            try {
                String fullName = null;
                try {
                    fullName = row.getCell(1).getStringCellValue();
                } catch (NullPointerException npe) {}
                if (fullName == null || fullName == "") {
                    try {
                        fullName = row.getCell(0).getStringCellValue();
                    } catch (NullPointerException npe) {break;}
                }
                if (fullName == null && fullName == "") break;

                enterprise.setFullName(fullName);
                enterprise.setUCCcode(row.getCell(2).getStringCellValue());
                enterprise.setLegalRepresentative(row.getCell(3).getStringCellValue());
                enterprise.setFoundDate(row.getCell(4).getDateCellValue());
                enterprise.setType(row.getCell(5).getStringCellValue());
                enterprise.setRegisteredCapital(row.getCell(6).getStringCellValue());
                try {
                    enterprise.setBusinessDeadlineGo(sdf.format(row.getCell(7).getDateCellValue()));
                } catch (NullPointerException npe) {}
                try {
                    enterprise.setBusinessDeadlineTo(sdf.format(row.getCell(8).getDateCellValue()));
                } catch (NullPointerException npe) {}
                /*登记机关 核准日期 登记状态 住所
                经营范围 异常信息 违法信息*/
                enterprise.setRegisterDepartment(row.getCell(9).getStringCellValue());
                enterprise.setApprovalDate(row.getCell(10).getDateCellValue());
                enterprise.setRegisterState(row.getCell(11).getStringCellValue());
                enterprise.setAddress(row.getCell(12).getStringCellValue());
                enterprise.setOperateRange(row.getCell(13).getStringCellValue());
                try {
                    enterprise.setExceptionInfo(row.getCell(14).getStringCellValue());
                } catch (NullPointerException npe) {
                }
                try {
                    enterprise.setDangerInfo(row.getCell(15).getStringCellValue());
                } catch (NullPointerException npe) {
                }


                Row row2 = null;
                rowIndex2--;
                String fullName2 = null;
                do{
                    rowIndex2++;
                    row2 = sheet2.getRow(rowIndex2);
                    row2.getCell(0).setCellType(CellType.NUMERIC);
                    int temp = (int)row2.getCell(0).getNumericCellValue();
                    if (temp > 0) {
                        no = temp;
                    }
                    fullName2 = row2.getCell(3).getStringCellValue();
                    if (fullName2 == null || fullName2 == "") break;
                } while (!fullName2.equals(row.getCell(0).getStringCellValue()));

                TradeGroup tg = new TradeGroup();
                tg.setId(no);
                enterprise.setTradeGroupId(tg);

                enterprise.setSimpleName(row2.getCell(4).getStringCellValue());
                try {
                    enterprise.setWebsite(row2.getCell(5).getStringCellValue());
                } catch (NullPointerException npe) {}
                Contact contact = new Contact();
//                try {
//                    contact.setName(row2.getCell(6).getStringCellValue());
//                } catch (NullPointerException npe) {}
//                row2.getCell(7).setCellType(CellType.STRING);
//                try {
//                    contact.setPhoneNumberOne(row2.getCell(7).getStringCellValue());
//                } catch (NullPointerException npe) {}
//                row2.getCell(8).setCellType(CellType.STRING);
//                try {
//                    contact.setPhoneNumberTwo(row2.getCell(8).getStringCellValue());
//                } catch (NullPointerException npe) {}
//                enterprise.setContactId(contact);
//
//                enterprise.setMainProduct(row2.getCell(9).getStringCellValue());
//                Cooperation cooperation = new Cooperation();
//
//                try {
//                    cooperation.setProjectName(row2.getCell(11).getStringCellValue());
//                } catch (NullPointerException npe) {}
//                try {
//                    cooperation.setProductName(row2.getCell(12).getStringCellValue());
//                } catch (NullPointerException npe) {}
//                Contact contact1 = new Contact();
//                try {
//                    contact1.setName(row2.getCell(13).getStringCellValue());
//                } catch (NullPointerException npe) {}
//                try {
//                    row2.getCell(14).setCellType(CellType.STRING);
//                    contact1.setPhoneNumberOne(row2.getCell(14).getStringCellValue());
//                } catch (NullPointerException npe) {}
//                try {
//                    row2.getCell(15).setCellType(CellType.STRING);
//                    contact1.setAddress(row2.getCell(15).getStringCellValue());
//                } catch (NullPointerException npe) {}
            } catch (NullPointerException npe) {
                rowIndex++;
                continue;
            }
            rowIndex++;
            rowIndex2++;
            enterpriseList.add(enterprise);
            System.out.println(enterprise.getFullName());
        }
    }

}
