<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<title>我们的服务-逸乐生活网</title>
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
	<div style="background:url('images/titleTag/b_fuwu.jpg') no-repeat center top;height:150px;"></div>
	<!--endbanner-->

	<!--主体-->
	<div class="main">
		<div class="ny_nav">
			<div class="ny_nav1">当前位置：<a href='<@spring.url "/index"/>'>首页</a> > <a href='<@spring.url "/fuwu"/>'>我们的服务</a> </div>
			<div class="clearfix"></div>
		</div>

		<div class="mainCon" id="pointsForSer">
			<div class="textCon">
				<img src="<@spring.url '/images/fuwu1.jpg'/>" align="left" style="margin-right:40px;">
				<h2>积分兑换服务</h2>
				<p>途皓已经与家乐福中国签署了协议，该协议意味着，途皓可以通过家乐福的中国区门店（全国236家）来为积分提供商客户进行服务。</p>
				<p>途皓的服务通过家乐福的门店目前可以覆盖上海、江苏、浙江、安徽、北京、天津、河北、山西、山东、内蒙古、广东、福建、海南、湖北、江西、湖南、河南、吉林、辽宁、黑龙江、新疆、贵州、云南、重庆、四川。</p>
			</div>
			<div class="clear"></div>
		</div> 

		<div class="mainCon2" id="equityForSer">
			<div class="textCon2">
				<img src="<@spring.url '/images/fuwu2.jpg'/>" align="right" style="margin-left:40px;">
				<h2>优惠权益服务</h2>
				<p>目前途皓与中信银行信用卡中心、中国移动云南省公司的积分兑换业务量已经维持在一个稳定的水平线上，并且还在通过新的产品逐步递增。</p>
				<p>途皓在目前与家乐福中国的合作业务模式下，将会开发更多的供应商为积分提供商客户提供更多元化的选择。</p>
			</div>
			<div class="clear"></div>
		</div> 
		
		<div class="mainCon" id="digitalMarketingSer">
			<div class="textCon">
				<img src="<@spring.url '/images/fuwu3.jpg'/>" align="left" style="margin-right:40px;">
				<h2>创新支付服务</h2>
				<p>全新的线下POS自助兑换服务体验（电子支付号、条码、二维码、手机号、会员号等）。</p>
				<p>联合线下商家对客户的会员服务进行市场营销。</p>
				<p>不定期对特殊会员开展定向活动等。</p>
			</div>
			<div class="clear"></div>
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
