<#import "/spring.ftl" as spring/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>回重新操作-逸乐生活网</title>
<link rel="stylesheet" type="text/css" href="<@spring.url '/css/css.css'/>"/>
<link rel="stylesheet" type="text/css" href="<@spring.url '/css/style.css'/>"/>
<script type="text/javascript" src="<@spring.url '/js/gd_Index.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/js/jquery.js'/>"></script>
<script language="javascript" src="<@spring.url '/js/menu.js'/>" ></script>
<style>
.addToSucc{ text-align:center; font-size:12px; color:#666; background:#ffefe5; width:600px; margin:100px auto; padding:80px 0;}
.addToSTitle{ font-size:16px; font-weight:bold; color:#f60;}
.addToSucc a{ text-decoration: underline; color: #3897d7; margin: 0 3px;}
</style>
</head>

<body>
    <!--头部-->
    <#include "/lib/template/header.ftl" encoding="UTF-8">
    <!--end 头部-->
        
    <div class="jf-main">
         	            
		<div class="jf-width1000 jf-overflowH" style="background:#fff; margin:10px auto;">
            <div class="addToSucc jf-overflowH">
                <p class="addToSTitle">页面放置太久，请返回重新<a href='<@spring.url "/index"/>'>操作</a></p>
    
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
