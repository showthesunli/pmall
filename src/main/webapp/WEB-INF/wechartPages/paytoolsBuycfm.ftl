<#import "/spring.ftl" as spring/>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<meta name="format-detection" content="telephone=no" />
<meta name="keywords" content="途皓（北京）商务服务有限公司" />
<meta name="description" content="途皓（北京）商务服务有限公司" />
<title>微商城订单支付-逸乐生活网</title>
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/style.css'/>">
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/buttons.css'/>">
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/font-awesome.min.css'/>">
<script type="text/javascript" src="<@spring.url '/wechart/js/jquery-1.10.2.min.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/wechart/js/jquery.accordion.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/wechart/js/unslider.min.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/wechart/js/jquery.validate.min.js'/>" ></script>
<script language="javascript" src="<@spring.url '/wechart/js/jquery.validate.addMethod.js'/>" ></script>
<style>
.cencleOBtn{ width: 45%; padding: 0; float: left; background:#ccc; color: #666; border-color:#999;text-shadow: none;}
#loginBg{ width:100%; height:100%; top:0px; left:0px; filter: Alpha(opacity=50); opacity:0.5; background:#000000; display:none; position: fixed;}
.tipDiv{ background:#fff; border:1px solid #ccc; border-radius:5px; width:200px; height:164px; padding:0 10px 30px; line-height:25px; display:none; left:50%; top:50%; margin:-82px 0 0 -100px; display:none; position: fixed; z-index:100;}
.tipDivTitle{ border-bottom:1px solid #ccc; font-size:16px; font-weight:bold; line-height:40px; overflow: hidden;}
.tipDivTitle h3{ text-indent:10px;}
.tipDiv p{ margin-top:20px; text-align:center;}
.sureBtn,.cancleBtn{ width:100%%; height:40px; border:1px solid #ea6870; border-radius:3px; background:#ea6870; text-align:center; line-height:40px; color:#fff; cursor:pointer;}
.cancleBtn{background: #eee; color: #666; border-color:#999; margin-top:10px;}
.payTypeItem{ padding: 3px; border: 1px solid #eee; display: inline-block; margin:0 10px 10px 0;}
.payTypeItemBO{border-color:#f60;}
.payTypeItem input[type=radio],.payTypeItem img{ vertical-align: middle;}
.gray{-webkit-filter: grayscale(100%); -moz-filter: grayscale(100%); -ms-filter: grayscale(100%); -o-filter: grayscale(100%); filter: grayscale(100%); filter: gray;cursor:not-allowed;
}
</style>
</head>

<body ondragstart="return false;" onselectstart="return false;" oncontextmenu="return false" onselectstart="return false" ondragstart="return false" onbeforecopy="return false"> 
<div id="page">
	<div class="banners">
		<a href="javascript:history.go(-1);"><img src="<@spring.url '/wechart/images/bg_info7.jpg'/>"></a>
	</div>
	<div id="content">
		

		<div class="box_exp info_light">
			<div class="info_integral">
				<span class="title"><i class="icon-bookmark-empty"></i>订单信息</span>
			</div>
			<div style="display: block; overflow: hidden; opacity: 1;">											
				<div class="info_child addrDefaultDiv" id="selectDiv">
					<p>订单号码：${queryMemberOrder[0].billNo}</p>
					<p>订单产品：</p>
					<p>下单时间：${queryMemberOrder[0].saleDateTime}</p>
                    <p>订单状态：${queryMemberOrder[0].orderStatus}</p>
                    <p>支付金额：<span style="font-weight:bold; font-size:16px; color:#f60">￥${queryMemberOrder[0].totalPrice}</span></p>
                    <p>支付方式：<span class="cPayType" style="display: none;"></span><span class="cPayTypeA"></span></p>
                	<div>
						<#if queryMemberOrder[0].saleOrderPrdType == '0'>
                        <#list payerForGoodsOrder as item>
                            	
			            <label class="payTypeItem">
							<input type="radio" name="RadioGroup1" value="${item.payer}" />
							<img src="<@spring.url '/imgsrc/'/>${item.iconFileName}" onerror="downloadErrImg(this,'${item.iconFileName}')" width="100" height="33" alt="${item.payerName}"/>
						</label>
			                        
						</#list>
						
						<#list payToolsForPlatEnt as item>
                            	
			            <label class="payTypeItem">
							<input type="radio" name="RadioGroup1" value="${item.payer}" />
							<img src="<@spring.url '/imgsrc/'/>" onerror="" width="100" height="33" alt="${item.payerName}"/>
						</label>
			                        
						</#list>
                        
                        <#else >
                        <#list payerForCardsOrder as item>
                            	
                        <label class="payTypeItem">
							<input type="radio" name="RadioGroup1" value="${item.payer}" />
							<img src="<@spring.url '/imgsrc/'/>${item.iconFileName}" onerror="downloadErrImg(this,'${item.iconFileName}')" width="100" height="33" alt="$${item.payerName}"/>
						</label>
                            	
                        </#list>
                        </#if>
                            
						</div>
				</div>				
										
			</div>
			
			<div style="display: block; overflow: hidden; opacity: 1;">											
				<div class="info_child addrDefaultDiv" id="selectDiv">
					<p id="orderMsg" style="color: #f60;"></p>
				</div>				
										
			</div>
			
		</div>

		
		<div style="margin:8px 0 60px;">
			<a href="javascript:void(0);" class="button button-block button-rounded button-caution button-large cencleOBtn">取消订单</a>
			<a href="javascript:void(0);" class="button button-block button-rounded button-caution button-large" style="width: 45%; padding: 0; float: right;" id="pay">支&nbsp;&nbsp;付</a>
		</div>
		
		
		<div style="padding:15px;"></div>
	</div>
	
	<!--底部-->
	<#include "/lib/template/footer.ftl" encoding="UTF-8">
	<!--end 底部-->
	
	<div id="loginBg"></div>
    <!--提示框-->
    <div class="tipDiv">
        <div class="tipDivTitle"><h3 style="float:left;">提示</h3></div>
        <p>
        	<input type="button" value="订单支付成功" class="sureBtn" id="paySuccess" />
			<input type="button" value="订单支付失败" class="cancleBtn"  id="payFail" />
        </p>
    </div>
    <!--提示框 end-->
	
</div>


<script>
$(document).ready(function() {
	$("#content").accordion({
		alwaysOpen: false,
		autoheight: false,
		header: '.info_integral',
		clearStyle: true
	});
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
    });
    
	$("#pay").click(function(){
        //tipOpen();
        var payer = $(".cPayType").text();
        <#--window.open( "<@spring.url '/pay'/>"+"?orderNo=${queryMemberOrder[0].billNo}&payer="+payer+"&termID=wechat");-->
        window.location.href= "<@spring.url '/pay'/>"+"?orderNo=${queryMemberOrder[0].billNo}&payer="+payer+"&termID=wechat";
   });
   $("#paySuccess").click(function(){
        window.location.href="<@spring.url '/myOrder'/>"
        tipClose();
    })
    $("#payFail").click(function(){
        window.location.href="<@spring.url '/myOrder'/>"
        tipClose();
    })
});
	function tipOpen(){
        $('#loginBg').show();
        $('.tipDiv').show();
    }
    function tipClose(){
        $('#loginBg').hide();
        $('.tipDiv').hide();
    }
    
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
            $("#orderMsg").css("color", "#00b050").html("分配票券失败，因为：" + msg);
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
statusMsg.initStatus("${queryMemberOrder[0].billNo}");
</script>

</body>
</html>