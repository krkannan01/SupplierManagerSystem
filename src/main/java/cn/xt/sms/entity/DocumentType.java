package cn.xt.sms.entity;

import lombok.Data;

/**
 * @Auther: xietao
 * @Date: 2018/7/24
 * @Description: 文档类型 实体类
 */
@Data
public class DocumentType {
    private Integer id; // 文档类型id
    private String name; // 文档类型名称
    private String description; // 文档类型描述

    public DocumentType() {
    }

    public DocumentType(Integer id, String name, String description) {
        this.id = id;
        this.name = name;
        this.description = description;
    }
}
