package cn.xt.sms.condition;

import lombok.Getter;

/**
 * @Auther: xietao
 * @Date: 2018/8/15
 * @Description: 操作日志查询条件类
 */
public class OperLogCondition extends BaseCondition {
    @Getter private Integer pageNum;
    public void setPageNum(Integer pageNum) { setCurrentPage(pageNum); }
}
