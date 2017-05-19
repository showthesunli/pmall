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
.defaultDiv .addrDefault {  color: #cc0000;  cursor: default;  }
.addrModifyBtn,.invoiceModifyBtn,.payTypeModifyBtn{  margin-left: 30px;  }
.addrModSureBtn,.addrModCBtn ,.invoiceModSureBtn,.payTypeModSureBtn{  display: inline-block;  padding: 0 20px;  margin-top: 10px;  color: #fff;  background: #f60;  height: 30px;  line-height: 30px;  cursor: pointer;}
.addrModCBtn{ background:#eee; color: #666; margin-left: 10px; }
.bgCO,.bgCOIn {  background: #ffefe5;  }
.addForN{ font-size: 12px; margin-left: 20px;}
.addForN a{ color:#f60; text-decoration: underline;}

.payTypeItem{ padding: 5px; border: 1px solid #eee; cursor: pointer; float: left; margin-right: 10px;}
.payTypeItemBO{border-color:#f60;}
.payTypeDiv h5{ padding:2px 0; color: #f60; margin-bottom: 10px; font-size: 12px;}
.payTypeDiv img{ vertical-align: middle;}
.payTypeDiv input[type=radio]{ vertical-align: middle;}

.addressDiv{ height:300px;}
.invoiceDivDiv{ height:200px;}
.addressDiv div,.invoiceDivDiv div{ padding:10px; color:#666; font-size:14px;}
.addressDiv .tipDivTitle,.invoiceDivDiv .tipDivTitle{ padding:0; margin-bottom:10px;}
.addressDiv input[type=text],.invoiceDivDiv input[type=text]{ padding:0 5px;}
.addressDiv label,.invoiceDivDiv label{ width:80px; display:inline-block; text-align:right;}
.colorRed{color:red;}

.addressErr,.invoiceErr,.payTypeErr{ height: 30px; width: 1200px; margin: 0 auto;}
.errorCon{ height: 40px; border:1px solid #f00; border-radius: 5px; background: #ffebe7; padding:0 10px; display: inline-block; float: left; width: 400px; margin:10px 0 0 600px; display: none;}
.errorCon p{ line-height: 20px; font-size: 14px; color:#f00;}
</style>
</head>

<body>
    <!--头部-->
    <#include "/lib/template/header.ftl" encoding="UTF-8">
    <!--end 头部-->

    <div class="jf-main">
        <div class="ny_nav" style="margin-bottom: 0;">
            <div class="ny_nav1">当前位置：<a href='<@spring.url "/index"/>'>首页</a> > 购物车</div>
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
                        <span class="addrDefault" style="float: none;">默认地址</span>
                        <span class="addrModifyBtn" onclick="openTipDiv('addressDiv')">添加</span>
                        <span class="addrModifyBtn" onclick="divHeightA('addrSlide')">修改</span>
                    </#if>
                        <span class="addrDefault" style="float: none;">仅购买实体卡时需要配送</span>
                </div>
            </div>

            <div class="jf-overflowH addrSlide" style="height:0;">
                <#list queryMemberAddress as item>
                    <div class="addrDiv jf-overflowH">
                        <label class="addrName">${item.name}</label>
                        <label class="addrPhone">${item.phone}</label>
                        <label class="address">${item.addr}</label>
                    </div>
                </#list>
                <div>
                    <span class="addrModSureBtn">确定</span>
                    <span class="addrModCBtn" onclick="divHeightZ('addrSlide')">取消</span>
                    <!--<span class="addForN" style="">没有您想要的地址？请 <a href="javascript:void(0);">添加</a></span>-->
                </div>
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
                    <label class="invoiceType">普通发票（纸质）1</label>
                    <label class="invoiceComp">广州睿颢软件技术有限公司1</label>
                    <label class="invoiceTxt">明细1</label>
                    <span class="addrDefault" style="float: none;">默认发票信息</span>
                    <span class="addrModifyBtn" onclick="openTipDiv('invoiceDivDiv')">添加</span>
                    <span class="invoiceModifyBtn" onclick="divHeightA('invoiceSlide')">修改</span>
                </div>
            </div>

            <div class="jf-overflowH invoiceSlide" style="height:0;">
                <div class="invoiceDiv jf-overflowH">
                    <label class="invoiceType">普通发票（纸质）1</label>
                    <label class="invoiceComp">广州睿颢软件技术有限公司1</label>
                    <label class="invoiceTxt">明细1</label>
                </div>
                <div class="invoiceDiv jf-overflowH">
                    <label class="invoiceType">普通发票（纸质）2</label>
                    <label class="invoiceComp">广州睿颢软件技术有限公司2</label>
                    <label class="invoiceTxt">明细2</label>
                </div>
                <div>
                    <span class="invoiceModSureBtn">确定</span>
                    <span class="addrModCBtn" onclick="divHeightZ('invoiceSlide')">取消</span>
                    <!--<span class="addForN" style="">没有您想要的发票信息？请 <a href="javascript:void(0);">添加</a></span>-->
                </div>
            </div>
        </div>
        <!--end发票信息-->

        <!--支付方式-->
        <div class="payTypeErr"></div>
        <div class="orderItem jf-width1000">
            <div class="orderItemTitel jf-overflowH">
                <h4>支付方式</h4>
                <div class="defaultDiv jf-overflowH" style="float:left;">
                	<label class="payTypeT">积分支付：</label>
                   	<label class="payTypeA" style="display: none;"></label>
                    <label class="payTypePayerName">账户余额</label>
                    <span class="payTypeModifyBtn">修改</span>
                </div>
            </div>
            <div class="jf-overflowH payTypeSlide" style="height:0;">
                <div class="payTypeDiv jf-overflowH" style="padding:0 10px;">
                    <!--
                	<div><h5>积分支付</h5></div>
                	<div class="jf-overflowH" style="margin-bottom: 10px;">
	                    <label class="payTypeItem payTypeItemBO">
	                    	<input type="radio" name="RadioGroup1" value="逸乐生活" checked="checked" />
	                    	<img src="<@spring.url '/images/bankLogo/payTypeYL.png'/>" width="100" height="33" />
	                    </label>
	                    <label class="payTypeItem">
	                    	<input type="radio" name="RadioGroup1" value="中信银行" />
	                    	<img src="<@spring.url '/images/bankLogo/payTypeZX.png'/>" width="100" height="33" />
	                    </label>
                    </div>
                    -->
                    <div><h5>资金支付</h5></div>
                    <div class="jf-overflowH" style="margin-bottom: 10px;">
                        <#--
	                    <label class="payTypeItem">
	                    	<input type="radio" name="RadioGroup1" value="支付宝" />
	                    	<img src="<@spring.url '/images/bankLogo/payTypeZFB.png'/>" width="100" height="33" />
	                    </label>
	                    <label class="payTypeItem">
	                    	<input type="radio" name="RadioGroup1" value="微信" />
	                    	<img src="<@spring.url '/images/bankLogo/payTypeWX.png'/>" width="100" height="33" />
	                    </label>
	                    -->
                        <#list payerForCardsOrder as item>
                            <label class="payTypeItem">
                                <input type="radio" name="RadioGroup1" value="${item.payer}" />
                                <img src="<@spring.url '/imgsrc/'/>${item.iconFileName}" alt="${item.payerName}" width="100" height="33" />
                            </label>
                        </#list>
                    </div>
                    
                </div>

                <div style="margin-left: 10px;">
                    <span class="payTypeModSureBtn">确定</span>
                    <span class="addrModCBtn" onclick="divHeightZ('payTypeSlide')">取消</span>
                    
                </div>
            </div>

            <!--<<div class="jf-overflowH" style="padding:0 10px;">
                div class="jf-overflowH" style="float:left; margin-right:50px;">
                    <label>积分支付方式：</label>
                    <label>工商银行-信用卡</label>
                    <span class="invoiceModify" onclick="exchangeOpen()">修改</span>
                </div>
            </div>-->
        </div>
        <!--end支付方式-->
             
        <!--订单信息-->
        <div class="orderItem jf-width1000" style="margin-top:30px;">
            <div class="orderItemTitel jf-overflowH"><h4>订单信息</h4></div>
			<div class="jf-cart" style="padding:0 10px;">
                <ul class="jf-cartItemTitle">
                    <li class="width200" style="width:560px;">卡名称</li>
                    <li class="width100">卡类型</li>
                    <li class="width100">金额</li>
                    <li class="width100">数量</li>
                    <li class="width100">小计</li>
                </ul>

                <#list buyerItemList as item>
                	<div class="jf-cartItem">                   
                        <div class="width200 cartItemTitle" style="width:560px;">
                            <a href="<@spring.url '/proshow;prdNo=${item.prdNo};keyWordsFld=${item.prdNo};'/>"><img src="<@spring.url '/imgsrc/${item.fileName}'/>" width="80" height="50" onerror="downloadErrImg(this,'${item.fileName}')" /></a>
                            <a href="<@spring.url '/proshow;prdNo=${item.prdNo};keyWordsFld=${item.prdNo};'/>" style="width:455px; margin-left:10px;">${item.prdName}</a>
                        </div>
                        <div class="width100" style="line-height:40px; ">${item.prdType}</div>

                        <div class="width100 jf-exchange" style="line-height:40px;">￥${item.money}</div>

                        <div class="width100" style="line-height:40px; ">${item.amount}</div>

                        <div class="width100">
                            <p><span class="exchangeCount" style=" line-height:40px;">￥${item.money * item.amount}</span></p>
                        </div>
                	</div>
                </#list>
                <div class="cartBanlance">
                    <div class="bgGrey">
                        <p style="line-height:50px; margin-right:20px;">共<span id="shuliang">${integer}</span><span style="margin-right:20px;">件</span>合计:<span id="exchangeTotal">￥${double}</span></p>
                    </div>
                </div>

			</div>
        </div>
        <!--end订单信息-->
             
        <#--<p class="jf-overflowH jf-width1000"><input type="button" value="确定下单"  class="btnBgS cartExBtn" style="margin:10px 10px 30px 0;" onclick="window.location='<@spring.url "/buycfm"/>'" /></p>-->
        <div class="jf-overflowH jf-width1000">
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
        <div class="jf-overflowH tipDivTitle"><h3 style="float:left;">收货地址</h3><span onclick="closeTipDiv('addressDiv')" style="float:right; cursor:pointer; color:#999;font-size:25px;">×</span></div>
        <div><label><span class="colorRed">*</span> 收货人：</label><input type="text" id="addressName" name="receiverName" value="" /></div>
        <div><label><span class="colorRed">*</span> 邮编：</label><input type="text" id="addressZip" name="zip" value="" /></div>
        <div style="overflow: hidden;">
        	<label style=" float: left;"><span class="colorRed">*</span> 详细地址：</label>
        	<input type="text" id="addressAddr" name="addr" value="" style="width:477px; line-height: 25px;" />
        </div>
        <div><label><span class="colorRed">*</span> 手机号码：</label><input type="text" id="addressPhone" name="phone" value="" /></div>
        <p style="margin:10px 0 0 90px;"><input type="hidden" id="operType" name="operType" value="0"/><input type="hidden" id="" name="" value=""/><input type="submit" value="保存" class="sureBtn"  onclick="closeTipDiv('addressDiv')"  /><input type="button" value="取消" class="cancleBtn"  onclick="closeTipDiv('addressDiv')" /></p>
            <input type="hidden" name="isDefault" value="0"/>
            <input type="hidden" name="objectID" id="objectID" value=""/>
        </form>
    </div>
    <!--新增地址 end-->
    <!--新增发票-->
    <div class="invoiceDivDiv">
        <div class="jf-overflowH tipDivTitle"><h3 style="float:left;">发票信息</h3><span onclick="closeTipDiv('invoiceDivDiv')" style="float:right; cursor:pointer; color:#999;font-size:25px;">×</span></div>
        <div><label><span class="colorRed">*</span> 发票抬头：</label><input type="text" id="addressName" name="receiverName" value="" style="width: 300px;" /></div>
         <div>
         	<label><span class="colorRed">*</span> 发票内容：</label>
         	<select style="line-height: 25px; height: 25px;">
         		<option>日用品</option>
         		<option>办公用品</option>
         		<option>电脑配件</option>
         	</select>
         </div>
        <p style="margin:10px 0 0 90px;"><input type="hidden" id="operType" name="operType" value="0"/><input type="hidden" id="" name="" value=""/><input type="submit" value="保存" class="sureBtn"  onclick="closeTipDiv('invoiceDiv')"  /><input type="button" value="取消" class="cancleBtn"  onclick="closeTipDiv('invoiceDivDiv')" /></p>
            <input type="hidden" name="isDefault" value="0"/>
            <input type="hidden" name="objectID" id="objectID" value=""/>
        </form>
    </div>
    <!--新增发票 end-->
    
<form action="<@spring.url '/buycfm'/>" method="post" id="formGo">
    <input name="addr" type="hidden"/>
    <input name="receiverName" type="hidden"/>
    <input name="mobile" type="hidden"/>
    <input name="payToolIDList" type="hidden"/>
    <input name="orderType" value="1" type="hidden"/>
    <input name="_csrf" value="${_csrf.token}" type="hidden"/>
</form>

</body>

<script language="javascript">
$(document).ready(function(e) {
    //地址修改
    $(".addrDiv").click(function () {
        $(".addrDiv").removeClass("bgCO");
        $(this).addClass("bgCO");
    });
    $(".addrModSureBtn").click(function () {
        var name = $(".bgCO .addrName").text();
        var phoneNum = $(".bgCO .addrPhone").text();
        var addr = $(".bgCO .address").text();
        $(".addrSlide").animate({height: 0});
        if(name != "") {
            $(".defaultDiv .addrName").text(name);
            $(".defaultDiv .addrPhone").text(phoneNum);
            $(".defaultDiv .address").text(addr);
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
    $(".invoiceModSureBtn").click(function () {
        var type = $(".bgCOIn .invoiceType").text();
        var comp = $(".bgCOIn .invoiceComp").text();
        var txt = $(".bgCOIn .invoiceTxt").text();
        $(".invoiceSlide").animate({height: 0});
        if(type != "") {
            $(".defaultDiv .invoiceType").text(type);
            $(".defaultDiv .invoiceComp").text(comp);
            $(".defaultDiv .invoiceTxt").text(txt);
        }
    });
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
    })
    $('.payTypeModSureBtn').click(function(){
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
    })
        
})
function divHeightZ(obj) {
    $("." + obj).animate({height: 0});
}
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
