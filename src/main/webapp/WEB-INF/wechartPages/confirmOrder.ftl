<#import "/spring.ftl" as spring/>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<meta name="format-detection" content="telephone=no" />
<meta name="keywords" content="微信,微信公众平台" />
<meta name="description" content="微信公众平台自助引擎" />
<title>微商城确认订单-逸乐生活网</title>
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/style.css'/>">
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/buttons.css'/>">
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/font-awesome.min.css'/>">
<script type="text/javascript" src="<@spring.url '/wechart/js/jquery-1.10.2.min.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/wechart/js/jquery.accordion.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/wechart/js/unslider.min.js'/>"></script>
<style>
.modifyBtn,.addBtn,.sureBtn,.cancBtn{ padding: 0 10px; height: 1.75em; background: #fff; color: #3897d7; border: 1px solid #3897d7; border-radius: 5px;}
.cancBtn{ color:#666; border-color:#666;}
.addBtn{ color: #f60; border: 1px solid #f60; margin-left: 20px;}
.info_child{ color: #333;}
.proInforTxt{width: 70%; margin-left: 10px; height: 20px; line-height: 20px; text-overflow:ellipsis; white-space: nowrap; overflow: hidden; display: inline-block; float: left;}
.payTypeItem{ display: inline-block; margin-bottom: 10px;}
.payTypeItem input[type=radio],.payTypeItem img{ vertical-align: middle;}
.addrDefault,.invoiceDefault{ color: #f60;}
.addrPhone{ margin: 0 5px;}
.invoiceType{ margin-right: 5px;}
.info_child_list,.info_child_list1{ border: 1px solid #ccc; padding: 0 10px; margin-top: 0; margin-bottom: 10px;}
.borderCO{ border-color:#f60;}
.errorCon{ color: #f00;}
</style>
</head>

<body ondragstart="return false;" onselectstart="return false;" oncontextmenu="return false" onselectstart="return false" 
ondragstart="return false" onbeforecopy="return false" oncopy=document.selection.empty() onselect=document.selection.empty()> 
<div id="page">
	<div class="banners">
		<a href="javascript:history.go(-1);"><img src="<@spring.url '/wechart/images/bg_info7.jpg'/>"></a>
	</div>
	<div id="content">
		
		<!--收货人信息-->
		<div class="box_exp info_light">
			<div class="info_integral">
				<span class="title"><i class="icon-bookmark-empty"></i>收货人信息</span>
			</div>
			<div style="display: block; overflow: hidden; opacity: 1;">
					
				<#if queryMemberAddress[0]??>
						
				<div class="info_child addrDefaultDiv" id="selectDiv">
					<p>
						<span class="addrName">${queryMemberAddress[0].name}</span>
						<span class="addrPhone">${queryMemberAddress[0].phone}</span>						
						<span class="addrDefault">默认地址</span>
						
					</p>
					<p><span class="address">${queryMemberAddress[0].addr}</span></p>
				</div>				
					
				<#else>
					
				<div class="info_child addrDefaultDiv">
					<p>
						<span class="addrName"></span>
						<span class="addrPhone"></span>
						<span class="addrDefault"></span>
					</p>
					<p><span class="address"></span></p>
				</div>
				
				</#if>
				
				<div class="addressList" style="height: 0; overflow: hidden;">
					<div class="addressListGetH" style="overflow: hidden;">
				
					<#list queryMemberAddress as item>
						
					<div class="info_child info_child_list">
						<p>
							<span class="addrName">${item.name}</span>
							<span class="addrPhone">${item.phone}</span>
							<span class="addrDefault"><#if item.isDefault == "1" >默认地址</#if></span>
						</p>
						<p><span class="address">${item.addr}</span></p>
					</div>
					
					</#list>
					</div>
				
				</div>
				
				<div class="info_child_txt" style="text-align: center;">
					<#if queryMemberAddress[0]??><input type="button" value="修 改" class="modifyBtn" onclick="openDiv('addressList','addressListGetH')"/></#if>
					<input type="button" value="确 定" class="sureBtn" style="display: none;" onclick="changeAddress()" />
					<input type="button" value="取 消" class="cancBtn" style="display: none;  margin-left: 20px;" onclick="closeDiv('addressList')" />
					<input type="button" value="添 加" class="addBtn" />
				</div>
						
			</div>
		</div>
		<!--end 收货人信息-->
		
		<!--发票信息-->
		<div class="box_exp info_light">
			<div class="info_integral">
				<span class="title"><i class="icon-bookmark-empty"></i>发票信息</span>
			</div>
			<div style="display: block; overflow: hidden; opacity: 1;">
				<div class="info_child invoiceDefaultDiv" >
					<a href="javascript:void(0);">
						<p>
							<span class="invoiceType">普通发票（纸质）</span>
							<span class="invoiceDefault">默认发票信息</span>
						</p>
						<p>
							<span class="invoiceComp">广州睿颢软件技术有限公司1</span>
						</p>
						<p>
							<span class="invoiceTxt">明细1</span>
						</p>
					</a>
				</div>
				
				<div class="invoiceList" style="height: 0; overflow: hidden;">
					<div class="invoiceListGetH" style="overflow: hidden;">
					<div class="info_child info_child_list1">
						<p>
							<span class="invoiceType">普通发票（纸质）</span>
							<span class="invoiceDefault">默认发票信息</span>
						</p>
						<p>
							<span class="invoiceComp">广州睿颢软件技术有限公司1</span>
						</p>
						<p>
							<span class="invoiceTxt">明细1</span>
						</p>
					</div>
					<div class="info_child info_child_list1">
						<p>
							<span class="invoiceType">普通发票（纸质）</span>
							<span class="invoiceDefault"></span>
						</p>
						<p>
							<span class="invoiceComp">广州睿颢软件技术有限公司2</span>
						</p>
						<p>
							<span class="invoiceTxt">明细2</span>
						</p>
					</div>
					</div>
				
				</div>
					
				<div class="info_child_txt" style="text-align: center;">
					<input type="button" value="修 改" class="modifyBtn" onclick="openDiv('invoiceList','invoiceListGetH')"/>
					<input type="button" value="确 定" class="sureBtn" style="display: none;" onclick="changeInvoice()" />
					<input type="button" value="取 消" class="cancBtn" style="display: none;  margin-left: 20px;" onclick="closeDiv('invoiceList')" />
					<input type="button" value="添 加" class="addBtn" />
					<p style="color: #f00;">(只对金额支付部分开具发票)</p>
				</div>
			</div>
		</div>		
		<!--end 发票信息-->
		
		<!--支付方式-->
		<div class="box_exp info_light">
			<div class="info_integral">
				<span class="title"><i class="icon-bookmark-empty"></i>支付方式</span>
			</div>
			<div style="display: block; overflow: hidden; opacity: 1;">
				<div class="info_child">
					<p>积分支付：
						<span class="payTypeT" style="color: #f60;"></span>
						<span class="payTypeA" style=" display: none;"></span>
					</p>
				</div>
				
				<div class="payTypeDivHF" style=" height: 0; overflow: hidden;">
					<div class="payTypeDivH">
						<#list payerForGoodsOrder as item>
		                
		                <label class="payTypeItem">
							<input type="radio" name="RadioGroup1" value="${item.payer}" />
							<img src="<@spring.url '/imgsrc/'/>${item.iconFileName}" width="100" height="33" alt="${item.payerName}"/>
						</label>
		                        
						</#list>
					</div>
				</div>
				
				<div class="info_child_txt" style="text-align: center;">
					<input type="button" value="修 改" class="modifyBtn" onclick="openDiv('payTypeDivHF','payTypeDivH')" />
					<input type="button" value="确 定" class="sureBtn" style="display: none;" onclick="changePayType()" />
					<input type="button" value="取 消" class="cancBtn" style="display: none;" onclick="closeDiv('payTypeDivHF')" />
				</div>
			</div>
		</div>
		<!--end 支付方式-->
		
		<!--订单信息-->
		<div class="box_exp info_light">
			<div class="info_integral">
				<span class="title"><i class="icon-bookmark-empty"></i>订单信息</span>
			</div>
			<div style="display: block; overflow: hidden; opacity: 1;">
				<div class="info_child">
					
					<#list buyerItemList as item>
						
					<a href="<@spring.url '/proshow;prdNo=${item.prdNo};keyWordsFld=${item.prdNo};'/>" style=" padding-top: 10px; display: inline-block; width: 100%;">
                    	<img src="<@spring.url '/imgsrc/${item.fileName}'/>" onerror="downloadErrImg(this,'${item.fileName}')" style="width: 50px; height: 40px; float: left;" />
                    	<span class="proInforTxt">${item.prdName}</span>
                    	<span class="proInforTxt" style="color: #f60; font-size: 12px;">数量：${item.amount}<b style="width: 20px; display: inline-block;"></b>金额：￥${item.money}</span>
                    </a>
                    
                    </#list>
                    
				</div>
				<div class="info_child_txt">
					<a href="cart.html" class="left">请在24小时内完成支付,过时订单将被取消！</a>
				</div>
			</div>
		</div>
		<!--end 订单信息-->
		
		<!--总计-->
		<div class="box_exp info_light">
			<div class="info_integral">
				<span class="titles"><i class="icon-bookmark-empty"></i>总计 - ￥${double}元</span>
			</div>
		</div>
		<!--end 总计-->
		
		
		<div class="errorCon">
        	<p id="errorConAddr"></p>
        	<p id="errorConPay"></p>
        </div>
		
		<div style="margin:8px 0;"><a href="javascript:void(0);" class="button button-block button-rounded button-caution button-large" id="go"><i class="icon-shopping-cart"></i>&nbsp;&nbsp;确定下单</a></div>
		
		
		<div style="padding:15px;"></div>
	</div>
	
	<!--底部-->
	<#include "/lib/template/footer.ftl" encoding="UTF-8">
	<!--end 底部-->
	
</div>
<form action="<@spring.url '/buycfm'/>" method="post" id="formGo">
    <input name="addr" type="hidden"/>
    <input name="receiverName" type="hidden"/>
    <input name="mobile" type="hidden"/>
    <input name="payToolIDList" type="hidden"/>
    <input name="OrderType" value="0" type="hidden"/>
    <input name="_csrf" value="${_csrf.token}" type="hidden"/>
</form>

<script>
$(document).ready(function() {
	$("#content").accordion({
		alwaysOpen: false,
		autoheight: false,
		header: '.info_integral',
		clearStyle: true
	});
	
	$('.info_child_list').eq(0).addClass('borderCO');
	$('.info_child_list').click(function(){
		$('.info_child_list').removeClass('borderCO');
		$(this).addClass('borderCO');
	});
	
	$('.info_child_list1').eq(0).addClass('borderCO');
	$('.info_child_list1').click(function(){
		$('.info_child_list1').removeClass('borderCO');
		$(this).addClass('borderCO');
	})
	
	//点击下单按钮
    $("#go").click(function(){
        var action="<@spring.url '/buycfm'/>";
        var receiverName = $("#selectDiv").find(".addrName").html();
        $("input[name='receiverName']").val(receiverName)
        var addr = $("#selectDiv").find(".address").html();
        $("input[name='addr']").val(addr)
        var mobile = $("#selectDiv").find(".addrPhone").html();
        $("input[name='mobile']").val(mobile)
//        var payToolIDList = "东方航空-积分支付";
        var payToolIDList = $(".payTypeA").text();
        $("input[name='payToolIDList']").val(payToolIDList);
              
        if(receiverName == '' || addr == '' || mobile == ''){
        	$('.errorCon').css('display','block');
        	$('#errorConAddr').text('请填写收货人、联系电话和收货地址。');
        }
        if(payToolIDList == ''){
        	$('.errorCon').css('display','block');
        	$('#errorConPay').text('请选择支付方式。');
        }
        if(receiverName != '' && addr != '' && mobile != '' && payToolIDList != ''){
        	$('.errorCon').css('display','none');
        	$("#formGo").submit();
        }
    })
});

function openDiv(obj,h){
	var divH = $('.' + h).height();
	$('.' + obj).next('.info_child_txt').find('.modifyBtn').hide();
	$('.' + obj).next('.info_child_txt').find('.sureBtn').show();
	$('.' + obj).next('.info_child_txt').find('.cancBtn').show();
	$('.' + obj).animate({height: divH + "px"});
}
function closeDiv(obj){
	$('.' + obj).next('.info_child_txt').find('.modifyBtn').show();
	$('.' + obj).next('.info_child_txt').find('.sureBtn').hide();
	$('.' + obj).next('.info_child_txt').find('.cancBtn').hide();
	$('.' + obj).animate({height: 0});
}

//修改地址
function changeAddress(){
	var name = $(".borderCO .addrName").text();
    var phoneNum = $(".borderCO .addrPhone").text();
    var addr = $(".borderCO .address").text();
    var def = $(".borderCO .addrDefault").text();
    
    closeDiv('addressList');
    
    if(name != "" || phoneNum != "" || addr != "") {
		$(".addrDefaultDiv .addrName").text(name);
	    $(".addrDefaultDiv .addrPhone").text(phoneNum);
	    $(".addrDefaultDiv .address").text(addr);
	    $(".addrDefaultDiv .addrDefault").text(def);
    }
    if(name != '' && phoneNum != '' && addr != ''){
    	$('#errorConAddr').text('');
        if($('#errorConPay').text() == ""){$('.errorCon').css('display','none');}
    }
}
//修改发票
function changeInvoice(){
	var type = $(".borderCO .invoiceType").text();
    var comp = $(".borderCO .invoiceComp").text();
    var txt = $(".borderCO .invoiceTxt").text();
    var def = $(".borderCO .invoiceDefault").text();
    
    closeDiv('invoiceList');
    
    if(type != "" || comp != "" || txt != "") {
	    $(".invoiceDefaultDiv .invoiceType").text(type);
	    $(".invoiceDefaultDiv .invoiceComp").text(comp);
	    $(".invoiceDefaultDiv .invoiceTxt").text(txt);
	    $(".invoiceDefaultDiv .invoiceDefault").text(def);
    }   
}
//修改支付方式
function changePayType(){
	var pay = $('.payTypeDivHF').find('input:checked').val();
    var payerName = $('.payTypeDivHF').find('input:checked').next('img').attr('alt');
    
    closeDiv('payTypeDivHF');
    $('.payTypeDivHF').prev('.info_child').find('span').text(payerName);
	$('.payTypeA').text(pay);
	
    if(pay != ''){
	    
	    $('#errorConPay').text('');
    	if($('#errorConAddr').text() == ""){$('.errorCon').css('display','none');}
    }
    
}
</script>

</body>
</html>