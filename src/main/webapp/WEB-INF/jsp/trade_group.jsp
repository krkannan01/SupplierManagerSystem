<%--
  @author xietao.x@qq.com
  Created by 2018/3/20
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>供应商分组管理 - 供应商管理系统</title>

    <meta name="description" content="overview &amp; stats" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

    <link rel="shortcut icon" href="${pageContent.request.contentPath}/statics/favicon.ico" type="image/x-icon" />
    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="${pageContent.request.contentPath}/statics/assets/css/bootstrap.css" />
    <link rel="stylesheet" href="${pageContent.request.contentPath}/statics/components/font-awesome/css/font-awesome.min.css" />

    <!-- page specific plugin styles -->
    <link rel="stylesheet" href="${pageContent.request.contentPath}/statics/components/_mod/jquery-ui/jquery-ui.min.css" />
    <link rel="stylesheet" href="${pageContent.request.contentPath}/statics/css/bootstrap-dialog.css" />

    <!-- text fonts -->
    <link rel="stylesheet" href="${pageContent.request.contentPath}/statics/assets/css/ace-fonts.css" />

    <!-- ace styles -->
    <link rel="stylesheet" href="${pageContent.request.contentPath}/statics/assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />

    <!--[if lte IE 9]>
    <link rel="stylesheet" href="${pageContent.request.contentPath}/statics/assets/css/ace-part2.css" class="ace-main-stylesheet" />
    <![endif]-->
    <link rel="stylesheet" href="${pageContent.request.contentPath}/statics/assets/css/ace-skins.css" />
    <link rel="stylesheet" href="${pageContent.request.contentPath}/statics/assets/css/ace-rtl.css" />

    <!--[if lte IE 9]>
    <link rel="stylesheet" href="${pageContent.request.contentPath}/statics/assets/css/ace-ie.css" />
    <![endif]-->

    <!-- ace settings handler -->
    <script src="${pageContent.request.contentPath}/statics/assets/js/ace-extra.js"></script>

    <!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

    <!--[if lte IE 8]>
    <script src="${pageContent.request.contentPath}/statics/components/html5shiv/dist/html5shiv.min.js"></script>
    <script src="${pageContent.request.contentPath}/statics/components/respond/dest/respond.min.js"></script>
    <![endif]-->
</head>

<jsp:include page="${pageContext.request.contextPath}/common/head.jsp"/>


<!-- /section:basics/navbar.layout -->
<div class="main-container ace-save-state" id="main-container">
    <script type="text/javascript">
        try{ace.settings.loadState('main-container')}catch(e){}
    </script>

    <% request.setAttribute("active","Supplier-Group"); %>
    <jsp:include page="${pageContext.request.contextPath}/common/menu.jsp"/>

    <!-- /section:basics/sidebar -->
    <div class="main-content">
        <div class="main-content-inner">

            <!-- /section:basics/content.breadcrumbs -->
            <div class="page-content">

                <!-- /section:settings.box -->
                <div class="page-header">
                    <h1>
                        供应商分组管理
                        <small>
                            <i class="ace-icon fa fa-angle-double-right"></i>
                            供应商分组查询
                        </small>
                    </h1>
                </div><!-- /.page-header -->

                <div class="row">
                    <div class="col-xs-12">
                        <!--<h3 class="header smaller lighter blue"></h3>-->

                        <!--<div class="clearfix">
                            <div class="pull-right tableTools-container"></div>
                        </div>-->
                        <div class="table-header">
                            分组信息
                        </div>

                        <!-- PAGE CONTENT ENDS -->
                        <!-- div.dataTables_borderWrap -->
                        <div>
                            <table id="trade-group-table" class="table table-striped table-bordered table-hover" style="margin-bottom:0">
                                <thead>
                                <tr>
                                    <th class="center">操作</th>
                                    <th class="center">分组名称</th>
                                    <th class="center">该分组供应商总数</th>
                                </tr>
                                </thead>

                                <tbody>

                                </tbody>
                            </table>
                            <div class="" style="background-color: #EFF3F8; padding: 5px;">
                                <div class="row">
                                    <!--left-->
                                    <div class="col-sm-2 col-xs-12">
                                        <div class="col-sm-6">
                                            <shiro:hasAnyPermission name="admin,insertTradeGroup">
                                                <button class="btn btn-success btn-sm btn-white btn-round" id="addBtn" style="height: 34px;">
                                                    <i class="ace-icon fa fa-plus"></i> 添加
                                                </button>
                                            </shiro:hasAnyPermission>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>
            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->

    <jsp:include page="${pageContext.request.contextPath}/common/foot.jsp"/>

</div>

<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
    <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
</a>

</div><!-- /.main-container -->

<!-- basic scripts -->

<!--[if !IE]> -->
<script src="${pageContent.request.contentPath}/statics/components/jquery/dist/jquery.min.js"></script>

<!-- <![endif]-->

<!--[if IE]>
<script src="${pageContent.request.contentPath}/statics/components/jquery.1x/dist/jquery.js"></script>
<![endif]-->
<script type="text/javascript">
    if('ontouchstart' in document.documentElement) document.write("<script src='${pageContent.request.contentPath}/statics/components/_mod/jquery.mobile.custom/jquery.mobile.custom.js'>"+"<"+"/script>");
</script>
<script src="${pageContent.request.contentPath}/statics/components/bootstrap/dist/js/bootstrap.min.js"></script>

<!-- page specific plugin scripts -->
<script src="${pageContent.request.contentPath}/statics/components/bootbox.js/bootbox.js"></script>
<script src="${pageContent.request.contentPath}/statics/js/bootstrap-dialog.js"></script>

<script src="${pageContext.request.contextPath}/statics/js/common.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/layer/layer.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/ry-common.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/ry-ui.js"></script>

<!-- ace scripts -->
<jsp:include page="${pageContent.request.contentPath}/common/ace-script.jsp"/>
<jsp:include page="${pageContext.request.contextPath}/common/time.jsp"/>

<!-- inline scripts related to this page -->
<script type="text/javascript">

    jQuery(function($) {

        /*加载数据*/
        refursh();

        /*绑定编辑按钮的事件*/
        $("#trade-group-table > tbody").delegate(".editBtn", "click", function() {
            this.style.display = "none";
            var id = this.getAttribute("data-id");
            var $td = $(this).closest("tr").find("td").eq(1);
            $td.css({"width": "240px", "margin": "8 auto"});
            $td.html("<input type='text' value='"+ $td.html() +"' />");
            $td.delegate("input", "blur", function() {
                /*如果只为空，不进行操作，直接刷新，显示原来数据*/
                if ($(this).val()) {
                    /*发送请求*/
                    $.post("${pageContext.request.contextPath}/tradeGroup/update", {"id": id, "name": $(this).val()}, function() {
                        $(".editBtn").get(0).style.display = "";
                        refursh();
                    }, "text");
                }
            });
        });

        /*绑定删除按钮的事件*/
        $("#trade-group-table > tbody").delegate(".deleteBtn", "click", function() {
            var id = this.getAttribute("data-id");
            var count = $(this).closest("tr").find("td").eq(2).html();
            /*如果该分组没有成员*/
            if (count < 1) {
                deleteRow(id);
            } else {
                $.modalConfirm("你确定删除吗？这将删除分组下的"+ count +"条供应商信息！", function() {
                    deleteRow(id);
                });
            }

        });

        /*绑定新增按钮的事件*/
        $("#addBtn").click(function() {
            /*BootstrapDialog.confirm({
                title: "添加分组",
                message: "<form class='form-horizontal'>" +
                "<div class='row form-group has-warning'>" +
                "<label for='tradeGroupName' class='col-xs-12 col-sm-3 control-label'>分组名称：</label>" +
                "<div class='col-xs-12 col-sm-6'>" +
                "<span class='block input-icon input-icon-right'>" +
                "<input type='text' id='tradeGroupName' class='width-100' />" +
                "<i class='ace-icon fa fa-info-circle' title='必填项'></i>" +
                "</span>" +
                "</div>" +
                "<div class='col-xs-12 col-sm-reset inline'></div>" +
                "</div>" +
                "</form>",
                type: BootstrapDialog.TYPE_INFO, // <-- Default value is BootstrapDialog.TYPE_PRIMARY
                closable: false, // <-- Default value is false
                draggable: false, // <-- Default value is false
                btnCancelLabel: '取消', // <-- Default value is 'Cancel',
                btnCancelClass: "btn btn-white btn-primary",
                btnOKLabel: "确定", // <-- Default value is 'OK',
                btnOKClass: "btn btn-white btn-success", // <-- If you didn't specify it, dialog type will be used,
                callback: function(result) {
                    // result will be true if button was click, while it will be false if users close the dialog directly.
                    if(result) {
                        /!*如果提交*!/
                        var $tradeGroupName = $("#tradeGroupName");
                        if ($tradeGroupName.val()) {
                            $.post("${pageContext.request.contextPath}/tradeGroup/insert", {"name": $tradeGroupName.val()}, function(data) {
                                if (data == "success") {
                                    BootstrapDialog.show({
                                        title: '信息',
                                        message: '添加成功'
                                    });
                                } else {
                                    BootstrapDialog.show({
                                        title: '信息',
                                        message: '添加失败'
                                    });
                                }
                                refursh();
                            }, "text");
                        } else {
                            $tradeGroupName.closest(".form-group").removeClass("has-warning").addClass("has-error");
                            $tradeGroupName.next().removeClass("fa-info-circle").addClass("fa-times").get(0).setAttribute("title", "不能为空");
                            $tradeGroupName.parent().parent().next().html("<label class='control-label'>不能为空</label>");
                            return false;
                        }
                    }
                }
            });*/
            layer.open({
                title: "添加分组",
                type: 1,
                content: "<form class='form-horizontal'>" +
                    "<div class='row form-group has-warning' style='width: 96%; margin: 20px;'>" +
                    "<label for='tradeGroupName' class='col-xs-12 col-sm-3 control-label'>分组名称：</label>" +
                    "<div class='col-xs-12 col-sm-8'>" +
                    "<span class='block input-icon input-icon-right'>" +
                    "<input type='text' id='tradeGroupName' class='width-100' />" +
                    "<i class='ace-icon fa fa-info-circle' title='必填项'></i>" +
                    "</span>" +
                    "</div>" +
                    "<div class='col-xs-12 col-sm-reset inline'></div>" +
                    "</div>" +
                    "</form>",
                btn: ["提交", "取消"],
                yes: function (index) {
                    /!*如果提交*!/
                    var $tradeGroupName = $("#tradeGroupName");
                    if ($tradeGroupName.val()) {
                        $.post("${pageContext.request.contextPath}/tradeGroup/insert", {"name": $tradeGroupName.val()}, function(data) {
                            if (data == "success") {
                                $.modalMsg("添加成功", "success");
                            } else {
                                $.modalMsg("添加失败", "error");
                            }
                            refursh();
                            layer.close(index);
                        }, "text");
                    } else {
                        convert_error($tradeGroupName, "不能为空");
                        $.modalMsg("分组名称不能为空", "warning");
                    }
                },
                area: ['540px', '180px']
            });
        });

        /*根据实体信息转换成行的方法*/
        function converterRow(row_data) {
            var rowHtml = "<tr>" +
                    "<td class='center'>" +
                    "<div class='action-buttons'>" +

                    <shiro:hasAnyPermission name="admin,updateTradeGroup">
                    "<a class='green editBtn' href='#javascript:void(0);' title='编辑' data-id='"+ row_data.id +"'>" +
                    "<i class='ace-icon fa fa-pencil bigger-130'></i>" +
                    "</a>" +
                    </shiro:hasAnyPermission>

                    <shiro:hasAnyPermission name="admin,deleteTradeGroup">
                    "<a class='red deleteBtn' style='margin-left: 24px;' href='javascript:void(0);' title='删除' data-id='"+ row_data.id +"'>" +
                    "<i class='ace-icon fa fa-trash-o bigger-130'></i>" +
                    "</a>" +
                    </shiro:hasAnyPermission>

                    "</div>" +
                    "</td>" +

                    "<td class='center'>"+ row_data.name +"</td>" +
                    "<td class='center'>"+ row_data.count +"</td>" +
                    "</tr>";
            return rowHtml;
        }

        /*重新加载数据的方法*/
        function refursh() {
            /*获取数据*/
            $.post("${pageContext.request.contextPath}/enterprise/getTradeGroup", function(data) {
                var bodyHtml = "<tr><td colspan='3'><div class='alert alert-warning' style='padding: 5px;margin-bottom: 0;text-align: center;'>没有信息</div></td></tr>";
                if (data) {
                    if (data.rows.length > 0) {
                        bodyHtml = "";
                        $.each(data.rows, function(index, item) {
                            bodyHtml += converterRow(item);
                        });
                    }
                }
                $("#trade-group-table > tbody").html(bodyHtml);
            }, "json");
        }

        /*删除数据的方法*/
        function deleteRow(id) {
            var config = {
                url: "${pageContext.request.contextPath}/tradeGroup/delete",
                type: "post",
                dataType: "text",
                data: {"id": id},
                success: function(result) {
                    result = result == "success" ? {code: "success", msg: "删除成功"} : {code: "error", msg: "删除失败"};
                    $.modalMsg(result.msg, result.code);
                    refursh();
                }
            };
            $.ajax(config);
        }
    });
</script>

<!-- the following scripts are used in demo only for onpage help and you don't need them -->
<link rel="stylesheet" href="${pageContent.request.contentPath}/statics/assets/css/ace.onpage-help.css" />
<link rel="stylesheet" href="${pageContent.request.contentPath}/statics/docs/assets/js/themes/sunburst.css" />

<script type="text/javascript"> ace.vars['base'] = '..'; </script>
<script src="${pageContent.request.contentPath}/statics/assets/js/src/elements.onpage-help.js"></script>
<script src="${pageContent.request.contentPath}/statics/assets/js/src/ace.onpage-help.js"></script>
<script src="${pageContent.request.contentPath}/statics/docs/assets/js/rainbow.js"></script>
<script src="${pageContent.request.contentPath}/statics/docs/assets/js/language/generic.js"></script>
<script src="${pageContent.request.contentPath}/statics/docs/assets/js/language/html.js"></script>
<script src="${pageContent.request.contentPath}/statics/docs/assets/js/language/css.js"></script>
<script src="${pageContent.request.contentPath}/statics/docs/assets/js/language/javascript.js"></script>
</body>
</html>


