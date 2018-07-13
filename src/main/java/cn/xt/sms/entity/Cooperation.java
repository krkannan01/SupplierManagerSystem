package cn.xt.sms.entity;

import lombok.Data;

/**
 * 合作情况信息
 * @author xietao.x@qq.com
 */
@Data
public class Cooperation {

    private Integer id;//ID
    private String projectName;//
    private String productName;//
    private Contact contactId;//
    private Integer enterpriseId;

    public Cooperation() {
    }

    public Cooperation(Integer id, String projectName, String productName, Contact contactId, Integer enterpriseId) {
        this.id = id;
        this.projectName = projectName;
        this.productName = productName;
        this.contactId = contactId;
        this.enterpriseId = enterpriseId;
    }

    public boolean isNotNull() {
        return !(id==null && projectName==null && productName==null && contactId==null && enterpriseId==null);
    }

}
