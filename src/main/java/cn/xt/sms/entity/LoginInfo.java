package cn.xt.sms.entity;

import com.alibaba.fastjson.annotation.JSONField;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @Auther: xietao
 * @Date: 2018/8/15
 * @Description:
 */
@Data
public class LoginInfo implements Serializable {

    private static final long serialVersionUID = -4216143454274958516L;

    /** ID */
    private Integer infoId;
    /** 用户账号 */
    private String loginName;
    /** 登录状态 0成功 1失败 */
    private String status;
    /** 登录IP地址 */
    private String ipaddr;
    /** 浏览器类型 */
    private String browser;
    /** 操作系统 */
    private String os;
    /** 提示消息 */
    private String msg;
    /** 访问时间 */
    @JSONField(format = "yyyy-MM-dd hh:mm:ss")
    private Date loginTime;

}
