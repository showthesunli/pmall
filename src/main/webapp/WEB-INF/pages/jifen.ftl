<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<title>积分查询-逸乐生活网</title>
<meta name="description" content="途皓（北京）商务服务有限公司" />
<meta name="keywords" content="途皓（北京）商务服务有限公司" />
<link rel="stylesheet" type="text/css" href="<@spring.url '/css/css.css'/>"/>
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
	<div style="background:url('images/titleTag/b_jifen.jpg') no-repeat center top;height:150px;"></div>
	<!--endbanner-->

	<!--主体-->
	<div class="main">
		<div class="ny_nav">
			<div class="ny_nav1">当前位置：<a href='<@spring.url "/index"/>'>首页</a> > <a href='<@spring.url "/jifen"/>'>积分查询</a></div>
			<div class="clearfix"></div>
		</div>

		<div class='prospList'>
			<dl>
				<div class="icons"><a class="icon_link" href="<@spring.url "/member"/>"><img src="<@spring.url '/images/icon_link.png'/>"></a></div>
				<dt><a href='<@spring.url "/member"/>' target="_blank"><img src="<@spring.url '/images/merchant/mTH.jpg'/>" /></a></dt>
				<dd><h3><a href='<@spring.url "/member"/>' target="_blank">途皓卡</a></h3></dd>
			</dl>

			<dl>
				<div class="icons"><a class="icon_link" href="https://cardsonline.spdbccc.com.cn/icard/icardlogin.do?_locale=zh_CN" target="_blank"><img src="<@spring.url '/images/icon_link.png'/>"></a></div>
				<dt><a href='https://cardsonline.spdbccc.com.cn/icard/icardlogin.do?_locale=zh_CN' target="_blank"><img src="<@spring.url '/images/merchant/mPF.jpg'/>" /></a></dt>
				<dd><h3><a href='https://cardsonline.spdbccc.com.cn/icard/icardlogin.do?_locale=zh_CN' target="_blank">浦发银行</a></h3></dd>
			</dl> 

			<dl>
				<div class="icons"><a class="icon_link" href="https://creditcard.ecitic.com/citiccard/ucweb/entry.do" target="_blank"><img src="<@spring.url '/images/icon_link.png'/>"></a></div>
				<dt><a href='https://creditcard.ecitic.com/citiccard/ucweb/entry.do' target="_blank"><img src="<@spring.url '/images/merchant/mZX.jpg'/>" /></a></dt>
				<dd><h3><a href='https://creditcard.ecitic.com/citiccard/ucweb/entry.do' target="_blank">中信银行</a></h3></dd>
			</dl> 

			<dl>
				<div class="icons"><a class="icon_link" href="https://mybank.icbc.com.cn/icbc/newperbank/perbank3/frame/frame_index.jsp" target="_blank"><img src="<@spring.url '/images/icon_link.png'/>"></a></div>
				<dt><a href='https://mybank.icbc.com.cn/icbc/newperbank/perbank3/frame/frame_index.jsp' target="_blank"><img src="<@spring.url '/images/merchant/mGS.jpg'/>" /></a></dt>
				<dd><h3><a href='https://mybank.icbc.com.cn/icbc/newperbank/perbank3/frame/frame_index.jsp' target="_blank">工商银行</a></h3></dd>
			</dl> 

			<dl>
				<div class="icons"><a class="icon_link" href="http://creditcard.ccb.com/cn/creditcard/mycard.html" target="_blank"><img src="<@spring.url '/images/icon_link.png'/>"></a></div>
				<dt><a href='http://creditcard.ccb.com/cn/creditcard/mycard.html' target="_blank"><img src="<@spring.url '/images/merchant/mJS.jpg'/>" /></a></dt>
				<dd><h3><a href='http://creditcard.ccb.com/cn/creditcard/mycard.html' target="_blank">建设银行</a></h3></dd>
			</dl>

			<dl>
				<div class="icons"><a class="icon_link" href="https://pbsz.ebank.cmbchina.com/CmbBank_GenShell/UI/GenShellPC/Login/Login.aspx?logintype=C" target="_blank"><img src="<@spring.url '/images/icon_link.png'/>"></a></div>
				<dt><a href='https://pbsz.ebank.cmbchina.com/CmbBank_GenShell/UI/GenShellPC/Login/Login.aspx?logintype=C' target="_blank"><img src="<@spring.url '/images/merchant/mZS.jpg'/>" /></a></dt>
				<dd><h3><a href='https://pbsz.ebank.cmbchina.com/CmbBank_GenShell/UI/GenShellPC/Login/Login.aspx?logintype=C' target="_blank">招商银行</a></h3></dd>
			</dl>
		</div>

		<div class="clear"></div>

		<!--<div class="page"><a class="a1">22条</a> <a href="javascript:void(0);" class="a1">上一页</a> <span>1</span> <a href="javascript:void(0);">2</a> <a href="/h/khxx/3.html">3</a> <a href="javascript:void(0);" class="a1">下一页</a></div>-->
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
