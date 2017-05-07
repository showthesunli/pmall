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
<style>
.jf-productList{ width:323px; margin:0 10px 10px 0; background:none;}
.jf-productList:hover{ background:#faecec;}
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
            
            <!--购物车列表-->
            <div class="jf-cart jf-width1000">
            	<div class="jf-cart">
                	<ul class="jf-cartItemTitle">
                    	<li class="width50"><input id="Checkbox1" type="checkbox"  class="allselect" />全选</li>
                        <li class="width200" style="width:480px;">商品名称</li>
                        <li class="width100">所需积分</li>
                        <li class="width100">最小/最大购买数量</li>
                        <li class="width100">商品数量</li>
                        <li class="width100">小计</li>
                        <li class="width100">操作</li>
                    </ul>
                    
                    <div class="jf-cartItem">
                    	<div class="width50">
                            <input type="checkbox" value="" name="newslist" style="margin-top:13px;" />
                        </div>
                    	<div class="width200 cartItemTitle" style="width:480px;">
                   	    	<a href="#"><img src="<@spring.url '/images/about3.jpg'/>" width="60" height="40" /></a>
                            <a href="#" style="width:415px;">商品名称商品名称商品名称商品名称商品名称商品名称商品名称商品名称商品名称商品名称商品名称商品名称...</a>
                        </div>
                        <div class="width100 jf-exchange" style="line-height:40px;">5000分</div>
                        <div class="width100" style="line-height:40px;">1/1000</div>
                        <div class="width100"><span class="cartNumL bgImgS" style="margin-left:15px;"></span><input name="cartNum" type="text" value="1" class="cartNum" /><span class="cartNumR bgImgS"></span></div>
                        <div class="width100">
                            <p><span class="exchangeCount" style=" line-height:40px;">5000</span>分</p>
                        </div>
                        <div class="cartDlt width100" style="line-height:40px;"><a href="#" onclick="tipOpen()">删除</a></div>
                    </div>
                     
                     <div class="jf-cartItem">
                    	<div class="width50">
                            <input type="checkbox" value="5000" name="newslist" style="margin-top:13px;" />
                            <input type="checkbox" value="100" name="newslist2" style="display:none" />
                        </div>
                    	<div class="width200 cartItemTitle" style="width:480px;">
                   	    	<a href="#"><img src="<@spring.url '/images/about3.jpg'/>" width="60" height="40" /></a>
                            <a href="#" style="width:415px;">商品名称商品名称商品名称商品名称商品名称商品名称商品名称商品名称商品名称商品名称商品名称商品名称...</a>
                        </div>
                        <div class="width100 jf-exchange" style="line-height:40px;">8000分</div>
                        <div class="width100" style="line-height:40px;">1/1000</div>
                        <div class="width100"><span class="cartNumL bgImgS" style="margin-left:15px;"></span><input name="" type="text" value="1" class="cartNum" /><span class="cartNumR bgImgS"></span></div>
                        <div class="width100">
                            <p><span class="exchangeCount" style=" line-height:40px;">8000</span>分</p>
                        </div>
                        <div class="cartDlt width100" style="line-height:40px;"><a href="#" onclick="tipOpen()">删除</a></div>
                    </div>                                                     
                    
                                       
                    <div class="cartBanlance">
                    	<div class="bgGrey">
                            <p style="line-height:50px; margin-right:20px;">已选商品<span id="shuliang">0</span><span style="margin-right:20px;">件</span>合计:<span id="exchangeTotal">0</span>分</p>
                        </div>
                        <p class="jf-overflowH"><input type="button" value="继续购物"  class="btnBgS cartShopBtn"  onclick="window.location='<@spring.url "/pro"/>'" /><input type="button" value="去结算 >"  class="btnBgS cartBanBtn" onclick="window.location='<@spring.url "/confirmOrder"/>'" /></p>
                    </div>
                    
                </div>
            </div>
            <!--购物车列表 end-->
            
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
</script>

</html>