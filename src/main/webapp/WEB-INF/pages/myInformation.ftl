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

.addressDiv{ height:300px;}
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
.birthD{ color:#666;}
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
                    <div id="myInformation" class="myDetialList myBaseInfor">
                    	<form id="informationOfMy" action="modifyMemberInfo" method="post">
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
                            <#if memberInfo[0].gender == '0' || memberInfo[0].gender == ''>
		                        <#assign gen='保密'>
		                    <#elseif memberInfo[0].gender == '1'>
		                        <#assign gen='男'>
		                    <#else>
		                    	<#assign gen='女'>
		                    </#if>
                            <input id="gender"  type="text" value="${gen}" class="myDetialTxt inputRO" readOnly="true" maxlength="20" />
                            <p style="display: none; height: 17px; padding:5px 0;">
                                <label style="margin:0 20px 0 5px;"><input type="radio" name="gender" value="0" id="RadioGroup1_0" />保密</label>
                                <label style="margin-right:20px;"><input type="radio" name="gender" value="1" id="RadioGroup1_1"/>男</label>
                                <label><input type="radio" name="gender" value="2" id="RadioGroup1_2" />女</label>
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
	var g = '${memberInfo[0].gender}';
	if( g == ''){$('#RadioGroup1_0').attr('checked','checked');}
	else{$('#RadioGroup1_' + g).attr('checked','checked');}
}
//点击保存按钮
function updateInfor(){
	if($('.error').css('display')=='none' || $('.error').length == 0){	
		closeInfor();
//		openTipDiv('tipDiv','保存成功！');
		var memberID = $('#memberID').val();
		var mobile = $('#mobile').val();
		var identityCardNo = $('#identityCardNo').val();
		var email = $('#email').val();
		var gender = $('input:radio:checked').val();
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