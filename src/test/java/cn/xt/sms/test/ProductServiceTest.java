package cn.xt.sms.test;

import cn.xt.sms.Condition.ProductCondition;
import cn.xt.sms.Result.MyResult;
import cn.xt.sms.dao.IProductGroupDao;
import cn.xt.sms.entity.Product;
import cn.xt.sms.entity.ProductGroup;
import cn.xt.sms.service.IEnterpriseService;
import cn.xt.sms.service.IProductGroupService;
import cn.xt.sms.service.IProductService;
import cn.xt.sms.service.middle.IProductMiddleService;
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
import java.util.List;

/**
 * @author xietao.x@qq.com
 * @date 2018/4/19
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
@Transactional
@TransactionConfiguration(defaultRollback = false)
public class ProductServiceTest {

    @Autowired
    private IProductService productService;
    @Autowired
    private IProductMiddleService productMiddleService;
    @Autowired
    private IProductGroupService productGroupService;

    @Test
    public void testGetProductList() {
        ProductCondition condition = new ProductCondition();
//        condition.setBrandIds("24,25");
        MyResult<Product> productResult = productService.getProductList(condition, 1, 10);
        if (productResult != null) {
            List<Product> productList = productResult.getRows();
            if (productList != null) {
                for (Product product:productList) {
                    System.out.println(product);
                }
            } else {
                System.out.println("productList is null");
            }
        } else {
            System.out.println("productResult is null");
        }
    }

    @Test
    public void testInsertProduct() {
        Product product = new Product();
        product.setName("testName");
        product.setSize("testSize");
        product.setUnit("台");
        product.setTechnicalParam("testTechnicalParam");
        product.setUnitprice(0.0F);
        product.setGroupId(new ProductGroup(19, null, null, null));
        System.out.println(productService.insertProduct(product));
    }

    @Test
    public void testDeleteProduct() {
        Integer id = 10;
        System.out.println(productService.deleteProduct(id));
    }

    @Test
    public void testUpdateProduct() {
        Product product = new Product();
        product.setId(11);
        product.setName("testUpdateName");
        product.setTechnicalParam("testUpdateTechnicalParam");
        product.setGroupId(new ProductGroup(18, null, null, null));
        System.out.println(productService.updateProduct(product));
    }

    @Test
    public void testGetProductGroupList() {
        List<ProductGroup> productGroupList = productGroupService.getProductGroupList(0);
        if (productGroupList != null) {
            if (productGroupList.size() > 0) {
                for (ProductGroup productGroup:productGroupList) {
                    System.out.println(productGroup.toString(""));
                }
            } else {
                System.out.println("The length of the productGroupList is not greater than 0");
            }
        } else {
            System.out.println("The productGroupList is null");
        }
    }

    @Test
    public void testInsertProductGroup() {
        ProductGroup productGroup = new ProductGroup(null,"test",0,null);
        System.out.println(productGroupService.setIdAndInsertProductGroup(productGroup));
    }

    @Test
    public void testUpdateProductGroup() {
        ProductGroup productGroup = new ProductGroup(21,"testUpdate",20,null);
        System.out.println(productGroupService.updateProductGroup(productGroup));
    }

    @Test
    public void testDeleteProductGroup() {
        System.out.println(productGroupService.deleteProductGroup(21));
    }

    @Test
    public void testReadExcel() throws IOException, InvalidFormatException {
        File f = new File("C:\\Users\\Administrator\\Desktop\\项目资源\\材料信息模板.xlsx");
        Workbook wb = WorkbookFactory.create(f);
        Sheet sheet = wb.getSheetAt(0);
        productMiddleService.getProductFormExcel(sheet);
    }

}
