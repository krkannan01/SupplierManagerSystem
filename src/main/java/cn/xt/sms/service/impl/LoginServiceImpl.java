package cn.xt.sms.service.impl;

import cn.xt.sms.dao.IUserDao;
import cn.xt.sms.entity.User;
import cn.xt.sms.service.ILoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author xietao.x@qq.com
 * @date 2018/3/12
 */
@Service
public class LoginServiceImpl implements ILoginService {

    @Autowired
    private IUserDao userDao;

    @Override
    public String findPasswordByUsername(String username) {
        User user = userDao.findUserByUsername(username);
        if (user != null) {
            return user.getPassword();
        }
        return null;
    }

    @Override
    public String isUnique(String username) {
        return userDao.unique(username) > 0 ? "true":"false";
    }

    @Override
    public String register(User user) {
        return userDao.register(user) > 0 ? "success":"error";
    }

}
