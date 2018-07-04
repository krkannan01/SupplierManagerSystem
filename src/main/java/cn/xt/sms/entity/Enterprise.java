package cn.xt.sms.entity;

import cn.xt.sms.util.MyDateConverter;
import com.alibaba.fastjson.annotation.JSONField;

import java.util.Date;
import java.util.List;

/**
 *
 * @author xietao.x@qq.com
 */
public class Enterprise {

    private Integer identify;//标识ID
    private Integer id;//ID
    private String fullName;//
    private String simpleName;//
    private String UCCcode;//
    private String legalRepresentative;//
    private String website;//
    private Contact contactId;//
    private String mainProduct;//

    @JSONField(format = "yyyy年MM月dd日")
    private Date foundDate;//成立日期
    private String type;//
    private String registeredCapital;//
    private String businessDeadlineGo;//
    private String businessDeadlineTo;//
    private String registerDepartment;//

    @JSONField(format = "yyyy年MM月dd日")
    private Date approvalDate;//
    private String registerState;//
    private String address;//
    private String operateRange;//
    private String exceptionInfo;//
    private String dangerInfo;//
    private String comment;//
    private String userDefinedFieldOne;//
    private String userDefinedFieldTwo;//
    private String userDefinedFieldThree;//
    private String userDefinedFieldFour;//

    @JSONField(format = "yyyy年MM月dd日 HH时mm分ss秒")
    private Date userDefinedFieldFive;//
    private TradeGroup tradeGroupId;

    @JSONField(format = "yyyy年MM月dd日")
    private Date enterDate;
    private Float level;

    private List<Cooperation> cooperationList;

    public Enterprise() {
    }

    public Enterprise(String fullName) {
        this.fullName = fullName;
    }

    public Enterprise(Integer identify, Date userDefinedFieldFive, String website, Contact contactId, String mainProduct,
                      Date foundDate, String type, String registeredCapital, String businessDeadlineGo, String businessDeadlineTo,
                      String registerDepartment, Date approvalDate, String registerState, String address, String operateRange,
                      String exceptionInfo, String dangerInfo, String comment, String userDefinedFieldOne, String userDefinedFieldTwo,
                      String userDefinedFieldThree, String userDefinedFieldFour, Integer id, String fullName, String simpleName,
                      String UCCcode, String legalRepresentative, TradeGroup tradeGroupId, Date enterDate, Float level, List<Cooperation> cooperationList) {
        this.identify = identify;
        this.userDefinedFieldFive = userDefinedFieldFive;
        this.website = website;
        this.contactId = contactId;
        this.mainProduct = mainProduct;
        this.foundDate = foundDate;
        this.type = type;
        this.registeredCapital = registeredCapital;
        this.businessDeadlineGo = businessDeadlineGo;
        this.businessDeadlineTo = businessDeadlineTo;
        this.registerDepartment = registerDepartment;
        this.approvalDate = approvalDate;
        this.registerState = registerState;
        this.address = address;
        this.operateRange = operateRange;
        this.exceptionInfo = exceptionInfo;
        this.dangerInfo = dangerInfo;
        this.comment = comment;
        this.userDefinedFieldOne = userDefinedFieldOne;
        this.userDefinedFieldTwo = userDefinedFieldTwo;
        this.userDefinedFieldThree = userDefinedFieldThree;
        this.userDefinedFieldFour = userDefinedFieldFour;
        this.id = id;
        this.fullName = fullName;
        this.simpleName = simpleName;
        this.UCCcode = UCCcode;
        this.legalRepresentative = legalRepresentative;
        this.tradeGroupId = tradeGroupId;
        this.enterDate = enterDate;
        this.level = level;
        this.cooperationList = cooperationList;
    }

    public Integer getIdentify() {
        return identify;
    }

    public void setIdentify(Integer identify) {
        this.identify = identify;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getSimpleName() {
        return simpleName;
    }

    public void setSimpleName(String simpleName) {
        this.simpleName = simpleName;
    }

    public String getUCCcode() {
        return UCCcode;
    }

    public void setUCCcode(String UCCcode) {
        this.UCCcode = UCCcode;
    }

    public String getLegalRepresentative() {
        return legalRepresentative;
    }

    public void setLegalRepresentative(String legalRepresentative) {
        this.legalRepresentative = legalRepresentative;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public Contact getContactId() {
        return contactId;
    }

    public void setContactId(Contact contactId) {
        this.contactId = contactId;
    }

    public String getMainProduct() {
        return mainProduct;
    }

    public void setMainProduct(String mainProduct) {
        this.mainProduct = mainProduct;
    }

    public Date getFoundDate() {
        return foundDate;
    }

    public void setFoundDate(Date foundDate) {
        this.foundDate = foundDate;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getRegisteredCapital() {
        return registeredCapital;
    }

    public void setRegisteredCapital(String registeredCapital) {
        this.registeredCapital = registeredCapital;
    }

    public String getBusinessDeadlineGo() {
        return businessDeadlineGo;
    }

    public void setBusinessDeadlineGo(String businessDeadlineGo) {
        this.businessDeadlineGo = businessDeadlineGo;
    }

    public String getBusinessDeadlineTo() {
        return businessDeadlineTo;
    }

    public void setBusinessDeadlineTo(String businessDeadlineTo) {
        this.businessDeadlineTo = businessDeadlineTo;
    }

    public String getRegisterDepartment() {
        return registerDepartment;
    }

    public void setRegisterDepartment(String registerDepartment) {
        this.registerDepartment = registerDepartment;
    }

    public Date getApprovalDate() {
        return approvalDate;
    }

    public void setApprovalDate(Date approvalDate) {
        this.approvalDate = approvalDate;
    }

    public String getRegisterState() {
        return registerState;
    }

    public void setRegisterState(String registerState) {
        this.registerState = registerState;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getOperateRange() {
        return operateRange;
    }

    public void setOperateRange(String operateRange) {
        this.operateRange = operateRange;
    }

    public String getExceptionInfo() {
        return exceptionInfo;
    }

    public void setExceptionInfo(String exceptionInfo) {
        this.exceptionInfo = exceptionInfo;
    }

    public String getDangerInfo() {
        return dangerInfo;
    }

    public void setDangerInfo(String dangerInfo) {
        this.dangerInfo = dangerInfo;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getUserDefinedFieldOne() {
        return userDefinedFieldOne;
    }

    public void setUserDefinedFieldOne(String userDefinedFieldOne) {
        this.userDefinedFieldOne = userDefinedFieldOne;
    }

    public String getUserDefinedFieldTwo() {
        return userDefinedFieldTwo;
    }

    public void setUserDefinedFieldTwo(String userDefinedFieldTwo) {
        this.userDefinedFieldTwo = userDefinedFieldTwo;
    }

    public String getUserDefinedFieldThree() {
        return userDefinedFieldThree;
    }

    public void setUserDefinedFieldThree(String userDefinedFieldThree) {
        this.userDefinedFieldThree = userDefinedFieldThree;
    }

    public String getUserDefinedFieldFour() {
        return userDefinedFieldFour;
    }

    public void setUserDefinedFieldFour(String userDefinedFieldFour) {
        this.userDefinedFieldFour = userDefinedFieldFour;
    }

    public Date getUserDefinedFieldFive() {
        return userDefinedFieldFive;
    }

    public void setUserDefinedFieldFive(Date userDefinedFieldFive) {
        this.userDefinedFieldFive = userDefinedFieldFive;
    }

    public Date getEnterDate() {
        return enterDate;
    }

    public void setEnterDate(Date enterDate) {
        this.enterDate = enterDate;
    }

    public Float getLevel() {
        return level;
    }

    public void setLevel(Float level) {
        this.level = level;
    }

    public TradeGroup getTradeGroupId() {
        return tradeGroupId;
    }

    public void setTradeGroupId(TradeGroup tradeGroupId) {
        this.tradeGroupId = tradeGroupId;
    }

    public List<Cooperation> getCooperationList() {
        return cooperationList;
    }

    public void setCooperationList(List<Cooperation> cooperationList) {
        this.cooperationList = cooperationList;
    }


    @Override
    public String toString() {
        return "Enterprise{" +
                "identify=" + identify +
                ", id=" + id +
                ", fullName='" + fullName + '\'' +
                ", simpleName='" + simpleName + '\'' +
                ", UCCcode='" + UCCcode + '\'' +
                ", legalRepresentative='" + legalRepresentative + '\'' +
                ", website='" + website + '\'' +
                ", contactId=" + contactId +
                ", mainProduct='" + mainProduct + '\'' +
                ", foundDate=" + foundDate +
                ", type='" + type + '\'' +
                ", registeredCapital='" + registeredCapital + '\'' +
                ", businessDeadlineGo='" + businessDeadlineGo + '\'' +
                ", businessDeadlineTo='" + businessDeadlineTo + '\'' +
                ", registerDepartment='" + registerDepartment + '\'' +
                ", approvalDate=" + approvalDate +
                ", registerState='" + registerState + '\'' +
                ", address='" + address + '\'' +
                ", operateRange='" + operateRange + '\'' +
                ", exceptionInfo='" + exceptionInfo + '\'' +
                ", dangerInfo='" + dangerInfo + '\'' +
                ", comment='" + comment + '\'' +
                ", userDefinedFieldOne='" + userDefinedFieldOne + '\'' +
                ", userDefinedFieldTwo='" + userDefinedFieldTwo + '\'' +
                ", userDefinedFieldThree='" + userDefinedFieldThree + '\'' +
                ", userDefinedFieldFour='" + userDefinedFieldFour + '\'' +
                ", userDefinedFieldFive='" + userDefinedFieldFive + '\'' +
                ", tradeGroupId=" + tradeGroupId +
                ", enterDate=" + enterDate +
                ", level=" + level +
                ", cooperationList=" + cooperationList +
                '}';
    }
}
