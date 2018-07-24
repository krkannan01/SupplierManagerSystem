$("#form-product-add").validate({
	rules:{
		name:{
			required:true,
			/*remote: {
                url: $ctx + "system/dept/checkDeptNameUnique",
                type: "post",
                dataType: "json",
                data: {
                	"deptName" : function() {
                        return $("input[name='deptName']").val();
                    }
                },
                dataFilter: function(data, type) {
                    if (data == "0") return true;
                    else return false;
                }
            }*/
		},
		unit:{
			required:true
		},
        price:{
            required:true,
            digits:true
        },
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
        }
    },
	submitHandler:function(form){
		update();
		return false;
	}
});

function update() {
    var data = {};

    data["name"] = $("input[name=name]").val();
    data["size"] = $("input[name=size]").val();
    data["brandId.name"] = $("input[name=brand]").val();
    data["technicalParam"] = $("input[name=param]").val();
    data["unit"] = $("input[name=unit]").val();
    data["unitprice"] = $("input[name=price]").val();
    data["comment"] = $("input[name=comment]").val();
    data["groupId.id"] = $("select[name=group]").val();
    data["enterpriseId.id"] = $("select[name=enterprise]").val();

    console.log(data);
    var config = {
        url: $ctx + "/product/insertProduct",
        type: "post",
        dataType: "json",
        data: data,
        success: function(result) {
            console.log(result);
        }
    };
    $.ajax(config)
}