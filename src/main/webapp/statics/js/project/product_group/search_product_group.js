var prefix = $ctx + "/productGroup";

window.onload = function() {
    loading();
};

function loading() {
    var columns = [
        {
            title : '分组名称',
            field : 'name',
            formatter : function(row, index) {
                if(row.icon == null || row == "") {
                    return row.name;
                } else {
                    return '<i class="' + row.icon + '"></i> <span class="nav-label">' + row.name + '</span>';
                }
            }
        },
        {
            title : '操作',
            align : 'center',
            formatter : function(row, index) {
                var actions = [];
                actions.push('<a class="btn btn-primary btn-sm ' + editFlag + '" href="#" title="编辑" mce_href="#" onclick="edit(\'' + row.id + '\')"><i class="fa fa-edit"></i></a> ');
                actions.push('<a class="btn btn-primary btn-sm ' + addFlag + '" href="#" title="新增" mce_href="#" onclick="add(\'' + row.id + '\')"><i class="fa fa-plus"></i></a> ');
                actions.push('<a class="btn btn-warning btn-sm ' + removeFlag + '" href="#" title="删除" mce_href="#" onclick="remove(\'' + row.id + '\')"><i class="fa fa-remove"></i></a>');
                return actions.join('');
            }
        }];
    var url = prefix + "/list";
    $.initTreeTable('id', 'parentId', columns, url, false, handleHeight);
}

/*分组管理-新增*/
function add(id) {
    var url = prefix + '/toInsertPage/' + id;
    layer_showAuto("新增分组", url);
}

/*分组管理-修改*/
function edit(id) {
    var url = prefix + '/toUpdatePage/' + id;
    layer_showAuto("修改分组", url);
}

/*分组管理-删除*/
function remove(id) {
    layer.confirm("确定要删除分组吗，这样将会删除分组下的商品？",{icon: 3, title:'提示'},function(index){
        $.ajax({
            type : 'post',
            url: prefix + "/deleteProductGroup/" + id,
            success : function(r) {
                if (r.code == 0) {
                    layer.msg(r.msg, { icon: 1, time: 1000 });
                    loading();
                } else {
                    layer.alert(r.msg, { icon: 2, title: "系统提示" });
                }
            },
            dataType: "json"
        });
    });
}
