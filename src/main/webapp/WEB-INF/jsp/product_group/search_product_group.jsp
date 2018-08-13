<%--
  User: xietao
  Date: 2018/8/10
  Time: 16:27
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%
    // 项目绝对路径
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ path;
%>
<!DOCTYPE html>
<html xmlns:th="http://www.w3.org/1999/xhtml">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8">
<title>供应商管理系统 - 查询商品分组</title>
<meta name="description" content="with selectable elements and custom icons" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
<link rel="shortcut icon" href="${pageContext.request.contextPath}/statics/favicon.ico" type="image/x-icon">

<jsp:include page="${pageContext.request.contextPath}/common/fregment-header.jsp"></jsp:include>

<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="btn-group hidden-xs" id="tableToolbar" role="group">
        <div class="form-group">
            <button type="button" class="btn btn-outline btn-default">
                <i class="glyphicon glyphicon-plus"></i>
            </button>
        </div>
    </div>
    <table class="bootstrap-table" data-mobile-responsive="true">
    </table>
</div>

<jsp:include page="${pageContext.request.contextPath}/common/fregment-footer.jsp"></jsp:include>

<script type="text/javascript">

    function handleHeight() {
        /*初始化当前 iframe 高度*/
        var fm_height = 600; //初始600
        fm_height = $("body > .wrapper").get(0).offsetHeight + 20; //高度以 <div class="wrapper wrapper-content"> 的高度为准，加20避免出现滚动条
        window.parent.document.getElementsByTagName("iframe")[0].setAttribute("height", fm_height); //设置高度
    }

    var $ctx = "${pageContext.request.contextPath}";
    var addFlag = true;
    var editFlag = true;
    var removeFlag = true;
</script>
<script src="${pageContext.request.contextPath}/statics/js/project/product_group/search_product_group.js"></script>
</body>
</html>
