<%@ page import="cn.xt.sms.entity.User" %>
<%@ page import="cn.xt.sms.constant.CommonConstants" %>
<%--
  @author xietao.x@qq.com
  Created by 2018/3/22
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String headImg = "assets/avatars/avatar5.png";
    String username = "用户";
    User user = (User) session.getAttribute("user");
    if (user != null) {
        if (user.getHeadImg() != null && user.getHeadImg() != "") {
            headImg = user.getHeadImg();
        }
        if (user.getUsername() != null) {
            if (user.getUsername().equals("admin")) {
                username = "管理员";
            } else {
                username = user.getUsername();
            }
        }
    } else {
        out.write("<script>alert('用户信息失效');location.href='"+ request.getContextPath() +"/login/autoLogin';</script>");
    }
%>
<body class="no-skin">
<!-- #section:basics/navbar.layout -->
<!-- 网页上部信息 -->
<div id="navbar" class="navbar navbar-default          ace-save-state" style="background: url(${pageContext.request.contextPath}/statics/img/title.jpg);">
    <div class="navbar-container ace-save-state" id="navbar-container">

        <!-- #section:basics/sidebar.mobile.toggle -->
        <button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
            <span class="sr-only"></span>

            <span class="icon-bar"></span>

            <span class="icon-bar"></span>

            <span class="icon-bar"></span>
        </button>

        <!-- /section:basics/sidebar.mobile.toggle -->
        <div class="navbar-header pull-left">
            <!-- #section:basics/navbar.layout.brand -->
            <img src="${pageContext.request.contextPath}/statics/img/logo.png" style="height: 45px; margin-top: 0px; float: left; position: relative; left: -10px;" />
            <a href="#" class="navbar-brand">
                <small>
                    供应商管理系统
                </small>
            </a>

            <!-- /section:basics/navbar.layout.brand -->

            <!-- #section:basics/navbar.toggle -->

            <!-- /section:basics/navbar.toggle -->
        </div>

        <!-- #section:basics/navbar.dropdown -->
        <div class="navbar-buttons navbar-header pull-right" role="navigation">
            <ul class="nav ace-nav">

                <!-- #section:basics/navbar.user_menu -->
                <li class="light-blue dropdown-modal">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                        <img class="nav-user-photo" style="width: 40px;height: 40px;" src="${pageContext.request.contextPath}/<%=CommonConstants.HEAD_IMG_URL%>/<%=headImg%>" alt="头像" />
								<span class="user-info">
									<small>欢迎,</small>
									<%=username%>
								</span>

                        <i class="ace-icon fa fa-caret-down"></i>
                    </a>

                    <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                        <li>
                            <a href="${pageContext.request.contextPath}/login/toIndex">
                                <i class="ace-icon fa fa-home"></i>
                                主页
                            </a>
                        </li>

                        <li class="divider"></li>

                        <li>
                            <a href="${pageContext.request.contextPath}/user/toUpdatePassword" target="view_window">
                                <i class="ace-icon fa fa-cog"></i>
                                修改密码
                            </a>
                        </li>

                        <li>
                            <a href="${pageContext.request.contextPath}/user/toProfile">
                                <i class="ace-icon fa fa-user"></i>
                                个人信息
                            </a>
                        </li>

                        <li class="divider"></li>

                        <li>
                            <a href="${pageContext.request.contextPath}/login/logout">
                                <i class="ace-icon fa fa-power-off"></i>
                                注销
                            </a>
                        </li>
                    </ul>
                </li>

                <!-- /section:basics/navbar.user_menu -->
            </ul>
        </div>

    </div><!-- /.navbar-container -->
</div>