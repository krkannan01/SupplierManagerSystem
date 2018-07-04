<%--
  @author xietao.x@qq.com
  Created by 2018/3/28
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>用户权限管理 - 供应商管理系统</title>

    <meta name="description" content="Static &amp; Dynamic Tables" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

    <link rel="shortcut icon" href="${pageContent.request.contentPath}/statics/favicon.ico" type="image/x-icon" />

    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/assets/css/bootstrap.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/components/font-awesome/css/font-awesome.min.css" />

    <!-- page specific plugin styles -->
    <link rel="stylesheet" href="${pageContent.request.contentPath}/statics/css/bootstrap-dialog.css" />

    <!-- text fonts -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/assets/css/ace-fonts.css" />

    <!-- ace styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />

    <!--[if lte IE 9]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/assets/css/ace-part2.css" class="ace-main-stylesheet" />
    <![endif]-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/assets/css/ace-skins.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/assets/css/ace-rtl.css" />

    <!--[if lte IE 9]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/assets/css/ace-ie.css" />
    <![endif]-->

    <!-- inline styles related to this page -->

    <!-- ace settings handler -->
    <script src="${pageContext.request.contextPath}/statics/assets/js/ace-extra.js"></script>

    <!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

    <!--[if lte IE 8]>
    <script src="${pageContext.request.contextPath}/statics/components/html5shiv/dist/html5shiv.min.js"></script>
    <script src="${pageContext.request.contextPath}/statics/components/respond/dest/respond.min.js"></script>
    <![endif]-->
</head>

<body class="no-skin">
<!-- #section:basics/navbar.layout -->
<jsp:include page="${pageContext.request.contextPath}/common/head.jsp"/>

<!-- 删除确认模态框 -->
<div class="modal fade" id="deleteConfirm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-info">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                </button>
                <h4 class="modal-title">
                    确认
                </h4>
            </div>
            <div class="modal-body">
                你将删除跟该企业有关的所有数据，确定吗？
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default btn-white" data-dismiss="modal">
                    取消
                </button>
                <button type="button" class="btn btn-warning btn-white" id="confirm">
                    确定
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- /section:basics/navbar.layout -->
<div class="main-container ace-save-state" id="main-container">
    <script type="text/javascript">
        try{ace.settings.loadState('main-container')}catch(e){}
    </script>

    <% request.setAttribute("active","System-UserPrivilege"); %>
    <jsp:include page="${pageContext.request.contextPath}/common/menu.jsp"/>

    <!-- /section:basics/sidebar -->
    <div class="main-content">
        <div class="main-content-inner">

            <!-- /section:basics/content.breadcrumbs -->
            <div class="page-content">

                <!-- /section:settings.box -->
                <div class="page-header">
                    <h1>
                        系统管理
                        <small>
                            <i class="ace-icon fa fa-angle-double-right"></i>
                            用户权限管理
                        </small>
                    </h1>
                </div><!-- /.page-header -->

                <div class="row">
                    <div class="col-xs-12">

                        <div class="table-header">
                            用户信息
                        </div>

                        <!-- PAGE CONTENT BEGINS -->
                        <div class="" style="background-color: #EFF3F8; padding: 5px;">
                            <div class="row" style="height:36px;">
                                <label id="loadAnimate" style="font-size: 18px;display: none; float: left;margin-top: 5px;margin-left: 15px;"><i class="ace-icon fa fa-spinner fa-spin orange bigger-125"></i></label>
                                <!-- #section:basics/content.searchbox -->
                                <div class="nav-search" id="nav-search" style="margin-top: 8px;width: 300px;">
                                    <form class="form-search" action="javascript: void(0);">
                                        <span class="input-icon">
                                            <input type="text" placeholder="输入关键字查询" class="nav-search-input" id="keywords" autocomplete="off" style="width: 300px;" />
                                            <i class="ace-icon fa fa-search nav-search-icon"></i>
                                        </span>
                                    </form>
                                </div><!-- /.nav-search -->
                            </div>
                        </div>

                        <div>
                            <table id="simple-table" class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th class="center" style="width: 8%;">
                                        <label class="pos-rel">
                                            <input type="checkbox" class="ace" />
                                            <span class="lbl"></span>
                                        </label>
                                    </th>
                                    <th class="detail-col" style="width: 8%;">查看详情</th>
                                    <th style="width: 12%;">用户名</th>
                                    <th style="width: 12%;">用户级别</th>
                                    <th style="width: 12%;">联系方式</th>
                                    <th class="hidden-480" style="width: 15%;">最后在线</th>

                                    <th class="hidden-480" style="width: 15%;">状态</th>

                                    <th style="width: 15%;">操作</th>
                                </tr>
                                </thead>

                                <tbody>
                                </tbody>
                            </table>
                            <div class="" style="background-color: #EFF3F8; padding: 5px;">
                                <div class="row">
                                    <!--left-->
                                    <div class="col-sm-3 col-xs-12">
                                        <shiro:hasAnyPermission name="admin,deleteUser">
                                            <button class="btn btn-danger btn-sm btn-white btn-round" id="allDelete" style="height: 34px;">
                                                <i class="ace-icon fa fa-trash-o"></i> 删除选中项
                                            </button>
                                        </shiro:hasAnyPermission>

                                        <button class="btn btn-warning btn-sm btn-white btn-round" id="refursh" style="height: 34px;">
                                            <i class="ace-icon fa fa-bolt"></i> 刷新
                                        </button>

                                        <shiro:hasAnyPermission name="admin,insertUser">
                                            <a href="#modal-wizard" data-toggle="modal">
                                                <button class="btn btn-success btn-sm btn-white btn-round" id="insert" style="height: 34px;">
                                                    <i class="ace-icon fa fa-plus"></i> 新增
                                                </button>
                                            </a>

                                            <div id="modal-wizard" class="modal">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div id="modal-wizard-container">
                                                            <div class="modal-header">
                                                                <a class="close" data-dismiss="modal">×</a>
                                                                <h3 class="lighter block green">输入用户信息</h3>
                                                            </div>

                                                            <div class="modal-body step-content">
                                                                <form class="form-horizontal" id="user-form">
                                                                    <div class="row">
                                                                        <div class="col-sm-12">
                                                                            <div class="form-group has-warning">
                                                                                <label for="username" class="col-sm-3 control-label no-padding-right">用户名：</label>

                                                                                <div class="col-sm-7">
																		<span class="block input-icon input-icon-right">
																			<input type="text" id="username" class="width-100" />
																			<i class="ace-icon fa fa-info-circle" title="必填项"></i>
																		</span>
                                                                                    <samll style="position: absolute; top: 36px; left: 10px" class="orange">* 用户名是用户登录的账号, 唯一 必填<br/>
                                                                                        * 初始密码'123456' </samll>
                                                                                </div>
                                                                                <div class="help-block col-sm-reset inline"></div>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="space-12"></div>

                                                                    <div class="row">
                                                                        <div class="col-sm-12">
                                                                            <div class="form-group has-success">
                                                                                <label for="level" class="col-sm-3 control-label no-padding-right">用户级别：</label>

                                                                                <div class="col-sm-7">
                                                                                    <input type="text" id="level" class="width-100" />
                                                                                    <samll style="position: absolute; top: 36px; left: 10px" class="green">
                                                                                        * 用户级别默认为'普通用户' </samll>
                                                                                </div>

                                                                                <div class="help-block col-sm-reset inline"></div>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="space-6"></div>

                                                                    <div class="row">
                                                                        <div class="col-sm-12">
                                                                            <div class="form-group has-success">
                                                                                <label class="col-sm-3 control-label no-padding-right">初始状态：</label>

                                                                                <div class="col-sm-7">
                                                                                    <label>
                                                                                        <input type="checkbox" id="state" class="ace ace-switch ace-switch-6"/>
                                                                                        <span class="lbl" style="margin-top: 5px;"><label for="state">&nbsp;&nbsp;&nbsp;禁用</label></span>
                                                                                    </label>
                                                                                    <samll style="position: absolute; top: 36px; left: 10px" class="green">
                                                                                        * 初始状态为禁用时,账号将无法使用<br/>
                                                                                        * 只有管理员有权限将修改用户状态</samll>
                                                                                </div>
                                                                                <div class="help-block col-sm-reset inline"></div>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="space-12"></div>
                                                                </form>
                                                            </div>
                                                        </div>

                                                        <div class="modal-footer wizard-actions">
                                                            <button class="btn btn-sm" id="insert-user-submit">
                                                                提交
                                                            </button>

                                                            <button class="btn btn-success btn-sm" id="insert-user-cancel">
                                                                取消
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div><!-- PAGE CONTENT ENDS -->
                                        </shiro:hasAnyPermission>
                                    </div>

                                    <!--center-->
                                    <div class="col-sm-7 col-xs-12">
                                        <table style="margin: 0 auto;">
                                            <tr>
                                                <td>
                                                    <button class="btn btn-sm btn-white btn-primary" id="maxPrev" title="第一页">
                                                        <i class="ace-icon fa fa-angle-double-left"></i>
                                                    </button>
                                                    <button class="btn btn-sm btn-white btn-primary" id="prev" title="上一页">
                                                        <i class="ace-icon fa fa-angle-left"></i>
                                                    </button>
                                                </td>
                                                <td>
                                                    &nbsp;&nbsp;&nbsp;
                                                    当前第
                                                    <input type="text" id="currentPage" value="1" style="width: 100px;" />
                                                    页 - 共
                                                    <label id="maxPage">10</label>
                                                    页
                                                    &nbsp;&nbsp;&nbsp;
                                                </td>
                                                <td>
                                                    <button class="btn btn-sm btn-white btn-primary" id="next" title="下一页">
                                                        <i class="ace-icon fa fa-angle-right"></i>
                                                    </button>
                                                    <button class="btn btn-sm btn-white btn-primary" id="maxNext" title="最后一页">
                                                        <i class="ace-icon fa fa-angle-double-right"></i>
                                                    </button>
                                                </td>
                                                <td>
                                                    &nbsp;&nbsp;&nbsp;
                                                    每页显示
                                                    <input type="text" id="pageSize" />
                                                    条记录
                                                </td>
                                            </tr>
                                        </table>

                                    </div>

                                    <!--right-->
                                    <div class="col-sm-2 col-xs-12">
                                        <div style="text-align: right; height: 34px; padding: 5px;">显示 <label id="start">1</label> - <label id="end">10</label> 共 <label id="maxCount">23</label></div>
                                    </div>
                                </div>
                            </div>

                        </div><!-- /.span -->

                        <!-- PAGE CONTENT ENDS -->
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->

    <jsp:include page="${pageContext.request.contextPath}/common/foot.jsp"/>

    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>
</div><!-- /.main-container -->

<!-- basic scripts -->

<!--[if !IE]> -->
<script src="${pageContext.request.contextPath}/statics/components/jquery/dist/jquery.min.js"></script>

<!-- <![endif]-->

<!--[if IE]>
<script src="${pageContext.request.contextPath}/statics/components/jquery.1x/dist/jquery.js"></script>
<![endif]-->
<script type="text/javascript">
    if('ontouchstart' in document.documentElement) document.write("<script src='${pageContext.request.contextPath}/statics/components/_mod/jquery.mobile.custom/jquery.mobile.custom.js'>"+"<"+"/script>");
</script>
<script src="${pageContext.request.contextPath}/statics/components/bootstrap/dist/js/bootstrap.min.js"></script>

<!-- page specific plugin scripts -->
<script src="${pageContext.request.contextPath}/statics/components/datatables/media/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/_mod/datatables/jquery.dataTables.bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/datatables.net-buttons/js/buttons.flash.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/datatables.net-buttons/js/buttons.html5.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/datatables.net-buttons/js/buttons.print.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/datatables.net-buttons/js/buttons.colVis.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/datatables.net-select/js/dataTables.select.js"></script>
<script src="${pageContent.request.contentPath}/statics/assets/js/src/elements.treeview.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/_mod/fuelux/tree-modified-version.js"></script>
<script src="${pageContent.request.contentPath}/statics/components/datatables.net-select/js/dataTables.select.js"></script>
<script src="${pageContent.request.contentPath}/statics/components/jqueryui-touch-punch/jquery.ui.touch-punch.js"></script>
<script src="${pageContent.request.contentPath}/statics/components/_mod/easypiechart/jquery.easypiechart.min.js"></script>
<script src="${pageContent.request.contentPath}/statics/components/jquery.sparkline/index.min.js"></script>
<script src="${pageContent.request.contentPath}/statics/components/Flot/jquery.flot.min.js"></script>
<script src="${pageContent.request.contentPath}/statics/components/Flot/jquery.flot.pie.min.js"></script>
<script src="${pageContent.request.contentPath}/statics/components/Flot/jquery.flot.resize.min.js"></script>
<script src="${pageContent.request.contentPath}/statics/components/fuelux/js/spinbox.js"></script>
<script src="${pageContent.request.contentPath}/statics/components/bootbox.js/bootbox.js"></script>
<script src="${pageContent.request.contentPath}/statics/js/bootstrap-dialog.js"></script>


<!-- ace scripts -->
<jsp:include page="${pageContext.request.contextPath}/common/ace-script.jsp"/>
<jsp:include page="${pageContext.request.contextPath}/common/time.jsp"/>

<!-- inline scripts related to this page -->
<script type="text/javascript">
    jQuery(function($) {

        /*全局常用参数与对象*/
        var keywords = $("#keywords");
        var currentPage = $("#currentPage");
        var pageSize = $("#pageSize");

        var keywordsValue = null;/*关键字参数*/
        var currentPageValue = 1;/*当前页参数*/
        var pageSizeValue = 10;/*每页条数参数*/

        var defaultParams = {};
        initParam(defaultParams);

        /*参数初始化方法*/
        function initParam() {

            defaultParams = {
                "currentPage": currentPageValue,
                "pageSize": pageSizeValue,
                "keywords": keywordsValue
            };
            keywords.val(keywordsValue);
            currentPage.val(currentPageValue);
            pageSize.val(pageSizeValue);
        }

        /*第一页，上一页，下一页，最后一页，功能*/
        var maxPrev = $("#maxPrev");//第一页
        var prev = $("#prev");//上一页
        var next = $("#next");//下一页
        var maxNext = $("#maxNext");//最后一页
        var maxPage = $("#maxPage");//最大页码  注意元素为label节点 用html()获取值 以下相同
        var start = $("#start");//记录起点
        var end = $("#end");//记录结束点
        var maxCount = $("#maxCount");//最大记录数

        maxPrev.click(function() {
            currentPage.val(1);
            commonPageOperation();
        });
        prev.click(function() {
            currentPage.val(Number(currentPage.val()) - 1);
            commonPageOperation();
        });
        next.click(function() {
            currentPage.val(Number(currentPage.val()) + 1);
            commonPageOperation();
        });
        maxNext.click(function() {
            currentPage.val(maxPage.html());
            commonPageOperation();
        });
        /*公共的页码操作方法*/
        function commonPageOperation() {
            defaultParams.currentPage = currentPage.val();
            sendRequest();
        }

        /*检查页码状态方法*/
        function checkPageState() {
            /*检查数据*/
            var tempMaxCountValue = Number(maxCount.html());
            var tempPageSizeValue = Number(pageSize.val());
            var tempCurrentPageValue = Number(currentPage.val());
            /*设置最大页数*/
            var temp = Math.ceil(tempMaxCountValue / tempPageSizeValue);
            maxPage.html(temp < 1 ? 1:temp);

            /*检查页码范围*/
            checkRange();
            tempCurrentPageValue = Number(currentPage.val());

            /*设置起始记录数*/
            temp = tempCurrentPageValue * tempPageSizeValue - tempPageSizeValue + 1;
            start.html(temp > tempMaxCountValue ? tempMaxCountValue:temp);
            /*设置结束记录数*/
            temp = tempCurrentPageValue * tempPageSizeValue;
            end.html(temp > tempMaxCountValue ? tempMaxCountValue:temp);
        }
        /*检查页码范围与禁用状态*/
        function checkRange() {
            /*范围检查*/
            if (currentPage.val() > Number(maxPage.html())) {
                currentPage.val(maxPage.html());
            } else if (currentPage.val() < 1) {
                currentPage.val(0);
            }

            /*判断是否禁用向前翻页*/
            if (currentPage.val() <= 1) {
                currentPage.val(1);
                maxPrev.get(0).disabled = true;
                prev.get(0).disabled = true;
            } else {
                maxPrev.get(0).disabled = false;
                prev.get(0).disabled = false;
            }

            /*判断是否禁用向后翻页*/
            if (currentPage.val() >= Number(maxPage.html())) {
                currentPage.val(maxPage.html());
                maxNext.get(0).disabled = true;
                next.get(0).disabled = true;
            } else {
                maxNext.get(0).disabled = false;
                next.get(0).disabled = false;
            }
        }


        /*实现复选框全选功能*/
        $('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
            var th_checked = this.checked;//checkbox inside "TH" table header

            $(this).closest('table').find('tbody > tr').each(function(){
                var row = this;
                if(th_checked) $(row).addClass("success").find('input[type=checkbox]').eq(0).prop('checked', true);
                else $(row).removeClass("success").find('input[type=checkbox]').eq(0).prop('checked', false);
            });

        });

        /*实现行与复选框的状态同步*/
        $('#simple-table').delegate('tbody > tr.simple-row', 'click', function(){
            //TODO 此处如果是点击复选框，会触发两次行点击事件，暂时无法解决
            var docCheckbox = $(this).find('td input[type=checkbox]').get(0);
            if (docCheckbox.checked) {
                docCheckbox.checked = false;
                $(this).removeClass("success");
            } else {
                docCheckbox.checked = true;
                $(this).addClass("success");
            }

        });


        /*绑定显示详情页面*/
        $('body').delegate('.show-details-btn','click', function(e) {
            e.preventDefault();
            $(this).closest('tr').next().toggleClass('open');
            $(this).find(ace.vars['.icon']).toggleClass('fa-angle-double-down').toggleClass('fa-angle-double-up');
        });
        /***************/


        /*刷新*/
        $("#refursh").click(function() {
            sendRequest();
           <%--location.href = "${pageContext.request.contextPath}/user/toSearchUser";--%>
        });

        /*删除选中行*/
        $("#allDelete").click(function() {
            if ($("#simple-table > tbody > tr.simple-row > td input[type=checkbox]:checked").length < 1) {
                bootbox.dialog({
                    message: "请选中要删除的数据!",
                    buttons: {
                        "danger" : {
                            "label" : "确定",
                            "className" : "btn-sm btn-warning"
                        }
                    }
                });
                return;
            }
            var ids = "";
            $("#simple-table > tbody > tr.simple-row > td input[type='checkbox']").each(function(index, element) {
                if (element.checked) {
                    ids += element.getAttribute("data-id")+",";
                }
            });
            var first = true;
            $("#deleteConfirm").on('hidden.bs.modal', function () {
                if (first) {
                    var confirm = $("#confirm");
                    if (confirm.get(0).getAttribute("data-param") == "true") {
                        confirm.get(0).setAttribute("data-param", "false");
                        $.post("${pageContext.request.contextPath}/user/multiDelete", {"ids": ids}, function(data) {
                            if (data == "success") {
                                mShow("信息", "删除成功");
                                /*全选框重置*/
                                $('#simple-table > thead > tr > th input[type=checkbox]').eq(0).get(0).checked = false;
                                sendRequest();
                            } else {
                                mShow("信息", "删除失败，可能是权限不足");
                            }
                        }, 'text');
                    }
                    first = false;
                }
            });

            $("#deleteConfirm").modal("show");
        });

        /*渲染每页条数框*/
        pageSize.ace_spinner({value:10,min:5,max:100,step:5, btn_up_class:'btn-info' , btn_down_class:'btn-info'})
                .closest('.ace-spinner')
                .on('changed.fu.spinbox', function(){
                    /*检查页码状态，设置参数，发送请求*/
                    defaultParams.pageSize = pageSize.val();
                    sendRequest();
                });

        /*绑定当前页输入框的改变事件*/
        currentPage.on("change", function() {
            /*设置参数，发送请求*/
            defaultParams.currentPage = currentPage.val();
            sendRequest();
        });

        /*页面初始化时加载数据*/
        /*检索初始参数*/
        var currentPageParam = "<%=request.getAttribute("currentPage")%>";
        var pageSizeParam = "<%=request.getAttribute("pageSize")%>";
        if (currentPageParam != "null" && currentPageParam != "") {
            defaultParams.currentPage = currentPageParam;
            currentPage.val(currentPageParam);
        }
        if (pageSizeParam != "null" && pageSizeParam != "") {
            defaultParams.pageSize = pageSizeParam;
            pageSize.val(pageSizeParam);
        }
        sendRequest();

        /*发送请求方法*/
        function sendRequest(param) {
            if (!param) param = defaultParams;

            var load = $("#loadAnimate");
            var prev = load.prev();

            /*显示加载图标*/
            load.css("display", "block");
            prev.css("display", "none");

            $.ajax({
                url: "${pageContext.request.contextPath}/user/search",
                type: "POST",
                dataType: "JSON",
                data: param,
                async: false,
                success: function (data) {
                    var content = "";
                    if (data.rows != null && data.rows.length > 0) {

                        $.each(data.rows, function(index, item) {
                            /*已知 birthday lastOnlineTime*/
                            var birthday = item.birthday,lastOnlineTime = item.lastOnlineTime;
                            /*计算生日，年龄, 最后在线时间, 状态的显示文本*/
                            var realName = item.realName != null ? item.realName:"秘密";
                            var born = item.birthday != null ? item.birthday.substring(5):"秘密";
                            var age = item.birthday != null ? (new Date().getFullYear()-item.birthday.substring(0,4)):"秘密";
                            var lastOnlineHourBefore = null;
                            if (item.online != null && item.online == 1) {
                                lastOnlineHourBefore = "<b class='green'>当前在线</b>";
                            } else if (item.lastOnlineTime != null) {
                                var now = new Date();
                                var temp = new Date(item.lastOnlineTime);
                                var milliseconds = now.getTime() - temp.getTime();
                                var hours = Math.floor(milliseconds/3600000);
                                if (hours == 0) {
                                    lastOnlineHourBefore = Math.floor(milliseconds/60000) + "分钟前"
                                } else {
                                    lastOnlineHourBefore = (hours > 24 ? Math.floor(hours/24) + "天":"") + hours%24 + "小时前";
                                }
                            }
                            var phoneNumber = item.phoneNumber ? "<b class='green'>"+item.phoneNumber+"</b>":"<b class='orange'>无</b>";
                            var state = "<span class='label label-sm"+ (item.state == 1 ? " label-warning'>已启用":"'>已禁用") +"</span>"
                            var location = item.location == undefined ? "":item.location;
                            var aboutMe = item.aboutMe == undefined ? "":item.aboutMe;

                            content += "<tr class='simple-row'>" +
                            "<td class='center'>" +
                            "<label class='pos-rel'>" +
                            "<input type='checkbox' class='ace' data-id='"+ item.id +"'/>" +
                            "<span class='lbl'></span>" +
                            "</label>" +
                            "</td>" +

                            "<td class='center'>" +
                            "<div class='action-buttons'>" +
                            "<a href='#' class='green bigger-140 show-details-btn' title='查看详情'>" +
                            "<i class='ace-icon fa fa-angle-double-down'></i>" +
                            "<span class='sr-only'>详情</span>" +
                            "</a>" +
                            "</div>" +
                            "</td>" +

                            "<td>"+ item.username +"</td>" +
                            "<td>"+ item.level +"</td>" +
                            "<td>"+ phoneNumber +"</td>" +
                            "<td class='hidden-480'>"+ lastOnlineHourBefore +"</td>" +

                            "<td class='hidden-480'>" +
                            state +
                            "</td>" +

                            "<td>" +
                            "<div class='btn-group'>" +

                            "<shiro:hasAnyPermission name='admin,updateUser'>" +
                            "<button class='btn btn-xs btn-info updateUser' data-id='"+ item.id +"'>" +
                            "<i class='ace-icon fa fa-pencil bigger-120'></i>修改" +
                            "</button>" +
                            "</shiro:hasAnyPermission>" +

                            "<shiro:hasAnyPermission name='admin,deleteUser'>" +
                            "<button class='btn btn-xs btn-warning deleteUser' data-id='"+ item.id +"'>" +
                            "<i class='ace-icon fa fa-trash-o bigger-120'></i>删除" +
                            "</button>" +
                            "</shiro:hasAnyPermission>" +

                            "</div>" +
                            "</td>" +
                            "</tr>" +

                            "<tr class='detail-row'>" +
                            "<td colspan='8'>" +
                            "<div class='table-detail'>" +
                            "<div class='row'>" +
                            "<div class='col-xs-12 col-sm-2'>" +
                            "<div class='text-center'>" +
                            "<img height='150' class='thumbnail inline no-margin-bottom' alt='头像' style='width: 136px; height: 150px;' src='${pageContext.request.contextPath}/statics/"+ (item.headImg ? "headImg/"+item.headImg:"assets/avatars/profile-pic.jpg") +"' />" +
                            "<br />" +
                            "<div class='width-80 label label-info label-xlg arrowed-in arrowed-in-right'>" +
                            "<div class='inline position-relative'>" +
                            "<a class='user-title-label' href='#'>" +
                            "<i class='ace-icon fa fa-circle light-green'></i>" +
                            "&nbsp;" +
                            "<span class='white'>"+ item.username +"</span>" +
                            "</a>" +
                            "</div>" +
                            "</div>" +
                            "</div>" +
                            "</div>" +

                            "<div class='col-xs-12 col-sm-5'>" +
                            "<div class='space visible-xs'></div>" +

                            "<div class='profile-user-info profile-user-info-striped'>" +
                            "<div class='profile-info-row'>" +
                            "<div class='profile-info-name'> 生日 </div>" +

                            "<div class='profile-info-value'>" +
                            "<span>"+ born +"</span>" +
                            "</div>" +
                            "</div>" +

                            "<div class='profile-info-row'>" +
                            "<div class='profile-info-name'> 姓名 </div>" +

                            "<div class='profile-info-value'>" +
                            "<span>"+ realName +"</span>" +
                            "</div>" +
                            "</div>" +

                            "<div class='profile-info-row'>" +
                            "<div class='profile-info-name'> 位置 </div>" +

                            "<div class='profile-info-value'>" +
                            "<i class='fa fa-map-marker light-orange bigger-110'></i>" +
                            "<span> "+ location +"</span>" +
                            "</div>" +
                            "</div>" +

                            "<div class='profile-info-row'>" +
                            "<div class='profile-info-name'> 年龄 </div>" +

                            "<div class='profile-info-value'>" +
                            "<span>"+ age +"</span>" +
                            "</div>" +
                            "</div>" +

                            "<div class='profile-info-row'>" +
                            "<div class='profile-info-name'> 创建时间 </div>" +

                            "<div class='profile-info-value'>" +
                            "<span>"+ item.createTime +"</span>" +
                            "</div>" +
                            "</div>" +

                            "<div class='profile-info-row'>" +
                            "<div class='profile-info-name'> 上次在线 </div>" +

                            "<div class='profile-info-value'>" +
                            "<span>"+ lastOnlineTime +"</span>" +
                            "</div>" +
                            "</div>" +

                            "<div class='profile-info-row'>" +
                            "<div class='profile-info-name'> 关于我 </div>" +

                            "<div class='profile-info-value'>" +
                            "<span>"+ aboutMe +"</span>" +
                            "</div>" +
                            "</div>" +
                            "</div>" +
                            "</div>" +

                            "<shiro:hasAnyPermission name="admin,updateUser">" +
                            "<div class='col-xs-12 col-sm-5'>" +
                            "<div class='space visible-xs'></div>" +
                            "<div class='widget-box widget-color-blue2'>" +
                            "<div class='widget-header'>" +
                            "<h4 class='widget-title lighter smaller'>权限分配</h4>" +
                            "</div>" +

                            "<div class='widget-body'>" +
                            "<div class='widget-main padding-8'>" +
                            "<div style='text-align: center;'><button class='btn btn-sm btn-info' id='load-privilege'><i class='ace-icon fa fa-refresh'></i>加载权限数据</button></div>" +
                            "<div><i class='ace-icon fa fa-refresh fa-spin blue hidden'></i></div>" +
                            "<ul id='tree"+ item.id +"' data-id='"+ item.id +"'></ul>" +
                            "<div class='btn-group'>" +
                            "<button class='btn btn-sm btn-warning hidden'><i class='ace-icon fa fa-cloud-upload'></i>提交更改</button >" +
                            "<button class='btn btn-sm btn-success hidden'><i class='ace-icon fa fa-share'></i>取消更改</button>" +
                            "</div>" +
                            "</div>" +
                            "</div>" +
                            "</div>" +
                            "</div>" +
                            "</shiro:hasAnyPermission>" +

                            "</div>" +
                            "</div>" +
                            "</td>" +
                            "</tr>";
                        });
                    } else {
                        content += "<tr><td colspan='8'><div class='alert alert-warning' style='padding: 5px;margin-bottom: 0;text-align: center;'>没有信息</div></td></tr>";
                    }
                    $("#simple-table > tbody").html(content);

                    maxCount.html(data.count);
                    checkPageState();

                    /*隐藏加载图标*/
                    load.css("display", "none");
                    prev.css("display", "block");
                }
            });
        }

        /*删除信息操作*/
        $("#simple-table").delegate(".deleteUser", "click", function() {
            var id = this.getAttribute("data-id");
            var first = true;
            $("#deleteConfirm").on('hidden.bs.modal', function () {
                if (first) {
                    var confirm = $("#confirm");
                    if (confirm.get(0).getAttribute("data-param") == "true") {
                        $.post("${pageContext.request.contextPath}/user/delete", {"id": id}, function(data) {
                            confirm.get(0).setAttribute("data-param", "false");
                            if (data == "success") {
                                mShow("信息", "删除成功!");
                                sendRequest();
                            } else {
                                mShow("信息", "删除失败，可能是权限不足!");
                            }
                        }, 'text');
                    }
                    first = false;
                }
            });

            $("#deleteConfirm").modal("show");
        });

        /*绑定模态框确认事件*/
        $("#confirm").click(function() {
            this.setAttribute("data-param", "true");
            $("#deleteConfirm").modal("hide");
        });


        /*关键字查询*/
        keywords.keypress(function(event) {
            if (event.keyCode == 13) {
                exec();
            }
        });

        keywords.next().click(function() {
            exec();
        });

        function exec() {
            defaultParams.keywords = keywords.val();
            sendRequest();
        }

        /*记录改动的元素的data-value值*/
        var update_data = [];

        /*给Array添加原生方法remove*/
        Array.prototype.remove = function(item) {
            var c = 0;
            for (var i=0,j=0; i<this.length; i++) {
                if (this[i] == item) {
                    c++;
                    continue;
                }
                this[j++] = this[i];
            }
            this.length -= c;
        }

        /*加载数据*/
        function loadData(userId, $element) {
            /*获取所有用户数据*/
            var privilege_data = getPrivilegeData();
            /*设置用户权限数据*/
            // 加载用户权限数据
            var user_privilege_data = null;
            $.ajax({
                url: "${pageContext.request.contextPath}/user/getUserPrivilege",
                data: {id: userId},
                async: false,
                type: "post",
                success: function(data) {
                    user_privilege_data = data;
                },
                dataType: "json"
            });
            //var user_privilege_data = [1,2,3,6];
            var sampleData = initiateTreeData(privilege_data, user_privilege_data);//see below
            $element.ace_tree({
                dataSource: sampleData['dataSource1'],
                multiSelect: true,
//                cacheItems: true,
                'open-icon' : 'ace-icon tree-minus',
                'close-icon' : 'ace-icon tree-plus',
                'itemSelect' : true,
                'folderSelect': false,
                'expand': false,
                'selected-icon' : 'ace-icon fa fa-check',
                'unselected-icon' : 'ace-icon fa fa-times',
                loadingHTML : '<div class="tree-loading"><i class="ace-icon fa fa-refresh fa-spin blue"></i></div>'
            }).on("loaded.fu.tree", function(e) {
                $(this).prev().addClass("hidden");
            }).on('updated.fu.tree', function(e) {
                var value = e.target.getAttribute("data-value");
                /*判断是否重复*/
                var repeat = false;
                for (var i=0; i<update_data.length; i++) {
                    if (value == update_data[i]) {
                        repeat = true;
                    }
                }
                if (repeat) {
                    update_data.remove(value);
                } else {
                    update_data.push(value);
                }
                console.log(update_data);
            });
        }

        var privilege_data = null;

        /*获取所有权限数据数据*/
        function getPrivilegeData() {

            if (privilege_data == null) {
                // 加载所有权限数据，判断只加载一次
                $.ajax({
                    url: "${pageContext.request.contextPath}/user/getAllPrivilege",
                    dataType: "json",
                    async: false,
                    type: "post",
                    success: function(data) {
                        privilege_data = data;
                    }
                });
            }

            var tree_data = {};
            if (privilege_data != null && privilege_data.length > 0) {
                $.each(privilege_data, function(index, item) {
                    tree_data[item.id] = {text: item.name, type: 'folder'};
                    if (item.childrens != null && item.childrens.length > 0) {
                        tree_data[item.id]['additionalParameters'] = {
                            'children' : {}
                        };
                        $.each(item.childrens, function(index2, item2) {
                            tree_data[item.id]['additionalParameters']['children'][item2.id] = {text: item2.name, type: 'item', value: item2.id};
                        });
                    }
                });
                // console.log(tree_data);
            } else {
                // console.log(responseData);
            }

            return tree_data;
        }

        /*初始化用户权限数据
         * param1: 所有权限数据
         * param2: 用户权限数据
         * return: 最终显示数据*/
        function initiateTreeData(privilege_data, user_privilege_data){
            if(Array.isArray(user_privilege_data)) {
                $.each(privilege_data, function(index_p, item_p) {
                    var children = item_p['additionalParameters']['children'];
                    $.each(user_privilege_data, function(index_c, item_c) {
                        if (children[item_c]) {
                            children[item_c]['state'] = 'open';
                            item_p['state'] = 'open';
                        }
                    });
                });
            }

            // console.log(privilege_data);

            var dataSource1 = function(options, callback){
                var $data = null
                if(!("text" in options) && !("type" in options)){
                    $data = privilege_data;//the root tree
                    callback({ data: $data });
                    return;
                }
                else if("type" in options && options.type == "folder") {
                    if("additionalParameters" in options && "children" in options.additionalParameters)
                        $data = options.additionalParameters.children || {};
                    else $data = {}//no data
                }

                if($data != null)//this setTimeout is only for mimicking some random delay
                    setTimeout(function(){callback({ data: $data });} , parseInt(Math.random() * 500) + 200);

                //we have used static data here
                //but you can retrieve your data dynamically from a server using ajax call
                //checkout examples/treeview.html and examples/treeview.js for more info
            }

            return {'dataSource1': dataSource1}

        }

        // 绑定 获取权限数据 事件
        $("#simple-table").delegate("#load-privilege", "click", function() {
            $(this).addClass("hidden")
            $(this).parent().next().removeClass("hidden");
            var tree = $(this).parent().next().next();
            loadData(tree.attr("data-id"), tree);

            /*绑定 提交更改和取消更改按钮事件*/
            tree.next().children().eq(0).click(function() {
                var update_data_str = "";
                for (var i=0; i<update_data.length; i++) {
                    update_data_str += update_data[i] + ",";
                }
                $.post("${pageContext.request.contextPath}/user/updateUserPrivilege",{id: tree.attr("data-id"), privilegeIds: update_data_str}, function(data) {
                    if (data == "success") {
                         mShow("信息", "成功!");
                        sendRequest();
                        update_data = [];
                    } else {
                        mShow("信息", "提交失败，可能是权限不足!");
                    }
                }, "text");
            });
            tree.next().children().eq(1).click(function() {
                /*还原*/
                tree.find("li.tree-item").each(function(index, item) {
                    var $item = $(item);
                    for (var i=0; i<update_data.length; i++) {
                        if ($item.attr("data-value") == update_data[i]) {
                            $item.click();
                        }
                    }
                });
            });

            /*移除提交更改和取消更改按钮的隐藏属性*/
            tree.next().children().eq(0).removeClass("hidden");
            tree.next().children().eq(1).removeClass("hidden");
        });

        /*绑定新增用户信息->初始状态复选框改变事件*/
        $("#state").change(check_change);

        function check_change() {
            var $label = $(this).next().children().eq(0);
            if (this.checked) {
                $label.html("&nbsp;&nbsp;&nbsp;启用");
                $label.css("color", "orange");
            } else {
                $label.html("&nbsp;&nbsp;&nbsp;禁用");
                $label.css("color", "");
            }
        }

        /*绑定新增用户信息->确认提交用户信息按钮事件*/
        $("#insert-user-submit").click(function() {

            if (!$("#username").closest(".form-group").hasClass("has-success")) {
                $("#username").focus();
                return;
            }
            var param = {username: $("#username").val(),
                        level: $("#level").val(),
                        state: $("#state").get(0).checked ? 1:0}
            $.post("${pageContext.request.contextPath}/user/insertUser", param, function(data) {
                if (data == "success") {
                    mShow("信息","添加成功");
                    /*重置表单*/
                    $("#insert-user-cancel").click();
                    /*重载数据*/
                    sendRequest();
                } else if (data == "fail") {
                    mShow("信息","添加失败");
                } else {
                    mShow("信息","返回数据异常");
                }
            }, "text");
        });

        /*绑定新增用户信息->取消提交用户信息按钮事件*/
        $("#insert-user-cancel").click(function() {
            /*重置表单*/
            $("#user-form").get(0).reset();
            var $username = $("#username");
            $username.closest(".form-group").removeClass("has-success").addClass("has-warning");
            $username.next().removeClass("fa-check-circle").addClass("fa-info-circle").get(0).setAttribute("title", "必填项");
            $username.parent().next().addClass("orange").removeClass("green");
            /*关闭窗口*/
            $("#modal-wizard").modal("hide");
        });

        /*绑定新增用户信息表单验证*/
        $("#username").blur(function() {
            var $this = $(this);
            if ($this.val()) {
                /*验证用户名是否唯一*/
                $.post("${pageContext.request.contextPath}/login/isUnique", {username: $this.val()}, function(data) {
                    if (data == "true") {
                        /*如果有 移除success,warning样式 添加error样式*/
                        $this.closest(".form-group").removeClass("has-success").removeClass("has-warning").addClass("has-error");
                        $this.next().removeClass("fa-info-circle").removeClass("fa-check-circle").removeClass("fa-check-circle").addClass("fa-times").get(0).setAttribute("title", "企业名称已存在");
                        bootbox.dialog({
                            "message": "该企业名称已存在了，不允许重复添加哦",
                            "buttons": {
                                "danger": {
                                    "label": "知道了",
                                    "className": "btn-sm btn-warning"
                                }
                            }
                        });
                    } else {
                        /*如果没有，移除error,warning样式 添加success样式*/
                        $this.closest(".form-group").removeClass("has-warning").removeClass("has-error").addClass("has-success");
                        $this.next().removeClass("fa-info-circle").removeClass("fa-times").addClass("fa-check-circle").get(0).setAttribute("title", "通过验证");
                        $this.parent().next().removeClass("orange").addClass("green");
                    }
                }, "text");
            } else {
                $this.closest(".form-group").removeClass("has-success").addClass("has-warning");
                $this.next().removeClass("fa-check-circle").addClass("fa-info-circle").get(0).setAttribute("title", "必填项");
                $this.parent().next().addClass("orange").removeClass("green");
            }
        });

        /*绑定新增用户信息表单回车事件*/
        $("#modal-wizard").keypress(function(e) {
            if (e.keyCode == 13) {
                $("#insert-user-submit").click();
            }
        });


        /*绑定修改按钮事件*/
        $("#simple-table").delegate(".updateUser", "click", function() {
            var id = this.getAttribute("data-id");
            $.post("${pageContext.request.contextPath}/user/findUserById", {id: id}, function(data) {
                BootstrapDialog.confirm({
                    title: "修改用户信息",
                    message: "<form class='form-horizontal' id='user-form-update' style='height: 120px;'>" +
                    "<input id='userId-update' value='"+ data.id +"' style='display: none;' />" +
                    "<div class='col-sm-12'>" +
                    "<div class='form-group has-success'>" +
                    "<label for='username-update' class='col-sm-3 control-label no-padding-right'>用户名称：</label>" +

                    "<div class='col-sm-7'>" +
                    "<label id='username-update' class='control-label width-100' style='text-align: left;'>"+ data.username +"</label>" +
                    "</div>" +
                    "<div class='help-block col-sm-reset inline'></div>" +
                    "</div>" +
                    "</div>" +

                    "<div class='col-sm-12'>" +
                    "<div class='form-group has-success'>" +
                    "<label for='level-update' class='col-sm-3 control-label no-padding-right'>用户级别：</label>" +

                    "<div class='col-sm-7'>" +
                    "<span class='block'>" +
                    "<input type='text' id='level-update' placeholder='"+ data.level +"' class='width-100' />" +
                    "</span>" +
                    "</div>" +
                    "<div class='help-block col-sm-reset inline'></div>" +
                    "</div>" +
                    "</div>" +


                    "<div class='col-sm-12'>" +
                    "<div class='form-group has-success'>" +
                    "<label class='col-sm-3 control-label no-padding-right'>用户状态：</label>" +

                    "<div class='col-sm-7'>" +
                    "<label>" +
                    "<input type='checkbox' id='state-update' class='ace ace-switch ace-switch-6'"+ (data.state == 1 ? " checked":"") +"/>" +
                    "<span class='lbl' style='margin-top: 5px;'><label for='state-update'>&nbsp;&nbsp;&nbsp;"+ (data.state == 1 ? "启用":"禁用") +"</label></span>" +
                    "</label>" +
                    "</div>" +
                    "<div class='help-block col-sm-reset inline'></div>" +
                    "</div>" +
                    "</div>" +
                    "</form>",
                    type: BootstrapDialog.TYPE_WARNING, // <-- Default value is BootstrapDialog.TYPE_PRIMARY
                    closable: true, // <-- Default value is false
                    draggable: true, // <-- Default value is false
                    btnCancelLabel: '取消', // <-- Default value is 'Cancel',
                    btnCancelClass: "btn btn-white btn-primary",
                    btnOKLabel: "确定", // <-- Default value is 'OK',
                    btnOKClass: "btn btn-white btn-success", // <-- If you didn't specify it, dialog type will be used,
                    callback: function(result) {
                        // result will be true if button was click, while it will be false if users close the dialog directly.
                        if(result) {
                            /*如果提交*/
                            var id = $("#user-form-update #userId-update");
                            var level = $("#user-form-update #level-update");
                            var state = $("#user-form-update #state-update");
                            var user_data = {};
                            user_data["id"] = id;
                            if (level.val()) user_data["level"] = level.val();
                            if (state.val()) user_data["state"] = state.val();
                            $.post("${pageContext.request.contextPath}/user/updateCoreUser", user_data, function(data) {
                                if (data == "success") {
                                    mShow("信息", "修改成功");
                                    sendRequest();
                                } else {
                                    mShow("信息", "修改失败");
                                }
                            }, "text");
                        }
                    }
                });
            }, "json");
        });

        $("body").delegate("#state-update", "change", check_change);

    });
</script>

<!-- the following scripts are used in demo only for onpage help and you don't need them -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/statics/assets/css/ace.onpage-help.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/statics/docs/assets/js/themes/sunburst.css" />

<script type="text/javascript"> ace.vars['base'] = '..'; </script>
<script src="${pageContext.request.contextPath}/statics/assets/js/src/elements.onpage-help.js"></script>
<script src="${pageContext.request.contextPath}/statics/assets/js/src/ace.onpage-help.js"></script>
<script src="${pageContext.request.contextPath}/statics/docs/assets/js/rainbow.js"></script>
<script src="${pageContext.request.contextPath}/statics/docs/assets/js/language/generic.js"></script>
<script src="${pageContext.request.contextPath}/statics/docs/assets/js/language/html.js"></script>
<script src="${pageContext.request.contextPath}/statics/docs/assets/js/language/css.js"></script>
<script src="${pageContext.request.contextPath}/statics/docs/assets/js/language/javascript.js"></script>
</body>
</html>