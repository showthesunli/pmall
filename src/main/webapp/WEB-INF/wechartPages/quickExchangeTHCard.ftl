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
<title>商品详情</title>
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/font_1459473269_4751618.css'/>">
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/style.css'/>">
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/buttons.css'/>">
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/font-awesome.min.css'/>">
<script type="text/javascript" src="<@spring.url '/wechart/js/jquery-1.10.2.min.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/wechart/js/jquery.accordion.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/wechart/js/unslider.min.js'/>"></script>
<style>
.prodMin,.prodAdd{cursor: pointer; background: #f6f6f6; line-height: 26px; padding: 0 5px; display: inline-block; border: 1px solid #ccc; float: left;}
.prodMin{ border-right: none;}
.prodAdd{ border-left: none;}
.prodNum{ width: 30px; padding: 0 5px; line-height: 26px; text-align: center; border: 1px solid #ccc; float: left;}
.info_child span{ float: left;}
.info_child p{ overflow: hidden; margin: 5px 0;}
.pModel{overflow: hidden; display: inline-block;}
.pModel a{ line-height: 26px; border: 1px solid #ccc; padding: 0 5px; display: inline-block;}
.pModel .pModelBO{ border-color: #f60; color: #f60;}
.cardInputTxt{ min-width: 220px; width: 80%; padding: 0 5px; line-height: 26px; border: 1px solid #ccc;}
.info_child img{ max-width: 100%;}
#cardInforError{ display: inline-block; color:#f00; padding:0 10px; background:#ffebe7; line-height:26px; border:1px solid #f00; border-radius:5px;}
</style>
</head>

<body ondragstart="return false;" onselectstart="return false;" oncontextmenu="return false" onselectstart="return false" 
ondragstart="return false" onbeforecopy="return false" oncopy=document.selection.empty() onselect=document.selection.empty()> 
<div id="page">
	<div class="banners">
		<a href="javascript:history.go(-1);"><img src="<@spring.url '/wechart/images/bg_info5.jpg'/>"></a>
	</div>
	<div id="content">
		<div class="box_exp info_light" style="padding-bottom: 0;">
			<div class="info_integral">
				<span class="title"><i class="icon-bookmark-empty"></i>商品信息</span>
			</div>
			<div style="display: block; overflow: hidden; opacity: 1;">
				<div class="info_child" style=" overflow: hidden; padding-bottom: 0;">
					<img src="<@spring.url '/imgsrc/'/>"${queryPrdDetail[0].iconFileName}>
					<p><b>${queryPrdDetail[0].productInfo}</b></p>
					<p><b style="color: #f60;">￥${queryPrdDetail[0].prdPrice}</b></p>
					<p style="margin: 20px 0 10px 0;">
						<span>卡号：</span>
						<input type="text" value="" class="cardInputTxt cardNoTxt" placeholder="请输入卡号" />
					</p>
					<p>
						<span>卡密：</span>
						<input type="password" value="" class="cardInputTxt cardPswTxt" placeholder="请输入卡密" />
					</p>
					<p style="height: 28px; margin-left: 42px;"><span id="cardInforError" style="display: none;"></span></p>
					</form>
					
				</div>
			</div>
		</div>
		
		<div style="margin:8px 0;">
			<span class="button button-block button-rounded button-caution button-large" id="go">兑&nbsp;&nbsp;换</span>
		</div>
		
		
		<div style="padding:15px;"></div>
	</div>
	
	<!--底部-->
	<#include "/lib/template/footer.ftl" encoding="UTF-8">
	<!--end 底部-->
	
	<form action="<@spring.url '/quickExchangeTHCard'/>" method="post" id="formGo">
	    <input name="cardNo" type="hidden"/>
	    <input name="cardPinCiperUnderZPK" type="hidden"/>
		<input name="prdNo" type="hidden"/>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	</form>
	
</div>

<script>
	$(document).ready(function(){
		$("#go").click(function(){
	        var cardNo = $('.cardNoTxt').val();
	        var cardPsw = $('.cardPswTxt').val();
	        $('input[name=cardNo]').val(cardNo);
	        $('input[name=cardPinCiperUnderZPK]').val(cardPsw);
            $('input[name=prdNo]').val("${queryPrdDetail[0].prdNo}");

	        if(cardNo == '' || cardPsw == ''){
	        	$('#cardInforError').css('display','block').text('请填写卡号或卡密。');
	        }
	        if(cardNo != '' && cardPsw != ''){
	        	$('#cardInforError').css('display','none');
	        	$("#formGo").submit();
	        }
	    })
	})
</script>
</body>
</html>