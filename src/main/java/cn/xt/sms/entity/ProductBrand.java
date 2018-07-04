package cn.xt.sms.entity;

/**
 * @author xietao.x@qq.com
 * @date 2018/4/28
 */
public class ProductBrand {

    private Integer id;
    private String name;
    private String groupId;

    public ProductBrand() {
    }

    public ProductBrand(String name) {
        this.name = name;
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

    public String getGroupId() {
        return groupId;
    }

    public void setGroupId(String groupId) {
        this.groupId = groupId;
    }

}
