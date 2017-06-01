<#import "/spring.ftl" as spring/>
<#import "/lib/macro/hisuMacro.ftl" as sf />
<#setting url_escaping_charset = "UTF-8"/>
<!doctype html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <title>积分商城-逸乐生活网</title>
    <meta name="description" content="途皓（北京）商务服务有限公司"/>
    <meta name="keywords" content="途皓（北京）商务服务有限公司"/>
    <link rel="stylesheet" type="text/css" href="<@spring.url '/css/css.css'/>"/>
    <link rel="stylesheet" type="text/css" href="<@spring.url '/css/common.css'/>"/>
    <link rel="stylesheet" type="text/css" href="<@spring.url '/css/model.css'/>"/>
    <script type="text/javascript" src="<@spring.url '/js/jquery.js'/>"></script>
    <script type="text/javascript" src="<@spring.url '/js/util.js'/>"></script>
    <script type="text/javascript" src="<@spring.url '/js/banner.js'/>"></script>
    <script type="text/javascript" src="<@spring.url '/js/menu.js'/>"></script>
    <style>
    	.jf-classifyItem{ margin-bottom: 10px;}
        .jf-classifyItem .lineH87 {
            line-height:25px;
        }

        .classifyItemImg {
            line-height: 25px;
            width: 102px;
        }
        .jf-classifyItemList span{ display: inline-block;}
        .classifyItemImg img{ border:1px solid #ccc;}
        .jf-productName{ width: 260px;}
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

                <#--途皓万能卡-->
                    <div class="jf-classifyItem">
                        <h2 class="jf-classifyItemTitle lineH87">${queryAPCardPrdType[0].mrkPrdCateID}：</h2>
                        <ul class="jf-classifyItemList">
                            <li style=" text-align: left">
                            <#list queryAPCardPrdType as item>
                                <a href="<@spring.url '/pro;realDataGroupId=queryPrdList_apCardGoodClass;mrkPrdCateID=${item.mrkPrdCateID};entPrdSrlNo=${item.entPrdSrlNo};'/>"
                                   index="0" class="classifyItemImg" style="width: 170px;">
                                    <img src="<@spring.url '/imgsrc/'/>${item.iconFileName}" onerror="downloadErrImg(this,'${item.iconFileName}')" width="100" height="60"/>
                                    <span>${item.entPrdSrlNo}</span>
                                </a>
                            </#list>
                            </li>
                        </ul>
                    </div>
                <#--电子卡-->
                    <div class="jf-classifyItem">
                        <h2 class="jf-classifyItemTitle lineH87">电子卡：</h2>
                        <ul class="jf-classifyItemList">
                            <li style=" text-align: left">
                            <#list queryELCardPrdType as item>
                                <a href="<@spring.url '/pro;realDataGroupId=queryPrdList_elCardClass;mrkPrdCateID=${item.mrkPrdCateID};attrValue=${item.attrValue};'/>"
                                   index="0" class="classifyItemImg">
                                    <img src="<@spring.url '/imgsrc/'/>${item.iconFileName}" onerror="downloadErrImg(this,'${item.iconFileName}')" width="100" height="60"/>
                                    <span>${item.attrValue}</span>
                                </a>
                            </#list>
                            </li>
                        </ul>
                    </div>
                <#--礼品卡-->
                    <div class="jf-classifyItem">
                        <h2 class="jf-classifyItemTitle lineH87">礼品卡：</h2>
                        <ul class="jf-classifyItemList">
                            <li style=" text-align: left">
                            <#list queryGiftCardPrdType as item>
                                <a href="<@spring.url '/pro;realDataGroupId=queryPrdList_giftCardClass;mrkPrdCateID=${item.mrkPrdCateID};companyName=${item.companyName};'/>"
                                   index="0" class="classifyItemImg">
                                    <#--<img src="<@spring.url '/imgsrc/'/>${item.iconFileName}" width="100" height="60"/>-->
                                    <span>${item.companyName}</span>
                                </a>
                            </#list>
                            </li>
                        </ul>
                    </div>
                <#--高端商品-->
                    <div class="jf-classifyItem">
                        <h2 class="jf-classifyItemTitle lineH87">高端商品：</h2>
                        <ul class="jf-classifyItemList">
                            <li style=" text-align: left">
                            <#list queryHEPrdType as item>
                                <a href="<@spring.url '/pro;realDataGroupId=queryPrdList_heClass;mrkPrdCateID=${item.mrkPrdCateID};productName=${item.productName};'/>"
                                   index="0" class="classifyItemImg">
                                    <#--<img src="<@spring.url '/imgsrc/'/>${item.iconFileName}" width="100" height="60"/>-->
                                    <span>${item.productName}</span>
                                </a>
                            </#list>
                            </li>
                        </ul>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!--分类 end-->

    <!--产品-->
    <div class="jf-product jf-width1000" style=" padding-bottom:30px;">
    <#if queryPrdListByPrdType_totalRecNum != 0>
    <#list queryPrdListByPrdType as queryPrdListByPrdTypeItem>
        <#if queryPrdListByPrdTypeItem.isCard == "0">
        <div class="jf-productList">
            <a href="<@spring.url '/proshow;prdNo=${queryPrdListByPrdTypeItem.prdNo};keyWordsFld=${queryPrdListByPrdTypeItem.prdNo};'/>"
               target="_blank"><img src="<@spring.url '/imgsrc/${queryPrdListByPrdTypeItem.iconFileName}'/>"
                                    onerror="downloadErrImg(this,'${queryPrdListByPrdTypeItem.iconFileName}')"
                                    width="280" height="182"></a>

            <p>
                <a href="<@spring.url '/proshow;prdNo=${queryPrdListByPrdTypeItem.prdNo};keyWordsFld=${queryPrdListByPrdTypeItem.prdNo};'/>"
                   target="_blank" class="jf-productName">${queryPrdListByPrdTypeItem.productInfo}</a></p>

            <p><span class="jf-productPrice">￥${queryPrdListByPrdTypeItem.prdPrice}</span></p>
        </div>
        <#else >
            <div class="jf-productList">
                <a href="<@spring.url '/proCardshow;prdNo=${queryPrdListByPrdTypeItem.prdNo};keyWordsFld=${queryPrdListByPrdTypeItem.prdNo};'/>"
                   target="_blank"><img src="<@spring.url '/imgsrc/${queryPrdListByPrdTypeItem.iconFileName}'/>"
                                        onerror="downloadErrImg(this,'${queryPrdListByPrdTypeItem.iconFileName}')"
                                        width="280" height="182"></a>

                <p>
                    <a href="<@spring.url '/proCardshow;prdNo=${queryPrdListByPrdTypeItem.prdNo};keyWordsFld=${queryPrdListByPrdTypeItem.prdNo};'/>"
                       target="_blank" class="jf-productName">${queryPrdListByPrdTypeItem.productInfo}</a></p>

                <p><span class="jf-productPrice">￥${queryPrdListByPrdTypeItem.prdPrice}</span></p>
            </div>
        </#if>
    </#list>
    <#else>
        <div style=" text-align: center; width: 500px; height:100px; line-height: 100px; font-size: 16px; font-weight: bold; color: #f60; background: #ffebe7; margin: 50px auto 30px;">抱歉，没有商品，请查看其它分类！</div>
    </#if>
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
    $(document).ready(function (e) {
        //点击浏览全部
        $(".jf-browse").click(function () {
            var h = $(".getHeightDiv").height();
            if ($(".jf-classifyDrop").height() > 0) {
                $(".jf-classifyDrop").animate({height: "0"}, 500);
                $(".jf-browse b").addClass("jf-browseUp");
                $(".jf-classify").css("padding-bottom", "0");
            }
            if ($(".jf-classifyDrop").height() == 0) {
                $(".jf-classifyDrop").animate({height: h + "px"}, 500);
                $(".jf-browse b").removeClass("jf-browseUp");
                $(".jf-classify").css("padding-bottom", "10px");
            }
        })
    })
</script>