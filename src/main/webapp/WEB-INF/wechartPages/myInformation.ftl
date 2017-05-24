<#import "/spring.ftl" as spring/>
<!DOCTYPE html>
<!-- saved from url=(0054)http://www.sucaihuo.com/modals/20/2070/demo/dizhi.html -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>微商城个人信息-逸乐生活网</title>   
    <link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/font_1459473269_4751618.css'/>">
	<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/bootstrap.min.css'/>">
	<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/pstyle.css'/>">
	<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/style.css'/>">
	<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/buttons.css'/>">
	<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/font-awesome.min.css'/>">
	<script type="text/javascript" src="<@spring.url '/wechart/js/jquery-1.10.2.min.js'/>"></script>
	<script type="text/javascript" src="<@spring.url '/wechart/js/bootstrap.min.js'/>"></script>
<!--必要样式-->
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/menu_elastic.css'/>">
<script type="text/javascript" src="<@spring.url '/wechart/js/snap.svg-min.js'/>"></script>
<!--[if IE]>
<script src="js/html5.js"></script>
<![endif]-->
<style>
.usercenter .cdv p{ line-height: 28px; margin: 5px 0;}
.usercenter .cdv .width70{ display: inline-block; width: 70px; text-align: right; color: #333;}
.usercenter .cdv span{ color: #f60; font-size: 14px;}
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
  <a class="navbar-tit center-block">个人信息</a>
</nav>


<div class="usercenter">
 	
  	<div class="cdv dzi">
		<p><span class="width70">我的账号：</span><span id="memberID" name="memberID">${memberInfo[0].memberID}</span></p>
	    <p><span class="width70">我的手机：</span><span id="mobile" name="mobile">${memberInfo[0].mobile}</span></p>
	    <p><span class="width70">邮箱：</span><span id="mobile" name="mobile">${memberInfo[0].email}</span></p>
		<#if memberInfo[0].gender == '0' || memberInfo[0].gender == ''>
			<#assign gen='保密'>
		<#elseif memberInfo[0].gender == '1'>
			<#assign gen='男'>
		<#else>
			<#assign gen='女'>
		</#if>
	    <p><span class="width70">性别：</span><span id="mobile" name="mobile">${gen}</span></p>
	    <p><span class="width70">生日：</span><span id="mobile" name="mobile">${memberInfo[0].birthday}</span></p>

	    <div class="info_child_txt" style="text-align: center;">
			<a href="#" style="color: #3897d7;">修改</a>
		</div>
  	</div>
  
	
</div>

  	<!--底部-->
	<#include "/lib/template/footer.ftl" encoding="UTF-8">
	<!--end 底部--> 

</body></html>