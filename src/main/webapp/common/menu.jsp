<%@ page import="cn.xt.sms.constant.PrivilegeConstants" %>
<%@ page import="cn.xt.sms.entity.Privilege" %><%--
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
								供应商管理
							</span>
                <b class="arrow fa fa-angle-down"></b>
            </a>

            <b class="arrow"></b>

            <ul class="submenu">
                <shiro:hasAnyPermission name="admin,supplier:search">
                    <li class="${"Supplier-Search".equals(active) ? "active":""}">
                        <a href="javascript: void(0);" onclick="javascript: location.href='${pageContext.request.contextPath}/supplier/toSearchSupplier';">
                            <i class="menu-icon fa fa-caret-right"></i>
                            供应商管理
                        </a>

                        <b class="arrow"></b>
                    </li>
                </shiro:hasAnyPermission>

                <shiro:hasAnyPermission name="admin,supplier_group:search">
                    <li class="${"Supplier-Group".equals(active) ? "active":""}">
                        <a href="javascript: void(0);" onclick="javascript: location.href = '${pageContext.request.contextPath}/tradeGroup/toTradeGroup';">
                            <i class="menu-icon fa fa-caret-right"></i>
                            供应商分组管理
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
								商品信息管理
							</span>
                <b class="arrow fa fa-angle-down"></b>
            </a>

            <b class="arrow"></b>

            <ul class="submenu">
                <shiro:hasAnyPermission name="admin,product:search">
                    <li class="${"Product-Search".equals(active) ? "active":""}">
                        <a href="javascript: void(0);" onclick="javascript: location.href = '${pageContext.request.contextPath}/product/toSearchProduct';">
                            <i class="menu-icon fa fa-caret-right"></i>
                            商品信息管理
                        </a>

                        <b class="arrow"></b>
                    </li>
                </shiro:hasAnyPermission>

                <shiro:hasAnyPermission name="admin,product_group:search">
                    <li class="${"ProductGroup-Search".equals(active) ? "active":""}">
                        <a href="javascript: void(0);" onclick="javascript: location.href = '${pageContext.request.contextPath}/productGroup/toSearchProductGroupPage';">
                            <i class="menu-icon fa fa-caret-right"></i>
                            商品分组管理
                        </a>

                        <b class="arrow"></b>
                    </li>
                </shiro:hasAnyPermission>
            </ul>
        </li>

        <li class="${active!=null and active.startsWith("Document") ? "open":""}">
            <a href="javascript: void(0);" class="dropdown-toggle">
                <i class="menu-icon fa fa-list"></i>
                <span class="menu-text">
								文档信息管理
							</span>
                <b class="arrow fa fa-angle-down"></b>
            </a>

            <b class="arrow"></b>

            <ul class="submenu">
                <shiro:hasAnyPermission name="admin,document:search">
                    <li class="${"Document-Search".equals(active) ? "active":""}">
                        <a href="javascript: void(0);" onclick="javascript: location.href = '${pageContext.request.contextPath}/document/toPage/document-search_document';">
                            <i class="menu-icon fa fa-caret-right"></i>
                            文档信息管理
                        </a>

                        <b class="arrow"></b>
                    </li>
                </shiro:hasAnyPermission>

                <shiro:hasAnyPermission name="admin,document_type:search">
                    <li class="${"DocumentType-Search".equals(active) ? "active":""}">
                        <a href="javascript: void(0);" onclick="javascript: location.href = '${pageContext.request.contextPath}/documentType/toSearchDocumentType';">
                            <i class="menu-icon fa fa-caret-right"></i>
                            文档类型管理
                        </a>

                        <b class="arrow"></b>
                    </li>
                </shiro:hasAnyPermission>
            </ul>
        </li>

        <%--<li class="${active!=null and active.startsWith("System") ? "open":""}">
            <a href="javascript: void(0);" class="dropdown-toggle">
                <i class="menu-icon fa fa-cog"></i>
							<span class="menu-text">
								系统管理
							</span>
                <b class="arrow fa fa-angle-down"></b>
            </a>

            <b class="arrow"></b>

            <ul class="submenu">
                <shiro:hasAnyPermission name="admin,user:search">
                    <li class="${"System-UserPrivilege".equals(active) ? "active":""}">
                        <a href="javascript: void(0);" onclick="javascript: location.href = '${pageContext.request.contextPath}/user/toSearchUser';">
                            <i class="menu-icon fa fa-caret-right"></i>
                            用户权限管理
                        </a>

                        <b class="arrow"></b>
                    </li>
                </shiro:hasAnyPermission>
            </ul>
        </li>--%>

        <li class="${active!=null and active.startsWith("User") ? "open":""}">
            <a href="javascript: void(0);" class="dropdown-toggle">
                <i class="menu-icon fa fa-cog"></i>
                <span class="menu-text">
								用户管理
							</span>
                <b class="arrow fa fa-angle-down"></b>
            </a>

            <b class="arrow"></b>

            <ul class="submenu">
                <shiro:hasAnyPermission name="admin,user:search">
                    <li class="${"User-UserPrivilege".equals(active) ? "active":""}">
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