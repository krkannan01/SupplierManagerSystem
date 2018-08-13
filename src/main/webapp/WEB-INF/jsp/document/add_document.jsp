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
	<title>添加文档信息 - 供应商管理系统</title>
	<meta name="description" content="with selectable elements and custom icons" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
	<link rel="shortcut icon" href="<%=basePath%>statics/favicon.ico" type="image/x-icon">

	<style type="text/css">
		.required:before { color: red; content: '*'; }
	</style>

	<!-- bootstrap-table 表格插件样式 -->
	<link href="<%=basePath%>/statics/css/bootstrap-table.min.css" rel="stylesheet"/>
	<link href="<%=basePath%>/statics/css/animate.css" rel="stylesheet"/>
	<link href="<%=basePath%>/statics/css/style.css" rel="stylesheet"/>
	<link href="<%=basePath%>/statics/css/checkbox.css" rel="stylesheet"/>
	<link href="<%=basePath%>/statics/css/fileinput.css" media="all" rel="stylesheet" type="text/css"/>

	<link rel="stylesheet" href="<%=basePath%>/statics/assets/css/bootstrap.css" />
	<link rel="stylesheet" href="<%=basePath%>/statics/components/font-awesome/css/font-awesome.min.css" />
	<link rel="stylesheet" href="<%=basePath%>/statics/js/select/select2.css" />

</head>
<body class="white-bg">
	<div class="wrapper wrapper-content animated fadeInRight ibox-content">
		<form class="form-horizontal m" id="form-document-add" enctype="multipart/form-data" method="post" action="<%=basePath%>/document/insertDocument">
			<input name="id" type="hidden" />
			<div class="form-group">
				<label class="col-sm-3 control-label required">文档名称：</label>
				<div class="col-sm-8">
					<input class="form-control" type="text" name="name">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label required">文档类型：</label>
				<div class="col-sm-8">
					<select class="form-control" name="type"></select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label required">所属供应商：</label>
				<div class="col-sm-8">
					<select class="form-control" name="supplier"></select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">文档描述：</label>
				<div class="col-sm-8">
					<input class="form-control" type="text" name="description">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label required">附件上传：</label>
				<div class="col-sm-8">
					<input name="appendix" type="file" class="form-control file" data-show-preview="false">
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
	<script src="<%=basePath%>/statics/js/fileinput.min.js" type="text/javascript"></script>
	<script src="<%=basePath%>/statics/js/layer/layer.min.js"></script>
	<script src="<%=basePath%>/statics/js/ry-common.js"></script>
	<script src="<%=basePath%>/statics/js/ry-ui.js"></script>
	<script type="text/javascript">
		var $ctx = "<%=basePath%>";
		// 设置附件上传框的样式
        $("input[name=appendix]").fileinput({
			"showCancel": false,
			"showRemove": false,
			"showUpload": false
        });
	</script>
	<script src="<%=basePath%>/statics/js/project/document/add_document.js"></script>
</body>
</html>
