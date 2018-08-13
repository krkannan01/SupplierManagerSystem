const document_download_path = $ctx + "/document/download?id=";
const get_document_type_path = $ctx + "/documentType/getDocumentTypeList";

jQuery(function($) {

    /*全局常用参数与对象*/
    var name = $("#name-input");
    var supplier = $("#supplier-input");
    var type = $("#type-input");
    var currentPage = $("#currentPage");
    var pageSize = $("#pageSize");

    var defaultParams = {};
    initParam();

    /*参数初始化方法*/
    function initParam() {

        defaultParams.currentPage = 1; //当前页参数
        defaultParams.pageSize = 10; //每页条数参数
        defaultParams.name = null; //文档名参数
        defaultParams.supplierName = null; //文档所属供应商参数
        defaultParams.typeId = 0; //文档类型参数

        currentPage.val(defaultParams.currentPage);
        pageSize.val(defaultParams.pageSize);
        name.val(defaultParams.name);
        supplier.val(defaultParams.supplierName);
        type.val(defaultParams.typeId);

    }

    var table = new Table({
        params: defaultParams,
        table: $("#document-table"),
        dataUrl: $ctx + "/document/getDocumentList",
        render: render_file,
        buttons: "<div class='col-sm-3 col-xs-12'>" +
        (
            "<button class='btn btn-danger btn-sm btn-white btn-round' id='allDelete' style='height: 34px;'>" +
            "    <i class='ace-icon fa fa-trash-o'></i> 删除选中项" +
            "</button>"
        ).display(has_document_delete) +
        "<button class='btn btn-warning btn-sm btn-white btn-round' id='refursh' style='height: 34px;'>" +
        "    <i class='ace-icon fa fa-refresh'></i> 刷新" +
        "</button>" +
        (
            "<button class='btn btn-success btn-sm btn-white btn-round' id='insert' style='height: 34px;'>" +
            "    <i class='ace-icon fa fa-plus'></i> 新增" +
            "</button>"
        ).display(has_document_insert) +
        "</div>"
    });

    //初始化表格的复选框逻辑功能
    initTableCheckbox("#document-table");

    //初始化文档类型下拉选择框数据
    $.get(get_document_type_path, null, function(data) {
        var selectBoxHtml = "<option value='0'>-- 全部 --</option>";
        if (data.rows != null && data.rows.length > 0) {
            data.rows.forEach(function(item, index) {
                selectBoxHtml += "<option value='" + item.id + "'>" + item.name + "</option>";
            });
        }
        type.html(selectBoxHtml);
    }, "json");

    /*绑定按名称排序功能*/
    $("[class=sort-name]").click(function() {
        // 未激活排序状态 -> 降序排序状态 MySQL默认升序排列
        if (!$(this).hasClass("active")) {
            $(this).attr("class", "sort-name active active-down");
            defaultParams.sortField = "name";
            defaultParams.sortMode = "desc";
        }
        else {
            // 降序 -> 升序
            if ($(this).hasClass("active-down")) {
                $(this).attr("class", "sort-name active active-up");
                defaultParams.sortMode = null;
            }
            // 升序 -> 取消激活
            else {
                $(this).removeClass("active-up").addClass("active-down");
                $(this).attr("class", "sort-name");
                // 恢复默认
                defaultParams.sortField = null;
            }
        }
        table.load();
    });


    /*刷新*/
    $("#refursh").click(function () {
        initParam();
        table.load();
    });

    /*删除选中行*/
    $("#allDelete").click(function () {
        if ($("#document-table > tbody > tr > td input[type=checkbox]:checked").length < 1) {
            $.modalMsg("请选中要删除的数据!", "warning");
            return;
        }
        var ids = "";
        var idLength = 0;
        $("#document-table > tbody > tr > td input[type='checkbox']").each(function (index, element) {
            if (element.checked) {
                ids += element.getAttribute("data-id") + ",";
                idLength++;
            }
        });
        $.modalConfirm("你确定要删除选中的" + idLength + "行数据吗?", function (isOk) {
            if (isOk) {
                $.post($ctx + "/document/deleteDocument", {ids: ids}, function (data) {
                    var data = JSON.parse(data);
                    if (data && data.code == 0) {
                        $.modalMsg("删除成功", "success");
                        table.load();
                    } else {
                        $.modalMsg("删除失败", "error");
                    }
                }, "text");
            }
        });
    });

    /*页面初始化时加载数据*/
    /*检索初始参数*/
    var currentPageParam = $currentPage;
    var pageSizeParam = $pageSize;
    if (currentPageParam != "null" && currentPageParam != "") {
        defaultParams.currentPage = currentPageParam;
        currentPage.val(currentPageParam);
    }
    if (pageSizeParam != "null" && pageSizeParam != "") {
        defaultParams.pageSize = pageSizeParam;
        pageSize.val(pageSizeParam);
    }
    table.load();

    function render_file(data) {

        var content = "";
        console.log(data);

        // 1. 检查页码
        table.pagination.maxCount.html(data.count);
        table.pagination.checkPageState();

        if (data.rows != null && data.rows.length > 0) {

            // 2. 计算编号 （当前页数 - 1） * 每页数量 + 1 == 当前第一条记录的编号
            var startNo = (Number($("#currentPage").val()) - 1) * Number($("#pageSize").val()) + 1;
            startNo == NaN ? 1 : startNo;

            /*拼接字符串*/
            $.each(data.rows, function (index, item) {

                // 设置搜索时匹配部分高亮显示 针对 name supplier
                if (defaultParams.name && item.name) {
                    var rule = RegExp(defaultParams.name + "+", "g");
                    item.name = item.name.replace(rule, "<span style='color: red;'>" + defaultParams.name + "</span>");
                }
                if (defaultParams.supplierName && item.supplierName) {
                    var rule = RegExp(defaultParams.supplierName + "+", "g");
                    item.supplierName = item.supplierName.replace(rule, "<span style='color: red;'>" + defaultParams.supplierName + "</span>");
                }

                if (item.appendixName) {
                    var suffixIndex = item.appendixName.lastIndexOf(".");
                    var suffix = item.appendixName.substring(suffixIndex+1).toUpperCase();
                    var preview_content = "";
                    if(suffix=="BMP"||suffix=="JPG"||suffix=="JPEG"||suffix=="PNG"||suffix=="GIF"||suffix=="ICO"){
                        preview_content = "<img src='"+ document_download_path + item.id +"' width='250px'>";
                    } else {
                        preview_content = "<span style='color: #EE8944;'>抱歉，非图片文件暂不支持预览</span>";
                    }
                    // 为附件栏同时添加图片预览效果和附件下载链接
                    item.appendixName = "<a href=\"" + document_download_path + item.id + "\" class=\"table-a\" data-trigger=\"hover\" data-placement=\"auto top\" " +
                        "data-toggle=\"popover\" data-content=\"" + preview_content + "\">" + item.appendixName + "</a>";
                } else {
                    item.appendixName = "<span style='color: #EE8944;'>无</span>";
                }

                content += "<tr>" +
                    "<td>" + startNo++ + "</td>" +
                    "<td class='center trbox'> <label class='pos-rel'> <input type='checkbox' class='ace' data-id='" + item.id + "' /> <span class='lbl'></span> </label> </td>" +
                    "<td>" + item.name + "</td>" +
                    "<td>" + item.type.name + "</td>" +
                    "<td>" + item.supplierName + "</td>" +
                    "<td>" + item.description + "</td>" +
                    "<td class='appendixName'>" + item.appendixName + "</td>" +
                    "<td>" +
                    ("<button class='btn btn-xs btn-round btn-danger deleteFile' data-id='" + item.id + "'> <i class='ace-icon fa fa-trash-o bigger-120'></i>删除 </button>").display(has_document_delete) +
                    "</td>" +
                    "</tr>";
            });
        } else {
            content += "<tr><td colspan='100'><div class='alert alert-warning' style='padding: 5px;margin-bottom: 0;text-align: center;'>没有信息</div></td></tr>";
        }
        $("#document-table > tbody").html(content);

        $(".appendixName > a").popover({html:true});

    }

    /*删除信息操作*/
    //单行删除
    $("#document-table").delegate(".deleteFile", "click", function () {
        var this_ = this;
        $.modalConfirm("你确定要删除这条数据吗?", function (isOk) {
            if (isOk) {
                var id = this_.getAttribute("data-id");
                $.post($ctx + "/document/deleteDocument", {ids: id}, function (data) {
                    // var data = JSON.parse(data);
                    if (data && data.code == 0) {
                        $.modalMsg("删除成功", "success");
                        table.load();
                    } else {
                        $.modalMsg("删除失败", "error");
                    }
                }, "json");
            }
        });
    });

    /*查询*/
    name.keypress(function (event) {
        if (event.keyCode == 13) {
            $("#name-search").click();
        }
    });
    $("#name-search").click(function () {
        defaultParams.supplierName = null;
        defaultParams.typeId = 0;
        defaultParams.name = name.val().trim();
        table.load();
    });

    supplier.keypress(function (event) {
        if (event.keyCode == 13) {
            $("#supplier-search").click();
        }
    });
    $("#supplier-search").click(function () {
        defaultParams.name = null;
        defaultParams.typeId = 0;
        defaultParams.supplierName = supplier.val().trim();
        table.load();
    });

    type.change(function (event) {
        defaultParams.name = null;
        defaultParams.supplierName = null;
        defaultParams.typeId = type.val().trim();
        table.load();
    });

    $("#unite-search").click(function () {
        defaultParams.name = name.val().trim();
        defaultParams.supplierName = supplier.val().trim();
        defaultParams.typeId = type.val().trim();
        table.load();
    });


    /*文档管理-添加*/
    $("#insert").click(function() {
        var url = $ctx + "/document/toPage/document-add_document";
        layer_show("添加文档", url, 800, 600, 2);
    });

});
