package cn.xt.sms.service.impl;

import cn.xt.sms.dao.IProductGroupDao;
import cn.xt.sms.entity.ProductGroup;
import cn.xt.sms.service.IProductGroupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * @author xietao.x@qq.com
 * @date 2018/4/19
 */
@Service
public class ProductGroupServiceImpl implements IProductGroupService {

    @Autowired
    private IProductGroupDao productGroupDao;

    @Override
    public List<ProductGroup> getProductGroupList(Integer parentId) {
        /*1:查询一级材料分组信息
        * 2:递归查询子分组信息*/
        List<ProductGroup> productGroupList = productGroupDao.getProductGroupList(parentId);
        if (productGroupList != null && productGroupList.size() > 0) {
            for (ProductGroup productGroup : productGroupList) {
                productGroup.setChildren(getProductGroupList(productGroup.getId()));
            }
            return productGroupList;
        } else {
            return null;
        }
    }

    @Override
    public ProductGroup getProductGroupById(Integer id) {
        return productGroupDao.getProductGroupById(id);
    }

    @Override
    public String setIdAndInsertProductGroup(ProductGroup productGroup) {
        if (productGroup != null) {
            /*判断是否已经存在分组名称*/
            Integer groupId = productGroupDao.getIdByName(productGroup.getName());
            if (groupId == null) {
                productGroupDao.insertProductGroup(productGroup);
            } else {
                productGroup.setId(groupId);
            }
            return "success";
        }
        return "fail";
    }

    @Override
    @Transactional
    public String deleteProductGroup(Integer id) {
        return productGroupDao.deleteProductGroup(id) > 0 ? "success":"fail";
    }

    @Override
    public boolean unique(String name) {
        return productGroupDao.getIdByName(name) != null;
    }

    @Override
    public String updateProductGroup(ProductGroup productGroup) {
        return productGroupDao.updateProductGroup(productGroup) > 0 ? "success":"fail";
    }

}
