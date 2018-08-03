<%--
  @author xietao.x@qq.com
  Created by 2018/3/15
--%>
<%@ page import="cn.xt.sms.entity.Supplier" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
    String foundDate = "",approvalDate = "",udfFive = "";
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
    SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy年MM月dd日 HH时mm分ss秒");
    Supplier ep = (Supplier) request.getAttribute("supplier");
    if (ep.getFoundDate() != null)
        foundDate = sdf.format(ep.getFoundDate());
    if (ep.getApprovalDate() != null)
        approvalDate = sdf.format(ep.getApprovalDate());
    if (ep.getUserDefinedFieldFive() != null)
        udfFive = sdf2.format(ep.getUserDefinedFieldFive());
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>供应商详情 - 供应商管理系统</title>

    <meta name="description" content="overview &amp; stats" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

    <link rel="shortcut icon" href="${pageContext.request.contextPath}/statics/favicon.ico" type="image/x-icon" />
    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/assets/css/bootstrap.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/components/font-awesome/css/font-awesome.min.css" />

    <!-- page specific plugin styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/components/_mod/jquery-ui/jquery-ui.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/components/bootstrap-datepicker/dist/css/bootstrap-datepicker3.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/components/_mod/jqgrid/ui.jqgrid.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/bootstrap-dialog.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/components/dropzone/dist/dropzone.css" />

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

    <!-- inline styles related to this page -->
    <style>
        .page-content { margin-bottom: 0; }
        /*左边距设置为10px*/
        .l10{font-size:15px;margin-left:10px;margin-right:5px;color:#266eb6}
        /*字体大小设置为15px*/
        .f15{font-size:15px;color:#666;margin-left:2px}
        .overview dt{display:inline-block;font-weight:700!important;line-height:25px;padding-left:10px;position:relative}
        .overview dd{display:inline;line-height:25px;margin-left:10px;color:#3c763d}
        .overview dl{display:inline}
        /*虚线分界线样式*/
        .demarcation{height:1px;border:none;border-top:1px dashed orange}

        .item { background: #D9EDF7; color: #31708f; line-height: 2.5; margin-top: 5px; border-radius: 3px; -moz-border-radius: 3px; -webkit-border-radius: 3px; }

        /* 表格部分样式. */
        .table-a:hover{color:deepskyblue;text-decoration:none;}

        /* 排序图标样式. */
        th[class^="sort-"].active{color:#307ECC;}
        th[class^="sort-"]:hover{color:orange;}
        th[class^="sort-"]:after{float:right;display:inline;content:"\f0dc";font-family:FontAwesome;font-size:13px;font-weight:normal;}
        th[class^="sort-"].active.active-up:after{content:"\f0de";top:4px;}
        th[class^="sort-"].active.active-down:after{content:"\f0dd";top:-6px;}

        /* 详情展示样式 */
        .col-sm-12.item { width: 75%; }
        .col-sm-6.item { width: 48%; margin-right: 2%; }
        .header.smaller { font-size: 18px; margin: 0; margin-top: 10px; width: 98%; }

        iframe { width: 100%; height: 100%; border: 0; }
    </style>

    <!-- ace settings handler -->
    <script src="${pageContext.request.contextPath}/statics/assets/js/ace-extra.js"></script>

    <!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

    <!--[if lte IE 8]>
    <script src="${pageContext.request.contextPath}/statics/components/html5shiv/dist/html5shiv.min.js"></script>
    <script src="${pageContext.request.contextPath}/statics/components/respond/dest/respond.min.js"></script>
    <![endif]-->



</head>
<body>
<!-- /section:basics/navbar.layout -->
<div class="main-container ace-save-state" id="main-container">
    <script type="text/javascript">
        try{ace.settings.loadState('main-container')}catch(e){}
    </script>

    <!-- /section:basics/sidebar -->
    <div class="main-content">
        <div class="main-content-inner">

            <!-- /section:basics/content.breadcrumbs -->
            <div class="page-content">

                <div class="row">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->
                        <div class="">
                            <div class="row">
                                <div class="col-sm-12 col-xs-6">
                                    <div class="widget-box transparent" id="recent-box">
                                        <div class="widget-header" style="background-color: #EFF3F8;">
                                            <%--<h4 class="widget-title lighter smaller" style="dispaly: inline;float: left;">
                                                <span class="label label-pink label-lg arrowed-left">条件筛选</span>
                                            </h4>--%>
                                            <div class="widget-toolbar no-border" style="float:left;">
                                                <ul class="nav nav-tabs" id="recent-tab">
                                                    <li class="active"> <a data-toggle="tab" href="#basic-tab"> 基本信息 </a> </li>
                                                    <li> <a data-toggle="tab" href="#product-tab"> 产品信息 </a> </li>
                                                    <li> <a data-toggle="tab" href="#contact-tab"> 联系人信息 </a> </li>
                                                    <li> <a data-toggle="tab" href="#cooperation-tab"> 合作情况信息 </a> </li>
                                                    <li> <a data-toggle="tab" href="#file-tab"> 相关档案 </a> </li>
                                                    <li> <a data-toggle="tab" href="#other-tab"> 其它信息 </a> </li>
                                                </ul>
                                            </div>
                                        </div>

                                        <div class="widget-body">
                                            <div class="widget-main padding-4">
                                                <div class="tab-content padding-8">
                                                    <div id="basic-tab" class="tab-pane active">
                                                        <div class="row overview">

                                                            <div class="header smaller red col-sm-12" style="margin-top: 0;">重要信息</div>

                                                            <div class="col-sm-6 item"> <dl> <dt>企业名称：</dt> <dd>${supplier.fullName}</dd> </dl></div>
                                                            <div class="col-sm-6 item"><dl><dt>统一社会信用代码：</dt> <dd><%=((Supplier)request.getAttribute("supplier")).getUCCcode()%></dd> </dl></div>

                                                            <div class="col-sm-6 item"> <dl> <dt>法定代表人：</dt> <dd>${supplier.legalRepresentative}</dd> </dl> </div>
                                                            <div class="col-sm-6 item"><dl> <dt>企业类型：</dt> <dd>${supplier.type}</dd> </dl> </div>

                                                            <div class="col-sm-6 item"> <dl> <dt>公司网站：</dt> <dd>${supplier.website}</dd> </dl> </div>
                                                            <%--<div class="col-sm-6 item"> <dl> <dt>公司简称：</dt> <dd>${supplier.simpleName}</dd> </dl> </div>--%>
                                                            <div class="col-sm-6 item"> <dl> <dt>注册资本：</dt> <dd>${supplier.registeredCapital}</dd> </dl> </div>


                                                            <div class="header smaller orange col-sm-12">经营信息</div>

                                                            <div class="col-sm-6 item"> <dl> <dt>登记状态：</dt> <dd>${supplier.registerState}</dd> </dl> </div>
                                                            <div class="col-sm-6 item"> <dl> <dt>主营产品：</dt> <dd>${supplier.mainProduct}</dd> </dl> </div>

                                                            <div class="col-sm-6 item"> <dl> <dt>分组：</dt> <dd>${supplier.tradeGroupId.name}</dd> </dl> </div>
                                                            <div class="col-sm-6 item"> <dl> <dt>信用级别：</dt> <dd><div class="rating inline" style="margin-top: 3px;" id="level" data-score="${supplier.level}"></div></dd> </dl> </div>

                                                            <div class="col-sm-12 item"> <dl> <dt>住所：</dt> <dd>${supplier.address}</dd> </dl> </div>
                                                            <div class="col-sm-12 item"> <dl> <dt>经营范围：</dt> <dd>${supplier.operateRange}</dd> </dl> </div>


                                                            <div class="header smaller green col-sm-12">一般信息</div>

                                                            <div class="col-sm-6 item"> <dl> <dt>成立日期：</dt> <dd><%=foundDate%></dd> </dl> </div>
                                                            <div class="col-sm-6" style="width: 100%;"><%-- 起到 "换行" 的作用 --%></div>

                                                            <div class="col-sm-6 item"> <dl> <dt>登记机关：</dt> <dd>${supplier.registerDepartment}</dd> </dl> </div>
                                                            <div class="col-sm-6 item"> <dl> <dt>核准日期：</dt> <dd><%=approvalDate%></dd> </dl> </div>

                                                            <div class="col-sm-6 item"> <dl> <dt>营业期限自：</dt> <dd>${supplier.businessDeadlineGo}</dd> </dl> </div>
                                                            <div class="col-sm-6 item"> <dl> <dt>营业期限至：</dt> <dd>${supplier.businessDeadlineTo}</dd> </dl> </div>


                                                            <div class="header smaller col-sm-12" style="color: lightseagreen;">异常信息</div>

                                                            <div class="col-sm-12 item"> <dl> <dt>经营异常信息：</dt> <dd>${supplier.exceptionInfo}</dd> </dl> </div>
                                                            <div class="col-sm-12 item"> <dl> <dt>违法失信信息：</dt> <dd>${supplier.dangerInfo}</dd> </dl> </div>

                                                        </div>
                                                    </div>

                                                    <div id="product-tab" class="tab-pane">
                                                        <%--<div class="nav-search" id="nav-search" style="margin-top: 8px;width: 200px; display: block; position: inherit; margin: 10px auto;">
                                                            <form class="form-search" action="javascript: void(0);">
                                                                <span class="input-icon">
                                                                    <input type="text" placeholder="输入关键字查询" class="nav-search-input" id="keywords" autocomplete="off" style="width: 300px;" />
                                                                    <i class="ace-icon fa fa-search nav-search-icon"></i>
                                                                </span>
                                                            </form>
                                                        </div>
                                                        <table id="product-table" class="table table-bordered table-hover">
                                                            <thead>
                                                            <tr style="background: -webkit-linear-gradient(top, #A4E0F5, #F2F2F2);
                                                                       background:    -moz-linear-gradient(top, #A4E0F5, #F2F2F2);
                                                                       background:      -o-linear-gradient(top, #A4E0F5, #F2F2F2);
                                                                       background:         linear-gradient(top, #A4E0F5, #F2F2F2);">
                                                                <th>序号</th>
                                                                <th class="center"> <label class="pos-rel"> <input type="checkbox" class="ace" /> <span class="lbl"></span> </label> </th>
                                                                <th>产品编号</th>
                                                                <th>产品名称</th>
                                                                <th>产品规格</th>
                                                                <th>品牌</th>
                                                                <th>技术参数</th>
                                                                <th>价格-单位</th>
                                                                <th>备注</th>
                                                                <th>所属分组</th>
                                                                <th>操作</th>
                                                            </tr>
                                                            </thead>
                                                            <tbody></tbody>
                                                        </table>--%>
                                                        <iframe id="product-iframe" style="height: 590px;" src="${pageContext.request.contextPath}/supplier/toSupplierDetailProduct?id=${supplier.id}"></iframe>
                                                    </div>

                                                    <div id="contact-tab" class="tab-pane">
                                                        <c:if test="${supplier.contactId != null}">
                                                            <div class="row overview">
                                                                <div class="col-sm-12 item"> <dl> <dt>主要联系人名称：</dt> <dd>${supplier.contactId.nameMaster}</dd> </dl> </div>

                                                                <div class="col-sm-12 item"> <dl> <dt>次要联系人名称：</dt> <dd>${supplier.contactId.nameSlave}</dd> </dl> </div>

                                                                <div class="col-sm-12 item"> <dl> <dt>主要联系方式：</dt> <dd>${supplier.contactId.phoneNumberMaster}</dd> </dl> </div>

                                                                <div class="col-sm-12 item"> <dl> <dt>次要联系方式：</dt> <dd>${supplier.contactId.phoneNumberSlave}</dd> </dl> </div>

                                                                <div class="col-sm-12 item"> <dl> <dt>备注：</dt> <dd>${supplier.contactId.comment}</dd> </dl> </div>
                                                            </div>
                                                        </c:if>
                                                    </div>

                                                    <div id="cooperation-tab" class="tab-pane">
                                                        <c:choose>
                                                            <c:when test="${supplier.cooperationList != null and supplier.cooperationList.size() > 0}">
                                                                <c:forEach items="${supplier.cooperationList}" var="cooperation" varStatus="index">
                                                                    <div class="col-sm-12"><div class="space-10"></div></div>

                                                                    <div class="col-sm-12 overview" style="border: 1px dashed yellow">
                                                                        <div class="col-sm-5 col-sm-offset-5">
                                                                            <div class="space-4"></div>
                                                                            <b>合作情况${index.count}</b>
                                                                            <div class="space-4"></div>
                                                                        </div>
                                                                        
                                                                        <div class="col-sm-12 item"> <dl> <dt>项目名称：</dt> <dd>${cooperation.projectName}</dd> </dl> </div>
                                                                        
                                                                        <div class="col-sm-12 item"> <dl> <dt>产品名称：</dt> <dd>${cooperation.productName}</dd> </dl> </div>
                                                                        
                                                                        <div class="col-sm-12 item"> <dl> <dt>主要联系人名称：</dt> <dd>${cooperation.contactId != null ? cooperation.contactId.nameMaster:""}</dd> </dl> </div>
                                                                        
                                                                        <div class="col-sm-12 item"> <dl> <dt>次要联系人名称：</dt> <dd>${cooperation.contactId != null ? cooperation.contactId.nameSlave:""}</dd> </dl> </div>
                                                                        
                                                                        <div class="col-sm-12 item"> <dl> <dt>主要联系方式：</dt> <dd>${cooperation.contactId != null ? cooperation.contactId.phoneNumberMaster:""}</dd> </dl> </div>
                                                                        
                                                                        <div class="col-sm-12 item"> <dl> <dt>次要联系方式：</dt> <dd>${cooperation.contactId != null ? cooperation.contactId.phoneNumberSlave:""}</dd> </dl> </div><div class="col-sm-12 item">
                                                                        
                                                                        <div class="col-sm-12 item"> <dl> <dt>备注：</dt> <dd>${cooperation.contactId != null ? cooperation.contactId.comment:""}</dd> </dl> </div>
                                                                    </div>
                                                                    </div>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <div class="col-sm-12"><div class="space-10"></div></div>
                                                                <div class="col-sm-12 overview" style="border: 1px dashed yellow">
                                                                    <div class="col-sm-5 col-sm-offset-5">
                                                                        <div class="space-4"></div>
                                                                        <b>无合作情况</b>
                                                                        <div class="space-4"></div>
                                                                    </div>
                                                                </div>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>

                                                    <div id="file-tab" class="tab-pane">
                                                        <%--<table id="file-table" class="table table-bordered table-hover">
                                                            <thead>
                                                            <tr style="background: -webkit-linear-gradient(top, #A4E0F5, #F2F2F2);
                                                                       background:    -moz-linear-gradient(top, #A4E0F5, #F2F2F2);
                                                                       background:      -o-linear-gradient(top, #A4E0F5, #F2F2F2);
                                                                       background:         linear-gradient(top, #A4E0F5, #F2F2F2);">
                                                                <th width="5%">序号</th>
                                                                <th width="5%" class="center"> <label class="pos-rel"> <input type="checkbox" class="ace" /> <span class="lbl"></span> </label> </th>
                                                                <th class="sort-name" style="background: inherit;">名称</th>
                                                                <th width="20%">类型</th>
                                                                <th>描述</th>
                                                                <th>附件</th>
                                                                <th width="10%">操作</th>
                                                            </tr>
                                                            </thead>

                                                            <tr>
                                                                <tr>
                                                                    <td>1</td>
                                                                    <td class="center"> <label class="pos-rel"> <input type="checkbox" class="ace" /> <span class="lbl"></span> </label> </td>
                                                                    <td>营业执照</td>
                                                                    <td>税务登记证</td>
                                                                    <td></td>
                                                                    <td>yyzz.jpg</td>
                                                                    <td>
                                                                        <shiro:hasAnyPermission name='admin,deleteFile'>
                                                                        <button class='btn btn-xs btn-round btn-danger deleteProduct' data-id='1'> <i class='ace-icon fa fa-trash-o bigger-120'></i>删除 </button>
                                                                        </shiro:hasAnyPermission>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>--%>
                                                        <iframe id="file-iframe" style="height: 590px;" src="${pageContext.request.contextPath}/supplier/toSupplierDetailDocument?id=${supplier.id}"></iframe>
                                                    </div>

                                                    <div id="other-tab" class="tab-pane">
                                                        <div class="row overview">
                                                            <div class="col-sm-12 item"> <dl> <dt><span class="userDefinedFieldName">自定义1</span>：</dt> <dd>${supplier.userDefinedFieldOne}</dd> </dl> </div>

                                                            <div class="col-sm-12 item"> <dl> <dt><span class="userDefinedFieldName">自定义2</span>：</dt> <dd>${supplier.userDefinedFieldTwo}</dd> </dl> </div>

                                                            <div class="col-sm-12 item"> <dl> <dt><span class="userDefinedFieldName">自定义3</span>：</dt> <dd>${supplier.userDefinedFieldThree}</dd> </dl> </div>

                                                            <div class="col-sm-12 item"> <dl> <dt><span class="userDefinedFieldName">自定义4</span>：</dt> <dd>${supplier.userDefinedFieldFour}</dd> </dl> </div>

                                                            <div class="col-sm-12 item"> <dl> <dt><span class="userDefinedFieldName">自定义5</span>：</dt> <dd><%=udfFive%></dd> </dl> </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div><!-- /.widget-main -->
                                        </div><!-- /.widget-body -->
                                    </div><!-- /.widget-box -->
                                </div><!-- /.col -->
                            </div>
                        </div>

                    </div>
                </div>
            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->
</div>

<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
    <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
</a>

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

<!-- ace scripts -->
<jsp:include page="${pageContext.request.contextPath}/common/ace-script.jsp"/>
<jsp:include page="${pageContext.request.contextPath}/common/time.jsp"/>

<!-- page specific plugin scripts -->
<script src="${pageContext.request.contextPath}/statics/assets/js/src/elements.treeview-modified-version.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/_mod/fuelux/tree-modified-version.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/datatables/media/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/_mod/datatables/jquery.dataTables.bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/datatables.net-buttons/js/buttons.flash.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/datatables.net-buttons/js/buttons.html5.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/datatables.net-buttons/js/buttons.print.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/datatables.net-buttons/js/buttons.colVis.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/datatables.net-select/js/dataTables.select.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/_mod/jquery-ui.custom/jquery-ui.custom.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/jqueryui-touch-punch/jquery.ui.touch-punch.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/_mod/easypiechart/jquery.easypiechart.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/jquery.sparkline/index.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/Flot/jquery.flot.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/Flot/jquery.flot.pie.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/Flot/jquery.flot.resize.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/fuelux/js/spinbox.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/bootbox.js/bootbox.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/bootstrap-dialog.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/raty/lib/jquery.raty.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/dropzone/dist/dropzone.js"></script>

<script src="${pageContext.request.contextPath}/statics/js/table.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/common.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/layer/layer.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/ry-common.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/ry-ui.js"></script>

<!-- inline scripts related to this page -->
<script type="text/javascript">
    const $ctx = "${pageContext.request.contextPath}";
    var $id = "${supplier.id}";
</script>
<script src="${pageContext.request.contextPath}/statics/js/project/supplier/detail_iframe.js"></script>

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

