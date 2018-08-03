jQuery(function($) {

    /*全局常用参数与对象*/
    var keywords = $("#keywords");
    var currentPage = $("#currentPage");
    var pageSize = $("#pageSize");

    var defaultParams = {};
    initParam();

    /*参数初始化方法*/
    function initParam() {

        defaultParams = {
            currentPage: 1, //当前页参数
            pageSize: 10, //每页条数参数
            keywords: null //关键字参数
        };
        keywords.val(defaultParams.keywords);
        currentPage.val(defaultParams.currentPage);
        pageSize.val(defaultParams.pageSize);
    }

    // 获取表格对象
    var table = new Table({
        params: defaultParams,
        table: $("#simple-table"),
        dataUrl: $ctx + "/user/search",
        render: render,
        buttons: "<div class='col-sm-3 col-xs-12'>" +
        "    <shiro:hasAnyPermission name='admin,deleteUser'>" +
        "        <button class='btn btn-danger btn-sm btn-white btn-round' id='allDelete' style='height: 34px;'>" +
        "            <i class='ace-icon fa fa-trash-o'></i> 删除选中项" +
        "        </button>" +
        "    </shiro:hasAnyPermission>" +
        "    <button class='btn btn-warning btn-sm btn-white btn-round' id='refursh' style='height: 34px;'>" +
        "        <i class='ace-icon fa fa-bolt'></i> 刷新" +
        "    </button>" +
        "    <shiro:hasAnyPermission name='admin,insertUser'>" +
        "        <button class='btn btn-success btn-sm btn-white btn-round' id='insert' style='height: 34px;'>" +
        "            <i class='ace-icon fa fa-plus'></i> 新增" +
        "        </button>" +
        "    </shiro:hasAnyPermission>" +
        "</div>"
    });

    // 初始化表格复选框选择事件
    initTableCheckbox("#simple-table", "tbody > tr.simple-row");


    /*绑定显示详情页面*/
    $('body').delegate('.show-details-btn','click', function(e) {
        e.preventDefault();
        $(this).closest('tr').next().toggleClass('open');
        $(this).find(ace.vars['.icon']).toggleClass('fa-angle-double-down').toggleClass('fa-angle-double-up');
    });
    /***************/


    /*刷新*/
    $("#refursh").click(function() {
        table.load();
    });

    /*删除选中行*/
    $("#allDelete").click(function() {
        if ($("#simple-table > tbody > tr.simple-row > td input[type=checkbox]:checked").length < 1) {
            $.modalMsg("请选中要删除的数据!", "warning");
            return;
        }
        var ids = "";
        var idLength = 0;
        $("#simple-table > tbody > tr.simple-row > td input[type='checkbox']").each(function(index, element) {
            if (element.checked) {
                ids += element.getAttribute("data-id")+",";
                idLength ++;
            }
        });
        $.modalConfirm("你确定要删除选中的" + idLength + "个用户吗？", function(isOk) {
            if (isOk) {
                $.post($ctx + "/user/multiDelete", {"ids": ids}, function(data) {
                    if (data == "success") {
                        $.modalMsg("删除成功", "success");
                        /*全选框重置*/
                        $('#simple-table > thead > tr > th input[type=checkbox]').eq(0).get(0).checked = false;
                        table.load();
                    } else {
                        $.modalMsg("删除失败，可能是权限不足!", "error");
                    }
                }, 'text');
            }
        })
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


    /*根据新数据重新渲染表格*/
    function render(data) {
        var content = "";
        if (data.rows != null && data.rows.length > 0) {

            // 1. 检查页码
            table.pagination.maxCount.html(data.count);
            table.pagination.checkPageState();

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
                    "<td class='center trbox'> <label class='pos-rel'> <input type='checkbox' class='ace' data-id='"+ item.id +"'/> <span class='lbl'></span> </label> </td>" +
                    "<td class='center'> <div class='action-buttons'> <a href='#' class='green bigger-140 show-details-btn' title='查看详情'> <i class='ace-icon fa fa-angle-double-down'></i>" +
                        "<span class='sr-only'>详情</span> </a> </div> </td>" +
                    "<td>"+ item.username +"</td>" +
                    "<td>"+ item.level +"</td>" +
                    "<td>"+ phoneNumber +"</td>" +
                    "<td class='hidden-480'>"+ lastOnlineHourBefore +"</td>" +
                    "<td class='hidden-480'>" + state + "</td>" +
                    "<td> <div class='btn-group'>" +
                        "<shiro:hasAnyPermission name='admin,updateUser'>" +
                            "<button class='btn btn-xs btn-info updateUser' data-id='"+ item.id +"'> <i class='ace-icon fa fa-pencil bigger-120'></i> 修改 </button>" +
                        "</shiro:hasAnyPermission>" +
                        "<shiro:hasAnyPermission name='admin,deleteUser'>" +
                            "<button class='btn btn-xs btn-warning deleteUser' data-id='"+ item.id +"'> <i class='ace-icon fa fa-trash-o bigger-120'></i> 删除 </button>" +
                        "</shiro:hasAnyPermission> </div> </td>" +
                    "</tr>" +

                    "<tr class='detail-row'>" +
                    "<td colspan='8'> <div class='table-detail'> <div class='row'> <div class='col-xs-12 col-sm-2'> <div class='text-center'>" +
                        "<img height='150' class='thumbnail inline no-margin-bottom' alt='头像' style='width: 136px; height: 150px;' src='" + $ctx + "/statics/"+ (item.headImg ? "headImg/"+item.headImg:"assets/avatars/profile-pic.jpg") +"' />" +
                        "<br /> <div class='width-80 label label-info label-xlg arrowed-in arrowed-in-right'> <div class='inline position-relative'> <a class='user-title-label' href='#'> <i class='ace-icon fa fa-circle light-green'></i>" +
                        "&nbsp; <span class='white'>"+ item.username +"</span> </a> </div> </div> </div> </div>" +
                        "<div class='col-xs-12 col-sm-5'> <div class='space visible-xs'></div> <div class='profile-user-info profile-user-info-striped'>" +

                            "<div class='profile-info-row'> <div class='profile-info-name'> 生日 </div> <div class='profile-info-value'> <span>"+ born +"</span> </div> </div>" +
                            "<div class='profile-info-row'> <div class='profile-info-name'> 姓名 </div> <div class='profile-info-value'> <span>"+ realName +"</span> </div> </div>" +
                            "<div class='profile-info-row'> <div class='profile-info-name'> 位置 </div> <div class='profile-info-value'> <i class='fa fa-map-marker light-orange bigger-110'></i> <span> "+ location +"</span> </div> </div>" +
                            "<div class='profile-info-row'> <div class='profile-info-name'> 年龄 </div> <div class='profile-info-value'> <span>"+ age +"</span> </div> </div>" +
                            "<div class='profile-info-row'> <div class='profile-info-name'> 创建时间 </div> <div class='profile-info-value'> <span>"+ item.createTime +"</span> </div> </div>" +
                            "<div class='profile-info-row'> <div class='profile-info-name'> 上次在线 </div> <div class='profile-info-value'> <span>"+ lastOnlineTime +"</span> </div> </div>" +
                            "<div class='profile-info-row'> <div class='profile-info-name'> 关于我 </div> <div class='profile-info-value'> <span>"+ aboutMe +"</span> </div> </div>" +
                        "</div>" +
                    "</div>" +

                    "<shiro:hasAnyPermission name='admin,updateUser'>" +
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

    }

    /*删除信息操作*/
    $("#simple-table").delegate(".deleteUser", "click", function() {
        var id = this.getAttribute("data-id");
        $.modalConfirm("你确定要删除用户吗？", function(isOk) {
            if (isOk) {
                $.post($ctx + "/user/delete", {"id": id}, function(data) {
                    if (data == "success") {
                        $.modalMsg("删除成功!", "success");
                        table.load();
                    } else {
                        $.modalMsg("删除失败，可能是权限不足!", "error");
                    }
                }, 'text');
            }
        });
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
        table.load();
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
            url: $ctx + "/user/getUserPrivilege",
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
            cacheItems: true,
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
                url: $ctx + "/user/getAllPrivilege",
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
            $.post($ctx + "/user/updateUserPrivilege",{id: tree.attr("data-id"), privilegeIds: update_data_str}, function(data) {
                if (data == "success") {
                    $.modalMsg("提交成功!", "success");
                    table.load();
                    update_data = [];
                } else {
                    $.modalMsg("提交失败，可能是权限不足!", "error");
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
        $.post($ctx + "/user/insertUser", param, function(data) {
            if (data == "success") {
                $.modalMsg("添加成功","success");
                /*重置表单*/
                $("#insert-user-cancel").click();
                /*重载数据*/
                table.load();
            } else if (data == "fail") {
                $.modalMsg("添加失败","error");
            } else {
                $.modalMsg("返回数据异常","error");
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
            $.post($ctx + "/login/isUnique", {username: $this.val()}, function(data) {
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
        $.post($ctx + "/user/findUserById", {id: id}, function(data) {
            layer.confirm(
                "<form class='form-horizontal' id='user-form-update' style='height: 120px;'>" +
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
                {
                    area: '480',
                    title: "修改用户信息",
                    btn: ['确认', '取消'],
                    btnclass: ['btn btn-primary', 'btn btn-danger'],
                }, function () {
                    /*如果提交*/
                    var id = $("#userId-update");
                    var level = $("#level-update");
                    var state = $("#state-update");
                    var user_data = {};
                    user_data["id"] = id.val();
                    if (level.val()) user_data["level"] = level.val();
                    if (state.val()) user_data["state"] = state.get(0).checked ? 1 : 0;
                    $.post($ctx + "/user/updateCoreUser", user_data, function(data) {
                        if (data == "success") {
                            $.modalMsg("修改成功", "success");
                            table.load();
                        } else {
                            $.modalMsg("修改失败", "error");
                        }
                    }, "text");
                }
                // , function () {
                //     $.modalMsg("已取消", "success", 1000);
                // }
            );
        }, "json");
    });

    $("body").delegate("#state-update", "change", check_change);

});