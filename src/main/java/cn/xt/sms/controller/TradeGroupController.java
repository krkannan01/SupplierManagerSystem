package cn.xt.sms.controller;

import cn.xt.sms.entity.TradeGroup;
import cn.xt.sms.service.ITradeGroupService;
import jdk.nashorn.internal.ir.RuntimeNode;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * 企业分组控制层
 * @author xietao.x@qq.com
 * @date 2018/3/20
 */
@Controller
@RequestMapping("/tradeGroup")
public class TradeGroupController {

    @Autowired
    private ITradeGroupService tradeGroupService;

    @RequiresPermissions(value = {"admin","insertTradeGroup"},logical = Logical.OR)
    @RequestMapping(value="/insert", method = RequestMethod.POST)
    @ResponseBody
    public String insert(TradeGroup tradeGroup) {
        return tradeGroupService.insert(tradeGroup);
    }

    @RequiresPermissions(value = {"admin","updateTradeGroup"},logical = Logical.OR)
    @RequestMapping(value="/update", method = RequestMethod.POST)
    @ResponseBody
    public String update(TradeGroup tradeGroup) {
        return tradeGroupService.update(tradeGroup);
    }

    @RequiresPermissions(value = {"admin","deleteTradeGroup"},logical = Logical.OR)
    @RequestMapping(value="/delete", method = RequestMethod.POST)
    @ResponseBody
    public String delete(Integer id) {
        return tradeGroupService.delete(id);
    }

    @RequiresPermissions(value = {"admin","searchTradeGroup"},logical = Logical.OR)
    @RequestMapping("/toTradeGroup")
    public String toTradeGroup(HttpSession session) {
        if (session.getAttribute("user") != null) {
            return "trade_group";
        }
        return "login";
    }

}
