<#import "/spring.ftl" as spring/>
<!DOCTYPE html>
<!-- saved from url=(0054)http://www.sucaihuo.com/modals/20/2070/demo/dizhi.html -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>微商城快捷查询-逸乐生活网</title>
	<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/font_1459473269_4751618.css'/>">
	<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/bootstrap.min.css'/>">
	<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/pstyle.css'/>">
	<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/style.css'/>">
	<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/buttons.css'/>">
	<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/font-awesome.min.css'/>">
	<script type="text/javascript" src="<@spring.url '/wechart/js/jquery-1.10.2.min.js'/>"></script>
	<script type="text/javascript" src="<@spring.url '/wechart/js/jquery.accordion.js'/>"></script>
	<script type="text/javascript" src="<@spring.url '/wechart/js/unslider.min.js'/>"></script>
	<script type="text/javascript" src="<@spring.url '/wechart/js/util.js'/>"></script>

<!--必要样式-->
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/menu_elastic.css'/>">
<script type="text/javascript" src="<@spring.url '/wechart/js/snap.svg-min.js'/>"></script>
<!--[if IE]>
<script src="js/html5.js"></script>
<![endif]-->
<style>
.width70{ display: inline-block; width: 70px; text-align: right;}
.proInforTxt{width: 70%; margin-left: 10px; height: 20px; line-height: 20px; text-overflow:ellipsis; white-space: nowrap; overflow: hidden; display: inline-block; float: left;}
</style>
</head>
<body class="huibg">
		
<div class="menu-wrap">
    <nav class="menu">
      <div class="icon-list">
        <a href="index.html"><i class="iconfont icon-home"></i><span>首页</span></a>
        <a href="personal.html"><i class="iconfont icon-yonghux"></i><span>个人中心</span></a>
        <a href="#"><i class="iconfont icon-liebiao"></i><span>订单中心</span></a>
        <a href="#"><i class="iconfont icon-xitongmingpian"></i><span>个人信息</span></a>
        <a href="address.html"><i class="iconfont icon-dizhi"></i><span>地址信息</span></a>
      </div>
    </nav>
    <button class="close-button" id="close-button">Close Menu</button>
    <div class="morph-shape" id="morph-shape" data-morph-open="M-1,0h101c0,0,0-1,0,395c0,404,0,405,0,405H-1V0z">
      <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" viewBox="0 0 100 800" preserveAspectRatio="none">
        <path d="M-1,0h101c0,0-97.833,153.603-97.833,396.167C2.167,627.579,100,800,100,800H-1V0z"></path>
      <desc>Created with Snap</desc><defs></defs></svg>
    </div>
  </div>
<nav class="navbar text-center">
   <button class="topleft" onclick="javascript:history.go(-1);"><span class="iconfont icon-fanhui"></span></button>
  <a class="navbar-tit center-block">快捷查询</a>
</nav>


<div class="usercenter" style="padding-left: 0;">
  <div id="content" style="margin-bottom: 50px;">
  	
			
		<div class="box_exp info_light">
			<div class="info_integral">
				<span class="title" style="font-size: 14px;">订单号：11111</span>
			</div>
			<div style="display: block; overflow: hidden; opacity: 1;">
				<div class="info_child" style=" color: #333;">
                   	<p><span class="width70">下单时间：</span><span>222</span></p>
                   	<p><span class="width70">订单状态：</span><span>333333</span></p>
                    <p><span class="width70">配送状态：</span><span>4</span></p>
                   	<p><span class="width70">订单金额：</span><span>￥5</span></p>
                    <p><span class="width70">收货人：</span><span>6</span></p>
                    <p><span class="width70">收货地址：</span><span>7</span></p>
                    <p><span class="width70">订单类型：</span><span>商品订单</span></p>
                    <p><span>订单备注：</span><span>9</span></p>
                    
                    <div class="info_child_txt" style="overflow: hidden;">
                    	
                    	<a href="<@spring.url '/singleGood'/>" style=" padding-top: 10px; display: inline-block; width: 100%;">
                    		<img src="<@spring.url '/wechart/images/8.jpg'/>" onerror="" style="width: 50px; height: 40px; float: left;" />
                    		<span class="proInforTxt">ewgtwt</span>
                    		<span class="proInforTxt" style="color: #f60; font-size: 12px;">数量：1<b style="width: 20px; display: inline-block;"></b>金额：￥5</span>
                    	</a>

                    	
                    </div>
					
				</div>
				
			</div>
		</div>
		
		
	</div>
  
  	<!--底部-->
	<#include "/lib/template/footer.ftl" encoding="UTF-8">
	<!--end 底部-->
</div>

<script>
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