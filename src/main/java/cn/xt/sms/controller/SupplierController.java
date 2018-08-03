package cn.xt.sms.controller;

import cn.xt.sms.annotation.RestGetMapping;
import cn.xt.sms.annotation.RestPostMapping;
import cn.xt.sms.condition.SupplierCondition;
import cn.xt.sms.entity.Supplier;
import cn.xt.sms.enums.ResponseCode;
import cn.xt.sms.dto.MapDTO;
import cn.xt.sms.response.DataResponse;
import cn.xt.sms.entity.TradeGroup;
import cn.xt.sms.entity.UserDefinedFieldName;
import cn.xt.sms.response.SimpleResponse;
import cn.xt.sms.service.ISupplierService;
import cn.xt.sms.service.ITradeGroupService;
import cn.xt.sms.service.middle.ISupplierMiddleService;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.URLEncoder;
import java.util.List;

/**
 * 企业信息 控制层
 * @author xietao.x@qq.com
 * @date 2018/3/13
 */
@Controller
@RequestMapping("/supplier")
public class SupplierController {

    @Autowired
    private ISupplierService supplierService;
    @Autowired
    private ITradeGroupService tradeGroupService;
    @Autowired
    private ISupplierMiddleService supplierMiddleService;

    @RequiresPermissions(value = {"admin","searchSupplier"},logical = Logical.OR)
    @RestGetMapping("/search")
    public DataResponse<Supplier> search(SupplierCondition supplierCondition, Integer currentPage, Integer pageSize, HttpSession session) {
        session.setAttribute("currentPage", currentPage);
        session.setAttribute("pageSize", pageSize);
        return supplierService.getSupplierList(supplierCondition, currentPage, pageSize);
    }

    @RequiresPermissions(value = {"admin","searchSupplier"},logical = Logical.OR)
    @RestPostMapping("/getSupplierCount")
    public Integer searchSupplierCount(SupplierCondition supplierCondition) {
        return supplierService.getSupplierCount(supplierCondition);
    }

    @RequiresPermissions(value = {"admin","searchSupplier"},logical = Logical.OR)
    @RestPostMapping("/getUserDefinedFieldName")
    public UserDefinedFieldName getUserDefinedFieldName() {
        return supplierService.getUserDefinedFieldName();
    }

    @RequiresPermissions(value = {"admin","searchSupplier"},logical = Logical.OR)
    @RestGetMapping("/getSupplierIdAndName")
    public List<MapDTO> getSupplierIdAndName() {
        return supplierService.getSupplierIdAndName();
    }

    @RequiresPermissions(value = {"admin","insertSupplier"},logical = Logical.OR)
    @RestPostMapping("/insert")
    public String insert(HttpServletRequest request, Supplier supplier) {
        return supplierService.insertSupplier(request.getServletContext(), supplier);
    }

    @RequiresPermissions(value = {"admin","insertSupplier"},logical = Logical.OR)
    @RestGetMapping("/isUnique")
    public boolean isUnique(String fullName) {
        return supplierService.getIdByFullName(fullName) != null;
    }

    @RequiresPermissions(value = {"admin","deleteSupplier"},logical = Logical.OR)
    @RestPostMapping("/delete")
    public String delete(Integer id) {
        return supplierService.deleteSupplier(id);
    }

    @RequiresPermissions(value = {"admin","deleteSupplier"},logical = Logical.OR)
    @RestPostMapping("/mutliDelete")
    public String mutliDelete(String ids) {
        return supplierMiddleService.mutliDeleteSupplier(ids);
    }

    @RequiresPermissions(value = {"admin","updateSupplier"},logical = Logical.OR)
    @RestPostMapping("/update")
    public String update(Supplier supplier) {
        return supplierService.updateSupplier(supplier);
    }

    /*查询分组信息*/
    @RequiresPermissions(value = {"admin","searchSupplier"},logical = Logical.OR)
    @RestGetMapping("/getTradeGroup")
    public List<TradeGroup> getTradeGroup(@RequestParam(required = false, defaultValue = "0") Integer parentId,
                                          Integer categoryId) {
        return tradeGroupService.getTradeGroup(parentId, categoryId);
    }

    @RequiresPermissions(value = {"admin","searchSupplier"},logical = Logical.OR)
    @RequestMapping("/getSupplierById")
    public String getSupplierById(Integer id, String action, HttpServletRequest request) {
        Supplier supplier = supplierService.getSupplierById(id);
        request.setAttribute("supplier", supplier);
        return action == null ? "details":action;
    }

    @RequiresPermissions(value = {"admin","searchSupplier"},logical = Logical.OR)
    @RequestMapping("/getSupplierById2")
    public String getSupplierById2(Integer id, HttpServletRequest request) {
        Supplier supplier = supplierService.getSupplierById(id);
        request.setAttribute("supplier", supplier);
        return "supplier/detail_iframe";
    }

    @RequiresPermissions(value = {"admin","searchSupplier"},logical = Logical.OR)
    @GetMapping("/toSupplierDetailProduct")
    public String toSupplierDetailProduct(Integer id, HttpServletRequest request) {
        request.setAttribute("id", id);
        return "supplier/detail_iframe_product";
    }

    @RequiresPermissions(value = {"admin","searchSupplier"},logical = Logical.OR)
    @GetMapping("/toSupplierDetailDocument")
    public String toSupplierDetailDocument(Integer id, HttpServletRequest request) {
        request.setAttribute("id", id);
        return "supplier/detail_iframe_document";
    }

    /*转到serach_supplier页面*/
    @RequiresPermissions(value = {"admin","searchSupplier"},logical = Logical.OR)
    @RequestMapping("/toSearchSupplier")
    public String toSearchSupplier(String uccCode, HttpServletRequest request, HttpSession session) {
        if (uccCode != null && uccCode != "") {
            request.setAttribute("uccCode", uccCode);
        }
        request.setAttribute("currentPage", session.getAttribute("currentPage"));
        request.setAttribute("pageSize", session.getAttribute("pageSize"));
        return "supplier/search_supplier";
    }

    /*跳转到add_supplier页面*/
    @RequiresPermissions(value = {"admin","insertSupplier"},logical = Logical.OR)
    @RequestMapping("/toAddSupplier")
    public String toAddSupplier(HttpSession session) {
        return "supplier/add_supplier";
    }

    /*excel文件导入*/
    @RequiresPermissions(value = {"admin","insertSupplier"},logical = Logical.OR)
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
            String message = supplierMiddleService.getSupplierFormExcel(request.getServletContext(), sheet);
            //关流
            is.close();

            //解析成功
            return new SimpleResponse(ResponseCode.SUCCESS, message);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return new SimpleResponse(ResponseCode.ERROR, "解析错误");
    }

    @RequiresPermissions(value = {"admin","searchSupplier"},logical = Logical.OR)
    @RestGetMapping("/exportExcel")
    public String exportExcel(HttpServletResponse response, Integer start, Integer end, SupplierCondition supplierCondition) {
        Workbook wb = new XSSFWorkbook();

        supplierMiddleService.setSupplierToExcel(wb, start, end, supplierCondition);

        //转码，防止文件名中文乱码
        String fileName = "供应商信息.xlsx";
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

    /*转到edit页面*/
    @RequiresPermissions(value = {"admin","updateSupplier"},logical = Logical.OR)
    @RequestMapping("/toEdit")
    public String toEdit(HttpSession session) {
        return "supplier/edit";
    }

}
