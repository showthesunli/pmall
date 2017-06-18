<#import "/spring.ftl" as spring/>
<!DOCTYPE HTML>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black" />
		<meta name="format-detection" content="telephone=no" />
		<meta name="keywords" content="途皓（北京）商务服务有限公司" />
		<meta name="description" content="途皓（北京）商务服务有限公司" />
		<title>微商城确认订单-逸乐生活网</title>
		<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/style.css'/>">
		<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/buttons.css'/>">
		<link rel="stylesheet" type="text/css" href="<@spring.url '/wechart/css/font-awesome.min.css'/>">
		<script type="text/javascript" src="<@spring.url '/wechart/js/jquery-1.10.2.min.js'/>"></script>
		<script type="text/javascript" src="<@spring.url '/wechart/js/jquery.accordion.js'/>"></script>
		<script type="text/javascript" src="<@spring.url '/wechart/js/unslider.min.js'/>"></script>
		<script type="text/javascript" src="<@spring.url '/wechart/js/util.js'/>"></script>
		<script type="text/javascript" src="<@spring.url '/wechart/js/jquery.validate.min.js'/>"></script>
		<script language="javascript" src="<@spring.url '/wechart/js/jquery.validate.addMethod.js'/>"></script>
		<style>
			.modifyBtn,
			.box_exp .addBtn,
			.sureBtn,
			.box_exp .cancBtn {
				padding: 0 10px;
				height: 1.75em;
				background: #fff;
				color: #3897d7;
				border: 1px solid #3897d7;
				border-radius: 5px;
			}
			.box_exp .noBtn{
				padding: 0 10px;
				height: 1.75em;
				background: #fff;
				color: #666;
				border: 1px solid #666;
				border-radius: 5px;
			}
			
			.box_exp .cancBtn {
				color: #666;
				border-color: #666;
			}
			
			.box_exp .addBtn {
				color: #f60;
				border: 1px solid #f60;
				margin-left: 20px;
			}
			
			.info_child {
				color: #333;
			}
			
			.proInforTxt {
				width: 70%;
				margin-left: 10px;
				height: 20px;
				line-height: 20px;
				text-overflow: ellipsis;
				white-space: nowrap;
				overflow: hidden;
				display: inline-block;
				float: left;
			}
			
			.payTypeItem {
				padding: 3px;
				border: 1px solid #eee;
				display: inline-block;
				margin: 0 10px 10px 0;
			}
			
			.payTypeItemBO {
				border-color: #f60;
			}
			
			.payTypeItem input[type=radio],
			.payTypeItem img {
				vertical-align: middle;
			}
			
			.addrDefault,
			.invoiceDefault {
				color: #f60;
			}
			
			.addrPhone {
				margin: 0 5px;
			}
			
			.invoiceType {
				margin:0 5px;
			}
			
			.info_child_list,
			.info_child_list1 {
				border: 1px solid #ccc;
				padding: 0 10px;
				margin-top: 0;
				margin-bottom: 10px;
			}
			
			.borderCO {
				border-color: #f60;
			}
			
			.errorCon {
				color: #f00;
			}
			
			.width70 {
				text-align: right;
				min-width: 70px;
				max-width: 70px;
				float: left;
				color: #666;
			}
			
			.addAddressList p,
			.addInvoiceList p {
				margin-bottom: 20px;
				position: relative;
			}
			
			.addAddressList input,
			.addInvoiceList input {
				width: 48%;
				padding: 0 5px;
				line-height: 26px;
				outline: none;
			}
			
			label.error {
				position: absolute;				
				top: 26px;
				color: #f00;
				font-weight: normal;
			}
			#addressName-error,
			#phone-error,
			#addressZip-error,
			#addAddr-error{
				left: 70px;
			}
			#addRcptTitle-error,
			#addMobile-error,
			#addBillReceiverMail-error,
			#addTaxpayerID-error{
				left: 126px;
			}
			.inputtext{
				text-align: right;
				min-width: 126px;
				float: left;
				color: #666;
			}
		</style>
	</head>

	<body ondragstart="return false;" onselectstart="return false;" oncontextmenu="return false" onselectstart="return false" ondragstart="return false" onbeforecopy="return false">
		<div id="page">
			<div class="banners">
				<a href="javascript:history.go(-1);"><img src="<@spring.url '/wechart/images/bg_info7.jpg'/>"></a>
			</div>
			<div id="content">

				<!--收货人信息-->
				<div class="box_exp info_light">
					<div class="info_integral">
						<span class="title"><i class="icon-bookmark-empty"></i>收货人信息</span>
					</div>
					<div style="display: block; overflow: hidden; opacity: 1;">

						<#if queryMemberAddress[0]??>

							<div class="info_child addrDefaultDiv" id="selectDiv">
								<p>
									<span class="addrName">${queryMemberAddress[0].name}</span>
									<span class="addrPhone">${queryMemberAddress[0].phone}</span>
									<span class="addrDefault"><#if queryMemberAddress[0].isDefault == "1">默认地址</#if></span>

								</p>
								<p><span class="address">${queryMemberAddress[0].addr}</span></p>
							</div>

							<#else>

								<div class="info_child addrDefaultDiv" id="selectDiv">
									<p>
										<span class="addrName"></span>
										<span class="addrPhone"></span>
										<span class="addrDefault"></span>
									</p>
									<p><span class="address"></span></p>
								</div>

						</#if>

						<!--地址列表-->

						<div class="addressList" style="height: 0; overflow: hidden;">
							<div class="addressListGetH" style="overflow: hidden;" onclick="changeAddress()">

								<#list queryMemberAddress as item>

									<div class="info_child info_child_list">
										<p>
											<span class="addrName">${item.name}</span>
											<span class="addrPhone">${item.phone}</span>
											<span class="addrDefault"><#if item.isDefault == "1" >默认地址</#if></span>
										</p>
										<p><span class="address">${item.addr}</span></p>
									</div>

								</#list>
							</div>

						</div>

						<!--end 地址列表-->

						<!--新增地址-->
						<div class="addAddressList" style="height: 0; overflow: hidden;">
							<form class="addAddressForm" action="<@spring.url '/addAddr'/>" method="post">
								<div class="info_child">
									<p>
										<span class="width70">收货人：</span>
										<input type="text" id="addressName" name="receiverName" value="" />
									</p>
									<p>
										<span class="width70">手机号码：</span>
										<input type="text" id="phone" name="phone" value="" />
									</p>
									<p>
										<span class="width70">邮政编号：</span>
										<input type="text" id="addressZip" name="zipCode" value="" />
									</p>
									<p>
										<span class="width70">收货地址：</span>
										<input type="text" id="addAddr" name="addr" value="" />
									</p>
									<p style="text-align: center;">
										<input type="submit" id="addressAddrBtn" class="addBtn" value="添 加" style="min-width:56px; max-width:56px; margin-right: 20px;" />
										<input type="button" value="取 消" class="cancBtn" style="min-width:56px; max-width:56px;" onclick="closeAddDiv('addAddressList')" />
									</p>
									<input type="hidden" name="isDefault" value="0" />
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
									<input type="hidden" name="forword" value="confirmCardOrder;termID=wechat" />
									<input type="hidden" name="objectID" id="objectID" value="" />
								</div>
							</form>
						</div>
						<!--end 新增地址-->

						<div class="info_child_txt" style="text-align: center;">
							<#if queryMemberAddress[0]??><input type="button" value="修 改" class="modifyBtn" onclick="openDiv('addressList','addressListGetH')" /></#if>
							<!--<input type="button" value="确 定" class="sureBtn" style="display: none;" onclick="changeAddress()" />
							<input type="button" value="取 消" class="cancBtn" style="display: none;  margin-left: 20px;" onclick="closeDiv('addressList')" />-->
							<input type="button" value="添 加" class="addBtn" onclick="addAddressO()" />
							<p style="color: #f00;">(仅购买实体卡时需要配送)</p>
						</div>

					</div>
				</div>
				<!--end 收货人信息-->

				<!--发票信息-->
				<div class="box_exp info_light">
					<div class="info_integral">
						<span class="title"><i class="icon-bookmark-empty"></i>发票信息</span>
					</div>
					<div style="display: block; overflow: hidden; opacity: 1;">
						<div class="info_child invoiceDefaultDiv">
							<a href="javascript:void(0);">

								<#if queryMemberInvoice[0]??>
									<#if queryMemberInvoice[0].receiptType=='1'>
										<#assign rec='个人'>
											<#else>
												<#assign rec='法人'>
									</#if>

									<#if queryMemberInvoice[0].rcptContent=='0'>
										<#assign rcp='明细'>
											<#elseif queryMemberInvoice[0].rcptContent=='1'>
												<#assign rcp='办公用品'>
													<#elseif queryMemberInvoice[0].rcptContent=='2'>
														<#assign rcp='电脑配件'>
															<#elseif queryMemberInvoice[0].rcptContent=='3'>
																<#assign rcp='耗材'>
																	<#elseif queryMemberInvoice[0].rcptContent=='10'>
																		<#assign rcp='用品'>
																			<#elseif queryMemberInvoice[0].rcptContent=='11'>
																				<#assign rcp='日用品'>
																					<#else>
																						<#assign rcp='礼品'>
									</#if>
									<label class="invoiceTag" style="display: none;">${queryMemberInvoice[0].billTag}</label>
									<label class="invoiceTitle">${queryMemberInvoice[0].rcptTitle}</label>
									<label class="invoiceType">${rec}</label>
									<label class="invoiceCon">${rcp}</label>
									<label class="invoiceID">${queryMemberInvoice[0].taxpayerID}</label>

									<span class="invoiceDefault" style="float: none;margin-left: 5px;"><#if queryMemberInvoice[0].isDefault == '1'>默认发票信息</#if></span>

								</#if>
							</a>
						</div>

						<div class="invoiceList" style="height: 0; overflow: hidden;">
							<div class="invoiceListGetH" style="overflow: hidden;" onclick="changeInvoice()">

								<#list queryMemberInvoice as item>

									<#if item.receiptType=='1'>
										<#assign rec='个人'>
											<#else>
												<#assign rec='法人'>
									</#if>

									<#if item.rcptContent=='0'>
										<#assign rcp='明细'>
											<#elseif item.rcptContent=='1'>
												<#assign rcp='办公用品'>
													<#elseif item.rcptContent=='2'>
														<#assign rcp='电脑配件'>
															<#elseif item.rcptContent=='3'>
																<#assign rcp='耗材'>
																	<#elseif item.rcptContent=='10'>
																		<#assign rcp='用品'>
																			<#elseif item.rcptContent=='11'>
																				<#assign rcp='日用品'>
																					<#else>
																						<#assign rcp='礼品'>
									</#if>

									<div class="info_child info_child_list1">
										<label class="invoiceTag">${item.billTag}</label>
										<label class="invoiceTitle">${item.rcptTitle}</label>
										<label class="invoiceType">${rec}</label>
										<label class="invoiceCon">${rcp}</label>
										<label class="invoiceMobile">${item.mobile}</label>
										<label class="invoiceMail">${item.billReceiverMail}</label>
										<label class="invoiceID">${item.taxpayerID}</label>
										<span class="invoiceDefault" style="float: none;margin-left: 5px;"><#if item.isDefault == '1'>默认发票信息</#if></span>

									</div>

								</#list>

							</div>

						</div>

						<!--新增发票-->
						<div class="addInvoiceList" style="height: 0; overflow: hidden;">
							<form class="addInvoiceForm" action="<@spring.url '/addInvoice'/>" method="post">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
								<div class="info_child">
									<p>
										<span class="inputtext">发票标签：</span>
										<input type="text" id="addBillTag" class="addrInputTxt" name="billTag" value="" />
									</p>
									<p>
										<span class="inputtext">发票抬头：</span>
										<input type="text" value="" id="addRcptTitle" class="addrInputTxt" name="rcptTitle" />
									</p>
									<p>
										<span class="inputtext">发票类型：</span>
										<select id="addReceiptType" name="receiptType">
											<option value="1">个人</option>
											<option value="2">法人</option>
										</select>
									</p>
									<p>
										<span class="inputtext">发票内容：</span>
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
										<span class="inputtext">收票人手机：</span>
										<input type="text" value="" id="addMobile" class="addrInputTxt" name="mobile" />
									</p>
									<p>
										<span class="inputtext">收票人邮箱：</span>
										<input type="text" value="" id="addBillReceiverMail" class="addrInputTxt" name="billReceiverMail" />
									</p>
									<p>
										<span class="inputtext" >公司纳税人识别号：</span>
										<input type="text" id="addTaxpayerID" class="addrInputTxt" name="taxpayerID" value="" />
									</p>
									<p>
										<p style="text-align: center;">
											<input type="submit" id="invoiceAddBtn" class="addBtn" value="添 加" style="min-width:56px; max-width:56px; margin-right: 20px;" />
											<input type="button" value="取 消" class="cancBtn" style="min-width:56px; max-width:56px;" onclick="closeAddDiv('addInvoiceList')" />
											
										</p>
								</div>
								<input type="hidden" name="isDefault" value="0" />
								<input type="hidden" name="objectID" id="objectID" value="" />
								<input type="hidden" name="forword" id="forword" value="confirmCardOrder" />
							</form>
						</div>
						<!--end 新增发票-->

						<div class="info_child_txt" style="text-align: center;">
							<input type="button" value="修 改" class="modifyBtn" onclick="openDiv('invoiceList','invoiceListGetH')" />
							<!--<input type="button" value="确 定" class="sureBtn" style="display: none;" onclick="changeInvoice()" />
							<input type="button" value="取 消" class="cancBtn" style="display: none;  margin-left: 20px;" onclick="closeDiv('invoiceList')" />-->
							<input type="button" value="添 加" class="addBtn" onclick="addInvoiceO()" />
							<input type="button" value="不开发票" class="noBtn noInvoiceBtn" style="margin-left: 18px;"/>
							<p style="color: #f00;">(只对金额支付部分开具发票)</p>
						</div>
					</div>
				</div>
				<!--end 发票信息-->

				<!--支付方式-->
				<div class="box_exp info_light">
					<div class="info_integral">
						<span class="title"><i class="icon-bookmark-empty"></i>支付方式</span>
					</div>
					<div style="display: block; overflow: hidden; opacity: 1;">
						<div class="info_child">
							<p>资金支付：
								<span class="payTypeT" style="color: #f60;"><!--${payerForCardsOrder[0].payerName}--></span>
								<span class="payTypeA" style=" display: none;"><!--${payerForCardsOrder[0].payer}--></span>
							</p>
						</div>

						<div class="payTypeDivHF">
							<div class="payTypeDivH">
								<#list payerForCardsOrder as item>

									<label class="payTypeItem">
							<input type="radio" name="RadioGroup1" value="${item.payer}" onclick="changePayType()"/>
							<img src="<@spring.url '/imgsrc/'/>${item.iconFileName}" onerror="downloadErrImg(this,'${item.iconFileName}')" width="100" height="33" alt="${item.payerName}"/>
						</label>

								</#list>
							</div>
						</div>

						<div style="display: none;"></div>

						<!--<div class="info_child_txt" style="text-align: center;">
							<input type="button" value="修 改" class="modifyBtn" onclick="openDiv('payTypeDivHF','payTypeDivH')" />
							<input type="button" value="确 定" class="sureBtn" style="display: none;" onclick="changePayType()" />
							<input type="button" value="取 消" class="cancBtn" style="display: none; margin-left: 20px;" onclick="closeDiv('payTypeDivHF')" />
						</div>-->
					</div>
				</div>
				<!--end 支付方式-->

				<!--订单信息-->
				<div class="box_exp info_light">
					<div class="info_integral">
						<span class="title"><i class="icon-bookmark-empty"></i>订单信息</span>
					</div>
					<div style="display: block; overflow: hidden; opacity: 1;">
						<div class="info_child">

							<#list buyerItemList as item>

								<a href="<@spring.url '/proshow;prdNo=${item.prdNo};keyWordsFld=${item.prdNo};'/>" style=" padding-top: 10px; display: inline-block; width: 100%;">
									<img src="<@spring.url '/imgsrc/${item.fileName}'/>" onerror="downloadErrImg(this,'${item.fileName}')" style="width: 50px; height: 40px; float: left;" />
									<span class="proInforTxt">${item.prdName}</span>
									<span class="proInforTxt" style="color: #f60; font-size: 12px;">数量：${item.amount}<b style="width: 20px; display: inline-block;"></b>金额：￥${item.money}</span>
								</a>

							</#list>

						</div>
						<div class="info_child_txt">
							<a href="cart.html" class="left">请在24小时内完成支付,过时订单将被取消！</a>
						</div>
					</div>
				</div>
				<!--end 订单信息-->

				<!--总计-->
				<div class="box_exp info_light">
					<div class="info_integral">
						<span class="titles"><i class="icon-bookmark-empty"></i>总计 - ￥${double}元</span>
					</div>
				</div>
				<!--end 总计-->

				<div class="errorCon">
					<p id="errorConAddr"></p>
					<p id="errorConPay"></p>
				</div>

				<div style="margin:8px 0;">
					<a href="javascript:void(0);" class="button button-block button-rounded button-caution button-large" id="go"><i class="icon-shopping-cart"></i>&nbsp;&nbsp;确定下单</a>
				</div>

				<div style="padding:15px;"></div>
			</div>

			<!--底部-->
			<#include "/lib/template/footer.ftl" encoding="UTF-8">
				<!--end 底部-->

		</div>
		<form action="<@spring.url '/buycfm'/>" method="post" id="formGo">
			<input name="addr" type="hidden" />
			<input name="receiverName" type="hidden" />
			<input name="mobile" type="hidden" />
			<input name="payToolIDList" type="hidden" />
			<input name="OrderType" value="1" type="hidden" />
			<input name="billTag" type="hidden" />
			<input name="_csrf" value="${_csrf.token}" type="hidden" />
		</form>

		<script>
			$(document).ready(function() {
				$("#content").accordion({
					alwaysOpen: false,
					autoheight: false,
					header: '.info_integral',
					clearStyle: true
				});

				// 新增地址输入验证
				$(".addAddressForm").validate({
					rules: {
						receiverName: {
							required: true,
						},
						phone: {
							required: true,
							isPhone: []
						},
						zipCode: {
							required: true,
						},
						addr: {
							required: true,
						},
					},
					messages: {
						receiverName: {
							required: "请输入收货人",
						},
						phone: {
							required: "请输入手机号码",
							isPhone: "请输入正确的手机号码"
						},
						zipCode: {
							required: "请输入邮政编号",
						},
						addr: {
							required: "请输入收货地址",
						},
					}
				});

				$(".addInvoiceForm").validate({
					rules: {
		                rcptTitle: {
		                    required: true,
		                },
		                
		                mobile: {
		                    required: true,
		                    isPhone1: []
		                },
		                billReceiverMail: {  
		                	required: true,
							email:true,
		                },
		                taxpayerID: {
		                    required: true,
		                },
		            },
		            messages: {
		                rcptTitle: {
		                    required: "请输入发票抬头",
		                },
		                
		                mobile: {
		                    required: "请输入手机号码",
							isPhone1: "请输入正确的手机号码"
		                },
		                billReceiverMail: {
		                	required: "请输入邮箱",
		                	email:"请输入正确格式的邮箱",
		                },
		                taxpayerID: {
		                    required: "请输入纳税人识别号",
		                },
		            }
				});
				$.validator.addMethod("isPhone1", function (value, element) {
			        var phone = $("#addMobile").val();// 手机号码
			        var phoneRule = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0-9]|170)\d{8}$/;					 
			        // 手机号码错误
			        if (!phoneRule.test(phone))
			        	
			            return false;
			        return true;
			    }, "ignore");
			    $('#invoiceAddBtn').click(function(){			    	
			    	var biaoqian = $('#addBillTag').val();
			    	var taitou = $('#addRcptTitle').val();
			    	var shouji = $('#addMobile').val();
			    	var youxiang = $('#addBillReceiverMail').val();
			    	var shibiehao = $('#addTaxpayerID').val();
			    	if(taitou!='' && shouji!='' && youxiang!='' && shibiehao!='' && biaoqian==''){
			    	$('#addBillTag').val('我的发票');   		
			    	}    	
			    });

				$('.info_child_list').eq(0).addClass('borderCO');
				$('.info_child_list').click(function() {
					$('.info_child_list').removeClass('borderCO');
					$(this).addClass('borderCO');
				});

				$('.info_child_list1').eq(0).addClass('borderCO');
				$('.info_child_list1').click(function() {
					$('.info_child_list1').removeClass('borderCO');
					$(this).addClass('borderCO');
				})

				//点击下单按钮
				$("#go").click(function() {
					var action = "<@spring.url '/buycfm'/>";
					var receiverName = $("#selectDiv").find(".addrName").html();
					$("input[name='receiverName']").val(receiverName)
					var addr = $("#selectDiv").find(".address").html();
					$("input[name='addr']").val(addr)
					var mobile = $("#selectDiv").find(".addrPhone").html();
					$("input[name='mobile']").val(mobile)
					//        var payToolIDList = "东方航空-积分支付";
					var payToolIDList = $(".payTypeA").text();
					$("input[name='payToolIDList']").val(payToolIDList);
					var billTag = $(".defaultDiv .invoiceTag").html();
					$("input[name='billTag']").val(billTag);

					if(receiverName == '' || addr == '' || mobile == '') {
						$('.errorCon').css('display', 'block');
						$('#errorConAddr').text('请填写收货人、联系电话和收货地址。');
					}
					if(payToolIDList == '') {
						$('.errorCon').css('display', 'block');
						$('#errorConPay').text('请选择支付方式。');
					}
					if(receiverName != '' && addr != '' && mobile != '' && payToolIDList != '') {
						$('.errorCon').css('display', 'none');
						$("#formGo").submit();
					}
				})
			});
             
			function openDiv(obj, h) {
				var divH = $('.' + h).height();
				$('.' + obj).next().next('.info_child_txt').find('.modifyBtn').hide();
				$('.' + obj).next().next('.info_child_txt').find('.addBtn').hide();
				$('.' + obj).next().next('.info_child_txt').find('.sureBtn').show();
				$('.' + obj).next().next('.info_child_txt').find('.cancBtn').show();
				$('.' + obj).next().next('.info_child_txt').find('.noBtn').show();
				$('.' + obj).animate({ height: divH + "px" });
			}
			
            
             
			function closeDiv(obj) {
				$('.' + obj).next().next('.info_child_txt').find('.modifyBtn').show();
				$('.' + obj).next().next('.info_child_txt').find('.addBtn').show();
				$('.' + obj).next().next('.info_child_txt').find('.noBtn').show();
				$('.' + obj).next().next('.info_child_txt').find('.sureBtn').hide();
				$('.' + obj).next().next('.info_child_txt').find('.cancBtn').hide();
				$('.' + obj).animate({ height: 0 });
			}

			function closeAddDiv(obj) {
				$('.' + obj).next('.info_child_txt').find('.modifyBtn').show();
				$('.' + obj).next('.info_child_txt').find('.noBtn').show();
				$('.' + obj).next('.info_child_txt').find('.sureBtn').hide();
				$('.' + obj).next('.info_child_txt').find('.cancBtn').hide();
				$('.' + obj).next('.info_child_txt').find('.addBtn').show();
				$('.' + obj).animate({ height: 0 });
			}

			//修改地址
			function changeAddress() {
				var name = $(".borderCO .addrName").text();
				var phoneNum = $(".borderCO .addrPhone").text();
				var addr = $(".borderCO .address").text();
				var def = $(".borderCO .addrDefault").text();

				closeDiv('addressList');

				if(name != "" || phoneNum != "" || addr != "") {
					$(".addrDefaultDiv .addrName").text(name);
					$(".addrDefaultDiv .addrPhone").text(phoneNum);
					$(".addrDefaultDiv .address").text(addr);
					$(".addrDefaultDiv .addrDefault").text(def);
				}
				if(name != '' && phoneNum != '' && addr != '') {
					$('#errorConAddr').text('');
					if($('#errorConPay').text() == "") { $('.errorCon').css('display', 'none'); }
				}
			}
			//新增地址
			function addAddressO() {
				var h = $('.addAddressForm').height();
				$('.addAddressList').animate({ height: h + 'px' });
				$('.addAddressList').next('.info_child_txt').find('.modifyBtn').hide();
				$('.addAddressList').next('.info_child_txt').find('.addBtn').hide();

			}
			//修改发票
			function changeInvoice() {

				var title = $(".borderCO .invoiceTitle").text();
				var type = $(".borderCO .invoiceType").text();
				var con = $(".borderCO .invoiceCon").text();
				var def = $(".borderCO .invoiceDefault").text();
				var iId = $(".borderCO.invoiceID").text();
				var tag = $(".borderCO .invoiceTag").text();

				closeDiv('invoiceList');

				if(type != "" || con != "" || def != "") {
					$(".invoiceDefaultDiv .invoiceTitle").text(title);
					$(".invoiceDefaultDiv .invoiceType").text(type);
					$(".invoiceDefaultDiv .invoiceCon").text(con);
					$(".invoiceDefaultDiv .invoiceDefault").text(def);
					$(".invoiceDefaultDiv .invoiceID").text(iId);
					$(".invoiceDefaultDiv .invoiceTag").text(tag);
				}
			}

			//新增发票
			function addInvoiceO() {
				var h = $('.addInvoiceForm').height();
				$('.addInvoiceList').animate({ height: h + 'px' });
				$('.addInvoiceList').next('.info_child_txt').find('.modifyBtn').hide();
				$('.addInvoiceList').next('.info_child_txt').find('.addBtn').hide();
			}
			 //不开发票
		    $('.noInvoiceBtn').click(function(){
		    	$(".invoiceDefaultDiv  .invoiceTitle").text('');
		        $(".invoiceDefaultDiv  .invoiceType").text('');
		        $(".invoiceDefaultDiv  .invoiceCon").text('');
		        $(".invoiceDefaultDiv  .invoiceDefault").text('');
		        $(".invoiceDefaultDiv  .invoiceID").text('');
		        $(".invoiceDefaultDiv  .invoiceTag").text('');
		       
		    })
		    $('.modifyBtn').click(function(){
		    	$('.noInvoiceBtn').css('display','none');
		    })
		    $('.addBtn').click(function(){
		    	$('.noInvoiceBtn').css('display','none');
		    })
			//修改支付方式
			function changePayType() {
				var pay = $('.payTypeDivHF').find('input:checked').val();
				var payerName = $('.payTypeDivHF').find('input:checked').next('img').attr('alt');

//				closeDiv('payTypeDivHF');
				$('.payTypeDivHF').prev('.info_child').find('span').text(payerName);
				$('.payTypeA').text(pay);

				if(pay != '') {

					$('#errorConPay').text('');
					if($('#errorConAddr').text() == "") { $('.errorCon').css('display', 'none'); }
				}

			}
		</script>

	</body>

</html>