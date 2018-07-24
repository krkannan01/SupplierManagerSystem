package cn.xt.sms.service;

import cn.xt.sms.condition.ProductCondition;
import cn.xt.sms.result.MyResult;
import cn.xt.sms.entity.Product;

import javax.servlet.Servlet;
import javax.servlet.ServletContext;

/**
 * @author xietao.x@qq.com
 * @date 2018/4/19
 */
public interface IProductService {

    MyResult<Product> getProductList(ProductCondition productCondition, Integer currentPage, Integer pageSize);

    Integer getProductCount(ProductCondition productCondition);

    String insertProduct(ServletContext context, Product product);

    String insertFromExcelProduct(ServletContext context, Product product);

    String deleteProduct(Integer id);

    String updateProduct(Product product);

    Product getProductById(Integer id);

    /*判断产品是否已存在(根据产品名称和供应商)*/
    boolean isUnique(Product product);

    /*获取当前最大的产品编号*/
    String getMaxNo();

}
