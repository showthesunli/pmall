<#import "/spring.ftl" as spring/>
<!DOCTYPE html>
<!-- saved from url=(0054)http://www.sucaihuo.com/modals/20/2070/demo/dizhi.html -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>html</title>
	<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/font_1459473269_4751618.css'/>">
	<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/bootstrap.min.css'/>">
	<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/pstyle.css'/>">
	<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/style.css'/>">
	<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/buttons.css'/>">
	<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/font-awesome.min.css'/>">
	<script type="text/javascript" src="<@spring.url '/wechart/js/jquery-1.10.2.min.js'/>"></script>
	<script type="text/javascript" src="<@spring.url '/wechart/js/bootstrap.min.js'/>"></script>
	<script type="text/javascript" src="<@spring.url '/wechart/js/jquery.validate.min.js'/>" ></script>
<!--必要样式-->
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/menu_elastic.css'/>">
<script type="text/javascript" src="<@spring.url '/wechart/js/snap.svg-min.js'/>"></script>
<!--[if IE]>
<script src="js/html5.js"></script>
<![endif]-->
<style>
input{ outline:none;}
.text{ margin: 10px auto; border-radius: 20px; font-size: 12px; color: #333; text-align: center;}
.text_1{ height: 60px; margin: 0px auto; text-align: center; border-radius: 20px; font-size: 12px; color: #333; margin-left: 10px;}
.tet { width: 80%; height: 40px; border-radius: 3px; border: #999 1px solid; font-size: 14px; font-family: '微软雅黑'; text-align: left;}
.lg_btn { color: #fff; line-height: 35px; background: #ff4d13; width: 85%; height: 35px; border-radius: 3px; border: 0px; margin: 10px auto; font-size: 14px; font-family: '微软雅黑';}
.text_1{ position: relative;}
#cardNo-error,#cardPsw-error{ position:absolute; left: 10%; top:52px; color: #f00; font-weight: normal;}
input.error{ border-color: #f00;}
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
  <a class="navbar-tit center-block">途皓卡充值</a>
</nav>


<div class="usercenter">
	<form class="rechargeForm" autocomplete="off" method="post" action="<@spring.url '/recharge'/>">
	
	  	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	      	<tr class="text">
				<td class="text_1">
					<input type="text" id="cardNo" name="cardNo" value="" placeholder="请输入您的卡号"  class="tet" style="padding-left:10px;">				
				</td>
	      	</tr>
	      	
	      	<tr class="text">
				<td class="text_1">
					<input type="text" onfocus="this.type='password'" autocomplete="off" id="cardPsw" name="cardPinCiperUnderZPK" value="" placeholder="请输入您的卡密"  class="tet" style="padding-left:10px;">
				</td>
	      	</tr>
	      
	      	<tr class="text">	      		
	        	<td class="text_1">
	        		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	        		<input type="submit" value="充 值" class="lg_btn" style="color:#fff; width: 80%;"/>
	        	</td>
	      	</tr>
	   	</table>
   	
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
        $(".rechargeForm").validate({
            rules: {
                cardNo: {
                    required: true,
                },
                cardPinCiperUnderZPK: {
                    required: true,
                },
            },
            messages: {
                cardNo: {
                    required: "请输入卡号",
                },
                cardPinCiperUnderZPK: {
                    required: "请输入卡密",
                },
            }
        });
    });
</script>