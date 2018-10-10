<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh_CN">
<meta charset="utf-8">
<jsp:include page="${pageContext.request.contextPath}/common/fregment-header.jsp"></jsp:include>
<body class="white-bg">
	<div class="wrapper wrapper-content animated fadeInRight ibox-content">
	<form class="form-horizontal m-t" id="signupForm">
		<div class="form-group">
			<label class="col-sm-2 control-label">操作模块：</label>
			<div class="form-control-static"> ${operLog.title} / ${operLog.action} </div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">登录信息：</label>
			<div class="form-control-static"> ${operLog.loginName} / ${operLog.operIp} </div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">请求地址：</label>
			<div class="form-control-static"> ${operLog.operUrl} </div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">操作方法：</label>
			<div class="form-control-static"> ${operLog.method} </div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">请求参数：</label>
			<div class="form-control-static"> ${operLog.operParam} </div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">状态：</label>
			<div class="form-control-static" class="${operLog.status == 0 ? 'label label-primary' : 'label label-danger'}"> ${operLog.status == 0 ? '正常' : '异常'} </div>
		</div>
		<div class="form-group" style="display: ${operLog.status == 0 ? 'none' : 'block'}">
			<label class="col-sm-2 control-label">异常信息：</label>
			<div class="form-control-static"> ${operLog.errorMsg} </div>
		</div>
		<div class="form-group">
			<div class="form-control-static col-sm-offset-9">
				<button onclick="javascript:layer_close()" class="btn btn-danger" type="button">关闭</button>
			</div>
		</div>
	</form>
    </div>
	<jsp:include page="${pageContext.request.contextPath}/common/fregment-footer.jsp"></jsp:include>
</body>
</html>