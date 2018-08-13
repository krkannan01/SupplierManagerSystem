package cn.xt.sms.util;

import cn.xt.sms.service.ISupplierService;
import cn.xt.sms.service.IProductService;
import lombok.extern.log4j.Log4j;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContext;

/**
 * @Auther: xietao
 * @Date: 2018/7/19
 * @Description: 生成编号的工具类
 */
@Log4j
public class NOUtil {

    /**
     * 生成供应商编号
     * @param context
     * @return
     */
    public static synchronized String getSupplierNo(ServletContext context) {
        String currentNo = context.getAttribute("supplierMaxNo").toString();
        try {
            context.setAttribute("supplierMaxNo", Integer.valueOf(currentNo) + 1);
        } catch (NumberFormatException e) {
            // 如果转换出现异常，重新获取数据库中的最大供应商编号
            log.error(Render.renderError("供应商编号获取异常，正在尝试从数据库中重新获取..."));
            ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(context);
            ISupplierService supplierService = (ISupplierService) applicationContext.getBean("supplierServiceImpl");
            String maxNo = supplierService.getMaxNo();
            currentNo = maxNo + 1;
            log.info(Render.renderInfo("获取到新的供应商编号，为：" + currentNo));
            try {
                context.setAttribute("supplierMaxNo", Integer.valueOf(currentNo) + 1);
            } catch (NumberFormatException e2) {
                log.error(Render.renderError("数据异常，请排除供应商编号字段中的非数字值！"));
            }
        }
        return currentNo;
    }

    /**
     * 生成产品编号
     * @param context
     * @return
     */
    public static synchronized String getProductNo(ServletContext context) {
        String currentNo = context.getAttribute("productMaxNo").toString();
        try {
            context.setAttribute("productMaxNo", Integer.valueOf(currentNo) + 1);
        } catch (NumberFormatException e) {
            // 如果转换出现异常，重新获取数据库中的最大供应商编号
            log.error(Render.renderError("商品编号获取异常，正在尝试从数据库中重新获取..."));
            ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(context);
            IProductService supplierService = (IProductService) applicationContext.getBean("productServiceImpl");
            String maxNo = supplierService.getMaxNo();
            currentNo = maxNo + 1;
            log.info(Render.renderInfo("获取到新的商品编号，为：" + currentNo));
            try {
                context.setAttribute("productMaxNo", Integer.valueOf(currentNo) + 1);
            } catch (NumberFormatException e2) {
                log.error(Render.renderError("数据异常，请排除商品编号字段中的非数字值！"));
            }
        }
        return currentNo;
    }

    public static void main(String[] args) {
        Integer.valueOf(null);
    }

}
