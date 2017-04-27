<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<title>帮助中心-逸乐生活网</title>
<meta name="description" content="途皓（北京）商务服务有限公司" />
<meta name="keywords" content="途皓（北京）商务服务有限公司" />
<link rel="stylesheet" type="text/css" href="css/css.css"/>
<script type="text/javascript" src="<@spring.url '/js/gd_Index.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/js/jquery.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/js/banner.js'/>"></script>
<script language="javascript" src="<@spring.url '/js/menu.js'/>" ></script>
<script type="text/javascript" src="<@spring.url '/js/model.js'/>"></script>
<style>
.helpCenter{ width:200px; float:left;}
.helpCenter h1{ font-weight:bold; line-height:40px; cursor:pointer; color:#fff; font-size:16px; overflow:hidden; background:#f60; text-align:center;}
.exClassify-list h2{ font-weight:bold; line-height:40px; cursor:pointer; color:#666; font-size:14px; overflow:hidden; background:#eaeaea; padding:0 10px; margin-bottom:1px;}
.exClassify-list span{ float:left;}
.bTriangleD{ border-width:5px 5px 0;}
.bTriangleU{ border-width:0 5px 5px;}
.exClassify-list b{ border-style:solid dashed solid dashed; border-color:#999 transparent #999 transparent;font-size:0; line-height:0; height:0; float:right; margin-top:18px; float:right;}
.exClassify-list div{ padding-bottom:10px; overflow:hidden; padding:0 10px; height:0;}
.exClassify-list a{ line-height:35px; font-szie:12px; cursor:pointer; display:inline-block; color:#666; width:209px;}
.exClassify-list a:hover,.exClassify-list .aSelected{ text-decoration:none; color:#f60;}
.helpCenterR{ float:right; width:920px; min-height:500px;}
.helpCenterR h3{ color:#f60; font-size:18px; font-weight:bold; line-height:40px; margin-bottom:20px;}
.helpCenterR h4{ font-size:16px; font-weight:bold; line-height:40px; padding:0 30px; margin-bottom:20px;}
</style>
<script language="javascript">
$(document).ready(function(e) {
	$(".exClassify-list h2").click(function(){
		var h = $(this).next("div").find("a").length * 35;
		if($(this).find("b").attr('class') == "bTriangleD"){
			$(this).find("b").removeClass("bTriangleD").addClass("bTriangleU");
			$(this).next("div").animate({height:h + "px"});
		}
		else{
			$(this).find("b").removeClass("bTriangleU").addClass("bTriangleD");
			$(this).next("div").animate({height:"0"});
		}
	})
	$(".exClassify-list a").click(function(){
		$(".exClassify-list a").removeClass("aSelected");
		$(this).addClass("aSelected");
	})
});
</script>
</head>
<body>
	<!--头部-->
	<#include "/lib/template/header.ftl" encoding="UTF-8">
	<!--end 头部-->

	<!--banner--> 
	<div style="background:url('images/titleTag/b_help.jpg') no-repeat center top;height:150px;"></div>
	<!--endbanner-->

	<!--主体-->
	<div class="main">
		<div class="ny_nav">
			<div class="ny_nav1">当前位置：<a href='<@spring.url "/index"/>'>首页</a> > 帮助中心</div>
			<div class="clearfix"></div>
		</div>

		<div class="mainCon">
			<div class="textCon" style="width:1200px;">
				<div class="helpCenter" style="margin-left:10px;">
					<h1>帮助中心</h1>
					<div class="exClassify-list jf-overflowH">
						<h2><span>新手指南</span><b class="bTriangleU"></b></h2>
						<div style="height:105px;">
							<a href="javascript:void(0)" class="aSelected">免费注册</a>
							<a href="javascript:void(0)">购买流程</a>
							<a href="javascript:void(0)">支付方式</a>
						</div>
					</div>
					<div class="exClassify-list jf-overflowH">
						<h2><span>常见问题</span><b class="bTriangleD"></b></h2>
						<div>
							<a href="javascript:void(0)">配送方式</a>
							<a href="javascript:void(0)">支付问题</a>
							<a href="javascript:void(0)">发票问题</a>
						</div>
					</div>
					<div class="exClassify-list jf-overflowH">
						<h2><span>联系客服</span><b class="bTriangleD"></b></h2>
						<div>
							<a href="javascript:void(0)">电话客服</a>
						</div>
					</div>
				</div>
				<div class="helpCenterR">
					<div class="centerMain" style="display:none;">
						<h3>帮助中心</h3>
						<p>欢迎来到帮助中心！</p>
					</div>
					<div class="centerMain-Reg">
						<h3 >免费注册</h3>
						<h4>如何注册成为会员？</h4>
						<p style="padding:0 30px; margin-bottom:10px;">1. 打开逸乐生活首页，在右上方，点击“注册”按钮；</p>
						<p style="padding:0 30px; margin-bottom:10px;">2. 进入到注册页面，请填写您的邮箱、手机等信息完成注册；</p>
						<p style="padding:0 30px; margin-bottom:10px;">3. 提示注册成功，即可成功注册为逸乐生活的会员。</p>
					</div>
				</div>
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
