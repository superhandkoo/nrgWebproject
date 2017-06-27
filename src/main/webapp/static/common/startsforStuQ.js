$(function(){
	showStars();
});
function showStars(){
	var aMsg = [
	    		/*"很不满意|差得太离谱，与卖家描述的严重不符，非常不满!",
	    		"不满意|部分有破损，与卖家描述的不符，不满意!",
	    		"一般|质量一般，没有卖家描述的那么好!",
	    		"满意|质量不错，与卖家描述的基本一致，还是挺满意的!",
	    		"非常满意|质量非常好，与卖家描述的完全一致，非常满意!"*/
	    	];
	    	
	    	var arrStars = $('.BOX > div');//  几组星星
	    	
	    	for(var k = 0; k < $('.BOX > div').length; k++){
	    		arrStars[k].className = 'star0'+k;
	    		var star_arrLi = $('.star0'+[k] +'> .star_UL > li');//  几个星星
	    		var star_strong = $('.star0'+[k] +'> .star_result_span > strong');//星星后面的分数
	    		var star_a = $('.star0'+[k] +' > .star_result_span a');//星星后面的满意的程度
	    		
	    		fun(star_arrLi, star_strong ,star_a);
	    	}
}
function fun(arrLi,strong ,strong_a ){
	for (var i =0; i<arrLi.length; i++) {
		//alert(arrLi.length);
		arrLi[i].index = i+1;
		arrLi[i].onmouseover = function(){
			//显现值几个星星
			ShowTars(this.index);
			strong.text(this.index + '分');// 星星后面的分数
			//strong_a.text(aMsg[this.index - 1].match(/\|(.+)/)[1]);//星星后面的满意的程度
		};
		
		//鼠标离开后恢复到上次显现的几个星星
		arrLi[i].onmouseout = function() {
			//alert(11);
			var sidNum = $(this).parents('ul').attr('sid');
			
			if(sidNum == 0){
				strong.text("");// 星星后面的分数
				strong_a.text("");//星星后面的满意的程度
			}else{
				strong.text(sidNum + '分');// 星星后面的分数
				//strong_a.text(aMsg[sidNum - 1].match(/\|(.+)/)[1]);//星星后面的满意的程度
			}
			ShowTars(sidNum);// 显现值几个星星
		};
		
		//点击后进行评分处理
		$(arrLi[i]).live('click', function() {
			//alert("click");
			strong.text(this.index + '分');// 星星后面的分数
			//strong_a.text(aMsg[this.index - 1].match(/\|(.+)/)[1]);//星星后面的满意的程度
			$(this).parents('ul').attr('sid',this.index);
			//var currentGroupId=$(this).parents("#outer_table").find(".td_origin").attr("value");//讨论主题框架id
			//alert(currentGroupId);
			var disDetailId=$(this).parents(".unit").attr("id");//讨论内容id
			//alert(currentGroupId+","+disDetailId+","+this.index);
			parent.ws.send("data:;SEND-STAR-STUDENT2#"+this.index+"#"+disDetailId+"#0");
		});
	}
	
	// 显现值几个星星
	function ShowTars(num) {
		for(var i = 0; i < arrLi.length; i++) 
			arrLi[i].className = i < num ? "on" : "";
	};
};