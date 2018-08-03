package cn.xt.sms.dto;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

/**
 * @author xietao.x@qq.com
 * @date 2018/5/4
 */
@Getter
@Setter
public class MapDTO implements Serializable {

    private Object key;
    private Object value;

    public MapDTO() {
    }

    public MapDTO(Object key, Object value) {
        this.key = key;
        this.value = value;
    }

}
