package cn.xt.sms.service;

import cn.xt.sms.entity.User;

/**
 * @author xietao.x@qq.com
 * @date 2018/3/12
 */
public interface ILoginService {
    String findPasswordByUsername(String username);
    String isUnique(String username);
    String register(User user);
}
