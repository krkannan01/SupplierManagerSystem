package cn.xt.sms.entity;

import cn.xt.sms.util.MyDateConverter;
import com.alibaba.fastjson.annotation.JSONField;
import lombok.Data;

import java.util.Date;
import java.util.List;

/**
 * 企业信息类
 * @author xietao.x@qq.com
 */
@Data
public class Supplier {

    private String no;//供应商编号
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

    public Supplier() {
    }

    public Supplier(String fullName) {
        this.fullName = fullName;
    }

    public Supplier(String no, Date userDefinedFieldFive, String website, Contact contactId, String mainProduct,
                    Date foundDate, String type, String registeredCapital, String businessDeadlineGo, String businessDeadlineTo,
                    String registerDepartment, Date approvalDate, String registerState, String address, String operateRange,
                    String exceptionInfo, String dangerInfo, String comment, String userDefinedFieldOne, String userDefinedFieldTwo,
                    String userDefinedFieldThree, String userDefinedFieldFour, Integer id, String fullName, String simpleName,
                    String UCCcode, String legalRepresentative, TradeGroup tradeGroupId, Date enterDate, Float level, List<Cooperation> cooperationList) {
        this.no = no;
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

}
