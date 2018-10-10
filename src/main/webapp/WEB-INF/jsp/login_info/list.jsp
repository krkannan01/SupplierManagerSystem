<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<jsp:include page="${pageContext.request.contextPath}/common/fregment-header.jsp"></jsp:include>
<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="btn-group hidden-xs" id="tableToolbar" role="group">
			<shiro:hasPermission name="admin">
				<button type="button" class="btn btn-outline btn-default" onclick="javascript:batchRemove()">
					<i class="glyphicon glyphicon-trash"></i>
				</button>
			</shiro:hasPermission>
        </div>
		<table class="bootstrap-table" data-mobile-responsive="true" 
			   data-sort-name="login_time" data-sort-order="desc">
		</table>
	</div>
	<jsp:include page="${pageContext.request.contextPath}/common/fregment-footer.jsp"></jsp:include>
	<script src="${pageContext.request.contextPath}/statics/js/project/login_info/list.js"></script>
	<script type="text/javascript">
        function handleHeight() {
            /*初始化当前 iframe 高度*/
            var fm_height = window.parent.document.getElementsByTagName("html")[0].offsetHeight * 0.9; //初始为父容器高度的 90%
            // var fm_height_new = $("body > .wrapper").get(0).offsetHeight + 20; //高度以 <div class="wrapper wrapper-content"> 的高度为准，加20避免出现滚动条
            // fm_height = Math.max(fm_height, fm_height_new);
            window.parent.document.getElementsByTagName("iframe")[0].setAttribute("height", fm_height); //设置高度
        }
        handleHeight();
	</script>
</body>
</html>