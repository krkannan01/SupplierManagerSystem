package cn.xt.sms.entity;

import com.alibaba.fastjson.annotation.JSONField;

import java.util.Date;

/**
 * 用户实体
 * @author xietao.x@qq.com
 */
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

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public Date getLastOnlineTime() {
        return lastOnlineTime;
    }

    public void setLastOnlineTime(Date lastOnlineTime) {
        this.lastOnlineTime = lastOnlineTime;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getAboutMe() {
        return aboutMe;
    }

    public void setAboutMe(String aboutMe) {
        this.aboutMe = aboutMe;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Integer getIsSu() {
        return isSu;
    }

    public void setIsSu(Integer isSu) {
        this.isSu = isSu;
    }

    public Integer getOnline() {
        return online;
    }

    public void setOnline(Integer online) {
        this.online = online;
    }

    public String getHeadImg() {
        return headImg;
    }

    public void setHeadImg(String headImg) {
        this.headImg = headImg;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", realName='" + realName + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", isSu=" + isSu +
                ", level='" + level + '\'' +
                ", lastOnlineTime=" + lastOnlineTime +
                ", state=" + state +
                ", birthday=" + birthday +
                ", location='" + location + '\'' +
                ", createTime=" + createTime +
                ", aboutMe='" + aboutMe + '\'' +
                ", online=" + online +
                ", headImg='" + headImg + '\'' +
                '}';
    }
}
