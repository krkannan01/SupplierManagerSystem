<%--
  @author xietao.x@qq.com
  Created by 2018/3/28
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!-- #section:basics/sidebar -->
<div id="sidebar" class="sidebar                  responsive                    ace-save-state">
    <script type="text/javascript">
        try{ace.settings.loadState('sidebar')}catch(e){}
    </script>

    <ul class="nav nav-list">
        <li class="${active!=null and active.startsWith("Supplier") ? "open":""}">
            <a href="javascript: void(0);" class="dropdown-toggle">
                <i class="menu-icon fa fa-user"></i>
							<span class="menu-text">
								供应商信息管理
							</span>
                <b class="arrow fa fa-angle-down"></b>
            </a>

            <b class="arrow"></b>

            <ul class="submenu">
                <shiro:hasAnyPermission name="admin,searchEnterprise">
                    <li class="${"Supplier-Search".equals(active) ? "active":""}">
                        <a href="javascript: void(0);" onclick="javascript: location.href='${pageContext.request.contextPath}/enterprise/toSearchSupplier';">
                            <i class="menu-icon fa fa-caret-right"></i>
                            查询供应商信息
                        </a>

                        <b class="arrow"></b>
                    </li>
                </shiro:hasAnyPermission>

                <shiro:hasAnyPermission name="admin,insertEnterprise">
                    <li class="${"Supplier-Insert".equals(active) ? "active":""}">
                        <a href="javascript: void(0);" onclick="javascript: location.href='${pageContext.request.contextPath}/enterprise/toAddSupplier';">
                            <i class="menu-icon fa fa-caret-right"></i>
                            新增供应商信息
                        </a>

                        <b class="arrow"></b>
                    </li>
                </shiro:hasAnyPermission>

                <shiro:hasAnyPermission name="admin,searchTradeGroup">
                    <li class="${"Supplier-Group".equals(active) ? "active":""}">
                        <a href="javascript: void(0);" onclick="javascript: location.href = '${pageContext.request.contextPath}/tradeGroup/toTradeGroup';">
                            <i class="menu-icon fa fa-caret-right"></i>
                            设置供应商分组
                        </a>

                        <b class="arrow"></b>
                    </li>
                </shiro:hasAnyPermission>
            </ul>
        </li>

        <li class="${active!=null and active.startsWith("Product") ? "open":""}">
            <a href="javascript: void(0);" class="dropdown-toggle">
                <i class="menu-icon fa fa-list"></i>
							<span class="menu-text">
								材料信息管理
							</span>
                <b class="arrow fa fa-angle-down"></b>
            </a>

            <b class="arrow"></b>

            <ul class="submenu">
                <shiro:hasAnyPermission name="admin,searchProduct">
                    <li class="${"Product-Search".equals(active) ? "active":""}">
                        <a href="javascript: void(0);" onclick="javascript: location.href = '${pageContext.request.contextPath}/product/toSearchProduct';">
                            <i class="menu-icon fa fa-caret-right"></i>
                            查询材料信息
                        </a>

                        <b class="arrow"></b>
                    </li>
                </shiro:hasAnyPermission>
            </ul>
        </li>

        <li class="${active!=null and active.startsWith("System") ? "open":""}">
            <a href="javascript: void(0);" class="dropdown-toggle">
                <i class="menu-icon fa fa-cog"></i>
							<span class="menu-text">
								系统管理
							</span>
                <b class="arrow fa fa-angle-down"></b>
            </a>

            <b class="arrow"></b>

            <ul class="submenu">
                <shiro:hasAnyPermission name="admin,searchUser">
                    <li class="${"System-UserPrivilege".equals(active) ? "active":""}">
                        <a href="javascript: void(0);" onclick="javascript: location.href = '${pageContext.request.contextPath}/user/toSearchUser';">
                            <i class="menu-icon fa fa-caret-right"></i>
                            用户权限管理
                        </a>

                        <b class="arrow"></b>
                    </li>
                </shiro:hasAnyPermission>
            </ul>
        </li>
    </ul><!-- /.nav-list -->

    <!-- #section:basics/sidebar.layout.minimize -->
    <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
        <i id="sidebar-toggle-icon" class="ace-icon fa fa-angle-double-left ace-save-state" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
    </div>

    <!-- /section:basics/sidebar.layout.minimize -->
</div>