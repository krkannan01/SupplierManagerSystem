package cn.xt.sms.controller;

import cn.xt.sms.annotation.*;
import cn.xt.sms.constant.CacheConstants;
import cn.xt.sms.constant.PrivilegeConstants;
import cn.xt.sms.entity.ProductGroup;
import cn.xt.sms.response.SimpleResponse;
import cn.xt.sms.service.IProductGroupService;
import com.alibaba.fastjson.JSONArray;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
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
    @GetCache(key = CacheConstants.PRODUCT_GROUP_CACHE_KEY)
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


    @RequiresPermissions(value = {"admin", privilege_prefix + ":search"},logical = Logical.OR)
    @GetMapping("/toInsertPage/{id}")
    public String toInsertPage(@PathVariable("id") Integer id, HttpServletRequest request) {
        ProductGroup group = new ProductGroup();
        if (0 != id)
            group = productGroupService.getProductGroupById(id);
        else {
            group.setId(0);
            group.setName("主分组");
        }
        request.setAttribute("group", group);
        return "product_group/add";
    }

    @Log(title = "商品分组管理", action = "添加")
    @RequiresPermissions(value = {"admin", privilege_prefix + ":insert"},logical = Logical.OR)
    @RestPostMapping("/insertProductGroup")
    @EvictCache(key = CacheConstants.PRODUCT_GROUP_CACHE_KEY)
    public SimpleResponse insertProductGroup(ProductGroup productGroup) {
        if (productGroup.getParentId() == null) productGroup.setParentId(0);
        Integer affectedRowNumber = productGroupService.setIdAndInsertProductGroup(productGroup);
        return new SimpleResponse(affectedRowNumber);
    }


    @GetMapping("/toGroupTreePage")
    public String toGroupTreePage() {
        return "product_group/tree";
    }


    @Log(title = "商品分组管理", action = "删除")
    @RequiresPermissions(value = {"admin", privilege_prefix + ":delete"},logical = Logical.OR)
    @RestPostMapping("/deleteProductGroup/{id}")
    @EvictCache(key = CacheConstants.PRODUCT_GROUP_CACHE_KEY)
    public SimpleResponse deleteProductGroup(@PathVariable("id") Integer id) {
        Integer affectedRowNumber = productGroupService.deleteProductGroup(id);
        return new SimpleResponse(affectedRowNumber);
    }


    @RequiresPermissions(value = {"admin", privilege_prefix + ":update"},logical = Logical.OR)
    @GetMapping("/toUpdatePage/{id}")
    public String toUpdatePage(@PathVariable("id") Integer id, HttpServletRequest request) {
        ProductGroup group = productGroupService.getProductGroupById(id);
        ProductGroup parentGroup = productGroupService.getProductGroupById(group.getParentId());
        if (parentGroup == null)
            parentGroup = new ProductGroup(0, "主分组", null);
        request.setAttribute("group", group);
        request.setAttribute("parentGroup", parentGroup);
        return "product_group/edit";
    }


    @Log(title = "商品分组管理", action = "修改")
    @RequiresPermissions(value = {"admin", privilege_prefix + ":update"},logical = Logical.OR)
    @RestPostMapping("/updateProductGroup")
    @EvictCache(key = CacheConstants.PRODUCT_GROUP_CACHE_KEY)
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
