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
        .center{text-align:center;}
        .center [class*="col-"]{margin-top:2px;margin-bottom:2px;position:relative;text-overflow:ellipsis;}
        .center [class*="col-"]  div{position:relative;z-index:2;padding-top:4px;padding-bottom:4px;display:block;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;width:100%;}
        .center [class*="col-"]  div span{position:relative;z-index:2;}
        .center [class*="col-"] div:before{display:block;content:"";position:absolute;top:0;bottom:0;left:0;right:0;z-index:1;border:1px solid #DDD;}
        .center [class*="col-"] div:hover:before{background-color:#FCE6A6;border-color:#EFD27A;}
        .select{background-color:#BBFFFF;}
        .center [class*="col-"] div.select:hover:before{background-color:#BBFFFF;}

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
                        <div class="">
                            <div class="row">
                                <div class="col-sm-12 col-xs-6">
                                    <div class="widget-box transparent" id="recent-box" style="background-color: #EFF3F8;">
                                        <div class="widget-header" style="background: #f7f7f7; background-image: -webkit-linear-gradient(top, #FFFFFF 0%, #EEEEEE 100%); background-image: -o-linear-gradient(top, #FFFFFF 0%, #EEEEEE 100%);
            background-image: linear-gradient(to bottom, #FFFFFF 0%, #EEEEEE 100%); background-repeat: repeat-x;">
                                            <%--<h4 class="widget-title lighter smaller" style="dispaly: inline;float: left;">
                                                <span class="label label-pink label-lg arrowed-left">条件筛选</span>
                                            </h4>--%>
                                            <div class="widget-toolbar no-border" style="float:left;">
                                                <ul class="nav nav-tabs" id="recent-tab">
                                                    <li class="active"> <a data-toggle="tab" id="category-huizon" href="#huizon">汇总</a> </li>
                                                    <li> <a data-toggle="tab" id="category-shiyong" href="#">试用供应商</a> </li>
                                                    <li> <a data-toggle="tab" id="category-zhanlue" href="#">战略供应商</a> </li>
                                                    <li> <a data-toggle="tab" id="category-hege" href="#">合格供应商</a> </li>
                                                    <li> <a data-toggle="tab" id="category-xiumian" href="#">休眠供应商</a> </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div><!-- /.widget-box -->
                                </div><!-- /.col -->
                            </div>
                        </div>

                        <!-- PAGE CONTENT ENDS -->
                        <!-- div.dataTables_borderWrap -->
                        <div>
                            <div style="float: left; width: 15%; margin-top: 5px; border-top: 1px dashed orange; border-right: 1px dashed orange;">
                                <ul id="supplier-group-tree"></ul>
                            </div>
                            <div style="float: right; width: 84%;">
                            <div class="row filter-box">
                                <div class="row filter-body groups">
                                    <div class="row group-lowest">
                                        <div class="col-sm-1 col-xs-12 group-head">模糊筛选：</div>
                                        <div class="col-sm-11 col-xs-12 group-body">
                                            <div class="row">
                                                <form class="form-search">
                                                    <div class="col-sm-3">
                                                        <div class="input-group input-group-sm">
                                                            <span class="input-group-addon"> 供应商名称 </span>
                                                            <input type="text" class="form-control search-query" id="supplier-input" placeholder="按供应商名称搜索" />
                                                            <span class="input-group-btn">
                                                                <button type="button" class="btn btn-purple btn-xs" id="supplier-search">
                                                                    <span class="ace-icon fa fa-search icon-on-right bigger-110"></span>
                                                                    搜索
                                                                </button>
                                                            </span>
                                                        </div>
                                                    </div>

                                                    <div class="col-sm-3">
                                                        <div class="input-group input-group-sm">
                                                            <span class="input-group-addon"> 单位税号 </span>
                                                            <input type="text" class="form-control search-query" id="ucccode-input" placeholder="按单位税号搜索" />
                                                            <span class="input-group-btn">
                                                                <button type="button" class="btn btn-info btn-xs" id="ucccode-search">
                                                                    <span class="ace-icon fa fa-search icon-on-right bigger-110"></span>
                                                                    搜索
                                                                </button>
                                                            </span>
                                                        </div>
                                                    </div>

                                                    <div class="col-sm-3">
                                                        <div class="input-group input-group-sm">
                                                            <span class="input-group-addon"> 经营范围 </span>
                                                            <input type="text" class="form-control search-query" id="operate-range-input" placeholder="按经营范围搜索" />
                                                            <span class="input-group-btn">
                                                                <button type="button" class="btn btn- btn-xs" id="operate-range-search">
                                                                    <span class="ace-icon fa fa-search icon-on-right bigger-110"></span>
                                                                    搜索
                                                                </button>
                                                            </span>
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
                                <div class="row" id="show-filter">当前查询条件：</div>
                            </div>
                            <table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-bottom:0">
                                <thead>
                                    <tr>
                                        <th>序号</th>
                                        <th class="center"> <label class="pos-rel"> <input type="checkbox" class="ace" /> <span class="lbl"></span> </label> </th>
                                        <th>供应商编号</th>
                                        <th>供应商名称</th>
                                        <th>网站</th>
                                        <th>统一社会信息代码</th>
                                        <th class="sort-level">信用级别<i class="menu-icon fa fa-acret-right"/><i class="menu-icon fa fa-acret-down"/></th>
                                        <th>主营产品</th>
                                        <th>分组</th>
                                        <th width="100">操作</th>
                                    </tr>
                                </thead>
                                <tbody></tbody>
                            </table>
                            <label id="loadAnimate" style="z-index: 2; font-size: 18px; position: absolute; left: 48%; top: 48%;"><i class="ace-icon fa fa-spinner fa-spin orange bigger-125"></i></label>
                            <div class="" style="background-color: #EFF3F8; padding: 5px;">
                                <div class="row">
                                    <!--left-->
                                    <div class="col-sm-3 col-xs-12">
                                        <shiro:hasAnyPermission name="admin,deleteSupplier">
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

<!-- page specific plugin scripts -->\
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

<script src="${pageContext.request.contextPath}/statics/js/pagination.js"></script>
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

