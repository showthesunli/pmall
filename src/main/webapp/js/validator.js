/*
 Copyright (C) 2009 - 2012
 WebSite:	Http://wangking717.javaeye.com/
 Author:		wangking
 */
$(function () {
    var xOffset = -20; // x distance from mouse
    var yOffset = 20; // y distance from mouse  


    //input action
    $("[reg],[url]:not([reg]),[tip]").hover(
        function (e) {
            if ($(this).attr('tip') != undefined) {
                var top = (e.pageY + yOffset);
                var left = (e.pageX + xOffset);
                $('body').append('<div id="vtip"><img id="vtipArrow" src="images/vtip_arrow.png"/>' + $(this).attr('tip') + '</div>');
                $('#vtip').css("top", top + "px").css("left", left + "px");
                $('#vtip').bgiframe();
            }
        },
        function () {
            if ($(this).attr('tip') != undefined) {
                $("#vtip").remove();
            }
        }
    ).mousemove(
        function (e) {
            if ($(this).attr('tip') != undefined) {
                var top = (e.pageY + yOffset);
                var left = (e.pageX + xOffset);
                $("#vtip").css("top", top + "px").css("left", left + "px");
            }
        }
    ).blur(function () {
            if ($(this).attr("url") != undefined) {
                ajax_validate($(this));
            } else if ($(this).attr("reg") != undefined) {
                validate($(this));
            }
        });

    $("form").submit(function () {
        var isSubmit = true;
        $(this).find("[reg],[url]:not([reg])").each(function () {
            if ($(this).attr("reg") == undefined) {
                if (!ajax_validate($(this))) {
                    isSubmit = false;
                }
            } else {
                if (!validate($(this))) {
                    isSubmit = false;
                }
            }
        });
        if (typeof(isExtendsValidate) != "undefined") {
            if (isSubmit && isExtendsValidate) {
                return extendsValidate();
            }
        }
        return isSubmit;
    });

});

function validate(obj) {
    var objValue = obj.attr("value");
    if (obj.attr("empty") != undefined && objValue == "") {
        change_error_style(obj, "remove");
        change_tip(obj, null, "remove");
        return true;
    }
    var reg = new RegExp(obj.attr("reg"));
    if (!reg.test(objValue)) {
        change_error_style(obj, "add");
        change_tip(obj, null, "remove");
        return false;
    } else {
        if (obj.attr("url") == undefined) {
            change_error_style(obj, "remove");
            change_tip(obj, null, "remove");
            return true;
        } else {
            return ajax_validate(obj);
        }
    }
}

function ajax_validate(obj) {

    var url_str = obj.attr("url");
    if (url_str.indexOf("?") != -1) {
        url_str = url_str + "&" + obj.attr("name") + "=" + obj.attr("value");
    } else {
        url_str = url_str + "?" + obj.attr("name") + "=" + obj.attr("value");
    }
    var feed_back = $.ajax({url: url_str, cache: false, async: false}).responseText;
    feed_back = feed_back.replace(/(^\s*)|(\s*$)/g, "");
    if (feed_back == 'success') {
        change_error_style(obj, "remove");
        change_tip(obj, null, "remove");
        return true;
    } else {
        change_error_style(obj, "add");
        change_tip(obj, feed_back, "add");
        return false;
    }
}

function change_tip(obj, msg, action_type) {

    if (obj.attr("tip") == undefined) {//初始化判断TIP是否为空
        obj.attr("is_tip_null", "yes");
    }
    if (action_type == "add") {
        if (obj.attr("is_tip_null") == "yes") {
            obj.attr("tip", msg);
        } else {
            if (msg != null) {
                if (obj.attr("tip_bak") == undefined) {
                    obj.attr("tip_bak", obj.attr("tip"));
                }
                obj.attr("tip", msg);
            }
        }
    } else {
        if (obj.attr("is_tip_null") == "yes") {
            obj.removeAttr("tip");
            obj.removeAttr("tip_bak");
        } else {
            obj.attr("tip", obj.attr("tip_bak"));
            obj.removeAttr("tip_bak");
        }
    }
}

function change_error_style(obj, action_type) {
    if (action_type == "add") {
        obj.addClass("input_validation-failed");
        obj.siblings(".erricon").remove();
        obj.parent().append("<img class='erricon' src='images/ico_err.gif'/>");
    } else {
        obj.removeClass("input_validation-failed");
        obj.siblings(".erricon").remove();
    }
}

$.fn.validate_callback = function (msg, action_type, options) {
    this.each(function () {
        if (action_type == "failed") {
            change_error_style($(this), "add");
            change_tip($(this), msg, "add");
        } else {
            change_error_style($(this), "remove");
            change_tip($(this), null, "remove");
        }
    });
};
(function (a) {
    a.fn.bgiframe = (a.browser.msie && /msie 6\.0/i.test(navigator.userAgent) ? function (d) {
        d = a.extend({
            top: "auto",
            left: "auto",
            width: "auto",
            height: "auto",
            opacity: true,
            src: "javascript:false;"
        }, d);
        var c = '<iframe class="bgiframe"frameborder="0"tabindex="-1"src="' + d.src + '"style="display:block;position:absolute;z-index:-1;' + (d.opacity !== false ? "filter:Alpha(Opacity='0');" : "") + "top:" + (d.top == "auto" ? "expression(((parseInt(this.parentNode.currentStyle.borderTopWidth)||0)*-1)+'px')" : b(d.top)) + ";left:" + (d.left == "auto" ? "expression(((parseInt(this.parentNode.currentStyle.borderLeftWidth)||0)*-1)+'px')" : b(d.left)) + ";width:" + (d.width == "auto" ? "expression(this.parentNode.offsetWidth+'px')" : b(d.width)) + ";height:" + (d.height == "auto" ? "expression(this.parentNode.offsetHeight+'px')" : b(d.height)) + ';"/>';
        return this.each(function () {
            if (a(this).children("iframe.bgiframe").length === 0) {
                this.insertBefore(document.createElement(c), this.firstChild)
            }
        })
    } : function () {
        return this
    });
    a.fn.bgIframe = a.fn.bgiframe;
    function b(c) {
        return c && c.constructor === Number ? c + "px" : c
    }
})(jQuery);