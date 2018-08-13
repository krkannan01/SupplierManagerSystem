<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ path;
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta charset="utf-8" />
	<title>添加商品信息 - 供应商管理系统</title>
	<meta name="description" content="with selectable elements and custom icons" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
	<link rel="shortcut icon" href="<%=basePath%>/statics/favicon.ico" type="image/x-icon">

	<!-- bootstrap-table 表格插件样式 -->
	<link href="<%=basePath%>/statics/css/bootstrap-table.min.css" rel="stylesheet"/>
	<link href="<%=basePath%>/statics/css/animate.css" rel="stylesheet"/>
	<link href="<%=basePath%>/statics/css/style.css" rel="stylesheet"/>
	<link href="<%=basePath%>/statics/css/checkbox.css" rel="stylesheet"/>
	<link href="<%=basePath%>/statics/css/RuoYi.css" rel="stylesheet"/>

	<link rel="stylesheet" href="<%=basePath%>/statics/assets/css/bootstrap.css" />
	<link rel="stylesheet" href="<%=basePath%>/statics/components/font-awesome/css/font-awesome.min.css" />
	<link rel="stylesheet" href="<%=basePath%>/statics/js/select/select2.css" />

	<style type="text/css">
		.required:before { color: red; content: '*'; }
		/* 重置下拉选择框的默认高度 */
		.select2-results__options { max-height: 270px !important; }
	</style>

</head>
<body class="white-bg">
	<div class="wrapper wrapper-content animated fadeInRight ibox-content">
		<form class="form-horizontal m" id="form-product-add">
			<input name="id" type="hidden" />
			<div class="form-group">
				<label class="col-sm-3 control-label required">商品名称：</label>
				<div class="col-sm-8">
					<input class="form-control" type="text" name="name">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">商品规格：</label>
				<div class="col-sm-8">
					<input class="form-control" type="text" name="size">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">商品品牌：</label>
				<div class="col-sm-8">
					<input class="form-control" type="text" name="brand">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label required">商品单位：</label>
				<div class="col-sm-8">
					<input class="form-control" type="text" name="unit">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label required">商品单价：</label>
				<div class="col-sm-8">
					<input class="form-control" type="text" name="price">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">技术参数：</label>
				<div class="col-sm-8">
					<input class="form-control" type="text" name="param">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label required">所属分组：</label>
				<div class="col-sm-8">
					<select class="form-control" name="group"></select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label required">供应商：</label>
				<div class="col-sm-8">
					<select class="form-control" name="supplier"></select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">备注：</label>
				<div class="col-sm-8">
					<input class="form-control" type="text" name="comment">
				</div>
			</div>
			
			<div class="form-group">
				<div class="form-control-static col-sm-offset-9">
					<button type="submit" class="btn btn-primary">提交</button>
					<button class="btn btn-danger" type="button" onclick="javascript:layer_close();">关闭</button>
				</div>
			</div>
		</form>
	</div>
	<script src="<%=basePath%>/statics/components/jquery/dist/jquery.min.js"></script>
	<script src="<%=basePath%>/statics/components/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="<%=basePath%>/statics/js/validate/jquery.validate.min.js"></script>
	<script src="<%=basePath%>/statics/js/validate/messages_zh.min.js"></script>
	<script src="<%=basePath%>/statics/js/select/select2.js"></script>
	<script src="<%=basePath%>/statics/js/layer/layer.min.js"></script>
	<script src="<%=basePath%>/statics/js/ry-common.js"></script>
	<script src="<%=basePath%>/statics/js/ry-ui.js"></script>
	<script type="text/javascript">
		var $ctx = "<%=basePath%>";
	</script>
	<script src="<%=basePath%>/statics/js/project/product/add.js"></script>
</body>
</html>
