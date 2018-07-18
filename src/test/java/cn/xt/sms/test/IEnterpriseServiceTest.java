package cn.xt.sms.test;

import cn.xt.sms.condition.EnterpriseCondition;
import cn.xt.sms.result.MapResult;
import cn.xt.sms.result.MyResult;
import cn.xt.sms.entity.Contact;
import cn.xt.sms.entity.Cooperation;
import cn.xt.sms.entity.Enterprise;
import cn.xt.sms.entity.TradeGroup;
import cn.xt.sms.service.IEnterpriseService;
import cn.xt.sms.service.ITradeGroupService;
import cn.xt.sms.service.middle.IEnterpriseMiddleService;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author xietao.x@qq.com
 * @date 2018/3/14
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
@Transactional
@TransactionConfiguration(defaultRollback = false)
public class IEnterpriseServiceTest {

    @Autowired
    private IEnterpriseService enterpriseService;
    @Autowired
    private ITradeGroupService tradeGroupService;
    @Autowired
    private IEnterpriseMiddleService enterpriseMiddleService;

//    @Autowired
//    private IContactDao contactDao;
//
//    @Autowired
//    private ICooperationDao cooperationDao;

    @Test
    public void testGetEnterpriseList() throws Exception {
//        EnterpriseCondition enterpriseCondition = new EnterpriseCondition();
//        List<Integer> groups = new ArrayList<Integer>();
//        groups.add(1);
//        enterpriseCondition.setGroups(groups);
//        MyResult enterpriseResult = enterpriseService.getEnterpriseList(enterpriseCondition, 1, 10);
        EnterpriseCondition condition = new EnterpriseCondition();
        condition.setSort("level");
        condition.setSorted("desc");
        MyResult enterpriseResult = enterpriseService.getEnterpriseList(condition, 1, 10);
        System.out.println("123");
    }

    @Test
    public void testInsertEnterprise() throws Exception {

        /*添加企业
        * 第一步：先添加联系人信息
        * */
        Contact contact = new Contact();
        contact.setNameMaster("测试联系人名称11");
        contact.setPhoneNumberMaster("测试联系人联系方式11");

        /*第二步：添加企业信息*/

        Enterprise enterprise = new Enterprise();
        enterprise.setFullName("测试全称1");
        enterprise.setSimpleName("测试简称1");
        enterprise.setAddress("测试地址1");
        enterprise.setContactId(contact);
        enterprise.setApprovalDate(new Date());
        enterprise.setFoundDate(new Date());
        enterprise.setEnterDate(new Date());
        enterprise.setLegalRepresentative("测试法定代表人1");
        enterprise.setTradeGroupId(new TradeGroup(1, null, null));
        enterprise.setUCCcode("测试税号1");
        enterprise.setType("测试类型1");
        enterprise.setRegisteredCapital("测试注册资产1");
        enterprise.setWebsite("测试网址1");
        enterprise.setOperateRange("测试经营范围1");
        enterprise.setBusinessDeadlineGo("测试");
        enterprise.setApprovalDate(new Date());
        enterprise.setMainProduct("测试主营产品1");
        enterprise.setRegisterDepartment("测试注册部门1");
        enterprise.setRegisterState("测试注册状态1");

        /*第三部：再添加项目联系人信息*/
        Contact contact2 = new Contact();
//        contact2.setName("测试联系人名称22");
//        contact2.setPhoneNumberOne("测试联系人联系方式22");

        /*第四部：添加合作项目信息*/
        Cooperation cooperation = new Cooperation();
        cooperation.setProductName("测试商品名111");
        cooperation.setProjectName("测试项目名111");
        cooperation.setContactId(contact2);
        List<Cooperation> cooperationList = new ArrayList<Cooperation>();

        enterprise.setCooperationList(cooperationList);

        enterpriseService.insertEnterprise(enterprise);
    }

    @Test
    public void testDeleteEnterprise() throws Exception {
        /*删除企业信息*/
        Integer enterpriseId = 23;
        /*第一步：先删除项目合作联系人信息*/
//        contactDao.deleteCooperationContactByEnterpriseId(enterpriseId);
//        /*第二步：删除项目合作信息*/
//        cooperationDao.deleteCooperationByEnterpriseId(enterpriseId);
//        /*第三步：删除企业联系人信息*/
//        contactDao.deleteContactByEnterpriseId(enterpriseId);
        /*第四部：删除企业信息*/
        enterpriseService.deleteEnterprise(enterpriseId);
    }

    @Test
    public void testUpdateEnterprise() throws Exception {
        /*传入企业信息id，合作项目id*/
        List<Cooperation> cooperationList = new ArrayList<Cooperation>();
//        cooperationList.add(new Cooperation(8,"修改测试1",null,new Contact(41,"修改测试1", null, null, null),null));
//        cooperationList.add(new Cooperation(9,"修改测试2",null,new Contact(41,"修改测试1", null, null, null),null));

//        Contact contact = new Contact(null, "修改测试1", null, null, null);
//
        Enterprise enterprise = new Enterprise();
        enterprise.setId(16);
        enterprise.setFullName("修改测试1");
        enterprise.setCooperationList(cooperationList);
//        enterprise.setContactId(contact);

        /*第一步：修改企业信息*/
        enterpriseService.updateEnterprise(enterprise);
        /*第二步：修改联系人信息*/
//        contactDao.updateContact(enterprise.getContactId());
//        /*修改多条合作信息*/
//        /*第三步：修改合作项目信息*/
//        for (Cooperation cooperation : enterprise.getCooperationList()) {
//            cooperationDao.updateCooperation(cooperation);
//            contactDao.updateContact(cooperation.getContactId());
//        }
        /*第四步：修改项目联系人信息*/

    }

    @Test
    public void testIsUnique() throws Exception {
        String fullName = "测试全称1";
        System.out.println(enterpriseService.getIdByFullName(fullName) != null);
    }

    @Test
    public void testGetTradeGroup() throws Exception {
        /*MyResult<TradeGroup> result = tradeGroupService.getTradeGroup();*/ // DISCARD
        System.out.println("123");
    }


    @Test
    public void testGetEnterpriseIdAndName() {
        List<MapResult> map = enterpriseService.getEnterpriseIdAndName();
        System.out.println(map);
    }

    @Test
    public void testReadExcel() throws IOException, InvalidFormatException {
        File f = new File("C:\\Users\\Administrator\\Desktop\\项目资源\\模板.xlsx");
        Workbook wb = WorkbookFactory.create(f);
        Sheet sheet = wb.getSheetAt(0);
        enterpriseMiddleService.getEnterpriseFormExcel(sheet);
        System.out.println("\n\n" + enterpriseMiddleService);
        System.out.println(enterpriseMiddleService.getClass());
        System.out.println(enterpriseMiddleService.getClass().getName());



    }


}