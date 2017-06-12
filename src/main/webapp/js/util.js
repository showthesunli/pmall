var xtyGetData = function (url) {
    this.url = url;
};
//获取数据集的json
xtyGetData.prototype.data = {
    pageID: "",
    pageDataGrpID: "",
    fileName: "",
    path: "",
    pageDataGrpCondition: "",
    pageButtonID: "",
    pageButtonCondition: ""

};
//获取数据集json
xtyGetData.prototype.ajax = function (callBack) {
    var $this = this;
    $.ajaxQueue({
        url: this.url,
        async: true,
        data: "dataGrpJson=" + JSON.stringify(this.data),
        cache: false,
        //type: "POST",
        type: "GET",
        dataType: "json",
        success: function (data) {
            callBack.call($this, data);
        }

    });
};
//下载加载错误的图片 obj指的是相应的img元素  imgName是图片名称，imgPath是为了在子目录调用而设计的，不加的就默认是根目录
function downloadErrImg(obj, imgName, imgPath) {
    var $this = $(obj);
    if (imgPath) {
        obj.src = imgPath + 'images/default.gif';
    } else {
        obj.src = 'images/default.gif';
    }
    if (imgName == ""){
        obj.onerror = null;
        return;
    }
    var path = "ajaxGetimg";
    if (imgPath) {
        path = imgPath + path;
    }
    obj.onerror = null;//结束，以防止无限循环的下载
    var operate = new xtyGetData(path);
    operate.data.fileName = imgName;
    operate.ajax(function (data) {
        obj.onerror = null;//结束，以防止无限循环的下载
    });
}


function displayNoImg(obj) {
    obj.src = 'images/default.gif';
}

//显示倒计时的初始化
function showTime(tmrIdList, tList, funList) {
    this.tmrIdList = tmrIdList; //页面元素id列表
    this.tList = tList;//时间差列表
    this.funList = funList;//倒计时完成后执行的函数
    this.hendle = true;//时间控制
}
//开始倒计时
showTime.prototype.setTimeShow = function () {
    var str_time;
    var int_day, int_hour, int_minute, int_second, time_distance;
    for (var i = 0; i < this.tmrIdList.length; i++) {
        time_distance = this.tList[i];
        this.tList[i] = this.tList[i] - 1000;
        if (time_distance > -1) {
            int_day = Math.floor(time_distance / 86400000);
            time_distance -= int_day * 86400000;
            int_hour = Math.floor(time_distance / 3600000);
            time_distance -= int_hour * 3600000;
            int_minute = Math.floor(time_distance / 60000);
            time_distance -= int_minute * 60000;
            int_second = Math.floor(time_distance / 1000);
            if (int_hour < 10)
                int_hour = "0" + int_hour;
            if (int_minute < 10)
                int_minute = "0" + int_minute;
            if (int_second < 10)
                int_second = "0" + int_second;
            str_time = "<b class='ttnum'>" + int_day + "</b>天" + " <b class='ttnum'>" + int_hour + "</b>时<b class='ttnum'>" + int_minute + "</b>分<b class='ttnum'>" + int_second + "</b>秒";
            $("#" + this.tmrIdList[i]).html(str_time);
        } else {
            $("#" + this.tmrIdList[i]).html("<b class='ttnum'>0</b>天" + " <b class='ttnum'>0</b>时<b class='ttnum'>0</b>分<b class='ttnum'>0</b>秒");
            if (this.funList[i] && this.funList[i] != "") {
                eval(this.funList[i])
            }
            ;//时间完了就执行接下来的函数
            this.tmrIdList.splice(i, 1);
            this.funList.splice(i, 1);
            this.tList.splice(i, 1);
            i--;
        }
    }
    var self = this;
    setTimeout(function () {
        if (self.hendle) self.setTimeShow();
    }, 1000);
}
//获取时间微秒差 diff是用于调节误差的，单位为微秒
function getDistance(endTime, sysTime, diff) {
    if (endTime == "")return 0;
    if (!diff)diff = 0;
    var distance = converToUS(endTime) - converToUS(sysTime) - diff;
    if (distance < 0)return 0;
    return distance;
}
//转化为微秒:20120826235634
function converToUS(timestr) {
    if (timestr.length < 14)timestr += "000000";
    if (timestr.length > 14)timestr = timestr.substr(0, 14);
    timestr = datetimeFormat(timestr, "/", ":");
    var date = new Date(timestr);
    var ds = date.getTime();
    return ds;
}
//转换日期格式 根据separator来分隔日期格式 输入：20120917
function dateFormat(date, separator) {
    if (date == null || date == "")return "";
    if (separator == null || separator == "")separator = "-";
    var year = date.substr(0, 4);
    var month = date.substr(4, 2);
    var day = date.substr(6, 2);
    return year + separator + month + separator + day;
}
//转换时间格式 根据separator来分隔时间格式 输入：154321
function timeFormat(time, separator) {
    if (time == null || time == "")return "";
    if (separator == null || separator == "")separator = ":";
    var hours = time.substr(0, 2);
    var minutes = time.substr(2, 2);
    var seconds = time.substr(4, 2);
    return hours + separator + minutes + separator + seconds;
}
//日期时间转换
function datetimeFormat(datetime, dSeparator, tSeparator) {
    if (datetime == null || datetime == "")return "";
    var date = datetime.substr(0, 8);
    var time = datetime.substr(8);
    date = dateFormat(date, dSeparator);
    time = timeFormat(time, tSeparator);
    return date + " " + time;
}
//处理未定义时候显示的文字
function setUndefinedText(value, text) {
    if (value == undefined) {
        return text;
    }
    return value;
}

//获取验证码
function getVerificate(id) {
}
//************分页设置代码*************//
//设置分页pageObj是设置分页的参数json， containerId1,containerId2是两个组分页的id容器 
function createPageSet(pageObj, containerId1, containerId2) {
    var pageCount = Math.ceil(pageObj.sum / pageObj.numOfPerPage);
    var pageStr = "";
    if (pageCount > 1) {
        with (pageObj) {
            //设置第一页和上一页
            if (currentPage == 1) {
                pageStr += setDisableText("上一页");
                pageStr += setDisableText("1");
            } else {
                pageStr += setPageCtrl("上一页", param, currentPage - 1);
                pageStr += setPageCtrl("1", param, 1);
            }
            //页数少于等于8的时候不会出现省略号
            if (pageCount <= 8) {
                for (var i = 2; i < pageCount; i++) {
                    if (currentPage == i)
                        pageStr += setDisableText(i);
                    else
                        pageStr += setPageCtrl(i, param, i);
                }
            } else {//页数大于8的时候会出现省略号
                var i = currentPage - 3, j, k = 0;
                if (i < 2) {//保证当前页码的左右页码数目总和为7个。当前页码左边不够3个，差多少个够3个就在右边补上多少个
                    k = 1 - i;
                    i = 2;
                }
                var maxp = currentPage - (-3) + k;
                if (maxp >= pageCount) {//当前页码右边不够3个，差多少个够3个就在左边补上多少个
                    k = maxp - pageCount;
                    maxp = pageCount - 1;
                    i = i - k;
                    if (i < 2) i = 2;
                }
                if (currentPage > 5)pageStr += setPageDot();
                for (j = 0; j < 7, i <= maxp; i++, j++) {
                    if (currentPage == i)
                        pageStr += setDisableText(i);
                    else
                        pageStr += setPageCtrl(i, param, i);
                }
                if (pageCount - currentPage >= 5)pageStr += setPageDot();
            }
            if (currentPage == pageCount) {
                pageStr += setDisableText(pageCount);

                pageStr += setDisableText("下一页");
            } else {
                pageStr += setPageCtrl(pageCount, param, pageCount);
                pageStr += setPageCtrl("下一页", param, currentPage - (-1));
            }
        }
        $("#" + containerId1).html(pageStr);
        $("#" + containerId2).html(pageStr);
    }

}
//分页中 当前页面的样式
function setDisableText(text) {
    return "<span class='disable'>" + text + "</span>";
}
//输出分页省略号...
function setPageDot() {
    return "<span class='dot'>..</span>";
}
//生成页码 1 2 3 4 5……
function setPageCtrl(text, param, nextPage) {
    var condition = "currentPage=" + nextPage + "|numOfPerPage=" + param.numOfPerPage + "|" + param.condition;
    var str = "<a href='javascript:void(0)' onclick=\"getInfoByPage('" + param.pageID + "','" + param.pageDataGrpID + "','" + condition + "','" + param.variable + "','" + param.fun + "','" + param.path + "')\">" + text + "</a>";
    return str;
}
//condition：查询附加条件 variable:查询回调时候保存的变量  fun：回调执行函数
function getInfoByPage(pageID, pageDataGrpID, condition, variable, fun, path) {
    var operate;
    if (path != 'undefined') {
        operate = new xtyGetData(path + "ajaxDataSet");
    } else {
        operate = new xtyGetData("ajaxDataSet");
    }

    operate.data.pageID = pageID;
    operate.data.pageDataGrpID = pageDataGrpID;
    operate.data.pageDataGrpCondition = condition;
    operate.ajax(function (data) {
        if (data) {
            var curr = condition.split("|")[0].split("=")[1];
            eval(variable + "=data;pageJson.currentPage=curr;pageJson.param.currentPage=curr;" + fun + ";");
        }
    });
}

//***********用于java输出而设置的分页************//
/*
 pobj={
 sum:10,//记录总数
 currentPage:1,//当前页
 pageSize:10,//单页记录总数
 url:"xxx.jsp",//页面地址
 pageParamName:"pn",//分页参数名称
 otherParam:"&name=abc&s=n",//除了分页参数之外的其他参数
 containerId1:"pageset1",//页面存放分页的DOM元素id 1
 containerId2:"pageset2"//页面存放分页的DOM元素id 2
 }
 */
function JavaPageSet(pobj) {
    var pageCount = Math.ceil(pobj.sum / pobj.pageSize);
    var pageStr = "";
    if (pageCount > 1) {
        //设置第一页和上一页
        if (pobj.currentPage == 1) {
            pageStr += setDisableText("上一页");
            pageStr += setDisableText("1");
        } else {
            pageStr += setPageNum("上一页", pobj, pobj.currentPage - 1);
            pageStr += setPageNum("1", pobj, 1);
        }
        //页数少于等于8的时候不会出现省略号
        if (pageCount <= 8) {
            for (var i = 2; i < pageCount; i++) {
                if (pobj.currentPage == i)
                    pageStr += setDisableText(i);
                else
                    pageStr += setPageNum(i, pobj, i);
            }
        } else {//页数大于8的时候会出现省略号
            var i = pobj.currentPage - 3, j, k = 0;
            if (i < 2) {//保证当前页码的左右页码数目总和为7个。当前页码左边不够3个，差多少个够3个就在右边补上多少个
                k = 1 - i;
                i = 2;
            }
            var maxp = pobj.currentPage - (-3) + k;
            if (maxp >= pageCount) {//当前页码右边不够3个，差多少个够3个就在左边补上多少个
                k = maxp - pageCount;
                maxp = pageCount - 1;
                i = i - k;
                if (i < 2) i = 2;
            }
            if (pobj.currentPage > 5)pageStr += setPageDot();
            for (j = 0; j < 7, i <= maxp; i++, j++) {
                if (pobj.currentPage == i)
                    pageStr += setDisableText(i);
                else
                    pageStr += setPageNum(i, pobj, i);
            }
            if (pageCount - pobj.currentPage >= 5)pageStr += setPageDot();
        }
        if (pobj.currentPage == pageCount) {
            pageStr += setDisableText(pageCount);

            pageStr += setDisableText("下一页");
        } else {
            pageStr += setPageNum(pageCount, pobj, pageCount);
            pageStr += setPageNum("下一页", pobj, pobj.currentPage - (-1));
        }
        $("#" + pobj.containerId1).html(pageStr);
        $("#" + pobj.containerId2).html(pageStr);
    }
}
//生成页码 1 2 3 4 5……
//text分页标签的页码，pobj分页对象，nextPage 下一页页码
function setPageNum(text, pobj, nextPage) {
    var str = "<a href='" + pobj.url + "?" + pobj.pageParamName + "=" + nextPage + pobj.otherParam + "'>" + text + "</a>";
    return str;
}


//*******************分页结束******************//
//将链接上“？”后面的参数转化为form中的hidden并使用post方法提交
function p2fSubmit(str, action, target) {
    var keyValue = str.split("&");
    var hiddenStr = "";
    for (var i = 0; i < keyValue.length; i++) {
        if (keyValue[i].indexOf("=") > -1) {
            var list = keyValue[i].split("=");
            var key = list[0];
            var value = list[1];
            hiddenStr += "<input type='hidden' name='" + key + "' value='" + value + "' id='" + key + "'/>";
        }
    }
    var form = $("<form action='" + action + "' method='post' name='p2f' id='p2f'></form>");
    form.appendTo($("body"));
    form.append(hiddenStr);
    if (target) {
        form.attr("target", "_blank");
    }
    form.submit();
}
//网站中的评星显示score 星的分数
function setStar(score, path) {
    var star = "";
    if (!path)path = "";
    var flag = true;
    for (var i = 0; i < 5; i++) {
        if (score > 0) {
            if (score == 1) {
                star += "<img src='" + path + "Images/tuo6h.jpg'  width='13' height='13'/>";//半星
            } else {
                star += "<img src='" + path + "Images/tuo6.jpg'  width='13' height='13'/>";//满星
            }
        } else {
            star += "<img src='" + path + "Images/tuo7.jpg'  width='13' height='13'/>";//空星
        }
        score -= 2;
    }
    return star;
}
//在输入框获取焦点时候添加一个外框样式
function setFocus(obj, w_text) {
    $(obj).css({"border-color": "#FF9900", "outline": "solid 2px #F1DE85"});
    $("#" + w_text).text(" ");
}
//在输入框失去焦点的时候改外框为白色
function outFocus(obj) {
    $(obj).css({"border-color": "#888", "outline": "solid 2px #FFF"});
}
//下面是jquery的插件。不必深究
;
jQuery.fn.extend(
    {
        OpenDiv: function () {

            var sWidth, sHeight;
            sWidth = $(document).width();
            sHeight = $(document).height();
            var maskObj = document.createElement("div");
            maskObj.setAttribute('id', 'BigDiv');
            maskObj.style.position = "absolute";
            maskObj.style.top = "0";
            maskObj.style.left = "0";
            maskObj.style.background = "#333";
            maskObj.style.filter = "Alpha(opacity=40);";
            maskObj.style.opacity = "0.4";
            maskObj.style.width = sWidth + "px";
            maskObj.style.height = sHeight + "px";
            maskObj.style.zIndex = "10000";
            //$("body").attr("scroll", "no");
            document.body.appendChild(maskObj);
            $("#BigDiv").data("divbox_selectlist", $("select:visible"));
            $("select:visible").hide();
            $("#BigDiv").attr("divbox_scrolltop", $.ScrollPosition().Top);
            $("#BigDiv").attr("divbox_scrollleft", $.ScrollPosition().Left);
            //$("#BigDiv").attr("htmloverflow", $("html").css("overflow"));
            // $("html").css("overflow", "hidden");
            window.scrollTo($("#BigDiv").attr("divbox_scrollleft"), $("#BigDiv").attr("divbox_scrolltop"));
            var MyDiv_w = this.width();
            var MyDiv_h = this.height();
            MyDiv_w = parseInt(MyDiv_w);
            MyDiv_h = parseInt(MyDiv_h);
            var width = $.PageSize().Width;
            var height = $.PageSize().Height;
            var left = $.ScrollPosition().Left;
            var top = $.ScrollPosition().Top;
            var Div_topposition = top + (height / 2) - (MyDiv_h / 2);
            var Div_leftposition = left + (width / 2) - (MyDiv_w / 2);
            this.css("position", "absolute");
            this.css("z-index", "10001");
            //this.css("background", "#fff");
            this.css("left", Div_leftposition + "px");
            this.css("top", Div_topposition + "px");
            if ($.browser.mozilla) {
                this.show();
                return;
            }
            this.fadeIn("fast");

        }
        , CloseDiv: function (callback) {

        if ($.browser.mozilla) {
            this.hide();

        } else {
            this.fadeOut("fast");

        }
        $("html").css("overflow", $("#BigDiv").attr("htmloverflow"));
        window.scrollTo($("#BigDiv").attr("divbox_scrollleft"), $("#BigDiv").attr("divbox_scrolltop"));
        $("#BigDiv").data("divbox_selectlist").show();
        $("#BigDiv").remove();
        if (callback) {
            callback.call();
        }
    }

    });
$.extend(
    {
        PageSize: function () {
            var width = 0;
            var height = 0;
            width = window.innerWidth != null ? window.innerWidth : document.documentElement && document.documentElement.clientWidth ? document.documentElement.clientWidth : document.body != null ? document.body.clientWidth : null;
            height = window.innerHeight != null ? window.innerHeight : document.documentElement && document.documentElement.clientHeight ? document.documentElement.clientHeight : document.body != null ? document.body.clientHeight : null;
            return {Width: width, Height: height};
        }
        , ScrollPosition: function () {
        var top = 0, left = 0;
        if ($.browser.mozilla) {
            top = window.pageYOffset;
            left = window.pageXOffset;

        }
        else if ($.browser.msie) {
            top = document.documentElement.scrollTop;
            left = document.documentElement.scrollLeft;

        }
        else if (document.body) {
            top = document.body.scrollTop;
            left = document.body.scrollLeft;
        }
        return {Top: top, Left: left};

    }
    });
(function (a) {
    var b = a({});
    a.ajaxQueue = function (c) {
        function g(b) {
            d = a.ajax(c).done(e.resolve).fail(e.reject).then(b, b)
        }

        var d, e = a.Deferred(), f = e.promise();
        b.queue(g), f.abort = function (h) {
            if (d)return d.abort(h);
            var i = b.queue(), j = a.inArray(g, i);
            j > -1 && i.splice(j, 1), e.rejectWith(c.context || c, [f, h, ""]);
            return f
        };
        return f
    }
})(jQuery);

//首页发送留言
function IndexsendLeaveword(src) {

    var PTN_EMAIL = /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
    var PTN_FLOAT = /\d+(\.\d+)?/;

    var verName = $j("txtName").val();
    var verCode = $j("txtVerCode").val();
    var verPhone = $j("txtPhone").val();
    var verEmail = $j("txtEmail").val();
    var verContent = $j("txtContent").val();
    var vergsmc = $j("txtgsmc").val();
    var verAddress = $j("txtAddress").val();
    var qtcl = document.getElementsByName("qtcl");
    var bhkg = false;
    var vercldx = "处理对象:";


    for (i = 0; i < qtcl.length; i++) {
        if (qtcl[i].checked) {
            bhkg = true;
            vercldx += qtcl[i].value;
        }
    }

    var err = "";
    var reg = /^\s*$/;

    if (!bhkg) {
        err += "<p>请勾选处理对象</p>";
    }
    if (reg.test(verName)) {
        err += "<p>姓名不可为空</p>";
    }
    if (reg.test(verPhone)) {
        err += "<p>手机不能为空</p>";
    }
    if (reg.test(verEmail)) {
        err += "<p>邮箱不为空</p>";
    }
    if (reg.test(verAddress)) {
        err += "<p>地址不为空</p>";
    }
    if (verCode == undefined || verCode.length == 0) {
        err += "<p>请输入验证码</p>";
    }
    if (err.length > 0) {

        $a(err);

        return;
    }
    showProc(src);
    $.post("/ajax.ashx?action=IndexsendLeaveword&t=" + Math.random(), {
        verName: verName,
        verContent: verContent,
        verCode: verCode,
        verPhone: verPhone,
        verEmail: verEmail,
        vercldx: vercldx,
        verAddress: verAddress

    }, function (msg) {
        var sta = gav(msg, "state");
        var sMsg = gav(msg, "msg");
        if (sta == "1") {
            emptyText('sylytj');
            $a(sMsg, 1);

        } else {
            $a(sMsg);

        }
        showProc(src, false);
    });
}


//首页申请加盟
function IndexsendLeaveword(src) {

    var PTN_EMAIL = /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
    var PTN_FLOAT = /\d+(\.\d+)?/;

    var verName = $j("txtName").val();
    var verCode = $j("txtVerCode").val();
    var verPhone = $j("txtPhone").val();
    var verEmail = $j("txtEmail").val();
    var verContent = $j("txtContent").val();
    var verAddress = $j("txtAddress").val();
    var verGsmc = $j("txtGsmc").val();
    var err = "";
    var reg = /^\s*$/;
    //    if (reg.test(verAddress)) {
    //        err += "<p>公司行业不为空</p>";
    //    }
//    if (reg.test(verGsmc)) {
//        err += "<p>公司名称不为空</p>";
//    }
    if (reg.test(verName)) {
        err += "<p>联系人不可为空</p>";
    }
    if (reg.test(verPhone)) {
        err += "<p>联系电话不能为空</p>";
    }
    //    if (reg.test(verEmail)) {
    //        err += "<p>邮箱不为空</p>";
    //    }

    if (verCode == undefined || verCode.length == 0) {
        err += "<p>请输入验证码</p>";
    }
    if (err.length > 0) {

        $a(err);

        return;
    }
    showProc(src);
    $.post("/pmall/modifyMemberInfo&t=" + Math.random(), {
        verName: verName,
        verContent: verContent,
        verCode: verCode,
        verPhone: verPhone,
        verEmail: verEmail,
        verAddress: verAddress
    }, function (msg) {
        var sta = gav(msg, "state");
        var sMsg = gav(msg, "msg");
        if (sta == "1") {
            emptyText('sylytj');
            $a(sMsg, 1);

        } else {
            $a(sMsg);
        }
        showProc(src, false);
    });
}


//个人中心修改
function postMyInformation() {
	var memberID = $("#myInformation #memberID").val();
	//alert(memberID);
	var email = $("#myInformation #email").val();
	var mobile = $("#myInformation #mobile").val();
	var gender = $("#myInformation #gender").val();
	var token = $("#myInformation #_csrf").val();
	var jsonStr = "{";
	jsonStr += "\"_csrf\" : \"" + token + "\",";
	jsonStr += "\"memberID\" : \"" + memberID + "\",";
	jsonStr += "\"mobile\" : \"" + mobile + "\",";
	jsonStr += "\"email\" : \"" + email + "\",";
	jsonStr += "\"gender\" : \"" + gender + "\"";
	jsonStr +="}";
	var urlParams = $.parseJSON(jsonStr);
	
	$.ajax({
        url : "/pmall/modifyMemberInfo",
        type : "POST",
        data : urlParams,
        cache : false,
        async : false,
        dataType : "json",
        success : function(json){
           alert("修改成功");
        },
        error : function(){
        	//$a("修改成功");
        	alert("修改成功!");
	    }
    }).done(function() {
       
    });
}

//删除收货地址
function deleteAddr(token, objectID) {
    var jsonStr = "{";
	jsonStr += "\"_csrf\" : \"" + token + "\",";
	jsonStr += "\"objectID\" : \"" + objectID + "\"";
	jsonStr +="}";
	
	var urlParams = $.parseJSON(jsonStr);
	
	$.ajax({
        url : "/pmall/deleteAddr",
        type : "POST",
        data : urlParams,
        cache : false,
        async : false,
        dataType : "json",
        success : function(json){
           alert("删除成功");
        },
        error : function(){
        	//$a("修改成功");
        	alert("删除成功!");
	    }
    }).done(function() {
       
    });
}

//增加收货地址
function saveAddr() {
	
	var jsonStr = "{";
	var token = $('#_csrf').val();
	jsonStr += "\"_csrf\" : \"" + token + "\",";
	//operType用于判断：增加or更新操作  0：增加；1：更新
	var operType = $('#operType').val();
	jsonStr += "\"operType\" : \"" + operType + "\",";
	
	
	var addrName = $('#addressName').val();
	jsonStr += "\"addrName\" : \"" + addrName + "\",";
	
    var addressAddr = $('#addressAddr').val();
    jsonStr += "\"addr\" : \"" + addressAddr + "\",";
    
    var addressPhone = $('#addressPhone').val();
    jsonStr += "\"phone\" : \"" + addressPhone + "\",";
    
    jsonStr += "\"province\" : \"广东省\",";
    jsonStr += "\"city\" : \"广州\",";
    jsonStr += "\"area\" : \"天河区\",";
    jsonStr += "\"zip\" : \"510510\",";
    jsonStr += "\"name\" : \"sa\",";
    jsonStr += "\"isDefault\" : \"1\"";
    
	jsonStr +="}";

	var urlParams = $.parseJSON(jsonStr);
	
	$.ajax({
        url : "/pmall/addAddr",
        type : "POST",
        data : urlParams,
        cache : false,
        async : false,
        dataType : "json",
        success : function(json){
        	if(operType=="0")
        		alert("新增成功");
        	else
        		alert("修改成功");
        },
        error : function(){
        	//$a("修改成功");
        	if(operType=="0")
        		alert("新增成功");
        	else
        		alert("修改成功");
	    }
    }).done(function() {
       
    });
}
