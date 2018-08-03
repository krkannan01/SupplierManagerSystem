package cn.xt.sms.test;

import cn.xt.sms.condition.SupplierCondition;
import cn.xt.sms.entity.Supplier;
import cn.xt.sms.dto.MapDTO;
import cn.xt.sms.response.DataResponse;
import cn.xt.sms.entity.Contact;
import cn.xt.sms.entity.Cooperation;
import cn.xt.sms.entity.TradeGroup;
import cn.xt.sms.service.ISupplierService;
import cn.xt.sms.service.ITradeGroupService;
import cn.xt.sms.service.middle.ISupplierMiddleService;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.annotation.Rollback;
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
@Transactional(transactionManager = "transactionManager")
@Rollback(false)
public class ISupplierServiceTest {

    @Autowired
    private ISupplierService supplierService;
    @Autowired
    private ITradeGroupService tradeGroupService;
    @Autowired
    private ISupplierMiddleService supplierMiddleService;

    private ApplicationContext applicationContext;

//    @Autowired
//    private IContactDao contactDao;
//
//    @Autowired
//    private ICooperationDao cooperationDao;

    public void setApplicationContext(ApplicationContext ac) {
        this.applicationContext = ac;
    }

    @Test
    public void testGetSupplierList() throws Exception {
//        SupplierCondition supplierCondition = new SupplierCondition();
//        List<Integer> groups = new ArrayList<Integer>();
//        groups.add(1);
//        supplierCondition.setGroups(groups);
//        DataResponse supplierResult = supplierService.getSupplierList(supplierCondition, 1, 10);
        SupplierCondition condition = new SupplierCondition();
        condition.setSort("level");
        condition.setSorted("desc");
        List<Supplier> supplierList = supplierService.getSupplierList(condition, 1, 10).getRows();
        System.out.println("123");
    }

    @Test
    public void testInsertSupplier() throws Exception {

        /*添加企业
        * 第一步：先添加联系人信息
        * */
        Contact contact = new Contact();
        contact.setNameMaster("测试联系人名称11");
        contact.setPhoneNumberMaster("测试联系人联系方式11");

        /*第二步：添加企业信息*/

        Supplier supplier = new Supplier();
        supplier.setFullName("测试全称1");
        supplier.setSimpleName("测试简称1");
        supplier.setAddress("测试地址1");
        supplier.setContactId(contact);
        supplier.setApprovalDate(new Date());
        supplier.setFoundDate(new Date());
        supplier.setEnterDate(new Date());
        supplier.setLegalRepresentative("测试法定代表人1");
        supplier.setTradeGroupId(new TradeGroup(1, null, null));
        supplier.setUCCcode("测试税号1");
        supplier.setType("测试类型1");
        supplier.setRegisteredCapital("测试注册资产1");
        supplier.setWebsite("测试网址1");
        supplier.setOperateRange("测试经营范围1");
        supplier.setBusinessDeadlineGo("测试");
        supplier.setApprovalDate(new Date());
        supplier.setMainProduct("测试主营产品1");
        supplier.setRegisterDepartment("测试注册部门1");
        supplier.setRegisterState("测试注册状态1");

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

        supplier.setCooperationList(cooperationList);

        /*supplierService.insertSupplier(, supplier);*/
    }

    @Test
    public void testDeleteSupplier() throws Exception {
        /*删除企业信息*/
        Integer supplierId = 23;
        /*第一步：先删除项目合作联系人信息*/
//        contactDao.deleteCooperationContactBySupplierId(supplierId);
//        /*第二步：删除项目合作信息*/
//        cooperationDao.deleteCooperationBySupplierId(supplierId);
//        /*第三步：删除企业联系人信息*/
//        contactDao.deleteContactBySupplierId(supplierId);
        /*第四部：删除企业信息*/
        supplierService.deleteSupplier(supplierId);
    }

    @Test
    public void testUpdateSupplier() throws Exception {
        /*传入企业信息id，合作项目id*/
        List<Cooperation> cooperationList = new ArrayList<Cooperation>();
//        cooperationList.add(new Cooperation(8,"修改测试1",null,new Contact(41,"修改测试1", null, null, null),null));
//        cooperationList.add(new Cooperation(9,"修改测试2",null,new Contact(41,"修改测试1", null, null, null),null));

//        Contact contact = new Contact(null, "修改测试1", null, null, null);
//
        Supplier supplier = new Supplier();
        supplier.setId(16);
        supplier.setFullName("修改测试1");
        supplier.setCooperationList(cooperationList);
//        supplier.setContactId(contact);

        /*第一步：修改企业信息*/
        supplierService.updateSupplier(supplier);
        /*第二步：修改联系人信息*/
//        contactDao.updateContact(supplier.getContactId());
//        /*修改多条合作信息*/
//        /*第三步：修改合作项目信息*/
//        for (Cooperation cooperation : supplier.getCooperationList()) {
//            cooperationDao.updateCooperation(cooperation);
//            contactDao.updateContact(cooperation.getContactId());
//        }
        /*第四步：修改项目联系人信息*/

    }

    @Test
    public void testIsUnique() throws Exception {
        String fullName = "测试全称1";
        System.out.println(supplierService.getIdByFullName(fullName) != null);
    }

    @Test
    public void testGetTradeGroup() throws Exception {
        /*DataResponse<TradeGroup> result = tradeGroupService.getTradeGroup();*/ // DISCARD
        System.out.println("123");
    }


    @Test
    public void testGetSupplierIdAndName() {
        List<MapDTO> map = supplierService.getSupplierIdAndName();
        System.out.println(map);
    }

    @Test
    public void testReadExcel() throws IOException, InvalidFormatException {
        File f = new File("C:\\Users\\Administrator\\Desktop\\项目资源\\模板.xlsx");
        Workbook wb = WorkbookFactory.create(f);
        Sheet sheet = wb.getSheetAt(0);
        /*supplierMiddleService.getSupplierFormExcel(sheet);*/
        System.out.println("\n\n" + supplierMiddleService);
        System.out.println(supplierMiddleService.getClass());
        System.out.println(supplierMiddleService.getClass().getName());



    }


}