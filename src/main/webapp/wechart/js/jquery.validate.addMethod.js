// JavaScript Document
//手机验证
$.validator.addMethod("isPhone", function (value, element) {
        var phone = $("#phone").val();// 手机号码
        var phoneRule = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0-9]|170)\d{8}$/;

        // 手机号码错误
        if (!phoneRule.test(phone))
            return false;
        return true;
    }, "ignore");

$(document).ready(function(){
	if($('#errorShow .errorTxt').text() != ''){
		$('#errorShow .errorTxt').css('display','inline-block');
	}	
})
