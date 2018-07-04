package cn.xt.sms.controller;

import cn.xt.sms.Result.MapResult;
import cn.xt.sms.Result.MyResult;
import cn.xt.sms.entity.Enterprise;
import cn.xt.sms.entity.TradeGroup;
import cn.xt.sms.entity.UserDefinedFieldName;
import cn.xt.sms.service.IEnterpriseService;
import cn.xt.sms.Condition.EnterpriseCondition;
import cn.xt.sms.service.ITradeGroupService;
import cn.xt.sms.service.middle.IEnterpriseMiddleService;
import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 企业信息 控制层
 * @author xietao.x@qq.com
 * @date 2018/3/13
 */
@Controller
@RequestMapping("/enterprise")
public class EnterpriseController {

    @Autowired
    private IEnterpriseService enterpriseService;
    @Autowired
    private ITradeGroupService tradeGroupService;
    @Autowired
    private IEnterpriseMiddleService enterpriseMiddleService;

    @RequiresPermissions(value = {"admin","searchEnterprise"},logical = Logical.OR)
    @RequestMapping(value = "/search", method = RequestMethod.POST)
    @ResponseBody
    public MyResult<Enterprise> search(EnterpriseCondition enterpriseCondition, Integer currentPage, Integer pageSize, HttpSession session) {
        session.setAttribute("currentPage", currentPage);
        session.setAttribute("pageSize", pageSize);
        return enterpriseService.getEnterpriseList(enterpriseCondition, currentPage, pageSize);
    }

    @RequiresPermissions(value = {"admin","searchEnterprise"},logical = Logical.OR)
    @RequestMapping(value = "/getEnterpriseCount", method = RequestMethod.POST)
    @ResponseBody
    public Integer searchEnterpriseCount(EnterpriseCondition enterpriseCondition) {
        return enterpriseService.getEnterpriseCount(enterpriseCondition);
    }

    @RequiresPermissions(value = {"admin","searchEnterprise"},logical = Logical.OR)
    @RequestMapping(value = "/getUserDefinedFieldName", method = RequestMethod.POST)
    @ResponseBody
    public UserDefinedFieldName getUserDefinedFieldName() {
        return enterpriseService.getUserDefinedFieldName();
    }

    @RequiresPermissions(value = {"admin","searchEnterprise"},logical = Logical.OR)
    @RequestMapping(value = "/getEnterpriseIdAndName", method = RequestMethod.POST)
    @ResponseBody
    public List<MapResult> getEnterpriseIdAndName() {
        return enterpriseService.getEnterpriseIdAndName();
    }

    @RequiresPermissions(value = {"admin","insertEnterprise"},logical = Logical.OR)
    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    @ResponseBody
    public String insert(Enterprise enterprise) {
        return enterpriseService.insertEnterprise(enterprise);
    }

    @RequiresPermissions(value = {"admin","insertEnterprise"},logical = Logical.OR)
    @RequestMapping(value ="/isUnique", method = RequestMethod.GET)
    @ResponseBody
    public boolean isUnique(String fullName) {
        return enterpriseService.getIdByFullName(fullName) != null;
    }

    @RequiresPermissions(value = {"admin","deleteEnterprise"},logical = Logical.OR)
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public String delete(Integer id) {
        return enterpriseService.deleteEnterprise(id);
    }

    @RequiresPermissions(value = {"admin","deleteEnterprise"},logical = Logical.OR)
    @RequestMapping(value = "/mutliDelete", method = RequestMethod.POST)
    @ResponseBody
    public String mutliDelete(String ids) {
        return enterpriseMiddleService.mutliDeleteEnterprise(ids);
    }

    @RequiresPermissions(value = {"admin","updateEnterprise"},logical = Logical.OR)
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public String update(Enterprise enterprise) {
        return enterpriseService.updateEnterprise(enterprise);
    }

    /*查询分组信息*/
    @RequiresPermissions(value = {"admin","searchEnterprise"},logical = Logical.OR)
    @RequestMapping(value = "/getTradeGroup", method = RequestMethod.POST)
    @ResponseBody
    public MyResult<TradeGroup> getTradeGroup() {
        return tradeGroupService.getTradeGroup();
    }

    @RequiresPermissions(value = {"admin","searchEnterprise"},logical = Logical.OR)
    @RequestMapping("/getEnterpriseById")
    public String getEnterpriseById(Integer id, String action, HttpServletRequest request) {
        Enterprise enterprise = enterpriseService.getEnterpriseById(id);
        request.setAttribute("enterprise", enterprise);
        return action == null ? "details":action;
    }

    /*转到serach_supplier页面*/
    @RequiresPermissions(value = {"admin","searchEnterprise"},logical = Logical.OR)
    @RequestMapping("/toSearchSupplier")
    public String toSearchSupplier(String uccCode, HttpServletRequest request, HttpSession session) {
        if (uccCode != null && uccCode != "") {
            request.setAttribute("uccCode", uccCode);
        }
        request.setAttribute("currentPage", session.getAttribute("currentPage"));
        request.setAttribute("pageSize", session.getAttribute("pageSize"));
        return "search_supplier";
    }

    /*转到add_supplier页面*/
    @RequiresPermissions(value = {"admin","insertEnterprise"},logical = Logical.OR)
    @RequestMapping("/toAddSupplier")
    public String toAddSupplier(HttpSession session) {
        return "add_supplier";
    }

    /*excel文件导入*/
    @RequiresPermissions(value = {"admin","insertEnterprise"},logical = Logical.OR)
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
            String message = enterpriseMiddleService.getEnterpriseFormExcel(sheet);
            //关流
            is.close();

            //解析成功
            return message;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "解析错误";
    }

    @RequiresPermissions(value = {"admin","searchEnterprise"},logical = Logical.OR)
    @RequestMapping("/exportExcel")
    @ResponseBody
    public String exportExcel(HttpServletResponse response, Integer start, Integer end, EnterpriseCondition enterpriseCondition) {
        Workbook wb = new XSSFWorkbook();

        enterpriseMiddleService.setEnterpriseToExcel(wb, start, end, enterpriseCondition);

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
    @RequiresPermissions(value = {"admin","updateEnterprise"},logical = Logical.OR)
    @RequestMapping("/toEdit")
    public String toEdit(HttpSession session) {
        return "edit";
    }

}
