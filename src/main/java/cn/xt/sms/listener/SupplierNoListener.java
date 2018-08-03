package cn.xt.sms.listener;

import cn.xt.sms.service.ISupplierService;
import cn.xt.sms.service.IProductService;
import cn.xt.sms.util.Render;
import lombok.extern.log4j.Log4j;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * @Auther: xietao
 * @Date: 2018/7/19
 * @Description:
 */
@Log4j
public class SupplierNoListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        // 应用初始化时执行
        log.info(Render.renderInfo("SupplierNoListener监听器正在初始化！"));
        // 获取应用上下文
        ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(servletContextEvent.getServletContext());
        // 拿到供应商service
        ISupplierService supplierService = (ISupplierService) applicationContext.getBean("supplierServiceImpl");
        IProductService productService = (IProductService) applicationContext.getBean("productServiceImpl");

        // 取出数据并放入 application 域中
        // 供应商编号
        String supplierMaxNo = supplierService.getMaxNo();
        try {
            supplierMaxNo = Integer.valueOf(supplierMaxNo) + 1 + "";
        } catch (NumberFormatException e) {
            log.error("初始化时 供应商编号转换失败！");
            throw e;
        }
        log.info(Render.renderInfo("本次启动查询到的最大供应商编号为：" + supplierMaxNo));
        servletContextEvent.getServletContext().setAttribute("supplierMaxNo", supplierMaxNo);
        // 商品编号
        String productMaxNo = productService.getMaxNo();
        try {
            productMaxNo = Integer.valueOf(productMaxNo) + 1 + "";
        } catch (NumberFormatException e) {
            log.error("初始化时 商品编号转换失败！");
            throw e;
        }
        log.info(Render.renderInfo("本次启动查询到的最大商品编号为：" + productMaxNo));
        servletContextEvent.getServletContext().setAttribute("productMaxNo", productMaxNo);
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {
        // 应用销毁时执行
        log.info(Render.renderInfo("SupplierNoListener监听器正在销毁！"));
    }

}
