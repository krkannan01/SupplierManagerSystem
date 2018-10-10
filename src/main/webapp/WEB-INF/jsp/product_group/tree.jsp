<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<jsp:include page="${pageContext.request.contextPath}/common/fregment-header.jsp"></jsp:include>
<link href="${pageContext.request.contextPath}/ry-statics/ajax/libs/jquery-ztree/3.5/css/metro/zTreeStyle.css" rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/statics/css/RuoYi.css" rel="stylesheet"/>
<style>
body{height:auto;font-family: "Microsoft YaHei";}
button{font-family: "SimSun","Helvetica Neue",Helvetica,Arial;}
</style>
<body class="hold-transition box box-main">
	<input id="treeId"   name="treeId"    type="hidden"/>
	<input id="treeName" name="treeName"  type="hidden"/>
	<div class="wrapper"><div class="treeShowHideButton" onclick="search();">
		<label id="btnShow" title="显示搜索" style="display:none;">︾</label>
		<label id="btnHide" title="隐藏搜索">︽</label>
	</div>
	<div class="treeSearchInput" id="search">
		<label for="keyword">关键字：</label><input type="text" class="empty" id="keyword" maxlength="50">
		<button class="btn" id="btn" onclick="searchNode()"> 搜索 </button>
	</div>
	<div class="treeExpandCollapse">
		<a href="javascript:" id="btnExpand">展开</a> /
		<a href="javascript:" id="btnCollapse">折叠</a>
	</div>
	<div id="tree" class="ztree treeselect"></div>
	</div>
	<div class="layui-layer-btn">
		<a class="layui-layer-btn0" onclick="javascript:loadMenu()"><i class="fa fa-check"></i> 确定</a>
		<a class="layui-layer-btn1" onclick="javascript:layer_close()"><i class="fa fa-close"></i> 关闭</a>
	</div>
	<jsp:include page="${pageContext.request.contentType}/common/fregment-footer.jsp"></jsp:include>
	<script src="${pageContext.request.contextPath}/ry-statics/ajax/libs/jquery-ztree/3.5/js/jquery.ztree.all-3.5.js"></script>
	<script src="${pageContext.request.contextPath}/statics/js/project/product_group/tree.js"></script>
	<script type="text/javascript">
		var treeName = parent.groupName;
		$("#treeName").val(treeName);
	</script>
</body>
</html>
