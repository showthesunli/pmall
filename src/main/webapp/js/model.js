// JavaScript Document
$(document).ready(function(e) {
		
	//导航条下拉菜单		
	$(".jf-navList li").hover(function(){
		var h = $(this).find(".jf-dropDownList a").height() * $(this).find(".jf-dropDownList a").length;
		$(this).children(".jf-dropDownList").stop().animate({height:h + "px"},300);
		},function(){
			$(this).children(".jf-dropDownList").stop().animate({height:"0"},200);
	})
	
	//分类菜单	
	$(".jf-browse").click(function(){
		var h = $(".jf-classifyItem").height() * $(".jf-classifyItem").length;
		if ($(".jf-classifyDrop").height() > 0){
			$(".jf-classifyDrop").animate({height:"0"},500);
			$(".jf-browse b").addClass("jf-browseUp");
			$(".jf-classify").css("padding-bottom","0");
			}
		if($(".jf-classifyDrop").height() == 0){
			$(".jf-classifyDrop").animate({height: h + "px"},500);
			$(".jf-browse b").removeClass("jf-browseUp");
			$(".jf-classify").css("padding-bottom","10px");
			}
		})
		
	//注册切换	
	$("#phoneForm").click(function(){
	 	$(".registerForm").css("display","block");
	 	$(".registerFormForEmial").css("display","none");
		$("#emialForm").removeClass("titlePitch");
	 	$(this).addClass("titlePitch");
	})
	$("#emialForm").click(function(){
	 	$(".registerForm").css("display","none");
	 	$(".registerFormForEmial").css("display","block");
		$("#phoneForm").removeClass("titlePitch");
	 	$(this).addClass("titlePitch");
	})
		
})


function tipOpen(){
         $("#loginBg").css("display","block");
         $(".toolTip").css("display","block"); 
	 }
function tipClose(){
		$("#loginBg").css("display","none");
		$(".toolTip").css("display","none") ; 
	}
	

//首页图片滚动
(function($){
	$.fn.pislider=function(options){
		var defaults={
			child:"child",
			slider_bar:"slider_bar",
			scrollTime:500,
			autoScroll:"true",
			autoTime:7000
		};
	
		var options=$.extend(defaults,options);
		var _this=$(this);
		var child=_this.find("."+options.child);
		var slider_bar=$("#"+options.slider_bar);
		var len=child.length-1;
		child.wrapAll("<div id=scroll_wrapper></div>");
		var width=child.width();
		var two_width=width*2;
		var thr_width=width*3;
	
		var wrap=$("#scroll_wrapper");
		wrap.css({width:thr_width+"px",left:-width+"px"});
		child.not(":first").hide();
	
		function noMove(){
			if(!wrap.is(":animated")){
				return true;
			}
			else{
				return false;
			};
		};
		
		
		child.each(function(index){
			if(index==0){
				slider_bar.append("<a href='#' class='cur'></a>");
			}
			else{
				slider_bar.append("<a href='#'></a>");
			};
		});
		var cur_a=slider_bar.find("a.cur");
		
		slider_bar.find("a").click(function(){
			var clickIndex=$(this).index();
			var nowIndex=slider_bar.find("a.cur").index();
			
			if(noMove()){
				if (clickIndex > nowIndex){
					scroll(clickIndex,two_width);
				}
				else if(clickIndex < nowIndex)
				{
					scroll(clickIndex,"0");
				}
				else
				{
					return false;
				};
			};
			return false;
		});
		
		function scroll(num,scroll_width){
			slider_bar.find("a").eq(num).addClass("cur").siblings().removeClass("cur");
			child.eq(num).show().css({left:scroll_width+"px"});
			wrap.animate({left:-scroll_width+"px"},options.scrollTime,function(){
				child.eq(num).css({left:width+"px"}).siblings().hide();
				wrap.css({left:-width+"px"});
			});
		};
		
		$("#btn_prev").click(function(){
			var curIndex=slider_bar.find("a.cur").index();
			if(noMove()){
				if (curIndex == 0){
					scroll(len,"0");
				}
				else{
					slider_bar.find("a.cur").prev("a").trigger("click");
				};
			};
			return false;
		});
	
		$("#btn_next").click(function(){
			var curIndex=slider_bar.find("a.cur").index();
			if(noMove()){
				if (curIndex == len){
					scroll("0",two_width);
				}
				else{
					slider_bar.find("a.cur").next("a").trigger("click");
				};
			};
			return false;
		});
		
		if(options.autoScroll=="true"){
			autoScroll=setInterval(function(){
				$("#btn_next").trigger("click")
			},options.autoTime);
			autoPlay=function(){
				autoScroll=setInterval(function(){
				$("#btn_next").trigger("click")
				},options.autoTime);
			};
			stopPlay=function(){
				clearInterval(autoScroll);
			};
			_this.hover(stopPlay,autoPlay);
			$("#btn_prev,#btn_next").hover(stopPlay,autoPlay);
		};
	};
})(jQuery);

//详情页图片放大镜效果
$(function(){
	$.fn.magnifying = function(){
		var that = $(this),
		$imgCon = that.find('.con-fangDaIMg'),//正常图片容器
		$Img = $imgCon.find('img'),//正常图片，还有放大图片集合
		$Drag = that.find('.magnifyingBegin'),//拖动滑动容器
		$show = that.find('.magnifyingShow'),//放大镜显示区域
		$showIMg = $show.find('img'),//放大镜图片
		$ImgList = that.find('.con-FangDa-ImgList > li >img'),
		multiple = $show.width()/$Drag.width();

		$imgCon.mousemove(function(e){
			$Drag.css('display','block');
			$show.css('display','block');

		   	var iX = e.pageX - $(this).offset().left - $Drag.width()/2,
		   		    iY = e.pageY - $(this).offset().top - $Drag.height()/2,	
		   		    MaxX = $imgCon.width()-$Drag.width(),
		   		    MaxY = $imgCon.height()-$Drag.height();

		   	iX = iX > 0 ? iX : 0;
		   	iX = iX < MaxX ? iX : MaxX;
		   	iY = iY > 0 ? iY : 0;
		   	iY = iY < MaxY ? iY : MaxY;	
		   	$Drag.css({left:iX+'px',top:iY+'px'});	   		
		   	$showIMg.css({marginLeft:-multiple*iX+'px',marginTop:-multiple*iY+'px'});
		});
		$imgCon.mouseout(function(){
		   	$Drag.css('display','none');
			$show.css('display','none');
		});

		$ImgList.click(function(){
			var NowSrc = $(this).data('bigimg');
			$Img.attr('src',NowSrc);
			$(this).parent().addClass('active').siblings().removeClass('active');
		});	
	}

	$("#fangdajing").magnifying();


});
