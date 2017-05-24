<#import "/spring.ftl" as spring/>
<#import "/lib/macro/hisuMacro.ftl" as sf />
<#setting url_escaping_charset = "UTF-8"/>
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
<title>商品详情</title>
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/style.css'/>">
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/buttons.css'/>">
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/font-awesome.min.css'/>">
<script type="text/javascript" src="<@spring.url '/wechart/js/jquery-1.10.2.min.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/wechart/js/jquery.accordion.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/wechart/js/unslider.min.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/wechart/js/util.js'/>"></script>
<style>
.prodMin,.prodAdd{cursor: pointer; background: #f6f6f6; line-height: 26px; padding: 0 5px; display: inline-block; border: 1px solid #ccc; float: left;}
.prodMin{ border-right: none;}
.prodAdd{ border-left: none;}
.prodNum{ width: 30px; padding: 0 5px; line-height: 26px; text-align: center; border: 1px solid #ccc; float: left;}
.info_child span{ float: left;}
.info_child p{ overflow: hidden; margin: 5px 0;}
.pModel{overflow: hidden; display: inline-block;}
.pModel a{ line-height: 26px; border: 1px solid #ccc; padding: 0 5px; display: inline-block;}
.pModel .pModelBO{ border-color: #f60; color: #f60;}
</style>
</head>

<body ondragstart="return false;" onselectstart="return false;" oncontextmenu="return false" onselectstart="return false" 
ondragstart="return false" onbeforecopy="return false" oncopy=document.selection.empty() onselect=document.selection.empty()> 
<div id="page">
	<div class="banners">
		<a href="javascript:history.go(-1);"><img src="<@spring.url '/wechart/images/bg_info2.jpg'/>"></a>
	</div>
	<div id="content">
		<div class="box_exp info_light">
			<div class="info_integral">
				<span class="title"><i class="icon-bookmark-empty"></i>商品信息</span>
			</div>
			<div style="display: block; overflow: hidden; opacity: 1;">
				<div class="info_child" style=" overflow: hidden;">
					<div class="banner">
						<ul>
							<li style="background-image: url('images/index12.jpg');"></li>
							<li style="background-image: url('images/index1.jpg');"></li>
							<li style="background-image: url('images/index6.jpg');"></li>
							<li style="background-image: url('images/index4.jpg');"></li>
							<li style="background-image: url('images/index2.jpg');"></li>
						</ul>
					</div>
					<p><b>vivo X3 Hi-Fi 智能手机</b></p>
					<p>
						<span>型号：</span>
						<span class="pModel">
							<a href="javascript:void(0);" class="pModelBO">￥100.00</a>
							<a href="javascript:void(0);">￥200.00</a>
						</span>
					</p>
					<p>
						<span>数量：</span>
						<span style="overflow: hidden; display: inline-block;">
							<b class="prodMin">-</b>
							<input type="text" value="1" name="pNum" id="prdnum" class="prodNum">
							<b class="prodAdd">+</b>
						</span>
						<span>（库存 10 件）</span>
					</p>
				</div>
				<div class="info_child_txt">
					<a href="cart.html" class="left fb f14 red">￥100.00</a>
					<a href="cart.html" class="button button-rounded button-flat-caution right"><i class="icon-shopping-cart"></i> 加入购物车</a>
				</div>
			</div>
		</div>
	
	
		<div class="box_exp info_light">
			<div class="info_integral">
				<span class="title"><i class="icon-bookmark-empty"></i>商品简介</span>
			</div>
			<div style="display: block; overflow: hidden; opacity: 1;">
				<div class="info_child">
					<img src="<@spring.url '/wechart/images/1.jpg'/>">
					<p>vivo X3以5.75mm成就全球最薄的Hi-Fi智能手机；<br/>5.0英寸HD屏幕、极速4核CPU、800W像素背照式摄像头、500W 88度的广角前置摄像头... ...集万千宠爱于一身，却依然极致纤薄。</p>
				</div>
			</div>
		</div>
		
		
		<div style="margin:8px 0;"><a href="cart.html" class="button button-block button-rounded button-caution button-large"><i class="icon-shopping-cart"></i>&nbsp;&nbsp;加入购物车</a></div>
		
		
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
	
	//数量减
	$(".prodMin").click(function () {
		var v = $(this).next(".prodNum").attr("value");
		var num = parseInt(v) - 1;

		if (parseInt(v) == 1) {
			$(this).next(".prodNum").val(1);
		}
		else {
			$(this).next(".prodNum").val(num);
		}
	});
	//数量加
	$(".prodAdd").click(function () {
		var v = $(this).prev(".prodNum").attr("value");
		var num = parseInt(v) + 1;
		var stock = 10;
		
		if(num <= stock){
			$(this).prev(".prodNum").val(num);
		}
		else{
			$(this).prev(".prodNum").val(stock);
		}
	});	
	//数量手输判断
	$("#prdnum").keyup(function () {
		var v = $.trim($(this).attr("value"));
		var stock = 10;
		
		if(v > stock){$(this).val(stock);}
		else if(v <= stock && v > 0){$(this).val(v);}
		else{$(this).val(1);}
	});
});
</script>
</body>
</html>