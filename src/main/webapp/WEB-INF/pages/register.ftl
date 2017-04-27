<#import "/spring.ftl" as spring/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>注册-逸乐生活网</title>
<link rel="stylesheet" type="text/css" href="<@spring.url '/css/css.css'/>"/>
<link rel="stylesheet" type="text/css" href="<@spring.url '/css/style.css'/>"/>
<script type="text/javascript" src="<@spring.url '/js/jquery.js'/>"></script>
<script language="javascript" src="<@spring.url '/js/menu.js'/>" ></script>
<style>
.topNav a{ line-height:37px;}
.titlePitch{ background:#ffefe5;}
.regFTitle{ text-align:center; margin-top:20px;}
.regFTitle h2{ float:left; padding:0 20px; cursor:pointer; font-size:14px; font-weight:bold; color:#ff6600; line-height:40px;}
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

                <div class="ny_nav1">当前位置：<a href='index.html'>首页</a> > 注册</div>

                <div class="clearfix"></div>

            </div>

            

            <div class="jf-width1200">
                  
            <form class="registerFormForEmial">

       	    	<p><label>邮箱账号</label><input name="registerEmail"  class="registerTxt" type="text" placeholder="建议使用常用邮箱" /></p>

                <p><label>设置密码</label><input name="registerEPsd" type="password" class="registerTxt" placeholder="请输入密码，密码至少6位"  /></p>

                <p><label>确认密码</label><input name="registerEConPsd" type="password" class="registerTxt" placeholder="再次输入您的密码"  /></p>

                <p><label style="letter-spacing:6px;">验证码</label><input name="registerECode" type="text" class="registerTxt" placeholder="请输入验证码"  /></p>

                <p><input name="" type="checkbox" value=""  checked="checked"/><label style="line-height:20px;">我已阅读并同意</label><a href="#" style="color:#0099ff">《注册协议》</a></p> 

                <p style="margin-bottom:10px;"><input type="submit" value="注册" class="registerBtn btnBgS" /></p>

                <p class="toLogin">已有账号<a href="login.html">请登录</a></p>

            </form>

            </div>

            

        </div>

	<!--底部-->
	<#include "/lib/template/footer.ftl" encoding="UTF-8">
    <!--end 底部-->

</body>

</html>