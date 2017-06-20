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
<script language="javascript" src="<@spring.url '/wechart/js/jquery.validate.addMethod.js?t=20170616'/>" ></script>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<title>微商城注册-逸乐生活网</title>
<style>
.getCodeBtn{background: -webkit-linear-gradient(#eee, #ccc); background: -o-linear-gradient(#eee, #ccc); background: -moz-linear-gradient(#eee, #ccc); background: linear-gradient(#eee, #ccc);color:#fff; width: 29%; margin-left: 1%; height: 40px; line-height: 40px; color: #666; border: 1px solid #999; border-radius: 3px;}
.tet{ padding-left:10px;}
.text_1{ position: relative;}
#id-error,#phone-error,#password-error,#confirm_password-error,#registerCode-error,#agree-error{ position:absolute; left: 8%; top:52px; color: #f00;}
#agree-error{ top:32px;}
#id-error{font-size: 10px;}
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
		        		<input type="text" id="id" name="id" class="tet" placeholder="您的账户名和登录名" maxlength="16" />		
		        	</td>		        	
		      	</tr>
		      	
		      	<tr class="text">
					<td class="text_1">
						<input type="password" id="password" name="password"  class="tet" placeholder="请输入密码，密码至少6位" maxlength="20" />			
					</td>
			    </tr>
			    
		      	<tr class="text">
					<td class="text_1">
						<input type="password" id="confirm_password" name="confirm_password"  class="tet" placeholder="再次输入您的密码" maxlength="20" />
					</td>
		      	</tr>
		      	
		      	<tr class="text">
		        	<td class="text_1">
		        		<input type="text" id="phone" name="phone" class="tet" placeholder="建议使用常用手机" maxlength="11" />	
		        	</td>
		     	</tr>
		     	
		      	<tr class="text">
		        	<td class="text_1">
		        		<input type="text" id="registerCode" name="mCode" class="tet" placeholder="请输入验证码" style=" width:50% ;" maxlength="4" />
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
                mCode:  {
					required: true,
					isNum: [],
					rangelength:[4,4]
				},
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
                mCode: {
					required: "请输入验证码",
					isNum: "只能为数字",
					rangelength:"长度只能为4"
				},
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
            obj.text("获取验证码");
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