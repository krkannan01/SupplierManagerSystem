/*定义分页函数*/
function Pagination(props) {
    this.maxPrev = props.maxPrev;//第一页
    this.prev = props.prev;//上一页
    this.next = props.next;//下一页
    this.maxNext = props.maxNext;//最后一页
    this.maxPage = props.maxPage;
    this.start = props.start;//记录起点
    this.end = props.end;//记录结束点
    this.maxCount = props.maxCount;//最大记录数
    this.currentPage = props.currentPage;//当前页数
    this.pageSize = props.pageSize;//页面容量

    this.commonPageOperation = function(val) {
        this.currentPage.val(val);
        return val;
    }
    this.click_max_prev = function() {
        return this.commonPageOperation(1);
    };
    this.click_prev = function() {
        return this.commonPageOperation(Number(this.currentPage.val()) - 1);
    };
    this.click_next = function() {
        return this.commonPageOperation(Number(this.currentPage.val()) + 1);
    };
    this.click_max_next = function() {
        return this.commonPageOperation(this.maxPage.html());
    };

    /*检查页码范围与禁用状态*/
    this.checkRange = function() {
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
    this.checkPageState = function() {
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
    this.goPage = function(val, params, callback) {
        params.currentPage = val;
        callback();
    }
}