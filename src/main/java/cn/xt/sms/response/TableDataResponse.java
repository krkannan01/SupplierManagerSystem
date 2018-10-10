package cn.xt.sms.response;

import java.io.Serializable;
import java.util.List;

/**
 * 表格分页数据对象
 *
 * @author ruoyi
 * @modify xietao
 */
public class TableDataResponse implements Serializable
{
    private static final long serialVersionUID = 1L;
    /** 总记录数 */
    private long total;
    /** 列表数据 */
    private List<?> rows;

    /**
     * 表格数据对象
     */
    public TableDataResponse()
    {
    }

    /**
     * 分页
     *
     * @param list 列表数据
     * @param total 总记录数
     */
    public TableDataResponse(List<?> list, int total)
    {
        this.rows = list;
        this.total = total;
    }

    public long getTotal()
    {
        return total;
    }

    public void setTotal(long total)
    {
        this.total = total;
    }

    public List<?> getRows()
    {
        return rows;
    }

    public void setRows(List<?> rows)
    {
        this.rows = rows;
    }

}
