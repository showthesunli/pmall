<#import "/spring.ftl" as spring/>
<#import "/lib/macro/hisuMacro.ftl" as sf />
<!doctype html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<title>会员中心-逸乐生活网</title>
<meta name="description" content="途皓（北京）商务服务有限公司" />
<meta name="keywords" content="途皓（北京）商务服务有限公司" />
<link rel="stylesheet" type="text/css" href="<@spring.url '/css/css.css'/>"/>
<link rel="stylesheet" type="text/css" href="<@spring.url '/css/style.css?t=20170516'/>"/>
<script type="text/javascript" src="<@spring.url '/js/gd_Index.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/js/jquery.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/js/menu.js'/>" ></script>
<style>
.baseinfo-Account label{ display: inline-block; width: 70px; text-align: right;}	
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
                        <p><label>用户名：</label><span>${memberInfo[0].memberID}</span></p>
                        <!--<p>我的积分：<span>${queryMmbAccInfo[0].balanceAmount}</span></p>-->
                        <p><label>我的手机：</label><span>${memberInfo[0].mobile}</span></p>
                        <p><label>我的邮箱：</label><span>${memberInfo[0].email}</span></p>
                        <p><input type="button" value="修改资料" onclick="javascript:window.location.href='<@spring.url '/myInformation'/>'" style=" color: #3897d7; border: 1px solid #3897d7; margin-left:70px;" /></p>
                    </div>
                    <div class="baseinfo-Tip">
                        <p>途皓卡余额：<span style="font-size:20px; margin:0 10px;">${queryMmbAccInfo[0].balanceAmount}</span>元</p>
                        <p><input type="button" value="途皓卡余额充值" onclick="window.location='<@spring.url "/accountRecharge"/>'" /></p>
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
                            <td><a href="<@spring.url '/myDetial'/>?billNo=${key.billNo}">${key.billNo}</a></td>
                            <td>￥${key.totalPrice}</td>
                            <td>${key.deliveryStatus}</td>
                            <td>${key.orderStatus}</td>
                            <td>
                                <#if key.orderStatus == "等待支付">
                                    <a href="<@spring.url '/buycfm;billNo=${key.billNo};termID=web;'/>" style="color:#3897d7;">继续支付</a>
                                	<a href="<@spring.url '/deleteOrder'/>?billNo=${key.billNo}" style="margin-left:0;">取消订单</a>
                                </#if>
                            </td>
                        </tr>
                        </#list>
                    </table>
                    <#--分页 当前页，参与分页的总记录数，每页记录数-->
				    <#if queryMemberOrder_totalRecNum??>
				        <@sf.pageset currentPage queryMemberOrder_totalRecNum numOfPerPage "member"></@sf.pageset>
				    </#if>
				    <!--end 主体-->
                </div>

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
