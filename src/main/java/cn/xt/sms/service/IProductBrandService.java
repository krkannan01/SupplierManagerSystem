package cn.xt.sms.service;

import cn.xt.sms.entity.ProductBrand;

import java.util.List;

/**
 * @author xietao.x@qq.com
 * @date 2018/4/28
 */
public interface IProductBrandService {

    /*新增材料品牌信息*/
    String setIdAndInsertProductBrand(ProductBrand productBrand);

    /*修改材料品牌信息*/
    String updateProductBrand(ProductBrand productBrand);

    /*根据分组id查询分组信息*/
    List<ProductBrand> getBrandByGroupId(String groupIds);

    /*根据品牌name模糊查询品牌id*/
    List<Integer> getIdsByName(String name);

}
