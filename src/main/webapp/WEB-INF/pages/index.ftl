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
<!--头部-->


<!--全屏滚动-->

<!--[if lt IE 9]>
 <script src="js/html5.js"></script>
<![endif]-->
<script src="js/jquery-1.7.2.min.js"></script>
<script src="js/jquery.caroufredsel.js"></script>
<script src="js/jquery.touchswipe.min.js"></script>
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
	<div class="carousel-item" style=""><div class="carousel-img"><a href="#" target=""><img src="images/index12.jpg" alt=""/></a></div></div>
	<div class="carousel-item" style=""><div class="carousel-img"><a href="#" target=""><img src="images/index1.jpg" alt=""/></a></div></div>
<!--	<div class="carousel-item" style=""><div class="carousel-img"><a href="#" target=""><img src="images/index3.jpg" alt=""/></a></div></div>
	<div class="carousel-item" style=""><div class="carousel-img"><a href="#" target=""><img src="images/index5.jpg" alt=""/></a></div></div>-->
	<div class="carousel-item" style=""><div class="carousel-img"><a href="#" target=""><img src="images/index6.jpg" alt=""/></a></div></div>
		<div class="carousel-item" style=""><div class="carousel-img"><a href="#" target=""><img src="images/index4.jpg" alt=""/></a></div></div>
    <div class="carousel-item" style=""><div class="carousel-img"><a href="#" target=""><img src="images/index2.jpg" alt=""/></a></div></div>
	</div>
	<div class="carousel-btn carousel-btn-fixed" id="carousel-page-289748"></div>
</div>
<!--end 全屏滚动-->




<!--联系-->
<div class="wjhbg">
	<ul class="ul_wjhli cl">
	<li style="background:#ebebeb url(images/ioc_01.jpg) no-repeat left center;">
	<a href="#" ><h3 style="color:#222B83">衣</h3><span>和小猎豹一起，抢占美味先机，好味道，分享才更好。</span><em>more ></em></a>
	</li>
	<li style="background:#ebebeb url(images/ioc_02.jpg) no-repeat left center;"><a href="#" ><h3 style="color:#1265B0">食</h3><span>和小猎豹一起，抢占美味先机，好味道，分享才更好。</span><em>more ></em></a></li>
	<li style="background:#ebebeb url(images/ioc_03.jpg) no-repeat left center;"><a href="#" ><h3 style="color:#E35318">住</h3><span>和小猎豹一起，抢占美味先机，好味道，分享才更好。</span><em>more ></em></a></li>
	<li  style="background:#ebebeb url(images/ioc_04.jpg) no-repeat left center;margin-right:0px;"><a href="#"><h3 style="color:#EB8C10">行</h3><span>和小猎豹一起，抢占美味先机，好味道，分享才更好。</span><em>more ></em></a></li>
	<ul>
</div>
<!--end 联系-->

  

 
<div class="cp_boxtt">
 <script language="javascript" type="text/javascript">
    function myfunctions1(ids1, left1, right1) {
        var ads = new ScrollPicleft();
        ads.scrollContId = ids1; // 内容容器ID""
        ads.arrLeftId = left1; //左箭头ID
        ads.arrRightId = right1; //右箭头ID
        ads.frameWidth = 1155;  //显示框宽度
        ads.pageWidth =1155; //翻页宽度
        ads.speed = 10; //移动速度(单位毫秒，越小越快)
        ads.space = 10; //每次移动像素(单位px，越大越快)
        ads.autoPlay = true; //自动播放
        ads.autoPlayTime = 3; //自动播放间隔时间(秒)
        ads.initialize(); //初始化
    }
</script>
	<article class="container text-center">
<h2 class="h-h2">合作伙伴</h2>
	</article>

    <#--footer-->
<#include "/lib/template/footer.ftl" encoding="UTF-8">
</body>
</html>