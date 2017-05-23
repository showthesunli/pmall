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
<title>注册会员</title>
<style>
.getCodeBtn{background: -webkit-linear-gradient(#eee, #ccc); background: -o-linear-gradient(#eee, #ccc); background: -moz-linear-gradient(#eee, #ccc); background: linear-gradient(#eee, #ccc);color:#fff; width: 29%; margin-left: 1%; height: 40px; line-height: 40px; color: #666; border: 1px solid #999; border-radius: 3px;}	
</style>
</head>
 
<body>
<div class="main_1" >
    <div class="login">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr class="text">
        <td class="text_1"><input type="text" name="username" class="tet" placeholder="用户名" style="padding-left:10px;"></td>
      </tr>
      <tr class="text">
		<td class="text_1"><input type="text" name="username"  class="tet" placeholder="设置密码" style="padding-left:10px;"></td>
      </tr>
      <tr class="text">
		<td class="text_1"><input type="text" name="username"  class="tet" placeholder="确认密码" style="padding-left:10px;"></td>
      </tr>
      <tr class="text">
        <td class="text_1"><input type="text" name="username" class="tet" placeholder="手机号码" style="padding-left:10px;"></td>
      </tr>
      <tr class="text">
        <td class="text_1"><input type="text" name="username" class="tet" placeholder="验证码" style="padding-left:10px; width:50% ;"><input type="button" value="获取验证码" class="getCodeBtn" style=""/></td>
      </tr>
      <tr class="text">
        <td class="text_1" style="height:40px"><input id="agree" name="agree" type="checkbox" value=""  checked="checked" style=" float: left; margin-left: 7.5%;"/><span style=" float: left;">我已阅读并同意</span><a href="javascript:void(0);" style="color: #f60; text-decoration: underline; float: left;">《注册协议》</a></td>
      </tr>
      
      <tr style="width:100%; margin:10px auto; text-align:center;">
        <td><input type="submit" value="注 册" class="lg_btn" style="color:#fff;"/></td>
      </tr>
<!--      <tr style="width:100%; margin:10px auto; text-align:center;">
        <td><input type="submit" value="立即注册" class="lg_btn" style="color:#344204;"/></td>
      </tr>-->
      <tr style="width:100%; margin:10px auto; text-align:center;">
        <td class="tt">已有账号，立即<a href="<@spring.url '/login'/>" style="color: #f60; text-decoration: underline;">登录</a></td>
      </tr>
    </table>
    </div>
</div>

	<!--底部-->
	<#include "/lib/template/footer.ftl" encoding="UTF-8">
	<!--end 底部--> 

</body>
</html>
