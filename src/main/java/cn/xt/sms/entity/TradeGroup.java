package cn.xt.sms.entity;

import lombok.Data;

/**
 * 企业分组实体类
 * @author xietao.x@qq.com
 */
@Data
public class TradeGroup {

    private Integer id;//ID
    private String name;//分组名称
    private Integer count;//分组包含企业数

    public TradeGroup() {
    }

    public TradeGroup(Integer id, String name, Integer count) {
        this.id = id;
        this.name = name;
        this.count = count;
    }

}
