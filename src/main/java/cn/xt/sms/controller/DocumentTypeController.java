package cn.xt.sms.controller;

import cn.xt.sms.annotation.*;
import cn.xt.sms.constant.CacheConstants;
import cn.xt.sms.constant.PrivilegeConstants;
import cn.xt.sms.entity.DocumentType;
import cn.xt.sms.response.DataResponse;
import cn.xt.sms.response.SimpleResponse;
import cn.xt.sms.service.IDocumentTypeService;
import cn.xt.sms.util.BasicUtil;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @Auther: xietao
 * @Date: 2018/7/25
 * @Description:
 */
@Controller
@RequestMapping("/documentType")
public class DocumentTypeController {

    private final String privilege_prefix = PrivilegeConstants.DOCUMENT_TYPE;

    @Autowired
    private IDocumentTypeService documentTypeService;

    @RequiresPermissions(value = {"admin", privilege_prefix + ":search"}, logical = Logical.OR)
    @GetMapping("/toSearchDocumentType")
    public String toSearchDocumentType() {
        return "document_type/search_type";
    }

    @Log(title = "文档类型管理", action = "添加")
    @RequiresPermissions(value = {"admin", privilege_prefix + ":insert"}, logical = Logical.OR)
    @RestPostMapping("/insertDocumentType")
    @EvictCache(key = CacheConstants.DOCUMENT_TYPE_CACHE_KEY)  //添加时收回缓存（销毁）
    public SimpleResponse insertDocumentType(DocumentType type) {
        Integer affectedRowNumber = documentTypeService.insertDocumentType(type);
        return new SimpleResponse(affectedRowNumber);
    }

    @Log(title = "文档类型管理", action = "删除")
    @RequiresPermissions(value = {"admin", privilege_prefix + ":delete"}, logical = Logical.OR)
    @RestPostMapping("/deleteDocumentType")
    @EvictCache(key = CacheConstants.DOCUMENT_TYPE_CACHE_KEY)  //删除时收回缓存（销毁）
    public SimpleResponse deleteDocumentType(String ids) {
        Integer[] idArr = BasicUtil.List2Array(BasicUtil.convertIntegers(ids));
        Integer affectedRowNumber = documentTypeService.deleteDocumentType(idArr);
        return new SimpleResponse(affectedRowNumber);
    }

    @RequiresPermissions(value = {"admin", privilege_prefix + ":search"}, logical = Logical.OR)
    @RestGetMapping("/getDocumentTypeList")
    @GetCache(key = CacheConstants.DOCUMENT_TYPE_CACHE_KEY)  //存取自缓存
    public DataResponse<DocumentType> getSupplierDocumentList() {
        return documentTypeService.getDocumentTypeList();
    }


    @RequiresPermissions(value = {"admin", privilege_prefix + ":update"}, logical = Logical.OR)
    @RestPostMapping("/updateUseFrequency")
    public SimpleResponse updateUseFrequency(Integer id,
                                             @RequestParam(required = false, defaultValue = "1") Integer increment) {
        Integer affectedRowNumber = documentTypeService.updateUseFrequency(id, increment);
        return new SimpleResponse(affectedRowNumber);
    }

    @Log(title = "文档类型管理", action = "修改")
    @RequiresPermissions(value = {"admin", privilege_prefix + ":update"}, logical = Logical.OR)
    @RestPostMapping("/updateDocumentType")
    @EvictCache(key = CacheConstants.DOCUMENT_TYPE_CACHE_KEY)  //更新时收回缓存（销毁）
    public SimpleResponse updateDocumentType(Integer id, DocumentType type) {
        Integer affectedRowNumber = documentTypeService.updateDocumentType(type);
        return new SimpleResponse(affectedRowNumber);
    }

}
