$(function(){
	//--
	$(window).bind("scroll", function () {
		var top = $(document).scrollTop();//获取滚动条走动的距离
		if (top > 200) {
			$(".notice").css("position","fixed");
			$(".notice").css("right",25+"px");
			$(".notice").css("top",220+"px");
		} else{
			$(".notice").css("position","absolute");
			$(".notice").css("right",25+"px");
			$(".notice").css("top",400+"px");
		}
	});
	
	//
			$(".zhiding").click(function(){
				$('body,html').animate({scrollTop: 0}, 500);
				})
	//
	})