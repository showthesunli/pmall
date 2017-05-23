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
<title>微商城首页-逸乐生活网</title>
<meta name="description" content="途皓（北京）商务服务有限公司" />
<meta name="keywords" content="途皓（北京）商务服务有限公司" />
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/style.css'/>">
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/font-awesome.min.css'/>">
<script type="text/javascript" src="<@spring.url '/wechart/js/jquery-1.10.2.min.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/wechart/js/jquery.accordion.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/wechart/js/unslider.min.js'/>"></script>
<style>
.banner ul li{ min-height: 140px;}	
</style>
</head>

<body ondragstart="return false;" onselectstart="return false;" oncontextmenu="return false" onselectstart="return false" 
ondragstart="return false" onbeforecopy="return false" oncopy=document.selection.empty() onselect=document.selection.empty()> 
<div id="page">
	<div class="banner">
		<ul>
			<li style="background-image: url('images/index12.jpg');"></li>
			<li style="background-image: url('images/index1.jpg');"></li>
			<li style="background-image: url('images/index6.jpg');"></li>
			<li style="background-image: url('images/index4.jpg');"></li>
			<li style="background-image: url('images/index2.jpg');"></li>
		</ul>
	</div>
	<div id="content">

		<div class="box_exp info_light">
			<div class="info_integral">
				<span class="title"><i class="icon-bookmark-empty"></i>途皓商品</span>
			</div>
			<div style="display: block; overflow: hidden; opacity: 1;">
				<div class="info_child">
					<ul>
						<#list queryPrdListByPrdType as queryPrdListByPrdTypeItem>
							
						<li style="width:33%">
							<div class="line3">
								<a href="singleGood.html">
									<i>
										<img src="<@spring.url '/imgsrc/${queryPrdListByPrdTypeItem.iconFileName}'/>" onerror="downloadErrImg(this,'${queryPrdListByPrdTypeItem.iconFileName}')" />
									</i>
									<span style="overflow:hidden;text-overflow:ellipsis; height:1em;">${queryPrdListByPrdTypeItem.productInfo}</span>
									<em>￥${queryPrdListByPrdTypeItem.prdPrice}</em>
								</a>
							</div>
						</li>
						
						</#list>
						
					</ul>
				</div>
			</div>
		</div>
		
		<!--常用功能-->
		<#include "/lib/template/commFunctionsPage.ftl" encoding="UTF-8">
		<!--end 常用功能-->
	
		
		<div style="padding:15px;"></div>
	</div>
	
	
	<!--底部-->
	<#include "/lib/template/footer.ftl" encoding="UTF-8">
	<!--end 底部-->
		
</div>







<script>
$(document).ready(function() {
	$('.banner').unslider({
		arrows: true,
		fluid: true,
		dots: true
	});

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