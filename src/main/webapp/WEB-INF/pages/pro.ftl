<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<title>积分商城-逸乐生活网</title>
<meta name="description" content="途皓（北京）商务服务有限公司" />
<meta name="keywords" content="途皓（北京）商务服务有限公司" />
<link rel="stylesheet" type="text/css" href="<@spring.url '/css/css.css'/>"/>
<link rel="stylesheet" type="text/css" href="<@spring.url '/css/common.css'/>"/>
<link rel="stylesheet" type="text/css" href="<@spring.url '/css/model.css'/>"/>
<script type="text/javascript" src="<@spring.url '/js/jquery.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/js/model.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/js/gd_Index.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/js/banner.js'/>"></script>
<script language="javascript" src="<@spring.url '/js/menu.js'/>" ></script>
</head>
<body>
<!--头部-->
<#include "/lib/template/header.ftl" encoding="UTF-8">
<!--头部-->

<!--主体-->
<div class="jf-main">
        <!--分类-->
        <div class="jf-classify">

            <div class="jf-width1000">
                <div class="jf-overflowH">
                    <h1 class="jf-classifyTitle">分类</h1>
                    <span class="jf-browse">浏览全部<b class="bgImgS"></b></span>
                </div>

                <div class="jf-classifyDrop">

                   <div class="jf-classifyItem">
                        <h2 class="jf-classifyItemTitle">保健品：</h2>
                        
                        <ul class="jf-classifyItemList">
                            <li class="colorRed"><a href="#" index="0">全部</a></li>
                            <li style=" text-align: left"><a href="#" index="0">鱼油</a></li>
                            <li style=" text-align: left"><a href="#" index="0">护肝片</a></li>
                        </ul>
                        
                    </div>
                    
                    <div class="jf-classifyItem">
                        <h2 class="jf-classifyItemTitle">酒类：</h2>

                        <ul class="jf-classifyItemList">
                            <li><a href="#" index="1">全部</a></li>
                            <li style=" text-align: left"><a href="#" index="1">红葡萄酒</a></li>
                        </ul>
                        
                    </div>
                    
                    <div class="jf-classifyItem">
                        <h2 class="jf-classifyItemTitle">办公用品：</h2>

                        <ul class="jf-classifyItemList">
                            <li><a href="#" index="2">全部</a></li>
                            <li style=" text-align: left"><a href="#" index="2">移动硬盘</a></li>
                            <li style=" text-align: left"><a href="#" index="2">路由器</a></li>
                        </ul>
                        
                    </div>
                    
                    <div class="jf-classifyItem">
                        <h2 class="jf-classifyItemTitle">家用电器：</h2>

                        <ul class="jf-classifyItemList">
                            <li><a href="#" index="3">全部</a></li>
                            <li style=" text-align: left"><a href="#" index="3">无人机</a></li>
                            <li style=" text-align: left"><a href="#" index="3">机器人吸尘器</a></li>
                            <li style=" text-align: left"><a href="#" index="3">美容剃毛器</a></li>
                            <li style=" text-align: left"><a href="#" index="3">电动牙刷</a></li>
                        </ul>
                            
                    </div>
                    
                    <div class="jf-classifyItem">
                        <h2 class="jf-classifyItemTitle">厨具：</h2>

                        <ul class="jf-classifyItemList">
                            <li><a href="#" index="4">全部</a></li>
                            <li style=" text-align: left"><a href="#" index="4">刀具</a></li>
                        </ul>
                            
                    </div>
                    
                    <div class="jf-classifyItem">
                        <h2 class="jf-classifyItemTitle">母婴：</h2>

                        <ul class="jf-classifyItemList">
                            <li><a href="#" index="5">全部</a></li>
                            <li style=" text-align: left"><a href="#" index="5">吸奶器</a></li>
                        </ul>
                            
                    </div>
                    
                    <div class="jf-classifyItem">
                        <h2 class="jf-classifyItemTitle">购物卡/礼品卡：</h2>

                        <ul class="jf-classifyItemList">
                            <li><a href="#" index="6">全部</a></li>
                            <li style=" text-align: left"><a href="#" index="6">购物卡</a></li>
                            <li style=" text-align: left"><a href="#" index="6">现金券</a></li>                            
                            <li style=" text-align: left"><a href="#" index="6">礼品卡</a></li>
                            <li style=" text-align: left"><a href="#" index="6">现金卡</a></li>
                        </ul>
                            
                    </div>
                    
                   <div class="jf-classifyItem">
                        <h2 class="jf-classifyItemTitle">数码影音：</h2>

                        <ul class="jf-classifyItemList">
                            <li><a href="#" index="7">全部</a></li>
                            <li style=" text-align: left"><a href="#" index="7">耳机</a></li>
                            <li style=" text-align: left"><a href="#" index="7">智能监控</a></li>
                            <li style=" text-align: left"><a href="#" index="7">智能手环</a></li>
                        </ul>
                            
                    </div>
                    
                    <div class="jf-classifyItem">
                        <h2 class="jf-classifyItemTitle">汽车用品：</h2>

                        <ul class="jf-classifyItemList">
                            <li><a href="#" index="8">全部</a></li>
                            <li style=" text-align: left"><a href="#" index="8">行车记录仪
                            </a></li>
                        </ul>

                    </div>
                    
                </div>

            </div>

        </div>
        <!--分类 end-->

        <!--产品-->
        <div class="jf-product jf-width1000" style=" padding-bottom:30px;">
            
            <div class="jf-productList">
                <a href="proshowXMWRJ.html" target="_blank"><img src="images/proImg/1.jpg" onerror="downloadErrImg(this,&#39;389-2-8&#39;)" width="280" height="182"></a>
                <p><a href="proshowXMWRJ.html" target="_blank" class="jf-productName">小米无人机4K版</a></p>
                <p><span class="jf-productPrice">￥2999.00</span></p>
            </div>
            
            <div class="jf-productList">
                <a href="proshowXMPHC.html" target="_blank"><img src="images/proImg/2.jpg" onerror="downloadErrImg(this,&#39;389-2-8&#39;)" width="280" height="182"></a>
                <p><a href="proshowXMPHC.html" target="_blank" class="jf-productName">小米9号平衡车</a></p>
                <p><span class="jf-productPrice">￥1999.00</span></p>
            </div>
            
            <div class="jf-productList">
                <a href="proshowJDC.html" target="_blank"><img src="images/proImg/JD1000.jpg" onerror="downloadErrImg(this,&#39;389-2-8&#39;)" width="280" height="182"></a>
                <p><a href="proshowJDC.html" target="_blank" class="jf-productName">京东卡</a></p>
                <p><span class="jf-productPrice">￥1000.00</span></p>
            </div>

            <div class="jf-productList">
                <a href="proshowSNC.html" target="_blank"><img src="images/proImg/SNE1000.png" onerror="downloadErrImg(this,&#39;389-2-8&#39;)" width="280" height="182"></a>
                <p><a href="proshowSNC.html" target="_blank" class="jf-productName">苏宁卡</a></p>
                <p><span class="jf-productPrice">￥1000.00</span></p>
            </div>
            
            <div class="jf-productList">
                <a href="proshowGAPC.html" target="_blank"><img src="images/proImg/GAPC.png" onerror="downloadErrImg(this,&#39;389-2-8&#39;)" width="280" height="182"></a>
                <p><a href="proshowGAPC.html" target="_blank" class="jf-productName">GAP礼品卡</a></p>
                <p><span class="jf-productPrice">￥1000.00</span></p>
            </div>
                        
            <div class="jf-productList">
                <a href="proshowCarrefourC.html" target="_blank"><img src="images/proImg/CarrefourCard.png" onerror="downloadErrImg(this,&#39;389-2-8&#39;)" width="280" height="182"></a>
                <p><a href="proshowCarrefourC.html" target="_blank" class="jf-productName">家乐福购物卡</a></p>
                <p><span class="jf-productPrice">￥1000.00</span></p>
            </div>
            
            <div class="jf-productList">
                <a href="proshowSTC.html" target="_blank"><img src="images/proImg/STC.jpg" onerror="downloadErrImg(this,&#39;389-2-8&#39;)" width="280" height="182"></a>
                <p><a href="proshowSTC.html" target="_blank" class="jf-productName">资和信商通卡</a></p>
                <p><span class="jf-productPrice">￥1000.00</span></p>
            </div>
            
             <div class="jf-productList">
                <a href="proshowCtripC.html" target="_blank"><img src="images/proImg/CtripC.png" onerror="downloadErrImg(this,&#39;389-2-8&#39;)" width="280" height="182"></a>
                <p><a href="proshowCtripC.html" target="_blank" class="jf-productName">携程礼品卡</a></p>
                <p><span class="jf-productPrice">￥5000.00</span></p>
            </div>
            
            <div class="jf-productList">
                <a href="proshowDDCXlq.html" target="_blank"><img src="images/proImg/DDCXLQ.png" onerror="downloadErrImg(this,&#39;389-2-8&#39;)" width="280" height="182"></a>
                <p><a href="proshowDDCXlq.html" target="_blank" class="jf-productName">滴滴出行礼券</a></p>
                <p><span class="jf-productPrice">￥50.00</span></p>
            </div>
            
             <div class="jf-productList">
                <a href="proshowIQiYiC.html" target="_blank"><img src="images/proImg/IQiYiC.png" onerror="downloadErrImg(this,&#39;389-2-8&#39;)" width="280" height="182"></a>
                <p><a href="proshowIQiYiC.html" target="_blank" class="jf-productName">爱奇艺礼券</a></p>
                <p><span class="jf-productPrice">￥199.00</span></p>
            </div>
            
            <div class="jf-productList">
                <a href="proshowYouKuC.html" target="_blank"><img src="images/proImg/youkuC.png" onerror="downloadErrImg(this,&#39;389-2-8&#39;)" width="280" height="182"></a>
                <p><a href="proshowYouKuC.html" target="_blank" class="jf-productName">优酷网会员卡</a></p>
                <p><span class="jf-productPrice">￥169.00</span></p>
            </div>
            
             <div class="jf-productList">
                <a href="proshowIKangC.html" target="_blank"><img src="images/proImg/IKangC.png" onerror="downloadErrImg(this,&#39;389-2-8&#39;)" width="280" height="182"></a>
                <p><a href="proshowIKangC.html" target="_blank" class="jf-productName">爱康国宾体检卡</a></p>
                <p><span class="jf-productPrice">￥5000.00</span></p>
            </div>
            
        </div>
        <!--产品 end-->
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


<#--footer-->
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
