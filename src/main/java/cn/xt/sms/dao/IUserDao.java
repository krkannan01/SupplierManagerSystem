package cn.xt.sms.dao;

import cn.xt.sms.entity.User;
import com.sun.javafx.scene.control.skin.IntegerFieldSkin;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

/**
 * @author xietao.x@qq.com
 * @date 2018/3/12
 */
public interface IUserDao {

    /*验证用户*/
    User findUserByUsername(String username);

    /*根据id获取用户信息*/
    User findUserById(Integer id);

    /*验证用户名是否唯一*/
    Integer unique(String username);

    /*注册用户*/
    Integer register(User user);

    /*查询角色*/
    String getRole(Integer userId);

    /*查询所有用户数量*/
    Integer selectUserCount(@Param("keywords") String keywords);

    /*查询所有用户信息*/
    List<User> selectUserList(@Param("pageSize") Integer pageSize, @Param("offset") Integer offset, @Param("keywords") String keywords);

    /*删除用户信息*/
    Integer deleteUser(Integer id);

    /*添加用户信息*/
    Integer insertUser(User user);

    /*修改用户基本信息*/
    Integer updateUser(User user);

    /*修改用户敏感数据 只允许管理员用户调用*/
    Integer updateUserByAdmin(User user);

    /*修改用户在线状态 0:下线  1:在线*/
    Integer updateOnline(@Param("username") String username, @Param("online") Integer online);

    /*修改用户头像信息*/
    Integer updateHeadUrl(@Param("fileName") String fileName, @Param("username") String username);

    /*根据用户名获取用户信息,不包含密码*/
    User getUserByUsername(String username);

    /*修改用户密码*/
    Integer updatePassword(@Param("username") String username, @Param("password") String password);

}
