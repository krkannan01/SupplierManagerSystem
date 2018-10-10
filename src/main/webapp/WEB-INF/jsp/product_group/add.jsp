<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<jsp:include page="${pageContext.request.contextPath}/common/fregment-header.jsp"></jsp:include>
<body class="white-bg">
	<div class="wrapper wrapper-content animated fadeInRight ibox-content">
		<form class="form-horizontal m" id="form-product-group-add">
			<input id="parentId" name="parentId" type="hidden" value="${group.id}" />
			<div class="form-group">
				<label class="col-sm-3 control-label ">父级分组：</label>
				<div class="col-sm-8">
					<input class="form-control" type="text" onclick="selectGroupTree('${group.name}')" value="${group.name}" id="parentName" readonly="true" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">分组名称：</label>
				<div class="col-sm-8">
					<input class="form-control" type="text" name="name" id="name">
				</div>
			</div>
			<div class="form-group">
				<div class="form-control-static col-sm-offset-9">
					<button type="submit" class="btn btn-primary">提交</button>
					<button onclick="javascript:layer_close()" class="btn btn-danger" type="button">关闭</button>
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="${pageContext.request.contextPath}/common/fregment-footer.jsp"></jsp:include>
	<script src="${pageContext.request.contextPath}/statics/js/project/product_group/add.js"></script>
</body>
</html>
