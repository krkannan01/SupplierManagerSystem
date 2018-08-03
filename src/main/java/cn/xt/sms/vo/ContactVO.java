package cn.xt.sms.vo;

import cn.xt.sms.entity.Contact;
import lombok.Data;
import org.springframework.beans.BeanUtils;

import java.lang.reflect.Field;
import java.util.Arrays;

/**
 * @Auther: xietao
 * @Date: 2018/7/19
 * @Description:
 */
@Data
public class ContactVO {

    /*<%
    Supplier ep = (Supplier) request.getAttribute("enterprise");

    // 处理日期值
    String foundDate = "",approvalDate = "",udfFive = "";
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
    SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy年MM月dd日 HH时mm分ss秒");
    if (ep.getFoundDate() != null)
        foundDate = sdf.format(ep.getFoundDate());
    if (ep.getApprovalDate() != null)
        approvalDate = sdf.format(ep.getApprovalDate());
    if (ep.getUserDefinedFieldFive() != null)
        udfFive = sdf2.format(ep.getUserDefinedFieldFive());

    // 处理联系人信息null值
%>*/

    private String nameMaster;//主要联系人姓名
    private String nameSlave;//次要联系人姓名
    private String phoneNumberMaster;//主要联系人电话
    private String phoneNumberSlave;//次要联系人电话
    private String comment;//备注

    public static ContactVO convertToContactVO(Contact contact) {
        ContactVO contactVO = new ContactVO();
        BeanUtils.copyProperties(contact, contactVO);
        Field[] fields = ContactVO.class.getDeclaredFields();
        Arrays.stream(fields).forEach(field -> {
            try {
                field.set(contactVO, "无");
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            }
        });
        System.out.println("");
        return null;
    }

    public static void main(String[] args) {
        ContactVO.convertToContactVO(new Contact());
        System.out.println("");
    }

}
