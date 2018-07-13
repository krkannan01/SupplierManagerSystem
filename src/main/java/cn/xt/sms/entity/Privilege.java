package cn.xt.sms.entity;

import lombok.Data;

import java.util.List;

/**
 * 权限实体
 * @author xietao.x@qq.com
 * @date 2018/3/30
 */
@Data
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

}
