package cn.xt.sms.service.impl;

import cn.xt.sms.dao.IPrivilegeDao;
import cn.xt.sms.entity.Privilege;
import cn.xt.sms.service.IPrivilegeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author xietao.x@qq.com
 * @date 2018/3/28
 */
@Service
public class PrivilegeServiceImpl implements IPrivilegeService {

    @Autowired
    private IPrivilegeDao privilegeDao;

    @Override
    public List<String> getPrivilegeList(Integer userId) {
        return privilegeDao.getPrivilegeList(userId);
    }

    @Override
    public String deleteUserPrivilege(Integer userId) {
        privilegeDao.deleteUserPrivilege(userId, null);
        return "success";
    }

    @Override
    public List<Privilege> getAllPrivilege() {
        return privilegeDao.getAllPrivilege();
    }

    @Override
    public List<Integer> getUserPrivilege(Integer userId) {
        return privilegeDao.getUserPrivilege(userId);
    }

    @Override
    public String insertUserPrivilege(Integer userId, Integer privilegeId) {
        return privilegeDao.insertUserPrivilege(userId, privilegeId) > 0 ? "success":"fail";
    }

    @Override
    public String deleteUserPrivilege(Integer userId, Integer privilegeId) {
        return privilegeDao.deleteUserPrivilege(userId, privilegeId) > 0 ? "success":"fail";
    }

}
