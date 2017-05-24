<#import "/spring.ftl" as spring/>
<!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>微商城个人中心-逸乐生活网</title>
	<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/font_1459473269_4751618.css'/>">
	<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/bootstrap.min.css'/>">
	<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/pstyle.css'/>">
	<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/style.css'/>">
	<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/buttons.css'/>">
	<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/font-awesome.min.css'/>">
	<script type="text/javascript" src="<@spring.url '/wechart/js/jquery-1.10.2.min.js'/>"></script>
	<script type="text/javascript" src="<@spring.url '/wechart/js/jquery.accordion.js'/>"></script>
	<script type="text/javascript" src="<@spring.url '/wechart/js/unslider.min.js'/>"></script>
	<script type="text/javascript" src="<@spring.url '/wechart/js/bootstrap.min.js'/>"></script>

<!--必要样式-->
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/menu_elastic.css'/>">
<script type="text/javascript" src="<@spring.url '/wechart/js/snap.svg-min.js'/>"></script>
<!--[if IE]>
<script src="js/html5.js"></script>
<![endif]-->
</head>
<body class="huibg">
<div class="vipcenter">
	<div class="vipheader" style="height: 130px; margin: 11px 0;">
		<a href="#">
	    	<div class="touxiang"><img src="<@spring.url '/wechart/images/tx.jpg'/>" alt=""></div>
	    	<div class="name" style="color: #f60;">${memberInfo[0].memberID}</div>
		</a>
	</div>
	
	<div class="vipsan">   
	    <div class="col-xs-4 text-center" style="width:50%;"><a><h4>途皓卡余额</h4><p style="color: #f60;">${queryMmbAccInfo[0].balanceAmount}</p></a></div>
	    <div class="col-xs-4 text-center" style="width:50%"><a href="<@spring.url "/accountRecharge"/>"><h4 style=" line-height: 2.4em; background: #f60; color: #fff; margin-top: 0.3em; ">途皓卡充值</h4></a></div>
	</div>
	
	<ul class="vipul" style="margin-bottom: 50px;">
    	<li>
			<a href="<@spring.url '/myInformation'/>">
				<div class="icc"><i class="iconfont icon-yonghux"></i></div>
				<div class="lzz">个人信息</div>
				<div class="rizi"><i class="iconfont icon-jiantouri"></i></div>
			</a>
    	</li>
    	<li>
      		<a href="<@spring.url '/myAddress'/>">
	       		<div class="icc"><i class="iconfont icon-chakangonglve"></i></div>
	       		<div class="lzz">收货地址</div>
	       		<div class="rizi"><i class="iconfont icon-jiantouri"></i></div>
      		</a>
    	</li>
    	<li>
	      	<a href="<@spring.url '/myOrder'/>">
		       <div class="icc"><i class="iconfont icon-liebiao"></i></div>
		       <div class="lzz">我的订单</div>
		       <div class="rizi"><i class="iconfont icon-jiantouri"></i></div>
	      	</a>
    	</li>
	    <li>
			<a href="<@spring.url '/myCard'/>">
		       <div class="icc"><i class="iconfont icon-xitongmingpian"></i></div>
		       <div class="lzz">我的卡片</div>
		       <div class="rizi"><i class="iconfont icon-jiantouri"></i></div>
	      	</a>
	    </li>
	    <li>
	      	<a href="javascript:void(0);">
		       <div class="icc"><i class="iconfont icon-mima"></i></div>
		       <div class="lzz">账户安全</div>
		       <div class="rizi"><i class="iconfont icon-jiantouri"></i></div>
	      	</a>
	    </li>
	    <li>
	      	<a href="<@spring.url '/logout'/>">
		       <div class="icc"><i class="iconfont icon-tuichu"></i></div>
		       <div class="lzz">退出登录</div>
		       <div class="rizi"><i class="iconfont icon-jiantouri"></i></div>
	      	</a>
	    </li>
  </ul>
</div>
</div>

	<!--底部-->
	<#include "/lib/template/footer.ftl" encoding="UTF-8">
	<!--end 底部--> 
	
</body></html>