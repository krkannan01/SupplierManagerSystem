package cn.xt.sms.dao;

import cn.xt.sms.entity.SupplierCategory;

import java.util.List;

/**
 * @Auther: xietao
 * @Date: 2018/7/14
 * @Description: 供应商种类 数据接口层
 */
public interface ISupplierCategoryDao {

    /* 查询所有供应商种类. */
    List<SupplierCategory> selectSupplierCategoryList();

    /* 添加供应商种类. */
    Integer insertSupplierCategory(SupplierCategory supplierCategory);

    /* 删除供应商种类. */
    Integer deleteSupplierCategory(Integer id);

    /* 修改供应商种类. */
    Integer updateSupplierCategory(SupplierCategory supplierCategory);

}
