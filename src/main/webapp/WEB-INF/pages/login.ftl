<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录</title>
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/model.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/model.js"></script>
<#--<script type="text/javascript" src="/js/security.js"></script>-->
<#--<script type="text/javascript" src="/js/encrypt.js"></script>-->
<style>
.jf-productList{ width:323px; margin:0 10px 10px 0; background:none;}
.jf-productList:hover{ background:#faecec;}
</style>
</head>

<body>
	<div class="jf-wrapper">
    	<!--头部-->
        <#include  "/lib/template/header.ftl">
        <!--头部 end-->

        <div class="jf-main">
        	<div class="jf-classify" style=" padding-bottom:0;">
            	<div class="jf-width1000">
                    <div class="jf-overflowH">
                        <h1 class="jf-classifyTitle">登录</h1>
                    </div>
             	</div>
                
            </div>
            
			<form class="loginForm" action="/login" id="redLoginForm" method="post">
       	    <p><b class="bgImgS" style="background-position:0 -30px;"></b><input  class="loginTxt" type="text" id="loginname" name="username" placeholder="用户名/手机/邮箱"  /></p>
                <p>
                    <b class="bgImgS" style="background-position:0 -52px;"></b>
                    <input class="loginTxt" id="lgpaswd" type="password" name="password"  placeholder="请输入密码" />
                </p>
                <p><input name="" type="checkbox" value="" /><label>自动登录</label><a href="#" class="forgotPsd">忘记密码？</a></p>
                <p style="margin-bottom:10px;"><input type="submit"  value="登录" class="loginBtn btnBgS" /></p>
                <p class="toRegister">还没有账号<a href="#">请注册</a></p>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>
                        
        </div>
        
        <!--底部-->
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
        <!--底部 end-->
                 
    </div>
</body>

</html>
