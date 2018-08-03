<%@ page import="cn.xt.sms.entity.Supplier" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id="", UCCcode="", fullName="", type="", legalRepresentative="", website="", simpleName="", foundDate="", registeredCapital="",
            registerDepartment="", approvalDate="", registerState="", mainProduct="", businessDeadlineGo="", businessDeadlineTo="",
            level = "3", tradeGroup="", address="", operateRange="", exceptionInfo="", dangerInfo="", comment="";

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Supplier ep = (Supplier)request.getAttribute("supplier");
    if (ep != null) {
        if (ep.getId() != null) id = ep.getId().toString();
        if (ep.getUCCcode() != null) UCCcode = ep.getUCCcode();
        if (ep.getFullName() != null) fullName = ep.getFullName();
        if (ep.getType() != null) type = ep.getType();
        if (ep.getLegalRepresentative() != null) legalRepresentative = ep.getLegalRepresentative();
        if (ep.getWebsite() != null) website = ep.getWebsite();
        if (ep.getSimpleName() != null) simpleName = ep.getSimpleName();
        if (ep.getFoundDate() != null) foundDate = sdf.format(ep.getFoundDate());
        if (ep.getRegisterDepartment() != null) registerDepartment = ep.getRegisterDepartment();
        if (ep.getRegisteredCapital() != null) registeredCapital = ep.getRegisteredCapital();
        if (ep.getApprovalDate() != null) approvalDate = sdf.format(ep.getApprovalDate());
        if (ep.getRegisterState() != null) registerState = ep.getRegisterState();
        if (ep.getMainProduct() != null) mainProduct = ep.getMainProduct();
        if (ep.getBusinessDeadlineGo() != null) businessDeadlineGo = ep.getBusinessDeadlineGo();
        if (ep.getBusinessDeadlineTo() != null) businessDeadlineTo = ep.getBusinessDeadlineTo();
        if (ep.getLevel() != null) level = ep.getLevel().toString();
        if (ep.getTradeGroupId() != null) tradeGroup = ep.getTradeGroupId().getName();
        if (ep.getAddress() != null) address = ep.getAddress();
        if (ep.getOperateRange() != null) operateRange = ep.getOperateRange();
        if (ep.getExceptionInfo() != null) exceptionInfo = ep.getExceptionInfo();
        if (ep.getDangerInfo() != null) dangerInfo = ep.getDangerInfo();
        if (ep.getComment() != null) comment = ep.getComment();
    }
%>

<form class="form-horizontal" id="supplier-form">
    <input id="supplierId" value="<%=id%>" style="display:none;"/>
    <div class="col-sm-6 col-xs-12">
        <div class="form-group has-warning">
            <label for="uCCcode" class="col-sm-4 control-label no-padding-right">统一社会信用代码：</label>

            <div class="col-sm-7">
                <span class="block input-icon input-icon-right">
                    <input type="text" id="uCCcode" placeholder="<%=UCCcode%>" class="width-100" />
                    <i class="ace-icon fa fa-info-circle" title="必填项"></i>
                </span>
            </div>
            <div class="help-block col-sm-reset inline"></div>
        </div>
    </div>

    <div class="col-sm-6 col-xs-12">
        <div class="form-group has-warning">
            <label for="fullName" class="col-sm-3 control-label no-padding-right">企业名称：</label>

            <div class="col-sm-7">
                <span class="block input-icon input-icon-right">
                    <input type="text" id="fullName" placeholder="<%=fullName%>" class="width-100" />
                    <i class="ace-icon fa fa-info-circle" title="必填项"></i>
                </span>
            </div>
            <div class="help-block col-sm-reset inline"></div>
        </div>
    </div>


    <div class="col-sm-6 col-xs-12">
        <div class="form-group has-warning">
            <label for="type" class="col-sm-4 control-label no-padding-right">企业类型：</label>

            <div class="col-sm-7">
                <span class="block input-icon input-icon-right">
                <input type="text" id="type" placeholder="<%=type%>" class="width-100" />
                <i class="ace-icon fa fa-info-circle" title="必填项"></i>
                </span>
            </div>
            <div class="help-block col-sm-reset inline"></div>
        </div>
    </div>

    <div class="col-sm-6 col-xs-12">
        <div class="form-group has-warning">
            <label for="legalRepresentative" class="col-sm-3 control-label no-padding-right">法定代表人：</label>

            <div class="col-sm-7">
                <span class="block input-icon input-icon-right">
                    <input type="text" id="legalRepresentative" placeholder="<%=legalRepresentative%>" class="width-100" />
                    <i class="ace-icon fa fa-info-circle" title="必填项"></i>
                </span>
            </div>
            <div class="help-block col-sm-reset inline"></div>
        </div>
    </div>


    <div class="col-sm-6 col-xs-12">
        <div class="form-group has-success">
            <label for="website" class="col-sm-4 control-label no-padding-right">公司网站：</label>

            <div class="col-sm-7">
                <input type="text" id="website" placeholder="<%=website%>" class="width-100" />
            </div>
            <div class="help-block col-sm-reset inline"></div>
        </div>
    </div>

    <div class="col-sm-6 col-xs-12">
        <div class="form-group has-success">
            <label for="simpleName" class="col-sm-3 control-label no-padding-right">企业简称：</label>

            <div class="col-sm-7">
                <input type="text" id="simpleName" placeholder="<%=simpleName%>" class="width-100" />
            </div>
            <div class="help-block col-sm-reset inline"></div>
        </div>
    </div>


    <div class="col-sm-6 col-xs-12">
        <div class="form-group has-warning">
            <label for="foundDate" class="col-sm-4 control-label no-padding-right">成立日期：</label>

            <div class="col-sm-7">
                <div class="input-group">
                    <span class="input-group-addon">
                    <i class="fa fa-calendar bigger-110" title="日期框"></i>
                    </span>
                    <span class="block input-icon input-icon-right">
                    <input class="form-control date-picker" id="foundDate" type="text" placeholder="<%=foundDate%>" data-date-format="yyyy-mm-dd" />
                    <i class="ace-icon fa fa-info-circle" title="必填项"></i>
                    </span>
                </div>
            </div>
            <div class="help-block col-sm-reset inline"></div>
        </div>
    </div>

    <div class="col-sm-6 col-xs-12">
        <div class="form-group has-success">
            <label for="registeredCapital" class="col-sm-3 control-label no-padding-right">注册资本：</label>

            <div class="col-sm-7">
                <input type="text" id="registeredCapital" placeholder="<%=registeredCapital%>" class="width-100" />
            </div>
            <div class="help-block col-sm-reset inline"></div>
        </div>
    </div>


    <div class="col-sm-6 col-xs-12">
        <div class="form-group has-warning">
            <label for="registerDepartment" class="col-sm-4 control-label no-padding-right">登记机关：</label>

            <div class="col-sm-7">
                <span class="block input-icon input-icon-right">
                    <input class="width-100" id="registerDepartment" placeholder="<%=registerDepartment%>" type="text" />
                    <i class="ace-icon fa fa-info-circle" title="必填项"></i>
                </span>
            </div>
            <div class="help-block col-sm-reset inline"></div>
        </div>
    </div>

    <div class="col-sm-6 col-xs-12">
        <div class="form-group has-warning">
            <label for="approvalDate" class="col-sm-3 control-label no-padding-right">核准日期：</label>

            <div class="col-sm-7">
                <div class="input-group">
                    <span class="input-group-addon">
                    <i class="fa fa-calendar bigger-110" title="日期框"></i>
                    </span>
                    <span class="block input-icon input-icon-right">
                    <input class="form-control date-picker" id="approvalDate" type="text" placeholder="<%=approvalDate%>" data-date-format="yyyy-mm-dd" />
                    <i class="ace-icon fa fa-info-circle" title="必填项"></i>
                    </span>
                </div>
            </div>
            <div class="help-block col-sm-reset inline"></div>
        </div>
    </div>


    <div class="col-sm-6 col-xs-12">
        <div class="form-group has-warning">
            <label for="registerState" class="col-sm-4 control-label no-padding-right">登记状态：</label>

            <div class="col-sm-7">
                <span class="block input-icon input-icon-right">
                    <input class="width-100" id="registerState" placeholder="<%=registerState%>" type="text" />
                    <i class="ace-icon fa fa-info-circle" title="必填项"></i>
                </span>
            </div>
            <div class="help-block col-sm-reset inline"></div>
        </div>
    </div>

    <div class="col-sm-6 col-xs-12">
        <div class="form-group has-warning">
            <label for="mainProduct" class="col-sm-3 control-label no-padding-right">主营产品：</label>

            <div class="col-sm-7">
                <span class="block input-icon input-icon-right">
                    <input class="width-100" id="mainProduct" placeholder="<%=mainProduct%>" type="text" />
                    <i class="ace-icon fa fa-info-circle" title="必填项"></i>
                </span>
            </div>
            <div class="help-block col-sm-reset inline"></div>
        </div>
    </div>


    <div class="col-sm-6 col-xs-12">
        <div class="form-group has-success">
            <label for="businessDeadlineGo" class="col-sm-4 control-label no-padding-right">营业期限自：</label>

            <div class="col-sm-7">
                <input class="width-100" id="businessDeadlineGo" placeholder="<%=businessDeadlineGo%>" type="text" />
            </div>
            <div class="help-block col-sm-reset inline"></div>
        </div>
    </div>

    <div class="col-sm-6 col-xs-12">
        <div class="form-group has-success">
            <label for="businessDeadlineTo" class="col-sm-3 control-label no-padding-right">营业期限至：</label>

            <div class="col-sm-7">
                <input class="width-100" id="businessDeadlineTo" placeholder="<%=businessDeadlineTo%>" type="text" />
            </div>
            <div class="help-block col-sm-reset inline"></div>
        </div>
    </div>

    <div class="col-sm-12">

        <div class="form-group has-success">
            <label for="level" class="col-sm-2 control-label no-padding-right">信用级别：</label>

            <div class="col-sm-4">
                <div class="rating inline" id="level" style="margin-top: 5px;" data-score="<%=level%>"></div>
            </div>
            <div class="help-block col-sm-reset inline"></div>
        </div>
    </div>


    <div class="col-sm-12">

        <div class="form-group has-warning">
            <label for="tradeGroup" class="col-sm-2 control-label no-padding-right">所属分组：</label>

            <div class="col-sm-4">
                <select class="chosen-select form-control" id="tradeGroup">
                    <option value="0"><%=tradeGroup%></option>
                </select>
            </div>
            <div class="help-block col-sm-reset inline">
                <i class="ace-icon fa fa-info-circle bigger-130" title="必填项"></i>
            </div>
        </div>
    </div>


    <div class="col-sm-12">
        <div class="form-group has-warning">
            <label for="address" class="col-sm-2 control-label no-padding-right">住所：</label>

            <div class="col-sm-9">
																		<span class="block input-icon input-icon-right">
																			<input class="width-100" id="address" placeholder="<%=address%>" type="text" />
																			<i class="ace-icon fa fa-info-circle"></i>
																		</span>
            </div>
            <div class="help-block col-sm-reset inline"></div>
        </div>
    </div>

    <div class="col-sm-12">
        <div class="form-group has-warning">
            <label for="operateRange" class="col-sm-2 control-label no-padding-right">经营范围：</label>

            <div class="col-sm-9">
																		<span class="block input-icon input-icon-right">
																			<textarea class="form-control limited" id="operateRange" placeholder="<%=operateRange%>" maxlength="500"></textarea>
																			<i class="ace-icon fa fa-info-circle"></i>
																		</span>
            </div>
            <div class="help-block col-sm-reset inline"></div>
        </div>
    </div>

    <div class="col-sm-12">
        <div class="form-group has-success">
            <label for="exceptionInfo" class="col-sm-2 control-label no-padding-right">经营异常信息：</label>

            <div class="col-sm-9">
                <input class="width-100" id="exceptionInfo" placeholder="<%=exceptionInfo%>" type="text" />
            </div>
            <div class="help-block col-sm-reset inline"></div>
        </div>
    </div>

    <div class="col-sm-12">
        <div class="form-group has-success">
            <label for="dangerInfo" class="col-sm-2 control-label no-padding-right">严重违法失信信息：</label>

            <div class="col-sm-9">
                <input class="width-100" id="dangerInfo" placeholder="<%=dangerInfo%>" type="text" />
            </div>
            <div class="help-block col-sm-reset inline"></div>
        </div>
    </div>

    <div class="col-sm-12">
        <div class="form-group has-success">
            <label for="comment" class="col-sm-2 control-label no-padding-right">备注：</label>

            <div class="col-sm-9">
                <textarea class="form-control limited" id="comment" placeholder="<%=comment%>" maxlength="500"></textarea>
            </div>
            <div class="help-block col-sm-reset inline"></div>
        </div>
    </div>

</form>
