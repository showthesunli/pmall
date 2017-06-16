<#import "/spring.ftl" as spring/>
<#import "/lib/macro/hisuMacro.ftl" as sf/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>注册-逸乐生活网</title>
<link rel="stylesheet" type="text/css" href="<@spring.url '/css/css.css'/>"/>
<link rel="stylesheet" type="text/css" href="<@spring.url '/css/style.css'/>"/>
<script type="text/javascript" src="<@spring.url '/js/jquery-1.7.2.min.js'/>"></script>
<script language="javascript" src="<@spring.url '/js/menu.js'/>" ></script>
<script language="javascript" src="<@spring.url '/js/jquery.validate.min.js'/>" ></script>
<script language="javascript" src="<@spring.url '/js/jquery.validate.addMethod.js?t=20170616'/>" ></script>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<style>
.topNav a{ line-height:37px;}
.titlePitch{ background:#ffefe5;}
.regFTitle{ text-align:center; margin-top:20px;}
.regFTitle h2{ float:left; padding:0 20px; cursor:pointer; font-size:14px; font-weight:bold; color:#ff6600; line-height:40px;}
.registerForm p{ position:relative;}
.txtLabel{width:48px;}
</style>
</head>

<body>

	<!--头部-->
	<#include "/lib/template/header.ftl" encoding="UTF-8">
	<!--头部-->

	<!--banner--> 
    <div style="background:url('images/titleTag/b_register.jpg') no-repeat center top;height:150px;"></div>
    <!--endbanner-->
        

    <div class="jf-main">
        <div class="ny_nav">
            <div class="ny_nav1">当前位置：<a href='<@spring.url "/index"/>'>首页</a> > 注册</div>
            <div class="clearfix"></div>
        </div>

        <div class="jf-width1200">
        	<div id="errorShow">
                <span class="errorTxt"><@sf.error field="msg"/></span>
            </div>
            <form id="signupForm" class="registerForm" method="post" action="<@spring.url '/register'/>">
                <p>
                    <label class="txtLabel" for="id">用<span style="width:6px; display:inline-block"></span>户<span style="width:6px; display:inline-block"></span>名</label>
                    <input id="id" name="id" type="text" class="registerTxt" maxlength="16" placeholder="您的账户名和登录名"  />
                    <@sf.error field="id"/>
                </p>

                <p>
                    <label class="txtLabel" for="password">设置密码</label>
                    <input id="password" name="password" type="password" class="registerTxt" maxlength="20" placeholder="请输入密码，密码至少6位"  />
                </p>

                <p>
                    <label class="txtLabel" for="confirm_password">确认密码</label>
                    <input id="confirm_password" name="confirm_password" type="password" class="registerTxt" maxlength="20" placeholder="再次输入您的密码"  />
                </p>

                <p>
                    <label class="txtLabel" for="phone">手机号码</label>
                    <input name="phone" id="phone" class="registerTxt" type="text" maxlength="11" placeholder="建议使用常用手机" />
                </p>

                <p style="margin-bottom:0;">
                    <label class="txtLabel">验<span style="width:6px; display:inline-block"></span>证<span style="width:6px; display:inline-block"></span>码</label>
                    <input name="mCode" id="registerCode" type="text" class="registerTxt" maxlength="6" placeholder="请输入验证码"  style="width:118px;"  />
                    <button type="button" class="sendCode"  id="second">获取验证码</button>
                </p>


                <p style="margin-bottom:0;">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    <input id="agree" name="agree" type="checkbox" value=""  checked="checked" style="margin-top:13px; margin-right:5px;"/>
                    <label>我已阅读并同意</label>
                    <a href="javascript:void(0);" onclick="proOpen()" style="color:#0099ff; line-height:40px;">《注册协议》</a>
                </p> 

                <p style="margin-bottom:10px;"><input type="submit" value="注册" class="registerBtn btnBgS" /></p>

                <p class="toLogin">已有账号<a href='<@spring.url "/login"/>'>请登录</a></p>

            </form>

            </div>

            

        </div>

	<!--底部-->
	<#include "/lib/template/footer.ftl" encoding="UTF-8">
    <!--end 底部-->

</body>
</html>

<script>
    $().ready(function () {
        // 在键盘按下并释放及提交后验证提交表单
        $("#signupForm").validate({
            rules: {
                id: {
                    required: true,
                    isId:[],
                    rangelength:[6,16]
                },
                password: {
                    required: true,
                    isPsw:[],
                    rangelength:[6,16]
                },
                confirm_password: {
                    required: true,
                    equalTo: "#password"
                },
                phone: {
                    required: true,
                    isPhone: []
                },
                agree: "required",
                mCode: "required"
            },
            messages: {
                id: {
                    required: "请输入用户名",
                    isId: "只能为数字、字母、指定符号@_任意的组合",
                    rangelength: "长度只能在6-16个字符之间"
                },
                password: {
                    required: "请输入密码",
                    isPsw: "只能为数字、字母、指定符号@_任意两种及以上的组合",
                    rangelength: "长度只能在6-16个字符之间"
                },
                confirm_password: {
                    required: "请输入密码",
                    equalTo: "两次密码输入不一致"
                },
                agree: "请接受我们的声明",
                mCode: "请输入验证码",
                phone: {
                    required: "请输入手机号码",
                    isPhone: "请输入正确的手机号码"
                },
            }
        });

    });
    
</script>

<script>

    // 空字符串判断
    function isEmpty(v, allowBlank) {
        return v === null || v === undefined || (!allowBlank ? v === "" : false);
    }

</script>

<script type="text/javascript">
    //验证码倒计时
    var wait = 60;
    $("#second").attr("disabled", false);
    function time(obj) {
        var obj = $(obj);
        if (wait == 0) {
            obj.removeAttr("disabled");
            obj.text("获取短信验证码");
            wait = 60;
        } else {
            obj.attr("disabled", true);
            obj.text(wait + "秒");
            wait--;
            setTimeout(function () {
                        time(obj)
                    },
                    1000);
        }
    }
    $("#second").click(function () {
        var phone = $("#phone").val();
        var id = $("#id").val();
        var psw = $("#password").val();
        var confirm_password = $("#confirm_password").val();
        
        showError(phone,'phone','请输入手机号码');
        showError(id,'id','请输入用户名');
        showError(psw,'password','请输入密码');
        showError(confirm_password,'confirm_password','请再次确认密码');
        
        if($("#phone-error").text()){
        	return false;
        }
        if($("#id-error").text()){
        	return false;
        }
        if($("#password-error").text()){
        	return false;
        }
        if($("#confirm_password-error").text()){
        	return false;
        }

        //ajax发送验证码
        var phoneNumber = $("#phone").val();
        var mcode = "";
        var $this = this;
        $.ajax({
            url:"<@spring.url '/sendMcode'/>",
            data:"mobile="+phoneNumber,
            type:"GET",
            dataType: "json",
            success: function (data) {
                if(data.errorMsg.msg){
                    if ($("#phone-error").length == 0) {
                        $('#phone').after('<label id="phone-error" class="error" for="phone">'+data.errorMsg.msg+'</label>');
                    } else{
                        $("#phone-error").css('display','block').text(data.errorMsg.msg);
                    }
                }
            }
        })
        time(this);
    });
function showError(val,obj,txt){
	if(val == ""){
		if ($("#"+obj+"-error").length == 0) {
			$('#'+obj).after('<label id="'+obj+'-error" class="error" for="'+obj+'">'+txt+'</label>');
		} else{
			$("#"+obj+"-error").css('display','block');
		}
		return false;
	}
}
</script>