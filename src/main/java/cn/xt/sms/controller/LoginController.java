package cn.xt.sms.controller;

import cn.xt.sms.entity.User;
import cn.xt.sms.service.ILoginService;
import cn.xt.sms.service.IUserService;
import cn.xt.sms.util.CheckCodeUtil;
import cn.xt.sms.util.DeadlineUtil;
import cn.xt.sms.util.MD5Util;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import javax.imageio.ImageIO;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.Writer;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.TimeUnit;

/**
 * @author xietao.x@qq.com
 * @date 2018/3/11
 */
@Log4j
@Controller
@RequestMapping("/login")
public class LoginController {

    @Autowired
    private CheckCodeUtil checkCodeUtil;
    @Autowired
    private ILoginService loginService;
    @Autowired
    private IUserService userService;

    /*生成图片验证码*/
    @RequestMapping("/getImage")
    public void getImage(HttpServletRequest request,
                         HttpServletResponse response) throws IOException {
        // 禁止缓存
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "No-cache");
        response.setDateHeader("Expires", 0);
        //
        response.setContentType("image/jpeg");

        // String code = checkCodeService.generateRandomNumberCode();
        String code = checkCodeUtil.generateRandomMixedCode();
        //
        HttpSession session = request.getSession(true);
        session.setAttribute("checkCode", code);
        ImageIO.write(checkCodeUtil.getImage(code), "JPEG",
                response.getOutputStream());
    }

    /*查询cookie登陆*/
    @RequestMapping("/autoLogin")
    public String autoLogin(HttpServletRequest request, HttpServletResponse response) {
        String username_password = null;
        if(request.getCookies() !=null) {               // 如果Cookie不为空
            for(Cookie cookie : request.getCookies()) {  // 遍历Cookie
                if(cookie.getName().equals("username_password"))
                    username_password = cookie.getValue();       // 获取用户信息
            }
        }
        if (username_password != null) {
            //还原用户名密码
            String[] info = username_password.split("::");
            if (info.length == 3) {
                if (Boolean.valueOf(info[2])) {
                    User user = loginCommon(request, response, new HashMap<String, String>(), info[0].replaceAll(":;", ":"), info[1].replaceAll(":;", ":"));
                    if (user != null) {
                        return "index";
                    }
                }
            } else {
                log.error("Cookie info exception ...");
            }
        }
        return "login";
    }

    /*登录*/
    @RequestMapping("/login")
    @ResponseBody
    public Map login(@RequestParam("username") String username,@RequestParam("password") String password,
                        @RequestParam("check-code") String checkCode,
                        @RequestParam("remember-me") Boolean rememberMe,
                        HttpServletRequest request, HttpServletResponse response) {
        Map<String, String> map = new HashMap<String, String>();
        if (checkCode != null && checkCode.equalsIgnoreCase(request.getSession().getAttribute("checkCode").toString())) {
            String encryptPassword = MD5Util.EncoderByMd5(password);
            User user = loginCommon(request, response, map, username, encryptPassword);
            if (user != null) {
                /*存入cookie*/
                Cookie userCookie = new Cookie("username_password", username.replaceAll(":", ":;") + "::" + encryptPassword.replaceAll(":", ":;") + "::" + rememberMe);
                userCookie.setMaxAge(1296000);
                response.addCookie(userCookie);
            }
        } else {
            map.put("state", "error");
            map.put("info", "验证码不正确");
        }
        return map;
    }

    private User loginCommon(HttpServletRequest request, HttpServletResponse response, Map<String, String> map, String username, String password) {
        //获取当前用户对象，状态为“未认证”
        Subject subject = SecurityUtils.getSubject();
        AuthenticationToken token = new UsernamePasswordToken(username, password);
        try{
            subject.login(token);

            map.put("state", "success");
            map.put("info", "通过验证");

            User user = (User) subject.getPrincipal();//获取user对象

            /*存入session*/
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            /*修改用户状态为在线*/
            userService.updateOnline(username, 1);

            Timer timer = new Timer();

            //60s后执行一次，然后每60s查询一次是否存在在线情况信息
            timer.schedule(new TimerTask() {
                @Override
                public void run() {
                    /*如果用户信息已经过期*/
                    if (DeadlineUtil.expire(username)) {
                        timer.cancel();
                        /*修改最后在线时间*/
                        userService.updateOnline(username, 0);
                        /*销毁session*/
                        try {
                            session.invalidate();
                        } catch (IllegalStateException ise) {
                            log.warn(ise.getMessage());
                        }
                    }
                }
            }, 60000, 60000);

            return user;
        }catch(IncorrectCredentialsException e1){
            map.put("state", "error");
            map.put("info", "密码错误");
        }catch(UnknownAccountException e2){
            map.put("state", "error");
            map.put("info", "用户名或密码不正确");
        }catch(Exception e3) {
            map.put("state", "error");
            map.put("info", "未知错误");
        }
        return null;
    }

    /*维持在线的方法*/
    @RequestMapping(value = "/online", method = RequestMethod.POST)
    @ResponseBody
    public void online(HttpServletResponse response, HttpSession session) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        response.setContentType("text/html;charset=utf-8");
        //获取当前用户名
        String username = null;
        try {
            username = ((User) session.getAttribute("user")).getUsername();
        } catch (NullPointerException npe) {
            //TODO 捕获空指针并前往登录界面
            /*try {
                *//* 这句话比较重要，我们通过response给页面返回一个js脚本，让js执行父页面的对应的jsFun，参数就是我们的data *//*
                response.getWriter().write("<script type='text/javascript'>location.href = '${pageContext.request.contextPath}/';</script>");
                response.flushBuffer();
            } catch (Exception e) {
                log.error("Longconnection exception...");
            }*/
        }

        while (true) {
            DeadlineUtil.set(username, 90000L);
            try {
                /* 这句话比较重要，我们通过response给页面返回一个js脚本，让js执行父页面的对应的jsFun，参数就是我们的data */
                response.getWriter().write("Are you there ?");
                response.flushBuffer();
            } catch (Exception e) {
                log.info("The loginController -> online : long connection was broken!");
                break;
            }
            try {// 每60秒发送一次
                TimeUnit.SECONDS.sleep(60);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }

    /*注销登录*/
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        /*修改最后在线时间*/
        if (session != null) {
            try {
                String username = ((User) session.getAttribute("user")).getUsername();
                userService.updateOnline(username, 0);
            } catch (NullPointerException npe) {
                log.error(npe.getMessage());
            }
        }
        SecurityUtils.getSubject().logout();
        return "login";
    }

    /*转到index页面*/
    @RequestMapping("/toIndex")
    public String toIndex(HttpSession session) {
        if (session.getAttribute("user") == null) {
            return "login";
        }
        return "index";
    }

    /*查询用户名是否存在*/
    @RequestMapping("/isUnique")
    @ResponseBody
    public String isUnique(String username) {
        return loginService.isUnique(username);
    }

    /*注册*/
    @RequestMapping("/register")
    @ResponseBody
    public Map register(User user, HttpSession session) {
        Map<String, String> result = new HashMap<String, String>();
        try {
            Integer count = (Integer) session.getAttribute("count");
            if (count == null) count = 1;
            if (count > 2) {
                result.put("state", "disabled");
                result.put("info", "注册过于频繁,请退出浏览器后重试!");
                return result;
            } else {
                count++;
                session.setAttribute("count", count);
            }
        } catch (NumberFormatException nfe) {
            log.warn("注册次数验证失效");
        }
        user.setPassword(MD5Util.EncoderByMd5(user.getPassword()));
        String state = loginService.register(user);
        String info = user.getUsername();

        result.put("state", state);
        result.put("info", info);
        return result;
    }

    /*转到no-authority页面*/
    @RequestMapping("/toNoAuthority")
    public String toNoAuthority() {
        return "no-authority";
    }

}
