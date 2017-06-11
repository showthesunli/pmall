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

.payTypeChoice{float: left; width: 538px; padding: 0 20px; border-left:2px solid #ccc; min-height: 126px;}
.payTypeItem{ padding: 5px; border: 1px solid #eee; background: #fff; cursor: pointer; float: left; margin-right: 10px;}
.payTypeItemBO{border-color:#f60;}
.payTypeChoice h5,.payTypeChoice span{ padding:2px 0; color: #333; margin-bottom: 10px; text-align: left; float: left;}
.payTypeItem{ margin-bottom: 10px;}
.payTypeItem img{ vertical-align: middle;}
.payTypeItem input[type=radio]{ vertical-align: middle;}
.gray{-webkit-filter: grayscale(100%); -moz-filter: grayscale(100%); -ms-filter: grayscale(100%); -o-filter: grayscale(100%); filter: grayscale(100%); filter: gray;cursor:not-allowed;
}
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
            	<div class="orderDtl jf-overflowH">
            		
                	<div style="float: left; width: 580px;">
                		<p>订单号码：${queryMemberOrder[0].billNo}</p>
                    	<p>订单产品：</p>
                    	<p>下单时间：${queryMemberOrder[0].saleDateTime}</p>
                    	<p>订单状态：${queryMemberOrder[0].orderStatus}</p>
                    	<p>支付金额：<span style="font-weight:bold; font-size:16px; color:#f60">￥${queryMemberOrder[0].totalPrice}</span></p>
                	</div>
                	
                	<div class="payTypeChoice">
                		<div class="jf-overflowH"><h5>支付方式：</h5><span class="cPayType" style="display: none;"></span><span class="cPayTypeA"></span></div>
	                	<div class="jf-overflowH" style="margin-bottom: 10px;">
                            <#if queryMemberOrder[0].saleOrderPrdType == '0'>
                            <#list payerForGoodsOrder as item>
                                <label class="payTypeItem payTypeItemBO">
                                    <input type="radio" name="RadioGroup1" value="${item.payer}" checked="checked" />
                                    <img src="<@spring.url '/imgsrc/'/>${item.iconFileName}" width="100" height="33" alt="${item.payerName}" />
                                </label>
                            </#list>
                            <#list payToolsForPlatEnt as item>
                                <label class="payTypeItem payTypeItemBO">
                                    <input type="radio" name="RadioGroup1" value="${item.payer}" checked="checked" />
                                    <#--<img src="<@spring.url '/imgsrc/'/>${item.iconFileName}" width="100" height="33" alt="${item.payerName}" />-->
                                <img src="<@spring.url '/imgsrc/'/>" width="100" height="33" alt="${item.payerName}" />
                                </label>
                            </#list>
                            <#else >
                                <#list payerForCardsOrder as item>
                                    <label class="payTypeItem payTypeItemBO">
                                        <input type="radio" name="RadioGroup1" value="${item.payer}" checked="checked" />
                                        <img src="<@spring.url '/imgsrc/'/>${item.iconFileName}" width="100" height="33" alt="${item.payerName}" />
                                    </label>
                                </#list>
                            </#if>
	                    </div>
                	</div>
                </div>
                
                
                <div style=" text-align:center; font-size:12px; background:#eee; width:1200px; margin:30px auto; padding:30px 0; overflow:hidden;">

                    <div style=" margin:20px auto; line-height:20px; height:80px;">
                        <div style="padding:10px; padding-top:25px; text-align:center; height:35px;  line-height:35px; color:#f60; font-size: 16px; font-weight: bold;"
                             id="orderMsg">
                        </div>

                    </div>
                </div>
                    
                <p style="text-align:center; margin:20px 0 0; float:right">
                    <input type="button" value="取消订单" id="deleteOrder" class="sureBtn" style="background: #faecec;color: #f60;border: 1px solid #f60;margin-right:10px; "  />
                    <input type="button" value="支付" id="pay" class="sureBtn"  />
                </p>
            </div>
            
    </div>
        
    <!--合作伙伴-->
    <#include "/lib/template/partner.ftl" encoding="UTF-8">
    <!--end 合作伙伴-->

    <!--底部-->
    <#include "/lib/template/footer.ftl" encoding="UTF-8">
    <!--end 底部-->

    <div id="loginBg"></div>
    <!--提示框-->
    <div class="tipDiv">
        <div class="jf-overflowH tipDivTitle"><h3 style="float:left;">提示</h3></div>
        <p style="margin-top: 55px;"><input type="button" value="订单支付成功" class="sureBtn" id="paySuccess" style="width: 120px;" />
        <input type="button" value="订单支付失败" class="sureBtn"  id="payFail" style="width: 120px; background: #eee; color: #666; border-color:#999; margin-left:10px;" /></p>
    </div>
    <!--提示框 end-->
        
</body>
<script language="javascript">
$(document).ready(function(e) {
	
	//支付方式修改
    $('.payTypeItem').click(function(){
    	$('.payTypeItem').removeClass('payTypeItemBO');
    	$(this).addClass('payTypeItemBO');
    	$(this).parent().parent().find('input').removeAttr('checked');
    	$(this).find('input').attr('checked','checked');
    	
    	var p = $(this).find('input').val();
    	var pA = $(this).find('img').attr('alt');
    	$('.cPayType').text(p);
    	$('.cPayTypeA').text(pA);    	
    })
    
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

	$("#deleteOrder").click(function(){
        window.open( "<@spring.url '/deleteOrder'/>"+"?billNo=${queryMemberOrder[0].billNo}");
    })

    $("#pay").click(function(){
        tipOpen();
        var payer = $(".cPayType").text();
        window.open( "<@spring.url '/pay'/>"+"?orderNo=${queryMemberOrder[0].billNo}&payer="+payer+"&termID=web");
    })

    function tipOpen(){
        $('#loginBg').show();
        $('.tipDiv').show();
    }
    function tipClose(){
        $('#loginBg').hide();
        $('.tipDiv').hide();
    }
    $("#paySuccess").click(function(){
        window.location.href="<@spring.url '/myOrder'/>"
        tipClose();
    })
    $("#payFail").click(function(){
        window.location.href="<@spring.url '/myOrder'/>"
        tipClose();
    })
});

    var useTime = 0;
    var billNo = "${queryMemberOrder[0].billNo}";
    var urlStr = "<@spring.url '/queryorder;billNo='/>"+billNo+";";
    var statusMsg = {
    doStatus: function (billNo) {
        if (billNo == null || billNo == "null" || billNo == "") {
            statusMsg.printText(2, "订单号无效！");
            return;
        }
        $.get(urlStr, function (data) {
            var statusStr = data.substr(data.indexOf("=") + 1);
            var status = parseInt(statusStr.split("*-*")[0]);
            var msg = statusStr.split("*-*")[1];
            if (status == 0) {
                statusMsg.printText(0);
                setTimeout(function () {
                    statusMsg.doStatus(billNo);
                }, 500);
            } else if (status == 1) {
                statusMsg.printText(1);
                <#--location.href = "<@spring.url '/buycfm;billNo='/>"+billNo;-->
            } else if (status > 1) {
                statusMsg.printText(2, msg);
            }
        }, "text");
    },
    printText: function (type, msg) {
        if (type == 0) {
            var text = "<span style='font-size:16px; color:#666;'><img src='images/loading.gif' style='vertical-align:middle; margin-right:5px;'> 正在提交订单，请稍后......</span>";
            $("#orderMsg").html(text);
            $("#pay").attr('disabled',true).addClass('gray');
        } else if (type == 1) {
            $("#orderMsg").css({
                "padding-top": "5px",
                "height": "70px"
            }).html("下单成功，请立即支付。<br/>如订单在45分钟内未支付，则会自动撤销！");
            $("#pay").attr('disabled',false).removeClass('gray');
        } else if (type == 2) {
            $("#orderMsg").css("color", "#00b050").html("分配库存失败，因为：" + msg);
            $("#pay").attr('disabled',true).addClass('gray');
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
