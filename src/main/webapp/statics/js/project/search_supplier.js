jQuery(function($) {

    /*加载企业分组信息*/
    $.post($ctx + "/enterprise/getTradeGroup",function(data) {
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
    var operateRange = $("#operateRange");
    var uccCode = $("#uccCode");
    var fullName = $("#fullName");
    var groups = ".center [class*='col-'] div";//该对象比较特殊，是有js动态生成，所以决定用字符串保存选择器，稍后用delegate方法进行绑定事件
    var notIncludeException = $("#notIncludeException");
    var currentPage = $("#currentPage");
    var pageSize = $("#pageSize");
    var sort = $(".sort-level");

    var operateRangeValue = null;/*经营范围参数*/
    var uccCodeValue = null;/*主营产品参数*/
    var fullNameValue = null;/*全称参数*/
    var groupsValue = null;/*分组参数*/
    var includeExceptionValue = false;/*不包含异常信息参数*/
    var currentPageValue = 1;/*当前页参数*/
    var pageSizeValue = 10;/*每页条数参数*/
    var unionSearchValue = false;/*是否交集查询*/
    var sortValue = null;/*排序的字段*/
    var sortedValue = "desc";/*排序的顺序*/

    var defaultParams = {};
    initParam(defaultParams);

    /*参数初始化方法*/
    function initParam() {

        defaultParams = {
            "operateRange": operateRangeValue,
            "uccCode": uccCodeValue,
            "fullName": fullNameValue,
            "groups": groupsValue,
            "includeException": includeExceptionValue,
            "currentPage": currentPageValue,
            "pageSize": pageSizeValue,
            "unionSearch": unionSearchValue,
            "sort": sortValue,
            "sorted": sortedValue
        };
        operateRange.val("");
        //TODO 暂不清楚为什么不能直接用定义好的uccCode对象，可能是有多个造成混淆，待处理
        $("#uccCode").val("");
        fullName.val("");
        $(groups).each(function(index, element) {
            $(element).addClass("select");
        });
        notIncludeException.get(0).checked = false;
        currentPage.val(currentPageValue);
        pageSize.val(pageSizeValue);
        sort.removeClass("active").removeClass("active-up").removeClass("active-down");
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
        } else {
            currentPage.val(defaultParams.currentPage);
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


    /*全选*/
    $('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
        var th_checked = this.checked;//checkbox inside "TH" table header

        $(this).closest('table').find('tbody > tr').each(function(){
            var row = this;
            if(th_checked) $(row).addClass("success").find('input[type=checkbox]').eq(0).prop('checked', true);
            else $(row).removeClass("success").find('input[type=checkbox]').eq(0).prop('checked', false);
        });

    });

    /*复选框单击事件*/
    $('#simple-table').delegate('tbody .trbox', 'click', function(event){
        var doc = $(this).find("input[type=checkbox]").get(0);
        if (doc.checked) {
            doc.checked = false;
            $(this).closest("tr").removeClass("success");
            $("#simple-table").find("thead input[type=checkbox]").prop("checked", false);
        } else {
            doc.checked = true;
            $(this).closest("tr").addClass("success");
            handleIsAllSelect("#simple-table");
        }
        // 阻止事件冒泡和默认行为
        event.stopPropagation();
        event.preventDefault();
    });


    /*行单击事件*/
    $('#simple-table').delegate('tbody > tr', 'click', function(){
        // 全部取消选中
        $("#simple-table").find('tbody input[type=checkbox]').each(function(index, item) {
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

    /*分组项的单击事件*/
    $("#member-tab").delegate(groups, "click", function (){
        var isSupportMutliChecked = $("#isSupportMutliChecked").get(0);
        if (!isSupportMutliChecked.checked) {
            $(groups).each(function(index, element) {
                if($(element).hasClass("select"))
                    $(element).removeClass("select");
            });
        }
        $(this).toggleClass("select");
        var idArr = "";
        var temp = 0;
        $(groups).each(function(index, element) {
            if($(element).hasClass("select")) {
                idArr += element.getAttribute("data-groupId")+",";
            }
        });
        defaultParams.groups = idArr;
        sendRequest();
    });

    /*添加排除筛选的单击事件，修改参数并发送请求*/
    notIncludeException.click(function() {
        defaultParams.includeException = $(this).get(0).checked;
        sendRequest();
    });

    /*实现基本筛选的功能*/
    $("#startSearch").click(function() {
        defaultParams.operateRange = operateRange.val();
        defaultParams.uccCode = uccCode.val();
        defaultParams.fullName = fullName.val();
        sendRequest();
    });

    /*刷新*/
    $("#refresh").click(function() {
        sendRequest();
    });

    /*重载*/
    $("#reload").click(function() {
        location.href = $ctx + "/enterprise/toSearchSupplier";
    });

    /*删除选中行*/
    $("#allDelete").click(function() {
        if ($("#simple-table > tbody > tr > td input[type=checkbox]:checked").length < 1) {
            $.modalMsg("您还没有选中要删除的数据呢", "success");
            return;
        }

        $.modalConfirm("你将删除选中的所有企业的数据，确定吗？", function() {
            // 获取选中的id
            var ids = "";
            $("#simple-table > tbody > tr > td input[type='checkbox']").each(function(index, element) {
                if (element.checked) {
                    ids += element.getAttribute("data-id")+",";
                }
            });
            // 设置ajax配置
            var config = {
                url: $ctx + "/enterprise/mutliDelete",
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

    /*绑定三个条件输入框的回车事件*/
    $("#fullName,#uccCode,#operateRange").on("keypress", function(event) {
        if (event.keyCode == 13) {
            $("#startSearch").click();
        }
    });

    /*绑定信用级别排序事件*/
    sort.click(function() {
        if (!$(this).hasClass("active")) {
            $(this).addClass("active").addClass("active-down");
            defaultParams.sort = "level";
        } else {
            if ($(this).hasClass("active-down")) {
                $(this).removeClass("active-down").addClass("active-up");
                defaultParams.sorted = "asc"
            } else {
                $(this).removeClass("active-up").addClass("active-down");
                defaultParams.sorted = sortedValue;
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
        var load = $("#loadAnimate");
        var prev = load.prev();

        /*显示加载图标*/
        load.css("display", "block");
        prev.css("display", "none");

        var table_data = null;
        var success = false;
        $.ajax({
            url: $ctx + "/enterprise/search",
            type: "POST",
            dataType: "JSON",
            data: param,
            async: false,
            success: function (data) {
                table_data = data;
                success = true;

                /*隐藏加载图标*/
                load.css("display", "none");
                prev.css("display", "block");
            }
        });

        if (success)
            render(table_data);
        else
            $.modalMsg("请求出现错误, 重试一下吧！", "error");
    }

    /*根据新数据重新渲染表格*/
    function render(data) {
        var content = "";
        if (data.rows != null && data.rows.length > 0) {

            // 1. 检查页码
            maxCount.html(data.count);
            checkPageState();

            // 2. 计算编号 （当前页数 - 1） * 每页数量 + 1 == 当前第一条记录的编号
            var startNo = (Number($("#currentPage").val()) - 1) * Number($("#pageSize").val()) + 1;
            startNo == NaN ? 1 : startNo;

            // 3. 组装内容
            var colorArray = [" label-success", " label-warning", ""];
            /*拼接字符串*/
            $.each(data.rows, function (index, item) {

                /*var websiteHtml = "<span class='red'>无</span>";
                if (item.website) {
                    var temp_website = item.website;
                    if (item.website.indexOf("http://") == -1) {
                        temp_website = "http://" + item.website;
                    }
                    websiteHtml = "<a href='" + temp_website + "'>" + temp_website + "</a>";
                }*/

                var fullNameHtml = convert_href_html(item.fullName, false, $ctx + '/enterprise/getEnterpriseById?id=' + item.id, 'table-a');
                var websiteHtml = convert_href_html(item.website, true, item.website, 'table-a');

                var color = colorArray[Math.floor(Math.random() * colorArray.length)];
                var tradeGroupIdHtml = "<span class='label label-sm" + color + "'>" + item.tradeGroupId.name + "</span>"

                content += "<tr>" +
                    "<td class='center trbox'>" +
                    "<label class='pos-rel'>" +
                    "<input type='checkbox' data-id='" + item.id + "' class='ace' />" +
                    "<span class='lbl'></span>" +
                    "</label>" +
                    "</td>" +
                    "<td class='center'>" +
                    "<label>"+ startNo++ +"</label>" +
                    "</td>" +
                    "<td>"+ fullNameHtml +"</a></td>" +
                    "<td>"+ websiteHtml +"</a></td>" +
                    "<td>" + item.uCCcode + "</td>" +
                    "<td><div class='rating inline' data-score='"+ item.level +"'></div></td>" +
                    "<td>" + item.mainProduct + "</td>" +

                    "<td>" +
                    tradeGroupIdHtml +
                    "</td>" +

                    "<td>" +
                    "<div class='hidden-sm hidden-xs action-buttons'>" +
                    "<a class='blue' href= '" + $ctx + "/enterprise/getEnterpriseById?id="+ item.id +"' target='view_window' title='查看详情'>" +
                    "<i class='ace-icon fa fa-search-plus bigger-130'></i>" +
                    "</a>" +

                    "<shiro:hasAnyPermission name='admin,updateEnterprise'>" +
                    "<a class='green' href= '" + $ctx + "/enterprise/getEnterpriseById?id="+ item.id +"&action=edit' target='view_window' title='编辑'>" +
                    "<i class='ace-icon fa fa-pencil bigger-130'></i>" +
                    "</a>" +
                    "</shiro:hasAnyPermission>" +

                    "<shiro:hasAnyPermission name='admin,deleteEnterprise'>" +
                    "<a class='red deleteDetails' href='javascript: void(0);' title='删除' data-id='"+ item.id +"'>" +
                    "<i class='ace-icon fa fa-trash-o bigger-130'></i>" +
                    "</a>" +
                    "</div>" +
                    "</shiro:hasAnyPermission>" +

                    "<div class='hidden-md hidden-lg'>" +
                    "<div class='inline pos-rel'>" +
                    "<button class='btn btn-minier btn-yellow dropdown-toggle' data-toggle='dropdown' data-position='auto'>" +
                    "<i class='ace-icon fa fa-caret-down icon-only bigger-120'></i>" +
                    "</button>" +

                    "<ul class='dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close'>" +
                    "<li>" +
                    "<a href='" + $ctx + "/enterprise/getEnterpriseById?id="+ item.id +"' class='tooltip-info showDetails' data-rel='tooltip' title='查看详情' data-id='"+ item.id +"'>" +
                    "<span class='blue'>" +
                    "<i class='ace-icon fa fa-search-plus bigger-120'></i>" +
                    "</span>" +
                    "</a>" +
                    "</li>" +

                    "<li>" +
                    "<shiro:hasAnyPermission name='admin,updateEnterprise'>" +
                    "<a href='" + $ctx + "/enterprise/getEnterpriseById?id="+ item.id +"&action=edit' class='tooltip-success editDetails' data-rel='tooltip' title='编辑' data-id='"+ item.id +"'>" +
                    "<span class='green'>" +
                    "<i class='ace-icon fa fa-pencil-square-o bigger-120'></i>" +
                    "</span>" +
                    "</a>" +
                    "</li>" +
                    "</shiro:hasAnyPermission>" +

                    "<li>" +
                    "<shiro:hasAnyPermission name='admin,deleteEnterprise'>" +
                    "<a href='javascript: void(0);' class='tooltip-error deleteDetails' data-rel='tooltip' title='删除' data-id='"+ item.id +"'>" +
                    "<span class='red'>" +
                    "<i class='ace-icon fa fa-trash-o bigger-120'></i>" +
                    "</span>" +
                    "</a>" +
                    "</shiro:hasAnyPermission>" +

                    "</li>" +
                    "</ul>" +
                    "</div>" +
                    "</div>" +
                    "</td>" +
                    "</tr>";
            });
        } else {
            content += "<tr><td colspan='9'><div class='alert alert-warning' style='padding: 5px;margin-bottom: 0;text-align: center;'>没有信息</div></td></tr>";
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
        $.modalConfirm("你将删除跟该企业有关的所有数据，确定吗？", function() {
            var config = {
                url: $ctx + "/enterprise/delete",
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
            url: $ctx + "/enterprise/importExcel",//文件提交地址
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
                    alert(data);
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