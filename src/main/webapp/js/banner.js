//全屏滚动
$(function(){
	var n=0;
	var imgLength=$(".b-img a").length;
	var ctWidth=imgLength*100;
	var itemWidth=1/imgLength*100;
	$(".b-img").width(ctWidth+"%");
	$(".b-img a").width(itemWidth+"%");
	$(".b-list").width(imgLength*36);
	if(imgLength>1)
	{
	for(var i=0;i<imgLength;i++)
	{
		var listSpan=$("<span></span>")
		$(".b-list").append(listSpan);
		}
	}
	$(".b-list span:eq(0)").addClass("spcss").siblings("span").removeClass("spcss");
	$(".bar-right em").click(function(){
		if(n==imgLength-1)
		{
			var ctPosit=(n+1)*100;
			$(".banner").append($(".b-img").clone());
			$(".b-img:last").css("left","100%");
			$(".b-img:first").animate({"left":"-"+ctPosit+"%"},1000);
			$(".b-img:last").animate({"left":"0"},1000);
			var setTime0=setTimeout(function () {
            $(".banner .b-img:first").remove();
            }, 1000);
			n=0;
			$(".b-list span:eq("+n+")").addClass("spcss").siblings("span").removeClass("spcss");
			}
		else
		{
		n++;
		var ctPosit=n*100;
		$(".b-img").animate({"left":"-"+ctPosit+"%"},1000);
		$(".b-list span:eq("+n+")").addClass("spcss").siblings("span").removeClass("spcss");
		}
		})
	$(".bar-left em").click(function(){
		if(n==0)
		{
			var stPosit=imgLength*100;
			var etPosit=(imgLength-1)*100;
			$(".banner").prepend($(".b-img").clone());
			$(".b-img:first").css("left","-"+stPosit+"%");
			$(".b-img:last").animate({"left":"100%"},1000);
			$(".b-img:first").animate({"left":"-"+etPosit+"%"},1000);
			var setTime0=setTimeout(function () {
            $(".banner .b-img:last").remove();
            }, 1000);
			n=imgLength-1;
			$(".b-list span:eq("+n+")").addClass("spcss").siblings("span").removeClass("spcss");
			}
		else
		{
		n--;
		var ctPosit=n*100;
		$(".b-img").animate({"left":"-"+ctPosit+"%"},1000);
		$(".b-list span:eq("+n+")").addClass("spcss").siblings("span").removeClass("spcss");
		}
		})
	$(".b-list span").click(function(){
		var lsIndex=$(this).index();
		n=lsIndex;
		var ctPosit=n*100;
		$(".b-img").animate({"left":"-"+ctPosit+"%"},1000);
		$(this).addClass("spcss").siblings("span").removeClass("spcss");
		})
	function rollEnvent(){
		if(n==imgLength-1)
		{
			var ctPosit=(n+1)*100;
			$(".banner").append($(".b-img").clone());
			$(".b-img:last").css("left","100%");
			$(".b-img:first").animate({"left":"-"+ctPosit+"%"},1000);
			$(".b-img:last").animate({"left":"0"},1000);
			var setTime0=setTimeout(function () {
            $(".banner .b-img:first").remove();
            }, 1000);
			n=0;
			$(".b-list span:eq(0)").addClass("spcss").siblings("span").removeClass("spcss");
			}
		else
		{
		n++;
		var ctPosit=n*100;
		$(".b-img").animate({"left":"-"+ctPosit+"%"},1000);
		$(".b-list span:eq("+n+")").addClass("spcss").siblings("span").removeClass("spcss");
		}
		}
	var slidesetInterval=setInterval(rollEnvent,4000);
	$(".banner").hover(function(){clearInterval(slidesetInterval);},function(){slidesetInterval=setInterval(rollEnvent,4000);});
	$(".bar-left").mouseover(function(){
		$(this).css("background","url(images/arr-bg.png)");
		$(this).find("em").addClass("emcss");
		}).mouseleave(function(){
		$(this).css("background","none");
		$(this).find("em").removeClass("emcss");
			})
	$(".bar-right").mouseover(function(){
		$(this).css("background","url(images/arr-bg.png)");
		$(this).find("em").addClass("emcss");
		}).mouseleave(function(){
		$(this).css("background","none");
		$(this).find("em").removeClass("emcss");
			})
	})



; (function ($) {
    $.fn.extend({
        "liteNav": function (t) {
            var $this = $(this), i = 0, $pics = $('#NewsPic'), autoChange = function () {
                var $currentPic = $pics.find('a:eq(' + (i + 1 === 6 ? 0 : i + 1) + ')');
                $currentPic.css({
                    visibility: 'visible',
                    display: 'block'
                }).siblings('a').css({
                    visibility: 'hidden',
                    display: 'none'
                });
                $pics.find('.Nav>span:contains(' + (i + 2 > 6 ? 6 - i : i + 2) + ')').attr('class', 'Cur').siblings('span').attr('class', 'Normal');
                $('#NewsPicTxt').html('<a target="_blank" href="' + $currentPic[0].href + '">' + $currentPic.find('img').attr('title') + '</a>');
                i = i + 1 === 6 ? 0 : i + 1;
            }, st = setInterval(autoChange, t || 2000);
            $this.hover(function () {
                clearInterval(st);
            }, function () { st = setInterval(autoChange, t || 2000) });
            $pics.find('.Nav>span').click(function () {
                i = parseInt($(this).text(), 10) - 2;
                autoChange();
            });
        }
    });
}(jQuery));