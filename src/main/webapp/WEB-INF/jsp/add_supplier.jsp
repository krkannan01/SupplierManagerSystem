<%--
  @author xietao.x@qq.com
  Created by 2018/3/19
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>添加供应商信息 - 供应商管理系统</title>

    <meta name="description" content="overview &amp; stats" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

    <link rel="shortcut icon" href="${pageContext.request.contextPath}/statics/favicon.ico" type="image/x-icon" />
    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/assets/css/bootstrap.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/components/font-awesome/css/font-awesome.min.css" />

    <!-- page specific plugin styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/components/_mod/jquery-ui/jquery-ui.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/components/bootstrap-datepicker/dist/css/bootstrap-datepicker3.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/components/eonasdan-bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/components/_mod/jqgrid/ui.jqgrid.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/components/_mod/jquery-ui.custom/jquery-ui.custom.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/components/chosen/chosen.min.css" />

    <!-- text fonts -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/assets/css/ace-fonts.css" />

    <!-- ace styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />

    <!--[if lte IE 9]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/assets/css/ace-part2.css" class="ace-main-stylesheet" />
    <![endif]-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/assets/css/ace-skins.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/assets/css/ace-rtl.css" />

    <!--[if lte IE 9]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/assets/css/ace-ie.css" />
    <![endif]-->

    <style type="text/css">
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
        .radius-5 {
            border-top-right-radius: 5px;
            border-top-left-radius: 5px;
            border-bottom-right-radius:5px;
            border-bottom-left-radius:5px;
            width:100px;
        }
    </style>

    <!-- ace settings handler -->
    <script src="${pageContext.request.contextPath}/statics/assets/js/ace-extra.js"></script>

    <!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

    <!--[if lte IE 8]>
    <script src="${pageContext.request.contextPath}/statics/components/html5shiv/dist/html5shiv.min.js"></script>
    <script src="${pageContext.request.contextPath}/statics/components/respond/dest/respond.min.js"></script>
    <![endif]-->
</head>

<jsp:include page="${pageContext.request.contextPath}/common/head.jsp"/>

<!-- /section:basics/navbar.layout -->
<div class="main-container ace-save-state" id="main-container">
    <script type="text/javascript">
        try{ace.settings.loadState('main-container')}catch(e){}
    </script>

    <% request.setAttribute("active","Supplier-Insert"); %>
    <jsp:include page="${pageContext.request.contextPath}/common/menu.jsp"/>

    <!-- /section:basics/sidebar -->
    <div class="main-content">
        <div class="main-content-inner">

            <!-- /section:basics/content.breadcrumbs -->
            <div class="page-content">

                <!-- /section:settings.box -->
                <div class="page-header">
                    <h1>
                        供应商信息管理
                        <small>
                            <i class="ace-icon fa fa-angle-double-right"></i>
                            新增供应商信息
                        </small>
                    </h1>
                </div><!-- /.page-header -->

                <div class="row">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->
                        <div class="widget-box">
                            <div class="widget-header widget-header-blue widget-header-flat">
                                <h4 class="widget-title lighter"> 添加供应商信息 </h4>

                            </div>

                            <div class="widget-body">
                                <div class="widget-main">
                                    <!-- #section:plugins/fuelux.wizard -->
                                    <div id="fuelux-wizard-container">
                                        <div>
                                            <!-- #section:plugins/fuelux.wizard.steps -->
                                            <ul class="steps">
                                                <li data-step="1" class="active">
                                                    <span class="step">1</span>
                                                    <span class="title">填写基本信息</span>
                                                </li>

                                                <li data-step="2">
                                                    <span class="step">2</span>
                                                    <span class="title">添加联系人信息</span>
                                                </li>

                                                <li data-step="3">
                                                    <span class="step">3</span>
                                                    <span class="title">添加合作信息</span>
                                                </li>

                                                <li data-step="4">
                                                    <span class="step">4</span>
                                                    <span class="title">添加其他信息</span>
                                                </li>

                                                <li data-step="5">
                                                    <span class="step">5</span>
                                                    <span class="title">提交</span>
                                                </li>
                                            </ul>

                                            <!-- /section:plugins/fuelux.wizard.steps -->
                                        </div>

                                        <hr />

                                        <!-- #section:plugins/fuelux.wizard.container -->
                                        <div class="step-content pos-rel">
                                            <div class="step-pane active" data-step="1">
                                                <h3 class="lighter block green" style="margin-top: 0;">输入企业信息</h3>
                                                <hr />
                                                
                                                <jsp:include page="${pageContext.request.contextPath}/common/supplier-form.jsp"/>

                                                <div class="col-sm-12 hr hr12"></div>

                                            </div>

                                            <div class="step-pane" data-step="2">
                                                <h3 class="lighter block green" style="margin-top: 0;">输入企业联系人信息</h3>
                                                <hr />

                                                <jsp:include page="${pageContext.request.contextPath}/common/contact-form.jsp"/>

                                                <div class="col-sm-12 hr hr12"></div>

                                            </div>

                                            <div class="step-pane" data-step="3">
                                                <h3 class="lighter block green" style="margin-top: 0;">输入合作情况信息</h3>
                                                <hr />

                                                <div class="row">
                                                    <a href="javascript:void(0);" id="addBoxBtn" class="col-sm-12 btn btn-default btn-success btn-app radius-4" style="width: 96%;margin-left: 16px;">
                                                        <i class="ace-icon fa fa-plus bigger=300"></i>更多
                                                    </a>
                                                </div>

                                                <div class="row hr hr12"></div>
                                            </div>

                                            <div class="step-pane" data-step="4">
                                                <h3 class="lighter block green" style="margin-top: 0;">补充其它信息</h3>
                                                <hr />

                                                <div class="col-sm-12 hr hr12"></div>
                                            </div>

                                            <div class="step-pane" data-step="5">
                                                <div class="row green none" style="border: 1px dashed green; width: 80%; height: 160px; margin: 0 auto;">
                                                    <div class="col-sm-12"><h1 style="margin: 0;"><i class="fa fa-check-circle bigger-300 green" style="margin-left: 45%;margin-top: 12px;"></i></h1></div>
                                                    <div class="col-sm-12 center">信息已成功提交...</div>
                                                </div>
                                                <div class="row orange" style="border: 1px dashed orange; width: 80%; height: 160px; margin: 0 auto;">
                                                    <div class="col-sm-12"><h1 style="margin: 0;"><i class="ace-icon fa fa-spinner fa-spin bigger-200 orange" style="margin-left: 45%;margin-top: 24px;"></i></h1></div>
                                                    <div class="col-sm-12 center">信息正在提交中,请稍候...</div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- /section:plugins/fuelux.wizard.container -->
                                    </div>

                                    <div class="wizard-actions">
                                        <!-- #section:plugins/fuelux.wizard.buttons -->
                                        <button class="btn btn-warning btn-prev btn-round btn-white">
                                            <i class="ace-icon fa fa-arrow-left"></i>
                                            上一步
                                        </button>

                                        <button class="btn btn-success btn-next btn-round btn-white" data-last="确 定 ">
                                            下一步
                                            <i class="ace-icon fa fa-arrow-right icon-on-right"></i>
                                        </button>

                                        <!-- /section:plugins/fuelux.wizard.buttons -->
                                    </div>

                                    <!-- /section:plugins/fuelux.wizard -->
                                </div><!-- /.widget-main -->
                            </div><!-- /.widget-body -->
                        </div>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->

    <jsp:include page="${pageContext.request.contextPath}/common/foot.jsp"/>

</div>

<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
    <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
</a>

</div><!-- /.main-container -->
<!-- basic scripts -->

<!--[if !IE]> -->
<script src="${pageContext.request.contextPath}/statics/components/jquery/dist/jquery.min.js"></script>

<!-- <![endif]-->

<!--[if IE]>
<script src="${pageContext.request.contextPath}/statics/components/jquery.1x/dist/jquery.js"></script>
<![endif]-->
<script type="text/javascript">
    if('ontouchstart' in document.documentElement) document.write("<script src='${pageContext.request.contextPath}/statics/components/_mod/jquery.mobile.custom/jquery.mobile.custom.js'>"+"<"+"/script>");
</script>
<script src="${pageContext.request.contextPath}/statics/components/bootstrap/dist/js/bootstrap.min.js"></script>

<!--[if lte IE 8]>
<script src="${pageContext.request.contextPath}/statics/components/ExplorerCanvas/excanvas.js"></script>
<![endif]-->
<!-- page specific plugin scripts -->
<script src="${pageContext.request.contextPath}/statics/components/fuelux/js/wizard.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/jquery-validation/dist/jquery.validate.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/jquery-validation/dist/additional-methods.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/bootbox.js/bootbox.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/jquery.maskedinput/dist/jquery.maskedinput.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/select2/dist/js/select2.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/bootstrap-datepicker/dist/js/bootstrap-datepicker-CN.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/moment/moment-CN.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/eonasdan-bootstrap-datetimepicker/src/js/bootstrap-datetimepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/raty/lib/jquery.raty.js"></script>
<%--<script src="${pageContext.request.contextPath}/statics/components/chosen/chosen.jquery.js"></script>--%>

<script src="${pageContext.request.contextPath}/statics/js/common.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/layer/layer.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/ry-common.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/ry-ui.js"></script>

<!-- ace scripts -->
<jsp:include page="${pageContext.request.contextPath}/common/ace-script.jsp"/>
<jsp:include page="${pageContext.request.contextPath}/common/time.jsp"/>

<!-- inline scripts related to this page -->
<script type="text/javascript">

    jQuery(function($) {

        /*下一步按钮*/
        var next = $(".wizard-actions > .btn-next");
        next.attr("disabled", "true");

        /*渲染步骤条*/
        $('#fuelux-wizard-container')
            /*初始化步骤条样式*/
                .ace_wizard(
                //{step: 4} //直接显示第3页
                )
            /*步骤条改变事件 arg0:自身 arg1:当前步骤*/
                .on('changed.fu.wizard', function(self, step) {
                    /*如果是第5步：提交*/
                    if (step.step == 5) {
                        /*如果数据没有提交过,则进行提交操作*/
                        if ($(".step-content > .step-pane[data-step='5'] > .green.none").length > 0) {
                            /*禁用下一步按钮*/
                            next.attr("disabled", "true");

                            var data_object = {};
                            /*第一步：设置必要参数*/
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

                            /*第五步：发送请求*/
                            $.post("${pageContext.request.contextPath}/enterprise/insert", data_object, function(data) {
                                if(data == "success") {
                                    $(".step-content > .step-pane[data-step='5'] > .green.none").removeClass("none").next().addClass("none");
                                    next.removeAttr("disabled");
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
                        }
                    }
                })
            /*步骤条确定事件*/
                .on('finished.fu.wizard', function(e) {
                    /*点击完成后刷新页面*/
                    location.reload();
                });

        /*辅助设置参数【局部使用】*/
        function setDataObject(selector, field, data) {
            if ($(selector).val())
                data[field] = $(selector).val();
        }

        /*页面加载前,使用ajax加载下拉框数据*/
        $.post("${pageContext.request.contextPath}/enterprise/getTradeGroup", function(data) {
            var tradeGroupHtml = "";
            if (data.rows != null && data.rows.length > 0) {
                $.each(data.rows, function(index, item) {
                    tradeGroupHtml += "<option value='"+ item.id +"'>"+ item.name +"</option>";
                });
            }
            $("#tradeGroup").append(tradeGroupHtml);
        }, "json");

        /*实现信用级别栏的 初始化*/
        $("#supplier-form #level").raty({
            'cancel' : false,//是否可以取消 default:false
            'half': true,//是否可以选择半星 default:false
            'starType' : 'i',
            'score' : 3,
            'hints' : ['坏', '不好', '合格', '好', '极好']
        });

        /*实现第一页的表单验证功能 企业基本信息验证*/
        $("#uCCcode,#fullName,#type,#legalRepresentative,#foundDate,#registerDepartment,#approvalDate,#registerState,#mainProduct,#address,#operateRange,#tradeGroup").bind({
            "blur": function() {
                /*思路：给需要验证的元素绑定失去焦点事件
                 如果当前元素的值不为空，则设置该元素的样式为has-success,图标为√
                 然后，查找has-warning类元素，没有则设置下一步的状态为启动*/
                var $this = $(this);
                /*对于id为fullName的元素需要进行唯一校验*/
                if (this.getAttribute("id") == "fullName") {
                    if ($this.val()) {
                        /*如果值不为空*/
                        /*再查询是否已存在企业名*/
                        $.get("${pageContext.request.contextPath}/enterprise/isUnique", {"fullName": $this.val()}, function(data) {
                            if (data == "true") {
                                /*如果有 移除success,warning样式 添加error样式*/
                                convert_error($this, "企业名称已存在");
                                $.modalMsg("该企业名称已存在了，不允许重复添加哦", "warning");

                            } else {
                                /*如果没有，移除error,warning样式 添加success样式*/
                                convert_success($this, "通过验证");
                            }
                        }, "text");
                    } else {
                        convert_warning($this, "必填项");
                    }
                }
                /*对于id为tradeGroup的元素需要进行另类的验证*/
                else if (this.getAttribute("id") == "tradeGroup") {
                    if ($this.val() > 0) {
                        convert_success($this, "通过验证");
                    } else {
                        convert_warning($this, "必填项");
                    }
                }
                /*剩下的统一使用以下方法验证*/
                else {
                    if ($this.val()) {
                        convert_success($this, "通过验证");
                    } else {
                        convert_warning($this, "必填项");
                    }
                }

                if ($("#supplier-form .has-warning,.has-error").length < 1) {
                    next.removeAttr("disabled");
                } else {
                    next.attr("disabled", "true");
                }
            },
            "focus": function() {
                next.attr("disabled", "true");
            }
        });

        /*初始化时禁用next按钮*/
        $("#uCCcode").focus();

        /*实现第二页的表单验证功能 企业联系人信息验证*/
        $("#contactNameMaster").bind({
            "blur": function() {
                var $this = $(this);
                if ($this.val()) {
                    convert_success($this, "通过验证");
                } else {
                    convert_warning($this, "必填项");
                }
                if ($("#contact-form .has-warning").length < 1) {
                    next.removeAttr("disabled");
                } else {
                    next.attr("disabled", "false");
                }
            },
            "focus": function() {
                next.attr("disabled", "false");
            }
        });

        /*动态添加内容，实现点击添加更多合作情况的功能*/
        var boxIndex = 0;//盒子的下标，原始的为0，每次添加一个之前就+1
        $("#addBoxBtn").click(function() {
            boxIndex++;
            $(this).parent().before(<jsp:include page="${pageContext.request.contextPath}/common/cooperation-form.jsp" />);

            /*别急，每生成一次都要给对应的盒子添加相应的事件*/
            var boxs = $(".cooperation-box");
            /*绑定删除盒子事件*/
            boxs.delegate("#deleteBoxBtn"+ boxIndex, "click", function() {
                if (this) {
                    boxIndex--;
                    $(this).parent().prev().parent().parent().remove();
                    $(".cooperation-box").each(function(index, elem) {
                        $(elem).children().eq(0).find("h3").html("合作情况信息"+(index+1));
                    });
                }
            });
            /*给最后一个盒子里的元素绑定事件*/
            var lastBoxId = boxs.eq(boxs.length-1).attr("data-boxId");
            var coopContactNameMaster = $("#coopContactNameMaster"+lastBoxId);
            var coopContactNameSlave = $("#coopContactNameSlave"+lastBoxId);
            var coopContactComment = $("#coopContactComment"+lastBoxId);
            var coopPhoneNumberMaster = $("#coopPhoneNumberMaster"+lastBoxId);
            var coopPhoneNumberSlave = $("#coopPhoneNumberSlave"+lastBoxId);
            var handle = false;
            coopContactNameMaster.bind({
               "blur": function() {
                   if (!this.value) {
                       alert(123);
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
        });

        /*初始化时生成一次*/
        $("#addBoxBtn").click();

        /*获取预定义的字段名称数据*/
        //暂时不采用json文件
        //$.getJSON("${pageContext.request.contextPath}/statics/json/defined_field.json", function(data) {
        $.post("${pageContext.request.contextPath}/enterprise/getUserDefinedFieldName", function(data) {
            /*初始化时生成其他信息表单*/
            $(".step-pane[data-step=4]").html(<jsp:include page="${pageContext.request.contextPath}/common/other-form.jsp" />);

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

            /*绑定修改名称事件*/
            /*$("#other-form .form-group .userDefinedFieldName").bind({
                "mouseover": function() {
                    this.style.color = "orange";
                    this.style.cursor = "pointer";
                    this.style.borderBottom = "1px dashed orange";
                },
                "mouseout": function() {
                    this.style.color = "";
                    this.style.cursor = "";
                    this.style.borderBottom = "";
                },
                "click": function() {
                    this.style.display = "none";
                    $(this).after("<input class='radius-5' onblur='recover()' />");
                }
            });*/

        }, "json");

        /*渲染日期选择框*/
        if(!ace.vars['old_ie']) {
            $('#foundDate').datepicker().next().on(ace.click_event, function(){
                $(this).prev().focus();
            });
            $('#approvalDate').datepicker().next().on(ace.click_event, function(){
                $(this).prev().focus();
            });

        }

    });
    /*function recover() {
        var $this = $(this);
        if (this.value) {
            $this.prev().html(this.value);
        }
        console.log($this.prev().prop("tagName"));
        $this.parent().find("label").get(0).style.display = "block";
        $this.remove();
    }*/
</script>

<!-- the following scripts are used in demo only for onpage help and you don't need them -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/statics/assets/css/ace.onpage-help.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/statics/docs/assets/js/themes/sunburst.css" />

<script type="text/javascript"> ace.vars['base'] = '..'; </script>
<script src="${pageContext.request.contextPath}/statics/assets/js/src/elements.onpage-help.js"></script>
<script src="${pageContext.request.contextPath}/statics/assets/js/src/ace.onpage-help.js"></script>
<script src="${pageContext.request.contextPath}/statics/docs/assets/js/rainbow.js"></script>
<script src="${pageContext.request.contextPath}/statics/docs/assets/js/language/generic.js"></script>
<script src="${pageContext.request.contextPath}/statics/docs/assets/js/language/html.js"></script>
<script src="${pageContext.request.contextPath}/statics/docs/assets/js/language/css.js"></script>
<script src="${pageContext.request.contextPath}/statics/docs/assets/js/language/javascript.js"></script>
</body>
</html>


