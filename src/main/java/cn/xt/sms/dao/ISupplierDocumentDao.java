package cn.xt.sms.dao;

import cn.xt.sms.condition.SupplierFileCondition;
import cn.xt.sms.entity.SupplierFile;

import java.util.List;

/**
 * @Auther: xietao
 * @Date: 2018/7/24
 * @Description: 供应商文档 数据接口层
 */
public interface ISupplierFileDao {

    /* 添加文档信息 */
    Integer insertSupplier(SupplierFile supplierFile);

    /* 删除文档信息 */
    Integer deleteSupplier(Integer id);

    /* 查询文档信息 */
    List<SupplierFile> getSupplierFileList(SupplierFileCondition condition);

}
