<%@ page import="cn.xt.sms.entity.Enterprise" %>
<%@ page import="cn.xt.sms.entity.Cooperation" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%--
  @author xietao.x@qq.com
  Created by 2018/3/21
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    Enterprise ep = (Enterprise) request.getAttribute("enterprise");
    List<Cooperation> cooperationList = new ArrayList<Cooperation>();
    if (ep != null) {
        if (ep.getCooperationList() != null && ep.getCooperationList().size() > 0) {
            cooperationList = ep.getCooperationList();
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>编辑详情 - 供应商管理系统</title>

    <meta name="description" content="overview &amp; stats" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

    <link rel="shortcut icon" href="${pageContent.request.contentPath}/statics/favicon.ico" type="image/x-icon" />
    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="${pageContent.request.contentPath}/statics/assets/css/bootstrap.css" />
    <link rel="stylesheet" href="${pageContent.request.contentPath}/statics/components/font-awesome/css/font-awesome.min.css" />

    <!-- page specific plugin styles -->
    <link rel="stylesheet" href="${pageContent.request.contentPath}/statics/components/_mod/jquery-ui/jquery-ui.min.css" />
    <link rel="stylesheet" href="${pageContent.request.contentPath}/statics/css/bootstrap-dialog.css" />
    <link rel="stylesheet" href="${pageContent.request.contentPath}/statics/components/_mod/jquery-ui/jquery-ui.min.css" />
    <link rel="stylesheet" href="${pageContent.request.contentPath}/statics/components/bootstrap-datepicker/dist/css/bootstrap-datepicker3.min.css" />
    <link rel="stylesheet" href="${pageContent.request.contentPath}/statics/components/eonasdan-bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.css" />
    <link rel="stylesheet" href="${pageContent.request.contentPath}/statics/components/_mod/jquery-ui.custom/jquery-ui.custom.min.css" />

    <!-- text fonts -->
    <link rel="stylesheet" href="${pageContent.request.contentPath}/statics/assets/css/ace-fonts.css" />

    <!-- ace styles -->
    <link rel="stylesheet" href="${pageContent.request.contentPath}/statics/assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />

    <!--[if lte IE 9]>
    <link rel="stylesheet" href="${pageContent.request.contentPath}/statics/assets/css/ace-part2.css" class="ace-main-stylesheet" />
    <![endif]-->
    <link rel="stylesheet" href="${pageContent.request.contentPath}/statics/assets/css/ace-skins.css" />
    <link rel="stylesheet" href="${pageContent.request.contentPath}/statics/assets/css/ace-rtl.css" />

    <!--[if lte IE 9]>
    <link rel="stylesheet" href="${pageContent.request.contentPath}/statics/assets/css/ace-ie.css" />
    <![endif]-->

    <style type="text/css">
        body {
            margin-bottom: 135px;
        }
        /*左边距设置为10px*/
        .l10 {
            font-size: 15px;
            margin-left: 10px;
            margin-right: 5px;
            color: #266eb6;
        }
        /*字体大小设置为15px*/
        .f15 {
            font-size: 15px;
            color: #666666;
            margin-left: 2px;
        }
        .overview dt {
            display: inline-block;
            font-weight: bold !important;
            line-height: 25px;
            padding-left: 10px;
            position: relative;
        }
        .overview dd {
            display: inline;
            line-height: 25px;
            margin-left: 10px;
        }
        .overview dl {
            display: inline;
        }
        /*虚线分界线样式*/
        .demarcation {
            height:1px;
            border:none;
            border-top:1px dashed orange;
        }
        .cooperation-box {
            border: 1px solid #F9CF4F;
            width: 100%;
            height: 270px;
            margin: 10px auto;
        }
        .center {
            text-align: center;
            font-size: 24px;
            margin-top: 12px;
        }
        .none {
            display: none;
        }
    </style>

    <!-- ace settings handler -->
    <script src="${pageContent.request.contentPath}/statics/assets/js/ace-extra.js"></script>

    <!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

    <!--[if lte IE 8]>
    <script src="${pageContent.request.contentPath}/statics/components/html5shiv/dist/html5shiv.min.js"></script>
    <script src="${pageContent.request.contentPath}/statics/components/respond/dest/respond.min.js"></script>
    <![endif]-->
</head>

<body class="no-skin">
<!-- #section:basics/navbar.layout -->
<!-- 网页上部信息 -->
<div class="navbar navbar-default          ace-save-state" style="background-color: #EEEEEE;">
    <div class="navbar-container ace-save-state" id="navbar-container">

        <!-- /section:basics/sidebar.mobile.toggle -->
        <div class="navbar-header pull-left">
            <!-- #section:basics/navbar.layout.brand -->
            <a href="#" class="navbar-brand" style="color: #0088FF;">
                <small>
                    <i class="fa fa-leaf"></i>
                    Supplier ManagerSystem
                </small>
            </a>

        </div>

    </div><!-- /.navbar-container -->
</div>


<!-- /section:basics/navbar.layout -->
<div class="main-container ace-save-state" id="main-container">
    <script type="text/javascript">
        try{ace.settings.loadState('main-container')}catch(e){}
    </script>



    <!-- /section:basics/sidebar -->
    <div class="main-content" style="width: 80%; margin: 0 auto;">
        <div class="main-content-inner">

            <!-- /section:basics/content.breadcrumbs -->
            <div class="page-content">

                <div class="row" id="main-box" style="border: 5px solid orange; padding: 10px;">
                    <div class="col-sm-12">
                        <div class="space-8"></div>
                    </div>
                    <div class="col-sm-12">
                        <div class="col-sm-3 label label-lg label-info arrowed-in arrowed-right"><b>基本信息</b></div>
                    </div>
                    <div class="col-sm-12">
                        <div class="space-10"></div>
                    </div>
                    <div class="col-sm-12 overview">
                        <jsp:include page="${pageContext.request.contextPath}/common/supplier-form.jsp"/>

                        <div class="col-sm-12"><hr class="demarcation" /></div>

                        <jsp:include page="${pageContext.request.contextPath}/common/contact-form.jsp"/>

                        <div class="col-sm-12"><hr class="demarcation" /></div>

                    </div>

                    <div class="col-sm-12">
                        <div class="space-16"></div>
                    </div>

                    <div class="col-sm-12">
                        <div class="col-sm-3 label label-lg label-info arrowed-in arrowed-right"><b>合作情况</b></div>
                    </div>

                    <div class="col-sm-12"><div class="space-10"></div></div>
                    <c:forEach items="<%=cooperationList%>" var="coop" varStatus="status">
                        <div class="col-sm-12">
                            <div class="cooperation-box" data-boxId="${status.count}">
                                <div class="row" style="margin-bottom: 10px;">
                                    <div class="col-sm-5"></div>
                                    <div class="col-sm-6"><h3 class="green">合作情况信息${status.count}</h3></div>
                                    <div class="col-sm-1"><button class="btn btn-danger btn-white btn-sm" style="margin-top: 20px;" id="deleteBoxBtn${status.count}">
                                        <i class="ace-icon fa fa-trash-o bigger200" title="删除项"></i></button></div>
                                </div>
                                <form class="form-horizontal" id="cooperation-form-${status.count}">
                                    <input id="cooperationId${status.count}" value="${coop.id}" style="display: none;" />
                                    <div class="col-sm-6 col-xs-12">
                                        <div class="form-group has-success">
                                            <label for="projectName${status.count}" class="col-sm-4 control-label no-padding-right">项目名称：</label>

                                            <div class="col-sm-7">
                                                <span class="block">
                                                <input type="text" id="projectName${status.count}" placeholder="${coop.projectName}" class="width-100" />
                                                </span>
                                            </div>
                                            <div class="help-block col-sm-reset inline"></div>
                                        </div>
                                    </div>

                                    <div class="col-sm-6 col-xs-12">
                                        <div class="form-group has-success">
                                            <label for="productName${status.count}" class="col-sm-3 control-label no-padding-right">产品名称：</label>

                                            <div class="col-sm-7">
                                                <span class="block">
                                                <input type="text" id="productName${status.count}" placeholder="${coop.productName}" class="width-100" />
                                                </span>
                                            </div>
                                            <div class="help-block col-sm-reset inline"></div>
                                        </div>
                                    </div>


                                    <div class="col-sm-6 col-xs-12">
                                        <div class="form-group has-success">
                                            <label for="coopContactNameMaster${status.count}" class="col-sm-4 control-label no-padding-right">主要联系人姓名：</label>

                                            <div class="col-sm-7">
                                                <span class="block">
                                                <input type="text" id="coopContactNameMaster${status.count}" placeholder="${coop.contactId != null ? coop.contactId.nameMastr:''}" class="width-100" />
                                                </span>
                                            </div>
                                            <div class="help-block col-sm-reset inline"></div>
                                        </div>
                                    </div>

                                    <div class="col-sm-6 col-xs-12">
                                        <div class="form-group has-success">
                                            <label for="coopContactNameSlave${status.count}" class="col-sm-4 control-label no-padding-right">次要联系人姓名：</label>

                                            <div class="col-sm-7">
                                                <span class="block">
                                                <input type="text" id="coopContactNameSlave${status.count}" placeholder="${coop.contactId != null ? coop.contactId.nameSlave:''}" class="width-100" />
                                                </span>
                                            </div>
                                            <div class="help-block col-sm-reset inline"></div>
                                        </div>
                                    </div>

                                    <div class="col-sm-6 col-xs-12">
                                        <div class="form-group has-success">
                                            <label for="coopPhoneNumberMaster${status.count}" class="col-sm-4 control-label no-padding-right">主要联系方式：</label>

                                            <div class="col-sm-7">
                                                <span class="block">
                                                <input type="text" id="coopPhoneNumberMaster${status.count}" placeholder="${coop.contactId != null ? coop.contactId.phoneNumberMaster:''}" disabled class="width-100" />
                                                </span>
                                            </div>
                                            <div class="help-block col-sm-reset inline"></div>
                                        </div>
                                    </div>

                                    <div class="col-sm-6 col-xs-12">
                                        <div class="form-group has-success">
                                            <label for="coopPhoneNumberSlave${status.count}" class="col-sm-3 control-label no-padding-right">次要联系方式：</label>

                                                <div class="col-sm-7">
                                                    <span class="block">
                                                    <input type="text" id="coopPhoneNumberSlave${status.count}" placeholder="${coop.contactId != null ? coop.contactId.phoneNumberSlave:''}" disabled class="width-100" />
                                                    </span>
                                                </div>
                                            <div class="help-block col-sm-reset inline"></div>
                                        </div>
                                    </div>

                                    <div class="col-sm-6 col-xs-12">
                                        <div class="form-group has-success">
                                            <label for="coopContactComment${status.count}" class="col-sm-3 control-label no-padding-right">备注：</label>

                                            <div class="col-sm-7">
                                                <span class="block">
                                                <input type="text" id="coopContactComment${status.count}" placeholder="${coop.contactId != null ? coop.contactId.comment:''}" disabled class="width-100" />
                                                </span>
                                            </div>
                                            <div class="help-block col-sm-reset inline"></div>
                                        </div>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </c:forEach>
                    <div class="row">
                        <a href="javascript:void(0);" id="addBoxBtn" class="col-sm-12 btn btn-default btn-success btn-app radius-4" style="width: 96%;margin-left: 16px;">
                            <i class="ace-icon fa fa-plus bigger=300"></i>添加
                        </a>
                    </div>
                </div>
            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->

    <div style="position: fixed; opacity: 0.9; width: 100%; bottom: 0; background-color: #EEEEEE; z-index: 9;">
        <div style="margin: 18px auto 0; width: 20%;">
            <button class="btn btn-warning" id="submit" style="width: 40%;">
                提交
            </button>
            <button class="btn btn-success" style="width: 40%; margin-left: 18%;" onclick="goBack()">
                返回
            </button>
        </div>
        
        <jsp:include page="${pageContext.request.contextPath}/common/foot.jsp"/>

<!-- basic scripts -->

<!--[if !IE]> -->
<script src="${pageContent.request.contentPath}/statics/components/jquery/dist/jquery.min.js"></script>

<!-- <![endif]-->

<!--[if IE]>
<script src="${pageContent.request.contentPath}/statics/components/jquery.1x/dist/jquery.js"></script>
<![endif]-->
<script type="text/javascript">
    if('ontouchstart' in document.documentElement) document.write("<script src='${pageContent.request.contentPath}/statics/components/_mod/jquery.mobile.custom/jquery.mobile.custom.js'>"+"<"+"/script>");
</script>
<script src="${pageContent.request.contentPath}/statics/components/bootstrap/dist/js/bootstrap.min.js"></script>

<!-- page specific plugin scripts -->
<script src="${pageContent.request.contentPath}/statics/components/bootbox.js/bootbox.js"></script>
<script src="${pageContent.request.contentPath}/statics/js/bootstrap-dialog.js"></script>
<script src="${pageContent.request.contentPath}/statics/components/bootstrap-datepicker/dist/js/bootstrap-datepicker-CN.js"></script>
<script src="${pageContent.request.contentPath}/statics/components/moment/moment-CN.js"></script>
<script src="${pageContent.request.contentPath}/statics/components/eonasdan-bootstrap-datetimepicker/src/js/bootstrap-datetimepicker.min.js"></script>
<script src="${pageContent.request.contentPath}/statics/components/raty/lib/jquery.raty.js"></script>

<!-- ace scripts -->
<jsp:include page="${pageContent.request.contentPath}/common/ace-script.jsp"/>
<jsp:include page="${pageContext.request.contextPath}/common/time.jsp"/>
<%--<script src="${pageContext.request.contextPath}/statics/js/common.js"></script>--%>

<!-- inline scripts related to this page -->
<script type="text/javascript">
    /*返回上一页，没有就关闭当前页*/
    function goBack(){
        if ((navigator.userAgent.indexOf('MSIE') >= 0) && (navigator.userAgent.indexOf('Opera') < 0)){ // IE
            if(history.length > 0){
                window.history.go( -1 );
            }else{
                window.opener=null;
                window.open('','_self');
                window.close();
            }
        }else{ //非IE浏览器
            if (navigator.userAgent.indexOf('Firefox') >= 0 ||
                    navigator.userAgent.indexOf('Opera') >= 0 ||
                    navigator.userAgent.indexOf('Safari') >= 0 ||
                    navigator.userAgent.indexOf('Chrome') >= 0 ||
                    navigator.userAgent.indexOf('WebKit') >= 0){
                if(window.history.length > 1){
                    window.history.go( -1 );
                }else{
                    window.opener=null;
                    window.open('','_self');
                    window.close();
                }
            }else{ //未知的浏览器
                window.history.go( -1 );
            }
        }
    }
    jQuery(function($) {
        //$.getJSON("${pageContext.request.contextPath}/statics/json/defined_field.json", function(data) {
        $.post("${pageContext.request.contextPath}/enterprise/getUserDefinedFieldName", function(data) {
            $("#main-box").find(".overview").eq(0).append(<jsp:include page="${pageContext.request.contextPath}/common/other-form.jsp" />);
            /*渲染日期时间框 必须在html文档加载完成后渲染*/
            if (!ace.vars['old_ie']) {
                $('#userDefinedFieldFive').datetimepicker({
                    format: 'YYYY/MM/DD h:mm:ss A',//use this option to display seconds
                    icons: {
                        time: 'fa fa-clock-o',
                        date: 'fa fa-calendar',
                        up: 'fa fa-chevron-up',
                        down: 'fa fa-chevron-down',
                        previous: 'fa fa-chevron-left',
                        next: 'fa fa-chevron-right',
                        today: 'fa fa-arrows ',
                        clear: 'fa fa-trash',
                        close: 'fa fa-times'
                    }
                }).next().on(ace.click_event, function(){
                    $(this).prev().focus();
                });
            }

            if (data) {
                var userDefinedFieldName = $(".userDefinedFieldName");
                userDefinedFieldName.eq(0).html(data.userDefinedFieldOneName);
                userDefinedFieldName.eq(1).html(data.userDefinedFieldTwoName);
                userDefinedFieldName.eq(2).html(data.userDefinedFieldThreeName);
                userDefinedFieldName.eq(3).html(data.userDefinedFieldFourName);
                userDefinedFieldName.eq(4).html(data.userDefinedFieldFiveName);
            }
        }, "json");

        /*页面加载前,使用ajax加载下拉框数据*/
        $.post("${pageContext.request.contextPath}/enterprise/getTradeGroup", function(data) {
            var tradeGroupHtml = "";
            $.each(data.rows, function(index, item) {
                tradeGroupHtml += "<option value='"+ item.id +"'>"+ item.name +"</option>";
            });
            $("#tradeGroup").append(tradeGroupHtml);
        }, "json");

        /*渲染信用级别栏*/
        $("#level").raty({
            'cancel' : false,//是否可以取消 default:false
            'half': true,//是否可以选择半星 default:false
            'starType' : 'i',
            'score' : $("#level").attr("data-score"),
            'hints' : ['坏', '不好', '合格', '好', '极好']
        });

        /*渲染日期框*/
        if (!ace.vars['old_ie']) {
            $('#foundDate').datepicker().next().on(ace.click_event, function(){
                $(this).prev().focus();
            });
            $('#approvalDate').datepicker().next().on(ace.click_event, function(){
                $(this).prev().focus();
            });
        }

        /*重置样式*/
        /*第一步：重置所有基本信息，其他信息，必填项重置为has-success*/
        $("#uCCcode,#fullName,#type,#legalRepresentative,#foundDate,#registerDepartment,#approvalDate,#registerState,#mainProduct,#address,#operateRange,#tradeGroup,#contactNameMaster").
                closest(".form-group").removeClass("has-warning").addClass("has-success");
        /*重置图标符号,清除*/
        $("#uCCcode,#type,#legalRepresentative,#foundDate,#registerDepartment,#approvalDate,#registerState,#mainProduct,#address,#operateRange,#contactNameMaster").
                next().remove();
        $("#tradeGroup").parent().next().html("");
        $("#fullName").next().removeClass("fa-info-circle");

        /*验证企业名是否唯一*/
        $("#fullName").bind("blur", function() {
            var $this = $(this);
            /*对于id为fullName的元素需要进行唯一校验*/
            /*再查询是否已存在企业名*/
            if ($this.val() != this.getAttribute("placeholder")) {
                $.get("${pageContext.request.contextPath}/enterprise/isUnique", {"fullName": $this.val()}, function(data) {
                    if (data == "true") {
                        /*如果有 移除success,warning样式 添加error样式*/
                        $this.closest(".form-group").removeClass("has-success").addClass("has-error");
                        $this.next().addClass("fa-times").get(0).setAttribute("title", "企业名称已存在");
                        bootbox.dialog({
                            "message": "该企业名称已存在了，不允许重复哦",
                            "buttons": {
                                "danger": {
                                    "label": "知道了",
                                    "className": "btn-sm btn-warning"
                                }
                            }
                        });
                    } else {
                        /*如果没有，移除error,warning样式 添加success样式*/
                        $this.closest(".form-group").removeClass("has-error").addClass("has-success");
                        $this.next().removeClass("fa-times");
                    }
                }, "text");
            }
        });

        /*接下来：添加操作合作情况的方法*/
        /*动态添加内容，实现点击添加更多合作情况的功能*/
        var boxIndex = $(".cooperation-box").length;//盒子的下标，原始的为0，每次添加一个之前就+1
        $("#addBoxBtn").click(function() {
            boxIndex++;
            $(this).parent().before(<jsp:include page="${pageContext.request.contextPath}/common/cooperation-form.jsp" />);
            handle();
        });

        /*给所有未处理的盒子绑定事件的方法*/
        function handle() {
            //找到所有盒子
            var boxs = $(".cooperation-box");
            boxs.each(function(index, item) {
                //判断盒子是否被处理过
                var isHandle = this.getAttribute("data-handle");
                //对没有处理过的盒子做对应处理
                if (!isHandle) {
                    //获取盒子的ID
                    var boxId = this.getAttribute("data-boxId");
                    /*绑定删除盒子事件*/
                    boxs.delegate("#deleteBoxBtn"+ boxId, "click", function() {
                        if (this) {
                            boxIndex--;
                            $(this).parent().prev().parent().parent().remove();
                            $(".cooperation-box").each(function(index, elem) {
                                $(elem).children().eq(0).find("h3").html("合作情况信息"+(index+1));
                            });
                        }
                    });
                    //绑定验证事件
                    var coopContactNameMaster = $("#coopContactNameMaster"+boxId);
                    var coopContactNameSlave = $("#coopContactNameSlave"+boxId);
                    var coopContactComment = $("#coopContactComment"+boxId);
                    var coopPhoneNumberMaster = $("#coopPhoneNumberMaster"+boxId);
                    var coopPhoneNumberSlave = $("#coopPhoneNumberSlave"+boxId);
                    var defaultValue = coopContactNameMaster.attr("placeholder");
                    //首先判断是否有默认值
                    //如果没有默认值，则要验证
                    if (!defaultValue) {
                        /*验证规则*/
                        var handle = false;
                        coopContactNameMaster.bind({
                            "blur": function() {
                                if (!this.value) {
                                    coopContactNameSlave.attr("data-value", coopContactNameSlave.val());
                                    coopContactNameSlave.attr("disabled", "false");
                                    coopContactNameSlave.val("");
                                    coopContactComment.attr("data-value", coopContactComment.val());
                                    coopContactComment.attr("disabled", "false");
                                    coopContactComment.val("");
                                    coopPhoneNumberMaster.attr("data-value", coopPhoneNumberMaster.val());
                                    coopPhoneNumberMaster.attr("disabled", "false");
                                    coopPhoneNumberMaster.val("");
                                    coopPhoneNumberSlave.attr("data-value", coopPhoneNumberSlave.val());
                                    coopPhoneNumberSlave.attr("disabled", "false");
                                    coopPhoneNumberSlave.val("");
                                    handle = true;
                                }
                            },
                            "focus": function() {
                                coopContactNameSlave.get(0).removeAttribute("disabled");
                                coopContactComment.get(0).removeAttribute("disabled");
                                coopPhoneNumberMaster.get(0).removeAttribute("disabled");
                                coopPhoneNumberSlave.get(0).removeAttribute("disabled");
                                if (handle) {
                                    coopContactNameSlave.val(coopContactNameSlave.attr("data-value"));
                                    coopContactComment.val(coopContactComment.attr("data-value"));
                                    coopPhoneNumberMaster.val(coopPhoneNumberMaster.attr("data-value"));
                                    coopPhoneNumberSlave.val(coopPhoneNumberSlave.attr("data-value"));
                                }
                            }
                        });
                    } else {
                        /*如果有默认值，则不需要任何验证*/
                        coopContactNameSlave.get(0).removeAttribute("disabled");
                        coopContactComment.get(0).removeAttribute("disabled");
                        coopPhoneNumberMaster.get(0).removeAttribute("disabled");
                        coopPhoneNumberSlave.get(0).removeAttribute("disabled");
                    }
                    //设置已处理标签
                    this.setAttribute("data-handle", "Yes");
                }
            });
        }

        /*初始化*/
        handle();

        /*数据提交，给提交按钮绑定事件*/
        $("#submit").click(function() {
            if ($("#enterpriseId").val()) {
                /*获取参数信息*/
                var data_object = {};
                /*第一步：设置必要参数*/
                setDataObject("#enterpriseId", "id", data_object);
                setDataObject("#uCCcode", "uCCcode", data_object);
                setDataObject("#fullName", "fullName", data_object);
                setDataObject("#type", "type", data_object);
                setDataObject("#legalRepresentative", "legalRepresentative", data_object);
                setDataObject("#foundDate", "foundDate", data_object);
                setDataObject("#registerDepartment", "registerDepartment", data_object);
                setDataObject("#approvalDate", "approvalDate", data_object);
                setDataObject("#registerState", "registerState", data_object);
                setDataObject("#mainProduct", "mainProduct", data_object);
                setDataObject("#address", "address", data_object);
                setDataObject("#operateRange", "operateRange", data_object);
                setDataObject("#tradeGroup", "tradeGroupId.id", data_object);
                data_object["level"] = $("#level input[name=score]").val();

                /*第二步：设置其他参数，并且判断是否需要*/
                setDataObject("#website", "website", data_object);
                setDataObject("#simpleName", "simpleName", data_object);
                setDataObject("#registeredCapital", "registeredCapital", data_object);
                setDataObject("#businessDeadlineGo", "businessDeadlineGo", data_object);
                setDataObject("#businessDeadlineTo", "businessDeadlineTo", data_object);
                setDataObject("#exceptionInfo", "exceptionInfo", data_object);
                setDataObject("#dangerInfo", "dangerInfo", data_object);
                setDataObject("#comment", "comment", data_object);
                setDataObject("#contactComment", "contactId.comment", data_object);
                setDataObject("#contactNameMaster", "contactId.nameMaster", data_object);
                setDataObject("#contactNameSlave", "contactId.nameSlave", data_object);
                setDataObject("#phoneNumberMaster", "contactId.phoneNumberMaster", data_object);
                setDataObject("#phoneNumberSlave", "contactId.phoneNumberSlave", data_object);

                /*循环设置企业信息*/
                $(".cooperation-box").each(function(index) {
                    var flag = this.getAttribute("data-boxId");

                    setDataObject("#coopId"+flag, "cooperationList["+ index +"].id", data_object);
                    setDataObject("#projectName"+flag, "cooperationList["+ index +"].projectName", data_object);
                    setDataObject("#productName"+flag, "cooperationList["+ index +"].productName", data_object);
                    setDataObject("#coopContactNameMaster"+flag, "cooperationList["+ index +"].contactId.nameMaster", data_object);
                    setDataObject("#coopContactNameSlave"+flag, "cooperationList["+ index +"].contactId.nameSlave", data_object);
                    setDataObject("#coopContactComment"+flag, "cooperationList["+ index +"].contactId.comment", data_object);
                    setDataObject("#coopPhoneNumberMaster"+flag, "cooperationList["+ index +"].contactId.phoneNumberMaster", data_object);
                    setDataObject("#coopPhoneNumberSlave"+flag, "cooperationList["+ index +"].contactId.phoneNumberSlave", data_object);
                });

                /*设置其他信息*/
                setDataObject("#userDefinedFieldOne", "userDefinedFieldOne", data_object);
                setDataObject("#userDefinedFieldTwo", "userDefinedFieldTwo", data_object);
                setDataObject("#userDefinedFieldThree", "userDefinedFieldThree", data_object);
                setDataObject("#userDefinedFieldFour", "userDefinedFieldFour", data_object);
                setDataObject("#userDefinedFieldFive", "userDefinedFieldFive", data_object);

                /*发送请求*/
                $.post("${pageContext.request.contextPath}/enterprise/update", data_object, function(data) {
                    if(data == "success") {
                        BootstrapDialog.show({
                            title: '提示',
                            message: '修改成功!',
                            onhide: function() {
                                location.href = "${pageContext.request.contextPath}/enterprise/getEnterpriseById?id="+ $("#enterpriseId").val();
                            }
                        });
                    } else {
                        bootbox.dialog({
                            message: "抱歉,出现未知错误,请联系网站管理员!",
                            buttons: {
                                "danger" : {
                                    "label" : "知道了",
                                    "className" : "btn-sm btn-warning"
                                }
                            }
                        });
                    }
                }, "text");
            } else {
                BootstrapDialog.show({
                    title: '错误',
                    message: '参数异常,请刷新后重试!'
                });
            }

        });

        /*辅助设置参数【局部使用】*/
        function setDataObject(selector, field, data) {
            if ($(selector).val())
                data[field] = $(selector).val();
        }

    });
</script>

<!-- the following scripts are used in demo only for onpage help and you don't need them -->
<link rel="stylesheet" href="${pageContent.request.contentPath}/statics/assets/css/ace.onpage-help.css" />
<link rel="stylesheet" href="${pageContent.request.contentPath}/statics/docs/assets/js/themes/sunburst.css" />

<script type="text/javascript"> ace.vars['base'] = '..'; </script>
<script src="${pageContent.request.contentPath}/statics/assets/js/src/elements.onpage-help.js"></script>
<script src="${pageContent.request.contentPath}/statics/assets/js/src/ace.onpage-help.js"></script>
<script src="${pageContent.request.contentPath}/statics/docs/assets/js/rainbow.js"></script>
<script src="${pageContent.request.contentPath}/statics/docs/assets/js/language/generic.js"></script>
<script src="${pageContent.request.contentPath}/statics/docs/assets/js/language/html.js"></script>
<script src="${pageContent.request.contentPath}/statics/docs/assets/js/language/css.js"></script>
<script src="${pageContent.request.contentPath}/statics/docs/assets/js/language/javascript.js"></script>
</body>
</html>


