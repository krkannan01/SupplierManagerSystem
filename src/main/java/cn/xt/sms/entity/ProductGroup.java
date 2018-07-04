package cn.xt.sms.entity;

import java.util.List;

/**
 * 材料分组实体
 * @author xietao.x@qq.com
 */
public class ProductGroup {

    private Integer id;//ID
    private String name;//材料分组名称
    private Integer parentId;//父分组ID
    private List<ProductGroup> children;//子分组集合

    public ProductGroup() {
    }

    public ProductGroup(String name) {
        this.name = name;
    }

    public ProductGroup(Integer id, String name, Integer parentId, List<ProductGroup> children) {
        this.id = id;
        this.name = name;
        this.parentId = parentId;
        this.children = children;
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

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public List<ProductGroup> getChildren() {
        return children;
    }

    public void setChildren(List<ProductGroup> children) {
        this.children = children;
    }

    public String toString(String prefix) {
        String newPrefix = prefix + "\t";
        StringBuffer buffer = new StringBuffer("ProductGroup{");
        buffer.append("id => " + id + ",");
        buffer.append("name => " + name + ",");
        buffer.append("parentId => " + parentId + ",");
        if (children != null && children.size() > 0) {
            for (ProductGroup productGroup:children) {
                buffer.append("\n" + newPrefix + "children => " + productGroup.toString(newPrefix));
            }
            buffer.append("\n" + prefix + "}");
        } else {
            buffer.append("\n" + newPrefix +"children => " + children + "\n" + prefix + "}");
        }
        return buffer.toString();
    }

}
