$(function(){
	//alert(333);
	//showStars();
});

var num = 0;

function showStars(){
	var arrStars = $('.BOX > div');//  几组星星
	console.log("___" + arrStars.length)
	//$('.BOX:not(.hasBind)').addClass("hasBind");
	
	for(var k = 0; k < $('.BOX > div').length; k++){
		//console.log(arrStars[k].className == "")
		if (arrStars[k].className != "")
			continue;
		arrStars[k].className = 'star0'+num;
		var star_arrLi = $('.star0'+[num] +'> .star_UL > li');//  几个星星
		var star_strong = $('.star0'+[num] +'> .star_result_span > strong');//星星后面的分数
		var star_a = $('.star0'+[num] +' > .star_result_span a');//星星后面的满意的程度
		num++;
		//console.log(num);
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
		$(arrLi[i]).on('click', function() {
			strong.text(this.index + '分');// 星星后面的分数
			//strong_a.text(aMsg[this.index - 1].match(/\|(.+)/)[1]);//星星后面的满意的程度
			$(this).parents('ul').attr('sid',this.index);
			var disId=$("#disId").val();//讨论主题框架id
			var currentGroupId=$(this).parents("#outer_table").find(".td_origin").attr("value");//当前组id
			var disDetailId=$(this).parents(".unit").attr("id");//讨论内容id
			console.log(currentGroupId+","+disDetailId+","+this.index+","+disId);
			//parent.ws.send("data:;SEND-STAR-STUDENT1#"+this.index+"#"+disId+"#"+disDetailId+"#"+currentGroupId);
			$(this).parents('.BOX').addClass("star_hidden");
			
			//暂时加载
			var box = $(this).parents(".BOX");
			box.parent().find(".stars_before").remove();
			//console.log(this.index + "分");
			for (var i = 0; i < this.index; i++) {
				$("<div class=\"stars_before\"></div>").insertBefore(box.next());
			}
			var disDetailId=$(this).parents(".unit").attr("id");
			parent.ws.send("data:;SEND-STAR-STUDENT2#"+this.index+"#"+disDetailId+"#0");
		});
	}
	// 显现值几个星星
	function ShowTars(num) {
		for(var i = 0; i < arrLi.length; i++) 
			arrLi[i].className = i < num ? "on" : "";
	};
};
