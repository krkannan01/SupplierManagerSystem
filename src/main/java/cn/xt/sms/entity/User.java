package cn.xt.sms.entity;

import com.alibaba.fastjson.annotation.JSONField;
import lombok.Data;

import java.util.Date;

/**
 * 用户实体
 * @author xietao.x@qq.com
 */
@Data
public class User {

    private Integer id;//ID
    private String username;//用户名
    private String password;//密码
    private String realName;//真实姓名
    private String phoneNumber;//联系电话
    private Integer isSu;//是否为超级管理员
    private String level;//用户级别

    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date lastOnlineTime;//最后在线时间
    private Integer state;//用户状态  1:已启用  0:已停用

    @JSONField(format = "yyyy-MM-dd")
    private Date birthday;//出生日期
    private String location;//位置

    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;//创建时间
    private String aboutMe;//关于我
    private Integer online;//是否在线
    private String headImg;//头像图片路径

    public User() {
    }

    public User(Integer id, String username, String password, String realName, String phoneNumber, Integer isSu,
                String level, Date lastOnlineTime, Integer state, Date birthday, String location, Date createTime,
                String aboutMe, Integer online, String headImg) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.realName = realName;
        this.phoneNumber = phoneNumber;
        this.isSu = isSu;
        this.level = level;
        this.lastOnlineTime = lastOnlineTime;
        this.state = state;
        this.birthday = birthday;
        this.location = location;
        this.createTime = createTime;
        this.aboutMe = aboutMe;
        this.online = online;
        this.headImg = headImg;
    }

}
