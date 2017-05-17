<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<title>个人信息-逸乐生活网</title>
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

.addressDiv{ height:350px;}
.addressDiv div{ padding:10px; color:#666; font-size:14px;}
.addressDiv .tipDivTitle{ padding:0; margin-bottom:10px;}
.addressDiv input[type=text]{ padding:0 5px;}
.colorRed{color:red;}
.myDetialTxt{padding:0 5px; margin-left: 5px;}
.detialLabel{ width:80px; text-align: right;}
.myAddressItem label{ width: 90px;}
.birthD{ height:25px; line-height: 25px;}
#informationOfMy div{ position:relative;}
#memberName-error,#identityCardNo-error,#email-error,#gender-error,#birthdayDate-error{ position:absolute; left:305px; top:0; color:#f00; padding:0 10px; background:#ffebe7; line-height:25px; border:1px solid #f00; border-radius:5px;}
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
                <h1 class="baseinfo-Title">个人信息</h1>
                <div class="myDetial">
                    <div class="myDetial-Title"><h2 class="bgOcoF myBase">基本信息</h2><h2 class="myAddr">收货地址</h2></div>
                    <div id="myInformation" class="myDetialList myBaseInfor">
                    	<form id="informationOfMy" action="<@spring.url '/updateUserInfo'/>" method="post">
                            <input name="${_csrf.parameterName}" value="${_csrf.token}">
                        <div>
                            <label class="detialLabel"><span class="colorRed">*</span> 我的账号：</label>
                            <span id="memberID" name="memberID" style="padding: 0 5px;">${memberInfo[0].memberID}</span>
                        </div>
                        <div>
                            <label class="detialLabel"><span class="colorRed">*</span> 我的手机：</label>
                            <span id="mobile" name="mobile" style="padding: 0 5px;">${memberInfo[0].mobile}</span>
                        </div>
                            <#--
                        <div>
                            <label class="detialLabel">真实姓名：</label>
                            <input id="memberName" name="memberName" type="text" value="${memberInfo[0].memberName}" class="myDetialTxt inputRO" readOnly="true"  maxlength="10" />
                        </div>
                        <div>
                            <label class="detialLabel">身份证：</label>
                            <input id="identityCardNo" name="identityCardNo" type="text" value="${memberInfo[0].identityCardNo}" class="myDetialTxt inputRO" readOnly="true" maxlength="22" />
                        </div>
                        <div>
                            <label class="detialLabel">邮箱：</label>
                            <input id="email" name="email" type="text" value="${memberInfo[0].email}" class="myDetialTxt inputRO" readOnly="true" maxlength="20" />
                        </div>
                        -->
                        <div>
                            <label class="detialLabel">性别：</label>
                            <#if memberInfo[0].gender == '0'>
		                        <#assign gen='保密'>
		                    <#elseif memberInfo[0].gender == '1'>
		                        <#assign gen='男'>
		                    <#else>
		                    	<#assign gen='女'>
		                    </#if>
                            <input id="gender" name="gender" type="text" value="${gen}" class="myDetialTxt inputRO" readOnly="true" maxlength="20" />
                            <p style="display: none; height: 17px; padding:5px 0;">
                                <label style="margin:0 20px 0 5px;"><input type="radio" name="RadioGroup1" value="0" id="RadioGroup1_0" />保密</label>
                                <label style="margin-right:20px;"><input type="radio" name="RadioGroup1" value="1" id="RadioGroup1_1"/>男</label>
                                <label><input type="radio" name="RadioGroup1" value="2" id="RadioGroup1_2" />女</label>
                            </p>
                        </div>
                        <div>
                            <label class="detialLabel">生日：</label>
                            <input id="birthday" name="birthday" type="text" value="${memberInfo[0].birthday}" class="myDetialTxt inputRO" readOnly="true" maxlength="20" />
                            <input id="birthdayDate" name="birthdayDate" type="text" value="${memberInfo[0].birthday}" class="myDetialTxt" readOnly="true" style="display: none;" oninput="oninputB()" />                           
                        </div>
                        <div>
                        	<input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        	
                            <input type="button" value="修改" onclick="modifyInfor()" class="detialBtn modBtn" style="margin-left: 85px;" />
                            <input type="submit" value="保存" onclick="updateInfor()" class="detialBtn updBtn" style="margin-left: 85px; display: none;" />
                            <input type="button" value="取消" onclick="closeInfor()" class="detialBtn canBtn" style="margin-left: 10px; display: none; color: #666; border-color:#666;" />
                        </div>
                    	</form>
                    </div>

                    <div class="myDetialList myAddress" style="display:none;">
                        <input type="button" value="新增收货地址" class="detialBtn newAddress" onclick="openTipDiv('addressDiv')" style="margin-left:0; margin-top:0;" />
                        <#list queryMemberAddress as key>
                        <div class="myAddressItem">
                            <div class="addrDefaultInforTop">
                                <div class="addrDefaultInfor">
                                    <span class="addrName">${key.name} ${key.province}</span>
                                    <span class="defStyle">默认地址</span>
                                </div>
                            	<div class="addrOperBtn">
                                    <span class="setToDefAddr" style="display:none;">设为默认</span>
                                    <span class="modifyAddr" ttoken="${_csrf.token}" objId="${key.objectID}">编辑</span>
                                    <span class="deleteAddr" ttoken="${_csrf.token}" objId="${key.objectID}">删除</span>
                                </div>
                            </div>
                            <div><label>收货人：</label><span class="addrN">${key.name}</span></div>
                            <div><label>手机号码：</label><span class="addrP">${key.phone}</span></div>
                            <div><label>邮政编号：</label><span class="addrZ">${key.zip}</span></div>
                            <div>
                            	<label>所在地区：</label>
                            	<span class="addrProvince">${key.province}</span>
                            	<span class="addrCity">${key.city}</span>
                            	<span class="addrArea">${key.area}</span>
                            </div>
                            <div><label>收货地址：</label><span class="addrA">${key.addr}</span></div>
                            <div style="display: none"><label>收货地址ID：</label><span class="addrID">${key.objectID}</span></div>
                        </div>
                        
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
        <div class="jf-overflowH tipDivTitle"><h3 style="float:left;">收货地址</h3><span onclick="closeTipDiv('addressDiv')" style="float:right; cursor:pointer; color:#999;font-size:25px;">×</span></div>
        <div><label><span class="colorRed">*</span> 收货人：</label><input type="text" id="addressName" value="" /></div>
        <div><label><span class="colorRed">*</span> 邮编：</label><input type="text" id="addressZip" value="" /></div>
        <div style="overflow: hidden; height: 27px;">
        	<label style=" float: left;"><span class="colorRed">*</span> 所在地区：</label>
        	<div style="width:477px; float: left; padding: 0;">
        		<select id="idProvnice" name="idProvnice" data="" class="birthD">
        			<option value="0" disabled="disabled" selected="selected">-请选择-</option>
        			<option value="广东">广东</option>
        		</select>
	            <select id="idCity" name="idCity" data="" class="birthD">
	            	<option value="0" disabled="disabled" selected="selected">-请选择-</option>
        			<option value="广州">广州</option>
        			<option value="深圳">深圳</option>
	            </select>
	            <select id="idArea" name="idArea" data="" class="birthD">
	            	<option value="0" disabled="disabled" selected="selected">-请选择-</option>
        			<option value="天河区">天河区</option>
        			<option value="罗湖区">罗湖区</option>
	            </select>       	
        	</div>
        </div>
        <div style="overflow: hidden;">
        	<label style=" float: left;"><span class="colorRed">*</span> 详细地址：</label>
        	<input type="text" id="addressAddr" value="" style="width:477px; line-height: 25px;" />
        </div>
        <div><label><span class="colorRed">*</span> 手机号码：</label><input type="text" id="addressPhone" value="" /></div>
        <p style="margin:10px 0 0 90px;"><input type="hidden" id="operType" name="operType" value="0"/><input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}"/><input type="button" value="保存" class="sureBtn" onclick="saveAddr()" /><input type="button" value="取消" class="cancleBtn"  onclick="closeTipDiv('addressDiv')" /></p>
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
<script>
$(function () {
		
	//生日
	$("#birthdayDate").datepicker({
		dateFormat: 'yy-mm-dd'
	});

	// 在键盘按下并释放及提交后验证提交表单
    $("#informationOfMy").validate({
		rules: {
			memberName:{isRealName:true},
			email:{email:true},
			identityCardNo:{isIdCardNo:true},
		},
		messages: {
			memberName:{isRealName:"最多输入20个英文或10个汉字"},
			email: {email:"请输入正确格式的邮箱"},
			identityCardNo:{isIdCardNo:"请输入正确的身份证号"},
        }
    });
});
function openTipDiv(obj,txt) {
    $("#loginBg").css("display","block");
    $("." + obj).css("display","block");
    $('.tipShow').text(txt);
}
function closeTipDiv(obj) {
    $("#loginBg").css("display","none");
    $("." + obj).css("display","none");
}
//点击修改按钮
function modifyInfor(){
	$('.inputRO').addClass('inputRW').removeAttr('readonly').removeClass('inputRO');
	$('#gender').css('display','none').next('p').css('display','inline-block');
	$('#birthday').css('display','none').next('input').css('display','inline-block');
	$('.modBtn').hide();
	$('.updBtn').show();
	$('.canBtn').show();
	var g = ${memberInfo[0].gender};
	$('#RadioGroup1_' + g).attr('checked','checked');
}
//点击保存按钮
function updateInfor(){
	if($('.error').css('display')=='none' || $('.error').length == 0){	
		closeInfor();
		openTipDiv('tipDiv','保存成功！');
		var memberID = $('#memberID').val();
		var mobile = $('#mobile').val();
		var identityCardNo = $('#identityCardNo').val();
		var email = $('#email').val();
		var  gender = $('input:radio:checked').val();
	}
}
function closeInfor(){
	$('.inputRW').addClass('inputRO').attr('readonly','ture').removeClass('inputRW');
	$('#gender').css('display','inline-block').next('p').css('display','none');
	$('#birthday').css('display','inline-block').next('input').css('display','none');
	$('.updBtn').hide();
	$('.canBtn').hide();
	$('.modBtn').show();
}
</script>
<script language="javascript">
$(document).ready(function(e) {
	$(".defStyle").css("display","none");
	$('.myAddressItem').eq(0).find(".defStyle").css("display","inline-block");
	$(".setToDefAddr").css("display","inline-block");
	$('.myAddressItem').eq(0).find(".setToDefAddr").css("display","none");

	//基本信息和地址点击切换
    $('.myBase').click(function(){
        $('.myDetial-Title h2').removeClass('bgOcoF');
        $(this).addClass('bgOcoF');
        showDiv('myBaseInfor');
    });
    $('.myAddr').click(function(){
        $('.myDetial-Title h2').removeClass('bgOcoF');
        $(this).addClass('bgOcoF');
        showDiv('myAddress');
    });
    //设为默认值
    $('.setToDefAddr').click(function(){
        var a = $(this).parent().parent().parent();
        $(".newAddress").after(a);
        $(".defStyle").css("display","none");
        $(".setToDefAddr").css("display","inline-block");
        $(a).find(".defStyle").css("display","inline-block");
        $(a).find(".setToDefAddr").css("display","none");
        openTipDiv('tipDiv','设置成功！');
    })

    //打开文本编辑框点击a标签
	$(".deleteAddr").each(function(){
		$(this).click(function(event){
			var $this = $(this);
			deleteAddr($this.attr("ttoken"),$this.attr("objId"));
			return false;
		});
	});
    
    //编辑地址
    $('.modifyAddr').click(function(){
        var a = $(this).parent().parent().parent();
        var name = a.find('.addrN').text();
        var zip = a.find('.addrZ').text();
        var addr = a.find('.addrA').text();
        var phone = a.find('.addrP').text();
        var addrProvince = a.find('.addrProvince').text();
        var addrCity = a.find('.addrCity').text();
        var addrArea = a.find('.addrArea').text();
        openTipDiv('addressDiv');
        if(name!=""){
            $('#addressName').val(name);
            $('#addressZip').val(zip);
            $('#addressAddr').val(addr);
            $('#addressPhone').val(phone);
            $('#operType').val("1"); 
            
            $("#idProvnice").val(addrProvince);
            $("#idCity").val(addrCity);
            $("#idArea").val(addrArea);
        }
    });
    //新增地址
    $('.newAddress').click(function(){
        $('#addressName').val('');
        $('#addressZip').val('');
        $('#addressAddr').val('');
        $('#addressPhone').val('');
        $('#idProvnice').val('0');
        $('#idCity').val('0');
        $('#idArea').val('0');
        $('#operType').val("0"); 
    });

})
function showDiv(obj) {
    $(".myDetialList").css("display","none");
    $("." + obj).css("display","block");
}
</script>