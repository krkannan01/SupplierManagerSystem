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

    <% request.setAttribute("active","DocumentType-Search"); %>
    <jsp:include page="${pageContext.request.contextPath}/common/menu.jsp"/>

    <!-- /section:basics/sidebar -->
    <div class="main-content">
        <div class="main-content-inner">

            <!-- /section:basics/content.breadcrumbs -->
            <div class="page-content">

                <!-- /section:settings.box -->
                <div class="page-header">
                    <h1>
                        文档分类管理
                        <small>
                            <i class="ace-icon fa fa-angle-double-right"></i>
                            文档分类查询
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
                            分类信息
                        </div>

                        <!-- PAGE CONTENT ENDS -->
                        <!-- div.dataTables_borderWrap -->
                        <div>
                            <table id="document-type-table" class="table table-striped table-bordered table-hover" style="margin-bottom:0">
                                <thead>
                                <tr>
                                    <th style="width: 5%;" class="center">编号</th>
                                    <th style="width: 5%;" class="center"> <label class="pos-rel"> <input type="checkbox" class="ace" /> <span class="lbl"></span> </label> </th>
                                    <th class="center">分类名称</th>
                                    <th class="center">分类描述</th>
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
                                            <shiro:hasAnyPermission name="admin,document_type:delete">
                                                <button class='btn btn-danger btn-sm btn-white btn-round' id='allDelete' style='height: 34px;'><i class='ace-icon fa fa-trash-o'></i> 删除选中项 </button>
                                            </shiro:hasAnyPermission>
                                            <shiro:hasAnyPermission name="admin,document_type:insert">
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

        initTableCheckbox("#document-type-table");

        /*加载数据*/
        refursh();

        /*绑定编辑按钮的事件*/
        $("#document-type-table > tbody").delegate(".editBtn", "click", function() {
            var id = this.dataset.id;
            var name = $(this).closest("tr").children("td.name").html();
            var description = $(this).closest("tr").children("td.desc").html();
            layer.open({
                title: "修改分类",
                type: 1,
                content: "<form class='form-horizontal'>" +
                "<div class='row form-group has-success' style='width: 96%; margin: 20px;'>" +
                "<label for='document-type-name-u' class='col-xs-12 col-sm-3 control-label'>分类名：</label>" +
                "<div class='col-sm-7'>" +
                "<span class='block'>" +
                "<input type='text' id='document-type-name-u' value='" + name + "' placeholder='"+ name +"' class='width-100' />" +
                "</span>" +
                "</div>" +
                "<div class='help-block col-sm-reset inline'></div>" +
                "</div>" +

                "<div class='row form-group has-success' style='width: 96%; margin: 20px;'>" +
                "<label for='document-type-desc-u' class='col-xs-12 col-sm-3 control-label'>分类描述：</label>" +
                "<div class='col-sm-7'>" +
                "<span class='block'>" +
                "<input type='text' id='document-type-desc-u' value='" + description + "' placeholder='"+ description +"' class='width-100' />" +
                "</span>" +
                "</div>" +
                "<div class='help-block col-sm-reset inline'></div>" +
                "</div>" +
                "</form>",
                btn: ["提交", "取消"],
                yes: function (index) {
                    /*如果提交*/
                    var new_name = $("#document-type-name-u").val().trim();
                    var new_description = $("#document-type-desc-u").val().trim();
                    if (new_name == name && new_description == description) {
                        $.modalMsg("没有做任何修改");
                        layer.close(index);
                        return;
                    }
                    var document_type_data = {};
                    document_type_data["id"] = id;
                    if (new_name && new_name != name) document_type_data["name"] = new_name;
                    if (new_description && new_description != description) document_type_data["description"] = new_description;
                    $.post($ctx + "/documentType/updateDocumentType", document_type_data, function(data) {
                        if (data && data.code == 0) {
                            $.modalMsg("修改成功", "success");
                            layer.close(index);
                            refursh();
                        } else {
                            $.modalMsg("修改失败", "error");
                        }
                    }, "json");
                },
                area: ['540px', '270px']
            });
        });

        /*绑定删除按钮的事件*/
        $("#document-type-table > tbody").delegate(".deleteBtn", "click", function() {
            var id = this.dataset.id;
            $.modalConfirm("你确定删除吗？这将删除分组下的文档信息！", function(isOk) {
                if (isOk) {
                    deleteRow(id);
                }
            });
        });

        /*绑定新增按钮的事件*/
        $("#addBtn").click(function() {
            layer.open({
                title: "添加分组",
                type: 1,
                content: "<form class='form-horizontal'>" +
                    "<div class='row form-group has-warning' style='width: 96%; margin: 20px;'>" +
                    "<label for='document-type-name-i' class='col-xs-12 col-sm-3 control-label'>分类名：</label>" +
                    "<div class='col-xs-12 col-sm-8'>" +
                    "<span class='block input-icon input-icon-right'>" +
                    "<input type='text' id='document-type-name-i' class='width-100' />" +
                    "<i class='ace-icon fa fa-info-circle' title='必填项'></i>" +
                    "</span>" +
                    "</div>" +
                    "<div class='col-xs-12 col-sm-reset inline'></div>" +
                    "</div>" +

                    "<div class='row form-group has-success' style='width: 96%; margin: 20px;'>" +
                    "<label for='document-type-desc-i' class='col-xs-12 col-sm-3 control-label'>分类描述：</label>" +
                    "<div class='col-xs-12 col-sm-8'>" +
                    "<input type='text' id='document-type-desc-i' class='width-100' />" +
                    "</div>" +
                    "<div class='col-xs-12 col-sm-reset inline'></div>" +
                    "</div>" +
                    "</form>",
                btn: ["提交", "取消"],
                yes: function (index) {
                    var $name = $("#document-type-name-i");
                    var $desc = $("#document-type-desc-i");
                    if (!$name.val()) {
                        $.modalMsg("分类名不能为空", "warning");
                        return;
                    }
                    var document_type_data = {};
                    document_type_data["name"] = $name.val().trim();
                    document_type_data["description"] = $desc.val().trim();
                    $.post($ctx + "/documentType/insertDocumentType", document_type_data, function(data) {
                        if (data && data.code == 0) {
                            $.modalMsg("添加成功", "success");
                            refursh();
                            layer.close(index);
                        } else {
                            $.modalMsg("添加失败", "error");
                        }
                    }, "json");
                },
                area: ['540px', '270px']
            });
        });

        /*删除选中行*/
        $("#allDelete").click(function() {
            if ($("#document-type-table > tbody input[type=checkbox]:checked").length < 1) {
                $.modalMsg("您还没有选中要删除的数据呢", "warning");
                return;
            }

            // 获取选中的id
            var ids = "";
            $("#document-type-table > tbody input[type=checkbox]:checked").each(function(index, element) {
                ids += element.dataset.id + ",";
            });

            $.modalConfirm("你将删除选中的供应商的相关信息，确定吗？", function(isOk) {
                if (isOk) {
                    deleteRow(ids);
                    // 设置ajax配置
                    // var config = {
                    //     url: $ctx + "/documentType/deleteDocumentType",
                    //     type: "post",
                    //     dataType: "json",
                    //     data: {"ids": ids},
                    //     success: function(result) {
                    //         if (result && result.code == 0) {
                    //             $.modalMsg("删除成功", "success");
                    //             refursh();
                    //         } else {
                    //             $.modalMsg("删除失败", "error");
                    //         }
                    //     }
                    // };
                    // // 发送ajax请求
                    // $.ajax(config);
                }
            });
        });

        /*根据实体信息转换成行的方法*/
        function converterRow(index, rowData) {
            var rowHtml = "<tr>" +
                    "<td class='center'>" + ++index + "</td>" +
                    "<td class='center trbox'> <label class='pos-rel'> <input type='checkbox' data-id='" + rowData.id + "' class='ace' /> <span class='lbl'></span> </label> </td>" +
                    "<td class='center name'>"+ rowData.name +"</td>" +
                    "<td class='center desc'>"+ rowData.description +"</td>" +
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
            $.get($ctx + "/documentType/getDocumentTypeList", function(data) {
                var bodyHtml = "<tr><td colspan='100'><div class='alert alert-warning' style='padding: 5px;margin-bottom: 0;text-align: center;'>没有信息</div></td></tr>";
                if (data && data.rows) {
                    var rows = data.rows;
                    if (rows.length > 0) {
                        bodyHtml = "";
                        $.each(rows, function(index, item) {
                            bodyHtml += converterRow(index, item);
                        });
                    }
                }
                $("#document-type-table > tbody").html(bodyHtml);
            }, "json");
        }

        /*删除数据的方法*/
        function deleteRow(id) {
            var config = {
                url: $ctx + "/documentType/deleteDocumentType",
                type: "post",
                dataType: "json",
                data: {"ids": id},
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


