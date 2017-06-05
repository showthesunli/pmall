<#import "/spring.ftl" as spring/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>购物车-逸乐生活网</title>
<link rel="stylesheet" type="text/css" href="<@spring.url '/css/css.css'/>"/>
<link rel="stylesheet" type="text/css" href="<@spring.url '/css/style.css'/>"/>
<script type="text/javascript" src="<@spring.url '/js/gd_Index.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/js/jquery.js'/>"></script>
<script language="javascript" src="<@spring.url '/js/menu.js'/>" ></script>
<script type="text/javascript" src="<@spring.url '/js/util.js'/>"></script>
<style>
.jf-productList{ width:323px; margin:0 10px 10px 0; background:none;}
.jf-productList:hover{ background:#faecec;}
.cartTitle{ color:#f60; font-size: 16px; font-weight: bold; line-height: 30px;}
.jf-cart{ margin-top: 0;}
.gray{-webkit-filter: grayscale(100%); -moz-filter: grayscale(100%); -ms-filter: grayscale(100%); -o-filter: grayscale(100%); filter: grayscale(100%); filter: gray;cursor:not-allowed;
}
.cartNum{ width: 40px;}
</style>
</head>

<body>
    <!--头部-->
    <#include "/lib/template/header.ftl" encoding="UTF-8">
    <!--end 头部-->
        
    <div class="jf-main">
        <div class="ny_nav">
            <div class="ny_nav1">当前位置：<a href='<@spring.url "/index"/>'>首页</a> > 购物车</div>
            <div class="clearfix"></div>
        </div>
            <!--商品购物车列表-->
            <div class="jf-width1000"><h2 class="cartTitle">商品购物车</h2></div>
            <div class="jf-cart jf-width1000">
            	<div class="jf-cart shop" >
                	<ul class="jf-cartItemTitle">
                    	<#--<li class="width50"><input id="Checkbox1" type="checkbox"  class="allselect" />全选</li>-->
                        <li class="width200" style="width:500px;">商品名称</li>
                        <li class="width200">商品单价</li>
                        <#--<li class="width100">最小/最大购买数量</li>-->
                        <li class="width100">商品数量</li>
                        <li class="width200">小计</li>
                        <li class="width100">操作</li>
                    </ul>
					<#if buyerItemList??>
					<#list buyerItemList as item>
					<#if item.prdType == "0">
                    	<div class="jf-cartItem ">
							<!--
                            <div class="width50">
                                <input type="checkbox" value="" name="newslist" style="margin-top:13px;" />
                            </div>
                            -->
                            
                            <div class="width200 cartItemTitle" style="width:500px;">
								<#if item.fileName != "">
                                    <a href="<@spring.url '/proshow;prdNo=${item.prdNo};keyWordsFld=${item.prdNo};'/>"><img src="<@spring.url '/imgsrc/${item.fileName?if_exists}'/>" width="60" height="40" onerror="downloadErrImg(this,'${item.fileName?if_exists}','../imgsrc')"/></a>
                                    <a href="<@spring.url '/proshow;prdNo=${item.prdNo};keyWordsFld=${item.prdNo};'/>" style="width:435px;" class="cartPrdName">${item.prdName?if_exists}</a>
									<#else >
                                        <a href="<@spring.url '/proshow;prdNo=${item.prdNo};keyWordsFld=${item.prdNo};'/>"><img src="<@spring.url '/imgsrc/${item.fileName?if_exists}'/>" width="60" height="40" /></a>
                                        <a href="<@spring.url '/proshow;prdNo=${item.prdNo};keyWordsFld=${item.prdNo};'/>" style="width:435px;" class="cartPrdName">${item.prdName?if_exists}</a>
								</#if>
                            </div>
                            <div class="width200 jf-exchange" style="line-height:40px;">￥<span>${item.money}</span></div>
                            <div class="width100">
                            	<span class="cartNumL bgImgS"></span>
                            	<input name="cartNum" type="text" value="${item.amount}" class="cartNum" />
                            	<span class="cartNumR bgImgS"></span>
                            </div>
                            <div class="width200">
                                <p><span class="exchangeCount" style=" line-height:40px;">￥${item.money * item.amount}</span></p>
                            </div>
                            <div class="cartDlt width100" style="line-height:40px;">
                            	<a href="javascript:delItem('${item.prdNo}','${item.money?c}','${item.amount}')" >删除</a>
                            </div>
                        </div>
                        
                    	<form  action="<@spring.url '/shoppingCart/modCart'/>" method="get" class="formGo">     
							<input name="prdNo" type="hidden" value="${item.prdNo}" />
							<input name="prdName" type="hidden" value="${item.prdName}" />
							<input name="amount" type="hidden" value="${item.amount}" />
							<input name="money" type="hidden" value="${item.money}" />
							<input name="prdType" type="hidden" value="${item.prdType}" />
							<input name="fileName" type="hidden" value="${item.fileName}" />
							<input name="prdWareNum" type="hidden" value="${item.prdWareNum}" />
						</form>
                    
					</#if>
					</#list>
					</#if>
                    <div class="cartBanlance">
                    	<div class="bgGrey">
                            <p style="line-height:50px; margin-right:20px;">共<span id="shuliang">${prdNum}</span><span style="margin-right:20px;">件</span>合计:<span id="exchangeTotal">￥${prdMoney}</span></p>
                        </div>
                    </div>
                    
                </div>
            </div>
            <!--商品购物车列表 end-->

        <!--卡购物车列表-->
        <div class="jf-width1000"><h2 class="cartTitle">卡购物车</h2></div>
        <div class="jf-cart jf-width1000">
            <div class="jf-cart card">
                <ul class="jf-cartItemTitle">
				<#--<li class="width50"><input id="Checkbox1" type="checkbox"  class="allselect" />全选</li>-->
                    <li class="width200" style="width:380px;">商品名称</li>
                    <li class="width100">卡类型</li>
                    <li class="width200">单价</li>
				<#--<li class="width100">最小/最大购买数量</li>-->
                    <li class="width100">商品数量</li>
                    <li class="width200">小计</li>
                    <li class="width100">操作</li>
                </ul>
			<#if buyerItemList??>
				<#list buyerItemList as item>
				<#if item.prdType != "0">
                    <div class="jf-cartItem">
                        <!--
                        <div class="width50">
                            <input type="checkbox" value="" name="newslist" style="margin-top:13px;" />
                        </div>
                        -->
                        <div class="width200 cartItemTitle" style="width:380px;">                       	
							<#if item.fileName != "">
                                <a href="<@spring.url '/proshow;prdNo=${item.prdNo};keyWordsFld=${item.prdNo};'/>"><img src="<@spring.url '/imgsrc/${item.fileName?if_exists}'/>" width="60" height="40" onerror="downloadErrImg(this,'${item.fileName?if_exists}','../imgsrc')"/></a>
                                <a href="<@spring.url '/proshow;prdNo=${item.prdNo};keyWordsFld=${item.prdNo};'/>" style="width:315px;" class="cartPrdName">${item.prdName?if_exists}</a>
							<#else >
                                <a href="<@spring.url '/proshow;prdNo=${item.prdNo};keyWordsFld=${item.prdNo};'/>"><img src="<@spring.url '/imgsrc/${item.fileName?if_exists}'/>" width="60" height="40" /></a>
                                <a href="<@spring.url '/proshow;prdNo=${item.prdNo};keyWordsFld=${item.prdNo};'/>" style="width:315px;" class="cartPrdName">${item.prdName?if_exists}</a>
							</#if>
                        </div>
                        <div class="width100" style="line-height: 40px">${item.prdType}</div>
                        <div class="width200 jf-exchange" style="line-height:40px;">￥<span>${item.money}</span></div>
                        <#--<div class="width100" style="line-height:40px;">1/1000</div>-->
						<div class="width100">
							<span class="cartNumL bgImgS"></span>
							<input name="cartNum" type="text" value="${item.amount}" class="cartNum" />
							<span class="cartNumR bgImgS"></span>
						</div>
						
                        <#--<div class="width100" style="line-height: 40px">${item.amount}</div>-->
                        <div class="width200">
                            <p><span class="exchangeCount" style=" line-height:40px;">￥${item.money * item.amount}</span></p>
                        </div>
                        <div class="cartDlt width100" style="line-height:40px;"><a href="javascript:delItem('${item.prdNo}','${item.money?c}','${item.amount}')" >删除</a></div>
                    </div>
                    
                    <form  action="<@spring.url '/shoppingCart/modCart'/>" method="get" class="formGo">     
						<input name="prdNo" type="hidden" value="${item.prdNo}" />
						<input name="prdName" type="hidden" value="${item.prdName}" />
						<input name="amount" type="hidden" value="${item.amount}" />
						<input name="money" type="hidden" value="${item.money}" />
						<input name="prdType" type="hidden" value="${item.prdType}" />
						<input name="fileName" type="hidden" value="${item.fileName}" />
						<input name="prdWareNum" type="hidden" value="${item.prdWareNum}" />
					</form>
					
				</#if>
				</#list>
			</#if>



                <div class="cartBanlance">
                    <div class="bgGrey">
                        <p style="line-height:50px; margin-right:20px;">共<span id="shuliang">${cardNum}</span><span style="margin-right:20px;">件</span>合计:<span id="exchangeTotal">￥${cardMoney}</span></p>
                    </div>
                </div>

            </div>
        </div>
        <!--卡购物车列表 end-->
        <div class="jf-cart jf-width1000">
			<div class="cartBanlance">
        		<p class="jf-overflowH">
					<input type="button" value="继续购物"  class="btnBgS cartShopBtn"  onclick="window.location='<@spring.url "/pro"/>'" />
                    <input type="button" value="商品下单"  class="btnBgS cartBanBtn shopbtn" onclick="window.location='<@spring.url "/confirmOrder"/>;termID=web'" style="margin-left:10px;"/>
					<input type="button" value="卡下单"  class="btnBgS cartBanBtn cardbtn" onclick="window.location='<@spring.url "/confirmCardOrder"/>;termID=web'" />
				</p>
        	</div>
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
        <div class="jf-overflowH tipDivTitle"><h3 style="float:left;">提示</h3><span onclick="closeTipDiv('tipDiv')" style="float:right; cursor:pointer; color:#999;font-size:25px;">×</span></div>
        <p class="tipShow" style="font-size:14px; font-weight:bold; color:#f60"></p>
        <p><input type="button" value="确定" class="sureBtn" onclick="closeTipDiv('tipDiv')" /></p>
    </div>
    <!--提示框 end-->

</body>

<script language="javascript">

$(document).ready(function(e) {	
	//数量减
	$(".cartNumL").click(function(){		 
		var v =  $(this).next(".cartNum").attr("value");		
		var wareNum = $(this).parent().parent().next(".formGo").find("input[name='prdWareNum']").val();
		var money = $(this).parent().parent().next(".formGo").find("input[name='money']").val().replace(/,/g,'');
		
		v = parseInt(v.replace(/,/g,''));
		wareNum = parseInt(wareNum.replace(/,/g,''));
		
		var num=v - 1;
						  
		if(v==1){
			openTipDiv('tipDiv','商品数量必须大于0');			
		}
		else{
			$(this).parent().parent().next(".formGo").find("input[name='amount']").val(num);			
			$(this).next(".cartNum").val(num);
			$(this).parent().parent().next(".formGo").find("input[name='prdWareNum']").val(wareNum);
			$(this).parent().parent().next(".formGo").find("input[name='money']").val(money);
			$(this).parent().parent().next(".formGo").submit();
		}		  
	});
	
	//数量加	
	$(".cartNumR").click(function(){
		var v =  $(this).prev(".cartNum").attr("value");
		var wareNum = $(this).parent().parent().next(".formGo").find("input[name='prdWareNum']").val();
		var money = $(this).parent().parent().next(".formGo").find("input[name='money']").val().replace(/,/g,'');		
		
		v = parseInt(v.replace(/,/g,''));
		wareNum = parseInt(wareNum.replace(/,/g,''));
		
		var num = v + 1;
				
		if(num <= wareNum){
			$(this).prev(".cartNum").val(num);
			$(this).parent().parent().next(".formGo").find("input[name='amount']").val(num);
			$(this).parent().parent().next(".formGo").find("input[name='prdWareNum']").val(wareNum);
			$(this).parent().parent().next(".formGo").find("input[name='money']").val(money);
			$(this).parent().parent().next(".formGo").submit();
		}
		else{
			openTipDiv('tipDiv','商品数量超限');
			$(this).val(wareNum);
		}
				
	});
	
	//数量手输
	$(".cartNum").blur(function(){
		var v = $(this).val();
		var oldNum = $(this).parent().parent().next(".formGo").find("input[name='amount']").val();
		var wareNum = $(this).parent().parent().next(".formGo").find("input[name='prdWareNum']").val();
		var money = $(this).parent().parent().next(".formGo").find("input[name='money']").val().replace(/,/g,'');
		
		v = parseInt(v.replace(/,/g,''));
		oldNum = parseInt(oldNum.replace(/,/g,''));
		wareNum = parseInt(wareNum.replace(/,/g,''));
		
		if(v <= 0){			
			openTipDiv('tipDiv','商品数量必须大于0');
			$(this).val(1);
		}
		else if(v <= wareNum && v > 0){
			$(this).val(v);
			$(this).parent().parent().next(".formGo").find("input[name='amount']").val(v);			
			$(this).parent().parent().next(".formGo").find("input[name='prdWareNum']").val(wareNum);
			$(this).parent().parent().next(".formGo").find("input[name='money']").val(money);
			$(this).parent().parent().next(".formGo").submit();
		}
		else{
			openTipDiv('tipDiv','商品数量超限');
			$(this).val(oldNum);
		}
	});	

})

function delItem(prdNo,money,amount){
	var url = "<@spring.url '/shoppingCart/delCart'/>";
	window.location.href = url + "?prdNo=" + prdNo + "&money=" + money +"&amount=" + amount;
	return false;
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

	$(function(){
		if($('.shop').find('.jf-cartItem').length ==0){
	    $('.shopbtn').addClass('gray');
        $('.shopbtn').attr('disabled',true);
	   
	}
		if($('.card').find('.jf-cartItem').length == 0){
	    $('.cardbtn').addClass('gray');
        $('.cardbtn').attr('disabled',true);
	   
	}
})
</script>

</html>
