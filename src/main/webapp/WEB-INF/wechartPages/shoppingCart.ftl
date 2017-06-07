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
<title>微商城购物车-逸乐生活网</title>
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/style.css'/>">
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/buttons.css'/>">
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/font-awesome.min.css'/>">
<script type="text/javascript" src="<@spring.url '/wechart/js/jquery-1.10.2.min.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/wechart/js/jquery.accordion.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/wechart/js/unslider.min.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/wechart/js/util.js'/>"></script>
<style>
.continueSBtn{background: -webkit-linear-gradient(#eee, #ccc); background: -o-linear-gradient(#eee, #ccc); background: -moz-linear-gradient(#eee, #ccc); background: linear-gradient(rgba(44, 154, 219, 0.8), #ccc);color:#333; border-color: #999;}
.sCartTitle{ font-size: 16px; font-weight: bold; color: #f60;}
.f12{ font-size: 12px; font-weight: normal;margin: 15px 12px;}
.iconfont{ width: 16px; height: 16px; display: inline-block;}
.info_head{ position: relative;}
.right em{ display: block; -webkit-border-radius: 20px; border-radius: 20px; color: #FFF; font-size: 12px; line-height: 12px; margin-top: 5px; padding: 4px 8px; top: 50%; text-shadow: 0 0 #FFFFFF; font-style: normal;}
.right{ position: absolute; top:0; right:5px;}
.info_card_price{ line-height: 20px;}
.info_card i img{ min-height: 40px;}
.info_card{ margin-top: 10px;}
.gray{-webkit-filter: grayscale(100%); -moz-filter: grayscale(100%); -ms-filter: grayscale(100%); -o-filter: grayscale(100%); filter: grayscale(100%); filter: gray;cursor:not-allowed;
}
.gw_num{border: 1px solid #dbdbdb;width: 106px;line-height: 26px;overflow: hidden;margin-top: 10px;}
.gw_num a{display: block;height: 26px;width: 26px;float: left;color: #7A7979;border-right: 1px solid #dbdbdb;text-align: center;cursor: pointer;}
.gw_num .num{display: block;float: left;text-align: center;width: 52px;font-style: normal;font-size: 14px;line-height: 24px;border: 0;}
.gw_num a.add{float: right;border-right: 0;border-left: 1px solid #dbdbdb;}
.gw_num,.left f12 red{float: left;}
.banners{position:fixed ;z-index: 99999;width: 100%;}
</style>
</head>

<body ondragstart="return false;" onselectstart="return false;" oncontextmenu="return false" onselectstart="return false" 
ondragstart="return false" onbeforecopy="return false" oncopy=document.selection.empty() onselect=document.selection.empty()> 
<div id="page">
	<div class="banners">
		<a href="javascript:history.go(-1);"><img src="<@spring.url '/wechart/images/bg_info3.jpg'/>"></a>
	</div>
	<div id="content">
		
		<h2 class="sCartTitle">商品购物车</h2>
		
		<#if buyerItemList??>
		<#list buyerItemList as item>
		<#if item.prdType == "0">
						
		<div class="info_head info_light shop">
			<a href="javascript:delItem('${item.prdNo}','${item.money?c}','${item.amount}')" class="right"><em class="no">删</em></a>
			
			<#if item.fileName != "">
				
			<div class="info_card">
				<a href="<@spring.url '/proshow;prdNo=${item.prdNo};keyWordsFld=${item.prdNo};'/>">
					<i><img src="<@spring.url '/imgsrc/${item.fileName?if_exists}'/>" onerror="downloadErrImg(this,'${item.fileName?if_exists}','../imgsrc')" /></i>
					<h1>${item.prdName?if_exists}</h1>
				</a>
			</div>
			
			<#else >
			
			<div class="info_card">
				<a href="<@spring.url '/proshow;prdNo=${item.prdNo};keyWordsFld=${item.prdNo};'/>">
					<i><img src="<@spring.url '/imgsrc/${item.fileName?if_exists}'/>" /></i>
					<h1>${item.prdName?if_exists}</h1>
				</a>
			</div>
			
			</#if>
			
			<div class="info_card_price">
				<div class="gw_num">
					<a class="jian">-</a>
					<input type="text" value="${item.amount}" class="num"/>
					<a class="add">+</a>
			    </div>
				<span class="left f12 red" >单价：￥${item.money}</span>
				<span class="left f12 red" >小计：￥${item.money * item.amount}</span>
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
		
		<div class="box_exp info_light">
			<div class="info_integral">
				<span class="titles"><i class="icon-bookmark-empty"></i>总计 - ￥${prdMoney}元</span>
			</div>
		</div>
		
		<h2 class="sCartTitle">卡购物车</h2>

		<#if buyerItemList??>
		<#list buyerItemList as item>
		<#if item.prdType != "0">
		
		<div class="info_head info_light card">
			
			<a href="javascript:delItem('${item.prdNo}','${item.money?c}','${item.amount}')" class="right"><em class="no">删</em></a>
			
			<#if item.fileName != "">
				
			<div class="info_card">
				<a href="<@spring.url '/proshow;prdNo=${item.prdNo};keyWordsFld=${item.prdNo};'/>">
					<i><img src="<@spring.url '/imgsrc/${item.fileName?if_exists}'/>" /></i>
					<h1>${item.prdName?if_exists}</h1>
				</a>
				
			</div>
			
			<#else >
			
			<div class="info_card">
				<a href="<@spring.url '/proshow;prdNo=${item.prdNo};keyWordsFld=${item.prdNo};'/>">
					<i><img src="<@spring.url '/imgsrc/${item.fileName?if_exists}'/>" /></i>
					<h1>${item.prdName?if_exists}</h1>
				</a>
				
			</div>
			
			</#if>
			
			<div class="info_card_price">
				<div class="gw_num">
					<a class="jian">-</a>
					<input type="text" value="${item.amount}" class="num"/>
					<a class="add">+</a>
			    </div>
				<!--<span class="left f12 red" style="width: 20%;">${item.amount}</span>-->
				<span class="left f12 red">单价：￥${item.money}</span>
				<span class="left f12 red">小计：￥${item.money * item.amount}</span>
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
		
		<div class="box_exp info_light">
			<div class="info_integral">
				<span class="titles"><i class="icon-bookmark-empty"></i>总计 - ￥${cardMoney}元</span>
			</div>
		</div>
		
		<div style="margin:8px 0;"><a href="<@spring.url "/confirmCardOrder"/>;termID=wechat"  id="cardbtn" class="button button-block button-rounded button-caution button-large"><i class="icon-shopping-cart"></i>&nbsp;&nbsp;卡下单</a></div>
		<div style="margin:8px 0;"><a href="<@spring.url "/confirmOrder"/>;termID=wechat"  id="shopbtn" class="button button-block button-rounded button-caution button-large"><i class="icon-shopping-cart"></i>&nbsp;&nbsp;商品下单</a></div>
		<div style="margin:8px 0;"><a href="<@spring.url '/goodClass'/>" class="button button-block button-rounded button-caution button-large continueSBtn">继续购物</a></div>
		
		
		<div style="padding:15px;"></div>
	</div>
	
	<!--底部-->
	<#include "/lib/template/footer.ftl" encoding="UTF-8">
	<!--end 底部-->
	
</div>

</body>
</html>
<script>
	//content层的padding-top值随着banners的高度变化而变化
$(document).ready(function(){
	var height = $(".banners").height();
	var padding = height+10+'px';
	$("#content").css("padding-top",padding);
	//console.log(height);
	//console.log(padding);
});
$(window).resize(function() {
	var height = $(".banners").height();
	var padding = height+10+'px';
	$("#content").css("padding-top",padding);
	//console.log(height);
	//console.log(padding);
});
function delItem(prdNo,money,amount){
	var url = "<@spring.url '/shoppingCart/delCart'/>";
	window.location.href = url + "?prdNo=" + prdNo + "&money=" + money +"&amount=" + amount;
	return false;
}
	$(function(){
		if($('#content').find('.shop').length ==0){
		
	    $('#shopbtn').addClass('gray');
        $('#shopbtn').attr('href','javascript:void(0);');
	   
	}
		if($('#content').find('.card').length == 0){
	    $('#cardbtn').addClass('gray');
        $('#cardbtn').attr('href','javascript:void(0);');
	   
	}
	})
$(document).ready(function(){
	//加的效果
	$(".add").click(function(){
		var $this = $(this).parent().parent().parent();
		var v =  parseInt($(this).prev(".num").val().replace(/,/g,''));
		var wareNum = parseInt($this.next(".formGo").find("input[name='prdWareNum']").val().replace(/,/g,''));
		var money = $this.next(".formGo").find("input[name='money']").val().replace(/,/g,'');		
		var num = v + 1;
					
		if(num <= wareNum){
			$(this).prev(".cartNum").val(num);
			$this.next(".formGo").find("input[name='amount']").val(num);
			$this.next(".formGo").find("input[name='prdWareNum']").val(wareNum);
			$this.next(".formGo").find("input[name='money']").val(money);
			$this.next(".formGo").submit();
		}
		else{
			$(this).val(wareNum);
			alert('商品数量超限');
		}
	});
	
	//减的效果
	$(".jian").click(function(){
		var $this = $(this).parent().parent().parent();
		var v =  parseInt($(this).next(".num").val().replace(/,/g,''));
		var wareNum = parseInt($this.next(".formGo").find("input[name='prdWareNum']").val().replace(/,/g,''));
		var money = $this.next(".formGo").find("input[name='money']").val().replace(/,/g,'');
		var num = v - 1;
		
		if(v == 1){
			$(this).val(1);
			alert('商品数量必须大于0');
		}
		else{
			$("input[name='amount']").val(num);			
			$(this).next(".cartNum").val(num);
			$this.next(".formGo").find("input[name='prdWareNum']").val(wareNum);
			$this.next(".formGo").find("input[name='money']").val(money);
			$this.next(".formGo").submit();
		}
	});
		
	//数量手输
	$(".num").blur(function(){
		var $this = $(this).parent().parent().parent();
		var v = parseInt($(this).val().replace(/,/g,''));
		var oldNum = parseInt($this.next(".formGo").find("input[name='amount']").val().replace(/,/g,''));
		var wareNum = parseInt($this.next(".formGo").find("input[name='prdWareNum']").val().replace(/,/g,''));
		var money = $this.next(".formGo").find("input[name='money']").val().replace(/,/g,'');

		if(v <= 0){
			$(this).val(1);
			alert('商品数量必须大于0');
		}
		else if(v > 0 && v <= wareNum){
			$(this).val(v);
			$this.next(".formGo").find("input[name='amount']").val(v);			
			$this.next(".formGo").find("input[name='prdWareNum']").val(wareNum);
			$this.next(".formGo").find("input[name='money']").val(money);
			$this.next(".formGo").submit();
		}
		else{
			$(this).val(oldNum);
			alert('商品数量超限');
		}
	});	
	
})
</script>