package cn.xt.sms.service;

import cn.xt.sms.entity.Privilege;

import java.util.List;

/**
 * @author xietao.x@qq.com
 * @date 2018/3/28
 */
public interface IPrivilegeService {

    /*获取用户所有权限*/
    List<String> getPrivilegeList(Integer userId);

    /*删除用户所有权限*/
    String deleteUserPrivilege(Integer userId);

    /*获取所有权限信息*/
    List<Privilege> getAllPrivilege();

    /*获取用户权限信息*/
    List<Integer> getUserPrivilege(Integer userId);

    /*添加用户权限数据*/
    String insertUserPrivilege(Integer userId, Integer privilegeId);

    /*删除用户权限数据*/
    String deleteUserPrivilege(Integer userId, Integer privilegeId);

}
