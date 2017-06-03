<#import "/spring.ftl" as spring/>
<#import "/lib/macro/hisuMacro.ftl" as sf />
<#setting url_escaping_charset = "UTF-8"/>
<!doctype html>
<html lang="zh-cn" xmlns="http://www.w3.org/1999/html">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<title>积分商城-逸乐生活网</title>
<meta name="description" content="途皓（北京）商务服务有限公司" />
<meta name="keywords" content="途皓（北京）商务服务有限公司" />
<link rel="stylesheet" type="text/css" href="<@spring.url '/css/css.css'/>"/>
<link rel="stylesheet" type="text/css" href="<@spring.url '/css/common.css'/>"/>
<link rel="stylesheet" type="text/css" href="<@spring.url '/css/model.css'/>"/>

<script type="text/javascript" src="<@spring.url '/js/jquery-1.7.2.min.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/js/model.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/js/menu.js'/>" ></script>
<script type="text/javascript" src="<@spring.url '/js/util.js'/>"></script>

<style>
 .exchangeDiv{ width: 400px; min-height: 100px; top:22px; left: 80px;}
 .exchangeDivList{width:400px; padding: 0;}
 .exchangeDivItem b{ font-weight: normal;}
 .exCDivH i{font-style: normal;}
 .exCDivH b{ background: url(images/bgTop.png) no-repeat 20px center; }
 .exchangeDivPoint li{ margin-bottom: 0;}
 .exchangeDivItem{ margin-top: 10px;}
 .pointInt{ display: none;}
 .exchangeDivList{ display: block; border-top: none;}
 .exchangeDivList{ top:0;}
 .productInfro{ font-size:14px;}
 .exFromClick{ left: 80px;}
 .pointComp:hover{ color: #f60;}
</style>
</head>
<body>
<!--头部-->
<#include "/lib/template/header.ftl" encoding="UTF-8">
<!--头部-->
 

<!--主体-->
<div class="jf-main" style="margin-bottom: 20px;">

        <!--产品详情-->
        <div class="jf-width1000 jf-overflowH">
            <div class="cIntroImg con-FangDa" id="fangdajing">
                <div class="picBig con-fangDaIMg">
                    <#if querySingleProuctImageGrp[0]??>
                        <#assign filename=querySingleProuctImageGrp[0].fileName>
                    <#else >
                        <#assign filename=''>
                    </#if>
                    <a href="#" class="bImg"><img src="<@spring.url '/imgsrc/${filename}'/>" onerror="downloadErrImg(this,'${filename}');" width="430" height="280" id="bigimg"></a>

                    <!-- 滑块-->
                    <div class="magnifyingBegin" style="display: none; left: 215px; top: 140px; "></div>
                    <!-- 放大镜显示的图片 -->
                    <div class="magnifyingShow" style="display: none; "><img src="<@spring.url '/imgsrc/${filename}'/>" onerror="downloadErrImg(this,'${filename}');" id="bigimg1" style="margin-left: -516px; margin-top: -336px; "></div>

                </div>
                <div class="jf-overflowH" style=" width:430px; margin-top:10px;">
                    <div class="imgClickBg" id="imgPrevious" ></div>
                    <div class="cImglist">
                        <ul class="sImgList" id="list">
                            <#if querySingleProuctImageGrp[0]??>
                            <#list querySingleProuctImageGrp as item>
                                <li><img src="<@spring.url '/imgsrc/${item.fileName}'/>" width="110" height="72" onerror="downloadErrImg(this,'${item.fileName}')";)">
                                </li>
                            </#list>
                            <#else >
                                <li><img src="<@spring.url '/images/default.gif'/>" width="110" height="72" >
                                </li>
                            </#if>
                        </ul>
                    </div>
                    <div class="imgClickBg" id="imgNext" ></div>
                </div>
            </div>

            <div class="productInfro">
                <h1>${queryPrdDetail[0].productInfo}</h1>

                <div class="prodBgRed">
                    <span class="marginR10">市场价格：</span>
                    <span class="prodPriceRed" >￥${queryPrdDetail[0].prdPrice}</span>
                </div>

                <div style="position:relative; margin:15px; width:100%; height:22px;">
                    <span class="marginR10" style="float:left; line-height:22px;">积分来源：</span>

                    <div class="exchangeFrom" onclick="exchangeDivOpen()"><span>--请选择--</span><b class="bgImgS"></b></div>
                    <div class="exchangeDiv" style="z-index:9; display:none;">
                        <img src="images/closeImgS.png" width="18" height="17" style="position:absolute; right:-9px; top:-8px; cursor:pointer;" onclick="exchangeDivClose()">

                        <!--<ul class="exchangeDivChassify">
                            <li class="exDivChassifyP">航空业</li>
                            <li>银行业</li>
                        </ul>-->
                        
                        <div class="exchangeDivList">
                            <ul class="exchangeDivPoint jf-overflowH">
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
                         
                    </div>
                </div>

                <div class="margin15">
                    <span class="marginR10">服<b style="display:inline-block; width:27px;"></b>务：</span>
                    <span>配送服务按照地域（北京/江浙沪/珠三角）， 其他地区不提供兑换</span>
                </div>

                <div class="borderD"></div>

                <div class="margin15" style="margin-bottom:0;">
                    <span class="marginR10" style="float:left; line-height:24px; margin-right:0;">选择型号：</span>

                    <div class="priceList">
                        <#list queryPrdAllSpecByPrdNo as queryPrdAllSpecByPrdNoItem>
                            <#if queryPrdAllSpecByPrdNoItem.prdNo == queryPrdDetail[0].prdNo>
                                <a  class="priceItemBRed" href="<@spring.url '/proshow;prdNo=${queryPrdAllSpecByPrdNoItem.prdNo};keyWordsFld=${queryPrdAllSpecByPrdNoItem.prdNo};'/>">${queryPrdAllSpecByPrdNoItem.productSpec}</a>
                            <#else >
                                <a  href="<@spring.url '/proshow;prdNo=${queryPrdAllSpecByPrdNoItem.prdNo};keyWordsFld=${queryPrdAllSpecByPrdNoItem.prdNo};'/>">${queryPrdAllSpecByPrdNoItem.productSpec}</a>
                            </#if>

                        </#list>

                    </div>
                </div>

                <div class="margin15" style="margin-top:5px;">
                    <span class="marginR10" style="float:left; line-height:24px;">数<b style="display:inline-block; width:27px;"></b>量：</span>

                    <div class="numList">
                        <b class="prodMin">-</b>
                        <input type="text" value="1" name="pNum" id="prdnum" class="prodNum">
                        <b class="prodAdd">+</b>
                    </div>
                    <span style="float:left; line-height:24px; margin-left:10px;">(库存 ${queryPrdDetail[0].prdWareNum} 件)</span>
                </div>

                <div class="margin15">
                    <input name="" type="button" value="购买" id="purchaseNow" class="btnBgS prodBuyBtn"><input name="" type="button" value="加入购物车" id="addTo" class="btnBgS prodCartBtn">
                </div>

            </div>
        </div>

        <div class="jf-width1000 jf-overflowH" style="border:1px solid #ddd; border-top:none; margin-top:10px; min-height: 100px;">
            <div class="prodTitel">
                <span class="sapnPitch">商品简介</span>
                <!--<span>商品参数</span>-->
                <span style="width:1049px; border-right:none;"></span>
            </div>
            <div class="margin15">
                <#include "/${queryPrdDetail[0].fileName}" parse=false ignore_missing=true>
            </div>
        </div>
        <!--产品详情 end-->
            
        </div>
        <!--产品 end-->
<!--end 主体-->



<#--合作伙伴-->
<#--<#include "/lib/template/partner.ftl" encoding="UTF-8">-->

<#--footer-->
<#include "/lib/template/footer.ftl" encoding="UTF-8">

</body>
</html>
<script>
$(document).ready(function(){
	//卡/商品图片左右移动
	var lilength = $('#list li').length;
	var currImg = 1;
	$("#imgNext").click(function(){
		var inner = $("#list");
		var i, j = 0;
		for (i = currImg; i <= lilength - 3; i++, j++) {
			if (j == 3)break;
		}
		if (j == 0)return;
		var len = j * 120;
		currImg += j;
		inner.animate({left: '-=' + len + 'px'}, 1000);
	});
	$("#imgPrevious").click(function(){
		var inner = $("#list");
		var i, j = 0;
		for (i = currImg; i > 1; i--, j++) {
			if (j == 3)break;
		}
		if (j == 0)return;
		var len = j * 120;
		currImg -= j;
		inner.animate({left: '+=' + len + 'px'}, 1000);
	})
	//选择卡/商品图片
	$('#list').find('li').eq(0).addClass('imgPitch');
	$('#list li').click(function () {
		var picSrc = $(this).children("img").attr('src');
		$('#bigimg').attr('src', picSrc);
		$('#bigimg1').attr('src', picSrc);
		$('.sImgList  li').removeClass('imgPitch');
		$(this).addClass('imgPitch');
	});


	$("#addTo").click(function (){
		var money = ${queryPrdDetail[0].prdPrice};
		var amount = $("#prdnum").val();
		var prdNo = "${queryPrdDetail[0].prdNo}";
		var isCard = "${queryPrdDetail[0].isCard}";
		var prdWareNum = "${queryPrdDetail[0].prdWareNum}";
		window.location.href = "<@spring.url '/shoppingCart/addCart'/>" + "?prdNo="+prdNo+"&amount="+amount+"&money="+money+"&prdType="+isCard + "&prdWareNum="+prdWareNum;
	})
	
	$("#purchaseNow").click(function (){
		var money = ${queryPrdDetail[0].prdPrice};
		var amount = $("#prdnum").val();
		var prdNo = "${queryPrdDetail[0].prdNo}";
		var prdName = "${queryPrdDetail[0].productInfo}";
		var isCard = "${queryPrdDetail[0].isCard}";
		var fileName = "${queryPrdDetail[0].fileName}";
		//window.location.href = "<@spring.url '/confirmOrder'/>" + ";prdNo="+prdNo+ ";prdName="+prdName+";amount="+amount+";money="+money+";prdType="+isCard + ";fileName=" + fileName;
		window.location.href = "<@spring.url '/confirmOrderNow'/>" + "?prdNo="+prdNo+ "&prdName="+prdName+"&amount="+amount+"&money="+money+"&prdType="+isCard + "&fileName=" + fileName;
	})
	
	//选择积分来源
	$(".exchangeDivPoint li").click(function () {
        var c = $(this).children('.pointComp').text();//公司
        var i = $(this).children('.pointInt').text();//积分区间        
        $('.exchangeFrom span').text(c + ' ' + i);
        exchangeDivClose();
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
})
function exchangeDivOpen() {
	$(".exchangeFrom").addClass("exFromClick");
	$(".exchangeDiv").css("display", "block");
}
function exchangeDivClose() {
	$(".exchangeFrom").removeClass("exFromClick");
	$(".exchangeDiv").css("display", "none");
}
</script>