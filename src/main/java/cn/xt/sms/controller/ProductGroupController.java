package cn.xt.sms.controller;

import cn.xt.sms.entity.ProductGroup;
import cn.xt.sms.service.IProductGroupService;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author xietao.x@qq.com
 * @date 2018/4/19
 */
@Controller
@RequestMapping("/productGroup")
public class ProductGroupController {

    @Autowired
    private IProductGroupService productGroupService;

    @RequiresPermissions(value = {"admin","searchProduct","searchProductGroup"},logical = Logical.OR)
    @RequestMapping(value = "/getProductGroupList", method = RequestMethod.POST)
    @ResponseBody
    public List<ProductGroup> getProductGroupList() {
        /*0代表从跟节点查询所有子节点*/
        return productGroupService.getProductGroupList(0);
    }

    @RequiresPermissions(value = {"admin","searchProduct","searchProductGroup"},logical = Logical.OR)
    @RequestMapping(value = "/getProductGroupById", method = RequestMethod.POST)
    @ResponseBody
    public ProductGroup getProductGroupById(Integer id) {
        return productGroupService.getProductGroupById(id);
    }

    @RequiresPermissions(value = {"admin","insertProductGroup"},logical = Logical.OR)
    @RequestMapping(value = "/insertProductGroup", method = RequestMethod.POST)
    @ResponseBody
    public String insertProductGroup(ProductGroup productGroup) {
        if (productGroup.getParentId() == null) productGroup.setParentId(0);
        return productGroupService.setIdAndInsertProductGroup(productGroup);
    }

    @RequiresPermissions(value = {"admin","deleteProductGroup"},logical = Logical.OR)
    @RequestMapping(value = "/deleteProductGroup", method = RequestMethod.POST)
    @ResponseBody
    public String deleteProductGroup(Integer id) {
        return productGroupService.deleteProductGroup(id);
    }

    @RequiresPermissions(value = {"admin","updateProductGroup"},logical = Logical.OR)
    @RequestMapping(value = "/updateProductGroup", method = RequestMethod.POST)
    @ResponseBody
    public String updateProductGroup(ProductGroup productGroup) {
        return productGroupService.updateProductGroup(productGroup);
    }

    @RequiresPermissions(value = {"admin","searchProductGroup"},logical = Logical.OR)
    @RequestMapping(value = "/unique", method = RequestMethod.POST)
    @ResponseBody
    public boolean unique(String name) {
        return productGroupService.unique(name);
    }

}
