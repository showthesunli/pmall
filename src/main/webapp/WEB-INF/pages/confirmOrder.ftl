<#import "/spring.ftl" as spring/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>确认订单-逸乐生活网</title>
<link rel="stylesheet" type="text/css" href="<@spring.url '/css/css.css'/>"/>
<link rel="stylesheet" type="text/css" href="<@spring.url '/css/style.css'/>"/>
<link rel="stylesheet" type="text/css" href="<@spring.url '/css/model.css'/>"/>
<#--<script type="text/javascript" src="<@spring.url '/js/gd_Index.js'/>"></script>-->
<script type="text/javascript" src="<@spring.url '/js/jquery-1.7.2.min.js'/>"></script>
<script language="javascript" src="<@spring.url '/js/menu.js'/>" ></script>
    <script type="text/javascript" src="<@spring.url '/js/util.js'/>"></script>
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
.orderItem .defaultDiv {  margin-left: 30px;  float: left;  line-height: 30px;  }
.defaultDiv .addrDefault {  color: #cc0000;  cursor: default;  }
.addrModifyBtn,.invoiceModifyBtn {  margin-left: 30px;  }
.addrModSureBtn,.addrModCBtn ,.invoiceModSureBtn{  display: inline-block;  padding: 0 20px;  margin-top: 10px;  color: #fff;  background: #f60;  height: 30px;  line-height: 30px;  cursor: pointer;  }
.addrModCBtn{ background:#eee; color: #666; margin-left: 10px; }
.bgCO,.bgCOIn {  background: #ffefe5;  }
.addForN{ font-size: 12px; margin-left: 20px;}
.addForN a{ color:#f60; text-decoration: underline;}
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
        <!--收货地址-->
        <div class="orderItem jf-width1000 jf-overflowH">
            <div class="orderItemTitel jf-overflowH">
                <h4>收货信息</h4>
                <div class="defaultDiv jf-overflowH" id="selectDiv">
                    <#if queryMemberAddress[0]??>
                        <label class="addrName">${queryMemberAddress[0].name}</label>
                        <label class="addrPhone">${queryMemberAddress[0].phone}</label>
                        <label class="address">${queryMemberAddress[0].addr}</label>
                        <span class="addrDefault" style="float: none;">默认地址</span>
                        <span class="addrModifyBtn" onclick="divHeightA('addrSlide')">修改</span>
                    </#if>
                </div>
            </div>

            <div class="jf-overflowH addrSlide" style="height:0;">
                <#list queryMemberAddress as item>
                    <div class="addrDiv jf-overflowH">
                        <label class="addrName">${item.name}</label>
                        <label class="addrPhone">${item.phone}</label>
                        <label class="address">${item.addr}</label>
                    </div>
                </#list>
                <div>
                    <span class="addrModSureBtn">确定</span>
                    <span class="addrModCBtn" onclick="divHeightZ('addrSlide')">取消</span>
                    <!--<span class="addForN" style="">没有您想要的地址？请 <a href="javascript:void(0);">添加</a></span>-->
                </div>
            </div>
        </div>
        <!--end收货地址-->

        <!--发票信息-->
        <div class="orderItem jf-width1000" style="margin-top:20px;">
            <div class="orderItemTitel jf-overflowH">
                <h4>发票信息</h4>
                <span style="color:#cc0000; float:left;">(只对金额支付部分开具发票)</span>

                <div class="defaultDiv jf-overflowH">
                    <label class="invoiceType">普通发票（纸质）1</label>
                    <label class="invoiceComp">广州睿颢软件技术有限公司1</label>
                    <label class="invoiceTxt">明细1</label>
                    <span class="addrDefault" style="float: none;">默认发票信息</span>
                    <span class="invoiceModifyBtn" onclick="divHeightA('invoiceSlide')">修改</span>
                </div>
            </div>

            <div class="jf-overflowH invoiceSlide" style="height:0;">
                <div class="invoiceDiv jf-overflowH">
                    <label class="invoiceType">普通发票（纸质）1</label>
                    <label class="invoiceComp">广州睿颢软件技术有限公司1</label>
                    <label class="invoiceTxt">明细1</label>
                </div>
                <div class="invoiceDiv jf-overflowH">
                    <label class="invoiceType">普通发票（纸质）2</label>
                    <label class="invoiceComp">广州睿颢软件技术有限公司2</label>
                    <label class="invoiceTxt">明细2</label>
                </div>
                <div>
                    <span class="invoiceModSureBtn">确定</span>
                    <span class="addrModCBtn" onclick="divHeightZ('invoiceSlide')">取消</span>
                    <!--<span class="addForN" style="">没有您想要的发票信息？请 <a href="javascript:void(0);">添加</a></span>-->
                </div>
            </div>
        </div>
        <!--end发票信息-->

        <!--支付方式-->
        <div class="orderItem jf-width1000" style="margin-top:20px;">
            <div class="orderItemTitel jf-overflowH">
                <h4>支付方式</h4>
                <div class="defaultDiv jf-overflowH" style="float:left;">
                    <label>余额支付方式：</label>
                    <label>账户余额</label>
                </div>
            </div>

            <!--<<div class="jf-overflowH" style="padding:0 10px;">
                div class="jf-overflowH" style="float:left; margin-right:50px;">
                    <label>积分支付方式：</label>
                    <label>工商银行-信用卡</label>
                    <span class="invoiceModify" onclick="exchangeOpen()">修改</span>
                </div>
            </div>-->
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
                    <#list buyerItemList as item>
                        <div class="width200 cartItemTitle" style="width:680px;">
                            <a href="<@spring.url '/proshow;prdNo=${item.prdNo};keyWordsFld=${item.prdNo};'/>"><img src="<@spring.url '/imgsrc/${item.fileName}'/>" width="80" height="50" /></a>
                            <a href="<@spring.url '/proshow;prdNo=${item.prdNo};keyWordsFld=${item.prdNo};'/>" style="width:555px; margin-left:10px;">${item.prdName}</a>
                        </div>

                        <div class="width100 jf-exchange" style="line-height:40px;">${item.money}分</div>

                        <div class="width100" style="line-height:40px; ">${item.amount}</div>

                        <div class="width100">
                            <p><span class="exchangeCount" style=" line-height:40px;">${item.money * item.amount}</span>分</p>
                        </div>
                    </#list>
                </div>
                <div class="cartBanlance">
                    <div class="bgGrey">
                        <p style="line-height:50px; margin-right:20px;">共<span id="shuliang">${integer}</span><span style="margin-right:20px;">件</span>合计:<span id="exchangeTotal">${double}</span>分</p>
                    </div>
                </div>

                <!--<div class="cartBanlance">
                    <div>
                        <p class="jf-overflowH banBgGrey" style="line-height:35px;"><input name="" type="checkbox" checked="checked" value="" id="banCheckbox" style="margin-left:950px; margin-left:940px\9; *margin-left:930px; *margin-top:7px;" /><label style="margin-right:10px;">使用积分支付</label><span>应付积分</span><span style="color:#f60; margin:0 5px;">5000</span><span style="margin-right:28px; margin-right:20px\9;">分</span></p>

                        <div class="jf-overflowH banUse banBgGrey">
                            <p style="padding-right:20px;">使用的积分：<input name="" type="text" value="4000" style="padding:2px 5px; height:20px; width:90px; border:1px solid #ccc;" /></p>
                        </div>

                        <p class="banBgGrey balanceP" style="padding-right:10px; line-height:35px;">还需支付：<span id="exchangeTotal" style="width:92px; display:inline-block;">￥50.00</span></p>
                        <p style="line-height:30px; margin-right:20px;"><span id="shuliang">1</span><span style="margin-right:20px;">件商品</span>共计：<span id="exchangeTotal" style="width:70px; display:inline-block;">5000</span>分</p>
                    </div>
                </div>-->
            </div>
        </div>
        <!--end订单信息-->
             
        <#--<p class="jf-overflowH jf-width1000"><input type="button" value="确定下单"  class="btnBgS cartExBtn" style="margin:10px 10px 30px 0;" onclick="window.location='<@spring.url "/buycfm"/>'" /></p>-->
        <p class="jf-overflowH jf-width1000"><input type="button" value="确定下单"  class="btnBgS cartExBtn" style="margin:10px 10px 30px 0;" id="go" /></p>

        <!--确认订单列表 end-->
            
    </div>
        
    <!--合作伙伴-->
    <#--<#include "/lib/template/partner.ftl" encoding="UTF-8">-->
    <!--end 合作伙伴-->

    <!--底部-->
    <#include "/lib/template/footer.ftl" encoding="UTF-8">
    <!--end 底部-->
<form action="<@spring.url '/buycfm'/>" method="post" id="formGo">
    <input name="addr" type="hidden"/>
    <input name="receiverName" type="hidden"/>
    <input name="mobile" type="hidden"/>
    <input name="payToolIDList" type="hidden"/>
    <input name="_csrf" value="${_csrf.token}" type="hidden"/>
</form>

</body>

<script language="javascript">
$(document).ready(function(e) {
    //地址修改
    $(".addrDiv").click(function () {
        $(".addrDiv").removeClass("bgCO");
        $(this).addClass("bgCO");
    });
    $(".addrModSureBtn").click(function () {
        var name = $(".bgCO .addrName").text();
        var phoneNum = $(".bgCO .addrPhone").text();
        var addr = $(".bgCO .address").text();
        $(".addrSlide").animate({height: 0});
        if(name != "") {
            $(".defaultDiv .addrName").text(name);
            $(".defaultDiv .addrPhone").text(phoneNum);
            $(".defaultDiv .address").text(addr);
        }
    });
    //点击下单按钮
    $("#go").click(function(){
        var action="<@spring.url '/buycfm'/>";
        var receiverName = $("#selectDiv").find(".addrName").html();
        $("input[name='receiverName']").val(receiverName)
        var addr = $("#selectDiv").find(".address").html();
        $("input[name='addr']").val(addr)
        var mobile = $("#selectDiv").find(".addrPhone").html();
        $("input[name='mobile']").val(mobile)
        var payToolIDList = "东方航空-积分支付";
        $("input[name='payToolIDList']").val(payToolIDList)
        $("#formGo").submit();
    })

    //发票修改
    $(".invoiceDiv").click(function () {
        $(".invoiceDiv").removeClass("bgCOIn");
        $(this).addClass("bgCOIn");
    });
    $(".invoiceModSureBtn").click(function () {
        var type = $(".bgCOIn .invoiceType").text();
        var comp = $(".bgCOIn .invoiceComp").text();
        var txt = $(".bgCOIn .invoiceTxt").text();
        $(".invoiceSlide").animate({height: 0});
        if(type != "") {
            $(".defaultDiv .invoiceType").text(type);
            $(".defaultDiv .invoiceComp").text(comp);
            $(".defaultDiv .invoiceTxt").text(txt);
        }
    });
        
})
function divHeightZ(obj) {
    $("." + obj).animate({height: 0});
}
function divHeightA(obj) {
    var h = $("." + obj + " div").length * 40;
    $("." + obj).animate({height: h + "px"});
}
</script>

</html>
