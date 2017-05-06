<#assign sec=JspTaglibs["http://www.springframework.org/security/tags"] />
<#import "/spring.ftl" as spring/>
<div class="jf-header-top">
    <div class="jf-width1200">
        <ul class="topNav">
            <@sec.authorize access="isAuthenticated()">
                <li style="background: url(images/ico1.png) no-repeat left center;"><a href="<@spring.url '/member'/>"><@sec.authentication property="principal.username"/></a></li>
                <li style="background: url(images/ico2.png) no-repeat  left center;"><a href="<@spring.url '/logout'/>">注销</a></li>
            </@sec.authorize>
            <@sec.authorize access="isAnonymous()">
            <li style="background: url(images/ico1.png) no-repeat left center;"><a href="<@spring.url '/login'/>">登录</a></li>
            <li style="background: url(images/ico2.png) no-repeat  left center;"><a href="<@spring.url '/register'/>">注册</a></li>
            </@sec.authorize>
            <li style="background: url(images/ico3.png) no-repeat  left center;"><a href="<@spring.url "/shoppingCart"/>">购物车</a></li>
            <li style="background: url(images/ico4.png) no-repeat  left center;"><a href="<@spring.url '/help'/>" >帮助中心</a></li>
        </ul>
    </div>
</div>
<div class="top">
    <div class="top_left"><a href="<@spring.url '/index'/>" ><img src="<@spring.url '/images/logo.png'/>"  /></a></div>
    <div class="nav-center">
        <ul class="nav">
            <li class='on'><a href="<@spring.url '/index'/>" >首页</a></li>
            <li class='dhjt'><a href="<@spring.url '/about'/>" onmouseover="mouseover(this, 1)" onmouseout="mouseout()">关于公司</a></li>
            <li class='dhjt' style="width:130px;"><a href="<@spring.url '/fuwu'/>" onmouseover="mouseover(this, 2)" onmouseout="mouseout()">我们的服务</a></li>
            <li class='dhjt'><a href="<@spring.url '/pro'/>" onmouseover="mouseover(this, 3)" onmouseout="mouseout()">积分商城</a></li>
            <li ><a href="<@spring.url '/shangjia'/>" onmouseover="mouseover(this, 4)" onmouseout="mouseout()">合作商家</a></li>
            <li><a href="<@spring.url '/onlinePurchase'/>" onmouseover="mouseover(this, 5)" onmouseout="mouseout()">在线购卡</a></li>
            <li><a href="<@spring.url '/jifen'/>" onmouseover="mouseover(this, 5)" onmouseout="mouseout()">积分查询</a></li>
        </ul>
    </div>
    <div class="top_right">
        <form action="#" method="get" name="myform" id="myform"   >
            <input type="text" class="input"   style="color: rgb(102, 102, 102);" onfocus="if(this.value=='Search here ...')this.value=''" onblur="if(this.value=='')this.value='Search here ...'" value="Search here ..." ><input type="image" src="<@spring.url '/images/ss.png'/>" width="18" class="button"  />
        </form>
    </div>
</div>

<!-- 下拉nav over -->
<div class="menu-list" id="menu1" onmouseover="_mouseover()" onmouseout="_mouseout()" >
    <div class="hd">
        <ul>
            <li><a href="<@spring.url '/about'/>">公司简介</a></li>
            <!--<li><a href="<@spring.url '/anli'/>">案例介绍</a></li>-->
            <li><a href="<@spring.url '/news'/>">公司新闻</a></li>
            <li><a href="<@spring.url '/join'/>">加入途皓</a></li>
            <li><a href="<@spring.url '/contact'/>">联系我们</a></li>
        </ul>
    </div>
</div>
<div class="menu-list2" id="menu2" onmouseover="_mouseover()" onmouseout="_mouseout()" >
    <div class="hd">
        <ul>
            <li><a href="<@spring.url '/fuwu#pointsForSer'/>">积分兑换服务</a></li>
            <li><a href="<@spring.url '/fuwu#equityForSer'/>">优惠权益服务</a></li>
            <li><a href="<@spring.url '/fuwu#digitalMarketingSer'/>">创新支付服务</a></li>
        </ul>
    </div>
</div>
<div class="menu-list" id="menu3" onmouseover="_mouseover()" onmouseout="_mouseout()" >
    <!--
    <div class="hd">
        <ul>
            <li><a href="javascript:void(0);">保健品</a></li>
            <li><a href="javascript:void(0);">酒类</a></li>
            <li><a href="javascript:void(0);">办公用品</a></li>
            <li><a href="javascript:void(0);">家用电器</a></li>
            <li><a href="javascript:void(0);">厨具</a></li>
            <li><a href="javascript:void(0);">母婴</a></li>
            <li><a href="javascript:void(0);">购物卡/礼品卡</a></li>
            <li><a href="javascript:void(0);">数码影音</a></li>
            <li><a href="javascript:void(0);">汽车用品</a></li>
        </ul>
    </div>
    -->
</div>
<script type="text/javascript">jQuery(".menu-list").slide(0); </script>
<!-- 下拉nav over -->
