package cn.xt.sms.service.impl;

import cn.xt.sms.condition.OperLogCondition;
import cn.xt.sms.dao.IOperLogDao;
import cn.xt.sms.entity.OperLog;
import cn.xt.sms.response.TableDataResponse;
import cn.xt.sms.service.IOperLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 操作日志 服务层处理
 * 
 * @author ruoyi
 */
@Service
public class OperLogServiceImpl implements IOperLogService
{
    @Autowired
    private IOperLogDao operLogDao;

    /**
     * 新增操作日志
     * 
     * @param operLog 操作日志对象
     */
    @Override
    public void insertOperlog(OperLog operLog)
    {
        operLogDao.insertOperlog(operLog);
    }

    /**
     * 查询系统操作日志集合
     * 
     * @param condition 操作日志查询条件
     * @return 操作日志集合
     */
    @Override
    public TableDataResponse selectOperLogList(OperLogCondition condition)
    {
        Integer count = operLogDao.selectOperLogCount(condition);
        List<OperLog> operLogList = operLogDao.selectOperLogList(condition);
        return new TableDataResponse(operLogList, count);
    }

    /**
     * 批量删除系统操作日志
     * 
     * @param ids 需要删除的数据
     * @return
     */
    @Override
    public int batchDeleteOperLog(Integer[] ids)
    {
        return operLogDao.batchDeleteOperLog(ids);
    }

    /**
     * 查询操作日志详细
     * 
     * @param operId 操作ID
     * @return 操作日志对象
     */
    @Override
    public OperLog selectOperLogById(Integer operId)
    {
        return operLogDao.selectOperLogById(operId);
    }
}
