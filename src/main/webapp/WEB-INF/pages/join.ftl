<#import "/spring.ftl" as spring/>
<!doctype html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<title>加入途皓-逸乐生活网</title>
<meta name="description" content="途皓（北京）商务服务有限公司" />
<meta name="keywords" content="途皓（北京）商务服务有限公司" />
<link rel="stylesheet" type="text/css" href="css/css.css"/>
<script type="text/javascript" src="<@spring.url '/js/gd_Index.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/js/jquery.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/js/banner.js'/>"></script>
<script language="javascript" src="<@spring.url '/js/menu.js'/>" ></script>
<script type="text/javascript" src="<@spring.url '/js/model.js'/>"></script>
<style>
.textCon .jobTitle{ color:#4682B4; text-align:center; padding-bottom:10px; font-size:16px; font-weight:bold;}
.jobEmailAddr{ background:#f60; color:#fff; font-size:16px; font-weight:bold; width:200px; padding:0 20px; line-height:35px; text-align:center; margin:0 auto; border-radius:10px;}
.jobInfo{ color:#f60; text-align:center; font-weight:bold; padding-top:10px;}
.jobDiv{ overflow:hidden; border-top:1px solid #E0DDE0; border-bottom:1px solid #E0DDE0;}
.jobList{ float:left; width:280px; padding:10px 20px;}
.jobList li{ line-height:40px; font-size:14px; cursor:pointer;}
.jobList li:hover,.jobList .jobListCO{ color:#f60;}
.jobDetial{ float:left; width:819px; min-height:420px; padding:10px 30px; border-left:1px solid #E0DDE0;}
.jobDetial div{ display:none;}
.jobDetial h2{ line-height:40px; font-size:16px; font-weight:bold;}
</style>
<script language="javascript">
$(document).ready(function(e) {
	$(".jobDetial .job-clientManager").show();
	$(".jobList .clientManager").addClass("jobListCO");
	$(".jobList li").click(function(){
		$(".jobList li").removeClass("jobListCO");
		var c = $(this).attr("class");
		$(this).addClass("jobListCO");
		$(".jobDetial").children("div").hide();
		var n = '.jobDetial .job-' + c;
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
	<div style="background:url('images/titleTag/b_join.jpg') no-repeat center top;height:150px;"></div>
	<!--endbanner-->

	<!--主体-->
	<div class="main">
		<div class="ny_nav">
			<div class="ny_nav1">当前位置：<a href='<@spring.url "/index"/>'>首页</a> > <a href='<@spring.url "/about"/>'>关于公司</a> > 加入途皓</div>
			<div class="clearfix"></div>
		</div>

		<div class="mainCon" style="padding:0;">
			<div class="textCon" style="width:1200px; margin:0 auto;">
				<h3 class="jobTitle">以下是各个空缺岗位具体职责与要求，有意者请详阅，并发简历至</h3>
				<h3 class="jobEmailAddr">HR@happypoints.cn</h3>
				<p class="jobInfo">(发简历时请附相应作品及个人阐述)</p>
				<div class="jobDiv">
					<ul class="jobList">
						<li class="clientManager jobListCO">客户经理</li>
						<li class="senManOfGovRel">政府关系事业部高级经理</li>
						<li class="operManager">运营经理</li>
						<li class="salesManager">采销经理-自有品牌</li>					
						<li class="finaManager">财务管理</li>
						<li class="custServSpec">客服专员</li>
						<li class="prodManager">产品经理</li>
						<li class="ITSystemDes">IT系统设计师</li>
						<li class="UIVisualdes">UI视觉设计师</li>
						<li class="dataAnalyst">数据分析师</li>
					</ul>
					<div class="jobDetial">
						<div class="job-clientManager">
							<h2>客户经理</h2>
							<p><b>工作职责：</b></p>
							<p>1.	负责运营商户的启动，培训和日常维护；<br/>2.	管理商户的风险，收集商户的需求；<br/>3.	负责项目的前期谈判、跟踪、各部门的协调和配合，直到项目上线和后续维护；<br/>4.	协助设计市场营销活动，改善前端应用设计；<br/>5.	保持与客户沟通联系，为客户提供完善的产品销售计划及信息咨询；<br/>6.	上级领导交办的工作。</p>
							<p><b>任职要求：</b></p>
							<p>1.	本科(及以上)相关专业毕业, 1-3以上年外企相关工作经验；<br/>2.	有客户服务，客户经理经验优先；<br/>3.	负责项目的前期谈判、跟踪、各部门的协调和配合，直到项目上线和后续维护；<br/>4.	有以下行业经验者优先：教育培训，家电连锁，家具家装，商业企业，超市连锁零售等。</p>
							<p style="padding-bottom:0;"><b>薪水区间： 9万 – 12万</b></p>
						</div>
						<div class="job-senManOfGovRel">
							<h2>政府关系事业部高级经理</h2>
							<p><b>工作职责：</b></p>
							<p>1.	负责拓展并维护政府关系，与政府部门保持良好的沟通和反馈机制；<br/>2.	负责建设和维护与政府的沟通机制，展现公司在相关政府层面的认知度和品牌形象；<br/>3.	负责及时获悉政府的相关政策指令、法律法规，并做合理部署与应对；<br/>4.	负责掌握政府政策、法规或信息，分析对公司发展的相关政策、计划和趋势走向等；<br/>5.	负责政府公关方案的制定与执行；<br/>6.	负责行业机构推广渠道的建立与维护；<br/>7.	负责政府、行业重大客户、合作伙伴关系、行业协会等的拓展与维护；<br/>8.	负责政府政策支持项目的申报、政府有关资金申请、重要资质的申报和认定等工作。</p>
							<p><b>任职要求：</b></p>
							<p>1.	本科及以上学历，新闻、传播、公共管理、行政管理等相关专业者优先；<br/>2.	了解政府架构，熟悉政府关系，具有5年以上外企政府关系和政府公关经验者优先；<br/>3.	熟悉互联网金融公司的运作及相关政策，有大型商业企业工作经验者优先；<br/>4.	善于人际交往，具有较强的政府公关能力，具备应对、处置突发事情的能力；<br/>5.	熟悉政府有关部门的相关政策和申报流程，了解行业相关管理法规；<br/>6.	具有良好的文章撰写能力，能够独立撰写申报材料、可行性分析报告等；<br/>7.	具备积极乐观的心态，对工作认真负责，具备优秀的沟通能力、表达能力。</p>
							<p style="padding-bottom:0;"><b>薪水区间：面议</b></p>
						</div>
						<div class="job-operManager">
							<h2>运营经理</h2>
							<p><b>工作职责：</b></p>
							<p>1.	负责线上全面运营管理；<br/>2.	制定月度销售目标，活动的策划实施，效果评估和考核等；<br/>3.	负责产品分析（商品定价、确定主推商品、分析销售情况）、产品销售（商品上架、商品销售、配合推广促销）、产品促销（策划活动方案、执行促销活动、协助促销宣传）、产品编辑、产品汇总建档；<br/>4.	对店铺的PV、销量、跳出率、地域分布、转化率等做出专业的数据分析；定期做好竞争对手网站的数据的采集、评估与分析；<br/>5.	负责店铺的推广引流，运用平台各种营销工具，提高点击率与浏览量，监控、分析店铺的各项运营数据，并根据做出改进优化方案，不断提升店铺的销售转化率；<br/>6.	有效控制投放成本，降低推广成本，最大程度获取展现流量；<br/>7.	执行公司的经营战略，带领电商团队，完成公司的年度业务计划。</p>
							<p><b>任职要求：</b></p>
							<p>1.	大专及以上学历，三年以上电商运营工作经验，有操盘年销,3000万以上的店铺优先；<br/>2.	具有敏锐的商业和市场意识，明确市场定位；熟悉品牌建设，有整合资源、创新经营的思想；<br/>3.	熟悉电商的运营原理及交易规则、了解站内推广资源；<br/>4.	精通电商店铺的数据分析、把握产品的销售节奏，能自主进行报名操作。</p>
							<p style="padding-bottom:0;"><b>薪水区间：10万-15万</b></p>
						</div>
						<div class="job-salesManager">
							<h2>采销经理-自有品牌</h2>
							<p><b>工作职责：</b></p>
							<p>1.	负责自有品牌品类/产品线的销售与运营管理，制定产品的操盘与竞争策略，包括产品销售、价格管理、营销推广、售前售后管理等工作，确保自有品牌产品具有优秀的购物体验；<br/>2.	基于公司策略与市场需求，负责相关品类的产品线规划，并制定切实可行的产品销售计划；<br/>3.	根据销售指标，对任务目标进行细化分解，并制定相应策略，确保销售目标达成；<br/>4.	根据公司自有产品策略与市场需求，联合产品经理制定产品开发方向与开发计划，确保产品上线进度；<br/>5.	根据市场竞争环境与消费者反馈，负责相关产品线的升级换代与功能改进，确保优秀的消费者使用体验；<br/>6.	协同采购部门做好供应链管理，控制产品质量，确保产品可靠性。</p>
							<p><b>任职要求：</b></p>
							<p>1.	本科及以上学历，采购管理、市场营销、管理类物流类相关专业, 电商，商超，现代零售行业经验优先；<br/>2.	2年以上快消品行业从业经验，品类采销、产品经理或运营经理经验，熟悉开发、运营、市场运作流程和知识；<br/>3.	熟悉互联网推广手法，拥有良好的市场思维；<br/>4.	具有优秀的个人沟通及谈判技巧，优秀的商业意识和数据分析能力，懂外语者为佳；<br/>5.	具有良好的职业道德，工作认真负责、积极主动，能承受一定工作压力。</p>
							<p style="padding-bottom:0;"><b>薪水区间：10万-12万</b></p>
						</div>
						<div class="job-finaManager">
							<h2>财务管理</h2>
							<p><b>工作职责：</b></p>
							<p>1.	负责公司相关业务的财务管理工作；<br/>2.	负责公司会计记账统计、金融统计、数据分析工作，及时、准确完整各类监管统计报表及经营情况分析；<br/>3.	负责公司的会计凭证、各种账簿的登记情况，财务报表的管理；<br/>4.	负责对公司的各项开支进行核算，对各种原始凭证进行审核；<br/>5.	负责编制记账凭证；登记账簿；及时、正确地编制会计报表，并对重大事项进行说明；<br/>6.	做好往来账款的管理及保管会计档案。</p>
							<p><b>任职要求：</b></p>
							<p>1.	财会、金融、经济、管理等相关专业本科以上学历；<br/>2.	有互联网类金融机构、银行、信托、小贷、担保等相关金融类企业财务岗位或会计师事务所相关岗位1年以上工作经验者优先；<br/>3.	熟悉国家金融政策、企业财务制度及流程、会计电算化；<br/>4.	熟练运用各类办公软件，数据分析软件；财务软件，熟悉金融类机构财务操作流程；<br/>5.	良好的组织、协调、沟通能力，和团队协作精神，能承受较大工作压力；<br/>6.	具备较强的文字组织能力、语言表达能力、沟通协调能力；<br/>7.	掌握扎实的经济、金融、财务、统计等相关专业知识及思维。</p>
							<p style="padding-bottom:0;"><b>薪水区间：10万-13万</b></p>
						</div>
						<div class="job-custServSpec">
							<h2>客服专员</h2>
							<p><b>工作职责：</b></p>
							<p>1.	接听客服电话，解答客户线上线下咨询，并按照内部流程给予反馈；<br/>2.	定期整理客户反馈，及时反映给相关部门，完善客户服务规范和制度；<br/>3.	了解并掌握平台各种金融产品知识；<br/>4.	协助平台运营和品牌营销的其他工作和活动。</p>
							<p><b>任职要求：</b></p>
							<p>1.	大学专科及以上学历，管理、公关、传媒、互联网、金融或相关专业者优先；<br/>2.	有两年以上相关工作经验，具有行业销售经验优先；<br/>3.	普通话标准，有较强的事业心、进取心，有良好的服务意识、有良好的沟通能力和团队合作精神。</p>
							<p style="padding-bottom:0;"><b>薪水区间：5万-7万</b></p>
						</div>
						<div class="job-prodManager">
							<h2>产品经理</h2>
							<p><b>工作职责：</b></p>
							<p>1.	负责直供平台商品上下架，套餐运营，页面调整；<br/>2.	对所负责的区域销售伙伴的销售数据进行分析和整理；<br/>3.	参与配合区域经理进行区域互联网流量的投放及信息发布；<br/>4.	负责所属品类与各部门的沟通、合作及执行跟踪；<br/>5.	协助处理部分紧急事务。</p>
							<p><b>任职要求：</b></p>
							<p>1.	具电商经验，熟悉互联网，运营过3C数码类目品牌，有B2B经验者优先；<br/>2.	热爱互联网电子商务行业，具有优秀的语言表达和沟通能力，有敏锐的市场观察力，善于分析总结；<br/>3.	有责任心，优秀的谈判技巧，良好的人际关系处理能力，有团队精神，能承受一定压力。</p>
							<p style="padding-bottom:0;"><b>薪水区间：9万–12万</b></p>
						</div>
						<div class="job-ITSystemDes">
							<h2>IT系统设计师</h2>
							<p><b>工作职责：</b></p>
							<p>1.	负责软件系统的设计；<br/>2.	理解系统的业务需求，制定系统的整体框架（包括：技术框架和业务框架）；<br/>3.	对系统框架相关技术和业务进行培训，指导开发人员开发，并解决系统开发、运行中出现的各种问题；<br/>4.	领导与协调整个项目中的技术活动（分析、设计和实施等）；<br/>5.	推动主要的技术决策，并最终表达为软件构架；<br/>6.	确定和文档化系统的相对构架而言意义重大的方面，包括系统的需求、设计、实施和部署等“视图”；<br/>7.	确定设计元素的分组以及这些主要分组之间的接口；<br/>8.	为技术决策提供规则，平衡各类涉众的不同关注点，化解技术风险，并保证相关决定被有效的传达和贯彻；<br/>9.	理解、评价并接收系统需求；评价和确认软件架构的实现。</p>
							<p><b>任职要求：</b></p>
							<p>1.	对“系统结构”所使用的软件技术非常了解；<br/>2.	本科学历，计算机或通信相关专业，3年以上相关工作经验；<br/>3.	精通Struts Hibernate Spring等主流开源框架，熟悉J2EE体系结构；<br/>4.	对面向对象、MVC有深刻的理解，熟练使用常用软件建模工具进行系统分析和设计；<br/>5.	熟悉运用Oracle，SQL Server等数据库开发；<br/>6.	熟悉Weblogic/Tomcat/JBoss等主流应用服务器及Oracle数据库开发技术；<br/>7.	掌握常用需求/架构设计工具使用；<br/>8.	优秀的沟通和谈判技巧，能有效的激励工作团队。</p>
							<p style="padding-bottom:0;"><b>薪水区间：9万–12万</b></p>
						</div>
						<div class="job-UIVisualdes">
							<h2>UI视觉设计师</h2>
							<p><b>工作职责：</b></p>
							<p>1.	负责App、Pad以及PC端的UI设计；负责产品界面风格研究、设计流行趋势分析；<br/>2.	配合团队成员共同完成UI相关设计工作，能根据产品的设计思路设计对应配套的UI；<br/>3.	参与产品构思及移动端界面优化，提出对产品界面的设计见解，对现有产品进行易用性改善，新功能挖掘，把控产品最终界面实现效果；<br/>4.	熟悉移动互联网用户使用习惯，重视用户体验，有自己的交互认知及见解。协助制定相关标准，推动产品在视觉层面的提升；<br/>5.	一个有交互思维的视觉设计师。</p>
							<p><b>任职要求：</b></p>
							<p>1.	设计相关专业本科以上学历；<br/>2.	UI设计工作4年以上，具有2年以上移动端UI设计（包括界面、图标风格与统一规范等）经验（能力优秀者可适当放宽年限）；<br/>3.	有良好的美学功底，优秀的视觉设计能力，熟悉iOS，Android等系统，能把控App、Pad、PC等各平台的设计规范并能快速执行；<br/>4.	能够把控不同设计风格定位和绘制、并能做好设计的统一性；<br/>5.	精通Sketch、Photoshop、Illustartor、AE等设计工具（插画能力强、熟悉动效设计或熟悉C4D者优先。）；<br/>6.	具备良好合作态度及团队精神，能和各种性格的人打交道，并富有工作激情、创造力和责任感，能承受一定强度的工作压力。<br/><b>PS：简历请附上您的作品集！</b></p>
							<p style="padding-bottom:0;"><b>薪水区间：7万-11万</b></p>
						</div>
						<div class="job-dataAnalyst">
							<h2>数据分析师</h2>
							<p><b>工作职责：</b></p>
							<p>1.	负责数据需求对接与分析，为业务部门提供数据支持；<br/>2.	参与运营分析指标、业务指标体系建设；<br/>3.	跟踪及分析各产品线点击、留存及转化，并输出优化方案；<br/>4.	定期出具经营分析、项目评估分析及活动效果分析。</p>
							<p><b>任职要求：</b></p>
							<p>1.	本科及以上学历，一年以上工作经验；<br/>2.	熟练掌握hive，并掌握至少一门数据分析语言/工具（SAS/R/Python/SPSS等）；<br/>3.	掌握数据分析工作方法，能熟练将业务问题转化为数据分析问题；<br/>4.	善于与人沟通，具有良好的团队协作精神，业务适应力强。</p>
							<p style="padding-bottom:0;"><b>薪水区间：7万-10万</b></p>
						</div>
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
