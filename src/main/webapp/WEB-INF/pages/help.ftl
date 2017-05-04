<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<title>帮助中心-逸乐生活网</title>
<meta name="description" content="途皓（北京）商务服务有限公司" />
<meta name="keywords" content="途皓（北京）商务服务有限公司" />
<link rel="stylesheet" type="text/css" href="css/css.css"/>
<script type="text/javascript" src="<@spring.url '/js/gd_Index.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/js/jquery.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/js/banner.js'/>"></script>
<script language="javascript" src="<@spring.url '/js/menu.js'/>" ></script>
<script type="text/javascript" src="<@spring.url '/js/model.js'/>"></script>
<style>
.helpCenter{ width:200px; float:left;}
.helpCenter h1{ font-weight:bold; line-height:40px; cursor:pointer; color:#fff; font-size:16px; overflow:hidden; background:#f60; text-align:center;}
.exClassify-list h2{ font-weight:bold; line-height:40px; cursor:pointer; color:#666; font-size:14px; overflow:hidden; background:#eaeaea; padding:0 10px; margin-bottom:1px;}
.exClassify-list span{ float:left;}
.bTriangleD{ border-width:5px 5px 0;}
.bTriangleU{ border-width:0 5px 5px;}
.exClassify-list b{ border-style:solid dashed solid dashed; border-color:#999 transparent #999 transparent;font-size:0; line-height:0; height:0; float:right; margin-top:18px; float:right;}
.exClassify-list div{ padding-bottom:10px; overflow:hidden; padding:0 10px; height:0;}
.exClassify-list a{ line-height:35px; font-szie:12px; cursor:pointer; display:inline-block; color:#666; width:209px;}
.exClassify-list a:hover,.exClassify-list .aSelected{ text-decoration:none; color:#f60;}
.helpCenterR{ float:right; width:910px; border:1px solid #eaeaea; padding:0 20px;}
.helpCenterR h3{ color:#f60; font-size:16px; font-weight:bold; line-height:40px; margin-bottom:10px; margin:0 35px 10px; border-bottom:1px dashed #eaeaea;}
.helpCenterR h4{ font-size:14px; font-weight:bold; line-height:30px; padding:0 35px; margin-bottom:10px;}
.helpCenterR div{ display:none;}
.tableRel{ border-left:1px solid #6AB4FD; border-top:1px solid #6AB4FD; margin:0 35px 20px;}
.tableRel th{ background:#eff7ff;}
.tableRel th,.tableRel td{ vertical-align:middle; border-right:1px solid #6AB4FD; border-bottom:1px solid #6AB4FD; padding:5px;}
</style>
<script language="javascript">
$(document).ready(function(e) {
	$(".helpCenterR .sProcess").show();
	$(".helpCenter .sProcess").addClass("aSelected");
	$(".exClassify-list h2").click(function(){
		var h = $(this).next("div").find("a").length * 35;
		if($(this).find("b").attr('class') == "bTriangleD"){
			$(this).find("b").removeClass("bTriangleD").addClass("bTriangleU");
			$(this).next("div").animate({height:h + "px"});
		}
		else{
			$(this).find("b").removeClass("bTriangleU").addClass("bTriangleD");
			$(this).next("div").animate({height:"0"});
		}
	})
	$(".helpCenter a").click(function(){
		$(".helpCenter a").removeClass("aSelected");
		var c = $(this).attr("class");
		$(this).addClass("aSelected");
		$(".helpCenterR").children("div").hide();
		var n = '.helpCenterR .' + c;
		$(n).show();
	})
});
</script>
</head>
<body>
	<!--头部-->
	<#include "/lib/template/header.ftl" encoding="UTF-8">
	<!--end 头部-->

	<!--banner--> 
	<div style="background:url('images/titleTag/b_help.jpg') no-repeat center top;height:150px;"></div>
	<!--endbanner-->

	<!--主体-->
	<div class="main">
		<div class="ny_nav">
			<div class="ny_nav1">当前位置：<a href='<@spring.url "/index"/>'>首页</a> > 帮助中心</div>
			<div class="clearfix"></div>
		</div>

		<div class="mainCon">
			<div class="textCon" style="width:1200px;">
				<div class="helpCenter" style="margin-left:10px;">
					<h1>帮助中心</h1>
					<div class="exClassify-list jf-overflowH">
						<h2><span>购物流程</span><b class="bTriangleU"></b></h2>
						<div style="height:35px;">
							<a href="javascript:void(0)" class="sProcess">购物流程</a>
						</div>
					</div>
					<div class="exClassify-list jf-overflowH">
						<h2><span>交易条款</span><b class="bTriangleD"></b></h2>
						<div>
							<a href="javascript:void(0)" class="clause">逸乐交易条款</a>
							<a href="javascript:void(0)" class="promise">逸乐承诺</a>
							<a href="javascript:void(0)" class="clauseTip">逸乐生活交易条款特别提示</a>
							<a href="javascript:void(0)" class="safeguard">逸乐生活交易保障服务</a>
							<a href="javascript:void(0)" class="unfairRules">不正当行为规则</a>
							<a href="javascript:void(0)" class="priceDes">价格说明</a>
						</div>
					</div>
					<div class="exClassify-list jf-overflowH">
						<h2><span>发票问题</span><b class="bTriangleD"></b></h2>
						<div>
							<a href="javascript:void(0)" class="invoice">发票问题</a>
						</div>
					</div>
					<div class="exClassify-list jf-overflowH">
						<h2><span>售后服务</span><b class="bTriangleD"></b></h2>
						<div>
							<a href="javascript:void(0)" class="relevantRules">退换货规则</a>
							<a href="javascript:void(0)" class="receivingTime">收货时间判定标准</a>
							<a href="javascript:void(0)" class="noSupport">下述商品不支持无理由退货</a>
							<a href="javascript:void(0)" class="notIssueRef">以下情况不予办理退换货</a>
						</div>
					</div>
				</div>
				<div class="helpCenterR">
					<div class="sProcess">
						<h3 >逸乐购物流程</h3>
						<p style="padding:0 35px;"><img src="<@spring.url '/images/proImg/sProcessImg.jpg'/>" /></p>
					</div>

					<div class="clause">
						<h3 >逸乐交易条款</h3>
						<h4>客户在接受商品订购与送货的同时，有义务遵守以下交易条款。您在逸乐下订单之前或接受逸乐送货之前，请您仔细阅读以下条款：</h4>
						<p style="padding:0 35px; margin-bottom:10px;">1. 订购的商品价格以您下订单时逸乐网上价格为准。</p>
						<p style="padding:0 35px;">2. 请清楚准确地填写您的真实姓名、送货地址及联系方式。因如下情况造成订单延迟或无法配送等，逸乐将不承担责任：</p>
						<p style="padding:0 35px 0 52px;">A. 客户提供错误信息和不详细的地址；</p>
						<p style="padding:0 35px 0 52px;">B. 货物送达无人签收，由此造成的重复配送所产生的费用及相关的后果；</p>
						<p style="padding:0 35px 0 52px; margin-bottom:10px;">C. 不可抗力，例如：自然灾害、交通戒严、突发战争等。</p>
						<p style="padding:0 35px; margin-bottom:10px;">3. 安全性：无论您是电话订购商品或是网络订购商品，我们会保证交易信息的安全，并由逸乐授权的员工处理您的订单。</p>
						<p style="padding:0 35px; margin-bottom:10px;">4. 隐私权：逸乐尊重您的隐私权，在任何情况下，我们都不会将您的个人和订单信息出售或泄露给任何第三方（国家司法机关调取除外）。我们从网站上或电话中得到的所有客户信息仅用来处理您的相关订单。</p>
						<p style="padding:0 35px; margin-bottom:10px;">5. 免责：如因不可抗力或其它逸乐无法控制的原因使逸乐销售系统崩溃或无法正常使用导致网上交易无法完成或丢失有关的信息、记录等，逸乐会尽可能合理地协助处理善后事宜，并努力使客户免受经济损失。</p>
						<p style="padding:0 35px; margin-bottom:10px;">6. 客户监督：逸乐希望通过不懈努力，为客户提供最佳服务，逸乐在给客户提供服务的全过程中接受客户的监督。</p>
						<p style="padding:0 35px; margin-bottom:10px;">7. 争议处理：如果客户与逸乐之间发生任何争议，可依据当时双方所认定的协议及相关法律进行解决。</p><br/>
						<p style="padding:0 35px; margin-bottom:10px; font-weight:bold; color:#00b050;">特殊说明：<br/>逸乐所服务的客户为以终端消费为目的的个人、企业、事业单位及其他社会团体，不包括经销商，如发现经销商购物，逸乐将拒绝为其服务。由此产生的一切后果由经销商自行承担。</p>
					</div>

					<div class="promise">
						<h3 >逸乐承诺</h3>
						<p style="padding:0 35px; margin-bottom:10px;">1. 我们秉承质优价低、放心满意的销售理念为您服务。我们所出售的商品均为正品行货，与您亲临商场选购的商品一样享受相同的质量保证；含有质量保证书的商品按照保证书的承诺执行，其它商品按国家有关规定执行。</p>
						<p style="padding:0 35px; margin-bottom:10px;">2. 我们承诺在运输“保价费”上永久免费，在配送环节上承担保险费用，运输过程的风险一律由逸乐承担，客户收到货物如果有损坏、遗失等情形，只要当场提出声明，并进行相关举证，逸乐将按照正常售后退换货程序予以先行处理。</p>
						<p style="padding:0 35px; margin-bottom:10px;">3. 我们承诺通过我司提供的网上支付平台支付，为客户承担全额手续费，但由于客户原因取消正常状态下的订单要求款项返还时（做逸乐帐户余额除外），则由客户承担相关手续费；货物打包不收取任何包装费。</p>
					</div>

					<div class="clauseTip">
						<h3 >逸乐生活交易条款特别提示</h3>
						<p style="padding:0 35px; margin-bottom:10px;">1. 如您购买的商品在规定时间内出现国家法律所规定的性能故障或商品质量问题，需要返修/退换货时，请您在我的逸乐提交返修/退换货申请，申请单审核通过后，按照提示信息将物品以普通快递（请别使用顺丰、EMS到付）的方式寄回逸乐或卖家售后，相关的邮寄运费将以逸乐余额的形式返还到您的逸乐账户中。如未提交返修/退换货申请或未通过审核而将商品寄回，则逸乐或卖家有权拒绝您的相关申请。具体详情可参见售后政策中的售后服务流程.</p>
						<p style="padding:0 35px; margin-bottom:10px;">2. 我们保证出货时商品外包装的完好无缺。请您在收到货物时当场仔细检查发票及货品与送货单的商品是否一致，如果发现商品缺少或已破损等情况，请当场即配送人员还在现场时与我司客服部联系；如果发现邮寄包装破损，货物在运输途中破损等情况，请当场指出并拒收，拒收后请致电我司客服，如您已签收或他人代为签收，则视为商品外包装，商品数量及内容无误，我司将无法受理。电子类商品如手机、相机、笔记本等有原厂包装、标签的3C产品，可以打开原厂包装，但不能安装电池开机启动，不能通电、过水、插入卡槽。请您在确认外观无损的情况下确认收货，如确认收货后，发现外观问题将无法办理。</p>
					</div>

					<div class="safeguard">
						<h3 >逸乐生活交易保障服务</h3>
						<p style="padding:0 35px; margin-bottom:10px;">1. 我们秉承质优价低、放心满意的销售理念为您服务。我们所出售的商品均为正品行货，与您亲临商场选购的商品一样享受相同的质量保证；含有质量保证书的商品按照保证书的承诺执行，其它商品按国家有关规定执行。</p>
						<p style="padding:0 35px; margin-bottom:10px;">2. 您使用在线支付购买第三方卖家提供的商品，支付成功后，在您验收货物并完成“确认收货”操作后，逸乐才会与卖家结算。</p>
						<p style="padding:0 35px; margin-bottom:10px;">3. 对于第三方卖家提供的商品，您提交退货申请通过后，如果卖家在收到货后48小时工作日内未反馈处理意见，将由逸乐介入为您处理相关订单的售后事宜。</p>
					</div>

					<div class="unfairRules">
						<h3 >不正当行为规则</h3>
						<h4>用户通过逸乐账户操作的各种行为应符合法律法规规定、平台规则规定及注册协议约定，当出现（包含但不限于）以下行为时，视为用户自愿同意接受逸乐或商家进行权益降级，扣除京豆，冻结或关闭逸乐账户，取消订单，不再提供服务等操作，且同意逸乐或商家不进行任何赔偿或补偿。如给逸乐或相关方造成损失，用户愿意承担相应责任：</h4>
						<p style="padding:0 35px; margin-bottom:10px;">（1） 注册资料内容含虚假信息；</p>
						<p style="padding:0 35px; margin-bottom:10px;">（2） 虚假交易、虚假好评,发布无根据的恶意评价；</p>
						<p style="padding:0 35px; margin-bottom:10px;">（3） 购买正品商品，退货时退回非逸乐平台对应订单中销售的商品、以次充好、以假乱真等行为；</p>
						<p style="padding:0 35px; margin-bottom:10px;">（4） 无故、无正常理由拒收签收订单货物的行为；</p>
						<p style="padding:0 35px; margin-bottom:10px;">（5） 符合非正常订单中的行为；（违规订单处理规则）。</p>
					</div>

					<div class="priceDes">
						<h3 >价格说明</h3>
						<p style="padding:0 35px; margin-bottom:10px;"><b>逸乐价：</b>逸乐价为商品的销售价，是您最终决定是否购买商品的依据。</p>
						<p style="padding:0 35px; margin-bottom:10px;"><b>划线价：</b>商品展示的划横线价格为参考价，该价格可能是品牌专柜标价、商品吊牌价或由品牌供应商提供的正品零售价（如厂商指导价、建议零售价等）或该商品在逸乐平台上曾经展示过的销售价；由于地区、时间的差异性和市场行情波动，品牌专柜标价、商品吊牌价等可能会与您购物时展示的不一致，该价格仅供您参考。</p>
						<p style="padding:0 35px; margin-bottom:10px;"><b>折扣：</b>如无特殊说明，折扣指销售商在原价、或划线价（如品牌专柜标价、商品吊牌价、厂商指导价、厂商建议零售价）等某一价格基础上计算出的优惠比例或优惠金额；如有疑问，您可在购买前联系销售商进行咨询。</p>
						<p style="padding:0 35px; margin-bottom:10px;"><b>异常问题：</b>商品促销信息以商品详情页“促销”栏中的信息为准；商品的具体售价以订单结算页价格为准；如您发现活动商品售价或促销信息有异常，建议购买前先联系销售商咨询。</p>
					</div>

					<div class="invoice">
						<h3 >发票问题</h3>
						<h4>目前， 逸乐生活只对在线购卡的业务进行提供发票服务，发票一般会在订单完成之后7个工作日内为您开具并寄出。 另使用逸分卡支付的金额不开具发票（购买逸分卡时已开具发票，故下单后不再开具，如需保修，可联系客服处理）</h4>
						<h5 style="padding:0 35px; color:#7030A0;">如果您开具的是普通发票：</h5>
						<p style="padding:0 35px; margin-bottom:10px;">—发票抬头可选择填写个人或公司名称；<br/>—发票内容可以据实选择商品明细、办公用品（附购物清单）、电脑配件及耗材等，数码类、手机及配件、笔记本、台式机、家电类商品建议开具明细发票，便于保修。</p>
						<h5 style="padding:0 35px; color:#7030A0;">如果您开具的是增值税专用发票，您在下单时需录入以下增值税专用发票资质信息：</h5>
						<p style="padding:0 35px; margin-bottom:10px;">—单位名称（必须是您公司营业执照上的全称）；<br/>—纳税人识别号（必须是您公司《税务登记证》的编号，一般为15位，请仔细核对后输入）；<br/>—注册地址（必须是您公司营业执照上的注册地址）；<br/>—电话（请提供能与您公司保持联系的有效电话）；<br/>—开户银行（必须是您公司银行开户许可证上的开户银行）；<br/>—银行账号（必须是您公司开户许可证上的银行账号）。</p>
						<p style="padding:0 35px; margin-bottom:10px; font-weight:bold; color:#00b050;">注意：<br/>逸乐根据您输入的信息开具增值税专用发票，如影响认证抵扣，逸乐不会受理重新开具增值税专用发票的要求，请务必认真校对所填开票信息；<br/>发票收件人电话请尽量填写可以联系到您的手机号码，避免使用公司号码，以免影响您收票的时效性；<br/>您提供的增票资质信息可以在 “我的逸乐-账户中心-账户信息-增票资质”下查询获取；请注意，一个逸乐账号只能关联一个增值税专用发票资质。增值税专用发票的内容只能选择商品明细。给您带来不便请您谅解；<br/>请务必确保相关信息的真实准确性，我司将根据您所提供的信息进行增值税专用发票的开具，如因填写失误造成发票开具错误，将会导致贵公司不能及时入账抵扣，带来税金损失。<br/>增值税专用发票邮寄地址：<br/>您所填写的增票邮寄地址将绑定到您的账号，该账号订单所开增值税专用发票都将邮寄到该地址。<br/>如果该地址变更，所有待邮寄的增值税专用发票都邮寄到更新后的地址。</p>
						<h5 style="padding:0 35px; color:#7030A0;">开发票的注意事项：</h5>
						<p style="padding:0 35px;">1. 发票金额不能高于订单实际支付金额。</p>
						<p style="padding:0 35px;">2. 为了享受厂商提供的质保服务，请您将商品发票开具为明细。如果您购买的是数码类、手机及配件、笔记本、台式机、家电类商品，为了保证您能充分享受生产厂家提供的售后服务（售后服务需根据发票确认您的购买日期），不管您是否需要开具发票，商家都将随单为您开具，发票内容默认为您订购的商品全称，提交订单时可修改发票内容。</p>
						<p style="padding:0 35px;">3. 不同物流中心开具的发票无法合并。</p>
						<p style="padding:0 35px;">4. 一个订单对应一张普通发票。</p>
						<p style="padding:0 35px;">5. 根据国家税务总局增值税发票管理规定,商业企业一般纳税人零售的烟、酒、食品、服装、鞋帽（不包括劳保专用部分）、化妆品等消费品不得开具专用发票（国税发【2006】156号）。因此，您采购上述产品的订单将不能取得增值税专用发票。</p>
						<p style="padding:0 35px; margin-bottom:10px;">6. 生鲜部分产品不支持开具增值税发票。</p>
					</div>

					<div class="relevantRules">
						<h3 >退换货规则</h3>
						<h4>逸乐承诺符合以下情况，自客户收到商品第二日起7日内可以退货，15日内可以换货，客户可在线提交返修申请办理退换货事宜。具体退换货标准如下：</h4>
						<table width="840" border="0" cellpadding="0" cellspacing="0" class="tableRel">
							<tr>
								<th width="100">退换类别</th>
								<th width="220">具体描述</th>
								<th width="90">是否支持7天（含）内退货</th>
								<th width="90">是否支持15天（含）内换货</th>
								<th width="90">是否收取返回运费</th>
								<th>备注</th>
							</tr>
							<tr>
								<td>国家法律所规定的功能性故障或商品质量问题</td>
								<td>经由生产厂家指定或特约售后服务中心检测确认，并出具检测报告或经逸乐售后确认属于商品质量问题</td>
								<td style="text-align:center;">是</td>
								<td style="text-align:center;">是</td>
								<td style="text-align:center;">否</td>
								<td>当地无检测条件的请联系逸乐售后处理</td>
							</tr>
							<tr>
								<td>到货物流损、缺件或商品描述与网站不符</td>
								<td>物流损指在运输过程中造成的损坏、漏液、破碎、性能故障，于收到货后24小时内反馈，经核查情况属实。缺件指商品原装配件缺失。</td>
								<td style="text-align:center;">是</td>
								<td style="text-align:center;">否</td>
								<td style="text-align:center;">否</td>
								<td>逸乐审核期间可能需要快递人员证明或要求您提供实物照片等，以便快速做出判断并处理。</td>
							</tr>
							<tr>
								<td>其他原因</td>
								<td>除以上两种原因之外，如个人原因导致的退换货，在商品完好、附件齐全的前提下。</td>
								<td style="text-align:center;">是</td>
								<td style="text-align:center;">否</td>
								<td style="text-align:center;">是（由您承担商品返回逸乐的运费取件收费标准）</td>
								<td>由您承担商品返回逸乐的运费取件收费标准。钻石级别、PLUS会员客户免运费运费标准。退换货运费常见问题</td>
							</tr>
						</table>
					</div>

					<div class="receivingTime">
						<h3 >收货时间判定标准</h3>
						<p style="padding:0 35px; margin-bottom:10px;">（1）逸乐快递配送或者自提的订单：以客户实际签收商品第二日开始计算；</p>
						<p style="padding:0 35px; margin-bottom:10px;">（2）非逸乐配送的订单，按照第三方物流平台显示的实际到货日期第二日为准。如果第三方合作伙伴不能有效返回签收日期，则逸乐将根据距离等因素和客户确认实际到货第二日开始计算。</p>
					</div>

					<div class="noSupport">
						<h3 >下述商品不支持无理由退货</h3>
						<p style="padding:0 35px; margin-bottom:10px;">（1）个人定作类商品；</p>
						<p style="padding:0 35px; margin-bottom:10px;">（2）鲜活易腐类商品；</p>
						<p style="padding:0 35px; margin-bottom:10px;">（3）在线下载或者您拆封的音像制品，计算机软件等数字化商品；</p>
						<p style="padding:0 35px; margin-bottom:10px;">（4）交付的报纸期刊类商品；</p>
						<p style="padding:0 35px">（5）根据商品性质不适宜退货，并经您在购买时确认的商品：</p>
						<p style="padding:0 35px 0 70px;;">a. 拆封后易影响人身安全或者生命健康的商品，或者拆封后易导致商品品质发生改变的商品；</p>
						<p style="padding:0 35px 0 70px;">b. 一经激活或者试用后价值贬损较大的商品；</p>
						<p style="padding:0 35px 0 70px;">c. 销售时已明示的临近保质期的商品、有瑕疵的商品；</p>
						<p style="padding:0 35px 0 70px; margin-bottom:10px;">d. 其他根据商品性质不适宜退货，在商品页面标注“不支持无理由退货”并经您在购买时确认的商品；</p>
						<p style="padding:0 35px; margin-bottom:10px;">（6）无法保证退回商品完好的商品（能够保持原有品质、功能，商品本身、配件、商标标识齐全的，视为商品完好）。</p>
					</div>

					<div class="notIssueRef">
						<h3 >以下情况不予办理退换货</h3>
						<p style="padding:0 35px; margin-bottom:10px;">（1）任何非逸乐出售的商品（序列号不符）；</p>
						<p style="padding:0 35px; margin-bottom:10px;">（2）过保商品（超过三包保修期的商品）；</p>
						<p style="padding:0 35px; margin-bottom:10px;">（3）未经授权的维修、误用、碰撞、疏忽、滥用、进液、事故、改动、不正确的安装所造成的商品质量问题，或撕毁、涂改标贴、机器序号、防伪标记；</p>
						<p style="padding:0 35px; margin-bottom:10px;">（4）三包凭证信息与商品不符及被涂改的；</p>
						<p style="padding:0 35px">（5）其他依法不应办理退换货的。</p>
					</div>
				</div>
			</div>
			<div class="clear"></div>
		</div> 
	</div>
	<!--end 主体-->
	
    <!--合作伙伴-->
    <#include "/lib/template/partner.ftl" encoding="UTF-8">
    <!--end 合作伙伴-->

	<!--底部-->
	<#include "/lib/template/footer.ftl" encoding="UTF-8">
    <!--end 底部-->

</body>
</html>
