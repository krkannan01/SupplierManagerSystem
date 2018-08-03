package cn.xt.sms.controller;

import cn.xt.sms.util.Render;
import lombok.extern.log4j.Log4j;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * @Auther: xietao
 * @Date: 2018/7/23
 * @Description:
 */
@Log4j
@Controller
@RequestMapping("/skip")
public class SkipController {

    @RequestMapping("/product/add")
    public String toProductAdd(HttpServletRequest request) {
        return "product/add";
    }

}
