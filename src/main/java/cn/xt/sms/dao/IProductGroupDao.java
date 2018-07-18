package cn.xt.sms.dao;

import cn.xt.sms.entity.ProductGroup;

import java.util.List;

/**
 * @author xietao.x@qq.com
 * @date 2018/4/19
 */
public interface IProductGroupDao {

    /*查询分组信息*/
    List<ProductGroup> getProductGroupList();

    /*根据ID查询分组信息*/
    ProductGroup getProductGroupById(Integer id);

    /*修改分组信息*/
    Integer updateProductGroup(ProductGroup productGroup);

    /*新增分组信息*/
    Integer insertProductGroup(ProductGroup productGroup);

    /*删除分组信息*/
    Integer deleteProductGroup(Integer id);

    /*验证名称是否存在*/
    Integer getIdByName(String name);

}
