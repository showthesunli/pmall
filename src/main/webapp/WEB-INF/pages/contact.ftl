<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<title>联系我们-逸乐生活网</title>
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
	<div style="background:url('images/titleTag/b_contact.jpg') no-repeat center top;height:150px;"></div>
	<!--endbanner-->

	<!--主体-->
	<div class="main">
		<div class="ny_nav">
			<div class="ny_nav1">当前位置：<a href='<@spring.url "/index"/>'>首页</a> > <a href='<@spring.url "/about"/>'>关于公司</a> > 联系我们</div>
			<div class="clearfix"></div>
		</div>

		<div class="mainCon">
			<div class="textCon">
				<img src="<@spring.url '/images/contact.jpg'/>" align="left" style="margin-right:40px;">
				<h2 style="padding-top:10px;">途皓北京总部</h2>
				<p style="font-size:16px;">中国北京市朝阳区建国门外大街22号赛特大厦2104室</p>
				<p style="line-height:40px;">邮编区码：100004<br/>联系电话：+86 010-8282-6865<br/>传真号码：+86 010-8282-6865<br/>服务时间：周一至周五 上午9 点–下午6点</p>
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
