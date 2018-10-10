package cn.xt.sms.controller;

import cn.xt.sms.annotation.RestGetMapping;
import cn.xt.sms.annotation.RestPostMapping;
import cn.xt.sms.condition.OperLogCondition;
import cn.xt.sms.constant.PrivilegeConstants;
import cn.xt.sms.entity.OperLog;
import cn.xt.sms.response.DataResponse;
import cn.xt.sms.response.SimpleResponse;
import cn.xt.sms.response.TableDataResponse;
import cn.xt.sms.service.IOperLogService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 操作日志记录
 * @author ruoyi
 */
@Controller
@RequestMapping("/operLog")
public class OperlogController {

    @Autowired
    private IOperLogService operLogService;

    @RequiresPermissions("admin")
    @GetMapping("/toPage")
    public String toPage()
    {
        return "oper_log/wrap";
    }

    @RequiresPermissions("admin")
    @GetMapping()
    public String operlog()
    {
        return "oper_log/list";
    }

    @RequiresPermissions("admin")
    @RestGetMapping("/list")
    public TableDataResponse list(OperLogCondition condition)
    {
        return operLogService.selectOperLogList(condition);
    }

    @RequiresPermissions("admin")
    @RestPostMapping("/batchRemove")
    public SimpleResponse batchRemove(@RequestParam("ids[]") Integer[] ids)
    {
        int rows = operLogService.batchDeleteOperLog(ids);
        return new SimpleResponse(rows);
    }

    @RequiresPermissions("admin")
    @GetMapping("/detail/{operId}")
    public String detail(@PathVariable("operId") Integer deptId, Model model)
    {
        OperLog operLog = operLogService.selectOperLogById(deptId);
        model.addAttribute("operLog", operLog);
        return "oper_log/detail";
    }

}
