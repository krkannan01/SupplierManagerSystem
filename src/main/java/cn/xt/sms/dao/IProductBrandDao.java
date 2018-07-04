package cn.xt.sms.dao;

import cn.xt.sms.Condition.ProductCondition;
import cn.xt.sms.entity.Product;
import cn.xt.sms.entity.ProductBrand;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author xietao.x@qq.com
 * @date 2018/4/19
 */
public interface IProductBrandDao {

    /*判断品牌name是否存在*/
    Integer getIdByName(String name);

    /*新增品牌信息*/
    Integer insertProductBrand(ProductBrand productBrand);

    /*修改品牌信息*/
    Integer updateProductBrand(ProductBrand productBrand);

    /*根据id查询分组id*/
    String getGroupIdById(Integer id);

    /*根据分组id查询品牌信息*/
    List<ProductBrand> getBrandByGroupId(@Param("groupIdList") List<Integer> groupIdList);

    /*根据品牌name模糊查询品牌ids*/
    List<Integer> getIdsByName(String name);

}
