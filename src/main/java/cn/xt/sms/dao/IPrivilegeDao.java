package cn.xt.sms.dao;

import cn.xt.sms.entity.Privilege;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author xietao.x@qq.com
 * @date 2018/3/28
 */
public interface IPrivilegeDao {

    /*获取权限*/
    List<String> getPrivilegeList(Integer userId);

    /*获取所有权限信息*/
    List<Privilege> getAllPrivilege();

    /*获取用户权限信息*/
    List<Integer> getUserPrivilege(Integer userId);

    /*添加用户权限数据*/
    Integer insertUserPrivilege(@Param("userId") Integer userId, @Param("privilegeId") Integer privilegeId);

    /*删除用户权限信息 privilegeId不为空*/
    /*删除用户权限表中的数据 privilegeId为空*/
    Integer deleteUserPrivilege(@Param("userId") Integer userId, @Param("privilegeId") Integer privilegeId);

}
