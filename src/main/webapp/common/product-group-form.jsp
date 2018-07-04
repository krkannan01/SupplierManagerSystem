<%--
  Created by IntelliJ IDEA.
  User: xietao
  Date: 2018/4/24
  Time: 14:50
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form class="form-horizontal" id="product-group-form" style="height: 100px;">

    <div class="col-sm-12">
        <div class="form-group has-success">
            <label for="parent" class="col-sm-3 control-label no-padding-right">父级分组：</label>
            <div class="col-sm-7">
                <select class="chosen-select form-control" id="parent">
                    <option value="0">-- 无 --</option>
                </select>
            </div>
            <div class="help-block col-sm-reset inline"></div>
        </div>
    </div>

    <div class="col-sm-12">
        <div class="form-group has-warning">
            <label for="group-name" class="col-sm-3 control-label no-padding-right">分组名称：</label>
            <div class="col-sm-7">
                <span class="block input-icon input-icon-right">
                <input type="text" id="group-name" placeholder="" class="width-100" />
                <i class="ace-icon fa fa-info-circle" title="必填项"></i>
                </span>
            </div>
            <div class="help-block col-sm-reset inline"></div>
        </div>
    </div>

</form>