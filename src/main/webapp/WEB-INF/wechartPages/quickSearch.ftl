<#import "/spring.ftl" as spring/>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<meta name="format-detection" content="telephone=no" />
<meta name="keywords" content="微信,微信公众平台" />
<meta name="description" content="微信公众平台自助引擎" />
<title>微商城快捷查询-逸乐生活网</title>
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/font_1459473269_4751618.css'/>">
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/style.css'/>">
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/buttons.css'/>">
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/font-awesome.min.css'/>">
<script type="text/javascript" src="<@spring.url '/wechart/js/jquery-1.10.2.min.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/wechart/js/jquery.accordion.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/wechart/js/unslider.min.js'/>"></script>
<script language="javascript" src="<@spring.url '/wechart/js/jquery.validate.min.js'/>" ></script>
<script language="javascript" src="<@spring.url '/wechart/js/jquery.validate.addMethod.js'/>" ></script>
<style>
input{ outline:none;}
#content p{ position: relative; margin: 20px 0;}
label.error{ position:absolute; left: 0; top:42px; color: #f00;}
.getCodeBtn{background: -webkit-linear-gradient(#eee, #ccc); background: -o-linear-gradient(#eee, #ccc); background: -moz-linear-gradient(#eee, #ccc); background: linear-gradient(#eee, #ccc);color:#fff; width: 30%; float:right; height: 41px; line-height: 41px; color: #666; border: 1px solid #999; border-radius: 3px;}
.cardInputTxt{ width: 100%; line-height: 40px; height: 40px; text-indent: 10px; border: none;}
</style>
</head>

<body>
<div id="page">
	<div class="banners">
		<a href="javascript:history.go(-1);"><img src="<@spring.url '/wechart/images/bg_info8.jpg'/>"></a>
	</div>
	<div id="content">
		<form id="signupForm" method="get" action="<@spring.url '/quickSearchOrder'/>">
		<p style="border: 1px solid #ccc;">
			<input type="text" value="" id="mobile" name="mobile" class="cardInputTxt cardPswTxt" placeholder="请输入手机号码" style="" />
		</p>
		<p style="overflow: hidden; margin-bottom: 0; padding-bottom: 20px;">
			<input type="text" id="registerCode" name="VERIFYCODE" class="cardInputTxt cardPswTxt" placeholder="请输入验证码" style=" width: 68%; border: 1px solid #ccc; float: left;" maxlength="4"/>
			<button type="button" class="getCodeBtn" id="second">获取验证码</button>
		</p>
		<div style="margin:8px 0;">
			<#--<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>-->
			<input type="submit" value="查 询" class="button button-caution button-large" style=" width: 100%;" />
		</div>
		</form>
	</div>
		
	<div style="padding:15px;"></div>
	
	<!--底部-->
	<#include "/lib/template/footer.ftl" encoding="UTF-8">
	<!--end 底部-->
	
</div>
</body>
</html>
<script>
$().ready(function () {
    // 在键盘按下并释放及提交后验证提交表单
    $("#signupForm").validate({
		rules: {               
			mobile: {
				required: true,
				isPhone: []
			},
			VERIFYCODE: {
				required: true,
				isNum: [],
				rangelength:[4,4]
			},
			/*mCode: {
				required: true,
			},*/
		},
		messages: {
			mobile: {
				required: "请输入手机号码",
				isPhone: "请输入正确的手机号码"
			},
			VERIFYCODE: {
				required: "请输入验证码",
				isNum: "只能为数字",
				rangelength:"长度只能为4"
			},
			/*mCode: {
				required: "请输入验证码",
			},*/
		}
	});
	
	//验证码倒计时
    var wait = 60;
    $("#second").attr("disabled", false);
    function time(obj) {
        var obj = $(obj);
        if (wait == 0) {
            obj.removeAttr("disabled");
            obj.text("获取验证码");
            wait = 60;
        } else {
            obj.attr("disabled", true);
            obj.text(wait + "秒");
            wait--;
            setTimeout(function () {
                        time(obj)
                    },
                    1000);
        }
    }
    
    $("#second").click(function () {
        var phone = $("#mobile").val();
        showError(phone,'mobile','请输入手机号码');
        if($("#mobile-error").text()){
        	return false;
        }        
        
        //ajax发送验证码
        var phoneNumber = $("#mobile").val();
        var mcode = "";
        var $this = this;
        $.ajax({
            url:"<@spring.url '/getQuickSearchMcode'/>",
            data:"mobile="+phoneNumber,
            type:"GET",
            dataType: "json",
            success: function (data) {
                if(data.errorMsg.msg){
                    if ($("#mobile-error").length == 0) {
                        $('#mobile').after('<label id="mobile-error" class="error" for="mobile">'+data.errorMsg.msg+'</label>');
                    } else{
                        $("#mobile-error").css('display','block').text(data.errorMsg.msg);
                    }
                }
            }
        })
        time(this);
    });
    
    $.validator.addMethod("isPhone", function (value, element) {
        var phone = $("#mobile").val();// 手机号码
        var phoneRule = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0-9]|170)\d{8}$/;

        // 手机号码错误
        if (!phoneRule.test(phone))
            return false;
        return true;
    }, "ignore");
    
});

    


function showError(val,obj,txt){
	if(val == ""){
		if ($("#"+obj+"-error").length == 0) {
			$('#'+obj).after('<label id="'+obj+'-error" class="error" for="'+obj+'">'+txt+'</label>');
		} else{
			$("#"+obj+"-error").css('display','block');
		}
		return false;
	}
}
</script>