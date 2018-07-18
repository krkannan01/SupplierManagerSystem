<%--
  @author xietao.x@qq.com
  Created by 2018/3/11
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>登录 - 供应商管理系统</title>

    <meta name="description" content="User login page" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

    <link rel="shortcut icon" href="${pageContext.request.contextPath}/statics/favicon.ico" type="image/x-icon">

    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/assets/css/bootstrap.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/components/font-awesome/css/font-awesome.min.css" />

    <!-- text fonts -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/assets/css/ace-fonts.css" />

    <!-- ace styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/assets/css/ace.css" />

    <!--[if lte IE 9]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/assets/css/ace-part2.css" />
    <![endif]-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/assets/css/ace-rtl.css" />

    <!--[if lte IE 9]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/assets/css/ace-ie.css" />
    <![endif]-->

    <!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

    <style type="text/css">
        .error::-webkit-input-placeholder, .error::-webkit-input-placeholder { /* WebKit browsers */ color: #ff0000; }
        .error:-moz-placeholder, .error:-moz-placeholder { /* Mozilla Firefox 4 to 18 */ color: #ff0000; }
        .error::-moz-placeholder, .error::-moz-placeholder { /* Mozilla Firefox 19+ */ color: #ff0000; }
        .error:-ms-input-placeholder, .error:-ms-input-placeholder { /* Internet Explorer 10+ */ color: #ff0000; }
        .bgs { width: 100%; margin: 0; list-style: none; position: fixed; z-index: -1; }
        .bg { width: 100%; float: left; position: fixed; left: 0; top: 0; opacity: 0; }
        .bg img { width: 100%; }
        .radian { border-radius: 15px; }
    </style>

    <!--[if lte IE 8]>
    <script src="${pageContext.request.contextPath}/statics/components/html5shiv/dist/html5shiv.min.js"></script>
    <script src="${pageContext.request.contextPath}/statics/components/respond/dest/respond.min.js"></script>
    <![endif]-->
</head>

<body class="login-layout light-login">
<ul class="bgs">
    <li class="bg" style="opacity: 1;"><img src="${pageContext.request.contextPath}/statics/img/bg1.jpg" /></li>
    <li class="bg"><img src="${pageContext.request.contextPath}/statics/img/bg2.jpg" /></li>
    <li class="bg"><img src="${pageContext.request.contextPath}/statics/img/bg3.jpg" /></li>
    <li class="bg"><img src="${pageContext.request.contextPath}/statics/img/bg4.jpg" /></li>
    <li class="bg"><img src="${pageContext.request.contextPath}/statics/img/bg5.jpg" /></li>
</ul>
<div class="main-container">
    <div class="main-content">
        <div class="row">
            <div class="col-sm-10 col-sm-offset-1">
                <div class="login-container">
                    <div class="space-6"></div>

                    <div class="center">
                        <h1>

                        </h1>
                        <h4 class="blue" id="id-company-text"></h4>
                    </div>

                    <div class="position-relative" style="margin: 25% auto;">
                        <h2 style="margin: 30% auto 20px; text-align: center; color: orange;">供应商管理系统</h2>
                        <div id="login-box" class="login-box visible widget-box no-border radian" >
                            <form style="margin: 15px;">
                                <fieldset>
                                    <div class="space-4"></div>

                                    <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" id="username" class="form-control" style="background: rgba(0,0,0,0.2); color: #fff;" placeholder="用户名" />
															<i class="ace-icon fa fa-user"></i>
														</span>
                                    </label>

                                    <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" id="password" class="form-control" style="background: rgba(0,0,0,0.2); color: #fff;" placeholder="密码" />
															<i class="ace-icon fa fa-lock"></i>
														</span>
                                    </label>

                                    <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" id="check-code" class="form-control" style="background: rgba(0,0,0,0.2); color: #fff;" placeholder="验证码" />
															<i class="ace-icon fa">
                                                                <img src="${pageContext.request.contextPath}/login/getImage" title="看不清，点击换一张"
                                                                     style="cursor: pointer;" onclick="this.src=this.src+'?'+Math.random();" />
                                                            </i>
														</span>
                                    </label>

                                    <div id="message-box"><div class="space"></div></div>

                                    <div class="clearfix">
                                        <label class="inline light">
                                            <input type="checkbox" id="remember" class="ace" />
                                            <span class="lbl">记住我</span>
                                        </label>

                                        <button type="button" class="width-60 pull-right btn btn-sm btn-round btn-warning" style="border-width: 0;" onclick="login();">
                                            <span class="bigger-110">登录</span>
                                        </button>
                                    </div>
                                </fieldset>
                            </form>

                        </div><!-- /.login-box -->

                    </div><!-- /.position-relative -->
                </div>
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div><!-- /.main-content -->
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

<!-- inline scripts related to this page -->
<script type="text/javascript"> var $path = "${pageContext.request.contextPath}"; </script>
<script src="${pageContext.request.contextPath}/statics/js/project/login.js"></script>
</body>
</html>