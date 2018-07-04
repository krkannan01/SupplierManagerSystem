package cn.xt.sms.entity;

import com.alibaba.fastjson.annotation.JSONField;

import java.util.Date;

/**
 * 材料信息类
 * @author xietao.x@qq.com
 */
public class Product {

    private Integer id;//材料ID
    private String name;//材料名称
    private ProductBrand brandId;//品牌
    private String size;//规格型号
    private String technicalParam;//技术参数
    private String unit;//单位
    private Float unitprice;//单位价格
    private String comment;//备注
    private Enterprise enterpriseId;//供应商
    private ProductGroup groupId;//分组

    public Product() {
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

    public ProductBrand getBrandId() {
        return brandId;
    }

    public void setBrandId(ProductBrand brandId) {
        this.brandId = brandId;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getTechnicalParam() {
        return technicalParam;
    }

    public void setTechnicalParam(String technicalParam) {
        this.technicalParam = technicalParam;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public Float getUnitprice() {
        return unitprice;
    }

    public void setUnitprice(Float unitprice) {
        this.unitprice = unitprice;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Enterprise getEnterpriseId() {
        return enterpriseId;
    }

    public void setEnterpriseId(Enterprise enterpriseId) {
        this.enterpriseId = enterpriseId;
    }

    public ProductGroup getGroupId() {
        return groupId;
    }

    public void setGroupId(ProductGroup groupId) {
        this.groupId = groupId;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", brandId=" + brandId +
                ", size='" + size + '\'' +
                ", technicalParam='" + technicalParam + '\'' +
                ", unit='" + unit + '\'' +
                ", unitprice=" + unitprice +
                ", comment='" + comment + '\'' +
                ", enterpriseId=" + enterpriseId +
                ", groupId=" + groupId +
                '}';
    }

}
