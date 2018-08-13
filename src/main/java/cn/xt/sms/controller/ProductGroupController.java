package cn.xt.sms.controller;

import cn.xt.sms.annotation.RestGetMapping;
import cn.xt.sms.annotation.RestPostMapping;
import cn.xt.sms.constant.PrivilegeConstants;
import cn.xt.sms.entity.ProductGroup;
import cn.xt.sms.response.SimpleResponse;
import cn.xt.sms.service.IProductGroupService;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author xietao.x@qq.com
 * @date 2018/4/19
 */
@Controller
@RequestMapping("/productGroup")
public class ProductGroupController {

    private final String privilege_prefix = PrivilegeConstants.PRODUCT_GROUP;

    @Autowired
    private IProductGroupService productGroupService;


    @RequiresPermissions(value = {"admin", privilege_prefix + ":search"},logical = Logical.OR)
    @GetMapping("/toSearchProductGroupPage")
    public String toSearchProductGroupPage() {
        return "product_group/wrap";
    }


    @RequiresPermissions(value = {"admin", privilege_prefix + ":search"},logical = Logical.OR)
    @GetMapping("/toSearchProductGroup")
    public String toSearchProductGroup() {
        return "product_group/search_product_group";
    }


    @RequiresPermissions(value = {"admin", privilege_prefix + ":search"},logical = Logical.OR)
    @RestGetMapping("/list")
    public List<ProductGroup> list() {
        return productGroupService.getProductGroupList();
    }


    @RequiresPermissions(value = {"admin", privilege_prefix + ":search"},logical = Logical.OR)
    @RestGetMapping("/getProductGroupList")
    public List<ProductGroup> getProductGroupList() {
        return productGroupService.getProductGroupListAndSupplierCount();
    }


    @RequiresPermissions(value = {"admin", privilege_prefix + ":search"},logical = Logical.OR)
    @RestGetMapping("/getProductGroupById")
    public ProductGroup getProductGroupById(Integer id) {
        return productGroupService.getProductGroupById(id);
    }


    @RequiresPermissions(value = {"admin", privilege_prefix + ":insert"},logical = Logical.OR)
    @RestPostMapping("/insertProductGroup")
    public SimpleResponse insertProductGroup(ProductGroup productGroup) {
        if (productGroup.getParentId() == null) productGroup.setParentId(0);
        Integer affectedRowNumber = productGroupService.setIdAndInsertProductGroup(productGroup);
        return new SimpleResponse(affectedRowNumber);
    }


    @RequiresPermissions(value = {"admin", privilege_prefix + ":delete"},logical = Logical.OR)
    @RestPostMapping("/deleteProductGroup/{id}")
    public SimpleResponse deleteProductGroup(@PathVariable("id") Integer id) {
        Integer affectedRowNumber = productGroupService.deleteProductGroup(id);
        return new SimpleResponse(affectedRowNumber);
    }


    @RequiresPermissions(value = {"admin", privilege_prefix + ":update"},logical = Logical.OR)
    @RestPostMapping("/updateProductGroup")
    public SimpleResponse updateProductGroup(ProductGroup productGroup) {
        Integer affectedRowNumber = productGroupService.updateProductGroup(productGroup);
        return new SimpleResponse(affectedRowNumber);
    }


    @RequiresPermissions(value = {"admin", privilege_prefix + ":search"},logical = Logical.OR)
    @RestGetMapping("/unique")
    public boolean unique(String name) {
        return productGroupService.unique(name);
    }

}
