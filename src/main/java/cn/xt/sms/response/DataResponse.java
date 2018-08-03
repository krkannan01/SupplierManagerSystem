package cn.xt.sms.result;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

/**
 * @author xietao.x@qq.com
 * @date 2018/3/13
 */
@Getter
@Setter
@ToString
public class MyResult<T> {
    private String msg;
    private Integer count;
    private List<T> rows;

    public MyResult() {
    }

    public MyResult(String msg, Integer count, List<T> rows) {
        this.msg = msg;
        this.count = count;
        this.rows = rows;
    }

}
