package cn.xt.sms.service.middle;

import cn.xt.sms.Condition.EnterpriseCondition;
import cn.xt.sms.entity.Enterprise;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

import java.util.List;

/**
 * @author xietao.x@qq.com
 * @date 2018/5/6
 */

/*为什么要这个类呢，是因为针对批量删除，批量导入，这种只关心单条记录是否操作成功，而不是要操作到一半出现异常，就把前面所有的操作都回滚，
* 如果在EnterpriseService中直接写的话，因为包含了嵌套调用的原因，会导致单条操作的事务失效，所以抽取到中间类中来达到目的*/
public interface IEnterpriseMiddleService {

    /*读取企业信息Excel文档并批量插入*/
    String getEnterpriseFormExcel(Sheet sheet);

    /*读取数据并导出Excel*/
    void setEnterpriseToExcel(Workbook wb, Integer start, Integer end, EnterpriseCondition enterpriseCondition);

    /*批量删除*/
    String mutliDeleteEnterprise(String ids);

}
