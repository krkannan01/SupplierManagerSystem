<%@ page import="cn.xt.sms.entity.Supplier" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
  String one="",two="",three="",four="",five="";
  Supplier ep = (Supplier) request.getAttribute("supplier");
  if (ep != null) {
      if (ep.getUserDefinedFieldOne() != null) one = ep.getUserDefinedFieldOne();
      if (ep.getUserDefinedFieldTwo() != null) two = ep.getUserDefinedFieldTwo();
      if (ep.getUserDefinedFieldThree() != null) three = ep.getUserDefinedFieldThree();
      if (ep.getUserDefinedFieldFour() != null) four = ep.getUserDefinedFieldFour();
      if (ep.getUserDefinedFieldFive() != null) five = sdf.format(ep.getUserDefinedFieldFive());
  }
%>
<%--
  @author xietao.x@qq.com
  Created by 2018/3/22
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

"<form class='form-horizontal' id='other-form'>" +
"<div class='col-sm-6 col-xs-12'>" +
"<div class='form-group has-success'>" +
"<label class='col-sm-4 control-label no-padding-right'><span class='userDefinedFieldName'>"+data.userDefinedFieldOneName+"</span>：</label>" +

"<div class='col-sm-7'>" +
"<input type='text' id='userDefinedFieldOne' placeholder='<%=one%>' class='width-100' />" +
"</div>" +
"<div class='help-block col-sm-reset inline'></div>" +
"</div>" +
"</div>" +

"<div class='col-sm-6 col-xs-12'>" +
"<div class='form-group has-success'>" +
"<label class='col-sm-3 control-label no-padding-right'><span class='userDefinedFieldName'>"+data.userDefinedFieldTwoName+"</span>：</label>" +

"<div class='col-sm-7'>" +
"<input type='text' id='userDefinedFieldTwo' placeholder='<%=two%>' class='width-100' />" +
"</div>" +
"<div class='help-block col-sm-reset inline'></div>" +
"</div>" +
"</div>" +


"<div class='col-sm-6 col-xs-12'>" +
"<div class='form-group has-success'>" +
"<label class='col-sm-4 control-label no-padding-right'><span class='userDefinedFieldName'>"+data.userDefinedFieldThreeName+"</span>：</label>" +

"<div class='col-sm-7'>" +
"<input type='text' id='userDefinedFieldThree' placeholder='<%=three%>' class='width-100' />" +
"</div>" +
"<div class='help-block col-sm-reset inline'></div>" +
"</div>" +
"</div>" +

"<div class='col-sm-6 col-xs-12'>" +
"<div class='form-group has-success'>" +
"<label class='col-sm-3 control-label no-padding-right'><span class='userDefinedFieldName'>"+data.userDefinedFieldFourName+"</span>：</label>" +

"<div class='col-sm-7'>" +
"<input type='text' id='userDefinedFieldFour' placeholder='<%=four%>' class='width-100' />" +
"</div>" +
"<div class='help-block col-sm-reset inline'></div>" +
"</div>" +
"</div>" +


"<div class='col-sm-6 col-xs-12'>" +
"<div class='form-group has-success'>" +
"<label class='col-sm-4 control-label no-padding-right'><span class='userDefinedFieldName'>"+data.userDefinedFieldFiveName+"</span>：</label>" +

"<div class='col-sm-7'>" +
"<div class='input-group'>" +
"<input id='userDefinedFieldFive' type='text' placeholder='<%=five%>' class='form-control' />" +
"<span class='input-group-addon'>" +
"<i class='fa fa-clock-o bigger-110' title='日期时间框'></i>" +
"</span>" +
"</div>" +
"</div>" +
"<div class='help-block col-sm-reset inline'></div>" +
"</div>" +
"</div>" +
"</form>"