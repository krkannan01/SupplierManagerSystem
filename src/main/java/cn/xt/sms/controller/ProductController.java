package cn.xt.sms.controller;

import cn.xt.sms.condition.ProductCondition;
import cn.xt.sms.result.MyResult;
import cn.xt.sms.entity.Product;
import cn.xt.sms.entity.ProductBrand;
import cn.xt.sms.service.IProductBrandService;
import cn.xt.sms.service.IProductService;
import cn.xt.sms.service.middle.IProductMiddleService;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

/**
 * @author xietao.x@qq.com
 * @date 2018/4/18
 */
@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private IProductService productService;
    @Autowired
    private IProductMiddleService productMiddleService;
    @Autowired
    private IProductBrandService productBrandService;

    @RequiresPermissions(value = {"admin","searchProduct"},logical = Logical.OR)
    @RequestMapping("/toSearchProduct")
    public String toSearchProduct() {
        return "search_product";
    }

    @RequiresPermissions(value = {"admin","searchProduct"},logical = Logical.OR)
    @RequestMapping(value = "/getProductList", method = RequestMethod.POST)
    @ResponseBody
    public MyResult<Product> getProductList(ProductCondition productCondition, Integer currentPage, Integer pageSize) {
        return productService.getProductList(productCondition, currentPage, pageSize);
    }

    @RequiresPermissions(value = {"admin","insertProduct"},logical = Logical.OR)
    @RequestMapping(value = "/insertProduct", method = RequestMethod.POST)
    @ResponseBody
    public String insertProduct(Product product) {
        return productService.insertProduct(product);
    }

    @RequiresPermissions(value = {"admin","deleteProduct"},logical = Logical.OR)
    @RequestMapping(value = "/deleteProduct", method = RequestMethod.POST)
    @ResponseBody
    public String deleteProduct(Integer id) {
        return productService.deleteProduct(id);
    }

    @RequiresPermissions(value = {"admin","deleteProduct"},logical = Logical.OR)
    @RequestMapping(value = "/multiDeleteProduct", method = RequestMethod.POST)
    @ResponseBody
    public String MultiDeleteProduct(String ids) {
        return productMiddleService.multiDeleteProduct(ids);
    }

    @RequiresPermissions(value = {"admin","updateProduct"},logical = Logical.OR)
    @RequestMapping(value = "/updateProduct", method = RequestMethod.POST)
    @ResponseBody
    public String updateProduct(Product product) {
        return productService.updateProduct(product);
    }

    @RequiresPermissions(value = {"admin","searchProduct"},logical = Logical.OR)
    @RequestMapping(value = "/getProductById", method = RequestMethod.POST)
    @ResponseBody
    public Product getProductById(Integer id) {
        return productService.getProductById(id);
    }

    @RequiresPermissions(value = {"admin","searchProduct"},logical = Logical.OR)
    @RequestMapping(value = "/getBrandByGroupId", method = RequestMethod.POST)
    @ResponseBody
    public List<ProductBrand> getBrandByGroupId(String groupIds) {
        return productBrandService.getBrandByGroupId(groupIds);
    }

    @RequiresPermissions(value = {"admin","searchProduct"},logical = Logical.OR)
    @RequestMapping(value = "/getProductCount", method = RequestMethod.POST)
    @ResponseBody
    public Integer getProductCount(ProductCondition productCondition) {
        return productService.getProductCount(productCondition);
    }

    /*excel文件导入*/
    @RequiresPermissions(value = {"admin","insertProduct"},logical = Logical.OR)
    @RequestMapping(value = "/importExcel", method = RequestMethod.POST)
    @ResponseBody
    public String importExcel(MultipartFile upload) {
        try {
            //解析excel
            //1.读取文件输入流
            InputStream is = upload.getInputStream();
            //2.创建Excel工作簿文件(包含.xsl和.xslx格式)
            Workbook wb = WorkbookFactory.create(is);
            //3.打开需要解析的Sheet工作表
            Sheet sheet = wb.getSheetAt(0);
            //4.遍历工作表对象（本质是个行的集合）,读取每一行
            String message = productMiddleService.getProductFormExcel(sheet);
            //关流
            is.close();

            //解析成功
            return message;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "解析失败";
    }

    @RequiresPermissions(value = {"admin","searchProduct"},logical = Logical.OR)
    @RequestMapping("/exportExcel")
    @ResponseBody
    public String exportExcel(HttpServletResponse response, Integer start, Integer end, ProductCondition productCondition) {
        Workbook wb = new XSSFWorkbook();

        productMiddleService.setProductToExcel(wb, start, end, productCondition);

        //转码，防止文件名中文乱码
        String fileName = "材料信息.xlsx";
        try {
            fileName = URLEncoder.encode(fileName, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        //设置文件下载头
        response.addHeader("Content-Disposition", "attachment;filename=" + fileName);
        //1.设置文件ContentType类型，这样设置，会自动判断下载文件类型
        response.setContentType("application/octet-stream");

        OutputStream os = null;
        try {
            os = response.getOutputStream();
            wb.write(os);
            wb.close();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (os != null) {
                try {
                    os.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return null;
    }


}
