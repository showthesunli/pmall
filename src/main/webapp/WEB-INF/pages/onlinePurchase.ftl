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
.caseList p{ height:150px; width: 510px; padding:0;}
.eCard,.entityCard{ width:590px; float:left;}
.entityCard{ float:right;}
.eCardItem,.entityCardItem{ overflow:hidden; margin-bottom:20px; background:#fff; padding:25px; text-align:center; border:1px solid #F2F2F2;}
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

    <div style=" background:#F6F6F6; width:100%; overflow: hidden; min-width:1200px;">
    <div class='caseList' style=" overflow: hidden; margin-top:20px; margin-bottom:0;">
      <div class="eCard">
        <div class="eCardItem">
          <a href="<@spring.url "/proCardshow;prdNo=011423;keyWordsFld=011423;"/>" target="_blank"><img src="<@spring.url '/images/about3.jpg'/>" width="540" height="380" /></a>
          <div>
            <h2><a href='<@spring.url "/proCardshow;prdNo=011423;keyWordsFld=011423;"/>' target="_blank">逸乐生活积分卡（E卡）</a></h2>
            <p>途皓以各类客户的会员为主要服务对象，利用综合性的积分兑换平台为客户提供高质量、低成本的会员忠诚度方案。平台通过先进的网络平台、便捷的线下POS、24小时的电话服务，满足不同层次会员的兑换方式喜好；通过不定期、多样性的市场活动持续刺激会员，增强会员粘性度，并激活存量休眠客户；通过积分汇集功能将孤立小积分汇集成商户联盟大积分，增强会员积分价值感；通过商户联盟，为积分兑换打通衣、食、住、行、教育、培训及娱乐等各行业，形成全方位的、线上线下的全覆盖服务；在帮助客户消化积分、提高会员满意度的同时，导入其他中高端客户群的积分消费，为客户带来额外业务收入。</p>
          </div>
        </div>
      </div>
      <div class="entityCard">
        <div class="entityCardItem">
          <a href="<@spring.url "/proCardshow;prdNo=X443241;keyWords=X443241;"/>" target="_blank"><img src="<@spring.url '/images/about3.jpg'/>" width="540" height="380" /></a>
          <div>
            <h2><a href='<@spring.url "/proCardshow;prdNo=X443241;keyWords=X443241;"/>' target="_blank">逸乐生活积分卡（实体卡）</a></h2>
            <p>途皓以各类客户的会员为主要服务对象，利用综合性的积分兑换平台为客户提供高质量、低成本的会员忠诚度方案。平台通过先进的网络平台、便捷的线下POS、24小时的电话服务，满足不同层次会员的兑换方式喜好；通过不定期、多样性的市场活动持续刺激会员，增强会员粘性度，并激活存量休眠客户；通过积分汇集功能将孤立小积分汇集成商户联盟大积分，增强会员积分价值感；通过商户联盟，为积分兑换打通衣、食、住、行、教育、培训及娱乐等各行业，形成全方位的、线上线下的全覆盖服务；在帮助客户消化积分、提高会员满意度的同时，导入其他中高端客户群的积分消费，为客户带来额外业务收入。</p>
          </div>
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
