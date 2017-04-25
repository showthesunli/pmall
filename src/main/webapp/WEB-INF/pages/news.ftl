<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<title>公司新闻-逸乐生活网</title>
<meta name="description" content="途皓（北京）商务服务有限公司" />
<meta name="keywords" content="途皓（北京）商务服务有限公司" />
<link rel="stylesheet" type="text/css" href="css/css.css"/>
<script type="text/javascript" src="<@spring.url '/js/gd_Index.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/js/jquery.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/js/banner.js'/>"></script>
<script language="javascript" src="<@spring.url '/js/menu.js'/>" ></script>
<script type="text/javascript" src="<@spring.url '/js/model.js'/>"></script>
</head>
<body>
	<!--头部-->
	<#include "/lib/template/header.ftl" encoding="UTF-8">
	<!--end 头部-->

	<!--banner--> 
	<div style="background:url('images/titleTag/b_news.jpg') no-repeat center top;height:150px;"></div>
	<!--endbanner-->

	<!--主体-->
	<div class="main">

		<div class="ny_nav">
			<div class="ny_nav1">当前位置：<a href='<@spring.url "/index"/>'>首页</a> > <a href='<@spring.url "/about"/>'>关于公司</a> > 公司新闻</div>
			<div class="clearfix"></div>
		</div>

		<div class='proNewList'>
			<dl>
				<dt><a href='<@spring.url "/shownews-lbd"/>' target='_blank'><img src="<@spring.url '/images/news-lbd.jpg'/>" /></a></dt>
				<dd>
					<h2><a href='<@spring.url "/shownews-lbd"/>' target='_blank'>途皓与利宝得签订战略备忘录</a></h2>
					<p>途皓（北京）商务服务有限公司与香港利宝得礼品服务有限公司在上海签订战略合作备忘录， 双方将利用各自优势在中国大陆市场为全国性零售企业的中高端客户提供专业的客户......</p>
				</dd>
			</dl>
	 		
	 		<dl>
				<dt><a href='<@spring.url "/shownews-zhx"/>' target='_blank'><img src="<@spring.url '/images/news-zhx.jpg'/>" /></a></dt>
				<dd>
					<h2><a href='<@spring.url "/shownews-zhx"/>' target='_blank'>途皓与资和信电子签订合作协议书</a></h2>
					<p>途皓（北京）商务服务有限公司与资和信电子支付有限公司云南分公司签订合作协议书， 双方将开始正式的合作，利用资和信的商通卡为途皓（北京）的中高端客户服务，提升......</p>
				</dd>
			</dl>

			<dl>
				<dt><a href='<@spring.url "/shownews-xc"/>' target='_blank'><img src="<@spring.url '/images/news-xc.jpg'/>" /></a></dt>
				<dd>
					<h2><a href='<@spring.url "/shownews-xc"/>' target='_blank'>途皓与携程签订合作协议书</a></h2>
					<p>途皓（北京）商务服务有限公司与上海携程国际旅行社有限公司签订合作协议书， 双方将开始正式的合作，利用携程专业的礼品卡为途皓（北京）及其他全国性......</p>
				</dd>
			</dl>

			<dl>
				<dt><a href='<@spring.url "/shownews-sn"/>' target='_blank'><img src="<@spring.url '/images/news-sn.jpg'/>" /></a></dt>
				<dd>
					<h2><a href='<@spring.url "/shownews-sn"/>' target="_blank">途皓与苏宁云南签订合作备忘录</a></h2>
					<p>途皓（北京）商务服务有限公司与云南苏宁云商销售有限公司签订合作备忘录， 双方将开始正式的合作，利用苏宁易购网上商城及苏宁线下门店，为途皓（北京）......</p>
				</dd>
			</dl>

			<dl>
				<dt><a href='<@spring.url "/shownews-wem"/>' target='_blank'><img src="<@spring.url '/images/news-wem.jpg'/>" /></a></dt>
				<dd>
					<h2><a href='<@spring.url "/shownews-wem"/>' target='_blank'"'>途皓与沃尔玛签订合作协议书</a></h2>
					<p>途皓（北京）商务服务有限公司与沃尔玛（云南）商业零售有限公司签订合作协议书， 双方将开始正式的合作，利用沃尔玛全国上百家门店为途皓（北京）及其......</p>
				</dd>
			</dl>
		</div>

		<div class="clear"></div>
		<!--
		<div class="page"><a class="a1">22条</a> <a href="javascript:void(0);" class="a1">上一页</a> <span>1</span> <a href="javascript:void(0);">2</a> <a href="/h/khxx/3.html">3</a> <a href="javascript:void(0);" class="a1">下一页</a></div>
		-->    	
	</div> 
	<!--end 主体-->

    <!--合作伙伴-->
    <#include "/lib/template/partner.ftl" encoding="UTF-8">
    <!--end 合作伙伴-->

	<!--底部-->
	<#include "/lib/template/footer.ftl" encoding="UTF-8">
    <!--end 底部-->
    
</body>
</html>
