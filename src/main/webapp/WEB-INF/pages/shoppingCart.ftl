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
                                    <a href="<@spring.url '/proshow;prdNo=${item.prdNo};keyWordsFld=${item.prdNo};'/>" style="width:435px;">${item.prdName?if_exists}</a>
									<#else >
                                        <a href="<@spring.url '/proshow;prdNo=${item.prdNo};keyWordsFld=${item.prdNo};'/>"><img src="<@spring.url '/imgsrc/${item.fileName?if_exists}'/>" width="60" height="40" /></a>
                                        <a href="<@spring.url '/proshow;prdNo=${item.prdNo};keyWordsFld=${item.prdNo};'/>" style="width:435px;">${item.prdName?if_exists}</a>
								</#if>
                            </div>
                            <div class="width200 jf-exchange" style="line-height:40px;">￥${item.money}</div>
                            <#--<div class="width100" style="line-height:40px;">1/1000</div>-->
                            <#--<div class="width100"><span class="cartNumL bgImgS" style="margin-left:15px;"></span><input name="cartNum" type="text" value="${item.amount}" class="cartNum" /><span class="cartNumR bgImgS"></span></div>-->
                            <div class="width100" style="line-height: 40px">${item.amount}</div>
                            <div class="width200">
                                <p><span class="exchangeCount" style=" line-height:40px;">￥${item.money * item.amount}</span></p>
                            </div>
                            <div class="cartDlt width100" style="line-height:40px;"><a href="javascript:delItem('${item.prdNo}','${item.money?c}','${item.amount}')" >删除</a></div>
                        </div>
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
                                <a href="<@spring.url '/proshow;prdNo=${item.prdNo};keyWordsFld=${item.prdNo};'/>" style="width:315px;">${item.prdName?if_exists}</a>
							<#else >
                                <a href="<@spring.url '/proshow;prdNo=${item.prdNo};keyWordsFld=${item.prdNo};'/>"><img src="<@spring.url '/imgsrc/${item.fileName?if_exists}'/>" width="60" height="40" /></a>
                                <a href="<@spring.url '/proshow;prdNo=${item.prdNo};keyWordsFld=${item.prdNo};'/>" style="width:315px;">${item.prdName?if_exists}</a>
							</#if>
                        </div>
                        <div class="width100" style="line-height: 40px">${item.prdType}</div>
                        <div class="width200 jf-exchange" style="line-height:40px;">￥${item.money}</div>
					<#--<div class="width100" style="line-height:40px;">1/1000</div>-->
					<#--<div class="width100"><span class="cartNumL bgImgS" style="margin-left:15px;"></span><input name="cartNum" type="text" value="${item.amount}" class="cartNum" /><span class="cartNumR bgImgS"></span></div>-->
                        <div class="width100" style="line-height: 40px">${item.amount}</div>
                        <div class="width200">
                            <p><span class="exchangeCount" style=" line-height:40px;">￥${item.money * item.amount}</span></p>
                        </div>
                        <div class="cartDlt width100" style="line-height:40px;"><a href="javascript:delItem('${item.prdNo}','${item.money?c}','${item.amount}')" >删除</a></div>
                    </div>
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

</body>

<script language="javascript">
$(document).ready(function(e) {		
	//数量减
	$(".cartNumL").click(function(){		 
		var v =  $(this).next(".cartNum").attr("value");
		var num=parseInt(v) - 1;
		var exchange = num * 5000;
		var price = num *  100;
		  
		if(parseInt(v)==1){
			$(this).next(".cartNum").val(1);
		}
		else{
			$(this).next(".cartNum").val(num);
			//$(this).parent().parent().find(".priceCount").html(price.toFixed(2));
			$(this).parent().parent().find(".exchangeCount").html(exchange);
			GetCount();
		}		  
	});
	
	//数量加	
	$(".cartNumR").click(function(){
		var v =  $(this).prev(".cartNum").attr("value");
		var num=parseInt(v) + 1;
		var exchange = num * 5000;
		var price = num *  100;
		
		$(this).prev(".cartNum").val(num);
		//$(this).parent().parent().find(".priceCount").html(price.toFixed(2));
		$(this).parent().parent().find(".exchangeCount").html(exchange);
		GetCount();
		});
		
	//全选        
	$(".allselect").click(function () {		
		if($(this).attr("checked")){
			$(".jf-cartItem input[name=newslist]").each(function () {
				$(this).attr("checked", true);
			});
			GetCount();
		}
		else
   		{
			$(".jf-cartItem input[name=newslist]").each(function () {
				if ($(this).attr("checked")) {
					$(this).attr("checked", false);
				} else {
					$(this).attr("checked", true);
				} 
			});
			GetCount();
   		}		
	});
	
	// 所有复选(:checkbox)框点击事件
	$(".jf-cartItem input[name=newslist]").click(function () {
		if($(this).attr("checked")){
			var n = $(".jf-cartItem input:checked").length;
			var i = $("input[name=newslist]").length;
			if(n==i){$(".allselect").attr("checked", true);}
			$(this).attr("checked", true);
			GetCount();
		}
		else {
			$(this).attr("checked", false);
			$(".allselect").attr("checked", false);
			GetCount();
		}
	});

	$("#cx").click(function(){
		$(".industryItem li").removeClass("borderColorW");
		$(this).addClass("borderColorW");
        $("#loginBg").css("display","block");
		$("#industry-cx").css("display","block");
		$("#industry-xy").css("display","none");
		})
		
	$("#xy").click(function(){
		$(".industryItem li").removeClass("borderColorW");
		$(this).addClass("borderColorW");
         $("#loginBg").css("display","block");
		 $("#industry-xy").css("display","block");
		 $("#industry-cx").css("display","none");
		})
	$("input[name=radioG]").click(function(){
		$(".industry").removeClass("industryChecked");
		$(this).parent("h4").addClass("industryChecked");
		})
})

function GetCount() {
	var pConts = 0;
	var exConts = 0;
	var numTotal = 0;
	$(".jf-cartItem input[name=newslist]").each(function () {
		if ($(this).attr("checked")) {
			for (var i = 0; i < $(this).length; i++) {
				exConts += parseInt($(this).parent().parent().find(".exchangeCount").text());
				//pConts += parseInt($(this).parent().parent().find(".priceCount").text());
				numTotal += parseInt($(this).parent().parent().find(".cartNum").val());
			}
		}
	});
	$("#shuliang").text(numTotal);
	$("#exchangeTotal").html(exConts);
	$("#priceTotal").html((pConts).toFixed(2));
}
	
function getVal(){
	var v = $("input[name=radioG1]:checked").val();
	$("input[name=exVal]").val(v);
	exchangeClose();
	if($("input[name=exVal]").val() != ''){
		$(".cartBanBtn").removeClass("btnGrey");
		}
	}

function delItem(prdNo,money,amount){
	var url = "<@spring.url '/shoppingCart/delCart'/>";
	window.location.href = url + "?prdNo=" + prdNo + "&money=" + money +"&amount=" + amount;
	return false;
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
