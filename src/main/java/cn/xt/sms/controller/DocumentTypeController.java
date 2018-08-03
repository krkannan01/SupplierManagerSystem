package cn.xt.sms.controller;

import cn.xt.sms.annotation.RestGetMapping;
import cn.xt.sms.annotation.RestPostMapping;
import cn.xt.sms.condition.SupplierDocumentCondition;
import cn.xt.sms.entity.DocumentType;
import cn.xt.sms.entity.SupplierDocument;
import cn.xt.sms.response.DataResponse;
import cn.xt.sms.response.SimpleResponse;
import cn.xt.sms.service.IDocumentTypeService;
import cn.xt.sms.service.ISupplierDocumentService;
import cn.xt.sms.util.BasicUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;

/**
 * @Auther: xietao
 * @Date: 2018/7/25
 * @Description:
 */
@Controller
@RequestMapping("/documentType")
public class DocumentTypeController {

    @Autowired
    private IDocumentTypeService documentTypeService;

    @RestPostMapping("insertDocumentType")
    public SimpleResponse insertDocumentType(DocumentType type) {
        Integer affectedRowNumber = documentTypeService.insertDocumentType(type);
        return new SimpleResponse(affectedRowNumber);
    }

    @RestPostMapping("/deleteDocumentType")
    public SimpleResponse deleteDocumentType(String ids) {
        Integer[] idArr = BasicUtil.List2Array(BasicUtil.convertIntegers(ids));
        Integer affectedRowNumber = documentTypeService.deleteDocumentType(idArr);
        return new SimpleResponse(affectedRowNumber);
    }

    @RestGetMapping("/getDocumentTypeList")
    public DataResponse<DocumentType> getSupplierDocumentList() {
        return documentTypeService.getDocumentTypeList();
    }

    @RestPostMapping("/updateUseFrequency")
    public SimpleResponse updateUseFrequency(Integer id,
                                             @RequestParam(required = false, defaultValue = "1") Integer increment) {
        Integer affectedRowNumber = documentTypeService.updateUseFrequency(id, increment);
        return new SimpleResponse(affectedRowNumber);
    }

}
