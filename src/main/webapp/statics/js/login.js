jQuery(function($) {
    $(document).on('click', '.toolbar a[data-target]', function(e) {
        e.preventDefault();
        var target = $(this).data('target');
        $('.widget-box.visible').removeClass('visible');//hide others
        $(target).addClass('visible');//show target
    });
});

jQuery(function($) {
    var $bgs = $(".bgs");
    var length = $bgs.find("li").length;
    //轮播
    var prev = 0;
    var curr = 1;
    setInterval(function() {
        $bgs.find("li:eq("+ prev +")").animate({opacity: 0}, 1000);
        $bgs.find("li:eq("+ curr +")").animate({opacity: 1}, 1000);
        prev = curr;
        //判断是否是最后一张
        if (curr < length-1) {
            curr++;
        } else {
            curr = 0;
        }
    }, 5000);
});

/*绑定登录，注册按钮回车事件*/
jQuery(function($) {
    $("#login-box").keypress(function(e) {
        if (e.keyCode == 13) {
            login();
        }
    });
});

function login() {
    var username = $("#username"),
        password = $("#password"),
        checkCode = $("#check-code"),
        remember = $("#remember");
    if (!username.val()) {
        username.addClass("error").attr("placeholder","请输入用户名");
        username.get(0).focus();
        return;
    }

    if (!password.val()) {
        password.addClass("error").attr("placeholder","请输入密码");
        password.get(0).focus();
        return;
    }

    if (!checkCode.val()) {
        checkCode.addClass("error").attr("placeholder","请输入验证码");
        checkCode.get(0).focus();
        return;
    }
    $.post($path + "/login/login",{"username":username.val(),"password":password.val(),"check-code":checkCode.val(),"remember-me":document.getElementById("remember").checked},function(data) {
        if (data) {
            $("#message-box").html("<i class='ace-icon fa "+ (data.state == "success" ? "fa-check light-green":"fa-times red2") +"'></i>&nbsp;&nbsp;<label class='inline' style='color:"+ (data.state == "success" ? "green":"red") +";'>"+ data.info +"</label>");
            if (data.state == "success")
                location.href = $path + "/login/toIndex";
        } else {
            $("#message-box").html("<i class='ace-icon fa fa-times red2'></i>&nbsp;&nbsp;<label class='inline' style='color:red;'>登录失败,请稍后重试</label>");
        }
    },"json");

}