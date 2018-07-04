package cn.xt.sms.service.impl;

import cn.xt.sms.Result.MyResult;
import cn.xt.sms.dao.IUserDao;
import cn.xt.sms.entity.Enterprise;
import cn.xt.sms.entity.Privilege;
import cn.xt.sms.entity.User;
import cn.xt.sms.service.IPrivilegeService;
import cn.xt.sms.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.NumberFormat;
import java.util.List;

/**
 * @author xietao.x@qq.com
 * @date 2018/3/28
 */
@Service
public class UserServiceImpl implements IUserService {

    @Autowired
    private IUserDao userDao;
    @Autowired
    private IPrivilegeService privilegeService;

    /*获取所有用户信息，除超级管理员外*/
    @Override
    public MyResult<User> getUserList(String keywords, Integer currentPage, Integer pageSize) {
        Integer offset = null;
        /*计算偏移量*/
        if (currentPage != null && pageSize != null) {
            offset = (currentPage - 1) * pageSize;
            if (offset < 0) {
                offset = 0;
            }
        }
        MyResult<User> userResult = new MyResult<User>();
        Integer count = userDao.selectUserCount(keywords);

        /*判断偏移量是否超过总数，如果是，降低偏移量*/
        if (offset >= count) {
            offset = (count-1)/pageSize*pageSize;
        }

        List<User> userList = userDao.selectUserList(pageSize, offset, keywords);
        if (userList != null && count != null) {
            userResult.setMsg("success");
            userResult.setCount(count);
            userResult.setRows(userList);
        } else {
            userResult.setMsg("error");
        }
        return userResult;
    }

    @Override
    @Transactional
    public String deleteUser(Integer id) {
        /*1:删除用户在用户权限表中的数据*/
        String result = privilegeService.deleteUserPrivilege(id);
        /*2:删除用户数据*/
        Integer result2 = userDao.deleteUser(id);
        return (result == "success" && result2 > 0) ? "success":"fail";
    }

    @Override
    @Transactional
    public String multiDeleteUser(String ids) {
        String[] temp = ids.split(",");
        Integer id = null;
        for (int i=0; i<temp.length; i++) {
            try {
                id = Integer.valueOf(temp[i]);
                deleteUser(id);
            } catch(NumberFormatException nfe) {
                continue;
            }
        }
        return "success";
    }

    @Override
    public List<Privilege> getPrivilege() {
        return privilegeService.getAllPrivilege();
    }

    @Override
    public List<Integer> getUserPrivilege(Integer id) {
        return privilegeService.getUserPrivilege(id);
    }

    @Override
    @Transactional
    public String updateUserPrivilege(Integer id, String privilegeIds) {
        if (privilegeIds == null) return "fail";
        List<Integer> ids = privilegeService.getUserPrivilege(id);

        String[] pids = privilegeIds.split(",");

        for (String pid: pids) {
            Integer i = null;
            try {
                i = Integer.valueOf(pid);
            } catch (NumberFormatException nfe) {
                continue;
            }
            if (ids.contains(i)) {
                /*删除取消的权限*/
                privilegeService.deleteUserPrivilege(id, i);
            } else {
                /*添加新增的权限*/
                privilegeService.insertUserPrivilege(id, i);
            }
        }
        return "success";
    }

    @Override
    public String insertUser(User user) {
        return userDao.insertUser(user) > 0 ? "success":"fail";
    }

    @Override
    public String updateUser(User user) {
        return userDao.updateUser(user) > 0 ? "success":"fail";
    }

    @Override
    public String updateUserByAdmin(User user) {
        return userDao.updateUserByAdmin(user) > 0 ? "success":"fail";
    }

    @Override
    public User findUserById(Integer id) {
        return userDao.findUserById(id);
    }

    @Override
    public void updateHeadUrl(String fileName, String user) {
        userDao.updateHeadUrl(fileName, user);
    }

    @Override
    public User getUserByUsername(String username) {
        return userDao.getUserByUsername(username);
    }

    @Override
    public String updateOnline(String username, Integer online) {
        return userDao.updateOnline(username, online) > 0 ? "success":"fail";
    }

    @Override
    public String updatePassword(String username, String password) {
        return userDao.updatePassword(username, password) > 0 ? "success":"fail";
    }

    @Override
    public boolean validatePassword(String username, String password) {
        return password.equals(userDao.findUserByUsername(username).getPassword());
    }

}
