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
public class SupplierFileCondition {
    private String sortField; // 排序属性
    private String sortMode; // 排序方式 ASC/DESC
}
