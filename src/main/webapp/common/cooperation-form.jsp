<%--
  @author xietao.x@qq.com
  Created by 2018/3/22
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
"<div class='col-sm-12 cooperation-box' data-boxId='"+ boxIndex +"'>" +
"<div class='row' style='margin-bottom: 10px;'>" +
"<div class='col-sm-5'></div>" +
"<div class='col-sm-6'><h3 class='green'>合作情况信息"+ boxIndex +"</h3></div>" +
"<div class='col-sm-1'><button class='btn btn-danger btn-white btn-sm' style='margin-top: 20px;' id='deleteBoxBtn"+ boxIndex +"'>" +
"<i class='ace-icon fa fa-trash-o bigger200' title='删除项'></i></button></div>" +
"</div>" +
"<form class='form-horizontal' id='cooperation-form-"+ boxIndex +"'>" +
"<div class='col-sm-6 col-xs-12'>" +
"<div class='form-group has-success'>" +
"<label for='projectName"+ boxIndex +"' class='col-sm-4 control-label no-padding-right'>项目名称：</label>" +
"<div class='col-sm-7'>" +
"<span class='block'>" +
"<input type='text' id='projectName"+ boxIndex +"' class='width-100' />" +
"</span>" +
"</div>" +
"<div class='help-block col-sm-reset inline'></div>" +
"</div>" +
"</div>" +

"<div class='col-sm-6 col-xs-12'>" +
"<div class='form-group has-success'>" +
"<label for='productName"+ boxIndex +"' class='col-sm-3 control-label no-padding-right'>产品名称：</label>" +
"<div class='col-sm-7'>" +
"<span class='block'>" +
"<input type='text' id='productName"+ boxIndex +"' class='width-100' />" +
"</span>" +
"</div>" +
"<div class='help-block col-sm-reset inline'></div>" +
"</div>" +
"</div>" +


"<div class='col-sm-6 col-xs-12'>" +
"<div class='form-group has-success'>" +
"<label for='coopContactNameMaster"+ boxIndex +"' class='col-sm-4 control-label no-padding-right'>主要联系人姓名：</label>" +
"<div class='col-sm-7'>" +
"<span class='block'>" +
"<input type='text' id='coopContactNameMaster"+ boxIndex +"' class='width-100' />" +
"</span>" +
"</div>" +
"<div class='help-block col-sm-reset inline'></div>" +
"</div>" +
"</div>" +

"<div class='col-sm-6 col-xs-12'>" +
"<div class='form-group has-success'>" +
"<label for='coopContactNameSlave"+ boxIndex +"' class='col-sm-3 control-label no-padding-right'>次要联系人姓名：</label>" +
"<div class='col-sm-7'>" +
"<span class='block'>" +
"<input type='text' id='coopContactNameSlave"+ boxIndex +"' class='width-100' />" +
"</span>" +
"</div>" +
"<div class='help-block col-sm-reset inline'></div>" +
"</div>" +
"</div>" +

"<div class='col-sm-6 col-xs-12'>" +
"<div class='form-group has-success'>" +
"<label for='coopPhoneNumberMaster"+ boxIndex +"' class='col-sm-4 control-label no-padding-right'>主要联系方式：</label>" +
"<div class='col-sm-7'>" +
"<span class='block'>" +
"<input type='text' id='coopPhoneNumberMaster"+ boxIndex +"' disabled class='width-100' />" +
"</span>" +
"</div>" +
"<div class='help-block col-sm-reset inline'></div>" +
"</div>" +
"</div>" +

"<div class='col-sm-6 col-xs-12'>" +
"<div class='form-group has-success'>" +
"<label for='coopPhoneNumberSlave"+ boxIndex +"' class='col-sm-3 control-label no-padding-right'>次要联系方式：</label>" +
"<div class='col-sm-7'>" +
"<span class='block'>" +
"<input type='text' id='coopPhoneNumberSlave"+ boxIndex +"' disabled class='width-100' />" +
"</span>" +
"</div>" +
"<div class='help-block col-sm-reset inline'></div>" +
"</div>" +
"</div>" +

"<div class='col-sm-6 col-xs-12'>" +
"<div class='form-group has-success'>" +
"<label for='coopContactComment"+ boxIndex +"' class='col-sm-4 control-label no-padding-right'>备注：</label>" +
"<div class='col-sm-7'>" +
"<span class='block'>" +
"<input type='text' id='coopContactComment"+ boxIndex +"' disabled class='width-100' />" +
"</span>" +
"</div>" +
"<div class='help-block col-sm-reset inline'></div>" +
"</div>" +
"</div>" +

"</form>" +
"</div>"