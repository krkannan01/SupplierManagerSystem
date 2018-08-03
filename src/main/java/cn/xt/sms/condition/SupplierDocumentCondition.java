package cn.xt.sms.condition;

import lombok.Getter;
import lombok.Setter;

/**
 * @Auther: xietao
 * @Date: 2018/7/24
 * @Description: 供应商文档 查询条件封装类
 */
@Getter
@Setter
public class SupplierDocumentCondition {
    private Integer supplierId; // 供应商Id
    private String keywords; // 关键字
    private String name; // 文档名称
    private String sortField; // 排序属性
    private String sortMode; // 排序方式 ASC/DESC

    public SupplierDocumentCondition() {
    }

    public SupplierDocumentCondition(String name, String sortField, String sortMode) {
        this.name = name;
        this.sortField = sortField;
        this.sortMode = sortMode;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
        this.name = keywords;
    }

}
