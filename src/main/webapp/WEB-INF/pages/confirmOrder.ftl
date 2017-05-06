<#import "/spring.ftl" as spring/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>确认订单-逸乐生活网</title>
<link rel="stylesheet" type="text/css" href="<@spring.url '/css/css.css'/>"/>
<link rel="stylesheet" type="text/css" href="<@spring.url '/css/style.css'/>"/>
<link rel="stylesheet" type="text/css" href="<@spring.url '/css/model.css'/>"/>
<script type="text/javascript" src="<@spring.url '/js/gd_Index.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/js/jquery-1.7.2.min.js'/>"></script>
<script language="javascript" src="<@spring.url '/js/menu.js'/>" ></script>
<style>
.jf-productList{ width:323px; margin:0 10px 10px 0; background:none;}
.jf-productList:hover{ background:#faecec;}
.orderItem,.jf-cartItem,.cartBanlance{ font-size:14px;}
.orderItem div{ line-height:25px;}
.orderItemTitel{ padding:0 10px;}
.orderItemTitel h4{ line-height:30px;}
.orderItemTitel span{ line-height:30px;}
.addrDiv .checkbox{ margin-top:5px; *margin-top:1px; margin-right:5px; float:left;}
.addressDiv,.invDiv,.exchange,.balancePayType{ z-index:102;}
.addressForm{ font-size:14px;}
.addressForm label{ width:70px;}
.width100{ width:130px;}
</style>
</head>

<body>
    <!--头部-->
    <#include "/lib/template/header.ftl" encoding="UTF-8">
    <!--end 头部-->
        
    <div class="jf-main">
        <div class="ny_nav">
            <div class="ny_nav1">当前位置：<a href='<@spring.url "/index"/>'>首页</a> > 购物车</div>
            <div class="clearfix"></div>
        </div>
            
        <!--确认订单列表-->
        <div class="orderItem jf-width1000 jf-overflowH">
            <!--收货地址-->
            <div class="orderItemTitel jf-overflowH"><h4>收货信息</h4><span onclick="addressOpen()">新增收货地址</span></div>

            <div class="jf-overflowH addrSlide"  style="height:30px;">
                <div class="addrDiv jf-overflowH">
                    <input name="" type="checkbox" value="" checked="checked" class="checkbox" />
                    <label class="addrName">张三</label>
                    <label class="addrPhone">12345678910</label>
                    <label class="address">广东省广州市天河区</label>
                    <span class="addrDefault">默认地址</span>
                    <span class="addrDelete" onclick="tipOpen()">删除</span>
                    <span class="addrModify" onclick="addressOpen()">修改</span>
                </div>

                <div class="addrDiv jf-overflowH">
                    <input name="" type="checkbox" value="" class="checkbox" />
                    <label class="addrName">张三</label>
                    <label class="addrPhone">12345678910</label>
                    <label class="address">广东省广州市天河区棠东东路</label>
                    <span class="addrDelete" onclick="tipOpen()">删除</span>
                    <span class="addrModify" onclick="addressOpen()">修改</span>
                </div>

            </div>
            <p class="addrMore">更多地址<b class="bgImgS"></b></p>
        </div>
        <!--end收货地址-->

        <!--发票信息-->             
        <div class="orderItem jf-width1000" style="margin-top:20px;">
            <div class="orderItemTitel jf-overflowH"><h4>发票信息</h4><span style="color:#cc0000; float:left;">(只对金额支付部分开具发票)</span></div>

            <div class="jf-overflowH invoiceSlide"  style="height:30px;">
                <div class="invoiceDiv jf-overflowH">
                    <label class="invoiceType">普通发票（纸质）</label>
                    <label class="invoiceComp">广州睿颢软件技术有限公司</label>
                    <label class="invoiceTxt">明细</label>
                    <span class="invoiceModify" onclick="invDivOpen()">修改</span>
                </div>
            </div>
        </div>
        <!--end发票信息-->
             
        <!--支付方式-->
        <div class="orderItem jf-width1000" style="margin-top:20px;">
            <div class="orderItemTitel jf-overflowH"><h4>支付方式</h4></div>

            <div class="jf-overflowH" style="padding:0 10px;">
                <div class="jf-overflowH" style="float:left; margin-right:50px;">
                    <label>积分支付方式：</label>
                    <label>工商银行-信用卡</label>
                    <span class="invoiceModify" onclick="exchangeOpen()">修改</span>
                </div>

                <div class="jf-overflowH" style="float:left;">
                    <label>余额支付方式：</label>
                    <label>工商银行-信用卡</label>
                    <span class="invoiceModify" onclick="balPayTypeOpen()">修改</span>
                </div>
            </div>
        </div>
        <!--end支付方式-->
             
        <!--订单信息-->
        <div class="orderItem jf-width1000" style="margin-top:20px;">
            <div class="orderItemTitel jf-overflowH"><h4>订单信息</h4></div>
			<div class="jf-cart" style="padding:0 10px;">
                <ul class="jf-cartItemTitle">
                    <li class="width200" style="width:680px;">商品名称</li>
                    <li class="width100">所需积分</li>
                    <li class="width100">商品数量</li>
                    <li class="width100">小计</li>
                </ul>
                    
                <div class="jf-cartItem">
                    <div class="width200 cartItemTitle" style="width:680px;">
                   	    <a href="#"><img src="<@spring.url '/images/about3.jpg'/>" width="80" height="50" /></a>
                        <a href="#" style="width:555px; margin-left:10px;">商品名称商品名称商品名称商品名称商品名称商品名称商品名称商品名称商品名称商品名称商品名称商品名称商品名称商品名称商品名称商品名称商品名称商品名称...</a>
                    </div>

                    <div class="width100 jf-exchange" style="line-height:40px;">5000分</div>

                    <div class="width100" style="line-height:40px; ">1</div>

                    <div class="width100">
                        <p><span class="exchangeCount" style=" line-height:40px;">5000</span>分</p>
                    </div>
                </div>
                    
                <div class="cartBanlance">
                    <div>
                        <p class="jf-overflowH banBgGrey" style="line-height:35px;"><input name="" type="checkbox" checked="checked" value="" id="banCheckbox" style="margin-left:950px; margin-left:940px\9; *margin-left:930px; *margin-top:7px;" /><label style="margin-right:10px;">使用积分支付</label><span>应付积分</span><span style="color:#f60; margin:0 5px;">5000</span><span style="margin-right:28px; margin-right:20px\9;">分</span></p>

                        <div class="jf-overflowH banUse banBgGrey">
                            <p style="padding-right:20px;">使用的积分：<input name="" type="text" value="4000" style="padding:2px 5px; height:20px; width:90px; border:1px solid #ccc;" /></p>
                        </div>

                        <p class="banBgGrey balanceP" style="padding-right:10px; line-height:35px;">还需支付：<span id="exchangeTotal" style="width:92px; display:inline-block;">￥50.00</span></p>
                        <p style="line-height:30px; margin-right:20px;"><span id="shuliang">1</span><span style="margin-right:20px;">件商品</span>共计：<span id="exchangeTotal" style="width:70px; display:inline-block;">5000</span>分</p>
                    </div>
                </div>
            </div>
        </div>
        <!--end订单信息-->
             
        <p class="jf-overflowH jf-width1000"><input type="button" value="确定支付"  class="btnBgS cartExBtn" style="margin:0 10px 30px 0;" onclick="window.location='<@spring.url "/buycfm"/>'" /></p>            
                   
        <!--确认订单列表 end-->
            
    </div>
        
    <!--合作伙伴-->
    <#include "/lib/template/partner.ftl" encoding="UTF-8">
    <!--end 合作伙伴-->

    <!--底部-->
    <#include "/lib/template/footer.ftl" encoding="UTF-8">
    <!--end 底部-->
        
        <div id="loginBg"></div>
        <!--收货地址-->
        <div class="addressDiv">
        	<div class="jf-overflowH exchangeTitle"><h3 style="float:left;">收货人信息</h3><span onclick="addressClose()" style="float:right; cursor:pointer; color:#999;">×</span></div>
            <form class="addressForm">
            	<p><label>收货人：</label><input type="text"  /></p>
                <p><label>手机号码：</label><input type="text"  /></p>
                <p><label>所在地区：</label><select name=""><option>省份</option><option>广东省</option></select><select name=""><option>城市</option><option>广州市</option></select><select name=""><option>地区</option><option>天河区</option></select></p>
                <p><label>详细地址：</label><input type="text" style="width:400px;"  /></p>
                <p><input type="button" value="保存" class="saveBtn" /></p>
            </form>
        </div>
        <!--收货地址 end-->
        
        <!--发票信息-->
        <div class="invDiv">
        	<div class="jf-overflowH exchangeTitle"><h3 style="float:left;">发票信息</h3><span onclick="invDivClose()" style="float:right; cursor:pointer; color:#999;">×</span></div>
            <form class="addressForm">
            	<p><label>发票类型：</label><select name=""><option>请选择</option><option selected="selected">普通发票</option><option>电子发票</option></select></p>
              	<p><label>发票抬头：</label><select name=""><option>请选择</option><option>个人</option><option selected="selected">单位</option></select></p>
                <p><label></label><input type="text"  style="width:400px;" /></p>
                <p><label>发票内容：</label><select name=""><option>请选择</option><option selected="selected">明细</option><option>办公用品</option></select></p>
                <p><input type="button" value="确定" class="saveBtn" /></p>
          </form>
        </div>
        <!--发票信息 end-->
        
        <!--提示框-->
        <div class="tipDiv">
        	<div class="jf-overflowH tipDivTitle"><h3 style="float:left;">提示</h3><span onclick="tipClose()" style="float:right; cursor:pointer; color:#999;">×</span></div>
            <p class="tipShow" style="font-size:14px; font-weight:bold; color:#ea6870">确定要删除？</p>
            <p><input type="button" value="确定" class="sureBtn" onclick="tipClose()" /><input type="button" value="取消" class="cancleBtn"  onclick="tipClose()" /></p>
        </div>
        <!--提示框 end-->
                 
        <!--积分来源-->
        <div class="exchange">
        	<div class="jf-overflowH exchangeTitle"><h3 style="float:left;">积分来源</h3><span onclick="exchangeClose()" style="float:right; cursor:pointer; color:#999;">×</span></div>
            
            <div class="jf-overflowH" style="margin:20px;">
              <ul class="industryItem jf-overflowH">
                	<li id="i1"class="borderColorW">银行</li>
                    <li id="i2">通讯行业</li>
                    <li  id="i3">航空公司</li>
                </ul>
                <div id="l-i1" class="industryList jf-overflowH">
                    <ul>
                        <li id="l1" class="exPoint">储蓄卡</li>
                        <li id="l2">信用卡</li>
                    </ul>
                    <div class="jf-overflowH" id="l-l1" style="border:none; padding:0; margin:0;">
                        <div><input name="radioG1" type="radio" value="中信" /><img src="<@spring.url '/images/bankLogo/bank02.png'/>" width="120" height="20" /></div>
                        <div><input name="radioG1" type="radio" value="建设" /><img src="<@spring.url '/images/bankLogo/bank01.png'/>" width="120" height="20" /></div>
                        <div><input name="radioG1" type="radio" value="工商" /><img src="<@spring.url '/images/bankLogo/bank02.png'/>" width="120" height="20" /></div>
                    </div>
                    <div class="jf-overflowH" id="l-l2" style=" display:none;border:none; padding:0; margin:0;">
                        <div><input name="radioG1" type="radio" value="建设" /><img src="<@spring.url '/images/bankLogo/bank01.png'/>" width="120" height="20" /></div>
                        <div><input name="radioG1" type="radio" value="中信" /><img src="<@spring.url '/images/bankLogo/bank02.png'/>" width="120" height="20" /></div>
                        <div><input name="radioG1" type="radio" value="工商" /><img src="<@spring.url '/images/bankLogo/bank02.png'/>" width="120" height="20" /></div>
                    </div>
                </div>
            
                <div class="jf-overflowH industryList" id="l-i2" style="display:none;">
                    <div class="jf-overflowH" style="border:none; padding:0; margin:0;">
                        <div><input name="radioG1" type="radio" value="移动" /><img src="<@spring.url '/images/bankLogo/bank01.png'/>" width="120" height="20" /></div>
                        <div><input name="radioG1" type="radio" value="联通" /><img src="<@spring.url '/images/bankLogo/bank02.png'/>" width="120" height="20" /></div>
                    </div>
                </div>
                
                <div class="jf-overflowH industryList" id="l-i3" style="display:none;">
                    <div class="jf-overflowH" style="border:none; padding:0; margin:0;">
                        <div><input name="radioG1" type="radio" value="东航" /><img src="<@spring.url '/images/bankLogo/bank02.png'/>" width="120" height="20" /></div>
                        <div><input name="radioG1" type="radio" value="国际" /><img src="<@spring.url '/images/bankLogo/bank03.png'/>" width="120" height="20" /></div>
                    </div>
                </div>
                
            </div>
            <p style="text-align:center; margin-bottom:30px;"><input type="button" value="确定" class="sureBtn" /><input type="button" value="取消" class="cancleBtn"  onclick="exchangeClose()" /></p>
            
        </div>
        <!--积分来源 end-->
        
        <!--余额支付方式-->
        <div class="balancePayType">
        	<div class="jf-overflowH exchangeTitle"><h3 style="float:left;">支付方式</h3><span onclick="balPayTypeClose()" style="float:right; cursor:pointer; color:#999;">×</span></div>
            
            <div class="jf-overflowH" style="margin:20px;">
              <ul class="industryItem jf-overflowH">
                	<li id="i1"class="borderColorW">在线支付</li>
                    <li id="i2">支付宝</li>
                    <li  id="i3">微信</li>
                </ul>
                <div id="l-i1" class="industryList jf-overflowH">
                    <ul>
                        <li id="l1" class="exPoint">储蓄卡</li>
                        <li id="l2">信用卡</li>
                    </ul>
                    <div class="jf-overflowH" id="l-l1" style="border:none; padding:0; margin:0;">
                        <div><input name="radioG1" type="radio" value="中信" /><img src="<@spring.url '/images/bankLogo/bank02.png'/>" width="120" height="20" /></div>
                        <div><input name="radioG1" type="radio" value="建设" /><img src="<@spring.url '/images/bankLogo/bank01.png'/>" width="120" height="20" /></div>
                        <div><input name="radioG1" type="radio" value="工商" /><img src="<@spring.url '/images/bankLogo/bank02.png'/>" width="120" height="20" /></div>
                    </div>
                    <div class="jf-overflowH" id="l-l2" style=" display:none;border:none; padding:0; margin:0;">
                        <div><input name="radioG1" type="radio" value="建设" /><img src="<@spring.url '/images/bankLogo/bank01.png'/>" width="120" height="20" /></div>
                        <div><input name="radioG1" type="radio" value="中信" /><img src="<@spring.url '/images/bankLogo/bank02.png'/>" width="120" height="20" /></div>
                        <div><input name="radioG1" type="radio" value="工商" /><img src="<@spring.url '/images/bankLogo/bank03.png'/>" width="120" height="20" /></div>
                    </div>
                </div>
            
                <div class="jf-overflowH industryList" id="l-i2" style="display:none;">
                    <div class="jf-overflowH" style="border:none; padding:0; margin:0;">
                        <div><input name="radioG1" type="radio" value="移动" /><img src="<@spring.url '/images/bankLogo/bank02.png'/>" width="120" height="20" /></div>
                        <div><input name="radioG1" type="radio" value="联通" /><img src="<@spring.url '/images/bankLogo/bank01.png'/>" width="120" height="20" /></div>
                    </div>
                </div>
                
                <div class="jf-overflowH industryList" id="l-i3" style="display:none;">
                    <div class="jf-overflowH" style="border:none; padding:0; margin:0;">
                        <div><input name="radioG1" type="radio" value="东航" /><img src="<@spring.url '/images/bankLogo/bank02.png'/>" width="120" height="20" /></div>
                        <div><input name="radioG1" type="radio" value="国际" /><img src="<@spring.url '/images/bankLogo/bank03.png'/>" width="120" height="20" /></div>
                    </div>
                </div>
                
            </div>
            <p style="text-align:center; margin-bottom:30px;"><input type="button" value="确定" class="sureBtn" /><input type="button" value="取消" class="cancleBtn"  onclick="balPayTypeClose()" /></p>
            
        </div>
        <!--余额支付方式 end-->

</body>

<script language="javascript">
$(document).ready(function(e) {
    $(".addrDiv").hover(function(){
        $(this).children(".addrModify").css("display","block");
        $(this).children(".addrDelete").css("display","block");
        },function(){
            $(this).children(".addrModify").css("display","none");
            $(this).children(".addrDelete").css("display","none");          
            })
    
    //更多地址
    $(".addrMore").click(function(){
        var h = $(".addrSlide").height();
        var l = $(".addrDiv").length;
        var lh = parseInt($(".addrDiv").height()) + 10;
        
        if(h > lh ){
            $(".addrSlide").animate({height:lh + "px"});
            $(".addrMore").html("更多地址<b class='bgImgS'></b>");
            }
        else{
            $(".addrSlide").animate({height:lh * l + "px"});
            $(".addrMore").html("收起地址<b class='bgImgS' style=' background-position:0 -111px;'></b>");
            }
        })
        
    $(".checkbox").click(function(){ 
        if($(this).attr("checked")!=undefined) { 
            $(this).parent().siblings().children(".checkbox").attr("checked",false); 
            $(this).attr("checked",true); 
        } 
    }); 
    
    //选择积分来源
    $(".industryItem li").click(function(){
        var name = $(this).attr('id');
        $(this).parent().parent().children(".industryList").css("display","none");
        $(this).parent().parent().children("#l-" + name).css("display","block");
        $(this).parent().children("li").removeClass("borderColorW");
        $(this).addClass("borderColorW");
        })
    
    $(".industryList li").click(function(){
        var name = $(this).attr('id');
        $(this).parent().parent().children("div").css("display","none");
        $(this).parent().parent().children("#l-" + name).css("display","block");
        $(this).parent().children("li").removeClass("exPoint");
        $(this).addClass("exPoint");
        })
    
    $("#banCheckbox").click(function(){
        if($(this).attr("checked")!=undefined) { 
            $(this).parent().addClass("banBgGrey");
            $(".banUse").addClass("banBgGrey").animate({height:"26px"}); 
            $(".balanceP").addClass("banBgGrey");
        } 
        else{
            $(this).parent().removeClass("banBgGrey");
            $(".banUse").removeClass("banBgGrey").animate({height:"0"}); 
            $(".balanceP").removeClass("banBgGrey");
            }
        })
        
})
function addressOpen(){
         $("#loginBg").css("display","block");
         $(".addressDiv").css("display","block"); 
     }
function addressClose(){
        $("#loginBg").css("display","none");
        $(".addressDiv").css("display","none") ; 
    }
    
function invDivOpen(){
         $("#loginBg").css("display","block");
         $(".invDiv").css("display","block"); 
     }
function invDivClose(){
        $("#loginBg").css("display","none");
        $(".invDiv").css("display","none") ; 
    }
    
function exchangeOpen(){
         $("#loginBg").css("display","block");
         $(".exchange").css("display","block"); 
     }
function exchangeClose(){
        $("#loginBg").css("display","none");
        $(".exchange").css("display","none") ; 
    }

function tipOpen(){
         $("#loginBg").css("display","block");
         $(".tipDiv").css("display","block"); 
     }
function tipClose(){
        $("#loginBg").css("display","none");
        $(".tipDiv").css("display","none") ; 
    }

function balPayTypeOpen(){
         $("#loginBg").css("display","block");
         $(".balancePayType").css("display","block"); 
     }
function balPayTypeClose(){
        $("#loginBg").css("display","none");
        $(".balancePayType").css("display","none") ; 
    }
    
function getVal(){
    var v = $("input[name=radioG1]:checked").val();
    $("input[name=exVal]").val(v);
    exchangeClose();
    if($("input[name=exVal]").val() != ''){
        $(".cartBanBtn").removeClass("btnGrey");
        }
    }
function gotoAccount(){
    if($("input[name=exVal]").val() == ''){
        tipOpen();
        $(".tipShow").html("请先选择所要支付的积分来源！");
        }
    else{
        $(".cartBanBtn").removeClass("btnGrey");
        }
    }
</script>

</html>
