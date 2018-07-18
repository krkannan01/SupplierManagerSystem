package cn.xt.sms.condition;

import cn.xt.sms.util.BasicUtil;
import lombok.Data;

import java.util.List;

/**
 *
 * @author xietao.x@qq.com
 */
@Data
public class EnterpriseCondition {

    private Integer categoryId;//供应商种类

    private List<Integer> groups;//分组

    private String operateRange;//经营范围包含
    private String fullName;//企业名称包含
    private String mainProduct;//主营产品包含
    private String uccCode;//统一社会信用代码包括

    private boolean includeException;//是否排除异常信息
    private boolean unionSearch;//是否并集查询

    private String sort;//排序字段
    private String sorted;//排序方式 desc:降 asc:升

    public EnterpriseCondition() {
    }

    public EnterpriseCondition(List<Integer> groups, String operateRange, String fullName, String mainProduct, String uccCode, boolean includeException, boolean unionSearch
            , String sort, String sorted) {
        this.groups = groups;
        this.operateRange = operateRange;
        this.fullName = fullName;
        this.mainProduct = mainProduct;
        this.uccCode = uccCode;
        this.includeException = includeException;
        this.unionSearch = unionSearch;
        this.sort = sort;
        this.sorted = sorted;
    }

    public void setGroups(String groups) {
        this.groups = BasicUtil.convertIntegers(groups);
    }

}
