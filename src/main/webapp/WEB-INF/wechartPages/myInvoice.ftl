<#import "/spring.ftl" as spring/>
<!DOCTYPE html>
<!-- saved from url=(0054)http://www.sucaihuo.com/modals/20/2070/demo/dizhi.html -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>微商城发票信息-逸乐生活网</title>   
    <link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/font_1459473269_4751618.css'/>">
	<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/bootstrap.min.css'/>">
	<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/pstyle.css'/>">
	<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/style.css'/>">
	<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/buttons.css'/>">
	<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/font-awesome.min.css'/>">
	<script type="text/javascript" src="<@spring.url '/wechart/js/jquery-1.10.2.min.js'/>"></script>
	<script type="text/javascript" src="<@spring.url '/wechart/js/bootstrap.min.js'/>"></script>
<!--必要样式-->
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/menu_elastic.css'/>">
<script type="text/javascript" src="<@spring.url '/wechart/js/snap.svg-min.js'/>"></script>
<!--[if IE]>
<script src="js/html5.js"></script>
<![endif]-->
<style>
*:focus {outline: none;}
.usercenter .cdv .inputRW{ border:1px solid #ccc;}
.usercenter .cdv .inputRO{ border:1px solid #fff;}
.usercenter .cdv p{ overflow: hidden; padding-bottom: 10px;}
.usercenter .cdv .addrTxt{ text-align: right; min-width: 108px; max-width: 130px; float: left; color: #666;}
.usercenter .cdv .addrInputTxt{ width: 62%; min-width: 150px; float: left; padding: 0 5px; height: 25px; line-height: 25px;-webkit-appearance: none;}
.cdv p{ position: relative;}
#errorShow{ text-align: center;}
.errorTxt{ text-align: center; min-height: 20px; line-height: 20px; color: #f00; background:#ffebe7; padding: 0 10px; border: 1px solid #f00; border-radius:5px; display: none;}
.fixed{position:fixed ;z-index: 99999;width: 100%;}
label.error{ position:absolute; left: 107px; top:26px; color: #f00; font-weight: normal;}
</style>
</head>
<body class="huibg">
<nav class="navbar text-center fixed">
   <button class="topleft" onclick="window.location.href='<@spring.url "/member"/>'"><span class="iconfont icon-fanhui"></span></button>
  <a class="navbar-tit center-block">发票信息</a>
</nav>

<div class="usercenter" style="padding-bottom: 50px;">
  <div class="cdv">
    <a href="<@spring.url '/myInvoiceOperation'/>"><span>新增发票信息</span></a>
  </div>
   <#list queryMemberInvoice as item>
  <form  class="addInvoiceForm" method="post" action="<@spring.url '/modInvoice'/>">
    
	<div class="cdv dzi">
		    <p style="padding-bottom: 5px;">
		    	<button class="label label-warning pull-right deleteAddr" style="margin-left: 10px; background: #ccc; color: #666">删除</button>
				<span id="edit" class="label label-warning pull-right modifyAddr" style="margin-left: 10px; background: #3897d7;">编辑</span>
				<button id="save" class="label label-warning pull-right updateAddr" style="margin-left: 10px; background: #3897d7;display: none;">保存</button>
		      	
		      	<#if item.isDefault == "1">
		      		<span class="label label-danger pull-right">默认</span>
		      	</#if>
		      		
		      	<#if item.isDefault == "0">
		      		<span class="label label-warning pull-right setToDefAddr">设为默认</span>
		      	</#if>
		    </p>
		     <p>
		    	<span class="addrTxt">发票标签：</span>
		    	<input type="text" id="addBillTag" name="billTag" class="addrInputTxt inputRO"   readOnly="true" value="${item.billTag}"/>
		    </p>
		    <p>
		    	<span class="addrTxt">发票抬头：</span>
		    	<input type="text" id="rcptTitle" class="addrInputTxt inputRO"  name="rcptTitle" value="${item.rcptTitle}"  readOnly="true" />
		    </p>
		   <p>
		    	<span class="addrTxt">发票类型：</span>
		    	<#if item.receiptType == '1'>
				    <#assign rec='个人'>
				    <#else>
				    <#assign rec='法人'>
				</#if>
			    <input type="hidden" value="${item.receiptType}" />
                <input id="receiptType" type="text" value="${rec}" class="inputRO " readOnly="true" style="width:30%;text-indent: 5px;-webkit-appearance: none;"/>
		    	<select name="receiptType" id="addReceiptType"style="display: none;">  
		    		
			        <option value="1">个人</option>   
			        <option value="2">法人</option>   
      			</select>   
		    </p>
		    <p>
		    	<span class="addrTxt">发票内容：</span>
		    	<#if item.rcptContent == '0'>
				<#assign rcp='明细'>
				<#elseif item.rcptContent == '1'>
				<#assign rcp='办公用品'>
				<#elseif item.rcptContent == '2'>
				<#assign rcp='电脑配件'>
				<#elseif item.rcptContent == '3'>
				<#assign rcp='耗材'>
				<#elseif item.rcptContent == '10'>
				<#assign rcp='用品'>
				<#elseif item.rcptContent == '11'>
				<#assign rcp='日用品'>				                    
				<#else>
				<#assign rcp='礼品'>
				</#if>
                <input type="hidden" value="${item.rcptContent}" />
                <input id="rcptContent" type="text" value="${rcp}" class="inputRO" readOnly="true"  style="width:30%;text-indent: 5px;-webkit-appearance: none"/>                               	
		    	<select name="rcptContent" id="addRcptContent" style="display: none;">   
			        <option value="0">明细</option>
	                <option value="1">办公用品</option>
	                <option value="2">电脑配件</option>
	                <option value="3">耗材</option>
	                <option value="10">用品</option>
	                <option value="11">日用品</option>
	                <option value="12">礼品</option>
      			</select>   
		    </p>
		    <p>
		    	<span class="addrTxt">收票人手机：</span>
		    	<input type="text"   id="mobile" name="mobile" class="addrInputTxt inputRO"   value="${item.mobile}"  maxlength="11"  readOnly="true"/>
		    </p>
		    <p>
		    	<span class="addrTxt">收票人邮箱：</span>
		    	<input type="text"  class="addrInputTxt inputRO" id="billReceiverMail" name="billReceiverMail" value="${item.billReceiverMail}" readOnly="true"/>
		    </p>
		    <p>
		    	<span class="addrTxt" >公司纳税人识别号：</span>
		    	<input type="text"   class="addrInputTxt inputRO"  id="taxpayerID" name="taxpayerID" value="${item.taxpayerID}" readOnly="true"/>
		    </p>
		    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="hidden" name="isDefault" class="isDefaultInput" value="${item.isDefault}"/>
		      
	  	</div>
	</form>
  
  	</#list>
</div>

	<!--底部-->
	<#include "/lib/template/footer.ftl" encoding="UTF-8">
	<!--end 底部--> 
<script type="text/javascript">
	//usercenter层的padding-top值随着fixed的高度变化而变化
	$(document).ready(function(){
		var height = $(".fixed").height();
		var padding = height+10+'px';
		$(".usercenter").css("padding-top",padding);
	});
	$(window).resize(function() {
		var height = $(".fixed").height();
		var padding = height+10+'px';
		$(".usercenter").css("padding-top",padding);
	});	
	$(function(){
		$('#addReceiptType').hide();
		//删除发票
    $('.deleteAddr').click(function(){
    	var action = "<@spring.url '/deleteInvoice'/>";
		$(this).parent().parent().parent().attr('action',action);
    });
    
    //编辑发票

    $('.modifyAddr').click(function(){
    	var thisP = $(this).parent().parent();
    	thisP.find('.inputRO').addClass('inputRW').removeAttr('readonly').removeClass('inputRO');
		thisP.find('.modifyAddr').hide();
		thisP.find('.updateAddr').show();		
		thisP.find('#receiptType').hide();
		thisP.find('#receiptType').next('select').show();
		thisP.find('#rcptContent').hide();
		thisP.find('#rcptContent').next('select').show();
	
		var recType = thisP.find("#receiptType").prev().val();
		var rcptCon = thisP.find("#rcptContent").prev().val();
		thisP.find("#receiptType").next('select').val(recType);
		thisP.find("#rcptContent").next('select').val(rcptCon);

	});
	//保存发票
	$('.updateAddr').click(function(){

		var action = "<@spring.url '/modInvoice'/>";
		var thisP = $(this).parent().parent();
    	thisP.parent().attr('action',action);
		thisP.find('.inputRW').addClass('inputRO').attr('readonly','ture').removeClass('inputRW');
		thisP.find('.updateAddr').hide();
		thisP.find('.modifyAddr').show();
		thisP.find('#receiptType').show();
		thisP.find('#receiptType').next('select').hide();
		thisP.find('#rcptContent').show();
		thisP.find('#rcptContent').next('select').hide();

	});
	//设为默认值
    $('.setToDefAddr').click(function(){
    	var action = "<@spring.url '/modInvoice'/>";
    	$(this).parent().parent().parent().attr('action',action);
    	$('.isDefaultInput').val('0');
    	$(this).parent().parent().parent().find('.isDefaultInput').val('1');
    	$(this).parent().parent().parent().submit();
    });

});
	
    
 $().ready(function () {
        // 在键盘按下并释放及提交后验证提交表单
        $(".addInvoiceForm").validate({
            rules: {
               mobile: {
                    required: true,
                    isPhone: []
                },
			billReceiverMail: {
				email:true,
				isemail: []
			},
        },
            messages: {
              
                mobile: {
                    required: "请输入手机号码",
                    isPhone: "请输入正确的手机号码"
                },
               billReceiverMail: {
                	email:"请输入邮箱",
                	isemail: "请输入正确格式邮箱"
                },
               
            }
        });
    });
</script>
</body>
</html>
