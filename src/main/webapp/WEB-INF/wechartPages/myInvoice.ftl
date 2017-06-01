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
.usercenter .cdv p{ overflow: hidden; padding-bottom: 10px;}
.usercenter .cdv .addrTxt{ text-align: right; min-width: 89px; max-width: 130px; float: left; color: #666;}
.usercenter .cdv .addrInputTxt{ width: 70%; min-width: 150px; float: left; border: 1px solid #ccc; padding: 0 5px; height: 25px; line-height: 25px;}
.cdv p{ position: relative;}

</style>
</head>
<body class="huibg">
<nav class="navbar text-center">
   <button class="topleft" onclick="window.location.href='<@spring.url "/member"/>'"><span class="iconfont icon-fanhui"></span></button>
  <a class="navbar-tit center-block">发票信息</a>
</nav>

<div class="usercenter" style="padding-bottom: 50px;">
  <div class="cdv">
    <a href="<@spring.url '/myInvoiceOperation'/>"><span>新增发票信息</span></a>
  </div>
  
	<div class="cdv dzi">
		    <p>
		    	<button class="label label-warning pull-right deleteAddr" style="margin-left: 10px; background: #ccc; color: #666">删除</button>
				<button id="delete" class="label label-warning pull-right" style="margin-left: 10px; background: #3897d7;">编辑</button>
				<button id="save" class="label label-warning pull-right" style="margin-left: 10px; background: #3897d7;display: none;">保存</button>
		      	<button class="label label-warning pull-right setToDefAddr">设为默认</button>
		    </p>
		    <p>
		    	<span class="addrTxt">发票抬头：</span>
		    	<input type="text"  class="addrInputTxt"  />
		    </p>
		   <p>
		    	<span class="addrTxt">发票类型：</span>
		    	<select name="" id="">   
			        <option value="1">纸质发票</option>   
			        <option value="2">电子发票</option>   
      			</select>   
		    </p>
		    <p>
		    	<span class="addrTxt">发票内容：</span>
		    	<select name="" id="">   
			        <option value="1">办公用品</option>   
			        <option value="2">日用品</option>   
      			</select>   
		    </p>
		    <p>
		    	<span class="addrTxt">收票人手机：</span>
		    	<input type="text"  class="addrInputTxt"  />
		    </p>
		    <p>
		    	<span class="addrTxt">收票人邮箱：</span>
		    	<input type="email"  class="addrInputTxt"  />
		    </p>
		    <p>
		    	<span class="addrTxt" style="font-size: 10px;">公司纳税人识别号：</span>
		    	<input type="text"   class="addrInputTxt"  />
		    </p>
		    
		      
	  	</div>
</div>

	<!--底部-->
	<#include "/lib/template/footer.ftl" encoding="UTF-8">
	<!--end 底部--> 
<script type="text/javascript">
	$(function(){
		$('.addrInputTxt').css('display','none');
		$('select').css('display','none');
		$('#delete').click(function(){
			$('.addrInputTxt').css('display','block');
			$('select').css('display','block');
			$('#delete').css('display','none');
			$(this).parent().parent().parent().find('#save').show();
		})
	})
	$(function(){
		$('#save').click(function(){
			$('.addrInputTxt').css('display','none');
			$('select').css('display','none');
			$('#save').css('display','none');
			$(this).parent().parent().parent().find('#delete').show();
		})
	})
</script>
</body>
</html>
