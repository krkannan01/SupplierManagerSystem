package cn.xt.sms.service.middle.impl;

import cn.xt.sms.Condition.EnterpriseCondition;
import cn.xt.sms.entity.Contact;
import cn.xt.sms.entity.Cooperation;
import cn.xt.sms.entity.Enterprise;
import cn.xt.sms.entity.TradeGroup;
import cn.xt.sms.exception.NullCellValueException;
import cn.xt.sms.service.IEnterpriseService;
import cn.xt.sms.service.ITradeGroupService;
import cn.xt.sms.service.impl.EnterpriseServiceImpl;
import cn.xt.sms.service.middle.IEnterpriseMiddleService;
import cn.xt.sms.util.POIUtil;
import org.apache.log4j.Logger;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static org.fusesource.jansi.Ansi.ansi;

/**
 * @author xietao.x@qq.com
 * @date 2018/5/6
 */
@Service
public class EnterpriseMiddleServiceImpl implements IEnterpriseMiddleService {

    private Logger logger = Logger.getLogger(EnterpriseMiddleServiceImpl.class);

    @Autowired
    private IEnterpriseService enterpriseService;
    @Autowired
    private ITradeGroupService tradeGroupService;

    @Override
    public String getEnterpriseFormExcel(Sheet sheet) {
        //设置根据内容自动调整列宽
        sheet.autoSizeColumn(256 * 30);
        int index = 0;
        List<Enterprise> enterpriseList = new ArrayList<Enterprise>();
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
                Date businessDeadlineGo = POIUtil.getDateValue(row.getCell(pointer++));
                // 营业期限至
                Date businessDeadlineTo = POIUtil.getDateValue(row.getCell(pointer++));
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
                enterprise.setBusinessDeadlineGo(businessDeadlineGo != null ? POIUtil.FORMAT2.format(businessDeadlineGo):"");
                enterprise.setBusinessDeadlineTo(businessDeadlineTo != null ? POIUtil.FORMAT2.format(businessDeadlineTo):"");
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

                Contact contact = new Contact();
                contact.setNameMaster(nameMaster);
                contact.setNameSlave(nameSlave);
                contact.setPhoneNumberMaster(phoneNumberMaster);
                contact.setPhoneNumberSlave(phoneNumberSlave);
                contact.setComment(comment);

                enterprise.setContactId(contact);

            } catch (NullCellValueException ncve) {
                pointer = tempPointer + 5;
                enterprise.setContactId(new Contact(null, "无", null, null, null, null));
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
        int success = 0;
        for (Enterprise enterprise : enterpriseList) {
            try {
                if (enterpriseService.getIdByFullName(enterprise.getFullName()) != null) {
                    System.out.print(ansi().eraseScreen().render("\n@|red \t供应商名已存在，跳过该项\t|@\n"));
                } else {
                    handleTradeGroup(enterprise);
                    enterpriseService.insertEnterprise(enterprise);
                    success++;
                }
            } catch (Exception e) {
                logger.error("插入企业信息出现异常!\t" + e.getMessage());
                continue;
            }
        }
        return "解析完成\n共"+index+"条记录\n成功"+success+"条记录\n名称冲突"+(enterpriseList.size()-success)+"条记录\n信息不全"+(index-enterpriseList.size())+"条记录";
    }

    @Override
    public void setEnterpriseToExcel(Workbook wb, Integer start, Integer end, EnterpriseCondition enterpriseCondition) {
        Sheet sheet = wb.createSheet("供应商信息");

        int rowPointer = 0;
        Row row = sheet.createRow(rowPointer++);

        row.setHeightInPoints(25.5f); //设置行高

        String[] columns = {"NO", "统一社会信用代码", "企业名称", "企业类型", "法定代表人", "公司网站", "企业简称", "成立日期", "注册资本",
                "登记机关", "核准日期", "登记状态", "主营产品", "营业期限自", "营业期限至", "信用级别", "所属分组", "住所",
                "经营范围", "经营异常信息", "严重违法失信信息", "备注", "主要联系人名称", "次要联系人名称", "主要联系方式", "次要联系方式", "备注",
                "自定义属性1", "自定义属性2", "自定义属性3", "自定义属性4", "自定义属性5", "项目名称", "产品名称", "主要联系人姓名", "次要联系人姓名",
                "主要联系方式", "次要联系方式", "备注"};

        int[] tags = {0, 1, 1, 1, 1, 2, 2, 1, 2, 1, 1, 1, 1, 2, 2, 1, 1, 1, 1, 2, 2, 2, 3, 4, 4, 4, 4, 6, 6, 6, 6, 6, 8, 8, 8, 8, 8, 8, 8};

        POIUtil util = new POIUtil(wb);
        for (int i=0; i< columns.length; i++) {
            row.createCell(i).setCellValue(columns[i]);
            row.getCell(i).setCellStyle(util.styles[tags[i]]);
        }

        int pageSize = 100;
        int offset = start-1;
        while (offset < end){
            if (offset + pageSize > end) {
                pageSize = end - offset;
            }

            List<Enterprise> enterpriseList = enterpriseService.getEnterpriseList(pageSize, offset, enterpriseCondition);
            offset += pageSize;

            if (enterpriseList != null && enterpriseList.size() > 0) {

                for (Enterprise enterprise : enterpriseList) {
                    row = sheet.createRow(rowPointer++);
                    row.setHeightInPoints(18.5f); //设置行高
                    int cellPointer = 0;

                    row.createCell(cellPointer++).setCellValue(enterprise.getIdentify());
                    row.createCell(cellPointer++).setCellValue(enterprise.getUCCcode());
                    row.createCell(cellPointer++).setCellValue(enterprise.getFullName());
                    row.createCell(cellPointer++).setCellValue(enterprise.getType());
                    row.createCell(cellPointer++).setCellValue(enterprise.getLegalRepresentative());
                    row.createCell(cellPointer++).setCellValue(enterprise.getWebsite());
                    row.createCell(cellPointer++).setCellValue(enterprise.getSimpleName());
                    row.createCell(cellPointer++).setCellValue(POIUtil.FORMAT2.format(enterprise.getFoundDate()));
                    row.createCell(cellPointer++).setCellValue(enterprise.getRegisteredCapital());
                    row.createCell(cellPointer++).setCellValue(enterprise.getRegisterDepartment());
                    row.createCell(cellPointer++).setCellValue(POIUtil.FORMAT2.format(enterprise.getApprovalDate()));
                    row.createCell(cellPointer++).setCellValue(enterprise.getRegisterState());
                    row.createCell(cellPointer++).setCellValue(enterprise.getMainProduct());
                    row.createCell(cellPointer++).setCellValue(enterprise.getBusinessDeadlineGo());
                    row.createCell(cellPointer++).setCellValue(enterprise.getBusinessDeadlineTo());
                    row.createCell(cellPointer++).setCellValue(enterprise.getLevel());
                    row.createCell(cellPointer++).setCellValue(enterprise.getTradeGroupId().getName());
                    row.createCell(cellPointer++).setCellValue(enterprise.getAddress());
                    row.createCell(cellPointer++).setCellValue(enterprise.getOperateRange());
                    row.createCell(cellPointer++).setCellValue(enterprise.getExceptionInfo());
                    row.createCell(cellPointer++).setCellValue(enterprise.getDangerInfo());
                    row.createCell(cellPointer++).setCellValue(enterprise.getComment());

                    if (enterprise.getContactId() != null) {
                        row.createCell(cellPointer++).setCellValue(enterprise.getContactId().getNameMaster());
                        row.createCell(cellPointer++).setCellValue(enterprise.getContactId().getNameSlave());
                        row.createCell(cellPointer++).setCellValue(enterprise.getContactId().getPhoneNumberMaster());
                        row.createCell(cellPointer++).setCellValue(enterprise.getContactId().getPhoneNumberSlave());
                        row.createCell(cellPointer++).setCellValue(enterprise.getContactId().getComment());
                    }

                    row.createCell(cellPointer++).setCellValue(enterprise.getUserDefinedFieldOne());
                    row.createCell(cellPointer++).setCellValue(enterprise.getUserDefinedFieldTwo());
                    row.createCell(cellPointer++).setCellValue(enterprise.getUserDefinedFieldThree());
                    row.createCell(cellPointer++).setCellValue(enterprise.getUserDefinedFieldFour());
                    row.createCell(cellPointer++).setCellValue(enterprise.getUserDefinedFieldFive());

                    List<Cooperation> cooperationList = enterprise.getCooperationList();
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
        }
    }

    @Override
    public String mutliDeleteEnterprise(String ids) {
        String[] temp = ids.split(",");
        Integer id = null;
        for (int i=0; i<temp.length; i++) {
            try {
                id = Integer.valueOf(temp[i]);
                enterpriseService.deleteEnterprise(id);
            } catch(Exception e) {
                logger.error("删除企业信息出现异常!\t" + e.getMessage());
                continue;
            }
        }
        return "success";
    }

    /*处理下企业信息中的TradeGroup,因为从Excel读取出来的是Name字符串,所以要将它转换为Id*/
    private void handleTradeGroup(Enterprise enterprise) {
        enterprise.getTradeGroupId().setId(tradeGroupService.selectIdByNameOrInsert(enterprise.getTradeGroupId().getName()));
    }

}
