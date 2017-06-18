<#import "/spring.ftl" as spring/>
<#import "/lib/macro/hisuMacro.ftl" as sf />
<!doctype html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<title>我的订单-逸乐生活网</title>
<meta name="description" content="途皓（北京）商务服务有限公司" />
<meta name="keywords" content="途皓（北京）商务服务有限公司" />
<link rel="stylesheet" type="text/css" href="<@spring.url '/css/css.css'/>"/>
<link rel="stylesheet" type="text/css" href="<@spring.url '/css/style.css'/>"/>
<script type="text/javascript" src="<@spring.url '/js/gd_Index.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/js/jquery.js'/>"></script>
<script language="javascript" src="<@spring.url '/js/menu.js'/>" ></script>
<style>
.rightOrder{ padding:0;}
.rightOrder h2{font-size:14px;}
.page{ padding-top:20px;}
td{ overflow:hidden; height:30px;}
.orderBtn a{ color:#3897d7; margin-left:10px;}
.orderBtn a:hover{ text-decoration:underline;}
.orderBtn .orderPaid{ color:#999; cursor:default;}
.orderBtn .orderPaid:hover{ text-decoration:none;}
.monthSearch span,.monthSearch select{ height: 25px; line-height: 25px; font-size: 14px;}
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
                <h1 class="baseinfo-Title">我的订单</h1>
                <div class="rightOrder">
                    <div>
                        <#-- TODO 注释按照日期分类
                    	<div class="monthSearch" style="text-align: right; margin-bottom: 10px;">
                    		<span>下单日期：</span>
                    		<select>
                    			<option disabled="disabled" selected="selected">--请选择--</option>
                    		</select>
                    		
                    	</div>
                    	-->
                        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="orderTable">
                            <tr>
                                <th width="35%">订单编号</th>
                                <th width="15%">下单时间</th>
                                <th width="10%">订单状态</th>
                                <th width="10%">配送状态</th>
                                <th width="10%">价格</th>
                                <th>操作</th>
                            </tr>
                            <#list queryMemberOrder as key>
                            <tr>
                                <td><a href="<@spring.url '/myDetial'/>?billNo=${key.billNo}">${key.billNo}</a></td>
                                <td>${key.saleDateTime}</td>
                                <td>${key.orderStatus}</td>
                                <td>${key.deliveryStatus}</td>
                                <td style="color:#f60;">￥${key.totalPrice}</td>
                                <td class="orderBtn">
                                    <#if key.orderStatus == "等待支付">
                                        <a href="<@spring.url '/buycfm'/>;billNo=${key.billNo};termID=web" style="margin-left:0;">继续支付</a>
                                        <a href="<@spring.url '/deleteOrder'/>?billNo=${key.billNo}" style="margin-left:10px;">取消订单</a>
                                    </#if>
                                </td>
                            </tr>
                            </#list>
                        </table>
                         <!--<div class="page"><a class="a1">22条</a> <a href="#" class="a1">上一页</a> <span>1</span> <a href="#">2</a> <a href="#">3</a> <a href="#" class="a1">下一页</a></div>-->
                    <#--分页 当前页，参与分页的总记录数，每页记录数-->
				    <#if queryMemberOrder_totalRecNum??>
				        <@sf.pageset currentPage queryMemberOrder_totalRecNum numOfPerPage "myOrder"></@sf.pageset>
				    </#if>
				    <!--end 主体-->
                    </div>
                </div>

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
$(document).ready(function(){
	getMonth();
	$('.monthSearch select').change(function(){
		window.location.href = "<@spring.url '/myOrder'/>";
	})
})
function getMonth(){
	var myDate = new Date();
	var year=myDate.getFullYear();
	var month=myDate.getMonth()+1;
	
	for(y=year;y>=2017;y--){
		for(m=month;m>=1;m--){
			if(m<10) m1 = '0' + m;
			else m1 = m;
			var html = '<option>' + y + m1 + '</option>';
			$('.monthSearch select').append(html);
		}
	}
	
}
</script>
