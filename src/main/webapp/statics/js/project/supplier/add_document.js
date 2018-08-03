jQuery(function($) {

    // 初始化选择框
    initDocumentTypeSelectBox($("select[name=type]"));

    // 绑定表单验证
    $("#form-document-add").validate({
        rules:{
            name:{
                required:true,
            },
            type:{
                required:true
            },
            appendix:{
                required:true
            }
        },
        messages: {
            "name": {
                required: "文档名称不能为空"
            },
            "type": {
                required: "文档类型不能为空"
            },
            "appendix": {
                required: "文档附件不能为空"
            }
        },
        submitHandler:function(form){
            add();
            return false;
        }
    });
});

// 初始化文档类型选择框
function initDocumentTypeSelectBox(el) {
    var $el = $(el);
    var data = {};
    var success = false;
    // 加载数据
    $.ajax({
        url: $ctx + "/documentType/getDocumentTypeList",
        type: "GET",
        dataType: "JSON",
        async: false,
        success: function(result) {
            success = true;
            data = result;
        }
    });
    // 组装内容
    var html = "";
    if (data != null && data.rows != null && data.rows.length > 0) {
        var rows = data.rows;
        for (var i=0; i<rows.length; i++) {
            html += "<option value='"+ rows[i].id+"'>"+ rows[i].name +"</option>";
        }
    } else {
        html = "<option value='0'>无</option>";
    }
    $el.html(html);
}

function add() {
    var formdata = new FormData();
    formdata.append("name", $("input[name=name]").val());
    formdata.append("type.id", $("select[name=type]").val());
    formdata.append("description", $("input[name=description]").val());
    formdata.append("supplierId", parent.supplierId);
    formdata.append("appendixFile", $("input[name=appendix]")[0].files[0]);
    $.ajax({
        url: $ctx + "/document/insertDocument",
        type: 'POST',
        cache: false,
        data: formdata,
        processData: false,
        contentType: false,
        dataType:"json",
        error : function(request) {
            $.modalAlert("系统错误", "error");
        },
        success : function(data) {
            if (data && data.code == 0) {
                parent.layer.msg("添加成功,正在刷新数据请稍后……",{icon:1,time: 500,shade: [0.1,'#fff']},function(){
                    $.parentReload();
                });
            } else {
                $.modalAlert(data.msg, "error");
            }
        }
    });
}