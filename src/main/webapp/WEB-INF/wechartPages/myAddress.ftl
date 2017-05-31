<#import "/spring.ftl" as spring/>
<!DOCTYPE html>
<!-- saved from url=(0054)http://www.sucaihuo.com/modals/20/2070/demo/dizhi.html -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>微商城收货地址-逸乐生活网</title>   
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
.usercenter .cdv p{ overflow: hidden;}
.usercenter .cdv .addrTxt{ text-align: right; min-width: 70px; max-width: 70px; float: left; color: #666;}
.usercenter .cdv .addrInputTxt{ width: 70%; min-width: 150px; float: left; border:none; max-height: 28px; line-height: 28px; color: #333;}
.usercenter .cdv .addBtnA{ background: #f60; height: 30px; line-height: 30px; color: #fff;}
.usercenter .label{ padding: 6px 5px; font-weight: normal;}
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
   <button class="topleft" onclick="window.location.href='<@spring.url "/member"/>'"><span class="iconfont icon-fanhui"></span></button>
  <a class="navbar-tit center-block">收货地址</a>
</nav>


<div class="usercenter" style="padding-bottom: 50px;">
  <div class="cdv">
    <a href="<@spring.url '/myAddressOperation'/>"><span>新增收货地址</span></a>
  </div>
  
    <#list queryMemberAddress as item>
    	
  	<form method="post" action="<@spring.url '/modAddr'/>">
	  	<div class="cdv dzi">
		    <p>
		    	<button class="label label-warning pull-right deleteAddr" style="margin-left: 10px; background: #ccc; color: #666">删除</button>
				<button id="modifyAddrBtn" class="label label-warning pull-right" style="margin-left: 10px; background: #3897d7;">编辑</button>
					
				<#if item.isDefault == "1">
		      		<button class="label label-danger pull-right">默认</button>
		      	</#if>
		      		
		      	<#if item.isDefault == "0">
		      		<button class="label label-warning pull-right setToDefAddr">设为默认</button>
		      	</#if>
		    </p>
		    <p>
		    	<span class="addrTxt">收货人：</span>
		    	<input type="text" value="${item.name}" id="addressName" name="receiverName" class="addrInputTxt" readOnly="true" />
		    </p>
		    <p>
		    	<span class="addrTxt">手机号码：</span>
		    	<input type="text" value="${item.phone}" id="phone" name="phone" class="addrInputTxt" readOnly="true" />
		    </p>
		    <p>
		    	<span class="addrTxt">邮政编号：</span>
		    	<input type="text" value="${item.zip}" id="addressZip" name="zipCode" class="addrInputTxt" readOnly="true" />
		    </p>
		    <p>
		    	<span class="addrTxt">收货地址：</span>
		    	<span class="addrInputTxt" style=" max-height: 56px;">${item.addr}</span>
		    	<input type="hidden" value="${item.addr}" id="addressAddr" name="addr" />
		    </p>
		    
		      	<input type="hidden" name="objectID" value="${item.objectID}"/>
                <input type="hidden" name="isDefault" class="isDefaultInput" value="${item.isDefault}"/>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	  	</div>
  	</form>
  
  	</#list>
	
</div>

	<!--底部-->
	<#include "/lib/template/footer.ftl" encoding="UTF-8">
	<!--end 底部--> 

</body>
</html>
<script>
$(document).ready(function(){
	//删除地址
    $('.deleteAddr').click(function(){
    	var action = "<@spring.url '/deleteAddr'/>";
		$(this).parent().parent().parent().attr('action',action);
		$(this).parent().parent().parent().submit();
    });
    //设为默认值
    $('.setToDefAddr').click(function(){
    	var action = "<@spring.url '/modAddr'/>";
    	$(this).parent().parent().parent().attr('action',action);
    	$('.isDefaultInput').val('0');
    	$(this).parent().parent().parent().find('.isDefaultInput').val('1');
    });
})
</script>