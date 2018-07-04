package cn.xt.sms.entity;

/**
 * ��ϵ����
 * @author xietao.x@qq.com
 */
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

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNameMaster() {
        return nameMaster;
    }

    public void setNameMaster(String nameMaster) {
        this.nameMaster = nameMaster;
    }

    public String getNameSlave() {
        return nameSlave;
    }

    public void setNameSlave(String nameSlave) {
        this.nameSlave = nameSlave;
    }

    public String getPhoneNumberMaster() {
        return phoneNumberMaster;
    }

    public void setPhoneNumberMaster(String phoneNumberMaster) {
        this.phoneNumberMaster = phoneNumberMaster;
    }

    public String getPhoneNumberSlave() {
        return phoneNumberSlave;
    }

    public void setPhoneNumberSlave(String phoneNumberSlave) {
        this.phoneNumberSlave = phoneNumberSlave;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String address) {
        this.comment = address;
    }

    public boolean isNotNull() {
        return !(id==null && nameMaster==null && nameSlave==null && phoneNumberMaster==null && phoneNumberSlave==null && comment==null);
    }

    @Override
    public String toString() {
        return "Contact{" +
                "id=" + id +
                ", nameMaster='" + nameMaster + '\'' +
                ", nameSlave='" + nameSlave + '\'' +
                ", phoneNumberMaster='" + phoneNumberMaster + '\'' +
                ", phoneNumberSlave='" + phoneNumberSlave + '\'' +
                ", comment='" + comment + '\'' +
                '}';
    }

}
