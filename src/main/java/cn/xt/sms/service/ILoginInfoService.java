package cn.xt.sms.service;

import cn.xt.sms.condition.LoginInfoCondition;
import cn.xt.sms.entity.LoginInfo;
import cn.xt.sms.response.TableDataResponse;

import java.util.List;

/**
 * 系统访问日志情况信息 服务层
 *
 * @author ruoyi
 * @modify xietao
 */
public interface ILoginInfoService
{

    /**
     * 新增系统登录日志
     *
     * @param loginInfo 访问日志对象
     */
    public Integer insertLoginInfo(LoginInfo loginInfo);

    /**
     * 查询系统登录日志集合
     *
     * @param condition 访问日志查询条件
     * @return 登录记录集合
     */
    public TableDataResponse selectLoginInfoList(LoginInfoCondition condition);

    /**
     * 批量删除系统登录日志
     *
     * @param ids 需要删除的数据
     * @return
     */
    public Integer batchDeleteLoginInfo(Integer[] ids);
}
