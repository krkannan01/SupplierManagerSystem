package cn.xt.sms.service.impl;

import cn.xt.sms.condition.LoginInfoCondition;
import cn.xt.sms.dao.ILoginInfoDao;
import cn.xt.sms.dao.IOperLogDao;
import cn.xt.sms.entity.LoginInfo;
import cn.xt.sms.entity.OperLog;
import cn.xt.sms.response.TableDataResponse;
import cn.xt.sms.service.ILoginInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Auther: xietao
 * @Date: 2018/8/15
 * @Description:
 */
@Service
public class LoginInfoServiceImpl implements ILoginInfoService {

    @Autowired
    private ILoginInfoDao loginInfoDao;

    @Override
    public Integer insertLoginInfo(LoginInfo loginInfo) {
        return loginInfoDao.insertLoginInfo(loginInfo);
    }

    @Override
    public TableDataResponse selectLoginInfoList(LoginInfoCondition condition) {
        Integer count = loginInfoDao.selectLoginInfoCount(condition);
        List<LoginInfo> loginInfoList = loginInfoDao.selectLoginInfoList(condition);
        return new TableDataResponse(loginInfoList, count);
    }

    @Override
    public Integer batchDeleteLoginInfo(Integer[] ids) {
        return loginInfoDao.batchDeleteLoginInfo(ids);
    }
}
