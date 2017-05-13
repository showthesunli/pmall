<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<title>会员中心-逸乐生活网</title>
<meta name="description" content="途皓（北京）商务服务有限公司" />
<meta name="keywords" content="途皓（北京）商务服务有限公司" />
<link rel="stylesheet" type="text/css" href="<@spring.url '/css/css.css'/>"/>
<link rel="stylesheet" type="text/css" href="<@spring.url '/css/style.css'/>"/>
<script type="text/javascript" src="<@spring.url '/js/jquery.js'/>"></script>
<script language="javascript" src="<@spring.url '/js/menu.js'/>" ></script>
<style>
.main{ width: 100%;}
.memberMain{ width: 1200px; min-height: 300px; margin: 0 auto; overflow: hidden;}
.overflowH{ overflow: hidden;}
.memberMain-Left{ float: left; padding: 20px 30px; border-top: 3px solid #f60;font-size:16px;}
.iconLBgGray span{-webkit-filter: grayscale(100%); -moz-filter: grayscale(100%); -ms-filter: grayscale(100%); -o-filter: grayscale(100%); filter: grayscale(100%); filter: gray;}
.iconLBgGray:hover span{-webkit-filter: grayscale(0%); -moz-filter: grayscale(0%); -ms-filter: grayscale(0%); -o-filter: grayscale(0%); filter: none;}
.fontColorO a{ color: #ff6600;}
.memberMain-Left a{ line-height: 40px; height: 40px; display: inline-block; width: 100px;}
.iconLBg{ background: url(images/member/leftIcon.png); display: inline-block; width: 20px; height: 20px; margin-top: 10px; margin-right: 10px; vertical-align: top;}
.iconLInfor{ background-position: 0 0;}
.iconLOrder{ background-position: 0 -22px;}
.iconLPoint{ background-position: 0 -44px;}
.memberMain-Right{ width: 970px; float: right; padding: 20px;}
.memberMainR-Baseinfo{ overflow: hidden; border-bottom: 3px solid #eee; padding:10px 30px 20px;}
.memberMainR-Baseinfo img{ border-radius:50%; float: left;}
.baseinfo-Title{ font-size: 16px; font-weight: bold; color: #666; line-height: 40px; margin-bottom: 20px;}
.baseinfo-Account{ margin-left: 30px; float: left; width: 350px;}
.baseinfo-Account p,.baseinfo-Tip p{ font-size: 14px; line-height: 20px; margin-bottom: 10px;}
.baseinfo-Account span,.baseinfo-Tip span{ color: #f60;}
.baseinfo-Account input{ margin-left: 10px; height: 25px; padding:0 10px; border: 1px solid #f60; border-radius: 5px; color: #f60; background: #fff; cursor: pointer;}
.baseinfo-Tip{ float: left; font-size: 12px; color: #3897d7; width: 340px; padding:35px 30px 25px; line-height:20px; border-left: 2px solid #eee; text-align: center;}
.baseinfo-Tip input{ border:none; background: #f60; color:#fff; padding: 5px 20px; cursor: pointer; margin-top: 20px;}
.rightOrder{ padding: 30px 0;}
.rightOrder h2{ font-size: 16px; font-weight: bold; color: #666; margin-bottom: 20px;}
.orderTable{ font-size: 12px; line-height: 30px; color: #666; text-align: center;}
.orderTable th{background:#f3f3f3;}
</style>
</head>

<body>
    <!--头部-->
    <#include "/lib/template/header.ftl" encoding="UTF-8">
    <!--end 头部-->

    <div class="main">
        <div style="width:100%; background: #f3f3f3; height:30px;"></div>
        <div class="memberMain">
            <#include "/lib/template/left.ftl" encoding="UTF-8">
            <div class="memberMain-Right">
                <!--<h1 class="baseinfo-Title">我的个人中心</h1>-->
                <div class="memberMainR-Baseinfo">
                    <img src="<@spring.url '/images/fuwu1.jpg'/>" width="120" height="120">
                    <div class="baseinfo-Account">
                        <p>我的账号：<span>${memberInfo[0].memberID}</span></p>
                        <p>我的积分：<span>${memberInfo[0].memberID}</span></p>
                        <p>我的手机：<span>${memberInfo[0].mobile}</span></p>
                        <p>我的邮箱：<span>${memberInfo[0].email}</span></p>
                        <p><input type="button" value="修改资料" onclick="javascript:window.location.href='<@spring.url '/myInformation'/>'" style=" color: #3897d7; border: 1px solid #3897d7; margin-left:70px;" /></p>
                    </div>
                    <div class="baseinfo-Tip">
                        <p>账户余额：<span style="font-size:20px; margin:0 10px;">789.50</span>元</p>
                        <p><input type="button" value="余额充值" /></p>
                    </div>
                </div>

                <div class="rightOrder">
                    <h2>我的订单</h2>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="orderTable">
                        <tr>
                            <th width="40%">订单编号</th>
                            <th width="10%">价格</th>
                            <th width="10%">配送状态</th>
                            <th width="10%">订单状态</th>
                            <th>操作</th>
                        </tr>
                        <#list queryMemberOrder as key>
                        <tr>
                            <td><a href="<@spring.url '/buycfm;billNo=${key.billNo};'/>">${key.billNo}</a></td>
                            <td>￥${key.totalPrice}</td>
                            <td>${key.deliveryStatus}</td>
                            <td>${key.orderStatus}</td>
                            <td><a href="" style="color:#3897d7;">删除</a></td>
                        </tr>
                        </#list>
                        <tr>
                            <td colspan="5" style="text-align:right"><a href="" style="color:#f60; text-decoration:underline;">查看更多 >></a></td>
                        </tr>
                    </table>
                </div>

            </div>
        </div>
    </div>


    <!--底部-->
    <#include "/lib/template/footer.ftl" encoding="UTF-8">
    <!--end 底部-->

</body>
</html>
