<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<title>我的卡片操作-逸乐生活网</title>
<meta name="description" content="途皓（北京）商务服务有限公司" />
<meta name="keywords" content="途皓（北京）商务服务有限公司" />
<link rel="stylesheet" type="text/css" href="<@spring.url '/css/css.css'/>"/>
<link rel="stylesheet" type="text/css" href="<@spring.url '/css/style.css'/>"/>
<script type="text/javascript" src="<@spring.url '/js/gd_Index.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/js/jquery-1.7.2.min.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/js/menu.js'/>" ></script>
<script type="text/javascript" src="<@spring.url '/js/jquery.validate.min.js'/>" ></script>
<script type="text/javascript" src="<@spring.url '/js/jquery.validate.addMethod.js'/>" ></script>
<style>
.rechargeForm{ padding:20px 30px;}	
.rechargeForm p{ margin-bottom: 20px; position: relative;}
.inputTitle{ width: 80px; text-align: right; display: inline-block; font-size: 14px;}
.rechargeForm h2{ font-weight: bold; color: #f60; line-height: 40px; margin-bottom: 20px;}
.recTxt{ width: 300px; border: 1px solid #ccc; border-radius: 5px; line-height: 35px; padding: 0 10px; font-size: 14px;}
.rechargeBtn{width: 150px; height: 40px; border: 1px solid #f60; color: #fff; font-size: 16px; font-weight: bold; background:url(images/btnBg.png) no-repeat; background-position: 0 -75px; border-radius: 5px; cursor: pointer;}
#phone-error,#cardPsw-error{ position:absolute; left:420px; top:0; color:#f00; padding:0 10px; background:#ffebe7; line-height:35px; border:1px solid #f00; border-radius:5px; text-align: left; font-size: 14px;}
.baseinfo-Account label{ display: inline-block; width: 70px; text-align: right;}
.inputRO{ border:1px solid #fff;}
</style>
</head>

<body>
    <!--头部-->
    <#include "/lib/template/header.ftl" encoding="UTF-8">
    <!--end 头部-->

    <div class="main">
        <div style="width:100%; background: #f3f3f3; height:30px;"></div>
        <div class="memberMain">
        	
            <#include "/lib/template/left.ftl" encoding="UTF-8">
            	
            <div class="memberMain-Right">
                <div class="memberMainR-Baseinfo">
                    <img src="<@spring.url '/images/fuwu1.jpg'/>" width="120" height="120">
                    <div class="baseinfo-Account">
                        <p><label>用户名：</label><span>${memberInfo[0].memberID}</span></p>
                        <p><label>我的手机：</label><span>${memberInfo[0].mobile}</span></p>
                        <p><label>我的邮箱：</label><span>${memberInfo[0].email}</span></p>
                        <p><input type="button" value="修改资料" onclick="javascript:window.location.href='<@spring.url '/myInformation'/>'" style=" color: #3897d7; border: 1px solid #3897d7; margin-left:70px;" /></p>
                    </div>
                </div>
                
                <form class="rechargeForm" autocomplete="off" method="post" action="<@spring.url '/cardOperation'/>">
                	<h2>发送卡密码</h2>
                	<p>
                		<label class="inputTitle">卡号：</label>
                		<input type="text" id="cardNo" name="cardNo" value="${cardNo}"  class="recTxt inputRO" readOnly="true" />
                	</p>
                    <#if operType == 0>
                        <p>
                            <label class="inputTitle">手机号：</label>
                            <input type="text" id="phoneRO"  value="${memberInfo[0].mobile}"  class="recTxt inputRO" readOnly="true" />
                            <input type="text" id="phoneRO" name="mobile" value=""  class="recTxt inputRO" readOnly="true" />
                        </p>
                    <#else >
                        <p>
                            <label class="inputTitle">手机号：</label>
                            <input type="text" id="phone" name="mobile" value=""  class="recTxt" placeholder="请输入手机号码" maxlength="11" />
                        </p>
                    </#if>
                    <!--
                	<p>
                		<label class="inputTitle">卡密：</label>
                		<input type="hidden" />
                		<input type="text" onfocus="this.type='password'" autocomplete="off" id="cardPsw" name="cardPinCiperUnderZPK" value="" placeholder="请输入卡密" class="recTxt" />
                	</p>
                	-->
                	<p>
                		<label class="inputTitle"></label>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                		<input type="submit" id="" value="确 定" class="rechargeBtn" />
                	</p>
                	
                </form>
            </div>
            
        </div>
        
    </div>

    <!--合作伙伴-->
    <#include "/lib/template/partner.ftl" encoding="UTF-8">
    <!--end 合作伙伴-->
    
    <!--底部-->
    <#include "/lib/template/footer.ftl" encoding="UTF-8">
    <!--end 底部-->

</body>
</html>
<script>
    $().ready(function () {
        // 在键盘按下并释放及提交后验证提交表单
        $(".rechargeForm").validate({
            rules: {
            	phone: {
                    required: true,
                    isPhone: []
                },
                cardPinCiperUnderZPK: {
                    required: true,
                },
            },
            messages: {
                phone: {
                    required: "请输入手机号码",
                    isPhone: "请输入正确的手机号码"
                },
                cardPinCiperUnderZPK: {
                    required: "请输入卡密",
                },
            }
        });
    });
</script>