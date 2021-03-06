﻿<#import "/spring.ftl" as spring/>
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

		<div class="maintt">
			<div class="newTit"><h2 >途皓与利宝得签订战略备忘录</h2></div>
			<div class="author"><span class="time">2016-12-18 </span><span class="hits"  id="hits">2</span>次</div>
		</div>

		<div class="mainCon">
			<div class="textCon">
				<p>途皓（北京）商务服务有限公司与香港利宝得礼品服务有限公司在上海签订战略合作备忘录。</p> 
				<p>双方将利用各自优势在中国大陆市场为全国性零售企业的中高端客户提供专业的客户忠诚度计划， 利用途皓（北京）在中国大陆的众多线下合作伙伴和便捷线上及移动互联网终端继续积分兑换和客户引流合作</p>
			</div>

			<div class="clear"></div>
 
			<div class="xw_xx5">
			<!--
				<ul>
					<li><span>上一篇：</span><a href="#">SNS平台的营销推广也有常年的实操经验</a></li>
					<li><span>下一篇：</span><a href="javascript:alert('最后一页');">最后一页</a></li>
				</ul>
			-->
			</div>
 		</div>
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
