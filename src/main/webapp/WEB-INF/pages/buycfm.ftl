<#import "/spring.ftl" as spring/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>订单支付-逸乐生活网</title>
<link rel="stylesheet" type="text/css" href="<@spring.url '/css/css.css'/>"/>
<link rel="stylesheet" type="text/css" href="<@spring.url '/css/style.css'/>"/>
<script type="text/javascript" src="<@spring.url '/js/gd_Index.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/js/jquery.js'/>"></script>
<script language="javascript" src="<@spring.url '/js/menu.js'/>" ></script>
<style>
.orderDtl{ background:#ffefe5; padding:20px; font-size:14px;}
.orderDtl p{ line-height: 25px;}
.jf-cart{ color:#666;}
.industryItem li{ font-weight:bold;}
.industryList li{ padding:3px 20px;}
.sureBtn{width: 150px; height: 40px; border: 1px solid #f60; color: #fff; font-size: 16px; font-weight: bold; background:url(images/btnBg.png) no-repeat; background-position: 0 -75px;}
</style>
</head>

<body>
	<div class="jf-wrapper">
    <!--头部-->
    <#include "/lib/template/header.ftl" encoding="UTF-8">
    <!--end 头部-->
        
    <div class="jf-main">
        <div class="ny_nav">
            <div class="ny_nav1">当前位置：<a href='<@spring.url "/index"/>'>首页</a> > 订单支付</div>
            <div class="clearfix"></div>
        </div>
            
            <div class="jf-cart jf-width1000">
            	<div class="orderDtl">
                	<p>订单号码：${queryMemberOrder[0].billNo}</p>
                    <p>订单产品：</p>
                    <p>下单时间：${queryMemberOrder[0].saleDateTime}</p>
                    <p>订单状态：${queryMemberOrder[0].orderStatus}</p>
                    <p>支付金额：<span style="font-weight:bold; font-size:16px; color:#f60">￥${queryMemberOrder[0].totalPrice}</span></p>
                </div>
                
                <!--<div class="jf-overflowH" style="border:2px solid #f60; padding:20px; margin:10px 0;">
					<p style=" font-size:14px; font-weight:bold; line-height:35px;">请选择支付方式：</p>
                  	<ul class="industryItem jf-overflowH">
                        <li id="i1"class="borderColorW">银行</li>
                        <li id="i2">通讯行业</li>
                        <li  id="i3">航空公司</li>
                    </ul>
                    <div id="l-i1" class="industryList jf-overflowH">
                        <ul class="jf-overflowH">
                            <li id="l1" class="exPoint">储蓄卡</li>
                            <li id="l2">信用卡</li>
                        </ul>
                        <div class="jf-overflowH" id="l-l1" style="border:none; padding:0; margin:0;">
                            <div><input name="radioG1" type="radio" value="中信" /><img src="<@spring.url '/images/bankLogo/bank02.png'/>" width="150" height="25" /></div>
                            <div><input name="radioG1" type="radio" value="建设" /><img src="<@spring.url '/images/bankLogo/bank01.png'/>" width="150" height="25" /></div>
                            <div><input name="radioG1" type="radio" value="工商" /><img src="<@spring.url '/images/bankLogo/bank02.png'/>" width="150" height="25" /></div>
                        </div>
                        <div class="jf-overflowH" id="l-l2" style=" display:none;border:none; padding:0; margin:0;">
                            <div><input name="radioG1" type="radio" value="建设" /><img src="<@spring.url '/images/bankLogo/bank01.png'/>" width="150" height="25" /></div>
                            <div><input name="radioG1" type="radio" value="中信" /><img src="<@spring.url '/images/bankLogo/bank02.png'/>" width="150" height="25" /></div>
                            <div><input name="radioG1" type="radio" value="工商" /><img src="<@spring.url '/images/bankLogo/bank03.png'/>" width="150" height="25" /></div>
                        </div>
                    </div>
                
                    <div class="jf-overflowH industryList" id="l-i2" style="display:none;">
                        <div class="jf-overflowH" style="border:none; padding:0; margin:0;">
                            <div><input name="radioG1" type="radio" value="移动" /><img src="<@spring.url '/images/bankLogo/bank01.png'/>" width="150" height="25" /></div>
                            <div><input name="radioG1" type="radio" value="联通" /><img src="<@spring.url '/images/bankLogo/bank02.png'/>" width="150" height="25" /></div>
                        </div>
                    </div>
                    
                    <div class="jf-overflowH industryList" id="l-i3" style="display:none;">
                        <div class="jf-overflowH" style="border:none; padding:0; margin:0;">
                            <div><input name="radioG2" type="radio" value="东航" /><img src="<@spring.url '/images/bankLogo/bank02.png'/>" width="150" height="25" /></div>
                            <div><input name="radioG1" type="radio" value="国际" /><img src="<@spring.url '/images/bankLogo/bank03.png'/>" width="150" height="25" /></div>
                        </div>
                    </div>
                	
                    
                </div>-->
                    
                <p style="text-align:center; margin:20px 0 0; float:right">
                    <input type="button" value="取消订单" class="sureBtn" style="background: #eee; color:#666; margin-right:10px; border:1px solid #ccc;""  />
                    <input type="button" value="下一步" class="sureBtn"  />
                </p>
            </div>
            
    </div>
        
    <!--合作伙伴-->
    <#include "/lib/template/partner.ftl" encoding="UTF-8">
    <!--end 合作伙伴-->

    <!--底部-->
    <#include "/lib/template/footer.ftl" encoding="UTF-8">
    <!--end 底部-->
        
</body>
<script language="javascript">
$(document).ready(function(e) {
    $(".industryItem li").click(function(){
		var name = $(this).attr('id');
		$(".industryList").css("display","none");
		$("#l-" + name).css("display","block");
		$(".industryItem li").removeClass("borderColorW");
		$(this).addClass("borderColorW");
		})
	
	$(".industryList li").click(function(){
		var name = $(this).attr('id');
		$(this).parent().parent().children("div").css("display","none");
		$("#l-" + name).css("display","block");
		$(this).parent().children("li").removeClass("exPoint");
		$(this).addClass("exPoint");
		})
});

    var useTime = 0;
    var statusMsg = {
    doStatus: function (billNo) {
        if (billNo == null || billNo == "null" || billNo == "") {
            statusMsg.printText(2, "订单号无效！");
            return;
        }
        $.post("member/orderStatus.jsp?billNo=" + billNo, function (data) {
            var statusStr = data.substr(data.indexOf("=") + 1);
            var status = parseInt(statusStr.split("*-*")[0]);
            var msg = statusStr.split("*-*")[1];
            if (status == 0) {
                statusMsg.printText(0);
                setTimeout(function () {
                    statusMsg.doStatus(billNo);
                }, 500);
            } else if (status == 1) {
                //statusMsg.printText(1);
                location.href = "member/buycfm.jsp?billNo=<%=billNo%>";
            } else if (status > 1) {
                statusMsg.printText(2, msg);
            }
        }, "text");
    },
    printText: function (type, msg) {
        if (type == 0) {
            var text = "<span style='font-size:16px;'><img src='images/loading.gif' style='vertical-align:middle;'> 正在提交订单，请稍后......</span>";
            $("#orderMsg").html(text);
        } else if (type == 1) {
            $("#orderMsg").css({
                "padding-top": "10px",
                "height": "50px"
            }).html("票券分配成功，请点击“查看订单”来完成支。<br/>如订单在45分钟内未支付，则会自动撤销！");
        } else if (type == 2) {
            $("#orderMsg").css("color", "#d51a6d").html("分配票券失败，因为：" + msg);
        }
    },
    initStatus: function (billNo) {
        statusMsg.printText(0);
        setTimeout(function () {
            statusMsg.doStatus(billNo);
        }, 100);
    }
}
statusMsg.initStatus("${queryMemberOrder[0].billNo}")
</script>
</html>
