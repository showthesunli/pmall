<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>首页</title>
<link href="css/common.css" rel="stylesheet" type="text/css" />
<link href="css/model.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/model.js"></script>
<script>
$(function(){
	$("#scroll").pislider({
		child:"child",
		slider_bar:"slider_bar",
		scrollTime:500,
		autoScroll:"true",
		autoTime:7000
	});
})
</script>
</head>

<body>
	<div class="jf-wrapper">
        <!--头部-->
        <jsp:include page="header.jsp"></jsp:include>
        <!--头部end-->

        <div class="jf-main">
        	<div class="jf-banner">
            	<div class="jf-width1000 jf-banner-img">
                
                	<div class="jf-banner-imgList" id="scroll">
                    	<div class="child"><a href="#"><img src="images/banner01.png" width="655" height="300" style="padding:0 172px;" /></a></div>
                        <div class="child"><a href="#"><img src="images/banner01.png" width="655" height="300" style="padding:0 172px;" /></a></div>
                        <div class="child"><a href="#"><img src="images/banner01.png" width="655" height="300" style="padding:0 172px;" /></a></div>
                    </div>
                	<a href="#" class="imgClickBg jf-banner-imgPre btn" id="btn_prev"></a>
                    <a href="#" class="imgClickBg jf-banner-imgNext btn" id="btn_next"></a>
                    <div  class="jf-banner-imgInco" id="slider_bar">
                    </div>
                    
                </div>                
            </div>
            
            <div class="jf-product jf-width1000">
            	<div class="jf-productList">
                	<a href="#" class="jf-productImg"><img src="images/productImg01.png" width="418" height="281" /></a>
                    <p><a href="#" class="jf-productName">商品名称</a></p>
                    <p><span  class="jf-productPrice">￥200.00</span></p>
                </div>
                
                <div class="jf-productList">
                	<a href="#" class="jf-productImg"><img src="images/productImg02.png" width="418" height="281" /></a>
                    <p><a href="#" class="jf-productName">商品名称</a></p>
                    <p><span  class="jf-productPrice">￥200.00</span></p>
                </div>
            </div>
            
          <div class="jf-partner jf-width1000">
           	<h2 class="jf-partnerTitle"></h2>
              <ul class="jf-partnerImg">
               	  <li><img src="images/partmer01.png" width="148" height="43" /></li>
                  <li><img src="images/partmer02.png" width="148" height="43" /></li>
                  <li><img src="images/partmer03.png" width="148" height="43" /></li>
                  <li><img src="images/partmer01.png" width="148" height="43" /></li>
                  <li><img src="images/partmer02.png" width="148" height="43" /></li>
                  <li><img src="images/partmer03.png" width="148" height="43" /></li>
                  <li><img src="images/partmer01.png" width="148" height="43" /></li>
                  <li><img src="images/partmer02.png" width="148" height="43" /></li>
                  <li><img src="images/partmer03.png" width="148" height="43" /></li>
                  <li><img src="images/partmer01.png" width="148" height="43" /></li>
                  <li><img src="images/partmer02.png" width="148" height="43" /></li>
                  <li><img src="images/partmer03.png" width="148" height="43" /></li>
              </ul>
            </div>
        </div>
        
        <div class="jf-bottom">
        	<div class="jf-bottom-item">
            	<div class=" jf-width1000">
                	<dl class="itemList">
                    	<dt><a href="#">购物指南</a></dt>
                        <dd><a href="#">欣意卡</a></dd>
                        <dd><a href="#">换购卡</a></dd>
                        <dd><a href="#">手机充值</a></dd>
                        <dd><a href="#">游戏充值</a></dd>
                        <dd><a href="#">网上购物</a></dd>
                        <dd><a href="#">补费说明</a></dd>
                    </dl>
                    
                    <dl class="itemList">
                    	<dt><a href="#">支付方式</a></dt>
                        <dd><a href="#">易付卡支付</a></dd>
                        <dd><a href="#">中欣卡支付</a></dd>
                        <dd><a href="#">银行卡支付</a></dd>
                        <dd><a href="#">易付网余额</a></dd>
                        <dd><a href="#">发票问题</a></dd>
                    </dl>
                    
                    <dl class="itemList">
                    	<dt><a href="#">易付帐户</a></dt>
                        <dd><a href="#">注册及登录</a></dd>
                        <dd><a href="#">帐户资产及充值</a></dd>
                        <dd><a href="#">易付卡</a></dd>
                        <dd><a href="#">易付券</a></dd>
                        <dd><a href="#">我的订单</a></dd>
                        <dd><a href="#">修改/忘记密码</a></dd>
                    </dl>
                    
                    <dl class="itemList">
                    	<dt><a href="#">配送与售后</a></dt>
                        <dd><a href="#">常见问题</a></dd>
                        <dd><a href="#">运费标准</a></dd>
                        <dd><a href="#">快递查询</a></dd>
                        <dd><a href="#">退换货</a></dd>
                        <dd><a href="#">退款</a></dd>
                    </dl>
                    
                    <dl class="itemList">
                    	<dt><a href="#">其他内容</a></dt>
                        <dd><a href="#">注册协议</a></dd>
                        <dd><a href="#">商务合作</a></dd>
                        <dd><a href="#">关于我们</a></dd>
                        <dd><a href="#">免责声明</a></dd>
                        <dd><a href="#">易付网博客</a></dd>
                    </dl>
                    
                    <dl class="itemList itemListLast">
                    	<dt>&nbsp;</dt>
                        <dd>&nbsp;</dd>
                        <dd>周一至周日 9:00-18:00</dd>
                        <dd>投诉：service@yifuka.com</dd>
                        <dd>投诉专线：13366469566</dd>
                        <dd>&nbsp;</dd>
                        <dd>&nbsp;</dd>
                    </dl>
                </div>
            </div>
            <div class="jf-bottom-copyright">有限公司有限公司有限公司有限公司 版权所有&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;地址：广州市天河区广州市天河区广州市天河区</div>
        </div>
      <div id="loginBg"></div>
      <!--登录-->
      	<div class="jf-login">
        	<h2 class="jf-loginTitle">登录</h2>
          <a href="#"  onclick="pupClose()" class="loginCloseBtn"><img src="images/closeImg.png" width="30" height="30" /></a>
          <form class="loginForm">
       	    <p><b class="bgImgS" style="background-position:0 -30px;"></b><input  class="loginTxt" type="text" placeholder="用户名/手机/邮箱"  /></p>
                <p>
                    <b class="bgImgS" style="background-position:0 -52px;"></b>
                    <input class="loginTxt" id="password-text" type="password" placeholder="请输入密码" />
                </p>
                <p><input name="" type="checkbox" value="" /><label>自动登录</label><a href="#" class="forgotPsd">忘记密码？</a></p> 
                <p style="margin-bottom:10px;"><input type="submit" value="登录" class="loginBtn btnBgS" /></p>
                <p class="toRegister">还没有账号<a href="#">请注册</a></p>
            </form>
        </div>
        <!--登录 end-->
        <!--注册-->
        <div class="jf-register">
        	<div class="jf-overflowH">
                <h2 class="jf-registerTitle titlePitch" id="phoneForm">手机注册</h2>
                <h2 class="jf-registerTitle" id="emialForm" style=" border-left:1px solid #ccc; border-radius:0 10px 0 0; width:249px;">邮箱注册</h2>
            </div>
          	<a href="#"  onclick="regClose()" class="registerCloseBtn"><img src="images/closeImg.png" width="30" height="30" /></a>
          	<form class="registerForm">
       	    	<p><label>手机号码</label><input name="registerPhone"  class="registerTxt" type="text" placeholder="建议使用常用手机" /></p>
                <p><label style="letter-spacing:6px;">验证码</label><input type="button" value="发验证码" class="sendCode" /><input name="registerCode" type="text" class="registerTxt" placeholder="请输入验证码"  style="width:118px;"  /></p>
                <p><label>设置密码</label><input name="registerPsd" type="password" class="registerTxt" placeholder="请输入密码，密码至少6位"  /></p>
                <p><label>确认密码</label><input name="registerConPsd" type="password" class="registerTxt" placeholder="再次输入您的密码"  /></p>
                <p><input name="" type="checkbox" value=""  checked="checked"/><label style="line-height:20px;">我已阅读并同意</label><a href="#" style="color:#0099ff">《注册协议》</a></p> 
                <p style="margin-bottom:10px;"><input type="submit" value="注册" class="registerBtn btnBgS" /></p>
                <p class="toLogin">已有账号<a href="#">请登录</a></p>
            </form>
            <form class="registerFormForEmial" style="display:none;">
       	    	<p><label>邮箱账号</label><input name="registerEmail"  class="registerTxt" type="text" placeholder="建议使用常用邮箱" /></p>
                <p><label>设置密码</label><input name="registerEPsd" type="password" class="registerTxt" placeholder="请输入密码，密码至少6位"  /></p>
                <p><label>确认密码</label><input name="registerEConPsd" type="password" class="registerTxt" placeholder="再次输入您的密码"  /></p>
                <p><label style="letter-spacing:6px;">验证码</label><input name="registerECode" type="text" class="registerTxt" placeholder="请输入验证码"  /></p>
                <p><input name="" type="checkbox" value=""  checked="checked"/><label style="line-height:20px;">我已阅读并同意</label><a href="#" style="color:#0099ff">《注册协议》</a></p> 
                <p style="margin-bottom:10px;"><input type="submit" value="注册" class="registerBtn btnBgS" /></p>
                <p class="toLogin">已有账号<a href="#">请登录</a></p>
            </form>
        </div>
        <!--注册 end-->
    </div>
</body>
<script language="javascript">
$(document).ready(function(e) {
    $(".jf-banner-img").hover(function(){
		$(".jf-banner-imgPre").stop().animate({opacity:"1"},500);
		$(".jf-banner-imgNext").stop().animate({opacity:"1"},500);
		},function(){
			$(".jf-banner-imgPre").stop().animate({opacity:"0"},300);
			$(".jf-banner-imgNext").stop().animate({opacity:"0"},300);
	})	
});
</script>
</html>
