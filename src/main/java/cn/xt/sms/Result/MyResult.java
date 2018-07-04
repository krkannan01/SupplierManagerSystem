package cn.xt.sms.Result;

import cn.xt.sms.entity.Enterprise;

import java.util.List;

/**
 * @author xietao.x@qq.com
 * @date 2018/3/13
 */
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

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public List<T> getRows() {
        return rows;
    }

    public void setRows(List<T> rows) {
        this.rows = rows;
    }

    @Override
    public String toString() {
        return "MyResult{" +
                ", msg='" + msg + '\'' +
                ", count=" + count +
                ", rows=" + rows +
                '}';
    }
}
