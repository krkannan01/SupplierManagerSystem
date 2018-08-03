// validate.js 插件的自定义验证方法
jQuery.validator.addMethod("notnull", function (value, element, param) {
    return param ? value : false;
}, $.validator.format("不能为空!"));

jQuery(function($){

    $("#form-product-add").validate({
        rules:{
            name:{
                required:true
            },
            unit:{
                required:true
            },
            price:{
                required:true,
                digits:true
            },
            supplier:{
                notnull:true
            },
            group:{
                notnull:true
            }
        },
        messages: {
            "name": {
                required: "商品名称不能为空"
            },
            "unit": {
                required: "商品单位不能为空"
            },
            "price": {
                required: "商品单价不能为空",
                digits: "商品单价必须是数值"
            },
            "supplier": {
                notnull: "商品供应商不能为空"
            },
            "group": {
                notnull: "商品分组不能为空"
            }
        },
        submitHandler:function(form){
            update();
            return false;
        }
    });
});

function add() {
    var data = {};

    data["id"] = $id;
    data["name"] = $("input[name=name]").val();
    data["size"] = $("input[name=size]").val();
    data["brandId.name"] = $("input[name=brand]").val();
    data["technicalParam"] = $("input[name=param]").val();
    data["unit"] = $("input[name=unit]").val();
    data["unitprice"] = $("input[name=price]").val();
    data["comment"] = $("input[name=comment]").val();
    data["groupId.id"] = $("select[name=group]").val();
    data["supplierId.id"] = $("select[name=supplier]").val();

    var config = {
        url: $ctx + "/product/updateProduct",
        type: "post",
        dataType: "json",
        data: data,
        success: function(result) {
            if (data && data.code == 0) {
                parent.layer.msg("修改成功,正在刷新数据请稍后……",{icon:1,time: 500,shade: [0.1,'#fff']},function(){
                    $.parentReload();
                });
            } else {
                $.modalAlert(data.msg, "error");
            }
        }
    };
    $.ajax(config)
}