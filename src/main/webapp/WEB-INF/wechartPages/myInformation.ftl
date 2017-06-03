<#import "/spring.ftl" as spring/>
<#import "/lib/macro/hisuMacro.ftl" as sf/>
<!DOCTYPE html>
<!-- saved from url=(0054)http://www.sucaihuo.com/modals/20/2070/demo/dizhi.html -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<meta name="description" content="途皓（北京）商务服务有限公司" />
	<meta name="keywords" content="途皓（北京）商务服务有限公司" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>微商城个人信息-逸乐生活网</title>   
    <link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/font_1459473269_4751618.css'/>">
	<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/bootstrap.min.css'/>">
	<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/pstyle.css'/>">
	<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/style.css'/>">
	<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/buttons.css'/>">
	<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/LCalendar.css'/>">
	<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/font-awesome.min.css'/>">
	<script type="text/javascript" src="<@spring.url '/wechart/js/jquery-1.10.2.min.js'/>"></script>
	<script type="text/javascript" src="<@spring.url '/wechart/js/bootstrap.min.js'/>"></script>
	<script type="text/javascript" src="<@spring.url '/wechart/js/LCalendar.js'/>"></script>
	<script language="javascript" src="<@spring.url '/wechart/js/jquery.validate.min.js'/>" ></script>
	<script language="javascript" src="<@spring.url '/wechart/js/jquery.validate.addMethod.js'/>" ></script>
	<script type="text/javascript" src="<@spring.url '/wechart/js/jquery.validate.addMethod.js'/>" ></script>
<!--必要样式-->
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/menu_elastic.css'/>">
<script type="text/javascript" src="<@spring.url '/wechart/js/snap.svg-min.js'/>"></script>
<!--[if IE]>
<script src="js/html5.js"></script>
<![endif]-->
<style>
.usercenter .cdv p{ line-height: 34px; margin: 5px 0;}
.usercenter .cdv .width70{ display: inline-block; width: 70px; text-align: right; color: #333;}
.usercenter .cdv span{ color: #f60; font-size: 14px;}
#email,#birth{line-height: 25px;width: 200px;border: 1px solid #ccc;}
a#radio input {width: 28px;}
a#radio {display: none;}
#email-error{position: absolute;left: 88px;top: 191px;color: #FF2626;font-weight: 400;}
#errorShow{ text-align: center; min-height: 22px; line-height: 20px;}
.errorTxt{ text-align: center; min-height: 20px; line-height: 20px; color: #f00; background:#ffebe7; padding: 0 10px; border: 1px solid #f00; border-radius:5px; display: none;}
</style>
</head>
<body class="huibg">
		
<div class="menu-wrap">
    <nav class="menu">
      <div class="icon-list">
        <a href="index.html"><i class="iconfont icon-home"></i><span>首页</span></a>
        <a href="personal.html"><i class="iconfont icon-yonghux"></i><span>个人中心</span></a>
        <a href="#"><i class="iconfont icon-liebiao"></i><span>订单中心</span></a>
        <a href="#"><i class="iconfont icon-xitongmingpian"></i><span>个人信息</span></a>
        <a href="address.html"><i class="iconfont icon-dizhi"></i><span>地址信息</span></a>
      </div>
    </nav>
    <button class="close-button" id="close-button">Close Menu</button>
    <div class="morph-shape" id="morph-shape" data-morph-open="M-1,0h101c0,0,0-1,0,395c0,404,0,405,0,405H-1V0z">
      <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" viewBox="0 0 100 800" preserveAspectRatio="none">
        <path d="M-1,0h101c0,0-97.833,153.603-97.833,396.167C2.167,627.579,100,800,100,800H-1V0z"></path>
      <desc>Created with Snap</desc><defs></defs></svg>
    </div>
  </div>
<nav class="navbar text-center">
   <button class="topleft" onclick="window.location.href='<@spring.url "/member"/>'"><span class="iconfont icon-fanhui"></span></button>
  <a class="navbar-tit center-block">个人信息</a>
</nav>


<div class="usercenter">
	
 	<form id="informationOfMy" action="modifyMemberInfo" method="post">
  	<div class="cdv dzi">
  		<div id="errorShow">
			<span class="errorTxt"><@sf.error field="msg"/></span>
		</div>
		
		<p><span class="width70">我的账号：</span><span id="memberID" name="memberID">${memberInfo[0].memberID}</span></p>
	    <p><span class="width70">我的手机：</span><span id="mobile" name="mobile">${memberInfo[0].mobile}</span></p>
	    <p><span class="width70">邮箱：</span><span id="mobile" name="mobile">${memberInfo[0].email}</span>
	    	 <input id="email" name="email" type="text" value="${memberInfo[0].email}" class="myDetialTxt inputRO" readOnly="true" maxlength="20" style="display: none;"/>
	    </p>
	    <div>
		<#if memberInfo[0].gender == '0' || memberInfo[0].gender == ''>
			<#assign gen='保密'>
		<#elseif memberInfo[0].gender == '1'>
			<#assign gen='男'>
		<#else>
			<#assign gen='女'>
		</#if>
	    <p><span class="width70">性别：</span><span id="m" name="mobile">${gen}</span>
			<input style="display: none;" id="gender"  type="" value="" class="myDetialTxt inputRO" readOnly="true" maxlength="20" />
	       
	        <a id="radio">
	        	<input type="radio" name="gender" value="0" id="RadioGroup1_0" />保密
	            <input type="radio" name="gender" value="1" id="RadioGroup1_1" style="margin-left: 10px;"/>男
	            <input type="radio" name="gender" value="2" id="RadioGroup1_2" style="margin-left: 10px;"/>女
	        </a>
        </p>
        </div>
	    <p><span class="width70" id="data">生日：</span><span id="mobile" name="mobile">${memberInfo[0].birthday}</span>
	    	<input type="text" name="" id="birth" readonly="readonly"   style="display: none;"/>
	    </p>
		<input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	    <div class="info_child_txt" style="text-align: center;">
	    	 <input type="button" value="修 改" onclick="modifyInfor()" class="detialBtn modBtn btn btn-info"  style="color: #fff;width: 18%;"/>
             <input type="submit" value="保 存" onclick="updateInfor()" class="detialBtn updBtn btn btn-success" style=" display: none;color: #fff;width: 18%;" />
              <input type="button" value="取 消" onclick="cancelInfor()" class="detialBtn canBtn btn" style="width: 18%; display: none; margin-left: 5px;background-color: #666;color: #fff;/>
			<a href="#" style="color: #3897d7;"></a>
		</div>
  	</div>
  </form>
	
</div>

  	<!--底部-->
	<#include "/lib/template/footer.ftl" encoding="UTF-8">
	<!--end 底部--> 

</body></html>
<script>
$(function () {
		
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

//点击修改按钮
function modifyInfor(){
	$('.inputRO').addClass('inputRW').removeAttr('readonly').removeClass('inputRO');
	$('#gender').css('display','none');
	$('#radio').css('display','inline');	
	$('#birth').css('display','inline-block');
	$('#m').css('display','none').next('p').css('display','inline-block');
	$('#email').css('display','inline-block');	
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
		var memberID = $('#memberID').val();
		var mobile = $('#mobile').val();
		var identityCardNo = $('#identityCardNo').val();
		var email = $('#email').val();
		var gender = $('input:radio:checked').val();
		var birthdayDate = $('#birth').val();
	}
	$('#radio').css('display','none');
	$('#m').css('display','inline-block');
	$('#gender').css('display','none');
	$('#birth').css('display','none');
}

//点击取消按钮
function cancelInfor(){	
		closeInfor();
		$('#radio').css('display','none');
	    $('#m').css('display','inline-block');
	    $('#gender').css('display','none');
	    $('#email').css('display','none');	
	    $('#birth').css('display','none');
		$('#email-error').css('display','none');
		$('#email').val('${memberInfo[0].email}');
		$('#gender').val('${gen}');
		var b = '${memberInfo[0].birthday}';
		if(b != "")$('#birthdayDate').val('b');
		else $('#birthdayDate').val('');
}
function closeInfor(){
	$('.inputRW').addClass('inputRO').attr('readonly','ture').removeClass('inputRW');
	$('#gender').css('display','inline-block').next('p').css('display','none');
	$('#birthday').css('display','inline-block').next('input').css('display','none');
	$('.updBtn').hide();
	$('.canBtn').hide();
	$('.modBtn').show();
}
	 var calendar = new LCalendar();
    calendar.init({
        'trigger': '#birth', //标签id
        'type': 'date', //date 调出日期选择 datetime 调出日期时间选择 time 调出时间选择 ym 调出年月选择,
        'minDate': '1900-1-1', //最小日期
        'maxDate': new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() //最大日期
    });
</script>