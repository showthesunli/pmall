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
<title>购物车</title>
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/style.css'/>">
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/buttons.css'/>">
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/font-awesome.min.css'/>">
<script type="text/javascript" src="<@spring.url '/wechart/js/jquery-1.10.2.min.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/wechart/js/jquery.accordion.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/wechart/js/unslider.min.js'/>"></script>
<style>
.continueSBtn{background: -webkit-linear-gradient(#eee, #ccc); background: -o-linear-gradient(#eee, #ccc); background: -moz-linear-gradient(#eee, #ccc); background: linear-gradient(#eee, #ccc);color:#333; border-color: #999;}
</style>
</head>

<body ondragstart="return false;" onselectstart="return false;" oncontextmenu="return false" onselectstart="return false" 
ondragstart="return false" onbeforecopy="return false" oncopy=document.selection.empty() onselect=document.selection.empty()> 
<div id="page">
	<div class="banners">
		<a href="javascript:history.go(-1);"><img src="<@spring.url '/wechart/images/bg_info3.jpg'/>"></a>
	</div>
	<div id="content">
		
	
		<div class="info_head info_light">
			<div class="info_card">
				<a href="<@spring.url '/singleGood'/>">
				<i><img src="images/8.jpg"></i>
				<h1>诺基亚 Lumia 520 超低价格，不要错过哦！wp8超值入门</h1>
				</a>
			</div>
			<div class="info_card_price">
				<a href="<@spring.url '/singleGood'/>" class="left fb f14 red">￥2980.00</a>
				<a href="#" class="right"><em class="no">删</em></a>
			</div>
		</div>
		
		
		<div class="box_exp info_light">
			<div class="info_integral">
				<span class="titles"><i class="icon-bookmark-empty"></i>总计 - ￥1680元</span>
			</div>
		</div>
		
		<div style="margin:8px 0;"><a href="<@spring.url '/cart_buy'/>" class="button button-block button-rounded button-caution button-large"><i class="icon-shopping-cart"></i>&nbsp;&nbsp;卡下单</a></div>
		<div style="margin:8px 0;"><a href="<@spring.url '/cart_buy'/>" class="button button-block button-rounded button-caution button-large"><i class="icon-shopping-cart"></i>&nbsp;&nbsp;商品下单</a></div>
		<div style="margin:8px 0;"><a href="<@spring.url '/goodClass'/>" class="button button-block button-rounded button-caution button-large continueSBtn">继续购物</a></div>
		
		
		<div style="padding:15px;"></div>
	</div>
	
	<!--底部-->
	<#include "/lib/template/footer.ftl" encoding="UTF-8">
	<!--end 底部-->
	
</div>

</body>
</html>