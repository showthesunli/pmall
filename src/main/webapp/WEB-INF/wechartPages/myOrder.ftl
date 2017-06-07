<#import "/spring.ftl" as spring/>
<!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<meta name="description" content="途皓（北京）商务服务有限公司" />
	<meta name="keywords" content="途皓（北京）商务服务有限公司" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>微商城我的订单-逸乐生活网</title>
	<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/font_1459473269_4751618.css'/>">
	<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/bootstrap.min.css'/>">
	<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/pstyle.css'/>">
	<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/style.css'/>">
	<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/dropload.css'/>">
	<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/font-awesome.min.css'/>">
	<script type="text/javascript" src="<@spring.url '/wechart/js/jquery-1.10.2.min.js'/>"></script>	
	<script type="text/javascript" src="<@spring.url '/wechart/js/jquery.accordion.js'/>"></script>
	<script type="text/javascript" src="<@spring.url '/wechart/js/dropload.min.js'/>"></script>

<!--必要样式-->
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/menu_elastic.css'/>">
<script type="text/javascript" src="<@spring.url '/wechart/js/snap.svg-min.js'/>"></script>
<!--[if IE]>
<script src="<@spring.url '/wechart/js/html5.js'/>"></script>
<![endif]-->
<style type="text/css">
	.fixed{position:fixed ;z-index: 99999;width: 100%;}
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
<nav class="navbar text-center fixed">
   <button class="topleft" onclick="window.location.href='<@spring.url "/member"/>'"><span class="iconfont icon-fanhui"></span></button>
  <a class="navbar-tit center-block">我的订单</a>
</nav>


<div class="usercenter" style="padding-left: 0;">
	<div id="content" style=" margin-bottom: 50px;">
	  	<div class="contentLists">
	  		
	  		<#list queryMemberOrder as key>
			
			<div class="box_exp info_light">
				<div class="info_integral">
					<span class="title" style="font-size: 14px;">订单号：${key.billNo}</span>
				</div>
				<div style="display: block; overflow: hidden; opacity: 1;">
					<div class="info_child" style=" color: #333;">
						
						<p>订单状态：<span style="color: #f60;">${key.orderStatus}</span></p>
						<p>配送状态：<span style="color: #f60;">${key.deliveryStatus}</span></p>
						<p>订单总额：<span style="color: #f60;">￥${key.totalPrice}</span></p>
						
					</div>
					<div class="info_child_txt" style="text-align: center;">
						<#if key.orderStatus == "等待支付">
						<a href="<@spring.url '/buycfm'/>;billNo=${key.billNo};termID=wechat" style="color: #3897d7; margin-right: 20px;">继续支付</a>
						</#if>
						<a href="<@spring.url '/myDetial'/>?billNo=${key.billNo}" style="color: #3897d7;">详情</a>
					</div>
				</div>
			</div>
			
			</#list>
			
		</div>
	</div>
  
  	<!--底部-->
	<#include "/lib/template/footer.ftl" encoding="UTF-8">
	<!--end 底部-->
</div>

<script>
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
	
$(document).ready(function() {
	 $("#content").accordion({
		alwaysOpen: false,
		autoheight: false,
		header: '.info_integral',
		clearStyle: true
	});
	
    // 页数
    var page = 1;
    // 每页展示个数
    var size = 6;

    // dropload
    $('#content').dropload({    	
        scrollArea : window,
        domDown : {
            domClass   : 'dropload-down',
            domRefresh : '<div class="dropload-refresh">↑上拉加载更多</div>',
            domLoad    : '<div class="dropload-load"><span class="loading"></span>加载中</div>',
            domNoData  : '<div class="dropload-noData">暂无更多</div>'
        },
        loadDownFn : function(me){
            page++;
            // 拼接HTML
            var result = '';
            $.ajax({               
                url: '<@spring.url "/myOrderList;currentPage='+page+';numOfPerPage='+size+';"/>',
                type: 'GET',
                dataType: 'json',
                success: function(data){
                	if(data.queryMemberOrder_totalRecNum != 0){
                		var arrLen = data.queryMemberOrder.length;
                    if(arrLen > 0){
                        for(var i=0; i<arrLen; i++){
                        	var link1 = "<@spring.url '/buycfm'/>;billNo="+data.queryMemberOrder[i].billNo+";termID=wechat";
                        	var link2 = "<@spring.url '/myDetial'/>?billNo="+data.queryMemberOrder[i].billNo;
                        	
                        	var wattingPayhtml = '';
                        	if(data.queryMemberOrder[i].orderStatus == "等待支付" ){
                        		wattingPayhtml = '<a href="'+link1+'" style="color: #3897d7; margin-right: 20px;">继续支付</a>';
                        	}
                        	
                        	result +=	'<div class="box_exp info_light">'
                        					+'<div class="info_integral">'
                        						+'<span class="title" style="font-size: 14px;">订单号：'+data.queryMemberOrder[i].billNo+'</span>'
                        					+'</div>'
                        					+'<div style="display:none;">'
                        						+'<div class="info_child" style=" color: #333;">'
                        							+'<p>订单状态：'
                        								+'<span style="color: #f60;">'+data.queryMemberOrder[i].orderStatus+'</span>'
                        							+'</p>'
                        							+'<p>配送状态：'
                        								+'<span style="color: #f60;">'+data.queryMemberOrder[i].deliveryStatus+'</span>'
                        							+'</p>'
                        							+'<p>订单总额：'
                        								+'<span style="color: #f60;">￥'+data.queryMemberOrder[i].totalPrice+'</span>'
                        							+'</p>'
                        						+'</div>'
                        						+'<div class="info_child_txt" style="text-align: center;">'
                        							+wattingPayhtml
                        							+'<a href="'+link2+'" style="color: #3897d7;">详情</a>'
                        						+'</div>'
                        					+'</div>'
                        				+'</div>';
                        							                     
                        }
                    // 如果没有数据
                    }else{
                        // 锁定
                        me.lock();
                        // 无数据
                        me.noData();
                    }
                    // 为了测试，延迟1秒加载
                    setTimeout(function(){
                        // 插入数据到页面，放到最后面
                        $('.contentLists').append(result);
                        // 每次数据插入，必须重置
                        me.resetload();
                    });
                    }
                },
                error: function(xhr, type){
                    alert('抱歉，网络问题无法加载更多商品。');
                    // 即使加载出错，也得重置
                    me.resetload();
                }
            });
        }
    });
    
});
</script>
</body>
</html>