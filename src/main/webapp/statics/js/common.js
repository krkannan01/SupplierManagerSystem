/**
 * Created by xietao on 2018/4/25.
 */

/*AllForm == 修改验证输入框样式
* param
*   $el: 要修改的document对象|jQuery对象*/
function convert_warning($el, title) {
    $el = $($el);
    $el.closest(".form-group").attr("class", "form-group has-warning");
    $el.next().attr("class", "ace-icon fa fa-info-circle").attr("title", title ? title:"必填项");
}
function convert_success($el, title) {
    $el = $($el);
    $el.closest(".form-group").attr("class", "form-group has-success");
    $el.next().attr("class", "ace-icon fa fa-check-circle").attr("title", title ? title:"通过验证");
}
function convert_error($el, title) {
    $el = $($el);
    $el.closest(".form-group").attr("class", "form-group has-error");
    $el.next().attr("class", "ace-icon fa fa-times").attr("title", title ? title:"名称已存在");
}
function convert_success_clear($el) {
    $el = $($el);
    $el.closest(".form-group").attr("class", "form-group has-success");
    $el.next().attr("class", "").attr("title", "");
}
function convert_success_only($el) {
    $el = $($el);
    $el.closest(".form-group").attr("class", "form-group has-success");
}
function convert_warning_only($el) {
    $el = $($el);
    $el.closest(".form-group").attr("class", "form-group has-warning");
}
function convert_error_only($el) {
    $el = $($el);
    $el.closest(".form-group").attr("class", "form-group has-error");
}

/* 把文本转换成有链接样式的 Html内容.
* str: 需要装换的文本
* isNeedPrefix: 文本是否需要带 http:// 的前缀
* */
function convert_href_html(str, isNeedPrefix, href, cls) {
    if (str) {
        // 给显示的文本加 http:// 前缀
        if (isNeedPrefix && href.indexOf("http://") == -1) {
            href = "http://" + href;
            str = href;
        }
        return "<a href='" + href + "' class='" + cls + "' target='view_window'>" + str + "</a>";
    } else {
        return "<span class='red'>无</span>";
    }
}

/**
 * @method
 * @param tableSelector 要判断表格的选择器.
 * @desc 检查处理表格中的复选框是否全选.
 */
function handleIsAllSelect(tableSelector) {
    var is = true;
    $(tableSelector).find("tbody input[type=checkbox]").each(function(index, item) {

        if (!item.checked) {
            $(tableSelector).find("thead input[type=checkbox]").prop("checked", false);
            is = false;
        }
    });
    if (is)
        $(tableSelector).find("thead input[type=checkbox]").prop("checked", true);
}

/*数字框校验*/
$("body").delegate(".number-box", "keyup", function() {
    this.value = this.value.replace(/[^\d]/g, "");
});

$("body").delegate(".min-box", "keyup", function() {
    var $this = $(this);
    var min_value = $this.attr("data-min-value");
    if (!min_value) min_value = $this.attr("placeholder");
    if (Number($this.val()) < min_value) {
        $this.val(min_value);
    }
});

$("body").delegate(".max-box", "keyup", function() {
    var $this = $(this);
    var max_value = $this.attr("data-max-value");
    if (!max_value) max_value = $this.attr("placeholder");
    if (Number($this.val()) > max_value) {
        $this.val(max_value);
    }
});

/**
 * param 将要转为URL参数字符串的对象
 * key URL参数字符串的前缀
 * encode true/false 是否进行URL编码,默认为true
 *
 * return URL参数字符串
 */
function urlEncode(param, key, encode) {
    if(param==null) return '';
    var paramStr = '';
    var t = typeof (param);
    if (t == 'string' || t == 'number' || t == 'boolean') {
        paramStr += '&' + key + '=' + ((encode==null||encode) ? encodeURIComponent(param) : param);
    } else {
        for (var i in param) {
            var k = key == null ? i : key + (param instanceof Array ? '[' + i + ']' : '.' + i);
            paramStr += urlEncode(param[i], k, encode);
        }
    }
    return paramStr;
};

/**
 * 给 指定表格 绑定 行点击功能 和 复选框点击功能 和 全选功能
 * 行点击时，取消选中所有行，然后选中当前行
 * 复选框点击时，不取消其它行，选中当前行
 * @param tableSelector 表格的选择器 默认 "#simple-table"
 * @param rowSelector 行的选择器 默认 "tbody > tr"
 * @param checkboxSelector 复选框选择器 默认 "tbody > .trbox"
 */
function initTableCheckbox(tableSelector, rowSelector, checkboxSelector) {
    if (!tableSelector) tableSelector = "#simple-table";
    if (!rowSelector) rowSelector = "tbody > tr";
    if (!rowSelector) rowSelector = "tbody > .trbox";

    /*全选*/
    $(tableSelector + ' > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
        var th_checked = this.checked;//checkbox inside "TH" table header

        $(this).closest('table').find('tbody > tr').each(function(){
            var row = this;
            if(th_checked) $(row).addClass("success").find('input[type=checkbox]').eq(0).prop('checked', true);
            else $(row).removeClass("success").find('input[type=checkbox]').eq(0).prop('checked', false);
        });

    });

    /*复选框单击事件*/
    $(tableSelector).delegate('tbody .trbox', 'click', function(event){
        var doc = $(this).find("input[type=checkbox]").get(0);
        if (!doc) return;
        if (doc.checked) {
            doc.checked = false;
            $(this).closest("tr").removeClass("success");
            $(tableSelector).find("thead input[type=checkbox]").prop("checked", false);
        } else {
            doc.checked = true;
            $(this).closest("tr").addClass("success");
            handleIsAllSelect(tableSelector);
        }
        // 阻止事件冒泡和默认行为
        event.stopPropagation();
        event.preventDefault();
    });


    /*行单击事件*/
    $(tableSelector).delegate(rowSelector, 'click', function(){
        if ($(this).children.length == 1) return;
        // 全部取消选中
        $(tableSelector).find('tbody input[type=checkbox]').each(function(index, item) {
            item.checked = false;
            $(item).closest("tr").removeClass("success");
        });
        // 被点击行选中
        var box = $(this).find("input[type=checkbox]").get(0);
        box.checked = true;
        $(this).addClass("success");
        // 处理是否全选
        handleIsAllSelect(tableSelector);
    });
}

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

/*给String添加原生方法display 用于判断文本是否需要显示*/
String.prototype.display = function(is) {
    return is ? this.toString() : "";
}
