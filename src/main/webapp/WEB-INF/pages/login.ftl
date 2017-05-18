<#import "/spring.ftl" as spring/><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>登录-逸乐生活网</title><link rel="stylesheet" type="text/css" href="<@spring.url '/css/css.css'/>"/><link rel="stylesheet" type="text/css" href="<@spring.url '/css/style.css'/>"/><script type="text/javascript" src="<@spring.url '/js/jquery-1.7.2.min.js'/>"></script><script language="javascript" src="<@spring.url '/js/menu.js'/>" ></script><script language="javascript" src="<@spring.url '/js/jquery.validate.min.js'/>" ></script><style>.topNav a{ line-height:37px;}.loginForm{ width:302px;}.loginForm p{ position:relative;}#username-error,#password-text-error{ position:absolute; left:305px; top:4px; color:#f00; padding:0 10px; background:#ffebe7; line-height:30px; border:1px solid #f00; border-radius:5px;}.forgotPsd{ float: left; margin-left: 180px;}</style></head><body>	<!--头部-->	<#include "/lib/template/header.ftl" encoding="UTF-8">	<!--头部-->    <!--banner-->     <div style="background:url('images/titleTag/b_login.jpg') no-repeat center top;height:150px;"></div>    <!--endbanner-->         <div class="jf-main">		<div class="ny_nav">			<div class="ny_nav1">当前位置：<a href='index.html'>首页</a> > 登录</div>			<div class="clearfix"></div>		</div>         		<div class="jf-width1200">			<form class="loginForm" action="<@spring.url '/login'/>" method="post">							<p>					<b class="bgImgS" style="background-position:0 -30px;"></b>					<input id="username" name="username" maxlength="20" class="loginTxt" type="text" placeholder="用户名/手机/邮箱"  />				</p>				<p>					<b class="bgImgS" style="background-position:0 -52px;"></b>					<input class="loginTxt" id="password-text" name="password" type="password" maxlength="20" placeholder="请输入密码" />				</p>				<p>					<input name="rember_me" type="checkbox"  />					<label>自动登录</label>					<a href="#" class="forgotPsd">忘记密码？</a>				</p>	            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>		            <p style="margin-bottom:10px;"><input type="submit" value="登录" class="loginBtn btnBgS" /></p>				<p class="toRegister" style="margin-left:190px;">还没有账号<a href="<@spring.url "/register"/>">请注册</a></p>			</form>                           	</div>    </div>	<!--底部-->	<#include "/lib/template/footer.ftl" encoding="UTF-8">    <!--end 底部--></body></html><script>    $().ready(function () {        // 在键盘按下并释放及提交后验证提交表单        $(".loginForm").validate({            rules: {                username: {                    required: true,                    rangelength:[4,20]                },                password: {                    required: true,                    rangelength:[6,20]                },            },            messages: {                username: {                    required: "请输入用户名",                    rangelength: "长度只能在4-20个字符之间"                },                password: {                    required: "请输入密码",                    rangelength: "长度只能在6-20个字符之间"                },            }        });    });</script>