<#import "/spring.ftl" as spring/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>确认订单-逸乐生活网</title>
<link rel="stylesheet" type="text/css" href="<@spring.url '/css/css.css'/>"/>
<link rel="stylesheet" type="text/css" href="<@spring.url '/css/style.css'/>"/>
<link rel="stylesheet" type="text/css" href="<@spring.url '/css/model.css'/>"/>
<#--<script type="text/javascript" src="<@spring.url '/js/gd_Index.js'/>"></script>-->
<script type="text/javascript" src="<@spring.url '/js/jquery-1.7.2.min.js'/>"></script>
<script language="javascript" src="<@spring.url '/js/menu.js'/>" ></script>
<script type="text/javascript" src="<@spring.url '/js/util.js'/>"></script>
<script language="javascript" src="<@spring.url '/js/jquery.validate.min.js'/>" ></script>
<script language="javascript" src="<@spring.url '/js/jquery.validate.addMethod.js?t=20170616'/>" ></script>
<style>
.addrDiv:hover,.invoiceDiv:hover{ background: #ffefe5;}
.jf-productList{ width:323px; margin:0 10px 10px 0; background:none;}
.orderItem,.jf-cartItem,.cartBanlance{ font-size:14px;}
.orderItem div{ line-height:25px;}
.orderItemTitel{ padding:0 10px; margin: 0;}
.orderItemTitel h4{ line-height:30px;}
.orderItemTitel span{ line-height:30px;}
.addrDiv .checkbox{ margin-top:5px; *margin-top:1px; margin-right:5px; float:left;}
.addressDiv,.invDiv,.exchange,.balancePayType,.invoiceDivDiv{ z-index:102;}
.addressForm{ font-size:14px;}
.addressForm label{ width:70px;}
.width100{ width:130px;}
.orderItem .defaultDiv {  margin-left: 30px;  float: left;  line-height: 30px;  }
.defaultDiv .addrDefault,.defaultDiv .invoiceDefault{  color: #cc0000;  cursor: default;}
.invoiceDefault{ color: #cc0000; margin-left: 10px;}
.addrModifyBtn,.invoiceModifyBtn,.payTypeModifyBtn,.noInvoiceBtn{  margin-left: 30px;  }
.addrModSureBtn,.addrModCBtn ,.invoiceModSureBtn,.payTypeModSureBtn{  display: inline-block;  padding: 0 20px;  margin-top: 10px;  color: #fff;  background: #f60;  height: 30px;  line-height: 30px;  cursor: pointer;}
.addrModCBtn{ background:#eee; color: #666; margin-left: 10px; }
.bgCO,.bgCOIn {  background: #ffefe5;  }
.addForN{ font-size: 12px; margin-left: 20px;}
.addForN a{ color:#f60; text-decoration: underline;}

.payTypeItem{ padding: 5px; border: 1px solid #eee; cursor: pointer; float: left; margin-right: 10px; margin-bottom: 10px;}
.payTypeItemBO{border-color:#f60;}
.payTypeDiv h5{ padding:2px 0; color: #f60; margin-bottom: 10px; font-size: 12px;}
.payTypeDiv img{ vertical-align: middle;}
.payTypeDiv input[type=radio]{ vertical-align: middle;}

.addressDiv{ height:300px;}
.invoiceDivDiv{ height:430px; margin: -215px 0 0 -300px;}
.addressDiv div,.invoiceDivDiv div{ padding:10px; color:#666; font-size:14px;}
.addressDiv .tipDivTitle,.invoiceDivDiv .tipDivTitle{ padding:0; margin-bottom:10px;}
.addressDiv input[type=text],.invoiceDivDiv input[type=text]{ padding:0 5px;}
.addressDiv label,.invoiceDivDiv label{ width:80px; display:inline-block; text-align:right;}
.invoiceDivDiv label{ width: 130px;}
.colorRed{color:red;}

.addressErr,.invoiceErr,.payTypeErr{ height: 30px; width: 1200px; margin: 0 auto;}
.errorCon{ height: 40px; border:1px solid #f00; border-radius: 5px; background: #ffebe7; padding:0 10px; display: inline-block; float: left; width: 400px; margin:10px 0 0 440px; display: none;}
.errorCon p{ line-height: 20px; font-size: 14px; color:#f00;}
.cartShopBtn{ border-color:#f60; color: #f60; background: #faecec;}
#addRcptTitle-error,#addMobile-error,#addBillReceiverMail-error,#addTaxpayerID-error { color: #f00;position: absolute;left: 145px; top:31px;font-size: 10px;z-index: -1;text-align: left;}
#addressName-error,#addressPhone-error,#addressZip-error,#addressAddr-error { color: #f00;position: absolute;left: 95px; top:31px;font-size: 10px;z-index: -1;text-align: left;}
label.error {
    padding: 0 ; 
    border: 0; 
    background:white;
    width: auto!important;
}
.postionRelative{position: relative;}
</style>
</head>

<body>
    <!--头部-->
    <#include "/lib/template/header.ftl" encoding="UTF-8">
    <!--end 头部-->

    <div class="jf-main">
        <div class="ny_nav" style="margin-bottom: 0;">
            <div class="ny_nav1">当前位置：<a href='<@spring.url "/index"/>'>首页</a> > 确认订单</div>
            <div class="clearfix"></div>
        </div>

        <!--确认订单列表-->
        <!--收货地址-->
        <div class="addressErr"></div>
        <div class="orderItem jf-width1000 jf-overflowH">
            <div class="orderItemTitel jf-overflowH">
                <h4>收货信息</h4>
                <div class="defaultDiv jf-overflowH" id="selectDiv">
                    <#if queryMemberAddress[0]??>
                        <label class="addrName">${queryMemberAddress[0].name}</label>
                        <label class="addrPhone">${queryMemberAddress[0].phone}</label>
                        <label class="address">${queryMemberAddress[0].addr}</label>                       
                        <span class="addrDefault" style="float: none;"><#if queryMemberAddress[0].isDefault == "1">默认地址</#if></span>
                        
                        <span class="addrModifyBtn" onclick="openTipDiv('addressDiv')">添加</span>
                        <span class="addrModifyBtn" onclick="divHeightA('addrSlide')">修改</span>
                    <#else>
                    	<label class="addrName"></label>
                        <label class="addrPhone"></label>
                        <label class="address"></label>
                    	<span class="addrModifyBtn" onclick="openTipDiv('addressDiv')">添加</span>
                    </#if>
                </div>
            </div>

            <div class="jf-overflowH addrSlide" style="height:0;">
                <#list queryMemberAddress as item>
                    <div class="addrDiv jf-overflowH">
                        <label class="addrName">${item.name}</label>
                        <label class="addrPhone">${item.phone}</label>
                        <label class="address">${item.addr}</label>                       
                        <span class="addrDefault" style="float: none;"><#if item.isDefault == "1">默认地址</#if></span>
                        
                    </div>
                </#list>
                <!--<div style="margin-left: 10px;">
                    <span class="addrModSureBtn">确定</span>
                    <span class="addrModCBtn" onclick="divHeightZ('addrSlide')">取消</span>
                </div>-->
            </div>
        </div>
        <!--end收货地址-->

        <!--发票信息-->
        <div class="invoiceErr"></div>
        <div class="orderItem jf-width1000">
            <div class="orderItemTitel jf-overflowH">
                <h4>发票信息</h4>
                <span style="color:#cc0000; float:left;">(只对金额支付部分开具发票)</span>

                <div class="defaultDiv jf-overflowH">
                	
                	<#if queryMemberInvoice[0]??>
                		<#if queryMemberInvoice[0].receiptType == '1'>
							<#assign rec='个人'>
						<#else>
							<#assign rec='法人'>
						 </#if>
						                    
		            	<#if queryMemberInvoice[0].rcptContent == '0'>
							<#assign rcp='明细'>
						<#elseif queryMemberInvoice[0].rcptContent == '1'>
							<#assign rcp='办公用品'>
						<#elseif queryMemberInvoice[0].rcptContent == '2'>
							<#assign rcp='电脑配件'>
						<#elseif queryMemberInvoice[0].rcptContent == '3'>
							<#assign rcp='耗材'>
						<#elseif queryMemberInvoice[0].rcptContent == '10'>
							<#assign rcp='用品'>
						<#elseif queryMemberInvoice[0].rcptContent == '11'>
							<#assign rcp='日用品'>				                    
						<#else>
							<#assign rcp='礼品'>
						</#if>
                	<label class="invoiceTag" style="display: none;">${queryMemberInvoice[0].billTag}</label>
                    <label class="invoiceTitle">${queryMemberInvoice[0].rcptTitle}</label>
                    <label class="invoiceType">${rec}</label>
                    <label class="invoiceCon">${rcp}</label>
                    <label class="invoiceID">${queryMemberInvoice[0].taxpayerID}</label>
                    
                    <span class="invoiceDefault" style="float: none;"><#if queryMemberInvoice[0].isDefault == '1'>默认发票信息</#if></span>
                    
                    <span class="noInvoiceBtn" onclick="divHeightZ('invoiceSlide')">不开发票</span>
                    <span class="addrModifyBtn" onclick="openTipDiv('invoiceDivDiv')">添加</span>
                    <span class="invoiceModifyBtn" onclick="divHeightA('invoiceSlide')">修改</span>
                    <#else>
                     <span class="addrModifyBtn" onclick="openTipDiv('invoiceDivDiv')">添加</span>
                    </#if>
                   
                </div>
                
            </div>

            <div class="jf-overflowH invoiceSlide" style="height:0;">
            	<#list queryMemberInvoice as item>
            	
            	<#if item.receiptType == '1'>
					<#assign rec='个人'>
				<#else>
					<#assign rec='法人'>
				 </#if>
				                    
            	<#if item.rcptContent == '0'>
					<#assign rcp='明细'>
				<#elseif item.rcptContent == '1'>
					<#assign rcp='办公用品'>
				<#elseif item.rcptContent == '2'>
					<#assign rcp='电脑配件'>
				<#elseif item.rcptContent == '3'>
					<#assign rcp='耗材'>
				<#elseif item.rcptContent == '10'>
					<#assign rcp='用品'>
				<#elseif item.rcptContent == '11'>
					<#assign rcp='日用品'>				                    
				<#else>
					<#assign rcp='礼品'>
				</#if>
            		
                <div class="invoiceDiv jf-overflowH">
                	<label class="invoiceTag">${item.billTag}</label>
                    <label class="invoiceTitle">${item.rcptTitle}</label>
                    <label class="invoiceType">${rec}</label>
                    <label class="invoiceCon">${rcp}</label>
                    <label class="invoiceMobile">${item.mobile}</label>
                    <label class="invoiceMail">${item.billReceiverMail}</label>
                    <label class="invoiceID">${item.taxpayerID}</label>
                    <span class="invoiceDefault" style="float: none;"><#if item.isDefault == '1'>默认发票信息</#if></span>
                    
                </div>
                
                </#list>
                
                <!--<div style="margin-left: 10px;">
                    <span class="invoiceModSureBtn">确定</span>
                    <span class="addrModCBtn" onclick="divHeightZ('invoiceSlide')">取消</span>
                </div>-->
            </div>
        </div>
        <!--end发票信息-->

        <!--支付方式-->
        <div class="payTypeErr"></div>
        <div class="orderItem jf-width1000">
            <div class="orderItemTitel jf-overflowH">
                <h4>支付方式</h4>
                <div class="defaultDiv jf-overflowH" style="float:left;">
                	<label class="payTypeT">账户支付：</label>
                    <label class="payTypeA" style="display: none;"><!--${payToolsForPlatEnt[0].payer}--></label>
                    <#--<label class="payTypePayerName">账户余额</label>-->
                    <label class="payTypePayerName"><!--${payToolsForPlatEnt[0].payerName}--></label>
                   <!-- <span class="payTypeModifyBtn">修改</span>-->
                </div>
            </div>
            <div class="jf-overflowH payTypeSlide">
                <div class="payTypeDiv jf-overflowH" style="padding:0 10px;">
                	<div><h5>积分支付</h5></div>
                	<div class="jf-overflowH" style="margin-bottom: 10px;">
                        <#list payerForGoodsOrder as item>
                        <label class="payTypeItem">
                            <input type="radio" name="RadioGroup1" value="${item.payer}" />
                            <img src="<@spring.url '/imgsrc/'/>${item.iconFileName}"  width="100" onerror="downloadErrImg(this,'${item.iconFileName}')" height="33" alt="${item.payerName}"/>
                        </label>
                        </#list>
                    </div>
                
                    <div><h5>账户支付</h5></div>
                    <div class="jf-overflowH" style="margin-bottom: 10px;">
                    <#list payToolsForPlatEnt as item>
                        <label class="payTypeItem">
                            <input type="radio" name="RadioGroup1" value="${item.payer}" />
                            <img src="" width="100" height="33" alt="${item.payerName}"/>
                        </label>
                    </#list>
                    </div>
                </div>

                <!--<div style="margin-left: 10px;">
                    <span class="payTypeModSureBtn">确定</span>
                    <span class="addrModCBtn" onclick="divHeightZ('payTypeSlide')">取消</span>
                </div>-->
            </div>

        </div>
        <!--end支付方式-->
             
        <!--订单信息-->
        <div class="orderItem jf-width1000" style="margin-top:30px;">
            <div class="orderItemTitel jf-overflowH"><h4>订单信息</h4></div>
			<div class="jf-cart" style="padding:0 10px;">
                <ul class="jf-cartItemTitle">
                    <li class="width200" style="width:710px;">商品名称</li>
                    <li class="width100">所需积分</li>
                    <li class="width100">商品数量</li>
                    <li class="width100">小计</li>
                </ul>
                    
                <#list buyerItemList as item>
                	<div class="jf-cartItem">                    
                        <div class="width200 cartItemTitle" style="width:710px;">
                            <a href="<@spring.url '/proshow;prdNo=${item.prdNo};keyWordsFld=${item.prdNo};'/>"><img src="<@spring.url '/imgsrc/${item.fileName}'/>" width="80" height="50" onerror="downloadErrImg(this,'${item.fileName}')" /></a>
                            <a href="<@spring.url '/proshow;prdNo=${item.prdNo};keyWordsFld=${item.prdNo};'/>" style="width:585px; margin-left:10px;">${item.prdName}</a>
                        </div>

                        <div class="width100 jf-exchange" style="line-height:40px;">${item.money}分</div>

                        <div class="width100" style="line-height:40px; ">${item.amount}</div>

                        <div class="width100">
                            <p><span class="exchangeCount" style=" line-height:40px;">${item.money * item.amount}</span>分</p>
                        </div>                    
                	</div>
                </#list>
                <div class="cartBanlance">
                    <div class="bgGrey">
                        <p style="line-height:50px; margin-right:20px;">共<span id="shuliang">${integer}</span><span style="margin-right:20px;">件</span>合计:<span id="exchangeTotal">${double}</span>分</p>
                    </div>
                </div>

            </div>
        </div>
        <!--end订单信息-->
             
        <#--<p class="jf-overflowH jf-width1000"><input type="button" value="确定下单"  class="btnBgS cartExBtn" style="margin:10px 10px 30px 0;" onclick="window.location='<@spring.url "/buycfm"/>'" /></p>-->
        <div class="jf-overflowH jf-width1000">
        	<input type="button" value="返回上一页"  class="btnBgS cartShopBtn"  onclick="window.location='<@spring.url "/shoppingCart"/>'" style="margin-left: 10px;" />
        	<div class="errorCon">
        		<p id="errorConAddr"></p>
        		<p id="errorConPay"></p>
        	</div>
        	<input type="button" value="确定下单"  class="btnBgS cartExBtn" style="margin:10px 10px 30px 0;" id="go" />
        </div>

        <!--确认订单列表 end-->
            
    </div>
        
    <!--合作伙伴-->
    <#--<#include "/lib/template/partner.ftl" encoding="UTF-8">-->
    <!--end 合作伙伴-->

    <!--底部-->
    <#include "/lib/template/footer.ftl" encoding="UTF-8">
    <!--end 底部-->
    
    <div id="loginBg"></div>
    <!--新增地址-->
    <div class="addressDiv">
        <form action="<@spring.url '/addAddr'/>" method="post" id="addressForm">
        <div class="jf-overflowH tipDivTitle"><h3 style="float:left;">收货地址</h3><span onclick="closeTipDiv('addressDiv')" style="float:right; cursor:pointer; color:#999;font-size:25px;">×</span></div>
        <div class="postionRelative"><label><span class="colorRed">*</span> 收货人：</label><input type="text" id="addressName" name="receiverName" value="" /></div>
        <div class="postionRelative"><label><span class="colorRed">*</span> 手机号码：</label><input type="text" id="addressPhone" name="phone" value="" /></div>
        <div class="postionRelative"><label><span class="colorRed">*</span> 邮政编号：</label><input type="text" id="addressZip" name="zipCode" value="" /></div>
        <div class="postionRelative">
        	<label><span class="colorRed">*</span> 收货地址：</label><input type="text" id="addressAddr" name="addr" value="" style="width:477px;" />
        </div>
        <p style="margin:10px 0 0 90px;"><input type="hidden" id="operType" name="operType" value="0"/><input type="hidden" id="" name="" value=""/><input type="submit" value="保存" class="sureBtn"/><input type="button" value="取消" class="cancleBtn"  onclick="closeTipDiv('addressDiv')" /></p>
            <input type="hidden" name="isDefault" value="0"/>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="hidden" name="forword" value="confirmOrder;termID=web"/>
            <input type="hidden" name="objectID" id="objectID" value=""/>       
        </form>
    </div>
    <!--新增地址 end-->
    <!--新增发票-->
    <div class="invoiceDivDiv">
        <form method="post" action="<@spring.url '/addInvoice'/>" id="invoiceForm">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>    
        <div class="jf-overflowH tipDivTitle"><h3 style="float:left;">发票信息</h3><span onclick="closeTipDiv('invoiceDivDiv')" style="float:right; cursor:pointer; color:#999;font-size:25px;">×</span></div>
        <div>
        	<label><span class="colorRed"></span>发票标签：</label>
        	<input type="text" id="addBillTag" name="billTag" value="" style="width:427px;" />
        </div>
        <div class="postionRelative">
        	<label><span class="colorRed"></span>发票抬头：</label>
        	<input type="text" id="addRcptTitle" name="rcptTitle" value="" style="width:427px;" />
        </div>
        <div>
        	<label><span class="colorRed"></span>发票类型：</label>
        	<select id="addReceiptType" name="receiptType">
                  <option value="1">个人</option>
                  <option value="2">法人</option>
			</select>
        </div>
        <div>
        	<label><span class="colorRed"></span>发票内容：</label>
        	<select id="addRcptContent" name="rcptContent" >
				<option value="0">明细</option>
                <option value="1">办公用品</option>
                <option value="2">电脑配件</option>
                <option value="3">耗材</option>
                <option value="10">用品</option>
                <option value="11">日用品</option>
                <option value="12">礼品</option>
			</select>
        </div>
        <div class="postionRelative">
        	<label><span class="colorRed"></span> 收票人手机：</label>
        	<input type="text" id="addMobile" name="mobile" value="" maxlength="11"/>
        </div>
        <div class="postionRelative">
        	<label><span class="colorRed"></span>收票人邮箱：</label>
        	<input type="text" id="addBillReceiverMail" name="billReceiverMail" value="" />
        </div>
        <div class="postionRelative">
        	<label><span class="colorRed"></span> 公司纳税人识别号：</label>
        	<input type="text" id="addTaxpayerID" name="taxpayerID" value="" />
        </div>
        <p style="margin:10px 0 0 140px;"><input type="hidden" id="operType" name="operType" value="0"/><input type="hidden" id="" name="" value=""/><input type="submit" value="保存" class="sureBtn"  /><input type="button" value="取消" class="cancleBtn"  onclick="closeTipDiv('invoiceDivDiv')" /></p>
        	<input type="hidden" name="isDefault" value="0"/>
            <input type="hidden" name="objectID" id="objectID" value=""/>
            <input type="hidden" name="forword" id="forword" value="confirmOrder"/>
        </form>
    </div>
    <!--新增发票 end-->
    
<form action="<@spring.url '/buycfm'/>" method="post" id="formGo">
    <input name="addr" type="hidden"/>
    <input name="receiverName" type="hidden"/>
    <input name="mobile" type="hidden"/>
    <input name="payToolIDList" type="hidden"/>
    <input name="OrderType" value="0" type="hidden"/>
    <input name="billTag" type="hidden"/>
    <input name="_csrf" value="${_csrf.token}" type="hidden"/>
</form>

</body>

<script language="javascript">
//新增收货地址验证
$().ready(function () {
        // 在键盘按下并释放及提交后验证提交表单
        $("#addressForm").validate({
            rules: {
                receiverName: {
                    required: true,
                },
                
                phone: {
                    required: true,
                    isPhone1: []
                },
                zipCode: {  
                	required: true,					
                },
                addr: {
                    required: true,
                },
            },
            messages: {
                receiverName: {
                    required: "请输入收货人",
                },
                
                phone: {
                    required: "请输入手机号码",
					isPhone1: "请输入正确的手机号码"
                },
                zipCode: {
                	required: "请输入邮政编码",
                },
                addr: {
                    required: "请输入收货地址",
                },
            }
        });
	$.validator.addMethod("isPhone1", function (value, element) {
	        var phone = $("#addressPhone").val();// 手机号码
	        var phoneRule = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0-9]|170)\d{8}$/;
	        // 手机号码错误
	        if (!phoneRule.test(phone))
	        	
	            return false;
	        return true;
	    }, "ignore");
	   
});

//新增发票信息验证	
$().ready(function () {
        // 在键盘按下并释放及提交后验证提交表单
        $("#invoiceForm").validate({
            rules: {
                rcptTitle: {
                    required: true,
                },
                
                mobile: {
                    required: true,
                    isPhone: []
                },
                billReceiverMail: {  
                	required: true,
					email:true,
                },
                taxpayerID: {
                    required: true,
                },
            },
            messages: {
                rcptTitle: {
                    required: "请输入发票抬头",
                },
                
                mobile: {
                    required: "请输入手机号码",
					isPhone: "请输入正确的手机号码"
                },
                billReceiverMail: {
                	required: "请输入邮箱",
                	email:"请输入正确格式的邮箱",
                },
                taxpayerID: {
                    required: "请输入纳税人识别号",
                },
            }
        });
	$.validator.addMethod("isPhone", function (value, element) {
	        var phone = $("#addMobile").val();// 手机号码
	        var phoneRule = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0-9]|170)\d{8}$/;
	
	        // 手机号码错误
	        if (!phoneRule.test(phone))
	        	
	            return false;
	        return true;
	    }, "ignore");
    $('.sureBtn').click(function(){   	
    	var biaoqian = $('#addBillTag').val();
    	var taitou = $('#addRcptTitle').val();
    	var shouji = $('#addMobile').val();
    	var youxiang = $('#addBillReceiverMail').val();
    	var shibiehao = $('#addTaxpayerID').val();
    	if(taitou!='' && shouji!='' && youxiang!='' && shibiehao!='' && biaoqian==''){
    	$('#addBillTag').val('我的发票');   		
    	}    	
    });
});

$(document).ready(function(e) {
	//新增地址
    $('.newAddress').click(function(){
        $('#addressName').val('');
        $('#addressZip').val('');
        $('#addressAddr').val('');
        $('#addressPhone').val('');
        $('#operType').val("0"); 
    });
    
    //地址修改
    $(".addrDiv").click(function () {
        $(".addrDiv").removeClass("bgCO");
        $(this).addClass("bgCO");
    });
    $(".addrDiv").click(function () {
        var name = $(".bgCO .addrName").text();
        var phoneNum = $(".bgCO .addrPhone").text();
        var addr = $(".bgCO .address").text();
        var def = $(".bgCO .addrDefault").text();
        $(".addrSlide").animate({height: 0});
        if(name != "" || phoneNum != "" || addr != "") {
            $(".defaultDiv .addrName").text(name);
            $(".defaultDiv .addrPhone").text(phoneNum);
            $(".defaultDiv .address").text(addr);
            $(".defaultDiv .addrDefault").text(def);
        }
    	if(name != '' && phoneNum != '' && addr != ''){
    		$('#errorConAddr').text('');
        	if($('#errorConPay').text() == ""){$('.errorCon').css('display','none');}
    	}
    });
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
        var billTag = $(".defaultDiv .invoiceTag").html();
        $("input[name='billTag']").val(billTag);
        
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

    //发票修改
    $(".invoiceDiv").click(function () {
        $(".invoiceDiv").removeClass("bgCOIn");
        $(this).addClass("bgCOIn");
    });
    $(".invoiceDiv").click(function () {
        var title = $(".bgCOIn .invoiceTitle").text();
        var type = $(".bgCOIn .invoiceType").text();
        var con = $(".bgCOIn .invoiceCon").text();
        var def = $(".bgCOIn .invoiceDefault").text();
        var iId = $(".bgCOIn .invoiceID").text();
        var tag = $(".bgCOIn .invoiceTag").text();
        $(".invoiceSlide").animate({height: 0});
        if(type != "" || comp != "" || txt != "") {
            $(".defaultDiv .invoiceTitle").text(title);
            $(".defaultDiv .invoiceType").text(type);
            $(".defaultDiv .invoiceCon").text(con);
            $(".defaultDiv .invoiceDefault").text(def);
            $(".defaultDiv .invoiceID").text(iId);
            $(".defaultDiv .invoiceTag").text(tag);
        }
    });
    
    //不开发票
    $('.noInvoiceBtn').click(function(){
    	$(".defaultDiv .invoiceTitle").text('');
        $(".defaultDiv .invoiceType").text('');
        $(".defaultDiv .invoiceCon").text('');
        $(".defaultDiv .invoiceDefault").text('');
        $(".defaultDiv .invoiceID").text('');
        $(".defaultDiv .invoiceTag").text('');
    })
    
    //支付方式修改
    $('.payTypeModifyBtn').click(function(){
    	var h = $('.payTypeDiv').height() + 50;
    	$(".payTypeSlide").animate({height: h + "px"});
    	
    });
    $('.payTypeItem').click(function(){
    	$('.payTypeItem').removeClass('payTypeItemBO');
    	$(this).addClass('payTypeItemBO');
    	$(this).parent().parent().find('input').removeAttr('checked');
    	$(this).find('input').attr('checked','checked');
    });
    $('.payTypeItem').click(function(){
    	var pay = $('.payTypeDiv').find('input:checked').val();
    	var type = $('.payTypeDiv').find('input:checked').parent().parent().prev().find('h5').text();
    	var payerName = $('.payTypeDiv').find('input:checked').next('img').attr('alt');
    	$('.payTypeT').text(type + '：');
    	$('.payTypeA').text(pay);
    	$('.payTypePayerName').text(payerName);
    	divHeightZ('payTypeSlide');
    	if(pay != ''){
    		$('#errorConPay').text('');
    		if($('#errorConAddr').text() == ""){$('.errorCon').css('display','none');}
    	}
    });
        
})
//function divHeightZ(obj) {
//  $("." + obj).animate({height: 0});
//}
function divHeightA(obj) {
    var h = $("." + obj + " div").length * 40;
    $("." + obj).animate({height: h + "px"});
}
function openTipDiv(obj,txt) {
    $("#loginBg").css("display","block");
    $("." + obj).css("display","block");
    $('.tipShow').text(txt);
}
function closeTipDiv(obj) {
    $("#loginBg").css("display","none");
    $("." + obj).css("display","none");
}
</script>

</html>
