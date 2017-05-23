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
.modifyBtn,.addBtn{ padding: 0 10px; height: 1.75em; background: #fff; color: #3897d7; border: 1px solid #3897d7; border-radius: 5px;}
.addBtn{ color: #f60; border: 1px solid #f60; margin-left: 20px;}
.info_child{ color: #333;}
.info_light .title{ background: url(../images/arrow.png) no-repeat right 50%;}
</style>
</head>

<body ondragstart="return false;" onselectstart="return false;" oncontextmenu="return false" onselectstart="return false" 
ondragstart="return false" onbeforecopy="return false" oncopy=document.selection.empty() onselect=document.selection.empty()> 
<div id="page">
	<div class="banners">
		<a href="javascript:history.go(-1);"><img src="<@spring.url '/wechart/images/bg_info3.jpg'/>"></a>
	</div>
	<div id="content">
		
		<div class="box_exp info_light">
			<div class="info_integral">
				<span class="title"><i class="icon-bookmark-empty"></i>收货人信息</span>
			</div>
			<div style="display: block; overflow: hidden; opacity: 1;">
				<div class="info_child">
					<p>收货人：王某某</p>
					<p>手&nbsp;&nbsp;&nbsp;机：13888888888</p>
					<p>地&nbsp;&nbsp;&nbsp;址：天津市</p>
				</div>
				<div class="info_child_txt" style="text-align: center;">
					<input type="button" value="修 改" class="modifyBtn" />
					<input type="button" value="添 加" class="addBtn" />
				</div>
			</div>
		</div>
		<div class="box_exp info_light">
			<div class="info_integral">
				<span class="title"><i class="icon-bookmark-empty"></i>发票信息</span>
			</div>
			<div style="display: block; overflow: hidden; opacity: 1;">
				<div class="info_child">
					<a href="javascript:void(0);">
						<p>发票抬头：发票抬头</p>
						<p>发票内容：办公用品</p>
					</a>
				</div>
				<div class="info_child_txt" style="text-align: center;">
					<input type="button" value="修 改" class="modifyBtn" />
					<input type="button" value="添 加" class="addBtn" />
				</div>
			</div>
		</div>
		<div class="box_exp info_light">
			<div class="info_integral">
				<span class="title"><i class="icon-bookmark-empty"></i>支付方式</span>
			</div>
			<div style="display: block; overflow: hidden; opacity: 1;">
				<div class="info_child">
					<a href="javascript:void(0);">
					<p>支付方式：在线支付</p>
					</a>
				</div>
				<div class="info_child_txt" style="text-align: center;">
					<input type="button" value="修 改" class="modifyBtn" />
				</div>
			</div>
		</div>
		
		<div class="box_exp info_light">
			<div class="info_integral">
				<span class="title"><i class="icon-bookmark-empty"></i>订单信息</span>
			</div>
			<div style="display: block; overflow: hidden; opacity: 1;">
				<div class="info_child">
					<a href="javascript:void(0);">
						<p>商品金额：198.00</p>
						<p>返还现金：0.00</p>
						<p>应付总额：198.00</p>
					</a>
				</div>
				<div class="info_child_txt">
					<a href="cart.html" class="left">请在24小时内完成支付,过时订单将被取消！</a>
				</div>
			</div>
		</div>
		<div class="box_exp info_light">
			<div class="info_integral">
				<span class="titles"><i class="icon-bookmark-empty"></i>总计 - ￥1680元</span>
			</div>
		</div>
		
		
		
		
		<div style="margin:8px 0;"><a href="javascript:void(0);" class="button button-block button-rounded button-caution button-large"><i class="icon-shopping-cart"></i>&nbsp;&nbsp;确定下单</a></div>
		
		
		<div style="padding:15px;"></div>
	</div>
	
	<!--底部-->
	<#include "/lib/template/footer.ftl" encoding="UTF-8">
	<!--end 底部-->
	
</div>

<script>
$(document).ready(function() {
	$("#content").accordion({
		alwaysOpen: false,
		autoheight: false,
		header: '.info_integral',
		clearStyle: true
	});
});
</script>

</body>
</html>