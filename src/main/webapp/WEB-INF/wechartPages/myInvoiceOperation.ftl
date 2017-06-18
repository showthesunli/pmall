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
	<script type="text/javascript" src="<@spring.url '/wechart/js/jquery.validate.min.js'/>" ></script>
	<script language="javascript" src="<@spring.url '/wechart/js/jquery.validate.addMethod.js'/>" ></script>
<!--必要样式-->
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/menu_elastic.css'/>">
<script type="text/javascript" src="<@spring.url '/wechart/js/snap.svg-min.js'/>"></script>
<!--[if IE]>
<script src="js/html5.js"></script>
<![endif]-->
<style>

.usercenter .cdv p{ overflow: hidden; padding-bottom: 20px;}
.usercenter .cdv .addrTxt{ text-align: right; min-width: 108px; max-width: 80px; float: left; color: #666;}
.usercenter .cdv .addrInputTxt{ width: 62%; min-width: 150px; float: left; border: 1px solid #ccc; padding: 0 5px; height: 30px; line-height: 30px;}
.usercenter .cdv .addBtnA{ background: #f60; height: 30px; line-height: 30px; color: #fff;}
.cdv p{ position: relative;}
label.error{ position:absolute; left: 107px; top:26px; color: #f00; font-weight: normal;}
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
   <button class="topleft" onclick="window.location.href='<@spring.url "/myInvoice"/>'"><span class="iconfont icon-fanhui"></span></button>
  <a class="navbar-tit center-block">发票信息</a>
</nav>


<div class="usercenter">
  
  
  	<form class="addInvoiceForm" method="post" action="<@spring.url '/addInvoice'/>">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>  	
	  	<div class="cdv dzi" style="padding-top: 25px;">
	  	
             <p>
	        	<span class="addrTxt">发票标签：</span>
	        	<input type="text" id="addBillTag" class="addrInputTxt" name="billTagShow" value=""  />
	        	<input type="hidden" name="billTag" />
        	</p>
		    <p>
		    	<span class="addrTxt">发票抬头：</span>
		    	<input type="text" value=""  id="addBillTag" class="addrInputTxt"  name="rcptTitle"  />
		    </p>
		    <p>
		    	<span class="addrTxt">发票类型：</span>
		    	<select id="addReceiptType" name="receiptType">   
			        <option value="1">个人</option>   
			        <option value="2">法人</option>   
      			</select>   
		    </p>
		    <p>
		    	<span class="addrTxt">发票内容：</span>
		    	<select id="addRcptContent" name="rcptContent">   
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
		    	<input type="text" value="" id="phone" class="addrInputTxt"  name="mobile" maxlength="11"/>
		    </p>
		    <p>
		    	<span class="addrTxt">收票人邮箱：</span>
		    	<input type="text" value=""  id="addBillReceiverMail email" class="addrInputTxt email"  name="billReceiverMail"/>
		    </p>
		     <p>
	        	<span class="addrTxt" >公司纳税人识别号：</span>
	        	<input type="text" id="addTaxpayerID" class="addrInputTxt" name="taxpayerID" value="" />
       		 </p>
		    <p>
		    	<span class="addrTxt">&nbsp;</span>
		    	<input type="submit" value="确 定" class="addBtnA" style="width: 62%;" />
		    </p>
		    <input type="hidden" id="operType" name="operType" value="0"/>
		    <input type="hidden" name="isDefault" value="0"/>
            <input type="hidden" name="objectID" id="objectID" value=""/>
            <input type="hidden" name="forword" id="forword" value="myInvoice"/>
		 </form>   
	

		</div>
</div>

	<!--底部-->
	<#include "/lib/template/footer.ftl" encoding="UTF-8">
	<!--end 底部--> 

</body>
<script>
    $().ready(function () {
        // 在键盘按下并释放及提交后验证提交表单
        $(".addInvoiceForm").validate({
            rules: {
               rcptTitle: {
                    required: true,
                },
                receiptType: {
                    required: true,
                },
                rcptContent: {
                    required: true,
                },
               	mobile: {
               		required: true,
                    isPhone: []
                },
				billReceiverMail: {
					required: true,
					email:true
				},
				taxpayerID: {
                    required: true,
                },
        	},
            messages: {
              	rcptTitle: {
                    required: "请输入发票抬头"
                },
                receiptType: {
                    required: "请输入发票类型"
                },
                rcptContent: {
                    required: "请输入发票内容"
                },
                mobile: {
                	required: "请输手机号码",
                    isPhone: "请输入正确的手机号码"
                },
               	billReceiverMail: {
               		required: "请输入邮箱",
                	email:"请输入正确格式的邮箱"
                },
                taxpayerID: {
                    required: "请输入公司纳税人识别号"
                },               
            }
        });
        
        $('.addInvoiceForm .addBtnA').click(function(){
    		var tag = $('#addBillTag').val();
    		if(tag != ""){
    			$('.addInvoiceForm input[name=billTag]').val(tag);
    		}
    		else{
    			$('.addInvoiceForm input[name=billTag]').val('我的发票');
    		}
    	})
    });
</script>
</html>
