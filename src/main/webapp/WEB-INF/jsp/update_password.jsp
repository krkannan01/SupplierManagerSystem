<%--
  Created by IntelliJ IDEA.
  User: xietao
  Date: 2018/4/9
  Time: 14:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <meta charset="utf-8" />
  <title>个人信息 - 供应商管理系统</title>

  <meta name="description" content="3 styles with inline editable feature" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

  <link rel="shortcut icon" href="${pageContext.request.contextPath}/statics/favicon.ico" type="image/x-icon"/>
  <!-- bootstrap & fontawesome -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/assets/css/bootstrap.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/components/font-awesome/css/font-awesome.min.css" />

  <!-- page specific plugin styles -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/components/_mod/jquery-ui.custom/jquery-ui.custom.min.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/components/jquery.gritter/css/jquery.gritter.min.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/components/select2/dist/css/select2.min.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/components/bootstrap-datepicker/dist/css/bootstrap-datepicker3.min.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/components/_mod/x-editable/bootstrap-editable.min.css" />
  <link rel="stylesheet" href="${pageContent.request.contentPath}/statics/css/bootstrap-dialog.css" />

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

  <!-- inline styles related to this page -->
  <style type="text/css">
    .error::-webkit-input-placeholder, .error::-webkit-input-placeholder {
      /* WebKit browsers */
      color: #ff0000;
    }
    .error:-moz-placeholder, .error:-moz-placeholder {
      /* Mozilla Firefox 4 to 18 */
      color: #ff0000;
    }
    .error::-moz-placeholder, .error::-moz-placeholder {
      /* Mozilla Firefox 19+ */
      color: #ff0000;
    }
    .error:-ms-input-placeholder, .error:-ms-input-placeholder {
      /* Internet Explorer 10+ */
      color: #ff0000;
    }
  </style>

  <!-- ace settings handler -->
  <script src="${pageContext.request.contextPath}/statics/assets/js/ace-extra.js"></script>

  <!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

  <!--[if lte IE 8]>
  <script src="${pageContext.request.contextPath}/statics/components/html5shiv/dist/html5shiv.min.js"></script>
  <script src="${pageContext.request.contextPath}/statics/components/respond/dest/respond.min.js"></script>
  <![endif]-->
</head>

<jsp:include page="${pageContext.request.contextPath}/common/head.jsp"/>

<!-- /section:basics/navbar.layout -->
<div class="main-container ace-save-state" id="main-container">
  <script type="text/javascript">
    try{ace.settings.loadState('main-container')}catch(e){}
  </script>

  <jsp:include page="${pageContext.request.contextPath}/common/menu.jsp"/>

  <!-- /section:basics/sidebar -->
  <div class="main-content">
    <div class="main-content-inner">
      <!-- #section:basics/content.breadcrumbs -->
      <div class="breadcrumbs ace-save-state" id="breadcrumbs">
        <ul class="breadcrumb">
          <li>
            <i class="ace-icon fa fa-home home-icon"></i>
            <a href="#">用户权限管理</a>
          </li>
          <li class="active">修改密码</li>
        </ul><!-- /.breadcrumb -->

        <!-- /section:basics/content.searchbox -->
      </div>

      <!-- /section:basics/content.breadcrumbs -->
      <div class="page-content">

        <form class="container" id="update-form" style="width: 36%; margin: 100px 32%;">
          <fieldset>

            <label class="block clearfix">
              <span class="block input-icon input-icon-right">
                <input type="password" id="password" class="form-control" placeholder="原密码" />
                <i class="ace-icon fa fa-unlock"></i>
              </span>
            </label>

            <label class="block clearfix">
              <span class="block input-icon input-icon-right">
                  <input type="password" id="new_password" class="form-control" placeholder="新密码" />
                  <i class="ace-icon fa fa-lock" style="margin-right: 5px;"></i>
              </span>
            </label>

            <label class="block clearfix">
              <span class="block input-icon input-icon-right">
                  <input type="password" id="re_new_password" class="form-control" placeholder="确认新密码" />
                  <i class="ace-icon fa fa-retweet"></i>
              </span>
            </label>

            <div id="message-box"><div class="space"></div></div>

            <div class="clearfix">
              <button type="button" class="width-30 pull-left btn btn-sm" onclick="javascript: window.history.back();">
                <i class="ace-icon fa fa-times"></i>
                <span class="bigger-110">取消</span>
              </button>

              <button type="button" class="width-65 pull-right btn btn-sm btn-success" onclick="update()">
                <span class="bigger-110">提交</span>

                <i class="ace-icon fa fa-arrow-right icon-on-right"></i>
              </button>
            </div>
          </fieldset>
        </form>
      </div><!-- /.page-content -->
    </div>
  </div><!-- /.main-content -->

  <jsp:include page="${pageContext.request.contextPath}/common/foot.jsp"/>

  <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
    <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
  </a>
</div><!-- /.main-container -->

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
<script src="${pageContent.request.contentPath}/statics/js/bootstrap-dialog.js"></script>

<!--[if lte IE 8]>
<script src="${pageContext.request.contextPath}/statics/components/ExplorerCanvas/excanvas.js"></script>
<![endif]-->
<script src="${pageContext.request.contextPath}/statics/components/_mod/jquery-ui.custom/jquery-ui.custom.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/jqueryui-touch-punch/jquery.ui.touch-punch.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/jquery.gritter/js/jquery.gritter.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/bootbox.js/bootbox.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/_mod/easypiechart/jquery.easypiechart.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/bootstrap-datepicker/dist/js/bootstrap-datepicker-CN.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/jquery.hotkeys/index.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/_mod/bootstrap-wysiwyg/bootstrap-wysiwyg.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/select2/dist/js/select2.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/fuelux/js/spinbox.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/_mod/x-editable/bootstrap-editable.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/_mod/x-editable/ace-editable.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/components/jquery.maskedinput/dist/jquery.maskedinput.min.js"></script>

<!-- ace scripts -->
<jsp:include page="${pageContext.request.contextPath}/common/ace-script.jsp"/>
<jsp:include page="${pageContext.request.contextPath}/common/time.jsp"/>

<!-- inline scripts related to this page -->
<script type="text/javascript">
  jQuery(function($) {
    $("#update-form").keypress(function(e) {
      if (e.keyCode == 13) {
        update();
      }
    })
  });
  function update() {
    var $password = $("#password"),
      $new_password = $("#new_password"),
      $re_new_password = $("#re_new_password");
    // 判断是否非空 确认密码是否一致
    if (!$password.val()) {
      $password.addClass("error").attr("placeholder","请输入原密码");
      $password.get(0).focus();
      return;
    }

    if (!$new_password.val()) {
      $new_password.addClass("error").attr("placeholder","请输入密码");
      $new_password.get(0).focus();
      return;
    }

    if (!$re_new_password.val()) {
      $re_new_password.addClass("error").attr("placeholder","请确认密码");
      $re_new_password.get(0).focus();
      return;
    }

    console.log($password.val());
    console.log($new_password.val());
    console.log($re_new_password.val());
    if ($re_new_password.val() != $new_password.val()) {
      $("#message-box").html("<i class='ace-icon fa fa-times red2'></i>&nbsp;&nbsp;<label class='inline' style='color:red;'> 确认密码不一致 </label>");
      $re_new_password.get(0).focus();
      return;
    }
    // 判段原密码是否正确
    $.ajax({
      url: "${pageContext.request.contextPath}/user/validatePassword",
      data: {password: $password.val()},
      async: false,
      type: "POST",
      dataType: "text",
      success: function(data) {
        if (data == "true") {
          $("#message-box").html("<i class='ace-icon fa fa-check green'></i>&nbsp;&nbsp;<label class='inline' style='color:green;'> 原密码正确 </label>");
          // 提交新密码
          $.ajax({
            url: "${pageContext.request.contextPath}/user/updatePassword",
            data: {password: $new_password.val()},
            type: "POST",
            dataType: "text",
            success: function(data) {
              if (data == "success") {
                BootstrapDialog.show({
                  title: "修改成功",
                  closable: false,
                  message: "请牢记你的密码【"+ $new_password.val() +"】,系统将在<label id='second_count' class='orange'> 5 </label>s后跳转到登录界面",
                  buttons: [{
                   label: "立即前往登录",
                    cssClass: "btn-success btn-white",
                    action: function(self) {
                      self.close();
                    }
                  }],
                  onshow: function(self) {
                    var interval_id = setInterval(function() {
                      var $second_count = $("#second_count");
                      var second_count = Number($second_count.html());
                      if (second_count < 1) {
                        self.close();
                        clearInterval(interval_id);
                      } else {
                        $second_count.html(second_count - 1);
                      }
                    },1000);
                  },
                  onhide: function(self) {
                    location.href = "${pageContext.request.contextPath}/login/logout";
                  }
                });
              } else {
                mShow("信息", "修改失败");
              }
            }
          });
        } else {
          $("#message-box").html("<i class='ace-icon fa fa-times red2'></i>&nbsp;&nbsp;<label class='inline' style='color:red;'> 原密码错误 </label>");
        }
      }
    });

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
