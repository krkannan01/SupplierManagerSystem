package cn.xt.sms.dao;

import cn.xt.sms.condition.LoginInfoCondition;
import cn.xt.sms.condition.OperLogCondition;
import cn.xt.sms.entity.LoginInfo;
import cn.xt.sms.entity.OperLog;

import java.util.List;

/**
 * 操作日志 数据层
 * 
 * @author ruoyi
 * @modify xietao
 */
public interface ILoginInfoDao
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
    public List<LoginInfo> selectLoginInfoList(LoginInfoCondition condition);
    /* 查询数量. */
    public Integer selectLoginInfoCount(LoginInfoCondition condition);

    /**
     * 批量删除系统登录日志
     *
     * @param ids 需要删除的数据
     * @return
     */
    public int batchDeleteLoginInfo(Integer[] ids);
}
