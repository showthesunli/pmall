<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<title>逸乐生活网</title>
<meta name="description" content="途皓（北京）商务服务有限公司" />
<meta name="keywords" content="途皓（北京）商务服务有限公司" />
<link rel="stylesheet" type="text/css" href="<@spring.url '/css/css.css'/>"/>
<link rel="stylesheet" type="text/css" href="<@spring.url '/css/style.css'/>"/>
<script type="text/javascript" src="<@spring.url '/js/gd_Index.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/js/jquery.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/js/banner.js'/>"></script>
<script language="javascript" src="<@spring.url '/js/menu.js'/>" ></script>
</head>
<body>
    <!--头部-->
    <#include "/lib/template/header.ftl" encoding="UTF-8">
    <!--end 头部-->

    <!--全屏滚动-->
    <!--[if lt IE 9]>
    <script src="<@spring.url '/js/html5.js'/>"></script>
    <![endif]-->
    <script src="<@spring.url '/js/jquery-1.7.2.min.js'/>"></script>
    <script src="<@spring.url '/js/jquery.caroufredsel.js'/>"></script>
    <script src="<@spring.url '/js/jquery.touchswipe.min.js'/>"></script>
    <script type="text/javascript">
    $(window).load(function(){
        $("#responsive-289748").carouFredSel({
            responsive : true,
            width       : '100%',
            items  : { visible : 1 },
            auto     : { pauseOnHover: true, timeoutDuration:5000 },
            swipe     : { onTouch:true, onMouse:true },
            pagination  : "#carousel-page-289748"
            //prev   : { button:"#carousel-prev-289748"},
            //next   : { button:"#carousel-next-289748"},
            //scroll : { fx : "coverfade", duration : 1200, timeoutDuration : 1500 }  
        });  
        $("#responsive-289748 .carousel-item").show();
    });
    </script>

    <div class="responsive-carousel carousel clearfix">
        <div id="responsive-289748">
            <div class="carousel-item"><div class="carousel-img"><a href="javascript:void(0);" target=""><img src="<@spring.url '/images/index12.jpg'/>" alt=""/></a></div></div>
            <div class="carousel-item"><div class="carousel-img"><a href="javascript:void(0);" target=""><img src="<@spring.url '/images/index1.jpg'/>" alt=""/></a></div></div>
            <!--<div class="carousel-item"><div class="carousel-img"><a href="javascript:void(0);" target=""><img src="<@spring.url '/images/index3.jpg'/>" alt=""/></a></div></div>
            <div class="carousel-item"><div class="carousel-img"><a href="javascript:void(0);" target=""><img src="<@spring.url '/images/index5.jpg'/>" alt=""/></a></div></div>-->
            <div class="carousel-item"><div class="carousel-img"><a href="javascript:void(0);" target=""><img src="<@spring.url '/images/index6.jpg'/>" alt=""/></a></div></div>
            <div class="carousel-item"><div class="carousel-img"><a href="javascript:void(0);" target=""><img src="<@spring.url '/images/index4.jpg'/>" alt=""/></a></div></div>
            <div class="carousel-item"><div class="carousel-img"><a href="javascript:void(0);" target=""><img src="<@spring.url '/images/index2.jpg'/>" alt=""/></a></div></div>
	   </div>
	   <div class="carousel-btn carousel-btn-fixed" id="carousel-page-289748"></div>
    </div>
    <!--end 全屏滚动-->

    <!--联系-->
    <div class="wjhbg">
    	<ul class="ul_wjhli cl">
    	   <li style="background:#ebebeb url(images/ioc_01.jpg) no-repeat left center;"><a href="javascript:void(0);" ><h3 style="color:#222B83">衣</h3><span>和小猎豹一起，抢占美味先机，好味道，分享才更好。</span><em>more ></em></a></li>
    	   <li style="background:#ebebeb url(images/ioc_02.jpg) no-repeat left center;"><a href="javascript:void(0);" ><h3 style="color:#1265B0">食</h3><span>和小猎豹一起，抢占美味先机，好味道，分享才更好。</span><em>more ></em></a></li>
    	   <li style="background:#ebebeb url(images/ioc_03.jpg) no-repeat left center;"><a href="javascript:void(0);" ><h3 style="color:#E35318">住</h3><span>和小猎豹一起，抢占美味先机，好味道，分享才更好。</span><em>more ></em></a></li>
    	   <li  style="background:#ebebeb url(images/ioc_04.jpg) no-repeat left center;margin-right:0px;"><a href="javascript:void(0);"><h3 style="color:#EB8C10">行</h3><span>和小猎豹一起，抢占美味先机，好味道，分享才更好。</span><em>more ></em></a></li>
    	<ul>
    </div>
    <!--end 联系-->

    <!--合作伙伴-->
    <#include "/lib/template/partner.ftl" encoding="UTF-8">
    <!--end 合作伙伴-->

    <!--底部-->
    <#include "/lib/template/footer.ftl" encoding="UTF-8">
    <!--end 底部-->

</body>
</html>