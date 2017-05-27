<#import "/spring.ftl" as spring/>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<meta name="format-detection" content="telephone=no" />
<meta name="keywords" content="微信,微信公众平台" />
<meta name="description" content="微信公众平台自助引擎" />
<title>微商城快捷查询-逸乐生活网</title>
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/font_1459473269_4751618.css'/>">
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/style.css'/>">
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/buttons.css'/>">
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/font-awesome.min.css'/>">
<script type="text/javascript" src="<@spring.url '/wechart/js/jquery-1.10.2.min.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/wechart/js/jquery.accordion.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/wechart/js/unslider.min.js'/>"></script>
<script language="javascript" src="<@spring.url '/wechart/js/jquery.validate.min.js'/>" ></script>
<style>
input{ outline:none;}
#content p{ position: relative; margin: 30px 0;}
#mobile-error{ position:absolute; left: 0; top:42px; color: #f00;}
</style>
</head>

<body>
<div id="page">
	<div class="banners">
		<a href="javascript:history.go(-1);"><img src="<@spring.url '/wechart/images/bg_info8.jpg'/>"></a>
	</div>
	<div id="content">
		<form id="signupForm" method="post" action="<@spring.url '/quickSearchOrder'/>">
		<p style="border: 1px solid #ccc;">
			<input type="text" value="" id="mobile" name="mobile" class="cardInputTxt cardPswTxt" placeholder="请输入手机号码" style=" width: 100%; line-height: 40px; height: 40px; text-indent: 10px; border: none;" />
		</p>
		<div style="margin:8px 0;">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="submit" value="查 询" class="button button-caution button-large" style=" width: 100%;" />
		</div>
		</form>
	</div>
		
	<div style="padding:15px;"></div>
	
	<!--底部-->
	<#include "/lib/template/footer.ftl" encoding="UTF-8">
	<!--end 底部-->
	
</div>
</body>
</html>
<script>
$().ready(function () {
    // 在键盘按下并释放及提交后验证提交表单
    $("#signupForm").validate({
		rules: {               
			mobile: {
				required: true,
				isPhone: []
			},
		},
		messages: {
			mobile: {
				required: "请输入手机号码",
				isPhone: "请输入正确的手机号码"
			},
		}
	});
});
$.validator.addMethod("isPhone", function (value, element) {
        var phone = $("#mobile").val();// 手机号码
        var phoneRule = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0-9]|170)\d{8}$/;

        // 手机号码错误
        if (!phoneRule.test(phone))
            return false;
        return true;
    }, "ignore");
</script>