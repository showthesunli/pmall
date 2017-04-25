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

		<div class="maintt">
			<div class="newTit"><h2 >途皓与携程签订合作协议书</h2></div>
			<div class="author"><span class="time">2017-04-01</span><span class="hits"  id="hits">2</span>次</div>
		</div>
		
		<div class="mainCon">
			<div class="textCon">
			<p>途皓（北京）商务服务有限公司与上海携程国际旅行社有限公司签订合作协议书。</p>
			<p>双方将开始正式的合作，利用携程专业的礼品卡为途皓（北京）及其他全国性零售企业的中高端客户服务，提升客户满意度和忠诚度。</p> 
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
	<!--end 主体-->
	
    <!--合作伙伴-->
    <#include "/lib/template/partner.ftl" encoding="UTF-8">
    <!--end 合作伙伴-->

	<!--底部-->
	<#include "/lib/template/footer.ftl" encoding="UTF-8">
    <!--end 底部-->
    
</body>
</html>
