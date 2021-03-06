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
<title>账号登录</title>
<style>
input{ outline:none;}
.text_1{ position: relative;}
#username-error,#password-error{ position:absolute; left: 10%; top:52px; color: #f00;}
input.error{ border-color: #f00;}
.login{ margin-top: 0;}
</style>
</head>
 
<body>
<div class="main_1" >
	<div class="hy">您好，欢迎登录！</div>
	<div id="errorShow">
        <span class="errorTxt"><#if SPRING_SECURITY_LAST_EXCEPTION??>${SPRING_SECURITY_LAST_EXCEPTION.message}</#if></span>
    </div>
    <div class="login">
    <form class="loginForm" action="<@spring.url '/login'/>" method="post">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr class="text">
        <td class="text_1"><input type="text" id="username" name="username" class="tet" placeholder="请输入用户名" maxlength="16" style="padding-left:10px;"></td>
      </tr>
      <tr class="text">
		<td class="text_1"><input type="password" id="password" name="password"  class="tet" placeholder="输入登录密码" style="padding-left:10px;"></td>
      </tr>
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
      <tr class="text">
        <td class="text_1"><input type="submit" value="登 录" class="lg_btn" style="color:#fff;"/></td>
      </tr>
      <tr class="text">
      	<td class="tx" style="margin-left: 7.5%; width: 40%;"><input type="button" value="忘了密码？" onclick="window.location.href='<@spring.url "/forgotPassword"/>'" class="lg_btn" style="color:#fff; width: 100%;" /></td>
        <td class="tc" style="margin-right: 7.5%; width: 40%;"><input type="button" value="新用户注册" onclick="window.location.href='<@spring.url "/register"/>'" class="lg_btn" style="color:#fff; width: 100%;"  /></td>
      </tr>
    </table>
    <form>
    <div class="foot_1">技术支持：睿颢软件|逸乐生活</div>
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
        $(".loginForm").validate({
            rules: {
                username: {
                    required: true,
                    rangelength:[6,16]
                },
                password: {
                    required: true,
                    rangelength:[6,20]
                },
            },
            messages: {
                username: {
                    required: "请输入用户名",
                    rangelength: "长度只能在6-16个字符之间"
                },
                password: {
                    required: "请输入密码",
                    rangelength: "长度只能在6-20个字符之间"
                },
            }
        });
    });
</script>