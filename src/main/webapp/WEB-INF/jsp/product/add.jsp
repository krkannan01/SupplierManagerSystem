<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta charset="utf-8" />
	<title>添加商品信息 - 供应商管理系统</title>
	<meta name="description" content="with selectable elements and custom icons" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
	<link rel="shortcut icon" href="${pageContent.request.contentPath}/statics/favicon.ico" type="image/x-icon">

	<!-- bootstrap-table 表格插件样式 -->
	<link href="${pageContent.request.contentPath}/statics/css/bootstrap-table.min.css" rel="stylesheet"/>
	<link href="${pageContent.request.contentPath}/statics/css/animate.css" rel="stylesheet"/>
	<link href="${pageContent.request.contentPath}/statics/css/style.css" rel="stylesheet"/>
	<link href="${pageContent.request.contentPath}/statics/css/checkbox.css" rel="stylesheet"/>

	<link rel="stylesheet" href="${pageContent.request.contentPath}/statics/components/chosen/chosen.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/statics/assets/css/bootstrap.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/statics/components/font-awesome/css/font-awesome.min.css" />
</head>
<body class="white-bg">
	<div class="wrapper wrapper-content animated fadeInRight ibox-content">
		<form class="form-horizontal m" id="form-product-add">
			<input name="id" type="hidden" />
			<div class="form-group">
				<label class="col-sm-3 control-label ">商品名称：</label>
				<div class="col-sm-8">
					<input class="form-control" type="text" value="123" name="name">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">商品规格：</label>
				<div class="col-sm-8">
					<input class="form-control" type="text" value="123" name="size">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">商品品牌：</label>
				<div class="col-sm-8">
					<input class="form-control" type="text" value="123" name="brand">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">商品单位：</label>
				<div class="col-sm-8">
					<input class="form-control" type="text" value="123" name="unit">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">商品单价：</label>
				<div class="col-sm-8">
					<input class="form-control" type="text" value="123" name="price">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">技术参数：</label>
				<div class="col-sm-8">
					<input class="form-control" type="text" value="123" name="param">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">所属分组：</label>
				<div class="col-sm-8">
					<select class="chosen-select form-control" value="123" name="group">
						<option value="0"></option>
						<option value="0">1</option>
						<option value="0">2</option>
						<option value="0">3</option>
						<option value="0">4</option>
						<option value="0">5</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">供应商：</label>
				<div class="col-sm-8">
					<select class="chosen-select form-control" value="123" name="supplier">
						<option value="0"></option>
						<option value="0">1</option>
						<option value="0">2</option>
						<option value="0">3</option>
						<option value="0">4</option>
						<option value="0">5</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">备注：</label>
				<div class="col-sm-8">
					<input class="form-control" type="text" value="123" name="comment">
				</div>
			</div>
			
			<div class="form-group">
				<div class="form-control-static col-sm-offset-9">
					<button type="submit" class="btn btn-primary">提交</button>
					<button class="btn btn-danger" type="button">关闭</button>
				</div>
			</div>
		</form>
	</div>
	<script src="${pageContext.request.contextPath}/statics/components/jquery/dist/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/statics/components/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/statics/js/validate/jquery.validate.min.js"></script>
	<script src="${pageContext.request.contextPath}/statics/js/validate/messages_zh.min.js"></script>
	<script src="${pageContext.request.contextPath}/statics/components/chosen/chosen.jquery.js"></script>
	<script type="text/javascript">
		var $ctx = "${pageContext.request.contextPath}";
	</script>
	<script src="${pageContext.request.contextPath}/statics/js/project/product/add.js"></script>
</body>
</html>
