package cn.xt.sms.util;

import cn.xt.sms.constant.CommonConstants;
import cn.xt.sms.entity.LoginInfo;
import cn.xt.sms.service.impl.LoginInfoServiceImpl;
import cn.xt.sms.util.security.ShiroUtils;
import cn.xt.sms.util.spring.SpringUtils;
import eu.bitwalker.useragentutils.UserAgent;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 记录用户日志信息
 * 
 * @author ruoyi
 */
public class SystemLogUtils
{

    private static final Logger sys_user_logger = LoggerFactory.getLogger("sys-user");

    /**
     * 记录格式 [ip][用户名][操作][错误消息]
     * <p/>
     * 注意操作如下： loginError 登录失败 loginSuccess 登录成功 passwordError 密码错误 changePassword 修改密码 changeStatus 修改状态
     *
     * @param username
     * @param op
     * @param msg
     * @param args
     */
    public static void log(String username, String status, String msg, Object... args)
    {
        StringBuilder s = new StringBuilder();
        s.append(LogUtils.getBlock(ShiroUtils.getIp()));
        s.append(LogUtils.getBlock(username));
        s.append(LogUtils.getBlock(status));
        s.append(LogUtils.getBlock(msg));

        sys_user_logger.info(s.toString(), args);

        if (CommonConstants.LOGIN_SUCCESS.equals(status) || CommonConstants.LOGOUT.equals(status))
        {
            saveOpLog(username, msg, CommonConstants.SUCCESS);
        }
        else if (CommonConstants.LOGIN_FAIL.equals(status))
        {
            saveOpLog(username, msg, CommonConstants.FAIL);
        }
    }

    public static void saveOpLog(String username, String message, String status)
    {
        UserAgent userAgent = UserAgent.parseUserAgentString(ServletUtils.getRequest().getHeader("User-Agent"));
        // 获取客户端操作系统
        String os = userAgent.getOperatingSystem().getName();
        // 获取客户端浏览器
        String browser = userAgent.getBrowser().getName();
        LoginInfoServiceImpl loginInfoService = SpringUtils.getBean(LoginInfoServiceImpl.class);
        LoginInfo loginInfo = new LoginInfo();
        loginInfo.setLoginName(username);
        loginInfo.setStatus(status);
        loginInfo.setIpaddr(ShiroUtils.getIp());
        loginInfo.setBrowser(browser);
        loginInfo.setOs(os);
        loginInfo.setMsg(message);
        loginInfoService.insertLoginInfo(loginInfo);
    }
}
