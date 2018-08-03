package cn.xt.sms.response;

import cn.xt.sms.enums.ResponseCode;
import lombok.Getter;
import lombok.Setter;

/**
 * @Auther: xietao
 * @Date: 2018/7/18
 * @Description: 简单的响应封装类
 */
@Getter
@Setter
public class SimpleResponse {

    private int code;

    private String msg;

    public SimpleResponse(ResponseCode code, String msg) {
        this.code = code.getCode();
        this.msg = msg;
    }

    public SimpleResponse(Integer affectedRowNumber) {
        if (affectedRowNumber > 0) {
            this.code = ResponseCode.SUCCESS.getCode();
            this.msg = "成功，共" + affectedRowNumber + "条数据受到影响！";
        } else {
            this.code = ResponseCode.ERROR.getCode();
            this.msg = "操作失败！";
        }
    }

}
