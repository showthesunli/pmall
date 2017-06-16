// JavaScript Document
$(document).ready(function(){
	if($('#errorShow .errorTxt').text() != ''){
		$('#errorShow .errorTxt').css('display','inline-block');
	}
	$("input:password").bind("copy cut paste",function(e){
		return false;
    });

//手机验证
$.validator.addMethod("isPhone", function (value, element) {
	var phone = $("#phone").val();// 手机号码
	var phoneRule = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0-9]|170)\d{8}$/;

	if(phone != ""){
		if (!phoneRule.test(phone))
			return false;
	}
	return true;
}, "ignore");
    
//用户名验证
$.validator.addMethod("isId", function (value, element) {
	var id = $("#id").val();
	//var idRule = /(?:\d+|[a-zA-Z]+|[@_]+){1,16}$/;
	var idRule = /^[a-zA-Z0-9@_]{0,}$/;
	
	if(id != ""){
		if (!idRule.test(id))
			return false;
	}
	return true;
}, "ignore");
	    
//密码验证
$.validator.addMethod("isPsw", function (value, element) {
	var psw = $("#password").val();
	var pswRule = /((?=.*[a-zA-Z])(?=.*\d)|(?=.*[a-zA-Z])(?=.*[@_])|(?=.*[@_])(?=.*[a-zA-Z])|(?=.*\d)(?=.*[@_]))[a-zA-Z\d@_]{1,16}$/;
	
	if(psw != ""){
		if (!pswRule.test(psw)){
			return false;
		}
	}
	return true;
}, "ignore");

})

