const $prefix = $ctx + "/productGroup";

$("#form-product-group-add").validate({
	rules:{
		name:{
			required:true,
			remote: {
                url: $prefix + "/unique",
                type: "get",
                dataType: "json",
                data: {
                    name: function() {
                        return $.trim($("#name").val())
                    }
                },
                dataFilter: function(data, type) {
                    return data == "true" ? false : true;
                }
            }
		}
	},
	messages: {
        "name": {
            required: "分组名称不能为空",
            remote: "分组已经存在"
        }
    },
	submitHandler:function(form){
		add();
	}
});

function add() {
    var config = {
        url: $prefix + "/insertProductGroup",
        type: "post",
        dataType: "json",
        data: $("#form-product-group-add").serialize(),
        error : function(request) {
            $.modalAlert("系统错误", "error");
        },
        success : function(data) {
            if (data && data.code == 0) {
                parent.layer.msg("新增成功,正在刷新数据请稍后……",{icon:1,time: 500,shade: [0.1,'#fff']},function(){
                    $.parentReload();
                });
            } else {
                $.modalAlert(data.msg, "error");
            }
        }
    };
    $.ajax(config);
}

/*分组管理-新增-选择分组树*/
function selectGroupTree(groupName) {
    var url = $prefix + "/toGroupTreePage";
    window.groupName = groupName;
    layer_show("选择分组", url, 380, 450, 2);
}