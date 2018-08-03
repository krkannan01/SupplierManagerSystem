const get_product_group_list_path = $ctx + "/productGroup/getProductGroupList";
const get_supplier_part_list_path = $ctx + "/supplier/getSupplierIdAndName";

// validate.js 插件的自定义验证方法
jQuery.validator.addMethod("notnull", function (value, element, param) {
    return param ? value : false;
}, $.validator.format("不能为空!"));

jQuery(function($){

    initSelectBox($("select[name=group]"), get_product_group_list_path, handleProductGroupData);
    initSelectBox($("select[name=supplier]"), get_supplier_part_list_path, handleSupplierPartData);

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
            add();
            return false;
        }
    });
});

// 初始化下拉选择框
function initSelectBox(el, requestPath, processorMethod) {
    var $el = $(el);
    var data = {};
    var success = false;
    // 加载数据
    $.ajax({
        url: requestPath,
        type: "GET",
        dataType: "JSON",
        async: false,
        success: function(result) {
            success = true;
            data = result;
        }
    });

    // 处理数据
    var htmlContent = processorMethod(data);
    $el.html(htmlContent);
}

// 处理商品分组数据
function handleProductGroupData(data, prefix, prefix_unit) {
    if (data && data.length > 0) {
        prefix = prefix || "";
        prefix_unit = prefix_unit || "&nbsp;&nbsp;--&nbsp;&nbsp;";
        var html = "";
        $.each(data, function(index, item) {
            html += "<option value='"+ item.id +"'>"+ prefix + item.name +"</option>";
            if (item.children) {
                html += handleProductGroupData(item.children, prefix_unit + prefix, prefix_unit);
            }
        });
        return html;
    } else {
        return "<option value='0'><span class='red'>无信息</span></option>";
    }
}

// 处理供应商数据
function handleSupplierPartData(data) {
    if (data != null && data.length > 0) {
        var html = "";
        for (var i=0; i<data.length; i++) {
            html += "<option value='"+ data[i].key +"'>"+ data[i].value +"</option>";
        }
        return html;
    } else {
        return "<option value='0'><span class='red'>无信息</span></option>";
    }
}

function add() {
    var data = {};

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
        url: $ctx + "/product/insertProduct",
        type: "post",
        dataType: "json",
        data: data,
        success: function(result) {
            if (data && data.code == 0) {
                parent.layer.msg("添加成功,正在刷新数据请稍后……",{icon:1,time: 500,shade: [0.1,'#fff']},function(){
                    $.parentReload();
                });
            } else {
                $.modalAlert(data.msg, "error");
            }
        }
    };
    $.ajax(config)
}