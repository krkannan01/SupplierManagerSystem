package cn.xt.sms.entity;

import lombok.Data;

import java.util.List;

/**
 * 材料分组实体
 * @author xietao.x@qq.com
 */
@Data
public class ProductGroup {

    private Integer id;//ID
    private String name;//材料分组名称
    private Integer count;//分组下的供应商数量
    private Integer parentId;//父分组ID
    private ProductGroup parent;//父分组
    private List<ProductGroup> children;//子分组集合

    public ProductGroup() {
    }

    public ProductGroup(String name) {
        this.name = name;
    }

    public ProductGroup(Integer id, String name, Integer parentId) {
        this.id = id;
        this.name = name;
        this.parentId = parentId;
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
