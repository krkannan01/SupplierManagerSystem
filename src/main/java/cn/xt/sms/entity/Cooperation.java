package cn.xt.sms.entity;

/**
 * ���������
 * @author xietao.x@qq.com
 */
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

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Contact getContactId() {
        return contactId;
    }

    public void setContactId(Contact contactId) {
        this.contactId = contactId;
    }

    public Integer getEnterpriseId() {
        return enterpriseId;
    }

    public void setEnterpriseId(Integer enterpriseId) {
        this.enterpriseId = enterpriseId;
    }

    public boolean isNotNull() {
        return !(id==null && projectName==null && productName==null && contactId==null && enterpriseId==null);
    }

    @Override
    public String toString() {
        return "Cooperation{" +
                "id=" + id +
                ", projectName='" + projectName + '\'' +
                ", productName='" + productName + '\'' +
                ", contactId=" + contactId +
                ", enterpriseId=" + enterpriseId +
                '}';
    }
}
