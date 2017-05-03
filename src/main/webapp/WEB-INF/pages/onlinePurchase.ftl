<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<title>在线购卡-逸乐生活网</title>
<meta name="description" content="途皓（北京）商务服务有限公司" />
<meta name="keywords" content="途皓（北京）商务服务有限公司" />
<link rel="stylesheet" type="text/css" href="css/css.css"/>
<script type="text/javascript" src="<@spring.url '/js/gd_Index.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/js/jquery.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/js/banner.js'/>"></script>
<script language="javascript" src="<@spring.url '/js/menu.js'/>" ></script>
<script type="text/javascript" src="<@spring.url '/js/model.js'/>"></script>
<style>
.caseList p{ height:30px; text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width: 510px; padding:0;}
.eCard,.entityCard{ width:550px; float:left; background:#f2f2f2; padding:25px 20px;}
.entityCard{ float:right;}
.eCard h1,.entityCard h1{ line-height:30px; font-size:18px; font-weight:bold; text-align:center; margin-bottom:20px;}
.eCardItem,.entityCardItem{ overflow:hidden; margin-bottom:20px; background:#fff; padding:19px; text-align:center; border:1px solid #f2f2f2;}
.eCardItem h2 a,.entityCard h2 a{ font-size:16px;}
.caseList h2 a:hover{ color:#f60;}
.caseList>div>div:hover{ border:1px solid #f60;}
</style>
</head>
<body>
  <!--头部-->
  <#include "/lib/template/header.ftl" encoding="UTF-8">
  <!--end 头部-->

  <!--banner--> 
  <div style="background:url('images/titleTag/b_online.jpg') no-repeat center top;height:150px;"></div>
  <!--endbanner-->

  <!--主体-->
  <div class="main">

    <div class="ny_nav">
      <div class="ny_nav1">当前位置：<a href='<@spring.url "/index"/>'>首页</a> > <a href='<@spring.url "/onlinePurchase"/>'>在线购卡</a></div>
      <div class="clearfix"></div>
    </div>

    <div class='caseList' style=" background:#f2f2f2;">
      <div class="eCard">
        <h1>E卡</h1>
        <div class="eCardItem">
          <a href="<@spring.url "/purchaseshow"/>" target="_blank"><img src="<@spring.url '/images/proImg/pointCard1.png'/>" /></a>
          <div>
            <h2><a href='<@spring.url "/purchaseshow"/>' target="_blank">逸乐生活积分卡一</a></h2>
            <p>途皓以各类客户的会员为主要服务对象，利用综合性的积分兑换平台为客户提供高质量、低成本的会员忠诚度方案。平台通过先进的网络平台、便捷的线下POS...</p>
          </div>
        </div>
        <div class="eCardItem">
          <a href="<@spring.url "/purchaseshow"/>" target="_blank"><img src="<@spring.url '/images/proImg/pointCard1.png'/>" /></a>
          <div>
            <h2><a href='<@spring.url "/purchaseshow"/>' target="_blank">逸乐生活积分卡二</a></h2>
            <p>途皓以各类客户的会员为主要服务对象，利用综合性的积分兑换平台为客户提供高质量、低成本的会员忠诚度方案。平台通过先进的网络平台、便捷的线下POS...</p>
          </div>
        </div>
        <div class="eCardItem">
          <a href="<@spring.url "/purchaseshow"/>" target="_blank"><img src="<@spring.url '/images/proImg/pointCard1.png'/>" /></a>
          <div>
            <h2><a href='<@spring.url "/purchaseshow"/>' target="_blank">逸乐生活积分卡三</a></h2>
            <p>途皓以各类客户的会员为主要服务对象，利用综合性的积分兑换平台为客户提供高质量、低成本的会员忠诚度方案。平台通过先进的网络平台、便捷的线下POS...</p>
          </div>
        </div>
      </div>
      <div class="entityCard">
        <h1>实体卡</h1>
        <div class="entityCardItem">
          <a href="<@spring.url "/purchaseshow"/>" target="_blank"><img src="<@spring.url '/images/proImg/pointCard1.png'/>" /></a>
          <div>
            <h2><a href='<@spring.url "/purchaseshow"/>' target="_blank">逸乐生活积分卡一</a></h2>
            <p>途皓以各类客户的会员为主要服务对象，利用综合性的积分兑换平台为客户提供高质量、低成本的会员忠诚度方案。平台通过先进的网络平台、便捷的线下POS...</p>
          </div>
        </div>
        <div class="entityCardItem">
          <a href="<@spring.url "/purchaseshow"/>" target="_blank"><img src="<@spring.url '/images/proImg/pointCard1.png'/>" /></a>
          <div>
            <h2><a href='<@spring.url "/purchaseshow"/>' target="_blank">逸乐生活积分卡二</a></h2>
            <p>途皓以各类客户的会员为主要服务对象，利用综合性的积分兑换平台为客户提供高质量、低成本的会员忠诚度方案。平台通过先进的网络平台、便捷的线下POS...</p>
          </div>
        </div>
        <div class="entityCardItem">
          <a href="<@spring.url "/purchaseshow"/>" target="_blank"><img src="<@spring.url '/images/proImg/pointCard1.png'/>" /></a>
          <div>
            <h2><a href='<@spring.url "/purchaseshow"/>' target="_blank">逸乐生活积分卡三</a></h2>
            <p>途皓以各类客户的会员为主要服务对象，利用综合性的积分兑换平台为客户提供高质量、低成本的会员忠诚度方案。平台通过先进的网络平台、便捷的线下POS...</p>
          </div>
        </div>
      </div>
    </div>

    <div class="clear"></div>
    <!--<div class="page"><a class="a1">22条</a> <a href="javascript:void(0);" class="a1">上一页</a> <span>1</span> <a href="javascript:void(0);">2</a> <a href="/h/khxx/3.html">3</a> <a href="javascript:void(0);" class="a1">下一页</a></div>-->
    	
  </div> 
  <!--end 主体-->

  <!--合作伙伴-->
  <#include "/lib/template/partner.ftl" encoding="UTF-8">
  <!--end 合作伙伴-->

  <!--底部-->
  <#include "/lib/template/footer.ftl" encoding="UTF-8">
  <!--end 底部-->
  
</body>
</html>
