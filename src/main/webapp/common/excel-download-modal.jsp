<%--
  @author xietao.x@qq.com
  Created by 2018/5/7
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
var lower_type = type.toLowerCase();
var upper_type = lower_type.substring(0,1).toUpperCase() + lower_type.substring(1);
/*绑定导出excel事件*/
$("body").delegate("#download-excel", "click", function() {
var $min_value = $("#min-value");
var $max_value = $("#max-value");

if ($min_value.val() && $max_value.val()) {
if (Number($min_value.val()) > Number($max_value.val())) {
$min_value.closest(".row").next().text("开始点不能小于结束点");
return;
}
var url = "${pageContext.request.contextPath}/"+ lower_type +"/exportExcel?start="+ $min_value.val() +"&end="+
$max_value.val();
if (document.getElementById("hand-condition").checked) {
url += "&"+ lower_type +"Condition="+ JSON.stringify(defaultParams);
}
location.href = url;
$min_value.closest(".row").next().text("");
} else {
$min_value.closest(".row").next().text("参数不能为空");
}

});

/*绑定【在当前筛选条件下导出】复选框切换事件*/
$("body").delegate("#hand-condition", "click", function() {
var hand_condition = document.getElementById("hand-condition");
var data = null;
if (hand_condition.checked) {
data = defaultParams;
}
/*获取总记录数*/
$.ajax({
url: "${pageContext.request.contextPath}/"+ lower_type +"/get"+ upper_type +"Count",
type: "POST",
dataType: "TEXT",
data: data,
success: function(data) {
/*给相关标签设置值*/
$("#"+ lower_type +"-count-info").find("b").text(data);
$("#max-value").attr("placeholder", data);
}
});
});

/*绑定导出excel按钮事件*/
$("#export-excel-button").click(function() {
var count = 0;
/*获取总记录数*/
$.ajax({
url: "${pageContext.request.contextPath}/"+ lower_type +"/get"+ upper_type +"Count",
type: "POST",
dataType: "TEXT",
async: false,
success: function(data) {
count = data;
}
});
BootstrapDialog.show({
title: '请选择要导出的条数区间',
message: "<form class='form-search' style='width: 80%; margin: 0 auto;'>" +
"<div class='row'>" +
"<label id='"+ lower_type +"-count-info'>当前共有<b>"+ count +"</b>条记录</label>" +
"</div>" +
"<div class='space-12'>></div>" +
"<div class='row'>" +
"<div class='input-group input-group-sm'>" +
"<span class='input-group-addon'>" +
"数据区间" +
"</span>" +
"<input type='text' class='form-control search-query number-box min-box' id='min-value' placeholder='1' />" +
"<span class='input-group-addon'>" +
"<i class='ace-icon fa fa-angle-double-right'></i>" +
"</span>" +
"<input type='text' class='form-control search-query number-box max-box' id='max-value' placeholder='"+ count +"' />" +
"<span class='input-group-btn'>" +
"<button type='button' class='btn btn-warning btn-xs' id='download-excel'>" +
"导出" +
"</button>" +
"</span>" +
"</div>" +
"</div>" +
"<div style='height: 30px; color: red;'></div>" +
"<div class='row'>" +
"<input type='checkbox' id='hand-condition' /><label for='hand-condition'>在当前筛选条件下导出</label>" +
"</div>" +
"</form>",
type: BootstrapDialog.TYPE_INFO, // <-- Default value is BootstrapDialog.TYPE_PRIMARY
closable: false, //
draggable: true, //
buttons: [{
label: "完成",
cssClass: "btn-sm btn-warning btn-white",
action: function(dialog) {
dialog.close();
}
}]
});
});