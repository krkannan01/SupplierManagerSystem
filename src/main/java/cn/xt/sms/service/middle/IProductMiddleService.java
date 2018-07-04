package cn.xt.sms.service.middle;

import cn.xt.sms.Condition.ProductCondition;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

/**
 * @author xietao.x@qq.com
 * @date 2018/5/6
 */
public interface IProductMiddleService {

    /*读取材料信息Excel文档并批量插入*/
    String getProductFormExcel(Sheet sheet);

    /*读取数据并到处Excel*/
    void setProductToExcel(Workbook wb, Integer start, Integer end, ProductCondition productCondition);

    /*批量删除*/
    String multiDeleteProduct(String ids);

}
