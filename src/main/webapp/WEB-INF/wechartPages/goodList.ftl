<#import "/spring.ftl" as spring/>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<meta name="format-detection" content="telephone=no" />
<meta name="description" content="途皓（北京）商务服务有限公司" />
<meta name="keywords" content="途皓（北京）商务服务有限公司" />
<title>商城分类</title>
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/style.css'/>">
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/font-awesome.min.css'/>">
<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/dropload.css'/>">
<script type="text/javascript" src="<@spring.url '/wechart/js/jquery-1.10.2.min.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/wechart/js/jquery.accordion.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/wechart/js/util.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/wechart/js/dropload.min.js'/>"></script>
<style>
.info_card i img{ min-width:100px; max-width:100px;}
.info_card{ padding-left: 100px;}
h1{ text-overflow: ellipsis; white-space: nowrap; overflow: hidden; height: 24px;}
</style>

</head>

<body ondragstart="return false;" onselectstart="return false;" oncontextmenu="return false" onselectstart="return false" 
ondragstart="return false" onbeforecopy="return false" oncopy=document.selection.empty() onselect=document.selection.empty()> 
<div id="page">
	<div class="banners">
		<a href="javascript:history.go(-1);"><img src="<@spring.url '/wechart/images/bg_info1.jpg'/>"></a>
	</div>
	
	<div id="content" style=" margin-bottom: 50px;">
		
		<div class="info_head info_light">
			<div class="droploadCon">
			
			<#list queryPrdListByPrdType as item>
                <div class="info_card">
                    <a href="<@spring.url '/proshow'/>;prdNo=${item.prdNo};keyWordsFld=${item.prdNo};">
                        <i><img src="<@spring.url '/imgsrc/'/>${item.iconFileName}" onerror="downloadErrImg(this,'${item.iconFileName}')" /></i>
                        <h1>${item.productInfo}</h1>
                        <span class="titles">￥${item.prdPrice}</span>
                    </a>
                </div>
			</#list>
			
			</div>
						
		</div>
		
			
	</div>
	
	<!--底部-->
	<#include "/lib/template/footer.ftl" encoding="UTF-8">
	<!--end 底部-->
	
</div>


<script>
	
$(document).ready(function() {	
	var urlinfo = window.location.href;
	var strs = new Array();
	var para = "";
	strs = urlinfo.split(";");
	for (i = 1; i < strs.length ; i++ ) 
	{ 		
		para += decodeURI(strs[i])+';';		
	}
	
	// 页数
    var page = 1;
    // 每页展示个数
    var size = 12;	
	
    // dropload
    $('.info_head').dropload({
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
                url: '<@spring.url "/goodsList;'+para+'currentPage='+page+';numOfPerPage='+size+';"/>',
                type: 'GET',
                dataType: 'json',
                success: function(data){  
                	if(data.queryPrdListByPrdType_totalRecNum >= 0){
                	var arrLen = data.queryPrdListByPrdType.length;
           
                    if(arrLen > 0){
                        for(var i=0; i<arrLen; i++){
                        	var link1 = "<@spring.url '/proshow'/>;prdNo="+data.queryPrdListByPrdType[i].prdNo+";keyWordsFld="+data.queryPrdListByPrdType[i].prdNo+";";
                        	var link2 = "<@spring.url '/imgsrc/'/>"+data.queryPrdListByPrdType[i].iconFileName;
                        	
                        	result +=	'<div class="info_card">'
                        					+'<a href="'+link1+'">'
                        						+'<i><img src="'+link2+'" onerror="downloadErrImg(this,'+data.queryPrdListByPrdType[i].iconFileName+')"></i>'
                        						+'<h1>'+data.queryPrdListByPrdType[i].productInfo+'</h1>'
                        						+'<span class="titles">￥'+data.queryPrdListByPrdType[i].prdPrice+'</span>'
                        					+'</a>'
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
                        $('.droploadCon').append(result);
                        // 每次数据插入，必须重置
                        me.resetload();
                    });
                    }
                	else{
                        me.lock();
                        me.noData();
                        me.resetload();
                	}
                },
                error: function(xhr, type){
                    //alert('抱歉，网络问题无法加载更多商品。');
                }
            });
        }
    });
    
});
</script>
</body>
</html>