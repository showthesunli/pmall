<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<title>公司简介-逸乐生活网</title>
<meta name="description" content="途皓（北京）商务服务有限公司" />
<meta name="keywords" content="途皓（北京）商务服务有限公司" />
<link rel="stylesheet" type="text/css" href="css/css.css"/>
<script type="text/javascript" src="<@spring.url '/js/gd_Index.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/js/jquery.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/js/banner.js'/>"></script>
<script language="javascript" src="<@spring.url '/js/menu.js'/>" ></script>
<script type="text/javascript" src="<@spring.url '/js/model.js'/>"></script>
</head>
<body>
<!--头部-->
<#include "/lib/template/header.ftl" encoding="UTF-8">
<!--头部-->


<!--banner--> 
<div style="background:url('images/titleTag/b_about.jpg') no-repeat center top;height:150px;"></div>
<!--endbanner-->



<!--主体-->
<div class="main">

<div class="ny_nav">
<div class="ny_nav1">当前位置：<a href='index.html'>首页</a> > <a href="about.html">关于公司</a> > 公司简介</div>
<div class="clearfix"></div>
</div>

 
<div class="mainCon">
<div class="textCon">
<img src="images/about3.jpg" align="left" style="margin-right:40px;">
<h2>公司介绍</h2>
<p>途皓，由北京总部和上海分公司辐射全国，业务覆盖华南、华北、华东、中西四个大区，并在全国大部分一、二线城市布有主要业务骨干团队和运营团队，以新兴的移动互联网平台紧密联合线下各大型连锁商业企业，为各类公司提供“会员忠诚度”的一揽子增值服务方案。</p>
<p>途皓以各类客户的会员为主要服务对象，利用综合性的积分兑换平台为客户提供高质量、低成本的会员忠诚度方案。平台通过先进的网络平台、便捷的线下POS、24小时的电话服务，满足不同层次会员的兑换方式喜好；通过不定期、多样性的市场活动持续刺激会员，增强会员粘性度，并激活存量休眠客户；通过积分汇集功能将孤立小积分汇集成商户联盟大积分，增强会员积分价值感；通过商户联盟，为积分兑换打通衣、食、住、行、教育、培训及娱乐等各行业，形成全方位的、线上线下的全覆盖服务；在帮助客户消化积分、提高会员满意度的同时，导入其他中高端客户群的积分消费，为客户带来额外业务收入。</p>

</div>
<div class="clear"></div>
</div> 


<div class="mainCon2">
	<div class="textCon2">
	<img src="images/about2.jpg" align="right" style="margin-left:40px;">
	<!--<h2>我们的承诺 Our Commitment</h2>-->
	<p>目前公司的主要客户为各大银行信用卡中心、各大移动通讯公司、成品油零售企业及各类全国连锁酒店等，年兑换权益和积分量逾十亿人民币。积分和权益活动所覆盖的线上及线下商户多达几十家，涵盖全国性大型超市、百货公司、影院、知名餐饮、游乐场、教育、培训等不同服务范围。客户可以通过登陆途皓网站或微信平台轻松查询、兑换积分和权益。公司提供线上实时推送和线下自助提取的方式将客户心仪的产品快速、便捷送达至客户手中，提高客户的满意度。</p>
	<h2>我们公司的服务宗旨</h2>
	<p>
	<!--我们公司的服务宗旨<br>-->
	以客户为中心，提供最便捷轻松的服务
	</p>
	<h2>我们公司的愿景</h2>
	<p>
	<!--我们公司的愿景<br>-->
	覆盖面最广、价值感最强、客户满意度最高的会员增值服务平台
	</p>
	</div>
	<div class="clear"></div>
</div> 
<!--end 主体-->

 
 
<div class="cp_boxtt">
 <script language="javascript" type="text/javascript">
    function myfunctions1(ids1, left1, right1) {
        var ads = new ScrollPicleft();
        ads.scrollContId = ids1; // 内容容器ID""
        ads.arrLeftId = left1; //左箭头ID
        ads.arrRightId = right1; //右箭头ID
        ads.frameWidth = 1155;  //显示框宽度
        ads.pageWidth =1155; //翻页宽度
        ads.speed = 10; //移动速度(单位毫秒，越小越快)
        ads.space = 10; //每次移动像素(单位px，越大越快)
        ads.autoPlay = true; //自动播放
        ads.autoPlayTime = 3; //自动播放间隔时间(秒)
        ads.initialize(); //初始化
    }
</script>
	<article class="container text-center">
<h2 class="h-h2">合作伙伴</h2>
	</article>

<#--尾部footer.ftl-->
<#include "/lib/template/footer.ftl" encoding="UTF-8">

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
			<p class="toRegister">还没有账号<a href="#" onclick="regOpen()">请注册</a></p>
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
			<p class="toLogin">已有账号<a href="#" onclick="pupOpen()">请登录</a></p>
		</form>
		<form class="registerFormForEmial" style="display:none;">
			<p><label>邮箱账号</label><input name="registerEmail"  class="registerTxt" type="text" placeholder="建议使用常用邮箱" /></p>
			<p><label>设置密码</label><input name="registerEPsd" type="password" class="registerTxt" placeholder="请输入密码，密码至少6位"  /></p>
			<p><label>确认密码</label><input name="registerEConPsd" type="password" class="registerTxt" placeholder="再次输入您的密码"  /></p>
			<p><label style="letter-spacing:6px;">验证码</label><input name="registerECode" type="text" class="registerTxt" placeholder="请输入验证码"  /></p>
			<p><input name="" type="checkbox" value=""  checked="checked"/><label style="line-height:20px;">我已阅读并同意</label><a href="#" style="color:#0099ff">《注册协议》</a></p> 
			<p style="margin-bottom:10px;"><input type="submit" value="注册" class="registerBtn btnBgS" /></p>
			<p class="toLogin">已有账号<a href="#" onclick="pupOpen()">请登录</a></p>
		</form>
	</div>
	<!--注册 end-->

</body>
</html>
