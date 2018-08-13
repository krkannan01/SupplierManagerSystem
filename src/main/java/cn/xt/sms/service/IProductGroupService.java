package cn.xt.sms.service;

import cn.xt.sms.entity.ProductGroup;

import java.util.List;

/**
 * @author xietao.x@qq.com
 * @date 2018/4/19
 */
public interface IProductGroupService {

    /*查询所有商品分组信息*/
    List<ProductGroup> getProductGroupList();
    
    /*查询所有商品分组信息和分组下的商品数量信息*/
    List<ProductGroup> getProductGroupListAndSupplierCount();

    /*根据ID查询商品分组信息*/
    ProductGroup getProductGroupById(Integer id);

    /*修改商品分组信息*/
    Integer updateProductGroup(ProductGroup productGroup);

    /*新增商品分组信息*/
    Integer setIdAndInsertProductGroup(ProductGroup productGroup);

    /*删除商品分组信息*/
    Integer deleteProductGroup(Integer id);

    /*验证名称是否已存在*/
    boolean unique(String name);

}
