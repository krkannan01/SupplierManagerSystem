const $prefix = $ctx + "/productGroup";

jQuery.validator.addMethod("unique", function (value, element, param) {
    if (!param) return true; // 如果参数为false (unique: false) 的时候,直接通过
    if (element.value == element.getAttribute("placeholder")) return true; // 如果元素的value值等于placeholder值,(没有做修改)直接通过
    var result = false;
    $.ajax({
        url: $prefix + "/unique",
        type: 'get',
        async: false,
        data: { name: $("#name").val() },
        success: function(data) {
            result = !data;
        },
        dataType: "json"
    });
    return result;
}, $.validator.format("该名称已存在!"));

$("#form-product-group-edit").validate({
	rules:{
		name:{
			required:true,
            unique:true
		}
	},
	messages: {
        "name": {
            required: "分组名称不能为空",
            unique: "分组名称已存在"
        }
    },
	submitHandler:function(form){
		update();
	}
});

function update() {
    var config = {
        url: $prefix + "/updateProductGroup",
        type: "post",
        dataType: "json",
        data: $("#form-product-group-edit").serialize(),
        error : function(request) {
            $.modalAlert("系统错误", "error");
        },
        success : function(data) {
            if (data && data.code == 0) {
                parent.layer.msg("修改成功,正在刷新数据请稍后……",{icon:1,time: 500,shade: [0.1,'#fff']},function(){
                    $.parentReload();
                });
            } else {
                $.modalAlert(data.msg, "error");
            }
        }
    };
    $.ajax(config);
}

/*分组管理-修改-选择分组树*/
function selectGroupTree() {
    var parentId = $("#parentId").val().trim();
    var parentName = $("#parentName").val().trim();
	if(parentId > 0) {
        var url = $prefix + "/toGroupTreePage";
        window.groupName = parentName;
        layer_show("选择分组", url, 380, 450, 2);
	} else {
		$.modalAlert("主分组不能修改", "error");
	}
}