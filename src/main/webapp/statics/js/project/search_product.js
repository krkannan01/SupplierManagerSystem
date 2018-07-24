jQuery(function($){

    // BEGIN 分类树组件定义 //
    loadData();

    /*绑定树形菜单查询事件*/
    var tree_search = function() {
        /*1: 获取当前所有选中的节点*/
        var selected_ids_str = "";
        $.each($("li.tree-item.tree-selected"), function(index, item) {
            selected_ids_str += item.getAttribute("data-value") + ",";
        });
        defaultParams.groupIds = selected_ids_str;
        $("#brandIds").html(get_brand_by_group_ids(selected_ids_str));
        var $group = $("#brandIds").closest(".group");
        init_group($group);
        set_single_selection($group, defaultParams, sendRequest);
        sendRequest();
    };

    function loadData() {
        /*获取所有材料分组数据*/
        var product_group_data = getProductGroupData();
        var sampleData = initiateDemoData(product_group_data);//see below
        $('#product-group-tree').ace_tree({
            dataSource: sampleData['dataSource1'],
            multiSelect: false,
            cacheItems: true,
            'selectable' : true,
            'open-icon' : 'ace-icon tree-minus',
            'close-icon' : 'ace-icon tree-plus',
            'itemSelect' : true,
            'folderSelect': false,
            'expand': true,
            'selected-icon' : 'ace-icon fa fa-check',
            'unselected-icon' : 'ace-icon fa fa-times',
            loadingHTML : '<div class="tree-loading"><i class="ace-icon fa fa-refresh fa-spin blue"></i></div>',
            onSelect: function() {
                tree_search();
            }
        });
    }

    /*获取所有材料分组数据*/
    function getProductGroupData() {
        var responseData;
        $.ajax({
            url: $ctx + "/productGroup/getProductGroupList",
            type: "GET",
            async: false,
            dataType: "json",
            success: function(data) {
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
                        tree_data['additionalParameters']['children'][item.id] = {text: item.name, type: 'item', value: item.id};
                    } else {
                        tree_data['additionalParameters']['children'][item.id] = {text: item.name, type: 'folder', value: item.id};
                        create(item, tree_data['additionalParameters']['children'][item.id]);
                    }
                });
            };
        };
        if (responseData != null && responseData.length > 0) {
            $.each(responseData, function(index, item) {
                // 如果该菜单只有一级
                if (!item.children) {
                    tree_data[item.id] = {text: item.name, type: 'item', value: item.id};
                } else {  // 如果该菜单是多级
                    tree_data[item.id] = {text: item.name, type: 'folder', value: item.id};
                    create(item, tree_data[item.id]);
                }
            });
        };
        /*function(data, container) {
            if (data != null && data.length > 0) {
                $.each(data, function(index, item) {
                    if (!item.children) {
                        container[item.id] = {text: item.name, type: 'item', value: item.id};
                    } else {
                        container[item.id] = {text: item.name, type: 'folder', value: item.id};
                        if (item.children != null && item.children.length > 0) {
                            container[item.id]['additionalParameters'] = {
                                'children' : {}
                            };
                            create(item.children, container[item.id]['additionalParameters']['children']);
                        }
                    }
                });
            }
        }*/
        /*create(responseData, tree_data);*/

        return tree_data;
    }

    /*初始化材料分组数据*/
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

    /*全局常用参数与对象*/
    var keywords = $("#keywords");
    var currentPage = $("#currentPage");
    var pageSize = $("#pageSize");

    var defaultParams = {};
    initParam();

    /*参数初始化方法*/
    function initParam() {

        defaultParams = {
            currentPage: 1, //关键字参数
            pageSize: 10, //当前页参数
            keywords: null //每页条数参数
        };
        keywords.val(defaultParams.keywords);
        currentPage.val(defaultParams.currentPage);
        pageSize.val(defaultParams.pageSize);
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
    pagination.maxPrev.click(function () {
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
    });


    /*全选*/
    $('#product-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
        var th_checked = this.checked;//checkbox inside "TH" table header

        $(this).closest('table').find('tbody > tr').each(function(){
            var row = this;
            if(th_checked) $(row).addClass("success").find('input[type=checkbox]').eq(0).prop('checked', true);
            else $(row).removeClass("success").find('input[type=checkbox]').eq(0).prop('checked', false);
        });

    });

    /*复选框单击事件*/
    $('#product-table').delegate('tbody .trbox', 'click', function(event){
        var doc = $(this).find("input[type=checkbox]").get(0);
        if (doc.checked) {
            doc.checked = false;
            $(this).closest("tr").removeClass("success");
            $("#product-table").find("thead input[type=checkbox]").prop("checked", false);
        } else {
            doc.checked = true;
            $(this).closest("tr").addClass("success");
            handleIsAllSelect("#product-table");
        }
        // 阻止事件冒泡和默认行为
        event.stopPropagation();
        event.preventDefault();
    });


    /*行单击事件*/
    $('#product-table').delegate('tbody > tr', 'click', function(){
        // 全部取消选中
        $("#product-table").find('tbody input[type=checkbox]').each(function(index, item) {
            item.checked = false;
            $(item).closest("tr").removeClass("success");
        });
        // 被点击行选中
        var box = $(this).find("input[type=checkbox]").get(0);
        box.checked = true;
        $(this).addClass("success");
        // 处理是否全选
        handleIsAllSelect("#simple-table");
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
    sendRequest();

    /*发送请求方法*/
    function sendRequest(param) {
        if (!param) param = defaultParams;
        console.log(param);

        /*显示加载图标*/
        showLoad();

        var table_data = null;
        var success = false;
        $.ajax({
            url: $ctx + "/product/getProductList",
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

    function render(data) {

        var content = "";
        console.log(data);

        // 1. 检查页码
        pagination.maxCount.html(data.count);
        pagination.checkPageState();

        if (data.rows != null && data.rows.length > 0) {

            // 2. 计算编号 （当前页数 - 1） * 每页数量 + 1 == 当前第一条记录的编号
            var startNo = (Number($("#currentPage").val()) - 1) * Number($("#pageSize").val()) + 1;
            startNo == NaN ? 1 : startNo;

            /*拼接字符串*/
            $.each(data.rows, function (index, item) {

                var simple_technical_param = item.technicalParam ? item.technicalParam.length > 15 ? item.technicalParam.substring(0, 15) + "..." : item.technicalParam : "";
                var unitprice = item.unitprice + "元 / " + item.unit;
                var size = item.size ? item.size : "";
                var brand = item.brandId ? item.brandId.name : "";
                var comment = item.comment ? item.comment : "";

                content += "<tr>" +
                    "<td class='center'>" + startNo++ + "</td>" +
                    "<td class='center trbox'> <label class='pos-rel'> <input type='checkbox' class='ace' data-id='"+ item.id +"' /> <span class='lbl'></span> </label> </td>" +
                    "<td class='center' style='color: green;'>" + item.no + "</td>" +
                    "<td>" + item.name + "</td>" +
                    "<td>" + size + "</td>" +
                    "<td>"+ brand +"</td>" +
                    "<td class='technical-param'> <a href='javascript:void(0);' data-trigger='hover' data-placement='auto top' data-toggle='popover' data-content='"+ item.technicalParam +"'>" +
                        simple_technical_param + "</a> </td>" +
                    "<td>"+ unitprice +"</td>" +
                    "<td>" + comment + "</td>" +
                    "<td>"+ item.enterpriseId.fullName +"</td>" +
                    "<td>"+ item.groupId.name +"</td>" +
                    "<td>" +
                        "<div class='btn-group'>" +
                            "<shiro:hasAnyPermission name='admin,updateProduct'>" +
                            "<button class='btn btn-xs btn-info updateProduct' data-id='"+ item.id +"'> <i class='ace-icon fa fa-pencil bigger-120'></i>修改 </button>" +
                            "</shiro:hasAnyPermission>" +
                            "<shiro:hasAnyPermission name='admin,deleteProduct'>" +
                            "<button class='btn btn-xs btn-warning deleteProduct' data-id='"+ item.id +"'> <i class='ace-icon fa fa-trash-o bigger-120'></i>删除 </button>" +
                            "</shiro:hasAnyPermission>" +
                        "</div>" +
                    "</td>" +
                    "</tr>";
            });
        } else {
            content += "<tr><td colspan='12'><div class='alert alert-warning' style='padding: 5px;margin-bottom: 0;text-align: center;'>没有信息</div></td></tr>";
        }
        $("#product-table > tbody").html(content);

        $("#product-table .technical-param > a").popover({html:true});

    }

    /*给材料表单模态框绑定事件*/
    $("#product-form-modal").on('hide.bs.modal', function() {
        /*1:重置表单*/
        var form = $(this).find("#product-form");
        form ? form.get(0).reset() : void(0);
        form.find("input,select,textarea").each(function(index, item) {
            $(item).attr("placeholder", "");
        });
        $("#enterprise").next().find(".chosen-single span").text("请选择");
        $("#enterprise").next().find("ul li:eq(0)").text("请选择");
        /*重置事件*/
        $("#confirm").unbind("click");
    });

    /*初始化供应商搜索框*/
    init_enterprise($("#enterprise"));

    /*给材料表单绑定下拉选项数据,与小数验证*/
    initForm();
    /*小数验证正则*/
    var re = /^\d+(\.\d+)?$/;
    function initForm() {
        /*下拉选择框处理*/
        /*定义内部数据处理函数*/
        var handler = function(data, prefix, prefix_unit) {
            var html = "";
            $.each(data, function(index, item) {
                html += "<option value='"+ item.id +"'>"+ prefix + item.name +"</option>";
                if (item.children) {
                    html += handler(item.children, prefix_unit + prefix);
                }
            });
            return html;
        }

        /*请求数据*/
        $.get($ctx + '/productGroup/getProductGroupList', function(data) {
            var html = "<option value='0'>-- 请选择 --</option>";
            html += handler(data,"","&nbsp;&nbsp;&nbsp;&nbsp;");
            $('#group').html(html);
            $('#parent').html(html);
        }, 'json');

        /*小数限制处理*/
        $("#unitprice").keyup(function(e) {
            var $this = $(this) ;
            if (re.test($this.val())) {
                convert_success($this);
            } else {
                convert_error($this, "格式错误");
            }
        });
    }

    /*新增*/
    $("#insert").click(function() {
        /*1):修改标题信息*/
        var $title = $('#product-form-modal div.modal-header > h4');
        $title.removeClass('orange');
        $title.addClass('green');
        $title.text('新增材料信息');

        /*2):修改下拉框信息*/
        var group = $("#group");//分组下拉框
        var enterprise = $("#enterprise");//供应商下拉框
        group.children("option:eq(0)").text("-- 请选择 --");
        enterprise.next().find(".chosen-single span").text("请选择");

        //修改颜色样式
        var name = $("#name"),//名称
            size = $("#size"),//规格
            brand = $("#brand"),//品牌
            technicalParam = $("#technicalParam"),//技术参数
            unit = $("#unit"), //单位
            unitprice = $("#unitprice"),//单位价格
            comment = $("#comment");//备注

        var nodes = [name, unit, unitprice, group, enterprise];
        $.each(nodes, function(index, item) {
            var $item = $(item);
            var $id = $item.attr("id");
            if ($id == "group" || $id == "enterprise") {
                convert_warning_only($item);
            } else {
                convert_warning($item);
            }
            $item.bind({
                "change": function() {
                    /*验证下拉框样式*/
                    if ($id == "group" || $id == "enterprise") {
                        if ($item.val() > 0) {
                            convert_success_only($item);
                        } else {
                            convert_warning_only($item);
                        }
                    } else if ($id == "unitprice") {
                        $item.keyup();
                    } else {/*验证输入框样式*/
                        if ($item.val()) {
                            convert_success($item);
                        } else {
                            convert_warning($item);
                        }
                    }
                }
            });
        });

        /*3):绑定确定事件*/
        $("#confirm").click(function() {
            for (var i=0; i<nodes.length; i++) {
                var $this = $(nodes[i]);
                var $id = $this.attr("id");
                // 验证下拉框
                if ($id == "group" || $id == "enterprise") {
                    if ($this.val() < 1) {
                        $.modalMsg("请选择分组项","warning");
                        return;
                    }
                } else if ($this.attr("id") == "unitprice") {
                    if (!re.test($this.val())) {
                        $.modalMsg("单价格式有误","warning");
                        return;
                    }
                } else {
                    if (!$this.val()) {
                        $.modalMsg("请填写必填项","warning");
                        return;
                    }
                }
            }

            /*通过验证，提交表单*/
            var product_data = {};
            if (name.val()) product_data["name"] = name.val();
            if (size.val()) product_data["size"] = size.val();
            if (brand.val()) product_data["brandId.name"] = brand.val();
            if (technicalParam.val()) product_data["technicalParam"] = technicalParam.val();
            if (unit.val()) product_data["unit"] = unit.val();
            if (unitprice.val()) product_data["unitprice"] = unitprice.val();
            if (comment.val()) product_data["comment"] = comment.val();
            if (group.val()) product_data["groupId.id"] = group.val();
            if (enterprise.val() > 0) product_data["enterpriseId.id"] = enterprise.val();
            $.post($ctx + "/product/insertProduct", product_data, function(data) {
                if (data == "success") {
                    $.modalMsg("新增成功", "success");
                    $("#product-form-modal").modal("hide");
                    sendRequest();
                } else {
                    $.modalMsg("新增失败", "error");
                }
            }, "text");
        });

        /*显示*/
//            $("#product-form-modal").modal("show");
        $("#product-form-modal").modal({
            backdrop: false
        });
    });

    //单行删除
    $("#product-table").delegate(".deleteProduct", "click", function() {
        var this_ = this;
        $.modalConfirm("你确定要删除这条数据吗?", function (isOk) {
            if (isOk) {
                var id = this_.getAttribute("data-id");
                $.post($ctx + "/product/deleteProduct", {id: id}, function(data) {
                    if (data == "success") {
                        $.modalMsg("删除成功", "success");
                        sendRequest();
                    } else {
                        $.modalMsg("删除失败", "error");
                    }
                }, "text");
            }
        });
    });

    //多行删除
    $("#allDelete").click(function() {
        if ($("#product-table > tbody > tr > td input[type=checkbox]:checked").length < 1) {
            $.modalMsg("请选中要删除的数据!", "success");
            return;
        }
        var ids = "";
        var idLength = 0;
        $("#product-table > tbody > tr > td input[type='checkbox']").each(function(index, element) {
            if (element.checked) {
                ids += element.getAttribute("data-id")+",";
                idLength ++;
            }
        });
        $.modalConfirm("你确定要删除选中的" + idLength + "行数据吗?", function(isOk) {
            if (isOk) {
                $.post($ctx + "/product/multiDeleteProduct", {ids: ids}, function(data) {
                    if (data == "success") {
                        $.modalMsg("删除成功", "success");
                        sendRequest();
                    } else {
                        $.modalMsg("删除失败", "error");
                    }
                }, "text");
            }
        });
    });

    /*刷新*/
    $("#refursh").click(function() {
        /*sendRequest();*/
        location.href = $ctx + "/product/toSearchProduct";
    });

    //修改
    $("#product-table").delegate(".updateProduct", "click", function() {
        var id = this.getAttribute("data-id");
        $.ajax({
            url: $ctx + "/product/getProductById",
            type: "POST",
            async: false,
            data: {id: id},
            dataType: "json",
            success: function(data) {
                if (data != null) {
                    /*1):修改标题信息 设置ID信息*/
                    var $title = $('#product-form-modal div.modal-header > h4');
                    var $id = $('#productId');
                    $title.removeClass('green');
                    $title.addClass('orange');
                    $title.text('修改材料信息');
                    $id.val(id);

                    /*2):设置分组选择框首项*/
                    var group = $("#group");//分组
                    var enterprise = $("#enterprise");//供应商
                    group.children("option:eq(0)").text(data.groupId.name);
                    enterprise.next().find(".chosen-single span").text(data.enterpriseId.fullName);

                    //设置占位符文字
                    var name = $("#name"),//名称
                        size = $("#size"),//规格
                        brand = $("#brand"),//品牌
                        technicalParam = $("#technicalParam"),//技术参数
                        unit = $("#unit"), //单位
                        unitprice = $("#unitprice"),//单位价格
                        comment = $("#comment"),//备注
                        enterprise = $("#enterprise");//供应商

                    name.attr("placeholder", data.name);
                    size.attr("placeholder", data.size);
                    brand.attr("placeholder", data.brand);
                    technicalParam.attr("placeholder", data.technicalParam);
                    unit.attr("placeholder", data.unit);
                    unitprice.attr("placeholder", data.unitprice);
                    comment.attr("placeholder", data.comment);
                    enterprise.attr("placeholder", data.enterpriseId.name);

                    //清除验证样式
                    var nodes = [name, unit, unitprice, group];
                    for (var i=0; i<nodes.length; i++) {
                        var $item = $(nodes[i]);
                        convert_success_clear($item);
                        bind_placeholder_to_value($item);
                    }

                    convert_success_only(enterprise);
                    enterprise.unbind("focus", "blur");

                    var nodes_two = [size, brand, technicalParam, comment];
                    for (var i=0; i<nodes_two.length; i++) {
                        bind_placeholder_to_value($(nodes_two[i]));
                    }

                    /*3):绑定确定事件*/
                    $("#confirm").click(function() {
                        if (unitprice.val() && !re.test(unitprice.val())) {
                            $.modalMsg("单价格式有误,请重新填写", "error");
                            return;
                        }
                        var product_data = {};
                        product_data["id"] = id;
                        if (name.val()) product_data["name"] = name.val();
                        if (size.val()) product_data["size"] = size.val();
                        if (brand.val()) product_data["brandId.name"] = brand.val();
                        if (technicalParam.val()) product_data["technicalParam"] = technicalParam.val();
                        if (unit.val()) product_data["unit"] = unit.val();
                        if (unitprice.val()) product_data["unitprice"] = unitprice.val();
                        if (comment.val()) product_data["comment"] = comment.val();
                        if (group.val()) product_data["groupId.id"] = group.val();
                        if (enterprise.val() > 0) product_data["enterpriseId.id"] = enterprise.val();
                        $.post($ctx + "/product/updateProduct", product_data, function(data) {
                            if (data == "success") {
                                $.modalMsg("修改成功", "success");
                                sendRequest();
                                $("#product-form-modal").modal("hide");
                            } else {
                                $.modalMsg("修改失败", "error");
                            }
                        }, "text");
                    });

                    /*显示*/
//            $("#product-form-modal").modal("show");
                    $("#product-form-modal").modal({
                        backdrop: false
                    });
                }
            }
        });
    });

    /*右键菜单事件*/
    $("#product-group-tree").contextmenu(function(e) {
        /*取消浏览器默认的右键菜单事件*/
        e.preventDefault();
        /*定义菜单选项事件*/
        var $item = $(e.target), current_id = null, current_name = null;
        if ($item.attr("id") != "product-group-tree") {
            $item = $item.hasClass("tree-item") ? $item : $item.closest(".tree-item");
            $item = $item.hasClass("tree-branch") ? $item.find(".tree-item") : $item;

            current_id = $item.attr("data-value");
            current_name = $item.find(".tree-label").text();
        }
        if (current_id && current_name) {
            /*显示右键菜单*/
            var menu = $("#my-menu");
            menu.css("left", e.pageX);
            menu.css("top", e.pageY);
            menu.css("width", '125px');
        }
        /*绑定新增，删除，修改事件*/
        $("#insertChildNode").click(function() {
            insert_child_node(current_id);
            /*事件解绑*/
            $(this).unbind("click");
        });
        $("#deleteNode").click(function() {
            delete_node(current_id, current_name, $item);
            $(this).unbind("click");
        });
        $("#updateNode").click(function() {
            update_node(current_id, current_name, $item);
            $(this).unbind("click");
        });
    });

    /*初始化 隐藏事件 表单数据*/
    $("#product-group-form-modal").on('hide.bs.modal', function() {
        /*1:重置表单*/
        var form = $(this).find("#product-group-form");
        form ? form.get(0).reset() : void(0);
        /*解绑事件*/
        var name = $("#group-name");
        name.unbind("focus blur keyup");
        name.attr("placeholder", "");
        var parent = $("#parent");

        $("#confirm-two").unbind("click");
    });

    /*新增节点*/
    function insert_child_node(id) {
        /*1):修改标题信息*/
        var $title = $('#product-group-form-modal div.modal-header > h4');
        $title.removeClass('orange');
        $title.addClass('green');
        $title.text('新增材料分组信息');

        /*2):添加表单验证*/
        var name = $("#group-name");//名称
        convert_warning(name);
        name.bind({
            "blur": function() {
                var $this = $(this);
                /*对于name进行验证*/
                if ($this.val()) {
                    convert_success($this);
                } else {
                    convert_warning($this);
                }
            }
        });
        var parent = $("#product-group-form #parent");
        parent.children("option[value=0]").text("-- 无 --");
        parent.val(id);

        /*3):绑定确定事件*/
        $("#product-group-form-modal #confirm-two").click(function() {
            if (!name.val()) {
                $.modalMsg("请填写必填项","warning");
                return;
            }

            if (product_group_unique(name.val())) {
                convert_error(name, "分组名称已存在");
                $.modalMsg("分组名称已存在","error");
                return;
            }

            /*通过验证，提交表单*/
            var product_group_data = {};
            if (name.val()) product_group_data["name"] = name.val();
            if (parent.val()) product_group_data["parentId"] = parent.val();
            $.get($ctx + "/productGroup/insertProductGroup", product_group_data, function(data) {
                if (data == "success") {
                    $("#product-group-form-modal").modal("hide");
                    $.modalMsg("新增成功", "success");
                    /*重新加载tree*/
                    reLoadData();
                } else {
                    $.modalMsg("新增失败", "error");
                }
            }, "text");
        });

        /*显示*/
//            $("#product-form-modal").modal("show");
        $("#product-group-form-modal").modal({
            backdrop: false
        });
    }
    /*删除节点*/
    function delete_node(id, name, $item) {
        $.modalConfirm("确定删除【" + name + "】节点及其子节点吗?", function(isOk) {
            if (isOk) {
                $.get($ctx + "/productGroup/deleteProductGroup", {id: id}, function(data) {
                    if (data == "success") {
                        if ($item.is("li")) $item.remove();
                        else $item.closest("li").remove();
                        $.modalMsg("删除成功", "success");
                    } else {
                        $.modalMsg("删除失败", "error");
                    }
                }, "text");
            }
        });
    }
    /*修改节点*/
    function update_node(id, name) {
        $.ajax({
            url: $ctx + "/productGroup/getProductGroupById",
            type: "GET",
            async: false,
            data: {id: id},
            dataType: "JSON",
            success: function(data) {
                if (data != null) {
                    /*1):修改标题信息 设置ID信息*/
                    var $title = $('#product-group-form-modal div.modal-header > h4');
                    $title.removeClass('green');
                    $title.addClass('orange');
                    $title.text('修改材料分组信息');

                    /*2):取消表单验证 添加placeholder属性值 设置分组选择框首项*/
                    var $name = $("#group-name"),//名称
                        $parent = $("#parent");

                    /*设置首项值与初始值*/
                    $parent.children("option[value=0]").text("-- 无 --");
                    $parent.val(data.parentId);

                    $name.attr("placeholder", data.name);
                    convert_success_clear($name);
                    bind_placeholder_to_value($name);

                    /*3):绑定确定事件*/
                    $("#confirm-two").click(function() {

                        var product_group_data = {};
                        product_group_data["id"] = id;
                        if ($name.val() && $name.val() != name) {
                            if (product_group_unique($name.val())) {
                                convert_error($name, "分组名称已存在");
                                $.modalMsg("分组名称已存在","error");
                                return;
                            }
                            product_group_data["name"] = $name.val();
                        }
                        if ($parent.val() != data.parentId) product_group_data["parentId"] = $parent.val();
                        if (product_group_data["name"] || product_group_data["parentId"]) {
                            $.get($ctx + "/productGroup/updateProductGroup", product_group_data, function(data) {
                                if (data == "success") {
                                    $("#product-group-form-modal").modal("hide");
                                    $.modalMsg("修改成功", "success");
                                    reLoadData();
                                } else {
                                    $.modalMsg("修改失败", "error");
                                }
                            }, "text");
                        } else {
                            $("#product-group-form-modal").modal("hide");
                            $.modalMsg("没有做任何更改", "success");
                        }
                    });

                    /*显示*/
//            $("#product-form-modal").modal("show");
                    $("#product-group-form-modal").modal({
                        backdrop: false
                    });
                }
            }
        });
    }

    window.onclick = function(e) {
        /*隐藏右键菜单*/
        $("#my-menu").css("width", 0);
    };

    /*加载品牌列表*/
    $("#brandIds").html(get_brand_by_group_ids());

    /*绑定品牌列表单机事件【清楚品牌搜索框的数据】*/
    $("#brandIds").click(function() {
        $("#brand-input").val("");
        defaultParams.brand = null;
    });

    /*绑定收起筛选项效果*/
    $("#toggle-filter").click(function() {
        $(".filter-body").slideToggle(300);
        var $this = $(this);
        $this.text($this.text() == "展开筛选" ? "收起筛选":"展开筛选");
        $this.toggleClass("show");
    });

    /*分类筛选初始化*/
    var group = $(".group");
    $.each(group, function(index, item) {
        init_group(item);
    });

    /*绑定分组单选效果*/
    $(".group").each(function(index, item) {
        var $group = $(item);
        set_single_selection($group, defaultParams, sendRequest);
    });

    /*提交*/
    $(".group").delegate('.submit-filter', 'click', function() {
        var $group = $(this).closest(".group");
        var param_name = $group.attr("data-name");
        var data = get_active($group)
        defaultParams[param_name] = data;
        // 发送请求
        sendRequest();
    });
    /*取消*/
    $(".group").delegate('.cancel-filter', 'click', function() {
        var $group = $(this).closest(".group");
        li_reset($group);
        $group.find("li:eq(-1)").remove();
        if (has_more($group)) {
            var $show_more = $group.find(".show-more");
            $show_more.hasClass("active") ? void(0):get_more($group).hide();
            $show_more.show();
        }
        $group.find(".select-multi").show();
        set_single_selection($group, defaultParams, sendRequest);
        set_badge($group);
    });

    /*绑定多选按钮效果*/
    $(".select-multi").each(function(index, item) {
        var $select_multi_btn = $(item);
        $select_multi_btn.click(function() {
            var $group = $select_multi_btn.closest('.group');
            var $show_more = $group.find(".show-more");
            set_multiple_selection($group);
            $select_multi_btn.hide();
            /*追加 提交、取消 按钮*/
            $group.find('ul').append("<li style='width: 100%; text-align: center;'>" +
                "<div class='btn-group'>" +
                "<button class='btn btn-sm btn-white btn-warning submit-filter'>提交</button>" +
                "<button class='btn btn-sm btn-white btn-primary cancel-filter'>取消</button>" +
                "</div></li>");

            /*如果 具有更多子项*/
            if (has_more($group)) {
                $show_more.hide();
                get_more($group).show();
            }
        });
    });

    /*绑定综合选项栏事件*/
    $("#brand-search").click(function() {
        defaultParams.brand = $("#brand-input").val();
        li_reset($(".group[data-name=brandIds]"));
        defaultParams.brandGroupIds = null;
        sendRequest();
    });
    $("#supplier-search").click(function() {
        defaultParams.enterprise = $("#supplier-input").val();
        sendRequest();
    });
    $("#price-interval-search").click(function() {
        defaultParams.priceMin = $("#price-min-input").val();
        defaultParams.priceMax = $("#price-max-input").val();
        sendRequest();
    });
    $("#brand-input").keyup(function(e) {
        if (e.keyCode == 13) $("#brand-search").click();
    });
    $("#supplier-input").keyup(function(e) {
        if (e.keyCode == 13) $("supplier-search").click();
    });
    $("#price-min-input, #price-max-input").keyup(function(e) {
        if (e.keyCode == 13) $("#price-interval-search").click();
    });

    $("#import-excel-button").click(function() {
        $("#upload-excel-modal").modal("show");
    });

    try {
        var upload_dropzone = new Dropzone("#upload-excel", {
            url: $ctx + "/product/importExcel",//文件提交地址
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
                    console.log("ok");
                });
                this.on("error",function (file,data) {
                    //上传失败触发的事件
                    alert("上传失败，请刷新后重试!");

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

    var type = "product";
    excel_download(type, defaultParams);

});