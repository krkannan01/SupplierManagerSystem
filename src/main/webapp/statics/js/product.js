/**
 * Created by xietao on 2018/4/27.
 */

/*ProductGroup == 验证分组名称是否存在
 * param
 *   name: 分组名称
 * return boolean
 *   true: 已存在
 *   false: 不存在*/
function product_group_unique(name) {
    if (!name) return true;
    var unique = false;
    /*验证该分组名称是否已存在*/
    $.ajax({
        url: path + "/productGroup/unique",
        type: "POST",
        data: {name: name},
        dataType: "TEXT",
        async: false,
        success: function(data) {
            if (data == "true" || data == true) {
                unique = true;
            }
        }
    });
    return unique;
}

/*加载品牌列表数据*/
function get_brand_by_group_ids(id_str) {
    var result = "";
    $.ajax({
        url: path + "/product/getBrandByGroupId",
        type: "POST",
        dataType: "JSON",
        async: false,
        data: {groupIds: id_str ? id_str : ""},
        success: function(data) {
            if (data != null && data.length > 0) {
                $.each(data, function(index, item) {
                    result += "<li data-value='"+ item.id +"'>"+ item.name +"</li>";
                });
            } else {
                result += "<li data-value='0'>无</li>";
            }
        }
    });
    return result;
}

/*绑定将placeholder属性转换成value属性的方法*/
function bind_placeholder_to_value($el) {
    $el = $($el);
    $el.unbind("focus", "blur");
    $el.bind({
        "focus": function() {
            if (!$el.val()) $el.val($el.attr("placeholder"));
        },
        "blur": function() {
            if ($el.val() == $el.attr("placeholder")) $el.val("");
        }
    });
}

/*初始化是现实的最大子项数*/
const MORE_LI_COUNT = 12

/*返回是否超过最大子项数*/
function has_more(group) {
    return $(group).find("li").length > MORE_LI_COUNT;
}

/*返回超过最大子项数的元素LI*/
function get_more(group) {
    return $(group).find("li:gt("+ (MORE_LI_COUNT-1) +")");
}

/*重置所有激活样式(active)*/
function li_reset(group) {
    $(group).find("li").each(function(index, item) {
        $(item).removeClass("active");
    });
}

/*获取所有激活的选项*/
function get_active(group) {
    var this_group_ids = "";
    $(group).find("li.active").each(function(index, item) {
        this_group_ids += item.getAttribute("data-value") + ",";
    });
    return this_group_ids;
}

/*设置单选模式*/
function set_single_selection(group, callback_param, callback) {
    var $group = $(group);
    var param_name = $group.attr("data-name");
    $group.find("li").each(function(index, item) {
        var $li = $(item);
        $li.unbind("click");
        $li.click(function() {
            $li.prevAll("li").removeClass("active");
            $li.nextAll("li").removeClass("active");
            $li.toggleClass("active");
            set_badge(group);
            //发送请求
            if ($li.hasClass("active")) callback_param[param_name] = $li.attr("data-value");
            else callback_param[param_name] = null;
            callback();
        });
    });
}
/*设置多选模式*/
function set_multiple_selection(group) {
    $(group).find("li").each(function(index, item) {
        var $li = $(item);
        $li.unbind("click");
        $li.click(function() {
            $li.toggleClass("active");
            set_badge(group);
        });
    });
}

/*设置徽章图标*/
function set_badge(group) {
    var $group = $(group);
    var select_count = $group.find("li.active").length;
    var $head = $group.find(".group-head");
    var $badge = $head.find("span");
    if (select_count > 0) {
        $badge.length ? $badge.text(select_count):$head.append("<span class='badge badge-grey'>"+ select_count +"</span>");
    } else {
        if ($badge) $badge.remove();
    }
}

/*初始化group样式*/
function init_group(group) {
    var $group = $(group);
    if (has_more($group)) {
        var $show_more = $group.find(".show-more");
        if (!$show_more.length) {
            $group.find(".group-foot").append("<span class='show-more'>更多</span>");
            $show_more = $group.find(".show-more");
        } else {
            $show_more.show();
        }
        get_more($group).hide();
        $show_more.unbind("click");
        $show_more.click(function() {
            var $this = $(this);
            if ($this.hasClass("active")) {
                /*隐藏*/
                get_more($group).hide();
                $(this).removeClass("active");
                $(this).text("更多");
            } else {
                /*显示*/
                get_more($group).show();
                $(this).addClass("active");
                $(this).text("收起");
            }
        });
    } else {
        $group.find(".show-more").hide();
    }
}

/*企业搜索下拉框渲染*/
function init_enterprise($el) {
    $el = $($el);
    var html = "<option value='0'></option>";
    //加载数据
    $.ajax({
        url: path + "/enterprise/getEnterpriseIdAndName",
        type: "POST",
        dataType: "JSON",
        async: false,
        success: function(data) {
            if (data != null && data.length > 0) {
                for (var i=0; i<data.length; i++) {
                    html += "<option value='"+ data[i].key +"'>"+ data[i].value +"</option>";
                }
            }
        }
    });
    $el.html(html);
    //渲染
    if(!ace.vars['touch']) {
        $el.chosen({
            allow_single_deselect:true,
            width:424 + 'px'
        });
    }
}

