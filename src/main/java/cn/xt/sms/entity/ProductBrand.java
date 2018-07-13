package cn.xt.sms.entity;

import lombok.Data;

/**
 * @author xietao.x@qq.com
 * @date 2018/4/28
 */
@Data
public class ProductBrand {

    private Integer id;
    private String name;
    private String groupId;

    public ProductBrand() {
    }

    public ProductBrand(String name) {
        this.name = name;
    }

}
