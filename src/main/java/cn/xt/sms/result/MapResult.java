package cn.xt.sms.Result;

import java.io.Serializable;

/**
 * @author xietao.x@qq.com
 * @date 2018/5/4
 */
public class MapResult implements Serializable {

    private Object key;
    private Object value;

    public MapResult() {
    }

    public MapResult(Object key, Object value) {
        this.key = key;
        this.value = value;
    }

    public Object getKey() {
        return key;
    }

    public void setKey(Object key) {
        this.key = key;
    }

    public Object getValue() {
        return value;
    }

    public void setValue(Object value) {
        this.value = value;
    }

}
