<%@ page import="cn.xt.sms.constant.PrivilegeConstants" %><%--
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

    <style type="text/css">
        .page-header h1{ font-size: 18px; }
    </style>

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
                                    <th style="width: 5%;" class="center">编号</th>
                                    <th style="width: 5%;" class="center"> <label class="pos-rel"> <input type="checkbox" class="ace" /> <span class="lbl"></span> </label> </th>
                                    <th class="center">分组名称</th>
                                    <th class="center">该分组供应商总数</th>
                                    <th class="center">操作</th>
                                </tr>
                                </thead>

                                <tbody>

                                </tbody>
                            </table>
                            <div class="" style="background-color: #EFF3F8; padding: 5px;">
                                <div class="row">
                                    <!--left-->
                                    <div class="col-sm-12">
                                        <div class="col-sm-6">
                                            <shiro:hasAnyPermission name="admin,supplier_group:delete">
                                                <button class='btn btn-danger btn-sm btn-white btn-round' id='allDelete' style='height: 34px;'><i class='ace-icon fa fa-trash-o'></i> 删除选中项 </button>
                                            </shiro:hasAnyPermission>
                                            <shiro:hasAnyPermission name="admin,supplier_group:insert">
                                                <button class="btn btn-success btn-sm btn-white btn-round" id="addBtn" style="height: 34px;"><i class="ace-icon fa fa-plus"></i> 添加 </button>
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

    const $ctx = "${pageContext.request.contextPath}";

    jQuery(function($) {

        initTableCheckbox("#trade-group-table");

        /*加载数据*/
        refursh();

        /*绑定编辑按钮的事件*/
        $("#trade-group-table > tbody").delegate(".editBtn", "click", function() {
            var id = this.getAttribute("data-id");
            var name = $(this).closest("tr").find("td").eq(2).html();
            layer.open({
                title: "修改分组",
                type: 1,
                content: "<form class='form-horizontal'>" +
                "<div class='row form-group has-success' style='width: 96%; margin: 20px;'>" +
                "<label for='tradeGroupName-u' class='col-xs-12 col-sm-3 control-label'>分组名称：</label>" +
                "<div class='col-sm-7'>" +
                "<span class='block'>" +
                "<input type='text' id='tradeGroupName-u' value='" + name + "' placeholder='"+ name +"' class='width-100' />" +
                "</span>" +
                "</div>" +
                "<div class='help-block col-sm-reset inline'></div>" +
                "</div>" +
                "</form>",
                btn: ["提交", "取消"],
                yes: function (index) {
                    /*如果提交*/
                    var new_name = $("#tradeGroupName-u").val();
                    if ((!new_name) || new_name == name) {
                        $.modalMsg("没有做任何修改");
                        layer.close(index);
                        return;
                    }
                    var trade_group_data = {};
                    trade_group_data["id"] = id;
                    trade_group_data["name"] = new_name;
                    $.post($ctx + "/tradeGroup/update", trade_group_data, function(data) {
                        if (data && data.code == 0) {
                            $.modalMsg("修改成功", "success");
                            layer.close(index);
                            refursh();
                        } else {
                            $.modalMsg("修改失败", "error");
                        }
                    }, "json");
                },
                area: ['540px', '180px']
            });
        });

        /*绑定删除按钮的事件*/
        $("#trade-group-table > tbody").delegate(".deleteBtn", "click", function() {
            var id = this.dataset.id;
            var count = $(this).closest("tr").find(".count").html();
            /*如果该分组没有成员*/
            if (count < 1) {
                deleteRow(id);
            } else {
                $.modalConfirm("你确定删除吗？这将删除分组下的"+ count +"条供应商信息！", function(isOk) {
                    if (isOk) {
                        deleteRow(id);
                    }
                });
            }

        });

        /*绑定新增按钮的事件*/
        $("#addBtn").click(function() {
            layer.open({
                title: "添加分组",
                type: 1,
                content: "<form class='form-horizontal'>" +
                    "<div class='row form-group has-warning' style='width: 96%; margin: 20px;'>" +
                    "<label for='tradeGroupName-i' class='col-xs-12 col-sm-3 control-label'>分组名称：</label>" +
                    "<div class='col-xs-12 col-sm-8'>" +
                    "<span class='block input-icon input-icon-right'>" +
                    "<input type='text' id='tradeGroupName-i' class='width-100' />" +
                    "<i class='ace-icon fa fa-info-circle' title='必填项'></i>" +
                    "</span>" +
                    "</div>" +
                    "<div class='col-xs-12 col-sm-reset inline'></div>" +
                    "</div>" +
                    "</form>",
                btn: ["提交", "取消"],
                yes: function (index) {
                    var $tradeGroupName = $("#tradeGroupName-i");
                    if ($tradeGroupName.val()) {
                        $.post($ctx + "/tradeGroup/insert", {"name": $tradeGroupName.val()}, function(data) {
                            if (data && data.code == 0) {
                                $.modalMsg("添加成功", "success");
                                refursh();
                                layer.close(index);
                            } else {
                                $.modalMsg("添加失败", "error");
                            }
                        }, "json");
                    } else {
                        convert_error($tradeGroupName, "不能为空");
                        $.modalMsg("分组名称不能为空", "warning");
                    }
                },
                area: ['540px', '180px']
            });
        });

        /*删除选中行*/
        $("#allDelete").click(function() {
            if ($("#trade-group-table > tbody input[type=checkbox]:checked").length < 1) {
                $.modalMsg("您还没有选中要删除的数据呢", "warning");
                return;
            }

            // 获取选中的id
            var ids = "", rows = 0, count = 0;
            $("#trade-group-table > tbody input[type=checkbox]:checked").each(function(index, element) {
                rows ++;
                count += Number($(element).closest("tr").children(".count:first").html()) || 0;
                ids += element.dataset.id + ",";
            });

            $.modalConfirm("你将删除选中的" + rows + "个分组下的数据，以及分组下的" + count + "个供应商的相关信息，确定吗？", function(isOk) {
                if (isOk) {
                    // 设置ajax配置
                    var config = {
                        url: $ctx + "/tradeGroup/multiDelete",
                        type: "post",
                        dataType: "json",
                        data: {"ids": ids},
                        success: function(result) {
                            if (result && result.code == 0) {
                                $.modalMsg("删除成功", "success");
                                refursh();
                            } else {
                                $.modalMsg("删除失败", "error");
                            }
                        }
                    };
                    // 发送ajax请求
                    $.ajax(config);
                }
            });
        });

        /*根据实体信息转换成行的方法*/
        function converterRow(index, rowData) {
            var rowHtml = "<tr>" +
                    "<td class='center'>" + ++index + "</td>" +
                    "<td class='center trbox'> <label class='pos-rel'> <input type='checkbox' data-id='" + rowData.id + "' class='ace' /> <span class='lbl'></span> </label> </td>" +
                    "<td class='center'>"+ rowData.name +"</td>" +
                    "<td class='center count'>"+ rowData.count +"</td>" +
                    "<td class='center'>" +
                        "<div class='action-buttons'>" +
                        <shiro:hasAnyPermission name="admin,supplier_group:update">
                        "<a class='green editBtn' href='#javascript:void(0);' title='编辑' data-id='"+ rowData.id +"'>" + "<i class='ace-icon fa fa-pencil bigger-130'></i>" + "</a>" +
                        </shiro:hasAnyPermission>
                        <shiro:hasAnyPermission name="admin,supplier_group:delete">
                        "<a class='red deleteBtn' style='margin-left: 24px;' href='javascript:void(0);' title='删除' data-id='"+ rowData.id +"'>" + "<i class='ace-icon fa fa-trash-o bigger-130'></i>" + "</a>" +
                        </shiro:hasAnyPermission>
                        "</div>" +
                    "</td>" +
                    "</tr>";
            return rowHtml;
        }

        /*重新加载数据的方法*/
        function refursh() {
            /*获取数据*/
            $.get($ctx + "/supplier/getTradeGroup", function(data) {
                var bodyHtml = "<tr><td colspan='100'><div class='alert alert-warning' style='padding: 5px;margin-bottom: 0;text-align: center;'>没有信息</div></td></tr>";
                if (data) {
                    if (data.length > 0) {
                        bodyHtml = "";
                        $.each(data, function(index, item) {
                            bodyHtml += converterRow(index, item);
                        });
                    }
                }
                $("#trade-group-table > tbody").html(bodyHtml);
            }, "json");
        }

        /*删除数据的方法*/
        function deleteRow(id) {
            var config = {
                url: $ctx + "/tradeGroup/delete",
                type: "post",
                dataType: "json",
                data: {"id": id},
                success: function(result) {
                    if (result && result.code == 0) {
                        $.modalMsg("删除成功", "success");
                        refursh();
                    } else {
                        $.modalMsg("删除失败", "error");
                    }
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


