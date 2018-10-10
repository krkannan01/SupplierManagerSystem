package cn.xt.sms.controller;

import cn.xt.sms.annotation.Log;
import cn.xt.sms.annotation.RestGetMapping;
import cn.xt.sms.annotation.RestPostMapping;
import cn.xt.sms.condition.ProductCondition;
import cn.xt.sms.constant.PrivilegeConstants;
import cn.xt.sms.dto.MapDTO;
import cn.xt.sms.entity.ProductGroup;
import cn.xt.sms.enums.ResponseCode;
import cn.xt.sms.response.DataResponse;
import cn.xt.sms.entity.Product;
import cn.xt.sms.entity.ProductBrand;
import cn.xt.sms.response.SimpleResponse;
import cn.xt.sms.service.IProductBrandService;
import cn.xt.sms.service.IProductGroupService;
import cn.xt.sms.service.IProductService;
import cn.xt.sms.service.ISupplierService;
import cn.xt.sms.service.middle.IProductMiddleService;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
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

    private final String privilege_prefix = PrivilegeConstants.PRODUCT;

    @Autowired
    private IProductService productService;
    @Autowired
    private IProductMiddleService productMiddleService;
    @Autowired
    private IProductBrandService productBrandService;
    @Autowired
    private ISupplierService supplierService;
    @Autowired
    private IProductGroupService productGroupService;

    @RequiresPermissions(value = {"admin", privilege_prefix + ":search"},logical = Logical.OR)
    @RequestMapping("/toSearchProduct")
    public String toSearchProduct() {
        return "product/search_product";
    }


    @RequiresPermissions(value = {"admin", privilege_prefix + ":search"},logical = Logical.OR)
    @RestGetMapping("/getProductList")
    public DataResponse<Product> getProductList(ProductCondition productCondition, Integer currentPage, Integer pageSize) {
        return productService.getProductList(productCondition, currentPage, pageSize);
    }


    @RequiresPermissions(value = {"admin", privilege_prefix + ":insert"},logical = Logical.OR)
    @GetMapping("/toInsertPage")
    public String toInsertPage() {
        return "product/add";
    }


    @Log(title = "商品信息管理", action = "添加")
    @RequiresPermissions(value = {"admin", privilege_prefix + ":insert"},logical = Logical.OR)
    @RestPostMapping("/insertProduct")
    public SimpleResponse insertProduct(HttpServletRequest request, Product product) {
        Integer affectedRowNumber = productService.insertProduct(request.getServletContext(), product);
        return new SimpleResponse(affectedRowNumber);
    }


    @Log(title = "商品信息管理", action = "删除")
    @RequiresPermissions(value = {"admin", privilege_prefix + ":delete"},logical = Logical.OR)
    @RestPostMapping("/deleteProduct")
    public SimpleResponse deleteProduct(Integer id) {
        Integer affectedRowNumber = productService.deleteProduct(id);
        return new SimpleResponse(affectedRowNumber);
    }


    @Log(title = "商品信息管理", action = "批量删除")
    @RequiresPermissions(value = {"admin", privilege_prefix + ":delete"},logical = Logical.OR)
    @RestPostMapping("/multiDeleteProduct")
    public SimpleResponse MultiDeleteProduct(String ids) {
        Integer affectedRowNumber = productMiddleService.multiDeleteProduct(ids);
        return new SimpleResponse(affectedRowNumber);
    }


    @RequiresPermissions(value = {"admin", privilege_prefix + ":update"},logical = Logical.OR)
    @GetMapping("/toUpdatePage")
    public String toUpdatePage(Integer id, HttpServletRequest request) {
        Product product = productService.getProductById(id);
        List<ProductGroup> groupList = productGroupService.getProductGroupList();
        List<MapDTO> supplierPartLists = supplierService.getSupplierIdAndName();
        request.setAttribute("product", product);
//        request.setAttribute("groupList", groupList);
        request.setAttribute("supplierPartLists", supplierPartLists);
        return "product/edit";
    }


    @Log(title = "商品信息管理", action = "修改")
    @RequiresPermissions(value = {"admin", privilege_prefix + ":update"},logical = Logical.OR)
    @RestPostMapping("/updateProduct")
    public SimpleResponse updateProduct(Product product) {
        Integer affectedRowNumber = productService.updateProduct(product);
        return new SimpleResponse(affectedRowNumber);
    }


    @RequiresPermissions(value = {"admin", privilege_prefix + ":search"},logical = Logical.OR)
    @RestGetMapping("/getProductById")
    public Product getProductById(Integer id) {
        return productService.getProductById(id);
    }

    @RequiresPermissions(value = {"admin", privilege_prefix + ":search"},logical = Logical.OR)
    @RestGetMapping("/getBrandByGroupId")
    public List<ProductBrand> getBrandByGroupId(String groupIds) {
        return productBrandService.getBrandByGroupId(groupIds);
    }


    @RequiresPermissions(value = {"admin", privilege_prefix + ":search"},logical = Logical.OR)
    @RestGetMapping("/getProductCount")
    public Integer getProductCount(ProductCondition productCondition) {
        return productService.getProductCount(productCondition);
    }


    @Log(title = "商品信息管理", action = "导出Excel")
    @RequiresPermissions(value = {"admin", privilege_prefix + ":search"},logical = Logical.OR)
    @RestGetMapping("/exportExcel")
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


    /*excel文件导入*/
    @Log(title = "商品信息管理", action = "导入Excel")
    @RequiresPermissions(value = {"admin", privilege_prefix + ":insert"},logical = Logical.OR)
    @RestPostMapping("/importExcel")
    public SimpleResponse importExcel(HttpServletRequest request, MultipartFile upload) {
        try {
            //解析excel
            //1.读取文件输入流
            InputStream is = upload.getInputStream();
            //2.创建Excel工作簿文件(包含.xsl和.xslx格式)
            Workbook wb = WorkbookFactory.create(is);
            //3.打开需要解析的Sheet工作表
            Sheet sheet = wb.getSheetAt(0);
            //4.遍历工作表对象（本质是个行的集合）,读取每一行
            String message = productMiddleService.getProductFormExcel(request.getServletContext(), sheet);
            //关流
            is.close();

            //解析成功
            return new SimpleResponse(ResponseCode.SUCCESS, message);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return new SimpleResponse(ResponseCode.SUCCESS, "解析失败");
    }


}
