package cn.xt.sms.condition;

import lombok.Getter;
import lombok.Setter;

/**
 * @Auther: xietao
 * @Date: 2018/8/15
 * @Description:
 */
public class BaseCondition {

    public static final Integer DEFAULT_PAGESIZE = 10;
    public static final Integer DEFAULT_CURRENTPAGE = 1;
    public static final Integer DEFAULT_OFFSET = 0;

    @Getter private Integer pageSize = 10;
    public void setPageSize(Integer pageSize) { this.pageSize = pageSize; setOffset(); }
    @Getter private Integer currentPage = 1;
    public void setCurrentPage(Integer currentPage) { this.currentPage = currentPage; setOffset(); }

    @Getter @Setter private String searchValue;
    @Getter @Setter private String orderByColumn;
    @Getter @Setter private String isAsc;

    @Getter private Integer offset = 0;
    private void setOffset()
    {
        /*计算偏移量*/
        pageSize = pageSize == null ? DEFAULT_PAGESIZE : pageSize;
        currentPage = currentPage == null ? DEFAULT_CURRENTPAGE : currentPage;
        offset = (currentPage - 1) * pageSize;
        offset = offset < 0 ? DEFAULT_OFFSET : offset;
    }

}
