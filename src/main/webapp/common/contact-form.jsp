<%@ page import="cn.xt.sms.entity.Supplier" %>
<%@ page import="cn.xt.sms.entity.Contact" %>
<%--
  @author xietao.x@qq.com
  Created by 2018/3/22
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id="",nameMaster="",nameSlave="",comment="",phoneNumberMaster="",phoneNumberSlave="";
    Supplier ep = (Supplier) request.getAttribute("supplier");
    if (ep != null) {
        if (ep.getContactId() != null) {
            Contact contact = ep.getContactId();
            if (contact.getId() != null) id = contact.getId().toString();
            if (contact.getNameMaster() != null) nameMaster = contact.getNameMaster();
            if (contact.getNameSlave() != null) nameSlave = contact.getNameSlave();
            if (contact.getComment() != null) comment = contact.getComment();
            if (contact.getPhoneNumberMaster() != null) phoneNumberMaster = contact.getPhoneNumberMaster();
            if (contact.getPhoneNumberSlave() != null) phoneNumberSlave = contact.getPhoneNumberSlave();
        }
    }
%>

<form class="form-horizontal" id="contact-form">
    <input id="contactId" value="<%=id%>" style="display: none;" />
    <div class="col-sm-6 col-xs-12">
        <div class="form-group has-warning">
            <label for="contactNameMaster" class="col-sm-4 control-label no-padding-right">主要联系人名称：</label>

            <div class="col-sm-7">
                <span class="block input-icon input-icon-right">
                    <input type="text" id="contactNameMaster" placeholder="<%=nameMaster%>" class="width-100" />
                    <i class="ace-icon fa fa-info-circle" title="必填项"></i>
                </span>
            </div>
            <div class="help-block col-sm-reset inline"></div>
        </div>
    </div>

    <div class="col-sm-6 col-xs-12">
        <div class="form-group has-success">
            <label for="contactNameSlave" class="col-sm-3 control-label no-padding-right">次要联系人名称：</label>

            <div class="col-sm-7">
                <input type="text" id="contactNameSlave" placeholder="<%=nameSlave%>" class="width-100" />
            </div>
            <div class="help-block col-sm-reset inline"></div>
        </div>
    </div>


    <div class="col-sm-6 col-xs-12">
        <div class="form-group has-success">
            <label for="phoneNumberOne" class="col-sm-4 control-label no-padding-right">主要联系方式：</label>

            <div class="col-sm-7">
                <input type="text" id="phoneNumberOne" placeholder="<%=phoneNumberMaster%>" class="width-100" />
            </div>
            <div class="help-block col-sm-reset inline"></div>
        </div>
    </div>

    <div class="col-sm-6 col-xs-12">
        <div class="form-group has-success">
            <label for="phoneNumberTwo" class="col-sm-3 control-label no-padding-right">次要联系方式：</label>

            <div class="col-sm-7">
                <input type="text" id="phoneNumberTwo" placeholder="<%=phoneNumberSlave%>" class="width-100" />
            </div>
            <div class="help-block col-sm-reset inline"></div>
        </div>
    </div>

    <div class="col-sm-6 col-xs-12">
        <div class="form-group has-success">
            <label for="contactComment" class="col-sm-4 control-label no-padding-right">备注：</label>

            <div class="col-sm-7">
                <input type="text" id="contactComment" placeholder="<%=comment%>" class="width-100" />
            </div>
            <div class="help-block col-sm-reset inline"></div>
        </div>
    </div>
</form>