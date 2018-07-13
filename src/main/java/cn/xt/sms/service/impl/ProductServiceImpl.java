package cn.xt.sms.service.impl;

import cn.xt.sms.condition.ProductCondition;
import cn.xt.sms.result.MyResult;
import cn.xt.sms.dao.IProductDao;
import cn.xt.sms.entity.Product;
import cn.xt.sms.service.IProductBrandService;
import cn.xt.sms.service.IProductGroupService;
import cn.xt.sms.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author xietao.x@qq.com
 * @date 2018/4/19
 */
@Service
public class ProductServiceImpl implements IProductService {

    @Autowired
    private IProductDao productDao;
    @Autowired
    private IProductBrandService productBrandService;
    @Autowired
    private IProductGroupService productGroupService;

    @Override
    public MyResult<Product> getProductList(ProductCondition productCondition, Integer currentPage, Integer pageSize) {
        /*计算偏移量*/
        pageSize = pageSize == null ? 10:pageSize;
        Integer offset = currentPage == null ? 0:(currentPage-1)*pageSize;
        offset = offset < 0 ? 0:offset;

        if (productCondition != null) {
            if (productCondition.getBrand() != null && (!productCondition.getBrand().equals(""))) {
                List<Integer> ids = productBrandService.getIdsByName(productCondition.getBrand());
                if (ids.size() > 0) {
                    productCondition.setBrandIds(ids);
                } else {
                    ids.add(-1);
                    productCondition.setBrandIds(ids);
                }
            }
        }

        MyResult<Product> productResult = new MyResult<Product>();
        Integer count = productDao.selectProductCount(productCondition);

        /*判断偏移量是否超过总数，如果是，降低偏移量*/
        if (offset >= count) {
            offset = (count-1)/pageSize*pageSize;
        }

        List<Product> enterpriseList = productDao.selectProductList(pageSize, offset, productCondition);
        if (enterpriseList != null && count != null) {
            productResult.setMsg("success");
            productResult.setCount(count);
            productResult.setRows(enterpriseList);
        } else {
            productResult.setMsg("error");
        }
        return productResult;
    }

    @Override
    public Integer getProductCount(ProductCondition productCondition) {
        return productDao.selectProductCount(productCondition);
    }

    @Override
    @Transactional
    public String insertProduct(Product product) {
        if (product != null) {
            if (product.getBrandId() != null && product.getGroupId() != null) {
                product.getBrandId().setGroupId(product.getGroupId().getId().toString());
            }
            productBrandService.setIdAndInsertProductBrand(product.getBrandId());
            return productDao.insertProduct(product) > 0 ? "success" : "fail";
        }
        return "fail";
    }

    @Override
    @Transactional
    public String insertFromExcelProduct(Product product) {
        //处理分组 判断是否需要添加分组
        product.getGroupId().setParentId(0);
        productGroupService.setIdAndInsertProductGroup(product.getGroupId());

        return insertProduct(product);
    }

    @Override
    public String deleteProduct(Integer id) {
        return productDao.deleteProduct(id) > 0 ? "success":"fail";
    }

    @Override
    public String updateProduct(Product product) {
        if (product != null) {
            if (product.getBrandId() != null && product.getGroupId() != null) {
                product.getBrandId().setGroupId(product.getGroupId().getId().toString());
            }
            productBrandService.setIdAndInsertProductBrand(product.getBrandId());
            productDao.updateProduct(product);
            return "success";
        }
        return "fail";
    }

    @Override
    public Product getProductById(Integer id) {
        return productDao.getProductById(id);
    }

    @Override
    public boolean isUnique(Product product) {
        return productDao.existsByNameAndEnterprise(product) > 0;
    }

}
