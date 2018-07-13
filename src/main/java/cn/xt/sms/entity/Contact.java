package cn.xt.sms.entity;

import lombok.Data;

/**
 * 联系人信息
 * @author xietao.x@qq.com
 */
@Data
public class Contact {

    private Integer id;//ID
    private String nameMaster;//主要联系人姓名
    private String nameSlave;//次要联系人姓名
    private String phoneNumberMaster;//主要联系人电话
    private String phoneNumberSlave;//次要联系人电话
    private String comment;//备注

    public Contact() {
    }

    public Contact(Integer id, String nameMaster, String nameSlave, String phoneNumberMaster, String phoneNumberSlave, String comment) {
        this.id = id;
        this.nameMaster = nameMaster;
        this.nameSlave = nameSlave;
        this.phoneNumberMaster = phoneNumberMaster;
        this.phoneNumberSlave = phoneNumberSlave;
        this.comment = comment;
    }

    public boolean isNotNull() {
        return !(id==null && nameMaster==null && nameSlave==null && phoneNumberMaster==null && phoneNumberSlave==null && comment==null);
    }

}
