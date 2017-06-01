<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<title>发票信息-逸乐生活网</title>
<meta name="description" content="途皓（北京）商务服务有限公司" />
<meta name="keywords" content="途皓（北京）商务服务有限公司" />
<link rel="stylesheet" type="text/css" href="<@spring.url '/css/css.css'/>"/>
<link rel="stylesheet" type="text/css" href="<@spring.url '/css/style.css'/>"/>
<script type="text/javascript" src="<@spring.url '/js/gd_Index.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/js/jquery-1.7.2.min.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/js/menu.js'/>" ></script>
<script language="javascript" src="<@spring.url '/js/jquery.validate.min.js'/>" ></script>
<script language="javascript" src="<@spring.url '/js/jquery.validate.addMethod.js'/>" ></script>
<style>
.myAddress .myAddressItem{ border:2px solid #eee; padding:10px 15px; margin-top:10px;}
.myAddressItem div{ margin-bottom:0;}
.myAddressItem label,.addressDiv label{ width:130px; display:inline-block; text-align:right;}
.myAddressItem .addrDefaultInforTop{ margin-bottom:10px; overflow:hidden;}
.addrDefaultInfor{ float:left;}
.addrOperBtn{ float:right;}
.defStyle{ color:#fff; background:#f90; padding:0 5px; display:inline-block;}
.addrName{ font-weight:bold; margin-right:10px;}
.addrOperBtn span{ color:#3897d7; margin-left:10px; cursor:pointer;}
.addrOperBtn span:hover{ text-decoration: underline;}

.addressDiv{ height:400px; margin: -200px 0 0 -300px;}
.addressDiv div{ padding:10px; color:#666; font-size:14px;}
.addressDiv .tipDivTitle{ padding:0; margin-bottom:10px;}
.addressDiv input[type=text]{ padding:0 5px; border:1px solid #ccc; height:25px; line-height:25px;}
.colorRed{color:red;}
.myDetialTxt{padding:0 5px; margin-left: 5px; line-height: 25px; height: 25px;}
.inputRO{ border:1px solid #fff;}
.inputRW{ border:1px solid #ccc;}
.detialLabel{ width:80px; text-align: right;}
.myAddressItem label{ width: 130px; line-height: 27px;}
.birthD{ height:25px; line-height: 25px;}
#informationOfMy div{ position:relative;}
#memberName-error,#identityCardNo-error,#email-error,#gender-error,#birthdayDate-error{ position:absolute; left:305px; top:0; color:#f00; padding:0 10px; background:#ffebe7; line-height:25px; border:1px solid #f00; border-radius:5px;}
.birthD{ color:#666;}
.marginTB{ margin: 5px 0;}
.addrBtn{ background: #fff; border: none; color: #3897d7; cursor: pointer;}
.addrBtn:hover{ text-decoration: underline;}
select{ margin-left: 5px; line-height: 25px; height: 25px; border-color: #ccc; color: #666;}
.addressDiv select{ margin-left: 0;}
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
                <h1 class="baseinfo-Title">发票信息</h1>
                <div class="myDetial">
                    <div class="myDetialList myAddress">
                        <input type="button" value="新增发票信息" class="detialBtn newAddress" onclick="openTipDiv('addressDiv')" style="margin-left:0; margin-top:0;" />
                        
                        <form method="post" action="<@spring.url '/modAddr'/>">
                            <div class="myAddressItem">
                                <div class="addrDefaultInforTop">
                                    <div class="addrDefaultInfor">
                                        <span class="addrName">发票标签</span>                                        
                                        <span class="defStyle">默认发票</span>                                       
                                    </div>
                                    <div class="addrOperBtn">                                   	
                                        <input type="submit" value="设为默认" class="setToDefAddr addrBtn" />                                   
                                        <input type="button" value="编辑" class="modifyAddr addrBtn" />
                                        <input type="submit" value="保存" class="updateAddr addrBtn" style="display: none;" />
                                        <input type="submit" value="删除" class="deleteAddr addrBtn" />
                                    </div>
                                </div>
                                <div class="marginTB">
                                	<label>发票抬头：</label>
                                	<input id="invoiceTitle" name="invoiceTitle" type="text" value="" class="myDetialTxt inputRO" readOnly="true" style="width: 680px;" />
                                </div>
                                <div class="marginTB">
                                	<label>发票类型：</label>
                                	<input id="invoiceType" name="invoiceType" type="text" value="" class="myDetialTxt inputRO" readOnly="true" />
                                	<select style="display: none;">
                                		<option>纸质发票</option>
                                		<option>电子发票</option>
                                	</select>
                                </div>
                                <div class="marginTB">
                                	<label>发票内容：</label>
                                	<input id="invoiceCon" name="invoiceCon" type="text" value="" class="myDetialTxt inputRO" readOnly="true" />
                                	<select style="display: none;">
                                		<option>办公用品</option>
                                		<option>日用品</option>
                                	</select>
                                </div>
                                <div class="marginTB">
                                	<label>收票人手机：</label>
                                	<input id="invoicePhone" name="invoicePhone" type="text" value="" class="myDetialTxt inputRO" readOnly="true"  maxlength="11" />
                                </div>
                                <div class="marginTB">
                                	<label>收票人邮箱：</label>
                                	<input id="invoiceEmail" name="invoiceEmail" type="text" value="" class="myDetialTxt inputRO" readOnly="true" />
                                </div>
                                <div class="marginTB">
                                	<label>公司纳税人识别号：</label>
                                	<input id="invoiceNum" name="invoiceNum" type="text" value="" class="myDetialTxt inputRO" readOnly="true" />
                                </div>
                                
                            </div>
                        </form>
                       
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

    <div id="loginBg"></div>
    <!--新增发票-->
    <div class="addressDiv">
        <form method="post" action="">
            
        <div class="jf-overflowH tipDivTitle"><h3 style="float:left;">发票信息</h3><span onclick="closeTipDiv('addressDiv')" style="float:right; cursor:pointer; color:#999;font-size:25px;">×</span></div>
        <div>
        	<label><span class="colorRed"></span>发票抬头：</label>
        	<input type="text" id="addAnvoiceTitle" name="addAnvoiceTitle" value="" style="width:427px;" />
        </div>
        <div>
        	<label><span class="colorRed"></span>发票类型：</label>
        	<select>
                <option>纸质发票</option>
				<option>电子发票</option>
			</select>
        </div>
        <div>
        	<label><span class="colorRed"></span>发票内容：</label>
        	<select>
				<option>办公用品</option>
				<option>日用品</option>
			</select>
        </div>
        <div>
        	<label><span class="colorRed"></span> 收票人手机：</label>
        	<input type="text" id="addAnvoicePhone" name="addAnvoicePhone" value="" />
        </div>
        <div>
        	<label><span class="colorRed"></span>收票人邮箱：</label>
        	<input type="text" id="addAnvoiceEmail" name="addAnvoiceEmail" value="" />
        </div>
        <div>
        	<label><span class="colorRed"></span> 公司纳税人识别号：</label>
        	<input type="text" id="addAnvoiceNum" name="addAnvoiceNum" value="" />
        </div>
        <p style="margin:10px 0 0 140px;"><input type="hidden" id="operType" name="operType" value="0"/><input type="hidden" id="" name="" value=""/><input type="submit" value="保存" class="sureBtn"  /><input type="button" value="取消" class="cancleBtn"  onclick="closeTipDiv('addressDiv')" /></p>
            <input type="hidden" name="isDefault" value="0"/>
            <input type="hidden" name="objectID" id="objectID" value=""/>
            <input type="hidden" name="forword" id="forword" value="myAddress"/>
        </form>
    </div>
    <!--新增发票 end-->
    <!--提示框-->
    <div class="tipDiv">
        <div class="jf-overflowH tipDivTitle"><h3 style="float:left;">提示</h3><span onclick="closeTipDiv('tipDiv')" style="float:right; cursor:pointer; color:#999;font-size:25px;">×</span></div>
        <p class="tipShow" style="font-size:14px; font-weight:bold; color:#f60"></p>
        <p><input type="button" value="确定" class="sureBtn" onclick="closeTipDiv('tipDiv')" /></p>
    </div>
    <!--提示框 end-->

</body>
</html>
<script language="javascript">
$(document).ready(function(e) {
	//设为默认值
    $('.setToDefAddr').click(function(){
    	var action = "";
    	$(this).parent().parent().parent().parent().attr('action',action);
    	$('.isDefaultInput').val('0');
    	$(this).parent().parent().parent().parent().find('.isDefaultInput').val('1');
    });
    
    //删除发票
    $('.deleteAddr').click(function(){
    	var action = "";
		$(this).parent().parent().parent().parent().attr('action',action);
    });

    //编辑发票
    $('.modifyAddr').click(function(){       		$(this).parent().parent().parent().find('.inputRO').addClass('inputRW').removeAttr('readonly').removeClass('inputRO');
		$(this).parent().parent().parent().find('.modifyAddr').hide();
		$(this).parent().parent().parent().find('.updateAddr').show();
		$(this).parent().parent().parent().find('#invoiceType').hide();
		$(this).parent().parent().parent().find('#invoiceType').next('select').show();
		$(this).parent().parent().parent().find('#invoiceCon').hide();
		$(this).parent().parent().parent().find('#invoiceCon').next('select').show();
	});
	
	//保存发票
	$('.updateAddr').click(function(){
		var action = "";
    	$(this).parent().parent().parent().parent().attr('action',action);
		$(this).parent().parent().parent().find('.inputRW').addClass('inputRO').attr('readonly','ture').removeClass('inputRW');
		$(this).parent().parent().parent().find('.updateAddr').hide();
		$(this).parent().parent().parent().find('.modifyAddr').show();
		$(this).parent().parent().parent().find('#invoiceType').show();
		$(this).parent().parent().parent().find('#invoiceType').next('select').hide();
		$(this).parent().parent().parent().find('#invoiceCon').show();
		$(this).parent().parent().parent().find('#invoiceCon').next('select').hide();
	});

})
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