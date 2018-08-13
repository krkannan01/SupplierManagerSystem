/* 备注：
 * 给js绑定方法有两种做法
 * 一种是在函数内部使用 this.a = function() {}; 绑定
 * 另一种是通过 Table.prototype.a = function() {}; 绑定
 * 一般推荐使用第二种
 * 因为前者是给实例绑定方法，也就是在每次实例的时候都会创建一个方法，这个方法只属于该实例，显然这是非常浪费性能的选择
 * 而后者是把方法绑定在函数上，也就是函数的原生方法，也就是说该函数的每个实例都是在共用函数的原生方法 */

/*表格组件*/
function Table(obj) {
    this.table = obj.table;//表格对象 type:jQuery对象
    this.dataUrl = obj.dataUrl;//数据接口 type:字符串
    this.params = obj.params;//相关参数 type:对象
    this.pagination = null;//分页组件 type:实例
    this.render = obj.render;//表格渲染方法 type:方法
    this.buttons = obj.buttons;//功能按钮 type:字符串
    this.extraCallback = obj.extraCallback;//额外的回调 type:方法

    this.init();
}
// 初始化
Table.prototype.init = function() {
    // 添加加载图标
    this.table.after("<label style='z-index: 2; font-size: 18px; position: absolute; left: 48%; top: 48%;'><i class='ace-icon fa fa-spinner fa-spin orange bigger-125'></i></label>");
    // 追加分页内容
    this.table.next().after("<div class='' style='background-color: #EFF3F8; padding: 5px;'>" +
        "<div class='row'>" +
        this.buttons +
        "    <!--center-->" +
        "    <div class='col-sm-7 col-xs-12'>" +
        "        <table style='margin: 0 auto;'>" +
        "            <tr>" +
        "                <td>" +
        "                    <button class='btn btn-sm btn-white btn-primary' id='maxPrev' title='第一页'> <i class='ace-icon fa fa-angle-double-left'></i> </button>" +
        "                    <button class='btn btn-sm btn-white btn-primary' id='prev' title='上一页'> <i class='ace-icon fa fa-angle-left'></i> </button>" +
        "                </td>" +
        "                <td>" +
        "                    &nbsp;&nbsp;&nbsp; 当前第 <input type='text' class='number-box' id='currentPage' value='1' style='width: 100px;' /> 页 - 共 <label id='maxPage'>10</label> 页 &nbsp;&nbsp;&nbsp;" +
        "                </td>" +
        "                <td>" +
        "                    <button class='btn btn-sm btn-white btn-primary' id='next' title='下一页'> <i class='ace-icon fa fa-angle-right'></i> </button>" +
        "                    <button class='btn btn-sm btn-white btn-primary' id='maxNext' title='最后一页'> <i class='ace-icon fa fa-angle-double-right'></i> </button>" +
        "                </td>" +
        "                <td>" +
        "                    &nbsp;&nbsp;&nbsp; 每页显示 <input type='text' id='pageSize' /> 条记录" +
        "                </td>" +
        "            </tr>" +
        "        </table>" +
        "    </div>" +
        "    <!--right-->" +
        "    <div class='col-sm-2 col-xs-12'>" +
        "        <div style='text-align: right; height: 34px; padding: 5px;'>显示 <label id='start'>1</label> - <label id='end'>10</label> 共 <label id='maxCount'>23</label></div>" +
        "    </div>" +
        "</div>" +
        "</div>");

    //获取分页对象
    this.pagination = new Pagination({
        maxPrev: $("#maxPrev"),//第一页
        prev: $("#prev"),//上一页
        next: $("#next"),//下一页
        maxNext: $("#maxNext"),//最后一页
        maxPage: $("#maxPage"),//最大页数
        start: $("#start"),//记录起点
        end: $("#end"),//记录结束点
        maxCount: $("#maxCount"),//最大记录数
        currentPage: $("#currentPage"),//当前页数
        pageSize: $("#pageSize")//页面容量
    });
    //绑定分页事件
    this.pagination.bindGoPage(this);

    /*渲染每页条数框*/
    var self = this;
    this.pagination.pageSize.ace_spinner({value:10,min:5,max:100,step:5, btn_up_class:'btn-info' , btn_down_class:'btn-info'})
        .closest('.ace-spinner')
        .on('changed.fu.spinbox', function(){
            /*检查页码状态，设置参数，发送请求*/
            self.params.pageSize = self.pagination.pageSize.val();
            self.load();
        });

    /*绑定当前页输入框的改变事件*/
    this.pagination.currentPage.on("change", function() {
        /*设置参数，发送请求*/
        self.params.currentPage = self.pagination.currentPage.val();
        self.load();
    });
    
}
// 显示加载图标
Table.prototype.showLoad = function() {
    var load = this.table.next();
    var parent = this.table.parent();
    this.table.css("opacity", 0.5);
    load.css("display", "block");
    load.css("top", this.table.offset().top - parent.offset().top + this.table.height()/2 + "px");
}
// 隐藏加载图标
Table.prototype.hideLoad = function() {
    var load = this.table.next();
    this.table.css("opacity", "");
    load.css("display", "none");
}
// 请求数据方法
Table.prototype.load = function(param) {

    if (!param) param = this.params;

    /*显示加载图标*/
    this.showLoad();

    var table_data = null;
    var success = false;
    var self = this;
    $.ajax({
        url: this.dataUrl,
        type: "GET",
        dataType: "JSON",
        data: param,
        async: false,
        success: function (data) {
            table_data = data;
            success = true;
            /*隐藏加载图标*/
            self.hideLoad();
        }
    });
    if (success)
        self.render(table_data);
    else
        $.modalMsg("请求出现错误, 重试一下吧！", "error");

    // 判断是否需要额外的回调事件
    if (this.extraCallback)
        this.extraCallback(param);
}


/*分页组件*/
function Pagination(props) {
    this.maxPrev = props.maxPrev;//第一页
    this.prev = props.prev;//上一页
    this.next = props.next;//下一页
    this.maxNext = props.maxNext;//最后一页
    this.maxPage = props.maxPage;//最大页数
    this.start = props.start;//记录起点
    this.end = props.end;//记录结束点
    this.maxCount = props.maxCount;//最大记录数
    this.currentPage = props.currentPage;//当前页数
    this.pageSize = props.pageSize;//页面容量
}
Pagination.prototype.commonPageOperation = function(val) {
    this.currentPage.val(val);
    return val;
}
Pagination.prototype.click_max_prev = function() {
    return this.commonPageOperation(1);
};
Pagination.prototype.click_prev = function() {
    return this.commonPageOperation(Number(this.currentPage.val()) - 1);
};
Pagination.prototype.click_next = function() {
    return this.commonPageOperation(Number(this.currentPage.val()) + 1);
};
Pagination.prototype.click_max_next = function() {
    return this.commonPageOperation(this.maxPage.html());
};

/*检查页码范围与禁用状态*/
Pagination.prototype.checkRange = function() {
    /*范围检查*/
    if (this.currentPage.val() > Number(this.maxPage.html())) {
        this.currentPage.val(this.maxPage.html());
    } else if (this.currentPage.val() < 1) {
        this.currentPage.val(0);
    }
    /*判断是否禁用向前翻页*/
    if (this.currentPage.val() <= 1) {
        this.currentPage.val(1);
        this.maxPrev.get(0).disabled = true;
        this.prev.get(0).disabled = true;
    } else {
        this.maxPrev.get(0).disabled = false;
        this.prev.get(0).disabled = false;
    }
    /*判断是否禁用向后翻页*/
    if (this.currentPage.val() >= Number(this.maxPage.html())) {
        this.currentPage.val(this.maxPage.html());
        this.maxNext.get(0).disabled = true;
        this.next.get(0).disabled = true;
    } else {
        this.maxNext.get(0).disabled = false;
        this.next.get(0).disabled = false;
    }
}

/*检查页码状态方法*/
Pagination.prototype.checkPageState = function() {
    /*检查数据*/
    var tempMaxCountValue = Number(this.maxCount.html());
    var tempPageSizeValue = Number(this.pageSize.val());
    /*设置最大页数*/
    var temp = Math.ceil(tempMaxCountValue / tempPageSizeValue);
    this.maxPage.html(temp < 1 ? 1 : temp);
    /*检查页码范围*/
    this.checkRange();
    var tempCurrentPageValue = Number(this.currentPage.val());
    /*设置起始记录数*/
    temp = tempCurrentPageValue * tempPageSizeValue - tempPageSizeValue + 1;
    this.start.html(temp > tempMaxCountValue ? tempMaxCountValue : temp);
    /*设置结束记录数*/
    temp = tempCurrentPageValue * tempPageSizeValue;
    this.end.html(temp > tempMaxCountValue ? tempMaxCountValue : temp);
}

/*设置页码，发送请求*/
Pagination.prototype.goPage = function(table, val) {
    table.params.currentPage = val;
    table.load();
}
/*绑定分页事件*/
Pagination.prototype.bindGoPage = function(table) {
    var self = this;
    self.maxPrev.click(function () {
        self.goPage(table, self.click_max_prev());
    });
    self.prev.click(function () {
        self.goPage(table, self.click_prev());
    });
    self.next.click(function () {
        self.goPage(table, self.click_next());
    });
    self.maxNext.click(function () {
        self.goPage(table, self.click_max_next());
    });
}