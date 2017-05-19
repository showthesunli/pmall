<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<title>收货地址-逸乐生活网</title>
<meta name="description" content="途皓（北京）商务服务有限公司" />
<meta name="keywords" content="途皓（北京）商务服务有限公司" />
<link rel="stylesheet" type="text/css" href="<@spring.url '/css/css.css'/>"/>
<link rel="stylesheet" type="text/css" href="<@spring.url '/css/style.css'/>"/>
<link rel="stylesheet" type="text/css" href="<@spring.url '/css/jquery-ui.css'/>"/>
<script type="text/javascript" src="<@spring.url '/js/gd_Index.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/js/jquery-1.7.2.min.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/js/menu.js'/>" ></script>
<script type="text/javascript" src="<@spring.url '/js/util.js'/>" ></script>
<script type="text/javascript" src="<@spring.url '/js/jquery-ui-datepicker.js'/>"></script>
<script language="javascript" src="<@spring.url '/js/jquery.validate.min.js'/>" ></script>
<script language="javascript" src="<@spring.url '/js/jquery.validate.addMethod.js'/>" ></script>
<style>
.myAddress .myAddressItem{ border:2px solid #eee; padding:10px 15px; margin-top:10px;}
.myAddressItem div{ margin-bottom:0;}
.myAddressItem label,.addressDiv label{ width:80px; display:inline-block; text-align:right;}
.myAddressItem .addrDefaultInforTop{ margin-bottom:10px; overflow:hidden;}
.addrDefaultInfor{ float:left;}
.addrOperBtn{ float:right;}
.defStyle{ color:#fff; background:#f90; padding:0 5px; display:inline-block;}
.addrName{ font-weight:bold; margin-right:10px;}
.addrOperBtn span{ color:#3897d7; margin-left:10px; cursor:pointer;}
.addrOperBtn span:hover{ text-decoration: underline;}

.addressDiv{ height:300px;}
.addressDiv div{ padding:10px; color:#666; font-size:14px;}
.addressDiv .tipDivTitle{ padding:0; margin-bottom:10px;}
.addressDiv input[type=text]{ padding:0 5px;}
.colorRed{color:red;}
.myDetialTxt{padding:0 5px; margin-left: 5px; line-height: 25px;}
.inputRO{ border:1px solid #fff;}
.inputRW{ border:1px solid #ccc;}
.detialLabel{ width:80px; text-align: right;}
.myAddressItem label{ width: 90px;}
.birthD{ height:25px; line-height: 25px;}
#informationOfMy div{ position:relative;}
#memberName-error,#identityCardNo-error,#email-error,#gender-error,#birthdayDate-error{ position:absolute; left:305px; top:0; color:#f00; padding:0 10px; background:#ffebe7; line-height:25px; border:1px solid #f00; border-radius:5px;}
.birthD{ color:#666;}
.marginTB{ margin: 5px 0;}
.addrBtn{ background: #fff; border: none; color: #3897d7; cursor: pointer;}
.addrBtn:hover{ text-decoration: underline;}
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
                <h1 class="baseinfo-Title">收货地址</h1>
                <div class="myDetial">
                    <div class="myDetialList myAddress">
                        <input type="button" value="新增收货地址" class="detialBtn newAddress" onclick="openTipDiv('addressDiv')" style="margin-left:0; margin-top:0;" />
                        <#list queryMemberAddress as item>
                        <form method="post" action="<@spring.url '/modAddr'/>">
                            <div class="myAddressItem">
                                <div class="addrDefaultInforTop">
                                    <div class="addrDefaultInfor">
                                        <span class="addrName">${item.name}</span>
                                        <#if item.isDefault == "1">
                                            <span class="defStyle">默认地址</span>
                                        </#if>
                                    </div>
                                    <div class="addrOperBtn">
                                    	<#if item.isDefault == "0">
                                        	<input type="submit" value="设为默认" class="setToDefAddr addrBtn" />
                                        </#if>
                                        <input type="button" value="编辑" class="modifyAddr addrBtn" />
                                        <input type="submit" value="保存" class="updateAddr addrBtn" style="display: none;" />
                                        <input type="submit" value="删除" class="deleteAddr addrBtn" />
                                    </div>
                                </div>
                                <div class="marginTB"><label>收货人：</label><input id="name" name="receiverName" type="text" value="${item.name}" class="myDetialTxt inputRO" readOnly="true"  maxlength="10" /></div>
                                <div class="marginTB"><label>手机号码：</label><input id="phone" name="phone" type="text" value="${item.phone}" class="myDetialTxt inputRO" readOnly="true"  maxlength="11" /></div>
                                <div class="marginTB"><label>邮政编号：</label><input id="zip" name="zipCode" type="text" value="${item.zip}" class="myDetialTxt inputRO" readOnly="true"  maxlength="10" /></div>
                                <div class="marginTB"><label>收货地址：</label><input id="addr" name="addr" type="text" value="${item.addr}" class="myDetialTxt inputRO" readOnly="true" style="width: 680px;" /></div>
                                <input type="hidden" name="objectID" value="${item.objectID}"/>
                                <input type="hidden" name="isDefault" class="isDefaultInput" value="${item.isDefault}"/>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            </div>
                        </form>
                        </#list>
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
    <!--地址-->
    <div class="addressDiv">
        <form method="post" action="<@spring.url '/addAddr'/>">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <div class="jf-overflowH tipDivTitle"><h3 style="float:left;">收货地址</h3><span onclick="closeTipDiv('addressDiv')" style="float:right; cursor:pointer; color:#999;font-size:25px;">×</span></div>
        <div><label><span class="colorRed">*</span> 收货人：</label><input type="text" id="addressName" name="receiverName" value="" /></div>
        <div><label><span class="colorRed">*</span> 邮编：</label><input type="text" id="addressZip" name="zipCode" value="" /></div>
        <div style="overflow: hidden;">
        	<label style=" float: left;"><span class="colorRed">*</span> 详细地址：</label>
        	<input type="text" id="addressAddr" name="addr" value="" style="width:477px; line-height: 25px;" />
        </div>
        <div><label><span class="colorRed">*</span> 手机号码：</label><input type="text" id="addressPhone" name="phone" value="" /></div>
        <p style="margin:10px 0 0 90px;"><input type="hidden" id="operType" name="operType" value="0"/><input type="hidden" id="" name="" value=""/><input type="submit" value="保存" class="sureBtn"  /><input type="button" value="取消" class="cancleBtn"  onclick="closeTipDiv('addressDiv')" /></p>
            <input type="hidden" name="isDefault" value="0"/>
            <input type="hidden" name="objectID" id="objectID" value=""/>
        </form>
    </div>
    <!--地址 end-->
    <!--提示框-->
    <div class="tipDiv">
        <div class="jf-overflowH tipDivTitle"><h3 style="float:left;">提示</h3><span onclick="closeTipDiv('tipDiv')" style="float:right; cursor:pointer; color:#999;font-size:25px;">×</span></div>
        <p class="tipShow" style="font-size:14px; font-weight:bold; color:#f60"></p>
        <p><input type="button" value="确定" class="sureBtn" onclick="closeTipDiv('tipDiv')" /></p>
    </div>
    <!--提示框 end-->

</body>
</html>
<script language="javascript">
$(document).ready(function(e) {
	//设为默认值
    $('.setToDefAddr').click(function(){
    	var action = "<@spring.url '/modAddr'/>";
    	$(this).parent().parent().parent().parent().attr('action',action);
    	$('.isDefaultInput').val('0');
    	$(this).parent().parent().parent().parent().find('.isDefaultInput').val('1');
    });
    
    //删除地址
    $('.deleteAddr').click(function(){
    	var action = "<@spring.url '/deleteAddr'/>";
		$(this).parent().parent().parent().parent().attr('action',action);
    });

    //编辑地址
    $('.modifyAddr').click(function(){       		$(this).parent().parent().parent().find('.inputRO').addClass('inputRW').removeAttr('readonly').removeClass('inputRO');
		$(this).parent().parent().parent().find('.modifyAddr').hide();
		$(this).parent().parent().parent().find('.updateAddr').show();
	});
	
	//保存地址
	$('.updateAddr').click(function(){
		var action = "<@spring.url '/modAddr'/>";
    	$(this).parent().parent().parent().parent().attr('action',action);
		$(this).parent().parent().parent().find('.inputRW').addClass('inputRO').attr('readonly','ture').removeClass('inputRW');
		$(this).parent().parent().parent().find('.updateAddr').hide();
		$(this).parent().parent().parent().find('.modifyAddr').show();
	});
	
    //新增地址
    $('.newAddress').click(function(){
        $('#addressName').val('');
        $('#addressZip').val('');
        $('#addressAddr').val('');
        $('#addressPhone').val('');
        //$('#idProvnice').val('0');
        //$('#idCity').val('0');
        //$('#idArea').val('0');
        $('#operType').val("0"); 
    });

})
function openTipDiv(obj,txt) {
    $("#loginBg").css("display","block");
    $("." + obj).css("display","block");
    $('.tipShow').text(txt);
}
function closeTipDiv(obj) {
    $("#loginBg").css("display","none");
    $("." + obj).css("display","none");
}
</script>