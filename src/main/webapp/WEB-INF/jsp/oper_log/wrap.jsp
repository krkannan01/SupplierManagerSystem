<%--
  @author xietao.x@qq.com
  Created by 2018/8/13
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>操作日志管理 - 供应商管理系统</title>

    <meta name="description" content="overview &amp; stats" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

    <link rel="shortcut icon" href="${pageContext.request.contextPath}/statics/favicon.ico" type="image/x-icon">

    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/assets/css/bootstrap.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/components/font-awesome/css/font-awesome.min.css" />

    <!-- page specific plugin styles -->

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

<jsp:include page="${pageContext.request.contextPath}/common/head.jsp"/>

<!-- /section:basics/navbar.layout -->
<div class="main-container ace-save-state" id="main-container">
    <script type="text/javascript">
        try{ace.settings.loadState('main-container')}catch(e){}
    </script>

    <%-- 设置左侧菜单栏中的商品分组管理为激活状态 --%>
    <% request.setAttribute("active","System-OperationLog"); %>
    <jsp:include page="${pageContext.request.contextPath}/common/menu.jsp"/>

    <div class="main-content">
        <div class="main-content-inner">

            <iframe src="${pageContext.request.contextPath}/operLog" style="width: 98%; margin: 1%; border: 0;
                -webkit-border-radius: 10px;
                -moz-border-radius: 10px;
                border-radius: 10px;">
            </iframe>

        </div>
    </div><!-- /.main-content -->

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

<!--[if lte IE 8]>
<script src="${pageContext.request.contextPath}/statics/components/ExplorerCanvas/excanvas.js"></script>
<![endif]-->
<script src="${pageContext.request.contextPath}/statics/components/_mod/jquery-ui.custom/jquery-ui.custom.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/jqueryui-touch-punch/jquery.ui.touch-punch.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/_mod/easypiechart/jquery.easypiechart.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/jquery.sparkline/index.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/Flot/jquery.flot.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/Flot/jquery.flot.pie.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/Flot/jquery.flot.resize.min.js"></script>

<!-- ace scripts -->
<jsp:include page="${pageContext.request.contextPath}/common/ace-script.jsp"/>
<jsp:include page="${pageContext.request.contextPath}/common/time.jsp"/>

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

