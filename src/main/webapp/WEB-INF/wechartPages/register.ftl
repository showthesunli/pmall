<#import "/spring.ftl" as spring/>
<#import "/lib/macro/hisuMacro.ftl" as sf/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width"/>
<meta name="viewport" content="initial-scale=1.0,user-scalable=no"/>
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/css.css'/>">
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/style.css'/>">
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/buttons.css'/>">
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/font-awesome.min.css'/>">
<script type="text/javascript" src="<@spring.url '/wechart/js/jquery-1.10.2.min.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/wechart/js/jquery.accordion.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/wechart/js/unslider.min.js'/>"></script>
<script language="javascript" src="<@spring.url '/wechart/js/jquery.validate.min.js'/>" ></script>
<script language="javascript" src="<@spring.url '/wechart/js/jquery.validate.addMethod.js'/>" ></script>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<title>微商城注册-逸乐生活网</title>
<style>
.getCodeBtn{background: -webkit-linear-gradient(#eee, #ccc); background: -o-linear-gradient(#eee, #ccc); background: -moz-linear-gradient(#eee, #ccc); background: linear-gradient(#eee, #ccc);color:#fff; width: 29%; margin-left: 1%; height: 40px; line-height: 40px; color: #666; border: 1px solid #999; border-radius: 3px;}
.tet{ padding-left:10px;}
.text_1{ position: relative;}
#id-error,#phone-error,#password-error,#confirm_password-error,#registerCode-error,#agree-error{ position:absolute; left: 10%; top:52px; color: #f00;}
#agree-error{ top:32px;}
input.error{ border-color: #f00;}
</style>
</head>
 
<body>
<div class="main_1" >
    <div class="login">
    	<div id="errorShow">
            <span class="errorTxt"><@sf.error field="msg"/></span>
        </div>
    	<form id="signupForm" class="registerForm" method="post" action="<@spring.url '/register'/>">
    	
		    <table width="100%" border="0" cellspacing="0" cellpadding="0">
		    	
		    	<tr class="text">
		        	<td class="text_1">
		        		<input type="text" id="id" name="id" class="tet" placeholder="用户名" maxlength="20" />		
		        	</td>		        	
		      	</tr>
		      	
		      	<tr class="text">
					<td class="text_1">
						<input type="password" id="password" name="password"  class="tet" placeholder="设置密码" maxlength="20" />			
					</td>
			    </tr>
			    
		      	<tr class="text">
					<td class="text_1">
						<input type="password" id="confirm_password" name="confirm_password"  class="tet" placeholder="确认密码" maxlength="20" />
					</td>
		      	</tr>
		      	
		      	<tr class="text">
		        	<td class="text_1">
		        		<input type="text" id="phone" name="phone" class="tet" placeholder="手机号码" maxlength="11" />	
		        	</td>
		     	</tr>
		     	
		      	<tr class="text">
		        	<td class="text_1">
		        		<input type="text" id="registerCode" name="mCode" class="tet" placeholder="验证码" style=" width:50% ;" maxlength="10" />
		        		 <button type="button" class="getCodeBtn"  id="second">获取验证码</button>
		        		
		        	</td>
		      	</tr>
		      	
		      	<tr class="text">
		        	<td class="text_1" style="height:40px">
		        		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		        		<input id="agree" name="agree" type="checkbox" value=""  checked="checked" style=" float: left; margin-left: 7.5%;"/>
		        		<span style=" float: left;">我已阅读并同意</span>
		        		<a href="<@spring.url '/registration'/>" style="color: #f60; text-decoration: underline; float: left;">《注册协议》</a>
		        	</td>
		      	</tr>
		      
		      	<tr style="width:100%; margin:10px auto; text-align:center;">
		        	<td><input type="submit" value="注 册" class="lg_btn" style="color:#fff;"/></td>
		      	</tr>
		
		      	<tr style="width:100%; margin:10px auto; text-align:center;">
		        	<td class="tt">已有账号，立即<a href="<@spring.url '/login'/>" style="color: #f60; text-decoration: underline;">登录</a></td>
		      	</tr>
		      	
		    </table>
		    
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
                    rangelength:[4,20]
                },
                password: {
                    required: true,
                    rangelength:[6,20]
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
                    rangelength: "长度只能在4-20个字符之间"
                },
                password: {
                    required: "请输入密码",
                    rangelength: "长度只能在6-20个字符之间"
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
            obj.text(wait + "S");
            wait--;
            setTimeout(function () {
                        time(obj)
                    },
                    1000);
        }
    }
    $("#second").click(function () {
        var phone = $("#phone").val();
        if (phone == "") {
            if ($("#phone-error").length == 0) {
                $('#phone').after('<label id="phone-error" class="error" for="phone">请输入手机号码</label>');
            } else
                $("#phone-error").css('display','block');
            return false;
        }
        var phoneRule = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0-9]|170)\d{8}$/;
        // 手机号码错误
        if (!phoneRule.test(phone)) {
            if ($("#phone-error").length == 0) {
                $('#phone').after('<label id="phone-error" class="error" for="phone">请输入正确的手机号码</label>');
            } else
                $("#phone-error").css('display','block');
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
                }else{
                    time(this);
                }
            }
        })
    });
</script>