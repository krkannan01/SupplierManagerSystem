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

<!-- ace scripts -->
<jsp:include page="${pageContext.request.contextPath}/common/ace-script.jsp"/>
<jsp:include page="${pageContext.request.contextPath}/common/time.jsp"/>

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
<script src="${pageContext.request.contextPath}/statics/js/layer/layer.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/ry-common.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/ry-ui.js"></script>

<!-- inline scripts related to this page -->
<script type="text/javascript">
    const $ctx = "${pageContext.request.contextPath}";
    var $currentPage = "<%=request.getAttribute("currentPage")%>";
    var $pageSize = "<%=request.getAttribute("pageSize")%>";
    var $uccCode = "<%=request.getAttribute("uccCode")%>";
</script>
<script src="${pageContext.request.contextPath}/common/excel-download-modal.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/project/search_supplier.js"></script>

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