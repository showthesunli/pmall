<#assign sec=JspTaglibs["http://www.springframework.org/security/tags"] />
<div class="jf-header">
  <div class="jf-header-top">
    <div class="jf-width1000">
      <ul class="topNav">
        <#--已登录显示用户名密码 -->
        <#--<@sec.authorize access="authenticated">-->
        <@sec.authorize access="isAuthenticated()">
        <li><a href="member/member.jsp"><@sec.authentication property="principal.username"/></a></li>
        <li><a href="/logout" >注销</a></li>
        </@sec.authorize>
        <#--未登录显示登录按钮 -->
        <@sec.authorize access="isAnonymous()">
        <li><a href="/login" >登录</a></li>
        <li><a href="/register">注册</a></li>
        </@sec.authorize>
        <li><a href="shoppingCart.jsp"><span class="cartIcon bgImgS"></span><span class="cartIconTxt">购物车</span></a></li>
        <li><a href="#">帮助中心</a></li>
      </ul>
    </div>
  </div>
  <div class="jf-header-nav">
    <div class="jf-width1000">
      <div class="jf-logo"></div>
      <ul class="jf-navList">
        <li><a href="index.jsp" target="_blank" class="navListBgRed">首页</a></li>
        <li>
          <a href="#" target="_blank">产品</a>
          <div class="jf-dropDownList">
            <a href="#">办公用品</a>
            <a href="#">家用电器</a>
            <a href="#">购物卡/礼品卡</a>
          </div>
        </li>
        <li><a href="#" target="_blank">持卡服务</a></li>
        <li><a href="#" target="_blank">在线购卡</a></li>
        <li><a href="productList.jsp" >积分商城</a></li>
      </ul>
      <form class="jf-searchForm">
        <p><input type="text" class="jf-searchTxt btnBgS" /><input type="submit" class="jf-searchBtn btnBgS" value="" /></p>
      </form>
    </div>
  </div>
</div>
