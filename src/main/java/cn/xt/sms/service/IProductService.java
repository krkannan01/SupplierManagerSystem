package cn.xt.sms.service;

import cn.xt.sms.condition.ProductCondition;
import cn.xt.sms.response.DataResponse;
import cn.xt.sms.entity.Product;

import javax.servlet.ServletContext;

/**
 * @author xietao.x@qq.com
 * @date 2018/4/19
 */
public interface IProductService {

    DataResponse<Product> getProductList(ProductCondition productCondition, Integer currentPage, Integer pageSize);

    Integer getProductCount(ProductCondition productCondition);

    Integer insertProduct(ServletContext context, Product product);

    Integer insertFromExcelProduct(ServletContext context, Product product);

    Integer deleteProduct(Integer id);

    Integer updateProduct(Product product);

    Product getProductById(Integer id);

    /*判断产品是否已存在(根据产品名称和供应商)*/
    boolean isUnique(Product product);

    /*获取当前最大的产品编号*/
    String getMaxNo();

}
