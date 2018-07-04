package cn.xt.sms.entity;

import java.util.List;

/**
 * 权限实体
 * @author xietao.x@qq.com
 * @date 2018/3/30
 */
public class Privilege {
    private Integer id;//权限ID
    private String name;//权限名称
    private String url;//权限字符串
    private Integer parentId;//父权限ID
    private List<Privilege> childrens;//子权限集合

    public Privilege() {
    }

    public Privilege(Integer id, String name, String url, Integer parentId, List<Privilege> childrens) {
        this.id = id;
        this.name = name;
        this.url = url;
        this.parentId = parentId;
        this.childrens = childrens;
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

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public List<Privilege> getChildrens() {
        return childrens;
    }

    public void setChildrens(List<Privilege> childrens) {
        this.childrens = childrens;
    }

    @Override
    public String toString() {
        return "Privilege{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", url='" + url + '\'' +
                ", parentId=" + parentId +
                ", childrens=" + childrens +
                '}';
    }
}
