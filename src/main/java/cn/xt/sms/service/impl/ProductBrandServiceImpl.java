package cn.xt.sms.service.impl;

import cn.xt.sms.dao.IProductBrandDao;
import cn.xt.sms.entity.ProductBrand;
import cn.xt.sms.service.IProductBrandService;
import cn.xt.sms.util.BasicUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author xietao.x@qq.com
 * @date 2018/4/28
 */
@Service
public class ProductBrandServiceImpl implements IProductBrandService {

    @Autowired
    private IProductBrandDao productBrandDao;

    @Override
    public String setIdAndInsertProductBrand(ProductBrand productBrand) {
        if (productBrand != null) {
            /*判断是否已经存在品牌名称*/
            Integer brandId = productBrandDao.getIdByName(productBrand.getName());
            if (brandId == null) {
                productBrandDao.insertProductBrand(productBrand);
            } else {
                productBrand.setId(brandId);
                updateProductBrand(productBrand);
            }
            return "success";
        }
        return "fail";
    }

    @Override
    public String updateProductBrand(ProductBrand productBrand) {
        if (productBrand.getGroupId() == null || productBrand.getGroupId().equals("")) return "fail";
        //原有分组字符串
        String groupIds = productBrandDao.getGroupIdById(productBrand.getId());
        if (groupIds.indexOf(productBrand.getGroupId()) < 0) {
            groupIds += "," + productBrand.getGroupId();
        }
        productBrand.setGroupId(groupIds);
        productBrandDao.updateProductBrand(productBrand);
        return "success";
    }

    @Override
    public List<ProductBrand> getBrandByGroupId(String groupIds) {
        List<Integer> groupIdList = BasicUtil.convertIntegers(groupIds);
        return productBrandDao.getBrandByGroupId(groupIdList);
    }

    @Override
    public List<Integer> getIdsByName(String name) {
        return productBrandDao.getIdsByName(name);
    }


}
