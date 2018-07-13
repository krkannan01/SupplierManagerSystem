package cn.xt.sms.condition;

import cn.xt.sms.util.BasicUtil;
import lombok.Data;

import java.util.List;

/**
 * 材料查询条件类
 * @author xietao.x@qq.com
 * @date 2018/4/19
 */
@Data
public class ProductCondition {

    private List<Integer> groupIds;//分组Id集合
    private List<Integer> brandIds;//品牌Id集合
    private String brand;//品牌
    private String enterprise;//供应商
    private Double priceMin;//最低价格
    private Double priceMax;//最高价格

    public void setGroupIds(String groupIds) {
        this.groupIds = BasicUtil.convertIntegers(groupIds);
    }

    public void setBrandIds(String brandIds) {
        this.brandIds = BasicUtil.convertIntegers(brandIds);
    }

    public void setBrandIds(List<Integer> brandIds) {
        this.brandIds = brandIds;
    }

}
