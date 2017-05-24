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
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/font_1459473269_4751618.css'/>">
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/style.css'/>">
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/buttons.css'/>">
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/font-awesome.min.css'/>">
<script type="text/javascript" src="<@spring.url '/wechart/js/jquery-1.10.2.min.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/wechart/js/jquery.accordion.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/wechart/js/unslider.min.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/wechart/js/util.js'/>"></script>
<style>
.continueSBtn{background: -webkit-linear-gradient(#eee, #ccc); background: -o-linear-gradient(#eee, #ccc); background: -moz-linear-gradient(#eee, #ccc); background: linear-gradient(#eee, #ccc);color:#333; border-color: #999;}
.sCartTitle{ font-size: 16px; font-weight: bold; color: #f60;}
.f12{ font-size: 12px; font-weight: normal;}
.iconfont{ width: 16px; height: 16px; display: inline-block;}
.info_head{ position: relative;}
.right em{ display: block; -webkit-border-radius: 20px; border-radius: 20px; color: #FFF; font-size: 12px; line-height: 12px; margin-top: 5px; padding: 4px 8px; top: 50%; text-shadow: 0 0 #FFFFFF; font-style: normal;}
.right{ position: absolute; top:0; right:5px;}
.info_card_price{ line-height: 20px;}
</style>
</head>

<body ondragstart="return false;" onselectstart="return false;" oncontextmenu="return false" onselectstart="return false" 
ondragstart="return false" onbeforecopy="return false" oncopy=document.selection.empty() onselect=document.selection.empty()> 
<div id="page">
	<div class="banners">
		<a href="javascript:history.go(-1);"><img src="<@spring.url '/wechart/images/bg_info3.jpg'/>"></a>
	</div>
	<div id="content">
		
		<h2 class="sCartTitle">商品购物车</h2>
						
		<div class="info_head info_light">
			<a href="#" class="right"><em class="no">删</em></a>
			<div class="info_card">
				<a href="#">
					<i><img src="<@spring.url '/wechart/images/8.jpg'/>" /></i>
					<h1>商品名称商品名称商品名称商品名称商品名称商品名称商品名称</h1>
				</a>
			</div>
			
			
			<div class="info_card_price">
				<span class="left f12 red" style="width: 20%;">1</span>
				<span class="left f12 red" style="width: 30%;">￥100.00</span>
				<span class="left f12 red" style="width: 50%; text-align: right;">小计：￥100.00</span>
			</div>
		</div>
		
		
		<h2 class="sCartTitle">卡购物车</h2>
		<div class="info_head info_light">
			<a href="#" class="right"><em class="no">删</em></a>
			<div class="info_card">
				<a href="#">
					<i><img src="<@spring.url '/wechart/images/8.jpg'/>" /></i>
					<h1>111</h1>
				</a>
			</div>
			
			<div class="info_card_price">
				<span class="left f12 red" style="width: 20%;">1</span>
				<span class="left f12 red" style="width: 30%;">￥100.00</span>
				<span class="left f12 red" style="width: 50%; text-align: right;">小计：￥100.00</span>
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