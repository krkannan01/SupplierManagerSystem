package cn.xt.sms.service.middle;

import cn.xt.sms.condition.ProductCondition;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

import javax.servlet.ServletContext;

/**
 * @author xietao.x@qq.com
 * @date 2018/5/6
 */
public interface IProductMiddleService {

    /*读取材料信息Excel文档并批量插入*/
    String getProductFormExcel(ServletContext context, Sheet sheet);

    /*读取数据并到处Excel*/
    void setProductToExcel(Workbook wb, Integer start, Integer end, ProductCondition productCondition);

    /*批量删除*/
    Integer multiDeleteProduct(String ids);

}
