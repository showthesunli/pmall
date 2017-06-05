<#import "/spring.ftl" as spring/>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<meta name="format-detection" content="telephone=no" />
<title>微商城积分查询-逸乐生活网</title>
<meta name="description" content="途皓（北京）商务服务有限公司" />
<meta name="keywords" content="途皓（北京）商务服务有限公司" />
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/style.css'/>">
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/font-awesome.min.css'/>">
<script type="text/javascript" src="<@spring.url '/wechart/js/jquery-1.10.2.min.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/wechart/js/jquery.accordion.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/wechart/js/unslider.min.js'/>"></script>
<style>
.banner ul li{ min-height: 140px;}	
.info_child img{border: 1px solid #e6e4e4; padding: 3px;}
.info_child{ margin-top: 0; padding: 0;}
.info_child div{ margin-bottom: 10px;}
.banners{position:fixed ;z-index: 99999;width: 100%;}
</style>
</head>

<body ondragstart="return false;" onselectstart="return false;" oncontextmenu="return false" onselectstart="return false" 
ondragstart="return false" onbeforecopy="return false" oncopy=document.selection.empty() onselect=document.selection.empty()> 
<div id="page">
	<div class="banners">
		<a href="javascript:history.go(-1);"><img src="<@spring.url '/wechart/images/bg_info6.jpg'/>"></a>
	</div>
	
	<div id="content">
		
		<div class="box_exp info_light">
			<div style="display: block; overflow: hidden; opacity: 1;">
				<div class="info_child" style=" border-top: none;">
					<ul>
						<li style="width:50%">
							<div>
								<a href="<@spring.url "/member"/>">
									<i><img src="<@spring.url '/images/merchant/mTH.jpg'/>" /></i>
									<span>途皓卡</span>
								</a>
							</div>
						</li>
						<li style="width:50%">
							<div>
								<a href="https://cardsonline.spdbccc.com.cn/icard/icardlogin.do?_locale=zh_CN" target="_blank">
									<i><img src="<@spring.url '/images/merchant/mPF.jpg'/>" /></i>
									<span>浦发银行</span>
								</a>
							</div>
						</li>
						<li style="width:50%">
							<div>
								<a href="https://creditcard.ecitic.com/citiccard/ucweb/entry.do" target="_blank">
									<i><img src="<@spring.url '/images/merchant/mZX.jpg'/>" /></i>
									<span>中信银行</span>
								</a>
							</div>
						</li>
						<li style="width:50%">
							<div>
								<a href="https://mybank.icbc.com.cn/icbc/newperbank/perbank3/frame/frame_index.jsp" target="_blank">
									<i><img src="<@spring.url '/images/merchant/mGS.jpg'/>" /></i>
									<span>工商银行</span>
								</a>
							</div>
						</li>
						<li style="width:50%">
							<div>
								<a href="http://creditcard.ccb.com/cn/creditcard/mycard.html" target="_blank">
									<i><img src="<@spring.url '/images/merchant/mJS.jpg'/>" /></i>
									<span>建设银行</span>
								</a>
							</div>
						</li>
						<li style="width:50%">
							<div>
								<a href="https://pbsz.ebank.cmbchina.com/CmbBank_GenShell/UI/GenShellPC/Login/Login.aspx?logintype=C" target="_blank">
									<i><img src="<@spring.url '/images/merchant/mZS.jpg'/>" /></i>
									<span>招商银行</span>
								</a>
							</div>
						</li>						
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
//content层的padding-top值随着banners的高度变化而变化
$(document).ready(function(){
	var height = $(".banners").height();
	var padding = height+10+'px';
	$("#content").css("padding-top",padding);
	//console.log(height);
	//console.log(padding);
});
$(window).resize(function() {
	var height = $(".banners").height();
	var padding = height+10+'px';
	$("#content").css("padding-top",padding);
	//console.log(height);
	//console.log(padding);
});	
	
$(document).ready(function() {
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