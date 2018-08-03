package cn.xt.sms.response;

import cn.xt.sms.enums.ResponseCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.poi.ss.formula.functions.T;

import java.util.List;

/**
 * @author xietao.x@qq.com
 * @date 2018/3/13
 */
@Getter
@Setter
@ToString
public class DataResponse<E> {
    private int code;
    private String msg;
    private int count;
    private List<E> rows;

    public DataResponse() {
    }

    public DataResponse(ResponseCode code, String msg, int count, List<E> rows) {
        this.code = code.getCode();
        this.msg = msg;
        this.count = count;
        this.rows = rows;
    }

    public DataResponse<E> setSuccess(List<E> rows, Integer count) { return setSuccess("操作成功！", rows, count); }
    public DataResponse<E> setSuccess(String msg, List<E> rows, Integer count) {
        if (rows == null && count == null)
            return setError();
        this.code = ResponseCode.SUCCESS.getCode();
        this.msg = msg;
        this.count = count;
        this.rows = rows;
        return this;
    }

    public DataResponse<E> setError() { return setError("操作失败！"); }
    public DataResponse<E> setError(String msg) {
        this.code = ResponseCode.ERROR.getCode();
        this.msg = msg;
        return this;
    }

}
