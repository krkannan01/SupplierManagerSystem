package cn.xt.sms.service;

import cn.xt.sms.response.DataResponse;
import cn.xt.sms.entity.Privilege;
import cn.xt.sms.entity.User;

import java.util.List;

/**
 * 用户信息业务接口类
 * @author xietao.x@qq.com
 * @date 2018/3/28
 */
public interface IUserService {

    /*获取所有用户信息*/
    DataResponse<User> getUserList(String keywords, Integer currentPage, Integer pageSize);

    /*删除用户信息*/
    String deleteUser(Integer id);

    /*多行删除用户信息*/
    String multiDeleteUser(String ids);

    /*查询所有权限信息*/
    List<Privilege> getPrivilege();

    /*查询用户权限信息*/
    List<Integer> getUserPrivilege(Integer id);

    /*修改用户权限信息*/
    String updateUserPrivilege(Integer id, String privilegeIds);

    /*添加用户信息*/
    String insertUser(User user);

    /*修改用户信息*/
    String updateUser(User user);

    /*修改用户关键信息*/
    String updateUserByAdmin(User user);

    /*根据Id获取用户信息*/
    User findUserById(Integer id);

    /*根据用户名修改用户头像数据*/
    void updateHeadUrl(String fileName, String user);

    /*根据用户名获取用户信息，除密码外*/
    User getUserByUsername(String username);

    /*修改用户在线状态*/
    String updateOnline(String username, Integer online);

    /*根据用户名修改用户密码*/
    String updatePassword(String username, String password);

    /*验证用户名与密码是否匹配*/
    boolean validatePassword(String username, String password);

}
