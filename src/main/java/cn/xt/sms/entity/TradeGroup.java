package cn.xt.sms.entity;

import com.alibaba.fastjson.annotation.JSONField;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.commons.collections4.collection.TransformedCollection;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * 企业分组实体类
 * @author xietao.x@qq.com
 */
@Getter
@Setter
public class TradeGroup {

    private Integer id;//ID
    private String name;//分组名称
    private Integer count;//分组下供应商的数量
    @JSONField(serialize = false)
    private Integer parentId;//父分组ID
    @JSONField(serialize = false)
    private TradeGroup parent;//父分组
    private List<TradeGroup> children;//分组的子集

    public TradeGroup() {
    }

    public TradeGroup(Integer id, String name, Integer parentId) {
        this.id = id;
        this.name = name;
        this.parentId = parentId;
    }

    public void setChildren(List<TradeGroup> children) {
        this.children = children;
        if (children != null && children.size() > 0) {
            children.stream().forEach(child -> {
                while (child.getParent() != null && child.getParent().getCount() != null) {
                    child.getParent().setCount(child.getParent().getCount() + child.getCount());
                    child = child.getParent();
                }
            });
        }
    }

    public String toString(String prefix) {
        String newPrefix = prefix + "\t";
        StringBuilder buffer = new StringBuilder(prefix + "{\n");
        buffer.append(newPrefix + "\"id\": " + id + ",\n");
        buffer.append(newPrefix + "\"name\": " + name + ",\n");
        buffer.append(newPrefix + "\"count\": " + count + ",\n");
        buffer.append(newPrefix + "\"parentId\": " + parentId + ",\n");
        /*if (parent != null) {
            buffer.append(newPrefix + "\"parent\": \n" + parent.toString(newPrefix) + ",\n");
        } else {
            buffer.append(newPrefix + "\"parent\": null,\n");
        }*/
        if (children != null && children.size() > 0) {
            buffer.append(newPrefix + "\"children\": \n");
            buffer.append(newPrefix + "[\n");
            for (TradeGroup tradeGroup: children) {
                buffer.append(tradeGroup.toString(newPrefix + "\t"));
                buffer.append(",\n");
            }
            buffer.delete(buffer.length() - 2, buffer.length() - 1);
            buffer.append(newPrefix + "]\n");
        } else {
            buffer.append(newPrefix +"\"children\": null,\n");
        }
        if (buffer.charAt(buffer.length() - 2) == ',') buffer = buffer.delete(buffer.length() - 2, buffer.length() - 1);
        buffer.append(prefix + "}");
        String result = buffer.toString();
        return buffer.toString();
    }

    public static void main(String[] args) {
        for (int i = 0; i < 30; i++) {
            TradeGroup tradeGroup = new TradeGroup();
            tradeGroup.setId(1);
            tradeGroup.setName("测试");
            tradeGroup.setCount(4);
            tradeGroup.setParent(new TradeGroup(2, null, null));
            tradeGroup.setParentId(2);
            tradeGroup.setChildren(Arrays.asList(new TradeGroup(3, null, null), new TradeGroup(4, null, null)));
            System.out.println(tradeGroup.toString(""));
        }
    }

}
