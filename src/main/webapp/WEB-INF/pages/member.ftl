<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>会员中心</title>
    <link href="/css/common.css" rel="stylesheet" type="text/css"/>
    <link href="/css/model.css" rel="stylesheet" type="text/css"/>
    <link href="/css/member.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="/js/jquery.js"></script>
    <script type="text/javascript" src="/js/model.js"></script>
    <style>
	.m-detail{ padding:20px 0;}
	.m-detail p{ height:20px;}
	.m-detail a,.bt3,.order-list a{ color:#0088cc;}
	.m-remark{ float: left; height: 50px; width: 300px; margin-top: 40px;}
	th{border-bottom: 1px solid #CCC;height: 30px;line-height: 30px;background: whiteSmoke;background: -moz-linear-gradient(top, #F8F8F8, #EEE);}
	td,th{ display: table-cell; vertical-align: inherit;}
	h2{ height:25px; font-size:14px; font-weight:bold; margin-top:10px; font-family:"宋体"; position:relative;}
	h2 .alllist{ float:right; font-size:12px; font-weight:normal; color:#666; position:absolute; right:5px; top:2px;}
	h2 .prd-ts{ color:#F60; font-size:12px; font-weight:normal;}
	h2 span{ font-size:14px;color:#F00; margin-left:10px;}
	.t1{ color:#F00;}
	.t2{ color:#090;}
	.t3{ color:#999;}
	.t4{ color:#333;}
	</style>
</head>

<body>
<div class="jf-wrapper">
    <!--头部-->
    <jsp:include page="header.jsp"></jsp:include>
    <!--头部 end-->

    <div class="main">
        <div class="m-main">
            <div class="m-left">
                <div class="baseinfo">
                    <div class="headimg"><img src="../images/member/1.jpg" width="85" height="85"/></div>
                    <div class="bltext">
                        <p class="bt1"><%=center.getUser().getId() %></p>
                        <p class="bt2">普通会员</p>
                        <a href="myAccountEdit.jsp" class="bt3">编辑资料</a>
                    </div>
                </div>
                <div class="mmenu">
                    <div class="mtitle">| <a href="#">我的会员中心</a></div>
                    <div class="menulist">
                        <a href="#">我的订单</a>
                        <a href="#">我的积分账户</a>
                    </div>
                </div>
                <!--<div class="mmenu-buttom" >
                    <div class="mtitle">| <a href="#">客户服务</a></div>
                </div>-->
            </div>
            <div class="m-right" style="height:462px;">
                <div class="rtitle">我的会员中心</div>
                <div class="m-content">
                    <div class="m-info">
                        <div class="m-detail">
                            <p>ID：<%=center.getUser().getId() %></p>
              <p>邮箱：<%if("0".equals(infoobj.optString("isAuthEmail"))){%><%="".equals(infoobj.getString("authEmail"))?infoobj.getString("email"):infoobj.getString("authEmail")%> <a href="authEmailApply.jsp">认证邮箱</a><%}else{out.print(infoobj.getString("authEmail"));}%></p>
              <p>手机：<%if("0".equals(infoobj.optString("isAuthMobile"))){%>未绑定 <a href="authMobileApply.jsp">绑定手机</a><%}else{out.print(infoobj.getString("authMobilePhone"));}%></p>
                        </div>
                        <div class="m-remark">使用ID、邮箱、手机号都可以登录网站。认证邮箱和绑定手机可用于找回登录密码。</div>
                    </div>
                    
                    <div class="order-list">
                        <h2>我的订单 <a href="myOrder.jsp" class="alllist">查看全部订单</a></h2>
                        <%if(ordlist.length()>0){%>
                        <table width="765" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <th scope="col" width="350">订单信息</th>
                            <th scope="col">金额(元)</th>
                            <th scope="col">下单时间</th>
                            <th scope="col">订单状态</th>
                            <th scope="col">配送状态</th>
                            <th scope="col">操作</th>
                          </tr>
                          <%
                           for(int i=0;i<ordlist.length();i++){
                                JSONObject obj =  (JSONObject)ordlist.get(i);
                                String cssClass = "t3";
                                if("已完成".equals(obj.optString("orderStatus")))cssClass = "t2";
                          %>
                          <tr>
                            <td colspan="6" style="height:25px; border-bottom:solid 1px #f2f2f2;">&nbsp;&nbsp;订单编号：<%=obj.optString("billNo")%></td>
                          </tr>
                          <tr align="center">
                            <td><div style="width:350px;text-overflow: ellipsis;white-space: nowrap;overflow: hidden;"><%=obj.optString("orderProductPrice")%></div></td>
                            <td><%=obj.optString("totalPrice")%></td>
                            <td><%=Util.datetimeFormat(obj.optString("saleDateTime"))%></td>
                            <td class="<%=cssClass%>"><%=obj.optString("orderStatus")%></td>
                            <td><%=obj.optString("deliveryStatus")%></td>
                            <td>
                            <a href="buycfm.jsp?billNo=<%=obj.optString("billNo")%>" style="text-decoration:none;">详情</a><%if(obj.getString("orderStatus").equals("等待支付")){%><a href="buycfm.jsp?billNo=<%=obj.getString("billNo")%>" style="text-decoration:none; margin-left:5px;">支付</a><%}%>
                            <%if(!obj.optString("orderStatus").equals("已完成")&&!obj.getString("orderStatus").equals("已支付")){%><a href="myOrderDel.jsp?billNo=<%=obj.getString("billNo")%>" style="text-decoration:none; margin-left:5px;" onclick="return del()">删除</a><%}%>
                            </td>
                          </tr>
                          <%}%>
                        </table>
                        <%}else{%>
                        <div class="nodata">您还没有下过订单哦！</div>
                        <%}%>
                      </div>
          
                </div>
            </div>
        </div>
    </div>

    <!--底部-->
    <div class="jf-bottom">
        <div class="jf-bottom-item">
            <div class=" jf-width1000">
                <dl class="itemList">
                    <dt><a href="#">购物指南</a></dt>
                    <dd><a href="#">欣意卡</a></dd>
                    <dd><a href="#">换购卡</a></dd>
                    <dd><a href="#">手机充值</a></dd>
                    <dd><a href="#">游戏充值</a></dd>
                    <dd><a href="#">网上购物</a></dd>
                    <dd><a href="#">补费说明</a></dd>
                </dl>

                <dl class="itemList">
                    <dt><a href="#">支付方式</a></dt>
                    <dd><a href="#">易付卡支付</a></dd>
                    <dd><a href="#">中欣卡支付</a></dd>
                    <dd><a href="#">银行卡支付</a></dd>
                    <dd><a href="#">易付网余额</a></dd>
                    <dd><a href="#">发票问题</a></dd>
                </dl>

                <dl class="itemList">
                    <dt><a href="#">易付帐户</a></dt>
                    <dd><a href="#">注册及登录</a></dd>
                    <dd><a href="#">帐户资产及充值</a></dd>
                    <dd><a href="#">易付卡</a></dd>
                    <dd><a href="#">易付券</a></dd>
                    <dd><a href="#">我的订单</a></dd>
                    <dd><a href="#">修改/忘记密码</a></dd>
                </dl>

                <dl class="itemList">
                    <dt><a href="#">配送与售后</a></dt>
                    <dd><a href="#">常见问题</a></dd>
                    <dd><a href="#">运费标准</a></dd>
                    <dd><a href="#">快递查询</a></dd>
                    <dd><a href="#">退换货</a></dd>
                    <dd><a href="#">退款</a></dd>
                </dl>

                <dl class="itemList">
                    <dt><a href="#">其他内容</a></dt>
                    <dd><a href="#">注册协议</a></dd>
                    <dd><a href="#">商务合作</a></dd>
                    <dd><a href="#">关于我们</a></dd>
                    <dd><a href="#">免责声明</a></dd>
                    <dd><a href="#">易付网博客</a></dd>
                </dl>

                <dl class="itemList itemListLast">
                    <dt>&nbsp;</dt>
                    <dd>&nbsp;</dd>
                    <dd>周一至周日 9:00-18:00</dd>
                    <dd>投诉：service@yifuka.com</dd>
                    <dd>投诉专线：13366469566</dd>
                    <dd>&nbsp;</dd>
                    <dd>&nbsp;</dd>
                </dl>
            </div>
        </div>
        <div class="jf-bottom-copyright">有限公司有限公司有限公司有限公司 版权所有&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;地址：广州市天河区广州市天河区广州市天河区</div>
    </div>
    <!--底部 end-->

    <div id="loginBg"></div>

    <!--登录-->
    <div class="jf-login">
        	<h2 class="jf-loginTitle">登录</h2>
          <a href="#"  onclick="pupClose()" class="loginCloseBtn"><img src="../images/closeImg.png" width="30" height="30" /></a>
          <form class="loginForm">
       	    <p><b class="bgImgS" style="background-position:0 -30px;"></b><input  class="loginTxt" type="text" placeholder="用户名/手机/邮箱"  /></p>
                <p>
                    <b class="bgImgS" style="background-position:0 -52px;"></b>
                    <input class="loginTxt" id="password-text" type="password" placeholder="请输入密码" />
                </p>
                <p><input name="" type="checkbox" value="" /><label>自动登录</label><a href="#" class="forgotPsd">忘记密码？</a></p> 
                <p style="margin-bottom:10px;"><input type="submit" value="登录" class="loginBtn btnBgS" /></p>
                <p class="toRegister">还没有账号<a href="#">请注册</a></p>
            </form>
        </div>
    <!--登录 end-->
    
    <!--注册-->
        <div class="jf-register">
        	<div class="jf-overflowH">
                <h2 class="jf-registerTitle titlePitch" id="phoneForm">手机注册</h2>
                <h2 class="jf-registerTitle" id="emialForm" style=" border-left:1px solid #ccc; border-radius:0 10px 0 0; width:249px;">邮箱注册</h2>
            </div>
          	<a href="#"  onclick="regClose()" class="registerCloseBtn"><img src="../images/closeImg.png" width="30" height="30" /></a>
          	<form class="registerForm">
       	    	<p><label>手机号码</label><input name="registerPhone"  class="registerTxt" type="text" placeholder="建议使用常用手机" /></p>
                <p><label style="letter-spacing:6px;">验证码</label><input type="button" value="发验证码" class="sendCode" /><input name="registerCode" type="text" class="registerTxt" placeholder="请输入验证码"  style="width:118px;"  /></p>
                <p><label>设置密码</label><input name="registerPsd" type="password" class="registerTxt" placeholder="请输入密码，密码至少6位"  /></p>
                <p><label>确认密码</label><input name="registerConPsd" type="password" class="registerTxt" placeholder="再次输入您的密码"  /></p>
                <p><input name="" type="checkbox" value=""  checked="checked"/><label style="line-height:20px;">我已阅读并同意</label><a href="#" style="color:#0099ff">《注册协议》</a></p> 
                <p style="margin-bottom:10px;"><input type="submit" value="注册" class="registerBtn btnBgS" /></p>
                <p class="toLogin">已有账号<a href="#">请登录</a></p>
            </form>
            <form class="registerFormForEmial" style="display:none;">
       	    	<p><label>邮箱账号</label><input name="registerEmail"  class="registerTxt" type="text" placeholder="建议使用常用邮箱" /></p>
                <p><label>设置密码</label><input name="registerEPsd" type="password" class="registerTxt" placeholder="请输入密码，密码至少6位"  /></p>
                <p><label>确认密码</label><input name="registerEConPsd" type="password" class="registerTxt" placeholder="再次输入您的密码"  /></p>
                <p><label style="letter-spacing:6px;">验证码</label><input name="registerECode" type="text" class="registerTxt" placeholder="请输入验证码"  /></p>
                <p><input name="" type="checkbox" value=""  checked="checked"/><label style="line-height:20px;">我已阅读并同意</label><a href="#" style="color:#0099ff">《注册协议》</a></p> 
                <p style="margin-bottom:10px;"><input type="submit" value="注册" class="registerBtn btnBgS" /></p>
                <p class="toLogin">已有账号<a href="#">请登录</a></p>
            </form>
        </div>
     <!--注册 end-->

    <!--提示框-->
    <div class="tipDiv">
        <div class="jf-overflowH tipDivTitle"><h3 style="float:left;">提示</h3><span onclick="tipClose()"
                                                                                   style="float:right; cursor:pointer; color:#999;">×</span>
        </div>
        <p style="font-size:14px; font-weight:bold; color:#ea6870">确定要删除？</p>

        <p><input type="button" value="确定" class="sureBtn"/><input type="button" value="取消" class="cancleBtn"
                                                                   onclick="tipClose()"/></p>
    </div>
    <!--提示框 end-->

    <!--积分来源-->
    <div class="exchange">
        <div class="jf-overflowH exchangeTitle"><h3 style="float:left;">积分来源</h3><span onclick="exchangeClose()"
                                                                                       style="float:right; cursor:pointer; color:#999;">×</span>
        </div>

        <div class="jf-overflowH" style="margin:20px;">
            <h4 class="industry industryChecked"><input name="radioG" type="radio" value="" checked="checked"
                                                        style=" float:left; margin-top:8px;"/>银行</h4>
            <ul class="industryItem jf-overflowH">
                <li id="cx">储蓄卡</li>
                <li class="borderColorW" id="xy">信用卡</li>
            </ul>
            <div class="industryList jf-overflowH" id="industry-cx" style="display:none;">
                <div><input name="radioG1" type="radio" value=""/><img src="../images/bank02.png" width="120" height="20"/>
                </div>
                <div><input name="radioG1" type="radio" value=""/><img src="../images/bank01.png" width="120" height="20"/>
                </div>
                <div><input name="radioG1" type="radio" value=""/><img src="../images/bank03.png" width="120" height="20"/>
                </div>
            </div>
            <div class="industryList jf-overflowH" id="industry-xy">
                <div><input name="radioG1" type="radio" value=""/><img src="../images/bank01.png" width="120" height="20"/>
                </div>
                <div><input name="radioG1" type="radio" value=""/><img src="../images/bank02.png" width="120" height="20"/>
                </div>
                <div><input name="radioG1" type="radio" checked="checked" value=""/><img src="../images/bank03.png"
                                                                                         width="120" height="20"/></div>
            </div>
        </div>

        <div class="jf-overflowH" style="margin:20px;">
            <h4 class="industry"><input name="radioG" type="radio" value="" style=" float:left; margin-top:8px;"/>通讯行业
            </h4>

            <div class="industryList jf-overflowH" style="border:none;">
                <div><input name="radioG2" type="radio" value=""/><img src="../images/bank02.png" width="120" height="20"/>
                </div>
                <div><input name="radioG2" type="radio" value=""/><img src="../images/bank01.png" width="120" height="20"/>
                </div>
            </div>
        </div>

        <div class="jf-overflowH" style="margin:20px;">
            <h4 class="industry"><input name="radioG" type="radio" value="" style=" float:left; margin-top:8px;"/>航空公司
            </h4>

            <div class="industryList jf-overflowH" style="border:none;">
                <div><input name="radioG2" type="radio" value=""/><img src="../images/bank02.png" width="120" height="20"/>
                </div>
                <div><input name="radioG2" type="radio" value=""/><img src="../images/bank01.png" width="120" height="20"/>
                </div>
            </div>
        </div>

        <p style="text-align:center; margin-bottom:30px;"><input type="button" value="确定" class="sureBtn"/><input
                type="button" value="取消" class="cancleBtn" onclick="exchangeClose()"/></p>

    </div>
    <!--积分来源 end-->

</div>
</body>

<script language="javascript">
    $(document).ready(function (e) {
        //数量减
        $(".cartNumL").click(function () {
            var v = $(this).next(".cartNum").attr("value");
            var num = parseInt(v) - 1;
            var exchange = num * 5000;
            var price = num * 100;

            if (parseInt(v) == 1) {
                $(this).next(".cartNum").val(1);
            }
            else {
                $(this).next(".cartNum").val(num);
                //$(this).parent().parent().find(".priceCount").html(price.toFixed(2));
                $(this).parent().parent().find(".exchangeCount").html(exchange);
                GetCount();
            }
        });

        //数量加
        $(".cartNumR").click(function () {
            var v = $(this).prev(".cartNum").attr("value");
            var num = parseInt(v) + 1;
            var exchange = num * 5000;
            var price = num * 100;

            $(this).prev(".cartNum").val(num);
            //$(this).parent().parent().find(".priceCount").html(price.toFixed(2));
            $(this).parent().parent().find(".exchangeCount").html(exchange);
            GetCount();
        });

        //全选
        $(".allselect").click(function () {
            if ($(this).attr("checked")) {
                $(".jf-cartItem input[name=newslist]").each(function () {
                    $(this).attr("checked", true);
                });
                GetCount();
            }
            else {
                $(".jf-cartItem input[name=newslist]").each(function () {
                    if ($(this).attr("checked")) {
                        $(this).attr("checked", false);
                    } else {
                        $(this).attr("checked", true);
                    }
                });
                GetCount();
            }
        });

        // 所有复选(:checkbox)框点击事件
        $(".jf-cartItem input[name=newslist]").click(function () {
            if ($(this).attr("checked")) {
                var n = $(".jf-cartItem input:checked").length;
                var i = $("input[name=newslist]").length;
                if (n == i) {
                    $(".allselect").attr("checked", true);
                }
                $(this).attr("checked", true);
                GetCount();
            }
            else {
                $(this).attr("checked", false);
                $(".allselect").attr("checked", false);
                GetCount();
            }
        });

        $("#cx").click(function () {
            $(".industryItem li").removeClass("borderColorW");
            $(this).addClass("borderColorW");
            $("#loginBg").css("display", "block");
            $("#industry-cx").css("display", "block");
            $("#industry-xy").css("display", "none");
        })

        $("#xy").click(function () {
            $(".industryItem li").removeClass("borderColorW");
            $(this).addClass("borderColorW");
            $("#loginBg").css("display", "block");
            $("#industry-xy").css("display", "block");
            $("#industry-cx").css("display", "none");
        })
        $("input[name=radioG]").click(function () {
            $(".industry").removeClass("industryChecked");
            $(this).parent("h4").addClass("industryChecked");
        })
    })

    function GetCount() {
        var pConts = 0;
        var exConts = 0;
        var numTotal = 0;
        $(".jf-cartItem input[name=newslist]").each(function () {
            if ($(this).attr("checked")) {
                for (var i = 0; i < $(this).length; i++) {
                    exConts += parseInt($(this).parent().parent().find(".exchangeCount").text());
                    //pConts += parseInt($(this).parent().parent().find(".priceCount").text());
                    numTotal += parseInt($(this).parent().parent().find(".cartNum").val());
                }
            }
        });
        $("#shuliang").text(numTotal);
        $("#exchangeTotal").html(exConts);
        $("#priceTotal").html((pConts).toFixed(2));
    }

    function exchangeOpen() {
        $("#loginBg").css("display", "block");
        $(".exchange").css("display", "block");
    }
    function exchangeClose() {
        $("#loginBg").css("display", "none");
        $(".exchange").css("display", "none");
    }

</script>

</html>
