<%--
  @author xietao.x@qq.com
  Created by 2018/3/28
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>用户权限管理 - 供应商管理系统</title>

    <meta name="description" content="Static &amp; Dynamic Tables" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

    <link rel="shortcut icon" href="${pageContent.request.contentPath}/statics/favicon.ico" type="image/x-icon" />

    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/assets/css/bootstrap.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/components/font-awesome/css/font-awesome.min.css" />

    <!-- page specific plugin styles -->
    <link rel="stylesheet" href="${pageContent.request.contentPath}/statics/css/bootstrap-dialog.css" />

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

    <!-- ace settings handler -->
    <script src="${pageContext.request.contextPath}/statics/assets/js/ace-extra.js"></script>

    <!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

    <!--[if lte IE 8]>
    <script src="${pageContext.request.contextPath}/statics/components/html5shiv/dist/html5shiv.min.js"></script>
    <script src="${pageContext.request.contextPath}/statics/components/respond/dest/respond.min.js"></script>
    <![endif]-->
</head>

<body class="no-skin">
<!-- #section:basics/navbar.layout -->
<jsp:include page="${pageContext.request.contextPath}/common/head.jsp"/>

<!-- /section:basics/navbar.layout -->
<div class="main-container ace-save-state" id="main-container">
    <script type="text/javascript">
        try{ace.settings.loadState('main-container')}catch(e){}
    </script>

    <% request.setAttribute("active","System-UserPrivilege"); %>
    <jsp:include page="${pageContext.request.contextPath}/common/menu.jsp"/>

    <!-- /section:basics/sidebar -->
    <div class="main-content">
        <div class="main-content-inner">

            <!-- /section:basics/content.breadcrumbs -->
            <div class="page-content">

                <!-- /section:settings.box -->
                <div class="page-header">
                    <h1>
                        系统管理
                        <small>
                            <i class="ace-icon fa fa-angle-double-right"></i>
                            用户权限管理
                        </small>
                    </h1>
                </div><!-- /.page-header -->

                <div class="row">
                    <div class="col-xs-12">

                        <div class="table-header">
                            用户信息
                        </div>

                        <!-- PAGE CONTENT BEGINS -->
                        <div class="" style="background-color: #EFF3F8; padding: 5px;">
                            <div class="row" style="height:36px;">
                                <label id="loadAnimate" style="font-size: 18px;display: none; float: left;margin-top: 5px;margin-left: 15px;"><i class="ace-icon fa fa-spinner fa-spin orange bigger-125"></i></label>
                                <!-- #section:basics/content.searchbox -->
                                <div class="nav-search" id="nav-search" style="margin-top: 8px;width: 300px;">
                                    <form class="form-search" action="javascript: void(0);">
                                        <span class="input-icon">
                                            <input type="text" placeholder="输入关键字查询" class="nav-search-input" id="keywords" autocomplete="off" style="width: 300px;" />
                                            <i class="ace-icon fa fa-search nav-search-icon"></i>
                                        </span>
                                    </form>
                                </div><!-- /.nav-search -->
                            </div>
                        </div>

                        <div>
                            <table id="simple-table" class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th class="center" style="width: 8%;">
                                        <label class="pos-rel">
                                            <input type="checkbox" class="ace" />
                                            <span class="lbl"></span>
                                        </label>
                                    </th>
                                    <th class="detail-col" style="width: 8%;">查看详情</th>
                                    <th style="width: 12%;">用户名</th>
                                    <th style="width: 12%;">用户级别</th>
                                    <th style="width: 12%;">联系方式</th>
                                    <th class="hidden-480" style="width: 15%;">最后在线</th>

                                    <th class="hidden-480" style="width: 15%;">状态</th>

                                    <th style="width: 15%;">操作</th>
                                </tr>
                                </thead>

                                <tbody>
                                </tbody>
                            </table>
                            <div class="" style="background-color: #EFF3F8; padding: 5px;">
                                <div class="row">
                                    <!--left-->
                                    <div class="col-sm-3 col-xs-12">
                                        <shiro:hasAnyPermission name="admin,deleteUser">
                                            <button class="btn btn-danger btn-sm btn-white btn-round" id="allDelete" style="height: 34px;">
                                                <i class="ace-icon fa fa-trash-o"></i> 删除选中项
                                            </button>
                                        </shiro:hasAnyPermission>

                                        <button class="btn btn-warning btn-sm btn-white btn-round" id="refursh" style="height: 34px;">
                                            <i class="ace-icon fa fa-bolt"></i> 刷新
                                        </button>

                                        <shiro:hasAnyPermission name="admin,insertUser">
                                            <a href="#modal-wizard" data-toggle="modal">
                                                <button class="btn btn-success btn-sm btn-white btn-round" id="insert" style="height: 34px;">
                                                    <i class="ace-icon fa fa-plus"></i> 新增
                                                </button>
                                            </a>

                                            <div id="modal-wizard" class="modal">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div id="modal-wizard-container">
                                                            <div class="modal-header">
                                                                <a class="close" data-dismiss="modal">×</a>
                                                                <h3 class="lighter block green">输入用户信息</h3>
                                                            </div>

                                                            <div class="modal-body step-content">
                                                                <form class="form-horizontal" id="user-form">
                                                                    <div class="row">
                                                                        <div class="col-sm-12">
                                                                            <div class="form-group has-warning">
                                                                                <label for="username" class="col-sm-3 control-label no-padding-right">用户名：</label>

                                                                                <div class="col-sm-7">
																		<span class="block input-icon input-icon-right">
																			<input type="text" id="username" class="width-100" />
																			<i class="ace-icon fa fa-info-circle" title="必填项"></i>
																		</span>
                                                                                    <samll style="position: absolute; top: 36px; left: 10px" class="orange">* 用户名是用户登录的账号, 唯一 必填<br/>
                                                                                        * 初始密码'123456' </samll>
                                                                                </div>
                                                                                <div class="help-block col-sm-reset inline"></div>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="space-12"></div>

                                                                    <div class="row">
                                                                        <div class="col-sm-12">
                                                                            <div class="form-group has-success">
                                                                                <label for="level" class="col-sm-3 control-label no-padding-right">用户级别：</label>

                                                                                <div class="col-sm-7">
                                                                                    <input type="text" id="level" class="width-100" />
                                                                                    <samll style="position: absolute; top: 36px; left: 10px" class="green">
                                                                                        * 用户级别默认为'普通用户' </samll>
                                                                                </div>

                                                                                <div class="help-block col-sm-reset inline"></div>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="space-6"></div>

                                                                    <div class="row">
                                                                        <div class="col-sm-12">
                                                                            <div class="form-group has-success">
                                                                                <label class="col-sm-3 control-label no-padding-right">初始状态：</label>

                                                                                <div class="col-sm-7">
                                                                                    <label>
                                                                                        <input type="checkbox" id="state" class="ace ace-switch ace-switch-6"/>
                                                                                        <span class="lbl" style="margin-top: 5px;"><label for="state">&nbsp;&nbsp;&nbsp;禁用</label></span>
                                                                                    </label>
                                                                                    <samll style="position: absolute; top: 36px; left: 10px" class="green">
                                                                                        * 初始状态为禁用时,账号将无法使用<br/>
                                                                                        * 只有管理员有权限将修改用户状态</samll>
                                                                                </div>
                                                                                <div class="help-block col-sm-reset inline"></div>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="space-12"></div>
                                                                </form>
                                                            </div>
                                                        </div>

                                                        <div class="modal-footer wizard-actions">
                                                            <button class="btn btn-sm" id="insert-user-submit">
                                                                提交
                                                            </button>

                                                            <button class="btn btn-success btn-sm" id="insert-user-cancel">
                                                                取消
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div><!-- PAGE CONTENT ENDS -->
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
                                                    <label id="maxPage">10</label>
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
                                            <tbody></tbody>
                                        </table>

                                    </div>

                                    <!--right-->
                                    <div class="col-sm-2 col-xs-12">
                                        <div style="text-align: right; height: 34px; padding: 5px;">显示 <label id="start">1</label> - <label id="end">10</label> 共 <label id="maxCount">23</label></div>
                                    </div>
                                </div>
                            </div>

                        </div><!-- /.span -->

                        <!-- PAGE CONTENT ENDS -->
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->

    <jsp:include page="${pageContext.request.contextPath}/common/foot.jsp"/>

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

<!-- page specific plugin scripts -->
<script src="${pageContext.request.contextPath}/statics/components/datatables/media/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/_mod/datatables/jquery.dataTables.bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/datatables.net-buttons/js/buttons.flash.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/datatables.net-buttons/js/buttons.html5.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/datatables.net-buttons/js/buttons.print.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/datatables.net-buttons/js/buttons.colVis.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/datatables.net-select/js/dataTables.select.js"></script>
<script src="${pageContent.request.contentPath}/statics/assets/js/src/elements.treeview-modified-version.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/_mod/fuelux/tree-modified-version.js"></script>
<script src="${pageContent.request.contentPath}/statics/components/datatables.net-select/js/dataTables.select.js"></script>
<script src="${pageContent.request.contentPath}/statics/components/jqueryui-touch-punch/jquery.ui.touch-punch.js"></script>
<script src="${pageContent.request.contentPath}/statics/components/_mod/easypiechart/jquery.easypiechart.min.js"></script>
<script src="${pageContent.request.contentPath}/statics/components/jquery.sparkline/index.min.js"></script>
<script src="${pageContent.request.contentPath}/statics/components/Flot/jquery.flot.min.js"></script>
<script src="${pageContent.request.contentPath}/statics/components/Flot/jquery.flot.pie.min.js"></script>
<script src="${pageContent.request.contentPath}/statics/components/Flot/jquery.flot.resize.min.js"></script>
<script src="${pageContent.request.contentPath}/statics/components/fuelux/js/spinbox.js"></script>
<script src="${pageContent.request.contentPath}/statics/components/bootbox.js/bootbox.js"></script>
<script src="${pageContent.request.contentPath}/statics/js/bootstrap-dialog.js"></script>


<!-- ace scripts -->
<jsp:include page="${pageContext.request.contextPath}/common/ace-script.jsp"/>
<jsp:include page="${pageContext.request.contextPath}/common/time.jsp"/>

<script src="${pageContext.request.contextPath}/statics/js/table.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/common.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/layer/layer.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/ry-common.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/ry-ui.js"></script>

<!-- inline scripts related to this page -->
<script type="text/javascript">
    const $ctx = "${pageContext.request.contextPath}";
    var $currentPage = "<%=request.getAttribute("currentPage")%>";
    var $pageSize = "<%=request.getAttribute("pageSize")%>";
</script>
<script src="${pageContext.request.contextPath}/statics/js/project/search_user.js"></script>

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