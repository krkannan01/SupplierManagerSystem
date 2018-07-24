// URLS
const get_trade_group_path = $ctx + "/enterprise/getTradeGroup";
const get_enterprise_by_id_two_path = $ctx + "/enterprise/getEnterpriseById2";
const get_enterprise_by_id_path = $ctx + "/enterprise/getEnterpriseById";
const mutli_delete_path = $ctx + "/enterprise/mutliDelete";
const to_search_supplier_path = $ctx + "/enterprise/toSearchSupplier";
const search_path = $ctx + "/enterprise/search";
const delete_path = $ctx + "/enterprise/delete";
const import_excel_path = $ctx + "/enterprise/importExcel";

/*查看供应商详情，在弹出层展示*/
function showSupplierDetail(id) {
    layer.open({
        type: 2,
        area: ['1200px', '800px'],
        fix: false,
        //不固定
        maxmin: true,
        shade: 0.4,
        title: "供应商详情",
        content: get_enterprise_by_id_two_path + "?id=" + id,
        btn: ['确定']
    });
}


jQuery(function($) {

    var CATEGORY = {
        HuiZon: {id: null, name: null}, //汇总
        ShiYong: {id: 0, name: "试用供应商"}, //试用
        ZhanLue: {id: 1, name: "战略供应商"}, //战略
        HeGe: {id: 2, name: "合格供应商"}, //合格
        XiuMian: {id: 3, name: "休眠供应商"} //休眠
    };

    /*加载企业分组信息*/
    $.get(get_trade_group_path,function(data) {
        /*设置默认显示数据*/
        var tradeGroupHtml = "<div class='alert alert-danger' style='margin: 0 auto;padding: 5px;width: 36%;'>系统提示:没有分组</div>";
        if (data) {
            /*如果有数据则清空默认，并设置分组信息*/
            if (data.rows != null && data.rows.length > 0) {
                tradeGroupHtml = "";
                $.each(data.rows, function(index, item) {
                    tradeGroupHtml += "<div class='col-xs-2'>" +
                        "<div class='select' data-groupId='"+ item.id +"'>" +
                        "<span>"+ item.name +" ["+ item.count +"]</span>" +
                        "</div>" +
                        "</div>";
                });
            }
        }
        /*填充数据*/
        $("#member-tab > .widget-box > .widget-body > .widget-main > .row.center").html(tradeGroupHtml);
    }, "json");

    /*全局常用参数与对象*/
    var operateRange = $("#operate-range-input");
    var uccCode = $("#ucccode-input");
    var fullName = $("#supplier-input");
    var sort = $(".sort-level");
    var currentPage = $("#currentPage");
    var pageSize = $("#pageSize");

    var defaultParams = {};
    initParam();

    /*参数初始化方法*/
    function initParam() {

        defaultParams = {
            operateRange: null, //经营范围参数
            uccCode: null, //主营产品参数
            fullName: null, //全称参数
            groups: null, //分组参数
            unionSearch: false, //是否交集查询
            sort: null, //排序的字段
            sorted: "desc", //排序的顺序
            includeException: false, //不包含异常信息参数
            categoryId: null, //供应商种类
            currentPage: 1, //当前页参数
            pageSize: 10 //每页条数参数
        };
        operateRange.val(defaultParams.operateRange);
        uccCode.val(defaultParams.uccCode);
        fullName.val(defaultParams.fullName);
        currentPage.val(defaultParams.currentPage);
        pageSize.val(defaultParams.pageSize);
        sort.removeClass("active").removeClass("active-up").removeClass("active-down");
    }

    //获取分页对象
    var pagination = new Pagination({
        "maxPrev": $("#maxPrev"),//第一页
        "prev": $("#prev"),//上一页
        "next": $("#next"),//下一页
        "maxNext": $("#maxNext"),//最后一页
        "maxPage": $("#maxPage"),//最大页数
        "start": $("#start"),//记录起点
        "end": $("#end"),//记录结束点
        "maxCount": $("#maxCount"),//最大记录数
        "currentPage": currentPage,//当前页数
        "pageSize": pageSize,//页面容量
    });
    //绑定分页事件
    pagination.bindGoPage(defaultParams, sendRequest);
    /*pagination.maxPrev.click(function () {
        pagination.goPage(pagination.click_max_prev(), defaultParams, sendRequest);
    });
    pagination.prev.click(function () {
        pagination.goPage(pagination.click_prev(), defaultParams, sendRequest);
    });
    pagination.next.click(function () {
        pagination.goPage(pagination.click_next(), defaultParams, sendRequest);
    });
    pagination.maxNext.click(function () {
        pagination.goPage(pagination.click_max_next(), defaultParams, sendRequest);
    });*/

    // 初始化表格复选框选择事件
    initTableCheckbox();

    // BEGIN 分类树组件定义 //
    loadData();

    /*绑定树形菜单查询事件*/
    var tree_search = function() {
        /*1: 获取当前所有选中的节点*/
        var selected_ids_str = "";
        $.each($("li.tree-item.tree-selected"), function(index, item) {
            selected_ids_str += item.getAttribute("data-value") + ",";
        });
        console.log(selected_ids_str);
        defaultParams.groups = selected_ids_str;
        sendRequest();
    };

    function loadData(requestData) {

        /*获取所有供应商分组数据*/
        var product_group_data = getProductGroupData(requestData);
        var sampleData = initiateDemoData(product_group_data);//see below
        $('#enterprise-group-tree').ace_tree({
            dataSource: sampleData['dataSource1'],
            multiSelect: false,
            cacheItems: true,
            'selectable' : true,
            'open-icon' : 'ace-icon fa fa-folder-open',
            'close-icon' : 'ace-icon fa fa-folder',
            'itemSelect' : true,
            'folderSelect': false,
            'expand': true,
            'selected-icon' : null,
            'unselected-icon' : null,
            'folder-open-icon' : 'ace-icon tree-plus',
            'folder-close-icon' : 'ace-icon tree-minus',
            loadingHTML : '<div class="tree-loading"><i class="ace-icon fa fa-refresh fa-spin blue"></i></div>',
            onSelect: function() {
                tree_search();
            }
        });
    }

    function replaceTree(id) {
        var tree = $("#" + id);  // 获取元素
        tree.attr("id", "temp-" + Math.random());  // 给元素修改一个随机ID
        tree.after("<ul id='" + id + "'></ul>");  // 元素后面添加新元素,并吧id给新元素
        tree.remove();  // 移除自己
    }

    /*获取所有供应商分组数据*/
    function getProductGroupData(requestData) {
        var responseData;
        $.ajax({
            url: get_trade_group_path,
            data: requestData,
            type: "GET",
            async: false,
            dataType: "json",
            success: function(data) {
                console.log(data);
                responseData = data;
            }
        });
        var tree_data = {};

        var create = function (data, tree_data) {
            if (data.children != null && data.children.length > 0) {
                tree_data['additionalParameters'] = {
                    'children' : {}
                };
                $.each(data.children, function(index, item) {
                    if (!item.children) {
                        tree_data['additionalParameters']['children'][item.id] = {text: '<i class="ace-icon fa fa-book blue"></i>' + item.name + ' (' + item.count + ')', type: 'item', value: item.id};
                    } else {
                        tree_data['additionalParameters']['children'][item.id] = {text: item.name + ' (' + item.count + ')', type: 'folder', value: item.id, 'icon-class': 'orange'};
                        create(item, tree_data['additionalParameters']['children'][item.id]);
                    }
                });
            };
        };
        if (responseData != null && responseData.length > 0) {
            $.each(responseData, function(index, item) {
                // 如果该菜单只有一级
                if (!item.children) {
                    tree_data[item.id] = {text: '<i class="ace-icon fa fa-book blue"></i>' + item.name + ' (' + item.count + ')', type: 'item', value: item.id};
                } else {  // 如果该菜单是多级
                    tree_data[item.id] = {text: item.name + ' (' + item.count + ')', type: 'folder', value: item.id, 'icon-class': 'orange'};
                    create(item, tree_data[item.id]);
                }
            });
        };

        return tree_data;
    }

    /*初始化供应商分组数据*/
    function initiateDemoData(privilege_data){

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

            if($data != null)//
                setTimeout(function(){callback({ data: $data });} , parseInt(Math.random() * 500) + 200);

        }

        return {'dataSource1': dataSource1}

    }
    // END 分类树组件定义 //

    // BEGIN 选项卡切换 //
    $("#category-huizon").click(function() {
        replaceTree("enterprise-group-tree");
        defaultParams.categoryId = CATEGORY.HuiZon.id;
        loadData({categoryId: CATEGORY.HuiZon.id});
        sendRequest();
    });
    $("#category-shiyong").click(function() {
        replaceTree("enterprise-group-tree");
        defaultParams.categoryId = CATEGORY.ShiYong.id;
        loadData({categoryId: CATEGORY.ShiYong.id});
        sendRequest();
    });
    $("#category-zhanlue").click(function() {
        replaceTree("enterprise-group-tree");
        defaultParams.categoryId = CATEGORY.ZhanLue.id;
        loadData({categoryId: CATEGORY.ZhanLue.id});
        sendRequest();
    });
    $("#category-hege").click(function() {
        replaceTree("enterprise-group-tree");
        defaultParams.categoryId = CATEGORY.HeGe.id;
        loadData({categoryId: CATEGORY.HeGe.id});
        sendRequest();
    });
    $("#category-xiumian").click(function() {
        replaceTree("enterprise-group-tree");
        defaultParams.categoryId = CATEGORY.XiuMian.id;
        loadData({categoryId: CATEGORY.XiuMian.id});
        sendRequest();
    });
    // END 选项卡切换 //


    $("#supplier-search").click(function() {
        defaultParams.fullName = fullName.val();
        defaultParams.uccCode = null;
        defaultParams.operateRange = null;
        sendRequest();
    });
    fullName.keypress(function () {
        if (event.keyCode == 13) {
            $("#supplier-search").click();
        }
    });
    $("#ucccode-search").click(function() {
        defaultParams.fullName = null;
        defaultParams.uccCode = uccCode.val();
        defaultParams.operateRange = null;
        sendRequest();
    });
    uccCode.keypress(function () {
        if (event.keyCode == 13) {
            $("#ucccode-search").click();
        }
    });
    $("#operate-range-search").click(function() {
        defaultParams.fullName = null;
        defaultParams.uccCode = null;
        defaultParams.operateRange = operateRange.val();
        sendRequest();
    });
    operateRange.keypress(function () {
        if (event.keyCode == 13) {
            $("#operate-range-search").click();
        }
    });
    $("#unite-search").click(function() {
        defaultParams.fullName = fullName.val();
        defaultParams.uccCode = uccCode.val();
        defaultParams.operateRange = operateRange.val();
        sendRequest();
    });


    /*刷新*/
    $("#refresh").click(function() {
        sendRequest();
    });

    /*重载*/
    $("#reload").click(function() {
        location.href = to_search_supplier_path;
    });

    /*删除选中行*/
    $("#allDelete").click(function() {
        if ($("#simple-table > tbody > tr > td input[type=checkbox]:checked").length < 1) {
            $.modalMsg("您还没有选中要删除的数据呢", "success");
            return;
        }

        $.modalConfirm("你将删除选中的所有企业的数据，确定吗？", function(isOk) {
            if (isOk) {
                // 获取选中的id
                var ids = "";
                $("#simple-table > tbody > tr > td input[type='checkbox']").each(function(index, element) {
                    if (element.checked) {
                        ids += element.getAttribute("data-id")+",";
                    }
                });
                // 设置ajax配置
                var config = {
                    url: mutli_delete_path,
                    type: "post",
                    dataType: "text",
                    data: {"ids": ids},
                    success: function(result) {
                        result = result == "success" ? {code: "success", msg: "删除成功"} : {code: "error", msg: "删除失败"};
                        $.modalMsg(result.msg, result.code);
                        /*全选框重置*/
                        //$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).get(0).checked = false;
                        sendRequest();
                    }
                };
                // 发送ajax请求
                $.ajax(config);
            }
        });
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

    /*绑定信用级别排序事件*/
    sort.click(function() {
        // 未激活排序状态 -> 降序排序状态
        if (!$(this).hasClass("active")) {
            $(this).attr("class", "sort-level active active-down");
            defaultParams.sort = "level";
        }
        else {
            // 降序 -> 升序
            if ($(this).hasClass("active-down")) {
                $(this).attr("class", "sort-level active active-up");
                defaultParams.sorted = "asc";
            }
            // 升序 -> 取消激活
            else {
                $(this).removeClass("active-up").addClass("active-down");
                $(this).attr("class", "sort-level");
                // 恢复默认
                defaultParams.sort = null;
                defaultParams.sorted = null;
            }
        }
        sendRequest();
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
    var uccCodeParam = $uccCode;
    if (uccCodeParam != "null" && uccCodeParam != "") {
        var params = {"unionSearch": true, "uccCode": uccCodeParam, "fullName": uccCodeParam, "operateRange": uccCodeParam};
        sendRequest(params);
    } else {
        sendRequest();
    }


    /*发送请求方法*/
    function sendRequest(param) {
        if (!param) param = defaultParams;

        /*显示加载图标*/
        showLoad();

        var table_data = null;
        var success = false;
        $.ajax({
            url: search_path,
            type: "GET",
            dataType: "JSON",
            data: param,
            async: false,
            success: function (data) {
                table_data = data;
                success = true;

                /*隐藏加载图标*/
                hideLoad();
            }
        });

        if (success)
            render(table_data);
        else
            $.modalMsg("请求出现错误, 重试一下吧！", "error");

        // 显示查询条件标签
        generatorSearchTab(param);
    }

    function showLoad() {
        var load = $("#loadAnimate");

        /*显示加载图标*/
        var table = load.prev();
        var parent = load.parent();
        table.css("opacity", 0.5);
        load.css("display", "block");
        load.css("top", table.offset().top - parent.offset().top + table.height()/2 + "px");
    }

    function hideLoad() {
        var load = $("#loadAnimate");

        /*隐藏加载图标*/
        var table = load.prev();
        table.css("opacity", "");
        load.css("display", "none");
    }

    /*生成查询标签*/
    function generatorSearchTab(param) {
        var box = $("#show-filter");
        box.html("当前查询条件：");
        // 生成供应商种类标签
        if (param.categoryId != null) {
            for (var attr in CATEGORY) {
                if (CATEGORY[attr].id == param.categoryId) {
                    box.append("<span class='filter-tab' style='background: #33B5E5;'>" + CATEGORY[attr].name + "</span>");
                    break;
                }
            }
        }
        // 生成供应商分组标签
        if (param.groups) {
            var list = param.groups.slice(0, -1).split(",");
            var str = "供应商分组属于\""
            for (var i = 0; i < list.length; i ++) {
                str += $("li[data-value=" + list[i] + "]").find("span.tree-label").text().slice(0, -4) + ",";
            }
            str = str.slice(0, -1);
            str += "\"";
            box.append("<span class='filter-tab'>" + str + "</span>")
        }
        // 生成供应商条件标签
        if (param.fullName)
            box.append("<span class='filter-tab' style='background: #AA66CC;'>供应商名称包含'" + param.fullName + "'</span>");
        // 生成单位税号条件标签
        if (param.uccCode)
            box.append("<span class='filter-tab' style='background: #99CC00;'>单位税号包含'" + param.uccCode + "'</span>");
        // 生成经营范围条件标签
        if (param.operateRange)
            box.append("<span class='filter-tab' style='background: #669900;'>经营范围包含'" + param.operateRange + "'</span>");
        // 生成页面范围标签
        if (Number(pagination.pageSize.val()) < Number(pagination.maxCount.html()))
            box.append("<span class='filter-tab' style='background: #0099CC;'>第" + pagination.start.html() + "页到第" + pagination.end.html() + "页</span>");
    }


    /*根据新数据重新渲染表格*/
    function render(data) {
        var content = "";
        if (data.rows != null && data.rows.length > 0) {

            // 1. 检查页码
            pagination.maxCount.html(data.count);
            pagination.checkPageState();

            // 2. 计算编号 （当前页数 - 1） * 每页数量 + 1 == 当前第一条记录的编号
            var startNo = (Number($("#currentPage").val()) - 1) * Number($("#pageSize").val()) + 1;
            startNo == NaN ? 1 : startNo;

            // 3. 组装内容
            var colorArray = [" label-success", " label-warning", ""];
            /*拼接字符串*/
            $.each(data.rows, function (index, item) {

                // 设置搜索时匹配部分高亮显示 针对 uccCode fullName
                var uccCodeHtml = item.uCCcode;
                if (defaultParams.uccCode) {
                    var rule = RegExp(defaultParams.uccCode + "+", "g");
                    uccCodeHtml = uccCodeHtml.replace(rule, "<span style='color: red;'>" + defaultParams.uccCode + "</span>");
                }

                var fullNameHtml = item.fullName;
                if (defaultParams.fullName) {
                    var rule = RegExp(defaultParams.fullName + "+", "g");
                    fullNameHtml = fullNameHtml.replace(rule, "<span style='color: red;'>" + defaultParams.fullName + "</span>")
                }


                var fullNameHtml = convert_href_html(fullNameHtml, false, "javascript: showSupplierDetail(" + item.id + ");", 'table-a');
                var websiteHtml = convert_href_html(item.website, true, item.website, 'table-a');

                var color = colorArray[Math.floor(Math.random() * colorArray.length)];
                var tradeGroupIdHtml = "<span class='label label-sm" + color + "'>" + item.tradeGroupId.name + "</span>"

                content += "<tr>" +
                    "<td class='center'>" + startNo++ + "</td>" +
                    "<td class='center trbox'> <label class='pos-rel'> <input type='checkbox' data-id='" + item.id + "' class='ace' /> <span class='lbl'></span> </label> </td>" +
                    "<td class='center' style='color: green;'>" + item.no + "</td>" +
                    "<td>"+ fullNameHtml +"</a></td>" +
                    "<td>"+ websiteHtml +"</a></td>" +
                    "<td>" + uccCodeHtml + "</td>" +
                    "<td><div class='rating inline' data-score='"+ item.level +"'></div></td>" +
                    "<td>" + item.mainProduct + "</td>" +
                    "<td>" + tradeGroupIdHtml + "</td>" +

                    "<td>" +
                    "<div class='hidden-sm hidden-xs action-buttons'>" +
                    "<a class='blue' href= '" + get_enterprise_by_id_path + "?id="+ item.id +"' target='view_window' title='查看详情'> <i class='ace-icon fa fa-search-plus bigger-130'></i> </a>" +
                    "<shiro:hasAnyPermission name='admin,updateEnterprise'>" +
                        "<a class='green' href= '" + get_enterprise_by_id_two_path + "?id="+ item.id +"&action=edit' target='view_window' title='编辑'> <i class='ace-icon fa fa-pencil bigger-130'></i> </a>" +
                    "</shiro:hasAnyPermission>" +
                    "<shiro:hasAnyPermission name='admin,deleteEnterprise'>" +
                        "<a class='red deleteDetails' href='javascript: void(0);' title='删除' data-id='"+ item.id +"'> <i class='ace-icon fa fa-trash-o bigger-130'></i> </a>" +
                    "</shiro:hasAnyPermission>" +
                    "</div>" +
                    "<div class='hidden-md hidden-lg'>" +
                        "<div class='inline pos-rel'>" +
                            "<button class='btn btn-minier btn-yellow dropdown-toggle' data-toggle='dropdown' data-position='auto'> <i class='ace-icon fa fa-caret-down icon-only bigger-120'></i> </button>" +
                            "<ul class='dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close'> " +
                                "<li> <a href='" + get_enterprise_by_id_path + "?id="+ item.id +"' class='tooltip-info showDetails' data-rel='tooltip' title='查看详情' data-id='"+ item.id +"'> " +
                                    "<span class='blue'> <i class='ace-icon fa fa-search-plus bigger-120'></i> </span> </a> </li>" +

                                "<li> <shiro:hasAnyPermission name='admin,updateEnterprise'> <a href='" + get_enterprise_by_id_path + "?id="+ item.id +"&action=edit' class='tooltip-success editDetails' data-rel='tooltip' title='编辑' data-id='"+ item.id +"'>" +
                                    "<span class='green'> <i class='ace-icon fa fa-pencil-square-o bigger-120'></i> </span> </a> </shiro:hasAnyPermission> </li>" +

                                "<li> <shiro:hasAnyPermission name='admin,deleteEnterprise'> <a href='javascript: void(0);' class='tooltip-error deleteDetails' data-rel='tooltip' title='删除' data-id='"+ item.id +"'>" +
                                    "<span class='red'> <i class='ace-icon fa fa-trash-o bigger-120'></i> </span> </a> </shiro:hasAnyPermission> </li>" +
                            "</ul>" +
                        "</div>" +
                    "</div>" +
                    "</td>" +

                    "</tr>";
            });
        } else {
            content += "<tr><td colspan='100'><div class='alert alert-warning' style='padding: 5px;margin-bottom: 0;text-align: center;'>没有信息</div></td></tr>";
        }
        $("#simple-table > tbody").html(content);

        // 4. 渲染星星样式
        $("#simple-table .rating").each(function(index, item) {
            var score = item.getAttribute("data-score");
            $(item).raty({
                'cancel' : false,//是否可以取消 default:false
                'half': true,//是否可以选择半星 default:false
                'starType' : 'i',
                'score' : score,
                'readOnly' : true,
                'hints' : ['坏', '不好', '合格', '好', '极好']
            });
            var $children = $(item).children("i");
            if (score <= 1) $children.attr("style", "font-size: 20px; color: #d06b64;");
            else if (score <= 2) $children.attr("style", "font-size: 20px; color: #fa573c;");
            else if (score <= 3) $children.attr("style", "font-size: 20px; color: #ff7537;");
            else if (score <= 4) $children.attr("style", "font-size: 20px; color: #9fe1e7;");
            else $children.attr("style", "font-size: 20px; color: #42d692;");
        });

    }


    /*删除信息操作*/
    $("#simple-table").delegate(".deleteDetails", "click", function() {
        var id = this.getAttribute("data-id");
        $.modalConfirm("你将删除跟该企业有关的所有数据，确定吗？", function(isOk) {
            if (isOk) {
                var config = {
                    url: delete_path,
                    type: "post",
                    dataType: "text",
                    data: {"id": id},
                    success: function(result) {
                        result = result == "success" ? {code: "success", msg: "删除成功"} : {code: "error", msg: "删除失败"};
                        $.modalMsg(result.msg, result.code);
                        sendRequest();
                    }
                };
                $.ajax(config);
            }
        });
    });

    /*绑定模态框确认事件*/
    $("#confirm").click(function() {
        this.setAttribute("data-param", "true");
        $("#deleteConfirm").modal("hide");
    });

    $("#import-excel-button").click(function() {
        $("#upload-excel-modal").modal("show");
    });

    try {
        var upload_dropzone = new Dropzone("#upload-excel", {
            url: import_excel_path,//文件提交地址
            method:"post",  //也可用put
            paramName:"upload", //默认为file
            maxFiles:1,//一次性上传的文件数量上限
            maxFilesize: 10, //文件大小，单位：MB
            acceptedFiles: ".xls,.xlsx", //上传的类型
            addRemoveLinks:false,
            parallelUploads: 1,//一次上传的文件数量
            //previewsContainer:"#preview",//上传图片的预览窗口
            dictDefaultMessage:'拖动文件至此或者点击上传',
            dictMaxFilesExceeded: "您最多只能上传1个文件！",
            dictResponseError: '文件上传失败!',
            dictInvalidFileType: "文件类型只能是*.xls,*.xlsx",
            dictFallbackMessage:"浏览器不受支持",
            dictFileTooBig:"文件过大上传文件最大支持.",
            dictRemoveLinks: "删除",
            dictCancelUpload: "取消",
            init:function(){
                this.on("addedfile", function(file) {
                    //上传文件时触发的事件
                    console.log('upload');
                });
                this.on("success",function(file,data){
                    //上传成功触发的事件
                    sendRequest();
                    if (data.msg) {
                        var list = data.msg.split("\n");
                        var msgHtml = "";
                        msgHtml += "<span class='span-block'>" + list[0] + "</span>";
                        msgHtml += "<span class='span-line'>" + list[1] + "</span>";
                        msgHtml += "<span class='span-line'>" + list[2] + "</span>";
                        msgHtml += "<span class='span-line'>" + list[3] + "</span>";
                        msgHtml += "<span class='span-line'>" + list[4] + "</span>";
                        $.modalAlert(msgHtml, "success");
                    }
                    console.log('ok');
                });
                this.on("error",function (file,data) {
                    //上传失败触发的事件
                    console.log('fail');

                });
                this.on("removedfile",function(file){
                    //删除文件时触发的方法
                    console.log('delete');
                });
            }
        });
    } catch (Error) {
        console.log("new dropzone error");
    }

    $("#upload-excel-modal").on("hidden.bs.modal", function() {
        upload_dropzone.removeAllFiles(true);//删除所有文件，包括上传中的
    });

    var type = "enterprise";
    excel_download(type, defaultParams);

});