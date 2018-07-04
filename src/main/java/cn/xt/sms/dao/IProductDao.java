package cn.xt.sms.dao;

import cn.xt.sms.Condition.ProductCondition;
import cn.xt.sms.entity.Product;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author xietao.x@qq.com
 * @date 2018/4/19
 */
public interface IProductDao {

    /*查询材料数量*/
    Integer selectProductCount(ProductCondition productCondition);

    /*查询材料信息*/
    List<Product> selectProductList(@Param("pageSize") Integer pageSize,
                                    @Param("offset") Integer offset,
                                    @Param("productCondition") ProductCondition productCondition);

    /*新增材料信息*/
    Integer insertProduct(Product product);

    /*删除材料信息*/
    Integer deleteProduct(Integer id);

    /*修改材料信息*/
    Integer updateProduct(Product product);

    /*根据Id查询商品信息*/
    Product getProductById(Integer id);

    /*判断产品是否已存在(根据产品名称和供应商)*/
    Integer existsByNameAndEnterprise(Product product);

}
