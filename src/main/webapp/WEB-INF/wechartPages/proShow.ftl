<#import "/spring.ftl" as spring/>
<#import "/lib/macro/hisuMacro.ftl" as sf />
<#setting url_escaping_charset = "UTF-8"/>
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
<title>微商城商品详情-逸乐生活网</title>
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/style.css'/>">
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/buttons.css'/>">
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/font-awesome.min.css'/>">
<script type="text/javascript" src="<@spring.url '/wechart/js/jquery-1.10.2.min.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/wechart/js/jquery.accordion.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/wechart/js/unslider.min.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/wechart/js/util.js'/>"></script>
<style>
.dots,.arrows{ display: none;}
.prodMin,.prodAdd{cursor: pointer; background: #f6f6f6; line-height: 26px; padding: 0 5px; display: inline-block; border: 1px solid #ccc; float: left;}
.prodMin{ border-right: none;}
.prodAdd{ border-left: none;}
.prodNum{ width: 30px; padding: 0 5px; line-height: 26px; text-align: center; border: 1px solid #ccc; float: left;}
.info_child span{ float: left;}
.info_child p{ overflow: hidden; margin: 5px 0;}
.pModel{overflow: hidden; display: inline-block;}
.pModel a{ line-height: 26px; border: 1px solid #ccc; padding: 0 5px; display: inline-block;}
.pModel .pModelBO{ border-color: #f60; color: #f60;}
.borderTop{ border-top:1px dotted #eee; width: 100%;}
.exchangeDivList{ background: #ffefe5; overflow: hidden; height: 0;}
.exchangeDivList .exchangeDivPoint .pointInt{ display: none;}
.exchangeDivPoint{ overflow: hidden; padding:10px 10px 0;}
.banner img{min-height: 150px;max-height: 150px;}
</style>
</head>

<body ondragstart="return false;" onselectstart="return false;" oncontextmenu="return false" onselectstart="return false" 
ondragstart="return false" onbeforecopy="return false" oncopy=document.selection.empty() onselect=document.selection.empty()> 
<div id="page">
	<div class="banners">
		<a href="javascript:history.go(-1);"><img src="<@spring.url '/wechart/images/bg_info2.jpg'/>"></a>
	</div>
	<div id="content">
		<div class="box_exp info_light">
			<div class="info_integral">
				<span class="title"><i class="icon-bookmark-empty"></i>商品信息</span>
			</div>
			<div style="display: block; overflow: hidden; opacity: 1;">
				<div class="info_child" style=" overflow: hidden;">
					<div class="banner" style="min-height: 150px;max-height: 200px;">
						<ul>
							<#if querySingleProuctImageGrp[0]??>
                            <#list querySingleProuctImageGrp as item>
                            	
							<li><img src="<@spring.url '/imgsrc/${item.fileName}'/>" onerror="downloadErrImg(this,'${item.fileName}')";)" /></li>
							
							</#list>
							<#else >
								
							<li><img src="<@spring.url '/wechart/images/default.gif'/>" /></li>
								
							</#if>

						</ul>
					</div>
					<p style="color: #333;">${queryPrdDetail[0].productInfo}</p>
					<p class="borderTop">
						<span>积分来源：</span>
						<span class="exC" style=" color: #f60; margin-right: 10px;"></span>
						<span class="exCOp" style=" color: #3897d7;" onclick="openExchangeDiv()">请选择</span>
					</p>
					
					<div class="exchangeDivList">
                        <ul class="exchangeDivPoint">
                            <li>
                               	<span class="pointComp">中信银行</span>
                                <span class="pointInt">1000-2000</span>
                            </li>
                            <li>
                                <span class="pointComp">工商银行</span>
                                <span class="pointInt">2000-3000</span>
                            </li>                                
                        </ul>
                    </div>
                    
					<p class="borderTop">
						<span>服务：</span>
						<span style="display: inline-block; width: 80%; min-width: 200px;">配送服务按照地域（北京/江浙沪/珠三角）， 其他地区不提供兑换。</span>
					</p>
					<p class="borderTop">
						<span>型号：</span>
						<span class="pModel">
							
							<#list queryPrdAllSpecByPrdNo as queryPrdAllSpecByPrdNoItem>
                            <#if queryPrdAllSpecByPrdNoItem.prdNo == queryPrdDetail[0].prdNo>
                            	
							<a href="<@spring.url '/proshow'/>;prdNo=${queryPrdAllSpecByPrdNoItem.prdNo};keyWordsFld=${queryPrdAllSpecByPrdNoItem.prdNo};" class="pModelBO">${queryPrdAllSpecByPrdNoItem.productSpec}</a>
							
							<#else >
								
							<a href="<@spring.url '/proshow'/>;prdNo=${queryPrdAllSpecByPrdNoItem.prdNo};keyWordsFld=${queryPrdAllSpecByPrdNoItem.prdNo};" >${queryPrdAllSpecByPrdNoItem.productSpec}</a>
							
							</#if>

                        	</#list>
                        	
						</span>
					</p>
					<p class="borderTop">
						<span>数量：</span>
						<span style="overflow: hidden; display: inline-block;">
							<b class="prodMin">-</b>
							<input type="text" value="1" name="pNum" id="prdnum" class="prodNum">
							<b class="prodAdd">+</b>
						</span>
						<span>（库存 ${queryPrdDetail[0].prdWareNum} 件）</span>
					</p>
				</div>
				<div class="info_child_txt">
					<a href="javascript:void(0);" class="left fb f14 red" style="height: 32px; line-height: 32px;">￥${queryPrdDetail[0].prdPrice}</a>
					<a href="javascript:void(0);" class="button button-rounded button-flat-caution right addTo"><i class="icon-shopping-cart"></i> 加入购物车</a>
				</div>
			</div>
		</div>
	
	
		<div class="box_exp info_light">
			<div class="info_integral">
				<span class="title"><i class="icon-bookmark-empty"></i>商品简介</span>
			</div>
			<div style="display: block; overflow: hidden; opacity: 1;">
				<div class="info_child">
					<#include "/${queryPrdDetail[0].fileName}" parse=false ignore_missing=true>
				</div>
			</div>
		</div>
		
		
		<div style="margin:8px 0;"><a href="javascript:void(0);" class="button button-block button-rounded button-caution button-large addTo"><i class="icon-shopping-cart"></i>&nbsp;&nbsp;加入购物车</a></div>
		
		
		<div style="padding:15px;"></div>
	</div>
	
	<!--底部-->
	<#include "/lib/template/footer.ftl" encoding="UTF-8">
	<!--end 底部-->
	
</div>

<script>
$(document).ready(function() {
	$('.banner').unslider({
		arrows: true,
		fluid: true,
		dots: true
	});
	
	$("#content").accordion({
		alwaysOpen: false,
		autoheight: false,
		header: '.info_integral',
		clearStyle: true
	});
	
	//选择积分来源
	$(".exchangeDivPoint li").click(function () {
        var c = $(this).children('.pointComp').text();//公司
        var i = $(this).children('.pointInt').text();//积分区间        
        $('.exC').text(c + ' ' + i);
        $('.exchangeDivList').animate({height:0});
        if($('.exC').text() != ''){$('.exCOp').text('修改');}
        else{$('.exCOp').text('请选择');}
   });
	
	//数量减
	$(".prodMin").click(function () {
		var v = $(this).next(".prodNum").attr("value");
		var num = parseInt(v) - 1;

		if (parseInt(v) == 1) {
			$(this).next(".prodNum").val(1);
		}
		else {
			$(this).next(".prodNum").val(num);
		}
	});
	//数量加
	$(".prodAdd").click(function () {
		var v = $(this).prev(".prodNum").attr("value");
		var num = parseInt(v) + 1;
		var stock = ${queryPrdDetail[0].prdWareNum};
		
		if(num <= stock){
			$(this).prev(".prodNum").val(num);
		}
		else{
			$(this).prev(".prodNum").val(stock);
		}
	});	
	//数量手输判断
	$("#prdnum").keyup(function () {
		var v = $.trim($(this).attr("value"));
		var stock = ${queryPrdDetail[0].prdWareNum};
		
		if(v > stock){$(this).val(stock);}
		else if(v <= stock && v > 0){$(this).val(v);}
		else{$(this).val(1);}
	});
	
	$(".addTo").click(function (){
		var money = ${queryPrdDetail[0].prdPrice};
		var amount = $("#prdnum").val();
		var prdNo = "${queryPrdDetail[0].prdNo}";
		var isCard = "${queryPrdDetail[0].isCard}";
		window.location.href = "<@spring.url '/shoppingCart/addCart'/>" + "?prdNo="+prdNo+"&amount="+amount+"&money="+money+"&prdType="+isCard;
	});
});
function openExchangeDiv(){
	var h = $('.exchangeDivPoint').height() + 10;
	$('.exchangeDivList').animate({height:h + 'px'});
}
</script>
</body>
</html>