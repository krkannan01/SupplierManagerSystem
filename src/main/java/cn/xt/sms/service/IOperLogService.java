package cn.xt.sms.service;

import cn.xt.sms.condition.OperLogCondition;
import cn.xt.sms.entity.OperLog;
import cn.xt.sms.response.TableDataResponse;

import java.util.List;

/**
 * 操作日志 服务层
 * 
 * @author ruoyi
 */
public interface IOperLogService
{
    /**
     * 新增操作日志
     * 
     * @param operLog 操作日志对象
     */
    public void insertOperlog(OperLog operLog);

    /**
     * 查询系统操作日志集合
     * 
     * @param operLog 操作日志对象
     * @return 操作日志集合
     */
    public TableDataResponse selectOperLogList(OperLogCondition condition);

    /**
     * 批量删除系统操作日志
     * 
     * @param ids 需要删除的数据
     * @return 结果
     */
    public int batchDeleteOperLog(Integer[] ids);

    /**
     * 查询操作日志详细
     * 
     * @param operId 操作ID
     * @return 操作日志对象
     */
    public OperLog selectOperLogById(Integer operId);
}
