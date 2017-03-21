// JavaScript Document
var loginModule = new function () {
    this.callback = null;
    this.openLoginForm = function (callback) {
        this.callback = callback;
        $.ajax({
            type: "POST",
            url: "member/checkLogin.jsp",
            cache: false,
            async: false,
            data: "",
            dataType: "text",
            success: function (feed_back) {
                if (feed_back.length > 60) {
                    if ($("#thickbox").html()) {
                        //$("#thickbox").OpenDiv();
                        $("#thickbox").pupOpen();
                        return;
                    }
                    $.ajax({
                        type: "POST",
                        url: "loginBox.jsp",
                        cache: false,
                        async: false,
                        data: "",
                        success: function (html) {
                            $("body").append(html);
                            pupOpen();
                            //$("#thickbox").OpenDiv();
                        },
                        error: function (msg) {
                            alert("网络有问题！" + msg);
                        }
                    });
                } else {
                    loginModule.callback.call();
                }
            },
            error: function (msg) {
                alert("网络有问题:" + msg);
            }
        });
    };

    this.login = function () {
        var fuserName = $("#f-uid").val();
        var fpassword = $("#f-upw").val();
        //var fvcode = $("#f-vcode").val();
        var fleave = $("#f-leave:checked").val();
        if (fuserName == "" || fuserName == "账户或邮箱或手机号" || fpassword == "") {
            alert("用户名和密码不能为空！");
            return;
        }
        /*if(fvcode==""){
         alert("验证码不能为空！");
         return;
         }*/
        fpassword = encPsw($('#keyfield'), $("#f-upw"));
        var reqdata = "username=" + fuserName + "&pswd=" + fpassword + "&type=ajax&leave=" + fleave;
        $.ajax({
            type: "POST",
            url: "login",
            cache: false,
            async: false,
            data: reqdata,
            success: function (msg) {
                if (msg.indexOf("login") > -1) {
                    pupClose();
                    loginModule.callback.call();
                } else {
                    alert(msg.substring(msg.indexOf("err=") + 4));
                    //$("#f-vimg").attr("src","vcode?id="+new Date());
                    //$("#f-vcode").val("");
                }
            },
            dataType: "text"
        });
    };
    this.getVcode = function (obj) {
        if (obj)
            $(obj).attr("src", "vcode?id=" + new Date().getTime().toString(36));
        else
            $("#f-vimg").attr("src", "vcode?id=" + new Date());
    }
    this.uidfcs = function (obj) {
        if ($(obj).val() == "账户或邮箱或手机号")$(obj).val("");
    }
    this.uidblr = function (obj) {
        if ($(obj).val() == "")$(obj).val("账户或邮箱或手机号");
    }
}