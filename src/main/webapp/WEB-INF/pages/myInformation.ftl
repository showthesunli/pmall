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
<script type="text/javascript" src="<@spring.url '/js/jquery.js'/>"></script>
<script language="javascript" src="<@spring.url '/js/menu.js'/>" ></script>
<script language="javascript" src="<@spring.url '/js/util.js'/>" ></script>
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

.addressDiv{ height:250px;}
.addressDiv div{ padding:10px; color:#666; font-size:14px;}
.addressDiv .tipDivTitle{ padding:0; margin-bottom:10px;}
.addressDiv input[type=text]{ padding:0 5px;}
.colorRed{color:red;}
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
                        <div>
                            <label class="detialLabel">我的账号：</label>
                            <input id="memberID" type="text" value="${memberInfo[0].memberID}" class="myDetialTxt inputRO" readOnly="true"  />
                        </div>
                        <div>
                            <label class="detialLabel">手机号码：</label>
                            <input id="mobile" type="text" value="${memberInfo[0].mobile}" class="myDetialTxt inputRO" readOnly="true" />
                        </div>
                        <div>
                            <label class="detialLabel">我的邮箱：</label>
                            <input id="email" type="text" value="${memberInfo[0].email}" class="myDetialTxt inputRO" readOnly="true" />
                        </div>
                        <div>
                            <label class="detialLabel">性<span class="lwidth"></span>别：</label>
                            <p>
                                <label style="margin:0 20px 0 10px;"><input type="radio" name="RadioGroup1" value="男" id="RadioGroup1_0"/>男</label>
                                <label style="margin-right:20px;"><input type="radio" name="RadioGroup1" value="女" id="RadioGroup1_1" />女</label>
                                <label><input type="radio" name="RadioGroup1" value="保密" id="RadioGroup1_2" checked="checked" />保密</label>
                            </p>
                        </div>
                        <div>
                            <label class="detialLabel">生<span class="lwidth"></span>日：</label>
                            <p style=" margin-left:10px;">
                                <select id="birthYear">
                                    <option value="0" disabled="" selected="selected">请选择：</option>
                                    <option value="1990">1990</option>
                                    <option value="1990">1991</option>
                                </select>
                                <label>年</label>
                                <select id="birthMonth">
                                    <option value="0" disabled="" selected="selected">请选择：</option>
                                    <option value="01">01</option>
                                    <option value="02">02</option>
                                    <option value="03">03</option>
                                </select>
                                <label>月</label>
                                <select id="birthDay">
                                    <option value="0" disabled="" selected="selected">请选择：</option>
                                    <option value="01">01</option>
                                    <option value="02">02</option>
                                </select>
                                <label>日</label>
                            <p>
                        </div>
                        <div>
                        	<input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        	
                            <input type="button" value="提交" onclick="postMyInformation()" class="detialBtn" />
                        </div>
                    </div>

                    <div class="myDetialList myAddress" style="display:none;">
                        <input type="button" value="新增收货地址" class="detialBtn newAddress" onclick="openTipDiv('addressDiv')" style="margin-left:0; margin-top:0;" />
                        <#list queryMemberAddress as key>
                        <div class="myAddressItem">
                            <div class="addrDefaultInforTop">
                                <div class="addrDefaultInfor">
                                    <span class="addrName">收货人名字</span>
                                    <span class="defStyle">默认地址</span>
                                </div>
                                <div class="addrOperBtn">
                                    <span class="setToDefAddr" style="display:none;">设为默认</span>
                                    <span class="modifyAddr" ttoken="${_csrf.token}" objId="${key.objectID}">编辑</span>
                                    <span class="deleteAddr" ttoken="${_csrf.token}" objId="${key.objectID}">删除</span>
                                </div>
                            </div>
                            <div><label>收货人：</label><span class="addrN">${key.name}</span></div>
                            <div><label>收货地址：</label><span class="addrA">${key.addr}</span></div>
                            <div><label>手机号码：</label><span class="addrP">${key.phone}</span></div>
                            <div><label>收货地址ID：</label><span class="addrID">${key.objectID}</span></div>
                        </div>
                        
						</#list>
                        
                    </div>
                </div>

            </div>
        </div>
    </div>


    <!--底部-->
    <#include "/lib/template/footer.ftl" encoding="UTF-8">
    <!--end 底部-->

    <div id="loginBg"></div>
    <!--地址-->
    <div class="addressDiv">
        <div class="jf-overflowH tipDivTitle"><h3 style="float:left;">收货地址</h3><span onclick="closeTipDiv('addressDiv')" style="float:right; cursor:pointer; color:#999;font-size:25px;">×</span></div>
        <div><label><span class="colorRed">*</span>收货人：</label><input type="text" id="addressName" value="" /></div>
        <div><label><span class="colorRed">*</span>收货地址：</label><input type="text" id="addressAddr" value="" style="width:477px" /></div>
        <div><label><span class="colorRed">*</span>手机号码：</label><input type="text" id="addressPhone" value="" /></div>
        <p style="margin:10px 0 0 90px;"><input type="hidden" id="operType" name="operType" value="0"/><input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}"/><input type="button" value="保存" class="sureBtn" onclick="saveAddr()" /><input type="button" value="取消" class="cancleBtn"  onclick="closeTipDiv('addressDiv')" /></p>
    </div>
    <!--地址 end-->
    <!--提示框-->
    <div class="tipDiv">
        <div class="jf-overflowH tipDivTitle"><h3 style="float:left;">提示</h3><span onclick="closeTipDiv('tipDiv')" style="float:right; cursor:pointer; color:#999;font-size:25px;">×</span></div>
        <p class="tipShow" style="font-size:14px; font-weight:bold; color:#f60"></p>
        <p><input type="button" value="确定" class="sureBtn" onclick="closeTipDiv('tipDiv')" /><input type="button" value="取消" class="cancleBtn"  onclick="closeTipDiv('tipDiv')" /></p>
    </div>
    <!--提示框 end-->

</body>
</html>
<script language="javascript">
$(document).ready(function(e) {
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
    //新增地址
    $('.newAddress').click(function(){
        $('#addressName').val('');
        $('#addressAddr').val('');
        $('#addressPhone').val('');
        $('#operType').val("0"); 
    });

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
        var addr = a.find('.addrA').text();
        var phone = a.find('.addrP').text();
        openTipDiv('addressDiv');
        if(name!=""){
            $('#addressName').val(name);
            $('#addressAddr').val(addr);
            $('#addressPhone').val(phone);
            $('#operType').val("1"); 
        }
    })
})
function showDiv(obj) {
    $(".myDetialList").css("display","none");
    $("." + obj).css("display","block");
}
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