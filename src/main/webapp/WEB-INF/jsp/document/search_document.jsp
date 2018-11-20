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
        .page-header h1{ font-size: 18px; }

        /* 排序图标样式. */
        body [class^="sort-"].active{color:#307ECC;}
        body [class^="sort-"]:hover{color:orange;}
        body [class^="sort-"]:after{float:right;display:inline;content:"\f0dc";font-family:FontAwesome;font-size:13px;font-weight:normal;}
        body [class^="sort-"].active.active-up:after{content:"\f0de";top:4px;}
        body [class^="sort-"].active.active-down:after{content:"\f0dd";top:-6px;}

        /* 表格a标签样式. */
        .table-a:hover{color:deepskyblue;text-decoration:none;}

        /* 条件栏样式. */
        .filter-box{margin:6px 20px;}
        .filter-head button{color:#000000;float:right;background-color:#FFFFFF;border:1px solid #DDDDDD;}
        .filter-head button:hover{color:red;border:1px solid orange;}
        .filter-head button:after{font-family:FontAwesome;font-size:14px;content:"\f106";padding:0;margin:0 8px 0 10px;position:relative;top:1px;}
        .filter-head button.show:after{content:"\f107";}
        .filter-body { border: 1px solid #e8e8e8; margin: 6px -12px; padding: 6px; }
        .filter-body .group .group-head { line-height: 30px; color: #999999; }
        .filter-body .group-lowest .group-head { line-height: 30px; color: #999999; }

        /*显示查询条件的样式*/
        #show-filter { padding: 2px 10px; color: #999999; border: 1px solid #e8e8e8; line-height: 2; -webkit-border-radius: 3px;-moz-border-radius: 3px;border-radius: 3px; }
        .filter-tab { margin-right: 24px; padding: 2px 10px; background: #9595A8; color: white; -webkit-border-radius: 3px;-moz-border-radius: 3px;border-radius: 3px; }

        .span-block { display: block; padding: 5px 10px; background: #B8C2B8; -webkit-border-radius: 3px;-moz-border-radius: 3px; border-radius: 3px; }
        .span-line { display: block; padding: 5px 10px; border-bottom: 1px solid orange; }

        .widget-header { background: #f7f7f7; background-image: -webkit-linear-gradient(top, #FFFFFF 0%, #EEEEEE 100%); background-image: -o-linear-gradient(top, #FFFFFF 0%, #EEEEEE 100%);
            background-image: linear-gradient(to bottom, #FFFFFF 0%, #EEEEEE 100%); background-repeat: repeat-x; }

        .tree-label { display: block; -ms-text-overflow: ellipsis; text-overflow: ellipsis; white-space: nowrap; overflow: hidden; }
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

    <% request.setAttribute("active","Document-Search"); %>
    <jsp:include page="${pageContext.request.contextPath}/common/menu.jsp"/>

    <!-- /section:basics/sidebar -->
    <div class="main-content">
        <div class="main-content-inner">

            <!-- /section:basics/content.breadcrumbs -->
            <div class="page-content">

                <!-- /section:settings.box -->
                <div class="page-header">
                    <h1>
                        文档信息管理
                        <small>
                            <i class="ace-icon fa fa-angle-double-right"></i>
                            文档信息查询
                        </small>
                    </h1>
                </div><!-- /.page-header -->

                <div class="row">
                    <div class="col-xs-12">

                        <div class="table-header">
                            文档信息
                        </div>

                        <!-- PAGE CONTENT ENDS -->
                        <!-- div.dataTables_borderWrap -->
                        <div>
                            <div class="row filter-box">
                                <div class="row filter-body groups">
                                    <div class="row group-lowest">
                                        <div class="col-sm-1 col-xs-12 group-head">模糊筛选：</div>
                                        <div class="col-sm-11 col-xs-12 group-body">
                                            <div class="row">
                                                <form class="form-search">
                                                    <div class="col-sm-3">
                                                        <div class="input-group input-group-sm">
                                                            <span class="input-group-addon"> 文档名称 </span>
                                                            <input type="text" class="form-control search-query" id="name-input" placeholder="按文档名称搜索" />
                                                            <span class="input-group-btn">
                                                                <button type="button" class="btn btn-purple btn-xs" id="name-search">
                                                                    <span class="ace-icon fa fa-search icon-on-right bigger-110"></span>
                                                                    搜索
                                                                </button>
                                                            </span>
                                                        </div>
                                                    </div>

                                                    <div class="col-sm-3">
                                                        <div class="input-group input-group-sm">
                                                            <span class="input-group-addon"> 文档所属供应商 </span>
                                                            <input type="text" class="form-control search-query" id="supplier-input" placeholder="按文档供应商搜索" />
                                                            <span class="input-group-btn">
                                                                <button type="button" class="btn btn-info btn-xs" id="supplier-search">
                                                                    <span class="ace-icon fa fa-search icon-on-right bigger-110"></span>
                                                                    搜索
                                                                </button>
                                                            </span>
                                                        </div>
                                                    </div>

                                                    <div class="col-sm-3">
                                                        <div class="input-group input-group-sm">
                                                            <span class="input-group-addon"> 文档类型 </span>
                                                            <select class="form-control" id="type-input"></select>
                                                        </div>
                                                    </div>

                                                    <div class="col-sm-3">
                                                        <button type="button" class="btn btn-info btn-xs btn-round" id="unite-search">
                                                            <span class="ace-icon fa fa-search icon-on-right bigger-110"></span>
                                                            联合搜索
                                                        </button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <table id="document-table" class="table table-striped table-bordered table-hover" style="margin-bottom:0">
                                    <thead>
                                    <tr>
                                        <th width="5%">序号</th>
                                        <th width="5%" class="center"> <label class="pos-rel"> <input type="checkbox" class="ace" /> <span class="lbl"></span> </label> </th>
                                        <th class="sort-name" style="background: inherit;">名称</th>
                                        <th width="20%">类型</th>
                                        <th width="15%">所属供应商</th>
                                        <th>描述</th>
                                        <th>附件</th>
                                        <th width="10%">操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td class="center"> <label class="pos-rel"> <input type="checkbox" class="ace" /> <span class="lbl"></span> </label> </td>
                                        <td>资质证书</td>
                                        <td>资质证书</td>
                                        <td>安盛</td>
                                        <td>无</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    </tbody>
                                </table>
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
<script src="${pageContext.request.contextPath}/statics/components/jquery.sparkline/index.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/Flot/jquery.flot.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/Flot/jquery.flot.pie.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/Flot/jquery.flot.resize.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/fuelux/js/spinbox.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/raty/lib/jquery.raty.js"></script>

<script src="${pageContext.request.contextPath}/statics/js/table.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/common.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/layer/layer.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/ry-common.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/ry-ui.js"></script>

<script type="text/javascript">
    // TODO 目的：shiro权限控制页面显示
    //      问题：使用js对页面内容动态添加时，嵌套在字符串中的<shiro>无效
    //          如：$(body).append("<shiro:hasAnyPermission name='admin'>你好</shiro:hasAnyPermission>"); // 无效
    //      临时方法：把是否拥有权限通过变量来存储，在动态添加的时候是否通过判断变量来指定某个标签是否需要显示
    //          如：const hasAdmin = false; <shiro:hasAnyPermission name="admin">hasAdmin = true;</shiro:hasAnyPermission>
    //              $(body).append("你好".display(hasAdmin)); display 是自定义添加的原生方法，如果hasAdmin=true返回原字符串，否则返回空字符串
    //      缺点：耦合高
    var has_document_delete = false; <shiro:hasAnyPermission name="admin,document:delete">has_document_delete = true;</shiro:hasAnyPermission>
    var has_document_insert = false; <shiro:hasAnyPermission name="admin,document:insert">has_document_insert = true;</shiro:hasAnyPermission>
    var has_document_update = false; <shiro:hasAnyPermission name="admin,document:update">has_document_update = true;</shiro:hasAnyPermission>
</script>

<!-- inline scripts related to this page -->
<script type="text/javascript">
    const $ctx = "${pageContext.request.contextPath}";
    var $currentPage = "<%=request.getAttribute("currentPage")%>";
    var $pageSize = "<%=request.getAttribute("pageSize")%>";
</script>
<script src="${pageContext.request.contextPath}/statics/js/project/document/search_document.js"></script>

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

