package cn.xt.sms.controller;

import cn.xt.sms.annotation.Log;
import cn.xt.sms.annotation.RestGetMapping;
import cn.xt.sms.annotation.RestPostMapping;
import cn.xt.sms.condition.LoginInfoCondition;
import cn.xt.sms.condition.OperLogCondition;
import cn.xt.sms.entity.LoginInfo;
import cn.xt.sms.entity.OperLog;
import cn.xt.sms.response.SimpleResponse;
import cn.xt.sms.response.TableDataResponse;
import cn.xt.sms.service.ILoginInfoService;
import cn.xt.sms.service.IOperLogService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 访问日志记录
 * @author ruoyi
 */
@Controller
@RequestMapping("/loginInfo")
public class LoginInfoController {

    @Autowired
    private ILoginInfoService loginInfoService;

    @RequiresPermissions("admin")
    @GetMapping("/toPage")
    public String toPage()
    {
        return "/login_info/wrap";
    }

    @RequiresPermissions("admin")
    @GetMapping()
    public String logininfo()
    {
        return "/login_info/list";
    }

    @RequiresPermissions("admin")
    @RestGetMapping("/list")
    public TableDataResponse list(LoginInfoCondition condition)
    {
        return loginInfoService.selectLoginInfoList(condition);
    }

    @RequiresPermissions("admin")
    @Log(title = "登录日志管理", action = "批量删除")
    @RestPostMapping("/batchRemove")
    public SimpleResponse batchRemove(@RequestParam("ids[]") Integer[] ids)
    {
        Integer affectedRowNumber = loginInfoService.batchDeleteLoginInfo(ids);
        return new SimpleResponse(affectedRowNumber);
    }

}
