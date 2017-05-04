<#import "/spring.ftl" as spring/>
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
<script type="text/javascript" src="<@spring.url '/js/gd_Index.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/js/jquery.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/js/banner.js'/>"></script>
<script language="javascript" src="<@spring.url '/js/menu.js'/>" ></script>
<script type="text/javascript" src="<@spring.url '/js/model.js'/>"></script>
<style>
.productInfro span{ font-size: 12px; color: #666;}
.productInfro .priceList div{ font-size: 12px; color: #666;}
.priceList .priceItemBRed,.priceList a:hover{ border:1px solid #ff6600;}
</style>
</head>
<body>
    <!--头部-->
    <#include "/lib/template/header.ftl" encoding="UTF-8">
    <!--end 头部-->


    <!--主体-->
    <div class="jf-main">
        <div style="background:#f3f3f3; width:100%;">
            <div class="ny_nav" style="padding:5px 0;">
                <div class="ny_nav1">当前位置：<a href='<@spring.url "/index"/>'>首页</a> > <a href='<@spring.url "/onlinePurchase"/>'>在线购卡</a></div>
                <div class="clearfix"></div>
            </div>
        </div>

        <!--产品详情-->
        <div class="jf-width1000 jf-overflowH">
            <div class="cIntroImg con-FangDa" id="fangdajing">
                <div class="picBig con-fangDaIMg">
                    <a href="#" class="bImg"><img src="<@spring.url '/images/proImg/onlinePImg1.png'/>" onerror="downloadErrImg(this,&#39;447-1-55&#39;)" width="430" height="280" id="bigimg"></a>

                    <!-- 滑块-->
                    <div class="magnifyingBegin" style="display: none; left: 215px; top: 140px; "></div>
                    <!-- 放大镜显示的图片 -->
                    <div class="magnifyingShow" style="display: none; "><img src="<@spring.url '/images/proImg/onlinePImg1.png'/>" onerror="downloadErrImg(this,&#39;447-1-55&#39;)" id="bigimg1" style="margin-left: -516px; margin-top: -336px; "></div>

                </div>
                <div class="jf-overflowH" style=" width:430px; margin-top:10px;">
                    <div class="imgClickBg" id="imgPrevious" onclick="imgPrevious()"></div>
                    <div class="cImglist">
                        <ul class="sImgList" id="list">
                            
                            <li class="imgPitch"><img src="<@spring.url '/images/proImg/onlinePImg1.png'/>" width="110" height="72" onerror="downloadErrImg(this,&#39;447-1-55&#39;)"></li>
                            <li><img src="<@spring.url '/images/proImg/onlinePImg2.png'/>" width="110" height="72" onerror="downloadErrImg(this,&#39;447-1-55&#39;)"></li>
                            <li><img src="<@spring.url '/images/proImg/onlinePImg3.png'/>" width="110" height="72" onerror="downloadErrImg(this,&#39;447-1-55&#39;)"></li>
                            
                        </ul>
                    </div>
                    <div class="imgClickBg" id="imgNext" onclick="imgNext()"></div>
                </div>
            </div>

            <div class="productInfro">
                <h1>逸乐生活积分卡</h1>

                <div class="prodBgRed" style="background:#f3f3f3;">
                    <span class="marginR10">现金价格：</span>
                    <span class="prodPriceRed" style="font-size:18px; font-weight:bold; color:#ff6600;">￥1000.00</span>
                </div>

                <div style="position:relative; margin:15px 15px 5px; width:100%; height:22px;">
                    <span class="marginR10" style="float:left; line-height:22px;">配 送 至：</span>

                    <div class="exchangeFrom" onclick="exchangeDivOpen()" style="font-size:12px; color#666;">--请选择--<b class="bgImgS"></b></div>
                    <div class="exchangeDiv" style="z-index:9; display:none;">
                        <img src="images/closeImgS.png" width="18" height="17" style="position:absolute; right:-9px; top:-8px; cursor:pointer;" onclick="exchangeDivClose()">

                        <ul class="exchangeDivChassify">
                            <li id="c0" class="exDivChassifyP">航空业</li>
                        </ul>
                        
                        <div class="exchangeDivList" id="l-c0">
                            <ul class="exchangeDivPoint jf-overflowH">
                                <li class="exPoint">12000-18000
                                </li>
                            </ul>
                            <ul class="exchangeDivItem">
                                
                                <li>南方航空
                                    <div class="exCDivH"><b></b>
                                        <span>会员账户：5000分</span>
                                    </div>
                                </li>
                                
                                <li>东方航空
                                    <div class="exCDivH"><b></b>
                                        <span>会员账户：500000分</span>
                                    </div>
                                </li>
                                
                            </ul>
                        </div>
                        
                    </div>
                </div>

                <div style=" font-size: 12px; color: #666; text-indent:80px;">由 逸乐生活 发货，并提供售后服务。23:00前下单,预计明天(04月28日)送达</div>

                <div class="margin15">
                    <span class="marginR10">重<b style="display:inline-block; width:24px;"></b>量：</span>
                    <span>0.006kg</span>
                </div>

                <div class="borderD"></div>

                <div class="margin15" style="margin-bottom:0;">
                    <span class="marginR10" style="float:left; line-height:24px; margin-right:0;">选择面额：</span>

                    <div class="priceList">
                        
                        <a class="priceItemBRed" href="javascript:void(0);" style="height:30px; line-height:30px; padding:5px 10px;"><img src="<@spring.url '/images/proImg/onlinePImg1.png'/>" width="47" height="30" style="float:left" /><span style="float:left; margin-left:5px;">1000</span></a>

                        <a href="javascript:void(0);" style="height:30px;line-height:30px; padding:5px 10px"><img src="<@spring.url '/images/proImg/onlinePImg2.png'/>" width="47" height="30" style="float:left" /><span style="float:left; margin-left:5px;">500</span></a>

                        <a href="javascript:void(0);" style="height:30px;line-height:30px; padding:5px 10px"><img src="<@spring.url '/images/proImg/onlinePImg3.png'/>" width="47" height="30" style="float:left" /><span style="float:left; margin-left:5px;">100</span></a>
                        
                    </div>
                </div>

                <div class="margin15" style="margin-top:5px;">
                    <span class="marginR10" style="float:left; line-height:24px;">数<b style="display:inline-block; width:24px;"></b>量：</span>

                    <div class="numList">
                        <b class="prodMin">-</b>
                        <input type="text" value="1" name="pNum" id="prdnum" class="prodNum">
                        <b class="prodAdd">+</b>
                    </div>
                    <span style="float:left; line-height:24px; margin-left:10px;">(库存 <b class="stock">6</b> 件)</span>
                </div>

                <div class="margin15">
                    <input name="" type="button" value="加入购物车" onclick="addTo()" class="btnBgS prodBuyBtn">
                </div>

            </div>
        </div>

        <div class="jf-width1000 jf-overflowH" style="border:1px solid #ddd; border-top:none; margin-top:10px;">
            <div class="prodTitel">
                <span class="sapnPitch">商品简介</span>
                <span>商品参数</span>
                <span style="width:898px; border-right:none;"></span>
            </div>
            <div class="margin15">
                <p><img src="<@spring.url '/images/proImg/onlinePImg1.png'/>"></p>
                <p><img src="<@spring.url '/images/proImg/onlinePImg2.png'/>"></p>
                <p><img src="<@spring.url '/images/proImg/onlinePImg3.png'/>"></p>
            </div>
        </div>
        <!--产品详情 end-->

    </div>
    <!--end 主体-->

 
 
    
    <!--合作伙伴-->
    <#include "/lib/template/partner.ftl" encoding="UTF-8">
    <!--end 合作伙伴-->

    <!--底部-->
    <#include "/lib/template/footer.ftl" encoding="UTF-8">
    <!--end 底部-->
    
<script type="text/javascript">
$(document).ready(function(){
    //卡图片左右移动
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
    //选择卡图片
    $('#list li').click(function () {
        var picSrc = $(this).children("img").attr('src');
        $('#bigimg').attr('src', picSrc);
        $('#bigimg1').attr('src', picSrc);
        $('.sImgList  li').removeClass('imgPitch');
        $(this).addClass('imgPitch');
    });
    //选择面额
    $(".priceList a").click(function () {
        var price = $(this).find('span').html();
        $(".priceList a").removeClass("priceItemBRed");
        $(this).addClass("priceItemBRed");
        $(".prodPriceRed").html('￥' + price);
    })
    //数量减
    $(".prodMin").click(function () {
        var v = $(this).next(".prodNum").attr("value");
        var num = parseInt(v) - 1;
        if (parseInt(v) == 1) {$(this).next(".prodNum").val(1);}
        else {$(this).next(".prodNum").val(num);}
    });
    //数量加
    $(".prodAdd").click(function () {
        var v = $(this).prev(".prodNum").attr("value");
        var s = $('.stock').text();
        var num;
        if(v < parseInt(s)){num = parseInt(v) + 1;}
        else{num = parseInt(s);}
        $(this).prev(".prodNum").val(num);
    });
})
</script>
</body>
</html>
