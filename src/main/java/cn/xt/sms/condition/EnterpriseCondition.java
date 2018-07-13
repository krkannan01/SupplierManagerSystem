package cn.xt.sms.condition;

import cn.xt.sms.util.BasicUtil;

import java.util.List;

/**
 *
 * @author xietao.x@qq.com
 */
public class EnterpriseCondition {
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

    public List<Integer> getGroups() {
        return groups;
    }

    public void setGroups(String groups) {
        this.groups = BasicUtil.convertIntegers(groups);
    }

    public String getOperateRange() {
        return operateRange;
    }

    public void setOperateRange(String operateRange) {
        this.operateRange = operateRange;
    }

    public boolean isIncludeException() {
        return includeException;
    }

    public void setIncludeException(boolean includeException) {
        this.includeException = includeException;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getMainProduct() {
        return mainProduct;
    }

    public void setMainProduct(String mainProduct) {
        this.mainProduct = mainProduct;
    }

    public String getUccCode() {
        return uccCode;
    }

    public void setUccCode(String uccCode) {
        this.uccCode = uccCode;
    }

    public boolean isUnionSearch() {
        return unionSearch;
    }

    public void setUnionSearch(boolean unionSearch) {
        this.unionSearch = unionSearch;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    public String getSorted() {
        return sorted;
    }

    public void setSorted(String sorted) {
        this.sorted = sorted;
    }

    @Override
    public String toString() {
        return "EnterpriseCondition{" +
                "groups=" + groups +
                ", operateRange='" + operateRange + '\'' +
                ", fullName='" + fullName + '\'' +
                ", mainProduct='" + mainProduct + '\'' +
                ", uccCode='" + uccCode + '\'' +
                ", includeException=" + includeException +
                ", unionSearch=" + unionSearch +
                ", sort='" + sort + '\'' +
                ", sorted='" + sorted + '\'' +
                '}';
    }
}
