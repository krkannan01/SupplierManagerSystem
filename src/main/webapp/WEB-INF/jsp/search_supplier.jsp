<%--
  @author xietao.x@qq.com
  Created by 2018/3/15
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>查询供应商信息 - 供应商管理系统</title>

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
        /* styling the grid page's grid elements */
        .center {
            text-align: center;
        }
        .center [class*="col-"] {
            margin-top: 2px;
            margin-bottom: 2px;

            position: relative;
            text-overflow: ellipsis;
        }
        .center [class*="col-"]  div{
            position: relative;
            z-index: 2;

            padding-top: 4px;
            padding-bottom: 4px;

            display: block;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;

            width: 100%;
        }
        .center [class*="col-"]  div span{
            position: relative;
            z-index: 2;
        }
        .center [class*="col-"] div:before {
            display: block;
            content: "";

            position: absolute;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            z-index: 1;

            border: 1px solid #DDD;
        }

        .center [class*="col-"] div:hover:before {
            background-color: #FCE6A6;
            border-color: #EFD27A;
        }

        .select {
            background-color: #BBFFFF;
        }
        .center [class*="col-"] div.select:hover:before {
            background-color: #BBFFFF;
        }

        body [class^="sort-"].active {
            color: #307ECC;
        }
        body [class^="sort-"]:hover {
            color: orange;
        }
        body [class^="sort-"]:after {
            float: right;
            display: inline;
            content: "\f0dc";
            font-family: FontAwesome;
            font-size: 13px;
            font-weight: normal;
        }
        body [class^="sort-"].active.active-up:after {
            content: "\f0de";
            top: 4px;
        }
        body [class^="sort-"].active.active-down:after {
            content: "\f0dd";
            top: -6px;
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

<!-- 删除确认模态框 -->
<div class="modal fade" id="deleteConfirm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-info">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                </button>
                <h4 class="modal-title">
                    确认
                </h4>
            </div>
            <div class="modal-body">
                你将删除跟该企业有关的所有数据，确定吗？
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default btn-white" data-dismiss="modal">
                    取消
                </button>
                <button type="button" class="btn btn-warning btn-white" id="confirm">
                    确定
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- Excel上传模态框 -->
<jsp:include page="${pageContext.request.contextPath}/common/excel-upload-modal.jsp"/>

<!-- /section:basics/navbar.layout -->
<div class="main-container ace-save-state" id="main-container">
    <script type="text/javascript">
        try{ace.settings.loadState('main-container')}catch(e){}
    </script>

    <% request.setAttribute("active","Supplier-Search"); %>
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
                            供应商信息查询
                        </small>
                        <div class="btn-group" style="float: right;">
                            <shiro:hasAnyPermission name="admin,insertProduct">
                                <button class="btn btn-success btn-sm btn-round" id="import-excel-button" style="height: 34px; border-width: 1px; margin-right: 10px;">
                                    <i class="ace-icon fa fa-arrow-circle-o-down"></i> 导入Excel
                                </button>
                            </shiro:hasAnyPermission>
                            <shiro:hasAnyPermission name="admin,searchProduct">
                                <button class="btn btn-warning btn-sm btn-round" id="export-excel-button" style="height: 34px; border-width: 1px; margin-right: 10px;">
                                    <i class="ace-icon fa fa-arrow-circle-o-up"></i> 导出Excel
                                </button>
                            </shiro:hasAnyPermission>
                        </div>
                    </h1>
                </div><!-- /.page-header -->

                <div class="row">
                    <div class="col-xs-12">

                        <div class="table-header">
                            供应商信息
                        </div>

                        <!-- PAGE CONTENT BEGINS -->
                        <div class="" style="background-color: #EFF3F8; padding: 5px;">
                            <div class="row">
                                <div class="col-sm-12 col-xs-6">
                                    <div class="widget-box transparent" id="recent-box">
                                        <div class="widget-header">
                                            <h4 class="widget-title lighter smaller" style="dispaly: inline;float: left;">
                                                <span class="label label-pink label-lg arrowed-right">条件筛选</span>
                                            </h4>
                                            <label id="loadAnimate" style="font-size: 18px;display: none; float: left;margin-top: 5px;"><i class="ace-icon fa fa-spinner fa-spin orange bigger-125"></i></label>
                                            <div class="widget-toolbar no-border">
                                                <ul class="nav nav-tabs" id="recent-tab">
                                                    <li class="active">
                                                        <a data-toggle="tab" href="#task-tab">基本筛选</a>
                                                    </li>

                                                    <li>
                                                        <a data-toggle="tab" href="#member-tab">分组筛选</a>
                                                    </li>

                                                    <li>
                                                        <a data-toggle="tab" href="#comment-tab">排除筛选</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>

                                        <div class="widget-body">
                                            <div class="widget-main padding-4">
                                                <div class="tab-content padding-8">
                                                    <div id="task-tab" class="tab-pane active">
                                                        <div class="row">

                                                            <div class="form-group has-success">
                                                                <div class="row col-xs-12 col-sm-3">
                                                                    <label for="operateRange" class="col-sm-6 control-label" style="height: 34px;padding: 5px; text-align: right;">经营范围包含:</label>

                                                                    <div class="col-sm-6 no-padding-left">
																				<span class="block">
																					<input type="text" id="operateRange" class="width-100" />
																				</span>
                                                                    </div>
                                                                </div>
                                                                <div class="row col-xs-12 col-sm-3">
                                                                    <label for="uccCode" class="col-sm-6 control-label" style="height: 34px;padding: 5px; text-align: right;">单位税号包含:</label>

                                                                    <div class="col-sm-6 no-padding-left">
																				<span class="block">
																					<input type="text" id="uccCode" class="width-100" />
																				</span>
                                                                    </div>
                                                                </div>
                                                                <div class="row col-xs-12 col-sm-3">
                                                                    <label for="fullName" class="col-sm-6 control-label" style="height: 34px;padding: 5px; text-align: right;">公司名称包含:</label>

                                                                    <div class="col-sm-6 no-padding-left">
																				<span class="block">
																					<input type="text" id="fullName" class="width-100" />
																				</span>
                                                                    </div>
                                                                </div>
                                                                <div class="row col-xs-12 col-sm-3" style="margin: 5px;">
                                                                    <div class="col-sm-2"></div>
                                                                    <div class="col-sm-10">
                                                                        <button class="btn btn-white btn-success btn-sm btn-round" id="startSearch">
                                                                            <i class="ace-icon fa fa-search bigger-125"></i>
                                                                            开始查询
                                                                            <i class="ace-icon fa fa-arrow-right icon-on-right bigger-125"></i>
                                                                        </button>
                                                                    </div>
                                                                </div>

                                                            </div>



                                                        </div>
                                                        <div class="row">
                                                            <div class="col-sm-12 hr hr-double hr8"></div>
                                                        </div>

                                                    </div>

                                                    <div id="member-tab" class="tab-pane">
                                                        <div class="widget-box">
                                                            <div class="widget-header widget-header-blue widget-header-flat">
                                                                <h4 class="widget-title lighter">分组选择</h4>

                                                                <div class="widget-toolbar">
                                                                    <label>
                                                                        <small class="green">
                                                                            <b>是否支持多选</b>
                                                                        </small>

                                                                        <input id="isSupportMutliChecked" type="checkbox" class="ace ace-switch ace-switch-4" checked="" />
                                                                        <span class="lbl middle"></span>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="widget-body">
                                                                <div class="widget-main">
                                                                    <div class="row center">

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>


                                                        <div class="row">
                                                            <div class="col-sm-12 hr hr-double hr8"></div>
                                                        </div>

                                                    </div><!-- /.#member-tab -->

                                                    <div id="comment-tab" class="tab-pane">

                                                        <div class="row">
                                                            <div class="col-sm-3">
                                                                <div class="checkbox">
                                                                    <label>
                                                                        <input name="form-field-checkbox" id="notIncludeException" type="checkbox" class="ace" />
                                                                        <span class="lbl"> 不看有异常违法信息的企业</span>
                                                                    </label>
                                                                </div>
                                                            </div>

                                                        </div>

                                                        <div class="row">
                                                            <div class="col-sm-12 hr hr-double hr8"></div>
                                                        </div>

                                                        <!-- /section:pages/dashboard.comments -->
                                                    </div>
                                                </div>
                                            </div><!-- /.widget-main -->
                                        </div><!-- /.widget-body -->
                                    </div><!-- /.widget-box -->
                                </div><!-- /.col -->

                            </div>

                        </div>

                        <!-- PAGE CONTENT ENDS -->
                        <!-- div.dataTables_borderWrap -->
                        <div>
                            <table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-bottom:0">
                                <thead>
                                <tr>
                                    <th class="center">
                                        <label class="pos-rel">
                                            <input type="checkbox" class="ace" />
                                            <span class="lbl"></span>
                                        </label>
                                    </th>
                                    <th>标识ID</th>
                                    <th>供应商名称</th>
                                    <th>网站</th>
                                    <th>统一社会信息代码</th>
                                    <th class="sort-level">信用级别<i class="menu-icon fa fa-acret-right"/><i class="menu-icon fa fa-acret-down"/></th>
                                    <th>主营产品</th>
                                    <th>分组</th>
                                    <th>操作</th>
                                </tr>
                                </thead>

                                <tbody>

                                </tbody>
                            </table>
                            <div class="" style="background-color: #EFF3F8; padding: 5px;">
                                <div class="row">
                                    <!--left-->
                                    <div class="col-sm-3 col-xs-12">
                                        <shiro:hasAnyPermission name="admin,deleteEnterprise">
                                            <button class="btn btn-danger btn-sm btn-white btn-round" id="allDelete" style="height: 34px;">
                                                <i class="ace-icon fa fa-trash-o"></i> 删除选中项
                                            </button>
                                        </shiro:hasAnyPermission>
                                        <button class="btn btn-warning btn-sm btn-white btn-round" id="reload" style="height: 34px;">
                                            <i class="ace-icon fa fa-bolt"></i> 重载
                                        </button>
                                        <button class="btn btn-info btn-sm btn-white btn-round" id="refresh" style="height: 34px;">
                                            <i class="ace-icon fa fa-refresh"></i> 刷新
                                        </button>
                                        <shiro:hasAnyPermission name="admin,insertEnterprise">
                                            <button class="btn btn-success btn-sm btn-white btn-round" id="import-excel-button" style="height: 34px;">
                                                <i class="ace-icon fa fa-arrow-circle-o-down"></i> 导入Excel
                                            </button>
                                        </shiro:hasAnyPermission>
                                    </div>

                                    <!--center-->
                                    <div class="col-sm-7 col-xs-12">
                                        <table style="margin: 0 auto;">
                                            <tr>
                                                <td>
                                                    <button class="btn btn-sm btn-white btn-primary" id="maxPrev" title="第一页">
                                                        <i class="ace-icon fa fa-angle-double-left"></i>
                                                    </button>
                                                    <button class="btn btn-sm btn-white btn-primary" id="prev" title="上一页">
                                                        <i class="ace-icon fa fa-angle-left"></i>
                                                    </button>
                                                </td>
                                                <td>
                                                    &nbsp;&nbsp;&nbsp;
                                                    当前第
                                                    <input type="text" id="currentPage" value="1" style="width: 100px;" />
                                                    页 - 共
                                                    <label id="maxPage">1</label>
                                                    页
                                                    &nbsp;&nbsp;&nbsp;
                                                </td>
                                                <td>
                                                    <button class="btn btn-sm btn-white btn-primary" id="next" title="下一页">
                                                        <i class="ace-icon fa fa-angle-right"></i>
                                                    </button>
                                                    <button class="btn btn-sm btn-white btn-primary" id="maxNext" title="最后一页">
                                                        <i class="ace-icon fa fa-angle-double-right"></i>
                                                    </button>
                                                </td>
                                                <td>
                                                    &nbsp;&nbsp;&nbsp;
                                                    每页显示
                                                    <input type="text" id="pageSize" />
                                                    条记录
                                                </td>
                                            </tr>
                                        </table>

                                    </div>

                                    <!--right-->
                                    <div class="col-sm-2 col-xs-12">
                                        <div style="text-align: right; height: 34px; padding: 5px;">显示 <label id="start">1</label> - <label id="end">1</label> 共 <label id="maxCount">1</label></div>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>
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
<script src="${pageContext.request.contextPath}/statics/js/common.js"></script>

<!-- ace scripts -->
<jsp:include page="${pageContext.request.contextPath}/common/ace-script.jsp"/>
<jsp:include page="${pageContext.request.contextPath}/common/time.jsp"/>

<!-- inline scripts related to this page -->
<script type="text/javascript">
    jQuery(function($) {

        /*加载企业分组信息*/
        $.post("${pageContext.request.contextPath}/enterprise/getTradeGroup",function(data) {
            /*设置默认显示数据*/
            var tradeGroupHtml = "<div class='alert alert-danger' style='margin: 0 auto;padding: 5px;width: 36%;'>系统提示:没有分组</div>";
            if (data) {
                /*如果有数据则清空默认，并设置分组信息*/
                if (data.rows != null && data.rows.length > 0) {
                    tradeGroupHtml = "";
                    $.each(data.rows, function(index, item) {
                        tradeGroupHtml += "<div class='col-xs-2'>" +
                                        "<div class='select' data-groupId='"+ item.id +"'>" +
                                        "<span>"+ item.name +" ["+ item.count +"]</span>" +
                                        "</div>" +
                                        "</div>";
                    });
                }
            }
            /*填充数据*/
            $("#member-tab > .widget-box > .widget-body > .widget-main > .row.center").html(tradeGroupHtml);
        }, "json");

        /*全局常用参数与对象*/
        var operateRange = $("#operateRange");
        var uccCode = $("#uccCode");
        var fullName = $("#fullName");
        var groups = ".center [class*='col-'] div";//该对象比较特殊，是有js动态生成，所以决定用字符串保存选择器，稍后用delegate方法进行绑定事件
        var notIncludeException = $("#notIncludeException");
        var currentPage = $("#currentPage");
        var pageSize = $("#pageSize");
        var sort = $(".sort-level");

        var operateRangeValue = null;/*经营范围参数*/
        var uccCodeValue = null;/*主营产品参数*/
        var fullNameValue = null;/*全称参数*/
        var groupsValue = null;/*分组参数*/
        var includeExceptionValue = false;/*不包含异常信息参数*/
        var currentPageValue = 1;/*当前页参数*/
        var pageSizeValue = 10;/*每页条数参数*/
        var unionSearchValue = false;/*是否交集查询*/
        var sortValue = null;/*排序的字段*/
        var sortedValue = "desc";/*排序的顺序*/

        var defaultParams = {};
        initParam(defaultParams);

        /*参数初始化方法*/
        function initParam() {

            defaultParams = {
                "operateRange": operateRangeValue,
                "uccCode": uccCodeValue,
                "fullName": fullNameValue,
                "groups": groupsValue,
                "includeException": includeExceptionValue,
                "currentPage": currentPageValue,
                "pageSize": pageSizeValue,
                "unionSearch": unionSearchValue,
                "sort": sortValue,
                "sorted": sortedValue
            };
            operateRange.val("");
            //TODO 暂不清楚为什么不能直接用定义好的uccCode对象，可能是有多个造成混淆，待处理
            $("#uccCode").val("");
            fullName.val("");
            $(groups).each(function(index, element) {
                $(element).addClass("select");
            });
            notIncludeException.get(0).checked = false;
            currentPage.val(currentPageValue);
            pageSize.val(pageSizeValue);
            sort.removeClass("active").removeClass("active-up").removeClass("active-down");
        }

        /*第一页，上一页，下一页，最后一页，功能*/
        var maxPrev = $("#maxPrev");//第一页
        var prev = $("#prev");//上一页
        var next = $("#next");//下一页
        var maxNext = $("#maxNext");//最后一页
        var maxPage = $("#maxPage");//最大页码  注意元素为label节点 用html()获取值 以下相同
        var start = $("#start");//记录起点
        var end = $("#end");//记录结束点
        var maxCount = $("#maxCount");//最大记录数

        maxPrev.click(function() {
            currentPage.val(1);
            commonPageOperation();
        });
        prev.click(function() {
            currentPage.val(Number(currentPage.val()) - 1);
            commonPageOperation();
        });
        next.click(function() {
            currentPage.val(Number(currentPage.val()) + 1);
            commonPageOperation();
        });
        maxNext.click(function() {
            currentPage.val(maxPage.html());
            commonPageOperation();
        });
        /*公共的页码操作方法*/
        function commonPageOperation() {
            defaultParams.currentPage = currentPage.val();
            sendRequest();
        }

        /*检查页码状态方法*/
        function checkPageState() {
            /*检查数据*/
            var tempMaxCountValue = Number(maxCount.html());
            var tempPageSizeValue = Number(pageSize.val());
            /*设置最大页数*/
            var temp = Math.ceil(tempMaxCountValue / tempPageSizeValue);
            maxPage.html(temp < 1 ? 1:temp);

            /*检查页码范围*/
            checkRange();
            tempCurrentPageValue = Number(currentPage.val());

            /*设置起始记录数*/
            temp = tempCurrentPageValue * tempPageSizeValue - tempPageSizeValue + 1;
            start.html(temp > tempMaxCountValue ? tempMaxCountValue:temp);
            /*设置结束记录数*/
            temp = tempCurrentPageValue * tempPageSizeValue;
            end.html(temp > tempMaxCountValue ? tempMaxCountValue:temp);
        }
        /*检查页码范围与禁用状态*/
        function checkRange() {
            /*范围检查*/
            if (currentPage.val() > Number(maxPage.html())) {
                currentPage.val(maxPage.html());
            } else if (currentPage.val() < 1) {
                currentPage.val(0);
            } else {
                currentPage.val(defaultParams.currentPage);
            }

            /*判断是否禁用向前翻页*/
            if (currentPage.val() <= 1) {
                currentPage.val(1);
                maxPrev.get(0).disabled = true;
                prev.get(0).disabled = true;
            } else {
                maxPrev.get(0).disabled = false;
                prev.get(0).disabled = false;
            }

            /*判断是否禁用向后翻页*/
            if (currentPage.val() >= Number(maxPage.html())) {
                currentPage.val(maxPage.html());
                maxNext.get(0).disabled = true;
                next.get(0).disabled = true;
            } else {
                maxNext.get(0).disabled = false;
                next.get(0).disabled = false;
            }
        }


        /*实现复选框全选功能*/
        $('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
            var th_checked = this.checked;//checkbox inside "TH" table header

            $(this).closest('table').find('tbody > tr').each(function(){
                var row = this;
                if(th_checked) $(row).addClass("success").find('input[type=checkbox]').eq(0).prop('checked', true);
                else $(row).removeClass("success").find('input[type=checkbox]').eq(0).prop('checked', false);
            });

        });

        /*实现行与复选框的状态同步*/
        $('#simple-table').delegate('tbody > tr', 'click', function(){
            //TODO 此处如果是点击复选框，会触发两次行点击事件，暂时无法解决
            var docCheckbox = $(this).find('td input[type=checkbox]').get(0);
            if (docCheckbox.checked) {
                docCheckbox.checked = false;
                $(this).removeClass("success");
            } else {
                docCheckbox.checked = true;
                $(this).addClass("success");
            }

        });

        /*分组项的单击事件*/
        $("#member-tab").delegate(groups, "click", function (){
            var isSupportMutliChecked = $("#isSupportMutliChecked").get(0);
            if (!isSupportMutliChecked.checked) {
                $(groups).each(function(index, element) {
                    if($(element).hasClass("select"))
                        $(element).removeClass("select");
                });
            }
            $(this).toggleClass("select");
            var idArr = "";
            var temp = 0;
            $(groups).each(function(index, element) {
                if($(element).hasClass("select")) {
                    idArr += element.getAttribute("data-groupId")+",";
                }
            });
            defaultParams.groups = idArr;
            sendRequest();
        });

        /*添加排除筛选的单击事件，修改参数并发送请求*/
        notIncludeException.click(function() {
            defaultParams.includeException = $(this).get(0).checked;
            sendRequest();
        });

        /*实现基本筛选的功能*/
        $("#startSearch").click(function() {
            defaultParams.operateRange = operateRange.val();
            defaultParams.uccCode = uccCode.val();
            defaultParams.fullName = fullName.val();
            sendRequest();
        });

        /*刷新*/
        $("#refresh").click(function() {
            sendRequest();
        });

        /*重载*/
        $("#reload").click(function() {
            location.href = "${pageContext.request.contextPath}/enterprise/toSearchSupplier";
        });

        /*删除选中行*/
        $("#allDelete").click(function() {
            if ($("#simple-table > tbody > tr > td input[type=checkbox]:checked").length < 1) {
                bootbox.dialog({
                    message: "请选中要删除的数据!",
                    buttons: {
                        "danger" : {
                            "label" : "确定",
                            "className" : "btn-sm btn-warning"
                        }
                    }
                });
                return;
            }
            var ids = "";
            $("#simple-table > tbody > tr > td input[type='checkbox']").each(function(index, element) {
                if (element.checked) {
                    ids += element.getAttribute("data-id")+",";
                }
            });
            var first = true;
            $("#deleteConfirm").on('hidden.bs.modal', function () {
                if (first) {
                    var confirm = $("#confirm");
                    if (confirm.get(0).getAttribute("data-param") == "true") {
                        $.post("${pageContext.request.contextPath}/enterprise/mutliDelete", {"ids": ids}, function() {
                            confirm.get(0).setAttribute("data-param", "false");
                            /*全选框重置*/
                            $('#simple-table > thead > tr > th input[type=checkbox]').eq(0).get(0).checked = false;
                            sendRequest();
                        }, 'text');
                    }
                    first = false;
                }
            });

            $("#deleteConfirm").modal("show");
        });

        /*渲染每页条数框*/
        pageSize.ace_spinner({value:10,min:5,max:100,step:5, btn_up_class:'btn-info' , btn_down_class:'btn-info'})
                .closest('.ace-spinner')
                .on('changed.fu.spinbox', function(){
                    /*检查页码状态，设置参数，发送请求*/
                    defaultParams.pageSize = pageSize.val();
                    sendRequest();
                });

        /*绑定当前页输入框的改变事件*/
        currentPage.on("change", function() {
            /*设置参数，发送请求*/
            defaultParams.currentPage = currentPage.val();
            sendRequest();
        });

        /*绑定三个条件输入框的回车事件*/
        $("#fullName,#uccCode,#operateRange").on("keypress", function(event) {
            if (event.keyCode == 13) {
                $("#startSearch").click();
            }
        });

        /*绑定信用级别排序事件*/
        sort.click(function() {
           if (!$(this).hasClass("active")) {
               $(this).addClass("active").addClass("active-down");
               defaultParams.sort = "level";
           } else {
               if ($(this).hasClass("active-down")) {
                   $(this).removeClass("active-down").addClass("active-up");
                   defaultParams.sorted = "asc"
               } else {
                   $(this).removeClass("active-up").addClass("active-down");
                   defaultParams.sorted = sortedValue;
               }
           }
           sendRequest();
        });

        /*页面初始化时加载数据*/
        /*检索初始参数*/
        var currentPageParam = "<%=request.getAttribute("currentPage")%>";
        var pageSizeParam = "<%=request.getAttribute("pageSize")%>";
        if (currentPageParam != "null" && currentPageParam != "") {
            defaultParams.currentPage = currentPageParam;
            currentPage.val(currentPageParam);
        }
        if (pageSizeParam != "null" && pageSizeParam != "") {
            defaultParams.pageSize = pageSizeParam;
            pageSize.val(pageSizeParam);
        }
        var uccCodeParam = "<%=request.getAttribute("uccCode")%>";
        if (uccCodeParam != "null" && uccCodeParam != "") {
            var params = {"unionSearch": true, "uccCode": uccCodeParam, "fullName": uccCodeParam, "operateRange": uccCodeParam};
            sendRequest(params);
        } else {
            sendRequest();
        }

        /*发送请求方法*/
        function sendRequest(param) {
            if (!param) param = defaultParams;
            var load = $("#loadAnimate");
            var prev = load.prev();

            /*显示加载图标*/
            load.css("display", "block");
            prev.css("display", "none");

            $.ajax({
                url: "${pageContext.request.contextPath}/enterprise/search",
                type: "POST",
                dataType: "JSON",
                data: param,
                async: false,
                success: function (data) {
                    var content = "";
                    if (data.rows != null && data.rows.length > 0) {
                        var colorArray = [" label-success", " label-warning", ""];
                        /*拼接字符串*/
                        $.each(data.rows, function (index, item) {

                            var websiteHtml = "<span class='red'>无</span>";
                            if (item.website) {
                                var temp_website = item.website;
                                if (item.website.indexOf("http://") == -1) {
                                     temp_website = "http://" + item.website;
                                }
                                websiteHtml = "<a href='" + temp_website + "'>" + temp_website + "</a>";
                            }

                            var color = colorArray[Math.floor(Math.random() * colorArray.length)];
                            var tradeGroupIdHtml = "<span class='label label-sm" + color + "'>" + item.tradeGroupId.name + "</span>"

                            content += "<tr>" +
                            "<td class='center'>" +
                            "<label class='pos-rel'>" +
                            "<input type='checkbox' data-id='" + item.id + "' class='ace' />" +
                            "<span class='lbl'></span>" +
                            "</label>" +
                            "</td>" +
                            "<td class='center'>" +
                            "<label>"+ item.identify +"</label>" +
                            "</td>" +
                            "<td>" +
                            item.fullName +
                            "</td>" +
                            "<td>"+ websiteHtml +"</td>" +
                            "<td>" + item.uCCcode + "</td>" +
                            "<td><div class='rating inline' data-score='"+ item.level +"'></div></td>" +
                            "<td>" + item.mainProduct + "</td>" +

                            "<td>" +
                            tradeGroupIdHtml +
                            "</td>" +

                            "<td>" +
                            "<div class='hidden-sm hidden-xs action-buttons'>" +
                            "<a class='blue' href='${pageContext.request.contextPath}/enterprise/getEnterpriseById?id="+ item.id +"' target='view_window' title='查看详情'>" +
                            "<i class='ace-icon fa fa-search-plus bigger-130'></i>" +
                            "</a>" +

                            "<shiro:hasAnyPermission name='admin,updateEnterprise'>" +
                            "<a class='green' href='${pageContext.request.contextPath}/enterprise/getEnterpriseById?id="+ item.id +"&action=edit' target='view_window' title='编辑'>" +
                            "<i class='ace-icon fa fa-pencil bigger-130'></i>" +
                            "</a>" +
                            "</shiro:hasAnyPermission>" +

                            "<shiro:hasAnyPermission name='admin,deleteEnterprise'>" +
                            "<a class='red deleteDetails' href='javascript: void(0);' title='删除' data-id='"+ item.id +"'>" +
                            "<i class='ace-icon fa fa-trash-o bigger-130'></i>" +
                            "</a>" +
                            "</div>" +
                            "</shiro:hasAnyPermission>" +

                            "<div class='hidden-md hidden-lg'>" +
                            "<div class='inline pos-rel'>" +
                            "<button class='btn btn-minier btn-yellow dropdown-toggle' data-toggle='dropdown' data-position='auto'>" +
                            "<i class='ace-icon fa fa-caret-down icon-only bigger-120'></i>" +
                            "</button>" +

                            "<ul class='dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close'>" +
                            "<li>" +
                            "<a href='${pageContext.request.contextPath}/enterprise/getEnterpriseById?id="+ item.id +"' class='tooltip-info showDetails' data-rel='tooltip' title='查看详情' data-id='"+ item.id +"'>" +
                            "<span class='blue'>" +
                            "<i class='ace-icon fa fa-search-plus bigger-120'></i>" +
                            "</span>" +
                            "</a>" +
                            "</li>" +

                            "<li>" +
                            "<shiro:hasAnyPermission name='admin,updateEnterprise'>" +
                            "<a href='${pageContext.request.contextPath}/enterprise/getEnterpriseById?id="+ item.id +"&action=edit' class='tooltip-success editDetails' data-rel='tooltip' title='编辑' data-id='"+ item.id +"'>" +
                            "<span class='green'>" +
                            "<i class='ace-icon fa fa-pencil-square-o bigger-120'></i>" +
                            "</span>" +
                            "</a>" +
                            "</li>" +
                            "</shiro:hasAnyPermission>" +

                            "<li>" +
                            "<shiro:hasAnyPermission name='admin,deleteEnterprise'>" +
                            "<a href='javascript: void(0);' class='tooltip-error deleteDetails' data-rel='tooltip' title='删除' data-id='"+ item.id +"'>" +
                            "<span class='red'>" +
                            "<i class='ace-icon fa fa-trash-o bigger-120'></i>" +
                            "</span>" +
                            "</a>" +
                            "</shiro:hasAnyPermission>" +

                            "</li>" +
                            "</ul>" +
                            "</div>" +
                            "</div>" +
                            "</td>" +
                            "</tr>";
                        });
                    } else {
                        content += "<tr><td colspan='9'><div class='alert alert-warning' style='padding: 5px;margin-bottom: 0;text-align: center;'>没有信息</div></td></tr>";
                    }
                    $("#simple-table > tbody").html(content);
                    maxCount.html(data.count);

                    checkPageState();


                    $("#simple-table .rating").each(function(index, item) {
                        var score = item.getAttribute("data-score");
                        $(item).raty({
                            'cancel' : false,//是否可以取消 default:false
                            'half': true,//是否可以选择半星 default:false
                            'starType' : 'i',
                            'score' : score,
                            'readOnly' : true,
                            'hints' : ['坏', '不好', '合格', '好', '极好']
                        });
                        var $children = $(item).children("i");
                        if (score <= 1) $children.attr("style", "font-size: 20px; color: #d06b64;");
                        else if (score <= 2) $children.attr("style", "font-size: 20px; color: #fa573c;");
                        else if (score <= 3) $children.attr("style", "font-size: 20px; color: #ff7537;");
                        else if (score <= 4) $children.attr("style", "font-size: 20px; color: #9fe1e7;");
                        else $children.attr("style", "font-size: 20px; color: #42d692;");
                    });

                    /*隐藏加载图标*/
                    load.css("display", "none");
                    prev.css("display", "block");
                }
            });
        }

        /*删除信息操作*/
        $("#simple-table").delegate(".deleteDetails", "click", function() {
            var id = this.getAttribute("data-id");
            var first = true;
            $("#deleteConfirm").unbind();
            $("#deleteConfirm").on('hidden.bs.modal', function () {
                if (first) {
                    var confirm = $("#confirm");
                    if (confirm.get(0).getAttribute("data-param") == "true") {
                        $.post("${pageContext.request.contextPath}/enterprise/delete", {"id": id}, function() {
                            confirm.get(0).setAttribute("data-param", "false");
                            sendRequest();
                        }, 'text');
                    }
                    first = false;
                }
            });

            $("#deleteConfirm").modal("show");
        });

        /*绑定模态框确认事件*/
        $("#confirm").click(function() {
            this.setAttribute("data-param", "true");
            $("#deleteConfirm").modal("hide");
        });

        $("#import-excel-button").click(function() {
            $("#upload-excel-modal").modal("show");
        });

        try {
            var upload_dropzone = new Dropzone("#upload-excel", {
                url: "${pageContext.request.contextPath}/enterprise/importExcel",//文件提交地址
                method:"post",  //也可用put
                paramName:"upload", //默认为file
                maxFiles:1,//一次性上传的文件数量上限
                maxFilesize: 10, //文件大小，单位：MB
                acceptedFiles: ".xls,.xlsx", //上传的类型
                addRemoveLinks:false,
                parallelUploads: 1,//一次上传的文件数量
                //previewsContainer:"#preview",//上传图片的预览窗口
                dictDefaultMessage:'拖动文件至此或者点击上传',
                dictMaxFilesExceeded: "您最多只能上传1个文件！",
                dictResponseError: '文件上传失败!',
                dictInvalidFileType: "文件类型只能是*.xls,*.xlsx",
                dictFallbackMessage:"浏览器不受支持",
                dictFileTooBig:"文件过大上传文件最大支持.",
                dictRemoveLinks: "删除",
                dictCancelUpload: "取消",
                init:function(){
                    this.on("addedfile", function(file) {
                        //上传文件时触发的事件
                        console.log('upload');
                    });
                    this.on("success",function(file,data){
                        //上传成功触发的事件
                        alert(data);
                        console.log('ok');
                    });
                    this.on("error",function (file,data) {
                        //上传失败触发的事件
                        console.log('fail');

                    });
                    this.on("removedfile",function(file){
                        //删除文件时触发的方法
                        console.log('delete');
                    });
                }
            });
        } catch (Error) {
            console.log("new dropzone error");
        }

        $("#upload-excel-modal").on("hidden.bs.modal", function() {
            upload_dropzone.removeAllFiles(true);//删除所有文件，包括上传中的
        });

        var type = "enterprise";
        <jsp:include page="${pageContext.request.contextPath}/common/excel-download-modal.jsp"/>

    });
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

    