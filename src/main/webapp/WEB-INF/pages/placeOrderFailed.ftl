<#import "/spring.ftl" as spring/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>提交订单错误-逸乐生活网</title>
<link rel="stylesheet" type="text/css" href="<@spring.url '/css/css.css'/>"/>
<link rel="stylesheet" type="text/css" href="<@spring.url '/css/style.css'/>"/>
<script type="text/javascript" src="<@spring.url '/js/gd_Index.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/js/jquery.js'/>"></script>
<script language="javascript" src="<@spring.url '/js/menu.js'/>" ></script>
<style>
.addToSucc{ text-align:center; font-size:12px; color:#666; background:#ffefe5; width:600px; margin:50px auto; padding:20px;}
.addToSTitle{ font-size:18px; font-weight:bold; color:#f60;}
.addToSucc a{ font-size:14px; font-weight:bold; display:inline-block; padding:0 20px; line-height:40px; text-align:center; margin:0 5px;}
.conToShop{ background-position: 0 -117px; border: 1px solid #ccc; color: #999;}
.conToShop:hover{ text-decoration:none; color:#999;}
.entityShopBtn:hover{ color:#fff;}
.entityShopBtn{ color:#fff; padding:0 30px;  border: 1px solid #f60;
  background: -webkit-linear-gradient(#fda061,#f60); /* Safari 5.1 - 6.0 */
  background: -o-linear-gradient(#fda061,#f60); /* Opera 11.1 - 12.0 */
  background: -moz-linear-gradient(#fda061,#f60); /* Firefox 3.6 - 15 */
  background: linear-gradient(#fda061,#f60);}
.showText{ min-height:50px; text-align:left; font-size:14px; padding:20px;}
.showText p{ overflow:hidden; line-height:25px;}
.showText span{ display:inline-block; float:left; color:#666;}
</style>
</head>

<body>
    <!--头部-->
    <#include "/lib/template/header.ftl" encoding="UTF-8">
    <!--end 头部-->
        
    <div class="jf-main">
        <div class="ny_nav">
            <div class="ny_nav1">当前位置：<a href='<@spring.url "/index"/>'>首页</a> > <a href='<@spring.url "/shoppingCart"/>'>购物车</a> > 下单错误</div>
            <div class="clearfix"></div>
        </div>
        	            
		<div class="jf-width1000 jf-overflowH" style="background:#fff; margin:10px auto;">
            <div class="addToSucc jf-overflowH">
                <p class="addToSTitle">下单出错！</p>
                <div class="showText">
                    <p><span style="width:70px;">订单产品：</span><span style="width:490px;">订单产品信息</span></p>
                </div>
                <p style="margin-top:20px;">
                    <a href='<@spring.url "/shoppingCart"/>' class="entityShopBtn">< 返回购物车</a>
                </p>
            </div>
        </div>
                        
    </div>
        
    <!--合作伙伴-->
    <#include "/lib/template/partner.ftl" encoding="UTF-8">
    <!--end 合作伙伴-->

    <!--底部-->
    <#include "/lib/template/footer.ftl" encoding="UTF-8">
    <!--end 底部-->
        
</body>

</html>
