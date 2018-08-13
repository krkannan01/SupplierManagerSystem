<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="cn.xt.sms.entity.User" %>
<%@ page import="cn.xt.sms.constant.CommonConstants" %>
<%--
  Created by IntelliJ IDEA.
  User: xietao
  Date: 2018/4/9
  Time: 14:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String headImg = "assets/avatars/profile-pic.jpg", username = "空", realName = "空", phoneNumber = "空", birthday = "空", location = "空", aboutMe = "空";
  User user = (User) request.getSession().getAttribute("user");
  if (user.getHeadImg() != null && user.getHeadImg() != "") headImg = user.getHeadImg();
  if (user.getUsername() != null && user.getUsername() != "") username = user.getUsername();
  if (user.getRealName() != null && user.getRealName() != "") realName = user.getRealName();
  if (user.getPhoneNumber() != null && user.getPhoneNumber() != "") phoneNumber = user.getPhoneNumber();
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
  if (user.getBirthday() != null) birthday = sdf.format(user.getBirthday());
  if (user.getLocation() != null && user.getLocation() != "") location = user.getLocation();
  if (user.getAboutMe() != null && user.getAboutMe() != "") aboutMe = user.getAboutMe();
%>
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
          <li class="active">个人信息</li>
        </ul><!-- /.breadcrumb -->

        <!-- /section:basics/content.searchbox -->
      </div>

      <!-- /section:basics/content.breadcrumbs -->
      <div class="page-content">

        <div class="row">
          <div class="col-xs-12">


            <div class="hr dotted"></div>

            <div>
              <div id="user-profile-1" class="user-profile row">
                <div class="col-xs-12 col-sm-3 center">
                  <div>
                    <!-- #section:pages/profile.picture -->
                                                  <span class="profile-picture">
                                                      <img id="headImg" class="editable img-rounded" name="headImg" style="width: 136px; height: 150px;" alt="头像" src="${pageContext.request.contextPath}/<%=CommonConstants.HEAD_IMG_URL%>/<%=headImg%>" />
                                                  </span>

                    <!-- /section:pages/profile.picture -->
                    <div class="space-4"></div>

                    <div class="width-80 label label-info label-xlg arrowed-in arrowed-in-right">
                      <div class="inline position-relative">
                        <a href="#" class="user-title-label">
                          <i class="ace-icon fa fa-circle light-green"></i>
                          &nbsp;
                          <span class="white"><%=username%></span>
                        </a>
                      </div>
                    </div>
                  </div>

                  <div class="space-6"></div>

                </div>

                <div class="col-xs-12 col-sm-9">
                  <!-- #section:pages/profile.info -->
                  <div class="profile-user-info profile-user-info-striped">
                    <div class="profile-info-row">
                      <div class="profile-info-name"> 用户名 </div>

                      <div class="profile-info-value">
                        <span class="editable" data-value="<%=username%>" name="username" id="username"><%=username%></span>
                      </div>
                    </div>

                    <div class="profile-info-row">
                      <div class="profile-info-name"> 姓名 </div>

                      <div class="profile-info-value">
                        <span class="editable" data-value="<%=realName%>" name="realName" id="realName"><%=realName%></span>
                      </div>
                    </div>

                    <div class="profile-info-row">
                      <div class="profile-info-name"> 联系方式 </div>

                      <div class="profile-info-value">
                        <span class="editable" data-value="<%=phoneNumber%>" name="phoneNumber" id="phoneNumber"><%=phoneNumber%></span>
                      </div>
                    </div>

                    <div class="profile-info-row">
                      <div class="profile-info-name"> 生日 </div>

                      <div class="profile-info-value">
                        <span class="editable" data-value="<%=birthday%>" name="birthday" id="birthday"><%=birthday%></span>
                      </div>
                    </div>

                    <div class="profile-info-row">
                      <div class="profile-info-name"> 位置 </div>

                      <div class="profile-info-value">
                        <i class="fa fa-map-marker light-orange bigger-110"></i>
                        <span class="editable" data-value="<%=location%>" name="location" id="location"><%=location%></span>
                      </div>
                    </div>

                    <div class="profile-info-row">
                      <div class="profile-info-name"> 关于我 </div>

                      <div class="profile-info-value">
                        <span class="editable" data-value="<%=aboutMe%>" name="aboutMe" id="aboutMe"><%=aboutMe%></span>
                      </div>
                    </div>
                  </div>

                  <div class="btn-group" style="margin: 6px 124px;">
                    <button class="btn btn-sm btn-warning" id="save-update">保存更改</button>
                    <button class="btn btn-sm btn-success" id="cancel-update">取消更改</button>
                  </div>

                </div>
              </div>
            </div>


            <!-- PAGE CONTENT ENDS -->
          </div><!-- /.col -->
        </div><!-- /.row -->
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

<script src="${pageContext.request.contextPath}/statics/js/common.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/layer/layer.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/ry-common.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/ry-ui.js"></script>

<!-- ace scripts -->
<jsp:include page="${pageContext.request.contextPath}/common/ace-script.jsp"/>
<jsp:include page="${pageContext.request.contextPath}/common/time.jsp"/>

<!-- inline scripts related to this page -->
<script type="text/javascript">
  jQuery(function($) {

    //editables on first profile page
    $.fn.editable.defaults.mode = 'inline';
    $.fn.editableform.loading = "<div class='editableform-loading'><i class='ace-icon fa fa-spinner fa-spin fa-2x light-blue'></i></div>";
    $.fn.editableform.buttons = '<button type="submit" class="btn btn-info editable-submit"><i class="ace-icon fa fa-check"></i></button>'+
    '<button type="button" class="btn editable-cancel"><i class="ace-icon fa fa-times"></i></button>';

    //editables

    //text editable
//    $('#username').editable({
//      type: 'text',
//      name: 'username'
//    });

    $('#realName').editable({
      type: 'text',
      name: 'realName'
    });

    $('#phoneNumber').editable({
      type: 'text',
      name: 'phoneNumber'
    });

    $('#birthday').editable({
      type: 'adate',
      date: {
        //datepicker plugin options
        format: 'yyyy-mm-dd',
        viewformat: 'yyyy-mm-dd',
        weekStart: 1

        //,nativeUI: true//if true and browser support input[type=date], native browser control will be used
        //,format: 'yyyy-mm-dd',
        //viewformat: 'yyyy-mm-dd'
      },
      name: 'birthday'
    });

    $('#location').editable({
      type: 'text',
      name: 'location'
    });

    $('#aboutMe').editable({
      mode: 'inline',
      type: 'wysiwyg',
      name : 'aboutMe',

      wysiwyg : {
        //css : {'max-width':'300px'}
      },
      success: function(response, newValue) {
      }
    });



    // *** editable avatar *** //
    try {//ie8 throws some harmless exceptions, so let's catch'em

      //first let's add a fake appendChild method for Image element for browsers that have a problem with this
      //because editable plugin calls appendChild, and it causes errors on IE at unpredicted points
      try {
        document.createElement('IMG').appendChild(document.createElement('B'));
      } catch(e) {
        Image.prototype.appendChild = function(el){}
      }

      var last_gritter
      $('#headImg').editable({
        type: 'image',
        name: 'headImg',
        value: null,
        //onblur: 'ignore',  //don't reset or hide editable onblur?!
        image: {
          //specify ace file input plugin's options here
          btn_choose: '改变头像',
          droppable: true,
          maxSize: 1100000,//~1000Kb

          //and a few extra ones here
          name: 'headImg',//put the field name here as well, will be used inside the custom plugin
          on_error : function(error_type) {//on_error function will be called when the selected file has a problem
            if(last_gritter) $.gritter.remove(last_gritter);
            if(error_type == 1) {//file format error
              last_gritter = $.gritter.add({
                title: '文件不是图片类型!',
                text: '请选择 jpg|gif|png 图片类型!',
                class_name: 'gritter-error gritter-center'
              });
            } else if(error_type == 2) {//file size rror
              last_gritter = $.gritter.add({
                title: '文件太大!',
                text: '文件大小不能超过1M!',
                class_name: 'gritter-error gritter-center'
              });
            }
            else {//other error
            }
          },
          on_success : function() {
            $.gritter.removeAll();
          }
        },
        url: function(params) {
          // ***UPDATE AVATAR HERE*** //
          //for a working upload example you can replace the contents of this function with
          //examples/profile-avatar-update.js

          var deferred = new $.Deferred

          var value = $('#headImg').next().find('input[type=hidden]:eq(0)').val();
          if(!value || value.length == 0) {
            deferred.resolve();
            return deferred.promise();
          }


          //dummy upload
          setTimeout(function(){
            if("FileReader" in window) {
              //for browsers that have a thumbnail of selected image
              var thumb = $('#headImg').next().find('img').data('thumb');
              $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/user/uploadHeadImg",
                data: {file: thumb.substr(thumb.indexOf(',') + 1)},    //视情况将base64的前面字符串data:image/png;base64,删除
                cache: false,
                success: function(data) {
                  /*BootstrapDialog.show({
                    message: "头像上传成功",
                    type: BootstrapDialog.TYPE_INFO,
                    onhide: function(self) {
                      location.reload();
                    }
                  });*/
                  $.modalMsg("头像上传成功", "success");
                  setTimeout(function() {
                      location.reload();
                  }, 2000);
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                  /*alert("上传失败，请检查网络后重试");*/
                  $.modalMsg("上传失败，请检查网络后重试", "error");
                }
              });
              deferred.resolve({'status':'OK'});
          }
        } , parseInt(Math.random() * 800 + 800));

      return deferred.promise();

      // ***END OF UPDATE AVATAR HERE*** //
    },

    success: function(response, newValue) {
    }
  })
    }catch(e) {}

    /**
     //let's display edit mode by default?
     var blank_image = true;//somehow you determine if image is initially blank or not, or you just want to display file input at first
     if(blank_image) {
                      $('#avatar').editable('show').on('hidden', function(e, reason) {
                          if(reason == 'onblur') {
                              $('#avatar').editable('show');
                              return;
                          }
                          $('#avatar').off('hidden');
                      })
                  }
     */

    $("#save-update").click(function() {
      var $username = $("#username");
      var $realName = $("#realName");
      var $phoneNumber = $("#phoneNumber");
      var $birthday = $("#birthday");
      var $location = $("#location");
      var $aboutMe = $("#aboutMe");

      var param = {};
      $username.html() != $username.attr("data-value") ? param["username"] = $username.html():"";
      $realName.html() != $realName.attr("data-value") ? param["realName"] = $realName.html():"";
      $phoneNumber.html() != $phoneNumber.attr("data-value") ? param["phoneNumber"] = $phoneNumber.html():"";
      $birthday.html() != $birthday.attr("data-value") ? param["birthday"] = $birthday.html():"";
      $location.html() != $location.attr("data-value") ? param["location"] = $location.html():"";
      $aboutMe.html() != $aboutMe.attr("data-value") ? param["aboutMe"] = $aboutMe.html():"";
      $.post("${pageContext.request.contextPath}/user/updateBasicUser", param, function(data) {
        if (data == "success") {
          $username.html() != $username.attr("data-value") ? $username.attr("data-value", $username.html()):"";
          $realName.html() != $realName.attr("data-value") ? $realName.attr("data-value", $realName.html()):"";
          $phoneNumber.html() != $phoneNumber.attr("data-value") ? $phoneNumber.attr("data-value", $phoneNumber.html()):"";
          $birthday.html() != $birthday.attr("data-value") ? $birthday.attr("data-value", $birthday.html()):"";
          $location.html() != $location.attr("data-value") ? $location.attr("data-value", $location.html()):"";
          $aboutMe.html() != $aboutMe.attr("data-value") ? $aboutMe.attr("data-value", $aboutMe.html()):"";
          mShow("信息", "修改成功");
        } else {
          mShow("信息", "修改失败");
        }
      }, "text");
    });

    $("#cancel-update").click(function() {
      var $username = $("#username");
      var $realName = $("#realName");
      var $phoneNumber = $("#phoneNumber");
      var $birthday = $("#birthday");
      var $location = $("#location");
      var $aboutMe = $("#aboutMe");
      $username.html($username.attr("data-value"));
      $realName.html($realName.attr("data-value"));
      $phoneNumber.html($phoneNumber.attr("data-value"));
      $birthday.html($birthday.attr("data-value"));
      $location.html($location.attr("data-value"));
      $aboutMe.html($aboutMe.attr("data-value"));
    });

  });
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
