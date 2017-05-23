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
<title>快捷兑换</title>
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/style.css'/>">
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/font-awesome.min.css'/>">
<script type="text/javascript" src="<@spring.url '/wechart/js/jquery-1.10.2.min.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/wechart/js/jquery.accordion.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/wechart/js/unslider.min.js'/>"></script>
</head>

<body ondragstart="return false;" onselectstart="return false;" oncontextmenu="return false" onselectstart="return false" 
ondragstart="return false" onbeforecopy="return false" oncopy=document.selection.empty() onselect=document.selection.empty()> 
<div id="page">
	<div class="banners">
		<a href="javascript:history.go(-1);"><img src="<@spring.url '/wechart/images/bg_info5.jpg'/>"></a>
	</div>
	<div id="content">
		
		<div class="info_head info_light">
			<div class="info_card">
				<a href="<@spring.url '/quickExchangeTHCard'/>">
				<i><img src="<@spring.url '/wechart/images/8.jpg'/>"></i>
				<h1>诺基亚 Lumia 520 超低价格，不要错过哦！wp8超值入门</h1>
				<span class="titles">￥299.00</span>
				</a>
			</div>
			<div class="info_card">
				<a href="<@spring.url '/quickExchangeTHCard'/>">
				<i><img src="<@spring.url '/wechart/images/9.jpg'/>"></i>
				<h1>卓普小姿C35英寸全高清屏幕，441 PPI,四核处理器</h1>
				<span class="titles">￥1299.00</span>
				</a>
			</div>
			<div class="info_card">
				<a href="<@spring.url '/quickExchangeTHCard'/>">
				<i><img src="<@spring.url '/wechart/images/10.jpg'/>"></i>
				<h1>三星 I9158 3G手机5.8英寸屏，1.7GHz处理器！</h1>
				<span class="titles">￥5699.00</span>
				</a>
			</div>

		</div>
	
		<!--常用功能-->
		<#include "/lib/template/commFunctionsPage.ftl" encoding="UTF-8">
		<!--end 常用功能-->
		</div>	
		
		
		<div style="padding:15px;"></div>
	</div>
	
	<!--底部-->
	<#include "/lib/template/footer.ftl" encoding="UTF-8">
	<!--end 底部-->
	
</div>

</body>
</html>