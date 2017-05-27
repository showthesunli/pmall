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
<title>微商城购物车-逸乐生活网</title>
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
.info_card i img{ min-height: 40px;}
.info_card{ margin-top: 10px;}
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
		
		<#if buyerItemList??>
		<#list buyerItemList as item>
		<#if item.prdType == "0">
						
		<div class="info_head info_light">
			<a href="javascript:delItem('${item.prdNo}','${item.money?c}','${item.amount}')" class="right"><em class="no">删</em></a>
			
			<#if item.fileName != "">
				
			<div class="info_card">
				<a href="<@spring.url '/proshow;prdNo=${item.prdNo};keyWordsFld=${item.prdNo};'/>">
					<i><img src="<@spring.url '/imgsrc/${item.fileName?if_exists}'/>" onerror="downloadErrImg(this,'${item.fileName?if_exists}','../imgsrc')" /></i>
					<h1>${item.prdName?if_exists}</h1>
				</a>
			</div>
			
			<#else >
			
			<div class="info_card">
				<a href="<@spring.url '/proshow;prdNo=${item.prdNo};keyWordsFld=${item.prdNo};'/>">
					<i><img src="<@spring.url '/imgsrc/${item.fileName?if_exists}'/>" /></i>
					<h1>${item.prdName?if_exists}</h1>
				</a>
			</div>
			
			</#if>
			
			<div class="info_card_price">
				<span class="left f12 red" style="width: 20%;">${item.amount}</span>
				<span class="left f12 red" style="width: 30%;">￥${item.money}</span>
				<span class="left f12 red" style="width: 50%; text-align: right;">小计：￥${item.money * item.amount}</span>
			</div>
		</div>
		
		</#if>
		</#list>
		</#if>
		
		<div class="box_exp info_light">
			<div class="info_integral">
				<span class="titles"><i class="icon-bookmark-empty"></i>总计 - ￥${prdMoney}元</span>
			</div>
		</div>
		
		<h2 class="sCartTitle">卡购物车</h2>

		<#if buyerItemList??>
		<#list buyerItemList as item>
		<#if item.prdType != "0">
		
		<div class="info_head info_light">
			
			<a href="javascript:delItem('${item.prdNo}','${item.money?c}','${item.amount}')" class="right"><em class="no">删</em></a>
			
			<#if item.fileName != "">
				
			<div class="info_card">
				<a href="<@spring.url '/proshow;prdNo=${item.prdNo};keyWordsFld=${item.prdNo};'/>">
					<i><img src="<@spring.url '/imgsrc/${item.fileName?if_exists}'/>" onerror="downloadErrImg(this,'${item.fileName?if_exists}','../imgsrc')" /></i>
					<h1>${item.prdName?if_exists}</h1>
				</a>
			</div>
			
			<#else >
			
			<div class="info_card">
				<a href="<@spring.url '/proshow;prdNo=${item.prdNo};keyWordsFld=${item.prdNo};'/>">
					<i><img src="<@spring.url '/imgsrc/${item.fileName?if_exists}'/>" onerror="downloadErrImg(this,'${item.fileName}')" /></i>
					<h1>${item.prdName?if_exists}</h1>
				</a>
			</div>
			
			</#if>
			
			<div class="info_card_price">
				<span class="left f12 red" style="width: 20%;">${item.amount}</span>
				<span class="left f12 red" style="width: 30%;">￥${item.money}</span>
				<span class="left f12 red" style="width: 50%; text-align: right;">小计：￥${item.money * item.amount}</span>
			</div>
		</div>
	
		</#if>
		</#list>
		</#if>
		
		<div class="box_exp info_light">
			<div class="info_integral">
				<span class="titles"><i class="icon-bookmark-empty"></i>总计 - ￥${cardMoney}元</span>
			</div>
		</div>
		
		<div style="margin:8px 0;"><a href="<@spring.url "/confirmCardOrder"/>" class="button button-block button-rounded button-caution button-large"><i class="icon-shopping-cart"></i>&nbsp;&nbsp;卡下单</a></div>
		<div style="margin:8px 0;"><a href="<@spring.url "/confirmOrder"/>" class="button button-block button-rounded button-caution button-large"><i class="icon-shopping-cart"></i>&nbsp;&nbsp;商品下单</a></div>
		<div style="margin:8px 0;"><a href="<@spring.url '/goodClass'/>" class="button button-block button-rounded button-caution button-large continueSBtn">继续购物</a></div>
		
		
		<div style="padding:15px;"></div>
	</div>
	
	<!--底部-->
	<#include "/lib/template/footer.ftl" encoding="UTF-8">
	<!--end 底部-->
	
</div>

</body>
</html>
<script>
function delItem(prdNo,money,amount){
	var url = "<@spring.url '/shoppingCart/delCart'/>";
	window.location.href = url + "?prdNo=" + prdNo + "&money=" + money +"&amount=" + amount;
	return false;
}
</script>