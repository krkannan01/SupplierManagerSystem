<%--
  @author xietao.x@qq.com
  Created by 2018/3/15
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>网页没有找到 - 供应商管理系统</title>

    <meta name="description" content="404 Error Page" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

    <link rel="shortcut icon" href="${pageContent.request.contentPath}/statics/favicon.ico" type="image/x-icon"/>
    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="${pageContent.request.contentPath}/statics/assets/css/bootstrap.css" />
    <link rel="stylesheet" href="${pageContent.request.contentPath}/statics/components/font-awesome/css/font-awesome.min.css" />

    <!-- page specific plugin styles -->

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

    <!-- inline styles related to this page -->

    <!-- ace settings handler -->
    <script src="${pageContent.request.contentPath}/statics/assets/js/ace-extra.js"></script>

    <!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

    <!--[if lte IE 8]>
    <script src="${pageContent.request.contentPath}/statics/components/html5shiv/dist/html5shiv.min.js"></script>
    <script src="${pageContent.request.contentPath}/statics/components/respond/dest/respond.min.js"></script>
    <![endif]-->
</head>

<body class="no-skin">

<!-- /section:basics/navbar.layout -->
<div class="main-container ace-save-state" id="main-container">
    <script type="text/javascript">
        try{ace.settings.loadState('main-container')}catch(e){}
    </script>

    <!-- /section:basics/content.breadcrumbs -->
    <div class="page-content">

        <!-- /section:settings.box -->
        <div class="row">
            <div class="col-xs-12">
                <!-- PAGE CONTENT BEGINS -->

                <!-- #section:pages/error -->
                <div class="error-container">
                    <div class="well">
                        <h1 class="grey lighter smaller">
									<span class="blue bigger-125">
										<i class="ace-icon fa fa-sitemap"></i>
										404
									</span>
                            页面没有找到
                        </h1>

                        <hr />
                        <h3 class="lighter smaller">我们到处找，但找不到!</h3>

                        <div>
                            <form class="form-search">
										<span class="input-icon align-middle">
											<i class="ace-icon fa fa-search"></i>

											<input type="text" class="search-query" placeholder="给它一个搜索…" />
										</span>
                                <button class="btn btn-sm" type="button">Go!</button>
                            </form>

                            <div class="space"></div>
                            <h4 class="smaller">试试下面的方法:</h4>

                            <ul class="list-unstyled spaced inline bigger-110 margin-15">
                                <li>
                                    <i class="ace-icon fa fa-hand-o-right blue"></i>
                                    重新检查输入错误的url
                                </li>

                                <li>
                                    <i class="ace-icon fa fa-hand-o-right blue"></i>
                                    阅读常见问题
                                </li>

                                <li>
                                    <i class="ace-icon fa fa-hand-o-right blue"></i>
                                    告诉我们关于它
                                </li>
                            </ul>
                        </div>

                        <hr />
                        <div class="space"></div>

                        <div class="center">
                            <a href="javascript:history.back()" class="btn btn-grey">
                                <i class="ace-icon fa fa-arrow-left"></i>
                                返回
                            </a>

                            <a href="${pageContext.request.contextPath}/login/toIndex" class="btn btn-primary">
                                <i class="ace-icon fa fa-tachometer"></i>
                                主页
                            </a>
                        </div>
                    </div>
                </div>

                <!-- /section:pages/error -->

                <!-- PAGE CONTENT ENDS -->
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div><!-- /.page-content -->

    <div class="footer">
        <div class="footer-inner">
            <!-- #section:basics/footer -->
            <div class="footer-content">
						<span class="bigger-120">
							<span class="blue bolder">Ace</span>
							Application &copy; 2013-2014
						</span>

                &nbsp; &nbsp;
						<span class="action-buttons">
							<a href="#">
                                <i class="ace-icon fa fa-twitter-square light-blue bigger-150"></i>
                            </a>

							<a href="#">
                                <i class="ace-icon fa fa-facebook-square text-primary bigger-150"></i>
                            </a>

							<a href="#">
                                <i class="ace-icon fa fa-rss-square orange bigger-150"></i>
                            </a>
						</span>
            </div>

            <!-- /section:basics/footer -->
        </div>
    </div>

    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>
</div><!-- /.main-container -->

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

<!-- ace scripts -->
<jsp:include page="${pageContent.request.contentPath}/common/ace-script.jsp"/>
<jsp:include page="${pageContext.request.contextPath}/common/time.jsp"/>

<!-- inline scripts related to this page -->

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
