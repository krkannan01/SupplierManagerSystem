<%--
  Created by IntelliJ IDEA.
  User: xietao
  Date: 2018/4/20
  Time: 16:30
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form class="form-horizontal" id="product-form" style="height: 385px;">
<input id="productId" value="" style="display:none;"/>
<div class="col-sm-12">
<div class="form-group has-warning">
<label for="name" class="col-sm-2 control-label no-padding-right">产品名称：</label>
<div class="col-sm-7">
<span class="block input-icon input-icon-right">
<input type="text" id="name" placeholder="" class="width-100" />
<i class="ace-icon fa fa-info-circle" title="必填项"></i>
</span>
</div>
<div class="help-block col-sm-reset inline"></div>
</div>
</div>

<div class="col-sm-6 col-xs-12">
<div class="form-group has-success">
<label for="size" class="col-sm-4 control-label no-padding-right">产品规格：</label>
<div class="col-sm-7">
<input type="text" id="size" placeholder="" class="width-100" />
</div>
<div class="help-block col-sm-reset inline"></div>
</div>
</div>

<div class="col-sm-6 col-xs-12">
<div class="form-group has-success">
<label for="brand" class="col-sm-3 control-label no-padding-right">产品品牌：</label>
<div class="col-sm-7">
<input type="text" id="brand" placeholder="" class="width-100" />
</span>
</div>
<div class="help-block col-sm-reset inline"></div>
</div>
</div>

<div class="col-sm-6 col-xs-12">
<div class="form-group has-warning">
<label for="unit" class="col-sm-4 control-label no-padding-right">产品单位：</label>
<div class="col-sm-7">
<span class="block input-icon input-icon-right">
<input type="text" id="unit" placeholder="" class="width-100" />
<i class="ace-icon fa fa-info-circle" title="必填项"></i>
</span>
</div>
<div class="help-block col-sm-reset inline"></div>
</div>
</div>

<div class="col-sm-6 col-xs-12" style="margin-bottom: 18px;">
<div class="form-group has-warning">
<label for="unitprice" class="col-sm-3 control-label no-padding-right">产品单价：</label>
<div class="col-sm-7">
<span class="block input-icon input-icon-right">
<input type="text" id="unitprice" placeholder="" class="width-100" />
<i class="ace-icon fa fa-info-circle" title="必填项"></i>
</span>
<label style="color: orange; position: absolute;">单价只能输入数字和[.]</label>
</div>
<div class="help-block col-sm-reset inline"></div>
</div>
</div>

<div class="col-sm-12">
<div class="form-group has-success">
<label for="technicalParam" class="col-sm-2 control-label no-padding-right">技术参数：</label>
<div class="col-sm-7">
<textarea class="form-control limited" id="technicalParam" placeholder="" maxlength="500"></textarea>
</div>
<div class="help-block col-sm-reset inline"></div>
</div>
</div>

<div class="col-sm-12">
<div class="form-group has-success">
<label for="comment" class="col-sm-2 control-label no-padding-right">备注：</label>
<div class="col-sm-7">
<textarea class="form-control limited" id="comment" placeholder="" maxlength="500"></textarea>
</div>
<div class="help-block col-sm-reset inline"></div>
</div>
</div>

<div class="col-sm-12">
  <div class="form-group has-warning">
    <label for="supplier" class="col-sm-2 control-label no-padding-right">供应商：</label>
    <div class="col-sm-7">
      <select class="chosen-select form-control" id="supplier" data-placeholder="">
        <option value="0"></option>
      </select>
    </div>
    <div class="help-block col-sm-reset inline"></div>
  </div>
</div>

<div class="col-sm-12">
<div class="form-group has-warning">
<label for="group" class="col-sm-2 control-label no-padding-right">产品分组：</label>
<div class="col-sm-6">
<select class="chosen-select form-control" id="group">
<option value="0"></option>
</select>
</div>
<div class="help-block col-sm-reset inline"></div>
</div>
</div>

</form>