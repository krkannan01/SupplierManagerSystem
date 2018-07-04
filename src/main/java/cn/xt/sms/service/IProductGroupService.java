package cn.xt.sms.service;

import cn.xt.sms.entity.ProductGroup;

import java.util.List;

/**
 * @author xietao.x@qq.com
 * @date 2018/4/19
 */
public interface IProductGroupService {

    /*查询所有材料分组信息*/
    List<ProductGroup> getProductGroupList(Integer parentId);

    /*根据ID查询材料分组信息*/
    ProductGroup getProductGroupById(Integer id);

    /*修改材料分组信息*/
    String updateProductGroup(ProductGroup productGroup);

    /*新增材料分组信息*/
    String setIdAndInsertProductGroup(ProductGroup productGroup);

    /*删除材料分组信息*/
    String deleteProductGroup(Integer id);

    /*验证名称是否已存在*/
    boolean unique(String name);

}
