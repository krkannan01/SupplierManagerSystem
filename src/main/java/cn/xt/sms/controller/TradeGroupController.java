package cn.xt.sms.controller;

import cn.xt.sms.annotation.RestPostMapping;
import cn.xt.sms.constant.PrivilegeConstants;
import cn.xt.sms.entity.TradeGroup;
import cn.xt.sms.enums.ResponseCode;
import cn.xt.sms.response.SimpleResponse;
import cn.xt.sms.service.ITradeGroupService;
import cn.xt.sms.util.BasicUtil;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 企业分组控制层
 * @author xietao.x@qq.com
 * @date 2018/3/20
 */
@Controller
@RequestMapping("/tradeGroup")
public class TradeGroupController {

    private final String privilege_prefix = PrivilegeConstants.SUPPLIER_GROUP;

    @Autowired
    private ITradeGroupService tradeGroupService;

    @RequiresPermissions(value = {"admin", privilege_prefix + ":insert"},logical = Logical.OR)
    @RestPostMapping("/insert")
    public SimpleResponse insert(TradeGroup tradeGroup) {
        Integer affectedRowNumber = tradeGroupService.insert(tradeGroup);
        return new SimpleResponse(affectedRowNumber);
    }

    @RequiresPermissions(value = {"admin", privilege_prefix + ":update"},logical = Logical.OR)
    @RestPostMapping("/update")
    public SimpleResponse update(TradeGroup tradeGroup) {
        Integer affectedRowNumber = tradeGroupService.update(tradeGroup);
        return new SimpleResponse(affectedRowNumber);
    }

    @RequiresPermissions(value = {"admin", privilege_prefix + ":delete"},logical = Logical.OR)
    @RestPostMapping("/delete")
    public SimpleResponse delete(Integer id) {
        Integer affectedRowNumber = tradeGroupService.delete(id);
        return new SimpleResponse(affectedRowNumber);
    }

    @RequiresPermissions(value = {"admin", privilege_prefix + ":delete"},logical = Logical.OR)
    @RestPostMapping("/multiDelete")
    public SimpleResponse multiDelete(String ids) {
        List<Integer> list = BasicUtil.convertIntegers(ids);
        Integer affectedRowNumber = tradeGroupService.multiDelete(list);
        if (affectedRowNumber > 0 && affectedRowNumber == list.size())
            return new SimpleResponse(ResponseCode.SUCCESS, "操作成功，共" + affectedRowNumber + "条记录受到影响！");
        else if (affectedRowNumber == 0)
            return new SimpleResponse(ResponseCode.ERROR, "操作失败！");
        else
            return new SimpleResponse(ResponseCode.SUCCESS, "部分操作成功，共" + affectedRowNumber + "条记录操作成功，" + (list.size() - affectedRowNumber) + "操作失败！");
    }

    @RequiresPermissions(value = {"admin", privilege_prefix + ":search"},logical = Logical.OR)
    @RequestMapping("/toTradeGroup")
    public String toTradeGroup(HttpSession session) {
        if (session.getAttribute("user") != null) {
            return "supplier_group/trade_group";
        }
        return "login";
    }

}
