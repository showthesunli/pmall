<#import "/spring.ftl" as spring/>
<#import "/lib/macro/hisuMacro.ftl" as sf />
<!doctype html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<title>我的卡片-逸乐生活网</title>
<meta name="description" content="途皓（北京）商务服务有限公司" />
<meta name="keywords" content="途皓（北京）商务服务有限公司" />
<link rel="stylesheet" type="text/css" href="<@spring.url '/css/css.css'/>"/>
<link rel="stylesheet" type="text/css" href="<@spring.url '/css/style.css'/>"/>
<script type="text/javascript" src="<@spring.url '/js/gd_Index.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/js/jquery.js'/>"></script>
<script language="javascript" src="<@spring.url '/js/menu.js'/>" ></script>
<style>
.rightOrder{ padding:0;}
.rightOrder h2{font-size:14px;}
.page{ padding-top:20px;}
td{ overflow:hidden; height:30px;}
.orderBtn a{ color:#3897d7; margin-left:10px;}
.orderBtn a:hover{ text-decoration:underline;}
.orderBtn .orderPaid{ color:#999; cursor:default;}
.orderBtn .orderPaid:hover{ text-decoration:none;}
.orderTable td{ margin:5px 0;}
.orderTable a{ overflow:hidden;}
.orderTable img{ float:left;}
.orderTable span{ float:left;}
.tipDiv{ width:500px; min-height:200px; margin:-100px 0 0 -250px;}
.tipShow{ margin:20px;font-size:14px; font-weight:bold; color:#f60; min-height:95px;}
.tipShow span{ width:60px; display:inline-block; float:left; text-align:right;}
.tipShow p{ overflow:hidden; line-height:25px; margin-top:10px;}
.tipShow #myCardNo,.tipShow #myCardPsw{ width:390px; margin-left:10px; text-align:left;word-wrap:break-word;}
</style>
</head>

<body>
    <!--头部-->
    <#include "/lib/template/header.ftl" encoding="UTF-8">
    <!--end 头部-->

    <div class="main">
        <div style="width:100%; background: #f3f3f3; height:30px;"></div>
        <div class="memberMain">

            <!--左边-->
            <#include "/lib/template/left.ftl" encoding="UTF-8">
            <!--end 左边-->

            <div class="memberMain-Right">
                <h1 class="baseinfo-Title">我的卡片</h1>
                <div class="rightOrder">
                    <div>
                        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="orderTable">
                            <tr>
                                <th width="30%">卡号</th>
                                <th width="15%">卡类型</th>
                                <th width="15%">金额</th>
                                <th width="20%">操作</th>
                                <th>状态</th>
                            </tr>
                            <#list selectPersonalCard as item>
                                <tr>
                                    <td class="cardNo"><a href="">${item.cardNo}</a></td>
                                    <td class="cardType">${item.cardType}</td>
                                    <td>￥${item.balanceAmount}</td>
                                    <td class="orderBtn">
                                        <a href="<@spring.url '/cardOperation'/>?cardNo=${item.cardNo}&operType=0" style="margin-left:0;" >发送卡密</a>
                                        <a href="<@spring.url '/cardOperation'/>?cardNo=${item.cardNo}&operType=1" style="margin-left:10px;" psw="${item.cardPassword}">转赠</a>
                                        <a href="<@spring.url '/accountRecharge'/>?cardNo=${item.cardNo}" style="margin-left:10px;" psw="${item.cardPassword}">充值</a>
                                    </td>
                                    <td>${item.cardStatus}</td>
                                </tr>
                            </#list>
                         </table>
                        <#--<div class="page"><a class="a1">22条</a> <a href="#" class="a1">上一页</a> <span>1</span> <a href="#">2</a> <a href="#">3</a> <a href="#" class="a1">下一页</a></div>-->
                    	<#--分页 当前页，参与分页的总记录数，每页记录数-->
				    <#if selectPersonalCard_totalRecNum??>
				        <@sf.pageset currentPage selectPersonalCard_totalRecNum numOfPerPage "myCard"></@sf.pageset>
				    </#if>
				    <!--end 主体-->
                    </div>

                </div>

            </div>
        </div>
    </div>
    
    	
    <!--合作伙伴-->
    <#include "/lib/template/partner.ftl" encoding="UTF-8">
    <!--end 合作伙伴-->

    <!--底部-->
    <#include "/lib/template/footer.ftl" encoding="UTF-8">
    <!--end 底部-->

        <div id="loginBg"></div>
        <!--查看卡密码-->
        <div class="tipDiv">
            <div class="jf-overflowH tipDivTitle"><h3 style="float:left; font-size:14px; color:#666;">详情</h3><span onclick="closeTipDiv('tipDiv')" style="float:right; cursor:pointer; color:#999;font-size:25px;">×</span></div>
            <div class="tipShow">
                <p><span>卡号：</span><span id="myCardNo"></span></p>
                <p><span>卡密码：</span><span id="myCardPsw"></span></p>
            </div>
            <p><input type="button" value="关闭" class="sureBtn" onclick="closeTipDiv('tipDiv')" /></p>
        </div>
        <!--查看卡密码 end-->

</body>
</html>
<script language="javascript">
$(document).ready(function(e) {
    /**
    $(".orderBtn a").click(function(){
        var obj = 'tipDiv';
        var cardNo = $(this).parent().siblings('.cardNo').find('a').text();
        var cardType = $(this).parent().siblings('.cardType').text();
        var cardPws = $(this).attr('psw');

        if(cardType == '实体卡'){
            cardPws = '*';
            openTipDiv(obj,cardNo,cardPws);
        }
        else{openTipDiv(obj,cardNo,cardPws);}
    })
     **/
})
function openTipDiv(obj,cardNo,cardPws) {
    $("#loginBg").css("display","block");
    $("." + obj).css("display","block");
    $('#myCardNo').text(cardNo);
    $('#myCardPsw').text(cardPws);
}
function closeTipDiv(obj) {
    $("#loginBg").css("display","none");
    $("." + obj).css("display","none");
}
</script>