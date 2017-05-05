<#import "/spring.ftl" as spring/>
<#import "/lib/macro/hisuMacro.ftl" as sf/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>注册-逸乐生活网</title>
<link rel="stylesheet" type="text/css" href="<@spring.url '/css/css.css'/>"/>
<link rel="stylesheet" type="text/css" href="<@spring.url '/css/style.css'/>"/>
<script type="text/javascript" src="<@spring.url '/js/jquery-1.7.2.min.js'/>"></script>
<script language="javascript" src="<@spring.url '/js/menu.js'/>" ></script>
<script language="javascript" src="<@spring.url '/js/jquery.validate.min.js'/>" ></script>
<script language="javascript" src="<@spring.url '/js/jquery.metadata.js'/>"></script>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<style>
.topNav a{ line-height:37px;}
.titlePitch{ background:#ffefe5;}
.regFTitle{ text-align:center; margin-top:20px;}
.regFTitle h2{ float:left; padding:0 20px; cursor:pointer; font-size:14px; font-weight:bold; color:#ff6600; line-height:40px;}
.registerForm p{ position:relative;}
.txtLabel{width:48px;}
#id-error,#phone-error,#password-error,#confirm_password-error{ position:absolute; left:305px; top:4px; color:#f00; padding:0 10px; background:#ffebe7; line-height:30px; border:1px solid #f00; border-radius:5px;}
</style>
<script type="text/javascript">
$(document).ready(function(){
    jQuery.validator.addMethod("phone", function(val, element) {
        var tel = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
        return this.optional(element) || (tel.test(val));
    }, "请正确填写您的手机号码");
        
    validator = $('.registerForm').validate({  
        debug: true, //调试模式取消submit的默认提交功能   
        //errorClass: "label.error", //默认为错误的样式类为：error   
        focusInvalid: false, //当为false时，验证无效时，没有焦点响应  
        onkeyup: false,   
        submitHandler: function(form){   //表单提交句柄,为一回调函数，带一个参数：form   
            form.submit();   //提交表单   
        },   

        rules:{
            id:{
                rangelength:[4,20]
            },
            phone:{
                phone:true
            },
            password:{
                rangelength:[6,20]
            },
            confirm_password:{
                equalTo:"#password"
            }
        },
        messages:{
            id:{
                rangelength: $.validator.format("长度只能在4-20个字符之间")
            },
            password:{
                rangelength: $.validator.format("长度只能在6-20个字符之间")
            },
            confirm_password:{
                equalTo:"两次密码输入不一致"
            }                                    
        }
    });

    var btn = document.getElementById("second");
    //调用监听
    monitor($(btn));    

    $("#second").click(function (){
        countDown($(this));
        var phoneNumber = $("#phone").val();
        $.ajax({
            url:"<@spring.url '/sendMcode'/>",
            data:"mobile="+phoneNumber,
            type:"GET",
            dataType: "json",
            success: function (data) {
               //countDown($(this));
            }
        })

    })
});
//防止页面刷新倒计时失效
function monitor(obj) {
    var LocalDelay = getLocalDelay();
    var timeLine = parseInt((new Date().getTime() - LocalDelay.time) / 1000);
    if (timeLine > LocalDelay.delay) {
        //console.log("过期");
    } else {
        _delay = LocalDelay.delay - timeLine;
        obj.text(_delay + 'S').addClass("btn-disabled");
        var timer = setInterval(function() {
            if (_delay > 1) {
                _delay--;
                obj.text(_delay + 'S');
                setLocalDelay(_delay).attr('disabled','disabled');
            } else {
                clearInterval(timer);
                obj.text("获取验证码").removeAttr('disabled').removeClass("btn-disabled");
            }
        }, 1000);
    }
};
//倒计时效果
function countDown(obj) {
    if (obj.text() == "获取验证码") {
        var phonenum = $("#phone").val();
        var result = isPhoneNum();
        if(result){
            var _delay = 60;
            var delay = _delay;
            obj.text(_delay + 'S').addClass("btn-disabled");
            var timer = setInterval(function() {
                if (delay > 1) {
                    delay--;
                    obj.attr('disabled','disabled').text(delay + 'S');
                    setLocalDelay(delay);
                } else {
                    clearInterval(timer);
                    obj.removeAttr('disabled').text("获取验证码").removeClass("btn-disabled");
                }
            }, 1000);
        }
    } else {
        return false;
    }
}
//设置setLocalDelay
function setLocalDelay(delay) {
    //location.href作为页面的唯一标识，可能一个项目中会有很多页面需要获取验证码。
    localStorage.setItem("delay_" + location.href, delay);
    localStorage.setItem("time_" + location.href, new Date().getTime());
}
//getLocalDelay()
function getLocalDelay() {
    var LocalDelay = {};
    LocalDelay.delay = localStorage.getItem("delay_" + location.href);
    LocalDelay.time = localStorage.getItem("time_" + location.href);
    return LocalDelay;
}
//校验手机号是否合法
function isPhoneNum(){
    var phonenum = $("#phone").val();
    var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/; 
    if(!myreg.test(phonenum)){
        if($('#phone').next("label").text() == '请输入手机号码' || $('#phone-error').css('display') == 'none'){
            $('#phone-error').css('display','block').text('请输入手机号码');
            return false;
        }
        else if($('#phone').next("label").text() == '请正确填写您的手机号码'){
            return false;
        }
        else{
            $('#phone-error').remove();
            $("#phone").after('<label id="phone-error" class="error" for="phone">请输入手机号码</label>');
            return false; 
        }
    }else{
        return true;
    }
}
</script>
</head>



<body>

	<!--头部-->
	<#include "/lib/template/header.ftl" encoding="UTF-8">
	<!--头部-->

	<!--banner--> 
    <div style="background:url('<@spring.url '/images/titleTag/b_register.jpg'/>) no-repeat center top;height:150px;"></div>
    <!--endbanner-->
        

    <div class="jf-main">
        <div class="ny_nav">
            <div class="ny_nav1">当前位置：<a href='<@spring.url "/index"/>'>首页</a> > 注册</div>
            <div class="clearfix"></div>
        </div>

        <div class="jf-width1200">
            <form class="registerForm" method="post" action="<@spring.url '/register'/>">
                <p>
                    <label class="txtLabel" for="id">用<span style="width:6px; display:inline-block"></span>户<span style="width:6px; display:inline-block"></span>名</label>
                    <input id="id" name="id" type="text" class="{required:true,rangelength:[4,20]} registerTxt" maxlength="20" placeholder="您的账户名和登录名"  />
                    <@sf.error field="id"></@sf.error>
                </p>

                <p>
                    <label class="txtLabel" for="password">设置密码</label>
                    <input id="password" name="password" type="password" class="{required:true,rangelength:[6,20]} registerTxt" maxlength="20" placeholder="请输入密码，密码至少6位"  />
                </p>

                <p>
                    <label class="txtLabel" for="confirm_password">确认密码</label>
                    <input id="confirm_password" name="confirm_password" type="password" class="{required:true,equalTo:'#password'} registerTxt" maxlength="20" placeholder="再次输入您的密码"  />
                </p>

                <p>
                    <label class="txtLabel" for="phone">手机号码</label>
                    <input name="phone" id="phone" class="{required:true,phone:true} registerTxt" type="text" maxlength="11" placeholder="建议使用常用手机" />
                </p>

                <p>
                    <label class="txtLabel">验<span style="width:6px; display:inline-block"></span>证<span style="width:6px; display:inline-block"></span>码</label>
                    <input name="mCode" id="registerCode" type="text" class="registerTxt" maxlength="6" placeholder="请输入验证码"  style="width:118px;"  />
                    <button type="button" class="sendCode"  id="second">获取验证码</button>
                </p>


                <p>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    <input name="" type="checkbox" value=""  checked="checked"/>
                    <label style="line-height:20px;">我已阅读并同意</label>
                    <a href="javascript:void(0);" onclick="proOpen()" style="color:#0099ff">《注册协议》</a>
                </p> 

                <p style="margin-bottom:10px;"><input type="submit" value="注册" class="registerBtn btnBgS" /></p>

                <p class="toLogin">已有账号<a href='<@spring.url "/login"/>'>请登录</a></p>

            </form>

            </div>

            

        </div>

	<!--底部-->
	<#include "/lib/template/footer.ftl" encoding="UTF-8">
    <!--end 底部-->

</body>

</html>