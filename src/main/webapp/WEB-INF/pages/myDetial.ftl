<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<title>我的订单详情-逸乐生活网</title>
<meta name="description" content="途皓（北京）商务服务有限公司" />
<meta name="keywords" content="途皓（北京）商务服务有限公司" />
<link rel="stylesheet" type="text/css" href="<@spring.url '/css/css.css'/>"/>
<link rel="stylesheet" type="text/css" href="<@spring.url '/css/style.css'/>"/>
<script type="text/javascript" src="<@spring.url '/js/gd_Index.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/js/jquery.js'/>"></script>
<script language="javascript" src="<@spring.url '/js/menu.js'/>" ></script>
<style>
.rightOrder{ padding:0; margin-bottom: 30px;}
.rightOrder h2{font-size:14px;}
.rightOrder p{ line-height: 30px; font-size: 14px;}
.listTitle{ background: #eee; border-top: 3px solid #ccc; overflow: hidden; width: 970px;}
.listTitle li,.listItem li{ float: left; line-height: 30px; text-align: center; font-size: 14px; padding:0 10px;}
.listItem li{ margin: 5px 0; line-height: 40px;}
.width150{ width: 150px;}
.width570{ width: 490px;}
.listItem .textAL{ text-align: left;}
.rightOrder img{ border: 1px solid #f60; vertical-align: middle;}
.proTxt{display: inline-block; width: 420px; float: left; line-height: 20px; height: 40px; margin-left: 10px;}
</style>
</head>

<body>
    <!--头部-->
    <#include "/lib/template/header.ftl" encoding="UTF-8">
    <!--end 头部-->

    <div class="main">
        <div style="width:100%; background: #f3f3f3; height:30px;"></div>
        <div class="memberMain">

            <!--左边-->
            <#include "/lib/template/left.ftl" encoding="UTF-8">
            <!--end 左边-->

            <div class="memberMain-Right">
                <h1 class="baseinfo-Title">我的订单</h1>
                <div class="rightOrder">
                    <p><span>订单号码：</span><span>${queryMemberOrder[0].billNo}</span></p>
                   	<p><span>下单时间：</span><span>${queryMemberOrder[0].saleDateTime}</span></p>
                   	<p><span>订单状态：</span><span>${queryMemberOrder[0].orderStatus}</span></p>
                    <p><span>配送状态：</span><span>${queryMemberOrder[0].deliveryStatus}</span></p>
                   	<p><span>订单金额：</span><span>￥${queryMemberOrder[0].totalPrice}</span></p>
                    <p><span>收货人：</span><span>${queryMemberOrder[0].receiverName}</span></p>
                    <p><span>收货地址：</span><span>${queryMemberOrder[0].addr}</span></p>
                    <p><span>订单类型：</span>
                        <#if queryMemberOrder[0].saleOrderPrdType == "0">
                            <span>商品订单</span>
                        <#else>
                            <span>卡订单</span>
                        </#if>
                    </p>
                    <p><span>订单备注：</span><span>${queryMemberOrder[0].remark}</span></p>

                   	<#--<p><span>支付方式：</span><span><img src="<@spring.url '/images/bankLogo/payTypeYL.png'/>" width="75" height="25" /></span></p>-->
                </div>
                <div class="overflowH">
                	<ul class="listTitle">
                    	<li class="width570">商品名称</li>
                        <li class="width150">单价</li>
                        <li class="width100">数量</li>
                        <li class="width150">小计</li>
                    </ul>
                    <ul class="listItem">
                    	<li class="width570 textAL overflowH">
                    		<a href="#" style="float: left;"><img src="<@spring.url '/images/about3.jpg'/>" width="60" height="40" /></a>
                    		<a href="#" class="proTxt">商品名称商品名称商品名称商品名称商品名称商品名称商品名称商品名称商品名称商品名称商品名称</a>
                    	</li>
                        <li class="width150">￥100.00</li>
                        <li class="width100">2</li>
                        <li class="width150">￥200.00</li>
                    </ul>
                    <ul class="listItem">
                    	<li class="width570 textAL overflowH">
                    		<a href="#" style="float: left;"><img src="<@spring.url '/images/about3.jpg'/>" width="60" height="40" /></a>
                    		<a href="#" class="proTxt">商品名称商品名称商品名称商品名称商品名称商品名称商品名称商品名称商品名称</a>
                    	</li>
                        <li class="width150">￥100.00</li>
                        <li class="width100">2</li>
                        <li class="width150">￥200.00</li>
                    </ul>
                </div>
                <div style="text-align: right; margin-top: 20px;"><input type="button" value="返 回" onclick="history.back()" style="font-size: 14px; padding: 0 20px; line-height: 30px; background: #eee; border:1px solid #ccc; cursor: pointer;" /></div>

            </div>
        </div>
    </div>

    <!--合作伙伴-->
    <#include "/lib/template/partner.ftl" encoding="UTF-8">
    <!--end 合作伙伴-->


    <!--底部-->
    <#include "/lib/template/footer.ftl" encoding="UTF-8">
    <!--end 底部-->

</body>
</html>
