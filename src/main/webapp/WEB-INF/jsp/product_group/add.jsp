<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html xmlns:th="http://www.w3.org/1999/xhtml">
<meta charset="utf-8">
<jsp:include page="${pageContext.request.contextPath}/common/fregment-header.jsp"></jsp:include>
<link href="${pageContext.request.contextPath}/ry-statics/ajax/libs/iCheck/custom.css" rel="stylesheet"/>
<body class="white-bg">
	<div class="wrapper wrapper-content animated fadeInRight ibox-content">
		<form class="form-horizontal m" id="form-product-group-add">
			<input id="treeId" name="parentId" type="hidden" />
			<div class="form-group">
				<label class="col-sm-3 control-label ">父级分组：</label>
				<div class="col-sm-8">
					<input class="form-control" type="text" onclick="selectMenuTree()" id="treeName" readonly="true" th:value="${menu.menuName}"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">菜单名称：</label>
				<div class="col-sm-8">
					<input class="form-control" type="text" name="menuName" id="menuName">
				</div>
			</div>
			<div class="form-group">
				<div class="form-control-static col-sm-offset-9">
					<button type="submit" class="btn btn-primary">提交</button>
					<button onclick="'javascript:layer_close()'" class="btn btn-danger" type="button">关闭</button>
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="${pageContext.request.contextPath}/common/fregment-footer.jsp"></jsp:include>
	<script src="${pageContext.request.contextPath}/statics/js/project/product_group/add.js"></script>
</body>
</html>
