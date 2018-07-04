package cn.xt.sms.Condition;

import cn.xt.sms.util.BasicUtil;

import java.util.List;

/**
 * 材料查询条件类
 * @author xietao.x@qq.com
 * @date 2018/4/19
 */
public class ProductCondition {

    private List<Integer> groupIds;//分组Id集合
    private List<Integer> brandIds;//品牌Id集合
    private String brand;//品牌
    private String enterprise;//供应商
    private Double priceMin;//最低价格
    private Double priceMax;//最高价格

    public List<Integer> getGroupIds() {
        return groupIds;
    }

    public void setGroupIds(String groupIds) {
        this.groupIds = BasicUtil.convertIntegers(groupIds);
    }

    public List<Integer> getBrandIds() {
        return brandIds;
    }

    public void setBrandIds(String brandIds) {
        this.brandIds = BasicUtil.convertIntegers(brandIds);
    }

    public void setBrandIds(List<Integer> brandIds) {
        this.brandIds = brandIds;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getEnterprise() {
        return enterprise;
    }

    public void setEnterprise(String enterprise) {
        this.enterprise = enterprise;
    }

    public Double getPriceMin() {
        return priceMin;
    }

    public void setPriceMin(Double priceMin) {
        this.priceMin = priceMin;
    }

    public Double getPriceMax() {
        return priceMax;
    }

    public void setPriceMax(Double priceMax) {
        this.priceMax = priceMax;
    }

}
