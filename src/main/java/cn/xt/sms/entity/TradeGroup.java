package cn.xt.sms.entity;

/**
 * 企业分组实体类
 * @author xietao.x@qq.com
 */
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

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    @Override
    public String toString() {
        return "TradeGroup{" +
                "name='" + name + '\'' +
                ", id=" + id +
                ", count=" + count +
                '}';
    }
}
