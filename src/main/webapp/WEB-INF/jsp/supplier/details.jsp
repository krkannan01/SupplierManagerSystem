<%--
  @author xietao.x@qq.com
  Created by 2018/3/21
--%>
<%@ page import="cn.xt.sms.entity.Supplier" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
    final String privilege_prefix = "supplier";
    String foundDate = "",approvalDate = "",udfFive = "";
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
    SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy年MM月dd日 HH时mm分ss秒");
    Supplier ep = (Supplier) request.getAttribute("supplier");
    if (ep.getFoundDate() != null)
        foundDate = sdf.format(ep.getFoundDate());
    if (ep.getApprovalDate() != null)
        approvalDate = sdf.format(ep.getApprovalDate());
    if (ep.getUserDefinedFieldFive() != null)
        udfFive = sdf2.format(ep.getUserDefinedFieldFive());
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>查看详情 - 供应商管理系统</title>

    <meta name="description" content="overview &amp; stats" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

    <link rel="shortcut icon" href="${pageContext.request.contextPath}/statics/favicon.ico" type="image/x-icon" />
    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/assets/css/bootstrap.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/components/font-awesome/css/font-awesome.min.css" />

    <!-- page specific plugin styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/components/_mod/jquery-ui/jquery-ui.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/bootstrap-dialog.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/components/_mod/jquery-ui/jquery-ui.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/components/bootstrap-datepicker/dist/css/bootstrap-datepicker3.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/components/eonasdan-bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/components/_mod/jquery-ui.custom/jquery-ui.custom.min.css" />

    <!-- text fonts -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/assets/css/ace-fonts.css" />

    <!-- ace styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />

    <!--[if lte IE 9]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/assets/css/ace-part2.css" class="ace-main-stylesheet" />
    <![endif]-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/assets/css/ace-skins.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/assets/css/ace-rtl.css" />

    <!--[if lte IE 9]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/assets/css/ace-ie.css" />
    <![endif]-->

    <style type="text/css">
        body{margin-bottom:135px}
        /*左边距设置为10px*/
        .l10{font-size:15px;margin-left:10px;margin-right:5px;color:#266eb6}
        /*字体大小设置为15px*/
        .f15{font-size:15px;color:#666;margin-left:2px}
        .overview dt{display:inline-block;font-weight:700!important;line-height:25px;padding-left:10px;position:relative}
        .overview dd{display:inline;line-height:25px;margin-left:10px}
        .overview dl{display:inline}
        /*虚线分界线样式*/
        .demarcation{height:1px;border:none;border-top:1px dashed orange}
    </style>

    <!-- ace settings handler -->
    <script src="${pageContext.request.contextPath}/statics/assets/js/ace-extra.js"></script>

    <!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

    <!--[if lte IE 8]>
    <script src="${pageContext.request.contextPath}/statics/components/html5shiv/dist/html5shiv.min.js"></script>
    <script src="${pageContext.request.contextPath}/statics/components/respond/dest/respond.min.js"></script>
    <![endif]-->
</head>

<body class="no-skin">
<!-- #section:basics/navbar.layout -->
<!-- 网页上部信息 -->
<div class="navbar navbar-default          ace-save-state" style="background-color: #EEEEEE;">
    <div class="navbar-container ace-save-state" id="navbar-container">

        <!-- /section:basics/sidebar.mobile.toggle -->
        <div class="navbar-header pull-left">
            <!-- #section:basics/navbar.layout.brand -->
            <a href="#" class="navbar-brand" style="color: #0088FF;">
                <small>
                    <i class="fa fa-leaf"></i>
                    Supplier ManagerSystem
                </small>
            </a>
            <!-- #section:basics/content.searchbox -->
            <div class="nav-search" id="nav-search" style="margin-top: 8px;width: 300px;">
                <form class="form-search" action="javascript: void(0);">
                    <span class="input-icon">
                        <input type="text" placeholder="根据企业名称、统一社会信用代码查询" class="nav-search-input" id="nav-search-input" autocomplete="off" style="width: 300px;" onkeyup="javascript:void(0);" />
                        <i class="ace-icon fa fa-search nav-search-icon" onclick="search()"></i>
                    </span>
                </form>
            </div><!-- /.nav-search -->
        </div>

    </div><!-- /.navbar-container -->
</div>


<!-- /section:basics/navbar.layout -->
<div class="main-container ace-save-state" id="main-container">
    <script type="text/javascript">
        try{ace.settings.loadState('main-container')}catch(e){}
    </script>



    <!-- /section:basics/sidebar -->
    <div class="main-content" style="width: 80%; margin: 0 auto;">
        <div class="main-content-inner">

            <!-- /section:basics/content.breadcrumbs -->
            <div class="page-content">

                <!-- /section:settings.box -->
                <div class="page-header">
                    <div class="row" style="border: 5px solid orange; padding: 10px;">
                        <table>
                            <tr>
                                <td rowspan="5"><img src="${pageContext.request.contextPath}/statics/img/yyzz.jpg" /></td>
                                <td><h3 class="title" style="margin: 10px;">${supplier.fullName}</h3></td>
                                <td><span class="label label-success" title="${supplier.registerState}">${supplier.registerState}</span></td>
                            </tr>
                            <tr><td colspan="2"><i class="fa fa-barcode l10"></i><b>统一社会信用代码</b> : <span class="f15"><%=((Supplier)request.getAttribute("supplier")).getUCCcode()%></span></td></tr>
                            <tr><td colspan="2"><i class="fa fa-user l10"></i><b>法定代表人</b> : <span class="f15">${supplier.legalRepresentative}</span></td></tr>
                            <tr><td colspan="2"><i class="fa fa-cog l10"></i><b>登记机关</b> : <span class="f15">${supplier.registerDepartment}</span></td></tr>
                            <tr><td colspan="2"><i class="fa fa-calendar l10"></i><b>成立日期</b> : <span class="f15"><%=foundDate%></span></td></tr>
                        </table>
                    </div>
                </div><!-- /.page-header -->

                <div class="row" style="border: 5px solid orange; padding: 10px;">
                    <div class="col-sm-12">
                        <div class="space-8"></div>
                    </div>
                    <div class="col-sm-12">
                        <div class="col-sm-3 label label-lg label-info arrowed-in arrowed-right"><b>基本信息</b></div>
                    </div>
                    <div class="col-sm-12">
                        <div class="space-10"></div>
                    </div>
                    <div class="col-sm-12 overview">
                        <div class="col-sm-6 col-xs-12">
                            <dl>
                                <dt>统一社会信用代码：</dt>
                                <dd><%=((Supplier)request.getAttribute("supplier")).getUCCcode()%></dd>
                            </dl>
                        </div>
                        <div class="col-sm-6 col-xs-12">
                            <dl>
                                <dt>企业名称：</dt>
                                <dd>${supplier.fullName}</dd>
                            </dl>
                        </div>

                        <div class="col-sm-6 col-xs-12">
                            <dl>
                                <dt>企业类型：</dt>
                                <dd>${supplier.type}</dd>
                            </dl>
                        </div>
                        <div class="col-sm-6 col-xs-12">
                            <dl>
                                <dt>法定代表人：</dt>
                                <dd>${supplier.legalRepresentative}</dd>
                            </dl>
                        </div>

                        <div class="col-sm-6 col-xs-12">
                            <dl>
                                <dt>公司网站：</dt>
                                <dd>${supplier.website}</dd>
                            </dl>
                        </div>
                        <div class="col-sm-6 col-xs-12">
                            <dl>
                                <dt>公司简称：</dt>
                                <dd>${supplier.simpleName}</dd>
                            </dl>
                        </div>

                        <div class="col-sm-6 col-xs-12">
                            <dl>
                                <dt>注册资本：</dt>
                                <dd>${supplier.registeredCapital}</dd>
                            </dl>
                        </div>
                        <div class="col-sm-6 col-xs-12">
                            <dl>
                                <dt>成立日期：</dt>
                                <dd><%=foundDate%></dd>
                            </dl>
                        </div>

                        <div class="col-sm-6 col-xs-12">
                            <dl>
                                <dt>营业期限自：</dt>
                                <dd>${supplier.businessDeadlineGo}</dd>
                            </dl>
                        </div>
                        <div class="col-sm-6 col-xs-12">
                            <dl>
                                <dt>营业期限至：</dt>
                                <dd>${supplier.businessDeadlineTo}</dd>
                            </dl>
                        </div>

                        <div class="col-sm-6 col-xs-12">
                            <dl>
                                <dt>登记机关：</dt>
                                <dd>${supplier.registerDepartment}</dd>
                            </dl>
                        </div>
                        <div class="col-sm-6 col-xs-12">
                            <dl>
                                <dt>核准日期：</dt>
                                <dd><%=approvalDate%></dd>
                            </dl>
                        </div>

                        <div class="col-sm-6 col-xs-12">
                            <dl>
                                <dt>登记状态：</dt>
                                <dd>${supplier.registerState}</dd>
                            </dl>
                        </div>
                        <div class="col-sm-6 col-xs-12">
                            <dl>
                                <dt>主营产品：</dt>
                                <dd>${supplier.mainProduct}</dd>
                            </dl>
                        </div>

                        <div class="col-sm-6 col-xs-12">
                            <dl>
                                <dt>分组：</dt>
                                <dd>${supplier.tradeGroupId.name}</dd>
                            </dl>
                        </div>
                        <div class="col-sm-6 col-xs-12">
                            <dl>
                                <dt>信用级别：</dt>
                                <dd><div class="rating inline" style="margin-top: 3px;" id="level" data-score="${supplier.level}"></div></dd>
                            </dl>
                        </div>

                        <div class="col-sm-12">
                            <dl>
                                <dt>住所：</dt>
                                <dd>${supplier.address}</dd>
                            </dl>
                        </div>

                        <div class="col-sm-12">
                            <dl>
                                <dt>经营范围：</dt>
                                <dd>${supplier.operateRange}</dd>
                            </dl>
                        </div>

                        <div class="col-sm-12">
                            <dl>
                                <dt>经营异常信息：</dt>
                                <dd>${supplier.exceptionInfo}</dd>
                            </dl>
                        </div>

                        <div class="col-sm-12">
                            <dl>
                                <dt>违法失信信息：</dt>
                                <dd>${supplier.dangerInfo}</dd>
                            </dl>
                        </div>

                        <div class="col-sm-12">
                            <hr class="demarcation" />
                        </div>

                        <c:if test="${supplier.contactId != null}">
                            <div class="col-sm-6 col-xs-12">
                                <dl>
                                    <dt>主要联系人名称：</dt>
                                    <dd>${supplier.contactId.nameMaster}</dd>
                                </dl>
                            </div>
                            <div class="col-sm-6 col-xs-12">
                                <dl>
                                    <dt>次要联系人名称：</dt>
                                    <dd>${supplier.contactId.nameSlave}</dd>
                                </dl>
                            </div>

                            <div class="col-sm-6 col-xs-12">
                                <dl>
                                    <dt>主要联系方式：</dt>
                                    <dd>${supplier.contactId.phoneNumberMaster}</dd>
                                </dl>
                            </div>
                            <div class="col-sm-6 col-xs-12">
                                <dl>
                                    <dt>次要联系方式：</dt>
                                    <dd>${supplier.contactId.phoneNumberSlave}</dd>
                                </dl>
                            </div>

                            <div class="col-sm-6 col-xs-12">
                                <dl>
                                    <dt>备注：</dt>
                                    <dd>${supplier.contactId.comment}</dd>
                                </dl>
                            </div>
                        </c:if>

                        <div class="col-sm-12">
                            <hr class="demarcation" />
                        </div>

                        <div class="col-sm-6 col-xs-12">
                            <dl>
                                <dt><span class="userDefinedFieldName">自定义1</span>：</dt>
                                <dd>${supplier.userDefinedFieldOne}</dd>
                            </dl>
                        </div>
                        <div class="col-sm-6 col-xs-12">
                            <dl>
                                <dt><span class="userDefinedFieldName">自定义2</span>：</dt>
                                <dd>${supplier.userDefinedFieldTwo}</dd>
                            </dl>
                        </div>

                        <div class="col-sm-6 col-xs-12">
                            <dl>
                                <dt><span class="userDefinedFieldName">自定义3</span>：</dt>
                                <dd>${supplier.userDefinedFieldThree}</dd>
                            </dl>
                        </div>
                        <div class="col-sm-6 col-xs-12">
                            <dl>
                                <dt><span class="userDefinedFieldName">自定义4</span>：</dt>
                                <dd>${supplier.userDefinedFieldFour}</dd>
                            </dl>
                        </div>

                        <div class="col-sm-12">
                            <dl>
                                <dt><span class="userDefinedFieldName">自定义5</span>：</dt>
                                <dd><%=udfFive%></dd>
                            </dl>
                        </div>

                    </div>

                    <div class="col-sm-12">
                        <div class="space-16"></div>
                    </div>

                    <div class="col-sm-12">
                        <div class="col-sm-3 label label-lg label-info arrowed-in arrowed-right"><b>合作情况</b></div>
                    </div>

                    <c:choose>
                        <c:when test="${supplier.cooperationList != null and supplier.cooperationList.size() > 0}">
                            <c:forEach items="${supplier.cooperationList}" var="cooperation" varStatus="index">
                                <div class="col-sm-12"><div class="space-10"></div></div>

                                <div class="col-sm-12 overview" style="border: 1px dashed yellow">
                                    <div class="col-sm-5 col-sm-offset-5">
                                        <div class="space-4"></div>
                                        <b>合作情况${index.count}</b>
                                        <div class="space-4"></div>
                                    </div>
                                    <div class="col-sm-6">
                                        <dl>
                                            <dt>项目名称：</dt>
                                            <dd>${cooperation.projectName}</dd>
                                        </dl>
                                    </div>
                                    <div class="col-sm-6">
                                        <dl>
                                            <dt>产品名称：</dt>
                                            <dd>${cooperation.productName}</dd>
                                        </dl>
                                    </div>
                                    <div class="col-sm-6">
                                        <dl>
                                            <dt>主要联系人名称：</dt>
                                            <dd>${cooperation.contactId != null ? cooperation.contactId.nameMaster:""}</dd>
                                        </dl>
                                    </div>
                                    <div class="col-sm-6">
                                        <dl>
                                            <dt>次要联系人名称：</dt>
                                            <dd>${cooperation.contactId != null ? cooperation.contactId.nameSlave:""}</dd>
                                        </dl>
                                    </div>
                                    <div class="col-sm-6">
                                        <dl>
                                            <dt>主要联系方式：</dt>
                                            <dd>${cooperation.contactId != null ? cooperation.contactId.phoneNumberMaster:""}</dd>
                                        </dl>
                                    </div>
                                    <div class="col-sm-6">
                                        <dl>
                                            <dt>次要联系方式：</dt>
                                            <dd>${cooperation.contactId != null ? cooperation.contactId.phoneNumberSlave:""}</dd>
                                        </dl>
                                    </div><div class="col-sm-6">
                                    <div class="col-sm-6">
                                        <dl>
                                            <dt>备注：</dt>
                                            <dd>${cooperation.contactId != null ? cooperation.contactId.comment:""}</dd>
                                        </dl>
                                    </div>
                                </div>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <div class="col-sm-12"><div class="space-10"></div></div>
                            <div class="col-sm-12 overview" style="border: 1px dashed yellow">
                                <div class="col-sm-5 col-sm-offset-5">
                                    <div class="space-4"></div>
                                    <b>无合作情况</b>
                                    <div class="space-4"></div>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>

                </div>
            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->

    <div style="position: fixed; opacity: 0.9; width: 100%; bottom: 0; background-color: #EEEEEE; z-index: 9;">
        <div style="margin: 18px auto 0; width: 20%;">
            <shiro:hasAnyPermission name="admin,supplier:update">
                <button class="btn btn-warning" style="width: 40%;" onclick="javascript: location.href = '${pageContext.request.contextPath}/supplier/getSupplierById?action=edit&id=${supplier.id}';">
                    编辑
                </button>
            </shiro:hasAnyPermission>
            <button class="btn btn-success" style="width: 40%; margin-left: 18%;" onclick="javascript: window.opener=null;window.open('','_self');window.close();">
                关闭
            </button>
        </div>
        
        <jsp:include page="${pageContext.request.contextPath}/common/foot.jsp"/>

<!-- basic scripts -->

<!--[if !IE]> -->
<script src="${pageContext.request.contextPath}/statics/components/jquery/dist/jquery.min.js"></script>

<!-- <![endif]-->

<!--[if IE]>
<script src="${pageContext.request.contextPath}/statics/components/jquery.1x/dist/jquery.js"></script>
<![endif]-->
<script type="text/javascript">
    if('ontouchstart' in document.documentElement) document.write("<script src='${pageContext.request.contextPath}/statics/components/_mod/jquery.mobile.custom/jquery.mobile.custom.js'>"+"<"+"/script>");
</script>
<script src="${pageContext.request.contextPath}/statics/components/bootstrap/dist/js/bootstrap.min.js"></script>

<!-- page specific plugin scripts -->
<script src="${pageContext.request.contextPath}/statics/components/bootbox.js/bootbox.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/bootstrap-dialog.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/raty/lib/jquery.raty.js"></script>

<!-- ace scripts -->
<jsp:include page="${pageContext.request.contextPath}/common/ace-script.jsp"/>
<jsp:include page="${pageContext.request.contextPath}/common/time.jsp"/>
<!-- inline scripts related to this page -->
<script type="text/javascript">
    jQuery(function($) {
        //$.getJSON("${pageContext.request.contextPath}/statics/json/defined_field.json", function(data) {
        $.post("${pageContext.request.contextPath}/supplier/getUserDefinedFieldName", function(data) {
            if (data) {
                var userDefinedFieldName = $(".userDefinedFieldName");
                userDefinedFieldName.eq(0).html(data.userDefinedFieldOneName);
                userDefinedFieldName.eq(1).html(data.userDefinedFieldTwoName);
                userDefinedFieldName.eq(2).html(data.userDefinedFieldThreeName);
                userDefinedFieldName.eq(3).html(data.userDefinedFieldFourName);
                userDefinedFieldName.eq(4).html(data.userDefinedFieldFiveName);
            }
        }, "json");
    });

    /*初始化信用级别栏样式*/
    $("#level").raty({
        'cancel' : false,//是否可以取消 default:false
        'half': true,//是否可以选择半星 default:false
        'starType' : 'i',
        'score' : $("#level").attr("data-score"),
        'readOnly' : true,
        'hints' : ['坏', '不好', '合格', '好', '极好']
    }).children("i").attr("style", "font-size: 18px;");

    $("#nav-search-input").keypress(function(event) {
       if (event.keyCode == 13) {
           exec();
       }
    });

    function search() {
        exec();
    }

    function exec() {
        location.href = "${pageContext.request.contextPath}/supplier/toSearchSupplier?uccCode="+$("#nav-search-input").val();
    }

</script>

<!-- the following scripts are used in demo only for onpage help and you don't need them -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/statics/assets/css/ace.onpage-help.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/statics/docs/assets/js/themes/sunburst.css" />

<script type="text/javascript"> ace.vars['base'] = '..'; </script>
<script src="${pageContext.request.contextPath}/statics/assets/js/src/elements.onpage-help.js"></script>
<script src="${pageContext.request.contextPath}/statics/assets/js/src/ace.onpage-help.js"></script>
<script src="${pageContext.request.contextPath}/statics/docs/assets/js/rainbow.js"></script>
<script src="${pageContext.request.contextPath}/statics/docs/assets/js/language/generic.js"></script>
<script src="${pageContext.request.contextPath}/statics/docs/assets/js/language/html.js"></script>
<script src="${pageContext.request.contextPath}/statics/docs/assets/js/language/css.js"></script>
<script src="${pageContext.request.contextPath}/statics/docs/assets/js/language/javascript.js"></script>
</body>
</html>


