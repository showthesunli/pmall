﻿<#import "/spring.ftl" as spring/>
<#import "/lib/macro/hisuMacro.ftl" as sf />
<#setting url_escaping_charset = "UTF-8"/>
<!doctype html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<title>积分商城-逸乐生活网</title>
<meta name="description" content="途皓（北京）商务服务有限公司" />
<meta name="keywords" content="途皓（北京）商务服务有限公司" />
<link rel="stylesheet" type="text/css" href="<@spring.url '/css/css.css'/>"/>
<link rel="stylesheet" type="text/css" href="<@spring.url '/css/common.css'/>"/>
<link rel="stylesheet" type="text/css" href="<@spring.url '/css/model.css'/>"/>
<script type="text/javascript" src="<@spring.url '/js/jquery.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/js/util.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/js/banner.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/js/menu.js'/>" ></script>
<style>
.jf-classifyItem .lineH87{ line-height: 87px;}
.classifyItemImg{ line-height: 25px; width: 102px;}	
</style>
</head>
<body>
<!--头部-->
<#include "/lib/template/header.ftl" encoding="UTF-8">
<!--头部-->
<!--主体-->
<div class="jf-main">
        <!--分类-->
        <div class="jf-classify">
            <div class="jf-width1000">
                <div class="jf-overflowH">
                    <h1 class="jf-classifyTitle">分类</h1>
                    <span class="jf-browse">浏览全部<b class="bgImgS"></b></span>
                </div>
                <div class="jf-classifyDrop">
                	
                	<div class="getHeightDiv">
                	
                	<div class="jf-classifyItem">
                        <h2 class="jf-classifyItemTitle lineH87">${queryCardPrdType[0].parentAttrID}：</h2>
                        <ul class="jf-classifyItemList">
                            <li style=" text-align: left">
                                <#list queryCardPrdType as item>
                                    <a href="<@spring.url '/pro;mrkPrdCateID=${item.parentAttrID};productName=${item.attrID};'/>" index="0" class="classifyItemImg">
                                        <img src="<@spring.url '/images/about3.jpg'/>" width="100" height="60" />
                                        <span>${item.attrID}</span>
                                    </a>
                                </#list>
                            </li>
                        </ul>
                    </div>
                    
                <#list queryPrdTypeByHeadType?keys as key>
                    <div class="jf-classifyItem">
                        <h2 class="jf-classifyItemTitle">${key}：</h2>
                        <ul class="jf-classifyItemList">
                            <li class=""><a href="<@spring.url '/pro;mrkPrdCateID=${key?url}'/>" index="0">全部</a></li>
                            <#list queryPrdTypeByHeadType["${key}"] as type>
                                <li style=" text-align: left"><a href="<@spring.url '/pro;mrkPrdCateID=${key?url};productName=${type.attrID?url};'/>" index="0">${type.attrID}</a></li>
                            </#list>
                        </ul>
                    </div>
                </#list>
                
                	</div>
                	
                </div>
            </div>
        </div>
        <!--分类 end-->

        <!--产品-->
        <div class="jf-product jf-width1000" style=" padding-bottom:30px;">
            <#list queryPrdListByPrdType as queryPrdListByPrdTypeItem>
                <div class="jf-productList">
                    <a href="<@spring.url '/proshow;prdNo=${queryPrdListByPrdTypeItem.prdNo};keyWordsFld=${queryPrdListByPrdTypeItem.prdNo};'/>" target="_blank"><img src="<@spring.url '/imgsrc/${queryPrdListByPrdTypeItem.iconFileName}'/>" onerror="downloadErrImg(this,'${queryPrdListByPrdTypeItem.iconFileName}')" width="280" height="182"></a>
                    <p><a href="<@spring.url '/proshow;prdNo=${queryPrdListByPrdTypeItem.prdNo};keyWordsFld=${queryPrdListByPrdTypeItem.prdNo};'/>" target="_blank" class="jf-productName">${queryPrdListByPrdTypeItem.productInfo}</a></p>
                    <p><span class="jf-productPrice">￥${queryPrdListByPrdTypeItem.prdPrice}</span></p>
                </div>
            </#list>
        </div>
        <!--产品 end-->

    <#--分页 当前页，参与分页的总记录数，每页记录数-->
    <#if queryPrdListByPrdType_totalRecNum??>
        <@sf.pageset currentPage queryPrdListByPrdType_totalRecNum numOfPerPage "pro"></@sf.pageset>
    </#if>
    <!--end 主体-->

    <#--合作伙伴-->
<#--<#include "/lib/template/partner.ftl" encoding="UTF-8">-->
<#--footer-->
<#include "/lib/template/footer.ftl" encoding="UTF-8">

</body>
</html>
<script>
$(document).ready(function(e) {	
	//点击浏览全部	
	$(".jf-browse").click(function(){
		var h = $(".getHeightDiv").height();
		if ($(".jf-classifyDrop").height() > 0){
			$(".jf-classifyDrop").animate({height:"0"},500);
			$(".jf-browse b").addClass("jf-browseUp");
			$(".jf-classify").css("padding-bottom","0");
		}
		if($(".jf-classifyDrop").height() == 0){
			$(".jf-classifyDrop").animate({height: h + "px"},500);
			$(".jf-browse b").removeClass("jf-browseUp");
			$(".jf-classify").css("padding-bottom","10px");
		}
	})		
})
</script>