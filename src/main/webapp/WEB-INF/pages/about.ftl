<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<title>公司简介-逸乐生活网</title>
<meta name="description" content="途皓（北京）商务服务有限公司" />
<meta name="keywords" content="途皓（北京）商务服务有限公司" />
<link rel="stylesheet" type="text/css" href="css/css.css"/>
<script type="text/javascript" src="<@spring.url '/js/gd_Index.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/js/jquery.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/js/banner.js'/>"></script>
<script language="javascript" src="<@spring.url '/js/menu.js'/>" ></script>
<script type="text/javascript" src="<@spring.url '/js/model.js'/>"></script>
<style>
.textCon .aboutFC,.textCon2 .aboutFC{ /*font-family:'华文新魏'; font-size:20px; color:#FF0000;*/}
</style>
</head>
<body>
	<!--头部-->
	<#include "/lib/template/header.ftl" encoding="UTF-8">
	<!--end 头部-->

	<!--banner--> 
	<div style="background:url('images/titleTag/b_about.jpg') no-repeat center top;height:150px;"></div>
	<!--endbanner-->

	<!--主体-->
	<div class="main">
		<div class="ny_nav">
			<div class="ny_nav1">当前位置：<a href='<@spring.url "/index"/>'>首页</a> > <a href='<@spring.url "/about"/>'>关于公司</a> > 公司简介</div>
			<div class="clearfix"></div>
		</div>

		<div class="mainCon">
			<div class="textCon">
				<img src="<@spring.url '/images/about3.jpg'/>" align="left" style="margin-right:40px;">
				<h2>公司介绍</h2>
				<p>途皓，由北京总部和上海分公司辐射全国，业务覆盖华南、华北、华东、中西四个大区，并在全国大部分一、二线城市布有主要业务骨干团队和运营团队，以新兴的移动互联网平台紧密联合线下各大型连锁商业企业，为各类公司提供“会员忠诚度”的一揽子增值服务方案。</p>
				<p>途皓以各类客户的会员为主要服务对象，利用综合性的<span class="aboutFC">积分兑换</span>平台为客户提供高质量、低成本的会员忠诚度方案。平台通过先进的网络平台、便捷的线下POS、24小时的电话服务，满足不同层次会员的兑换方式喜好；通过不定期、多样性的市场活动持续刺激会员，增强会员粘性度，并激活存量休眠客户；通过<span class="aboutFC">积分</span>汇集功能将孤立小<span class="aboutFC">积分</span>汇集成商户联盟大<span class="aboutFC">积分</span>，增强会员<span class="aboutFC">积分</span>价值感；通过商户联盟，为<span class="aboutFC">积分兑换</span>打通衣、食、住、行、教育、培训及娱乐等各行业，形成全方位的、线上线下的全覆盖服务；在帮助客户消化积分、提高会员满意度的同时，导入其他中高端客户群的<span class="aboutFC">积分消费</span>，为客户带来额外业务收入。</p>
			</div>
			<div class="clear"></div>
		</div> 

		<div class="mainCon2">
			<div class="textCon2">
				<img src="<@spring.url '/images/about2.jpg'/>" align="right" style="margin-left:40px;">
				<!--<h2>我们的承诺 Our Commitment</h2>-->
				<p>目前公司的主要客户为各大银行信用卡中心、各大移动通讯公司、成品油零售企业及各类全国连锁酒店等，年兑换权益和积分量逾十亿人民币。积分和权益活动所覆盖的线上及线下商户多达几十家，涵盖全国性大型超市、百货公司、影院、知名餐饮、游乐场、教育、培训等不同服务范围。客户可以通过登陆途皓网站或微信平台轻松查询、<span class="aboutFC">兑换积分</span>和权益。公司提供线上实时推送和线下自助提取的方式将客户心仪的产品快速、便捷送达至客户手中，提高客户的满意度。</p>
				<h2>我们公司的服务宗旨</h2>
				<p>
					<!--我们公司的服务宗旨<br>-->
					以客户为中心，提供最便捷轻松的服务
				</p>
				<h2>我们公司的愿景</h2>
				<p>
					<!--我们公司的愿景<br>-->
					覆盖面最广、价值感最强、客户满意度最高的会员增值服务平台
				</p>
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
