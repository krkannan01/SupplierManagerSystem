package cn.xt.sms.controller;

import cn.xt.sms.annotation.RestGetMapping;
import cn.xt.sms.annotation.RestPostMapping;
import cn.xt.sms.condition.SupplierDocumentCondition;
import cn.xt.sms.entity.SupplierDocument;
import cn.xt.sms.response.DataResponse;
import cn.xt.sms.response.SimpleResponse;
import cn.xt.sms.service.ISupplierDocumentService;
import cn.xt.sms.util.BasicUtil;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.util.List;

/**
 * @Auther: xietao
 * @Date: 2018/7/25
 * @Description:
 */
@Controller
@RequestMapping("/document")
public class SupllierDocumentController {

    @Autowired
    private ISupplierDocumentService supplierDocumentService;

    @RestPostMapping("insertDocument")
    public SimpleResponse insertSupplierDocument(SupplierDocument document, MultipartFile appendixFile) throws IOException {
        // 获取文件字节数组
        document.setAppendix(appendixFile.getBytes());
        // 获取文件名称
        document.setAppendixName(appendixFile.getOriginalFilename());
        // 调用插入方法，返回受影响的行数
        Integer affectedRowNumber = supplierDocumentService.insertSupplierDocument(document);
        return new SimpleResponse(affectedRowNumber);
    }

    @RestPostMapping("/deleteDocument")
    public SimpleResponse deleteSupplierDocument(String ids) {
        Integer[] idArr = BasicUtil.List2Array(BasicUtil.convertIntegers(ids));
        Integer affectedRowNumber = supplierDocumentService.deleteSupplierDocument(idArr);
        return new SimpleResponse(affectedRowNumber);
    }

    @RestGetMapping("/getDocumentList")
    public DataResponse<SupplierDocument> getSupplierDocumentList(@RequestParam(required = false, defaultValue = "1") Integer currentPage,
                                                                  @RequestParam(required = false, defaultValue = "10") Integer pageSize,
                                                                  SupplierDocumentCondition condition) {
        return supplierDocumentService.getSupplierDocumentList(currentPage, pageSize, condition);
    }

    @RestGetMapping("/download")
    public void download(Integer id, HttpServletResponse response) throws IOException {
        SupplierDocument document = supplierDocumentService.getSupplierDocument(id);
        //第一步：设置响应类型
        response.setContentType("application/force-download");//应用程序强制下载
        //设置文件名
        String name = document.getAppendixName();
        byte[] bytes = document.getAppendix();
        //设置响应头，对文件进行url编码
        name = URLEncoder.encode(name, "UTF-8");
        response.setHeader("Content-Disposition", "attachment;filename="+name);
        response.setContentLength(bytes.length);

        //第三步：输出
        OutputStream out = response.getOutputStream();
        out.write(bytes, 0, bytes.length);
        out.flush();
        out.close();
    }

    @RestGetMapping("/test")
    public File test(Integer id) {
//        SupplierDocument document = supplierDocumentService.getSupplierDocument(id);
//        byte[] bytes = document.getAppendix();
//        return bytes;
        return new File("/src/main/webapp/statics/first.pdf");
    }

    @RequestMapping("/toPage/{path}")
    public String toPage(@PathVariable("path") String path) {
        return path.replace("-", "/");
    }

}
