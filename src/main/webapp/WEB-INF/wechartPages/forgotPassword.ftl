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
<meta name="description" content="途皓（北京）商务服务有限公司" />
<meta name="keywords" content="途皓（北京）商务服务有限公司" />
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
<title>修改密码</title>
<style>
.getCodeBtn{background: -webkit-linear-gradient(#eee, #ccc); background: -o-linear-gradient(#eee, #ccc); background: -moz-linear-gradient(#eee, #ccc); background: linear-gradient(#eee, #ccc);color:#fff; width: 29%; margin-left: 1%; height: 40px; line-height: 40px; color: #666; border: 1px solid #999; border-radius: 3px;}
.tet{ padding-left:10px;}
.text_1{ position: relative;}
#username-error,#registerCode-error,#password-error,#confirm_password-error{ position:absolute; left: 10%; top:52px; color: #f00;}
input.error{ border-color: #f00;}
</style>
</head>
 
<body>
<div class="main_1" >
    <div class="login">
    	<div id="errorShow">
		    <span class="errorTxt"><@sf.error field="msg"/></span>
		</div>
		
    	<form id="signupForm" class="registerForm" method="post" action="<@spring.url '/forgotPassword'/>">
    	
		    <table width="100%" border="0" cellspacing="0" cellpadding="0">
		    	
		    	<tr class="text">
		        	<td class="text_1">
		        		<input type="text" id="username" name="username" class="tet" placeholder="请输入用户名" maxlength="16" />		
		        	</td>
		      	</tr>
		      			     	
		      	<tr class="text">
		        	<td class="text_1">
		        		<input type="text" id="registerCode" name="mCode" class="tet" placeholder="请输入验证码" style=" width:50% ;" maxlength="4" />
		        		<button type="button" class="getCodeBtn"  id="second">获取验证码</button>
		        		
		        	</td>
		      	</tr>
		      	<tr class="text">
					<td class="text_1">
						<input type="text" onfocus="this.type='password'" id="password" name="password"  class="tet" placeholder="请设置密码，至少六位" maxlength="20" />			
					</td>
			    </tr>
			    <tr class="text">
					<td class="text_1">
						<input type="text" onfocus="this.type='password'" id="confirm_password" name="confirm_password"  class="tet" placeholder="请再次输入密码" maxlength="20" />			
					</td>
			    </tr>
		      
		      	<tr style="width:100%; margin:10px auto; text-align:center;">
		        	<td>
		        		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		        		<input type="submit" value="修改密码" class="lg_btn" style="color:#fff;"/></td>
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
                username: {
                    required: true,
                    isUsername:[],
                    rangelength:[6,16]
                },
                password: {
                    required: true,
                    isPsw:[],
                    rangelength:[6,20]
                },
                 confirm_password: {
                    required: true,
                    equalTo: "#password"
                },
                mCode:  {
					required: true,
					isNum: [],
					rangelength:[4,4]
				},
            },
            messages: {
                username: {
                    required: "请输入用户名",
                    isUsername:"只能为数字、字母、指定符号@_任意的组合",
                    rangelength: "长度只能在6-16个字符之间"
                },
                password: {
                    required: "请输入密码",
                    isPsw: "只能为数字、字母、指定符号@_任意两种及以上的组合",
                    rangelength: "长度只能在6-20个字符之间"
                },
                confirm_password: {
                    required: "密码不能为空",
                    equalTo: "两次密码输入不一致"
                },
                mCode: {
					required: "请输入验证码",
					isNum: "只能为数字",
					rangelength:"长度只能为4"
				},
            }
        });
        $.validator.addMethod("isUsername", function (value, element) {
			var id = $("#username").val();
			var idRule = /^[a-zA-Z0-9@_]{0,}$/;
			
			if(id != ""){
				if (!idRule.test(id))
					return false;
			}
			return true;
		}, "ignore");
		$("#password").bind("copy cut paste",function(e){
			return false;
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
            obj.text(wait + "秒");
            wait--;
            setTimeout(function () {
                        time(obj)
                    },
                    1000);
        }
    }
    $("#second").click(function () {
    	var username = $("#username").val();
        if (username == "") {
            if ($("#username-error").length == 0) {
                $('#username').after('<label id="username-error" class="error" for="username">请输入用户名</label>');
            } else
                $("#username-error").css('display','block');
            return false;
        }

   var username = $("#username").val();
        var mcode = "";
        var $this = this;
        $.ajax({
            url:"<@spring.url '/sendForgotPasswordCode'/>",
            data:"memberID="+username,
            type:"GET",
            dataType: "json",
            success: function (data) {
               if(data.errorMsg.msg){
                    if ($("#username-error").length == 0) {
                        $('#username').after('<label id="username-error" class="error" for="username">'+data.errorMsg.msg+'</label>');
                    } else{
                        $("#username-error").css('display','block').text(data.errorMsg.msg);
                    }
                }
            }
       })
       time(this);
     });
</script>