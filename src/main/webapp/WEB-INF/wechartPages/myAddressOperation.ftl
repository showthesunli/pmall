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
	<script type="text/javascript" src="<@spring.url '/wechart/js/jquery.validate.min.js'/>" ></script>
	<script language="javascript" src="<@spring.url '/wechart/js/jquery.validate.addMethod.js'/>" ></script>
<!--必要样式-->
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/menu_elastic.css'/>">
<script type="text/javascript" src="<@spring.url '/wechart/js/snap.svg-min.js'/>"></script>
<!--[if IE]>
<script src="js/html5.js"></script>
<![endif]-->
<style>
input{ outline:none;}
.usercenter .cdv p{ overflow: hidden; padding-bottom: 30px;}
.usercenter .cdv .addrTxt{ text-align: right; min-width: 70px; max-width: 70px; float: left; color: #666;}
.usercenter .cdv .addrInputTxt{ width: 70%; min-width: 150px; float: left; border: 1px solid #ccc; padding: 0 5px; height: 30px; line-height: 30px;}
.usercenter .cdv .addBtnA{ background: #f60; height: 30px; line-height: 30px; color: #fff;}
.cdv p{ position: relative;}
#addressName-error,#phone-error,#addressZip-error,#addressAddr-error{ position:absolute; left: 70px; top:25px; color: #f00; font-weight: normal;}
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
  <a class="navbar-tit center-block">收货地址</a>
</nav>


<div class="usercenter">
  
  	<form class="addAddressForm" method="post" action="<@spring.url '/addAddr'/>">
  		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	  	<div class="cdv dzi" style="padding-top: 25px;">
		    <p>
		    	<span class="addrTxt">收货人：</span>
		    	<input type="text" value="" id="addressName" name="receiverName" class="addrInputTxt" placeholder="请输入收货人" maxlength="20" />
		    </p>
		    <p>
		    	<span class="addrTxt">手机号码：</span>
		    	<input type="text" value="" id="phone" name="phone" class="addrInputTxt" placeholder="请输入手机号码" maxlength="11" />
		    </p>
		    <p>
		    	<span class="addrTxt">邮政编号：</span>
		    	<input type="text" value="" id="addressZip" name="zipCode" class="addrInputTxt" placeholder="请输入邮政编号" maxlength="10" />
		    </p>
		    <p>
		    	<span class="addrTxt">收货地址：</span>
		    	<input type="text" value="" id="addressAddr" name="addr" class="addrInputTxt" placeholder="请输入收货地址" />
		    </p>
		    <p>
		    	<span class="addrTxt">&nbsp;</span>
		    	<input type="submit" value="确 定" class="addBtnA" style="width: 70%;" />
		    </p>
		    <input type="hidden" id="operType" name="operType" value="0"/>
		    <input type="hidden" name="isDefault" value="0"/>
            <input type="hidden" name="objectID" id="objectID" value=""/>
            <input type="hidden" name="forword" id="forword" value="myAddress"/>
	  	</div>
  	</form>

	
</div>

	<!--底部-->
	<#include "/lib/template/footer.ftl" encoding="UTF-8">
	<!--end 底部--> 

</body>
</html>
<script>
    $().ready(function () {
        // 在键盘按下并释放及提交后验证提交表单
        $(".addAddressForm").validate({
            rules: {
                receiverName: {
                    required: true,
                },
                phone: {
                    required: true,
                    isPhone: []
                },
                zipCode: {
                    required: true,
                },
                addr: {
                    required: true,
                },
            },
            messages: {
                receiverName: {
                    required: "请输入收货人",
                },
                phone: {
                    required: "请输入手机号码",
                    isPhone: "请输入正确的手机号码"
                },
                zipCode: {
                    required: "请输入邮编",
                },
                addr: {
                    required: "请输入收货地址",
                },
            }
        });
    });
</script>