
/**
 * 直播课助教上课切换
 */
function submitForm(courseId,kpointId,examType) {
	//alert(courseId+","+examType);
	if(examType==1||examType==3){//课堂练习
		$("#examType").val(examType);
		$("#mypage").hide();
		$("#mypage1").show();
		$("#mypage1").attr("src",basePath+"/adminExam/exam/exam-student-list/"+courseId+"/"+kpointId+"/"+examType+"/1");
	}else if(examType==2){//课堂讨论
		$("#mypage").hide();
		$("#mypage1").show();
		//$("#mypage1").attr("src",basePath+"/assistant/toChatRoom/"+courseId);
		$("#mypage1").attr("src",basePath+"/assistant/toChatRoom/"+courseId);
	}else if(examType==5){//正在直播
		$("#mypage").show();
		$("#mypage1").hide();
	}else if(examType==4){//学生在线情况
		$("#mypage1").show();
		$("#mypage").hide();
		$("#mypage1").attr("src",basePath+"/assistant/assistant/getonlinestudent");
	}
}
//老师提示左右滚动
function ScrollImgLeft(){ 
	
	var speed=50; 
	var scroll_begin = document.getElementById("scroll_begin"); 
	var scroll_end = document.getElementById("scroll_end"); 
	var scroll_div = document.getElementById("scroll_div"); 
	scroll_end.innerHTML=scroll_begin.innerHTML; 
	function Marquee(){ 
	if(scroll_end.offsetWidth-scroll_div.scrollLeft<=0) 
		scroll_div.scrollLeft-=scroll_begin.offsetWidth; 
	else 
		scroll_div.scrollLeft++; 
	} 
	var MyMar=setInterval(Marquee,speed); 
	scroll_div.onmouseover=function() {clearInterval(MyMar);};
	scroll_div.onmouseout=function() {MyMar=setInterval(Marquee,speed);};
	
	
	var speed2=50; 
	var scroll_begin2 = document.getElementById("scroll_begin2"); 
	var scroll_end2 = document.getElementById("scroll_end2"); 
	var scroll_div2 = document.getElementById("scroll_div2");
	scroll_end2.innerHTML=scroll_begin2.innerHTML; 
	function Marquee2(){
	if(scroll_end2.offsetWidth-scroll_div2.scrollLeft<=0) {
		scroll_div2.scrollLeft-=scroll_begin2.offsetWidth; 
	} else 
		scroll_div2.scrollLeft++; 
	} 
	var MyMar2=setInterval(Marquee2,speed2); 
}
var childIframeTwo;

//setTimeout(function(){insertReplyBrfore({discussionId: 1, userName: "username", isSelf: 2, message: "message..."});}, 3000);

/**
 * 直播课老师上课切换
 */
function submitTeacherForm(courseId,kpointId,examType) {
	//alert(courseId+","+examType);
	if(examType==1||examType==3||examType==2){//课堂练习
		$("#online"+examType).removeClass("top_head_071");
		$("#mypageTeacher").hide();
		$("#mypageTeacher1").show();
		$("#mypageTeacher1").attr("src",basePath+"/adminExam/exam/teacher-list/"+courseId+"/"+kpointId+"/"+examType);
	}else if(examType==4){//课堂讨论
		$("#mypageTeacher").hide();
		$("#mypageTeacher1").show();
		$("#mypageTeacher1").attr("src",basePath+"/assistant/toTeacherRoom/"+courseId);
	}else if(examType==5){//正在直播
		$("#mypageTeacher").show();
		$("#mypageTeacher1").hide();
	}else if(examType==6){//视频列表
		$("#mypageTeacher").hide();
		$("#mypageTeacher1").show();
		$("#mypageTeacher1").attr("src",basePath+"/teacher/videoList/myteacher-"+kpointId);
	}
}
/**
 * 直播课学生上课切换
 */
function submitStudentForm(courseId,kpointId,examType) {
	//alert(courseId+","+examType);
	if(examType==1||examType==3||examType==2){//课堂练习，课后作业
		$("#online"+examType).removeClass("top_head_071");
		$("#mypageStudent").hide();
		$("#mypageStudent1").show();
		$("#mypageStudent1").attr("src",basePath+"/adminExam/exam/student-list/"+courseId+"/"+kpointId+"/"+examType);
	}else if(examType==4){//课堂讨论
		$("#mypageStudent").hide();
		$("#mypageStudent1").show();
		$("#mypageStudent1").attr("src",basePath+"/assistant/toChatStudentRoom/"+courseId);
	}else if(examType==5){//正在直播
		$("#mypageStudent").show();
		$("#mypageStudent1").hide();
	}else if(examType==6){//视频列表
		$("#mypageStudent").hide();
		$("#mypageStudent1").show();
		$("#mypageStudent1").attr("src",basePath+"/video/videoList/student-"+kpointId);
	}
}
/**
 * 助教老师给主讲老师发送消息
 */
function sendmsgtoTeacher(){
	var message=$.trim($("#insert_071").text());
	if(message.length>0){
		ws.send(message+"#0");
		$("#insert_071").text("");
	}
}
//表示是老师通知学生考试或作业
function getTeacherNotice(DATA) {
	/*alert(DATA.examType);*/
    if(DATA.examType==1){//课堂练习
    	$("#online1").addClass("top_head_071");	
    	$("#online2").removeClass("top_head_071");
    	$("#online3").removeClass("top_head_071");		
    }else if(DATA.examType==2){//课后作业
    	$("#online2").addClass("top_head_071");	
    	$("#online1").removeClass("top_head_071");
    	$("#online3").removeClass("top_head_071");		
    }else{//在线考试
 	    $("#online3").addClass("top_head_071");	
    	$("#online2").removeClass("top_head_071");
    	$("#online1").removeClass("top_head_071");		
    }	 
}
function showStars(wi){
	var aMsg = [
	    		/*"很不满意|差得太离谱，与卖家描述的严重不符，非常不满!",
	    		"不满意|部分有破损，与卖家描述的不符，不满意!",
	    		"一般|质量一般，没有卖家描述的那么好!",
	    		"满意|质量不错，与卖家描述的基本一致，还是挺满意的!",
	    		"非常满意|质量非常好，与卖家描述的完全一致，非常满意!"*/
	    	];
	    	
	    	var arrStars = $('.BOX > div',wi);//  几组星星
	    	
	    	for(var k = 0; k < $('.BOX > div',wi).length; k++){
	    		arrStars[k].className = 'star0'+k;
	    		var star_arrLi = $('.star0'+[k] +'> .star_UL > li',wi);//  几个星星
	    		var star_strong = $('.star0'+[k] +'> .star_result_span > strong',wi);//星星后面的分数
	    		var star_a = $('.star0'+[k] +' > .star_result_span a',wi);//星星后面的满意的程度
	    		
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
			var currentGroupId=$(this).parents("#outer_table").find(".td_origin").attr("value");//讨论主题框架id
			var disDetailId=$(this).parents(".unit").attr("id");//讨论内容id
			//alert(currentGroupId+","+disDetailId+","+this.index);
			ws.send("data:;SEND-STAR-STUDENT1#"+this.index+"#"+currentGroupId+"#"+disDetailId+"#0");
		//break;
		});
	}
	
	// 显现值几个星星
	function ShowTars(num) {
		for(var i = 0; i < arrLi.length; i++) 
			arrLi[i].className = i < num ? "on" : "";
	};
};
//评星(课堂讨论）
function starReply(data){
	//alert(data.disId);
	var wi=$("#"+data.disId).find("iframe").contents();
	var example = $("#"+data.disDetailId, wi);//讨论内容id
	example.find(".msg_deal").empty();
	if(data.starScore==1){	
	example.find(".msg_deal").append("<span class=\"xingxing\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span class=\"msg_star\">评星</span>");
	}else if(data.starScore==2){
	example.find(".msg_deal").append("<span class=\"xingxing\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span class=\"xingxing\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span class=\"msg_star\">评星</span>");
	}else if(data.starScore==3){
	example.find(".msg_deal").append("<span class=\"xingxing\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span class=\"xingxing\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span class=\"xingxing\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span class=\"msg_star\">评星</span>");
	}
	console.log(flag+"dddddd");
	if(flag!=2){
		blink(data.disId.replace("Discussion",""));
	}else{
		blinkTeacher(data.disId.replace("Discussion",""));
	}
}
//评星
/*function starReply(data){
	var wi=$("#"+data.disId).find("iframe").contents();
	var example = $("#"+data.disDetailId,wi);//讨论内容id
	
	example.find(".stars_before").remove();
	
	for (var i = data.starScore; i > 0; i--)
		$("<div class = \"stars_before\"></div>").insertBefore(example.find(".msg_star"));
	//example.find(".msg_star").css({"background": "url(/static/inxweb/img/chat/star.png) no-repeat", "background-position": "0 -28px"});
}*/
//老师发送的提示
function teacherNoticeReply(data){
	var wi=$("#"+data.disId).find("iframe").contents();
	$(".teacher_tip",wi).append("&nbsp;&nbsp;"+data.message);
	blink(data.disId.replace("Discussion",""));
}
//闪烁间隔
var frequency = 200;
//闪烁时间
var duration = 2200;
//学生提问闪烁时间
var durationQ = 2400;
var timer="";
var timeOut="";//闪烁多少秒后停止
function hex(x) { 
	return ("0" + parseInt(x).toString(16)).slice(-2); 
}
function openMusic(){
	//开启音频
	$("audio").attr("src",basePath+"/static/common/1.mp3");	
}
function closeMusic(){
	//关闭音频
	//$("audio").attr("src","");	
	var Media = document.getElementById("media"); 
	if(!Media.paused){
		Media.pause();
	}
}
//发送按钮闪烁(课堂讨论和老师提问)
function blink(id){
	openMusic();
	//console.log("小窗口id:"+id);
	var wi=$("#ligerWindow").find("iframe").contents();
	var idType=$("#"+id,wi).parent().parent().attr("id");//判断是课堂讨论还是老师提问，是否要闪烁“课堂讨论”和“老师提问”
	var blinkFlag=0;//1闪烁课堂讨论，2闪烁老师提问
	console.log("idType:"+idType);
	if(idType=="dis"){//课堂讨论
		if($("#teaDis",wi).children().eq(0).hasClass("white_line")){//当前显示的窗口是课堂讨论，不需闪烁
			
		}else{//当前打开的不是课堂讨论，需要闪烁提醒
			blinkFlag=1;
		}
	}else if(idType=="teaq"){//老师提问
	if($("#teaQuiz",wi).children().eq(0).hasClass("white_line")){//当前显示的窗口是老师提问，不需闪烁
			
		}else{//当前打开的不是老师提问，需要闪烁提醒
			blinkFlag=2;
		}
	}
	//console.log("blinkFlag:"+blinkFlag);
	var timer = setInterval(function(){			
			var rgb=$("#"+id,wi).css("color");	
			//var rgb=$("#"+id,wi).css("background-color");	
			
			//console.log(rgb);
			if(!$.browser.msie){ 
				if(rgb!=undefined){
					rgb = rgb.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/); 
					rgb ="#" + hex(rgb[1]) + hex(rgb[2]) + hex(rgb[3]);
					//console.log(rgb);
					if (rgb=="#ffffff") {//白色
			/*			$("#"+id,wi).css("color","red");
						//$("#"+id,wi).css("background-color","rgb(238,169,80)");
						if(blinkFlag==1){
							$("#teaDis",wi).children().eq(0).css("color","red");
						}else if(blinkFlag==2){
							$("#teaQuiz",wi).children().eq(0).css("color","red");
						}*/
						$("#"+id,wi).removeClass("sp0 colorWhite").addClass("colorRed");
						//$("#"+id,wi).css("background-color","rgb(238,169,80)");
						if(blinkFlag==1){
							$("#teaDis",wi).children().eq(0).removeClass("colorWhite").addClass("colorRed");
						}else if(blinkFlag==2){
							$("#teaQuiz",wi).children().eq(0).removeClass("colorWhite").addClass("colorRed");
						}
					}else {//红色变成白色
						$("#"+id,wi).removeClass("sp0 colorRed").addClass("colorWhite");
						//$("#"+id,wi).css("background-color","white");	
						if(blinkFlag==1){
							$("#teaDis",wi).children().eq(0).removeClass("colorRed").addClass("colorWhite");
						}else if(blinkFlag==2){
							$("#teaQuiz",wi).children().eq(0).removeClass("colorRed").addClass("colorWhite");
						}
					}
				}
			} 
	 									
	},frequency);
		timeOut=setTimeout(function(){
				    clearInterval(timer);
				    closeMusic();
				    //停止闪烁时，讨论主题颜色固定为红色
				 	$("#"+id,wi).removeClass("sp0 colorWhite").addClass("colorRed");					
					if(blinkFlag==1){
						$("#teaDis",wi).children().eq(0).removeClass("colorWhite").addClass("colorRed");
					}else if(blinkFlag==2){
						$("#teaQuiz",wi).children().eq(0).removeClass("colorWhite").addClass("colorRed");
					}
			    },duration);
		$("#"+id,wi).attr("timer",timer);
		$("#"+id,wi).attr("timeOut",timeOut);
		
}
//发送按钮闪烁(课堂讨论和老师提问)主讲老师端
function blinkTeacher(id){
	openMusic();
	//console.log("小窗口id:"+id);
	var wi=$("#ligerWindow").find("iframe").contents();
	var idType=$("#"+id,wi).parent().parent().attr("id");//判断是课堂讨论还是老师提问，是否要闪烁“课堂讨论”和“老师提问”
	var blinkFlag=0;//1闪烁课堂讨论，2闪烁老师提问
	//console.log("idType:"+idType);
	if(idType=="dis"){//课堂讨论
		if($("#teaDis",wi).children().eq(0).hasClass("white_line")){//当前显示的窗口是课堂讨论，不需闪烁
			
		}else{//当前打开的不是课堂讨论，需要闪烁提醒
			blinkFlag=1;
		}
	}else if(idType=="teaq"){//老师提问
	if($("#teaQuiz",wi).children().eq(0).hasClass("white_line")){//当前显示的窗口是老师提问，不需闪烁
			
		}else{//当前打开的不是老师提问，需要闪烁提醒
			blinkFlag=2;
		}
	}
	var timer = setInterval(function(){			
			var rgb=$("#"+id,wi).children().eq(0).css("color");				
			//console.log(rgb);
			if(!$.browser.msie){ 
				if(rgb!=undefined){
					rgb = rgb.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/); 
					rgb ="#" + hex(rgb[1]) + hex(rgb[2]) + hex(rgb[3]);
					if (rgb=="#ffffff") {//白色
						$("#"+id,wi).children().eq(0).removeClass("sp0 colorWhite").addClass("colorRed");
						//console.log($("#"+id,wi).children().eq(0).hasClass("colorRed"));
						if(blinkFlag==1){
							$("#teaDis",wi).children().eq(0).removeClass("colorWhite").addClass("colorRed");
						}else if(blinkFlag==2){
							$("#teaQuiz",wi).children().eq(0).removeClass("colorWhite").addClass("colorRed");
						}
					}else {//红色变成白色
						$("#"+id,wi).children().eq(0).removeClass("sp0 colorRed").addClass("colorWhite");
						if(blinkFlag==1){
							$("#teaDis",wi).children().eq(0).removeClass("colorRed").addClass("colorWhite");
						}else if(blinkFlag==2){
							$("#teaQuiz",wi).children().eq(0).removeClass("colorRed").addClass("colorWhite");
						}
					}
				}
			} 
			//console.log(rgb);
	 									
	},frequency);
		timeOut=setTimeout(function(){
				    clearInterval(timer);
				    closeMusic();
				    //停止闪烁时，讨论主题颜色固定为红色
				 	$("#"+id,wi).children().eq(0).removeClass("sp0 colorWhite").addClass("colorRed");					
					if(blinkFlag==1){
						$("#teaDis",wi).children().eq(0).removeClass("colorWhite").addClass("colorRed");
					}else if(blinkFlag==2){
						$("#teaQuiz",wi).children().eq(0).removeClass("colorWhite").addClass("colorRed");
					}
			    },duration);
		$("#"+id,wi).attr("timer",timer);
		$("#"+id,wi).attr("timeOut",timeOut);
		
}
//发送按钮闪烁(学生提问)，id学生提问（stuq)
function blinkQuestion(id){
	openMusic();
	var wi=$("#ligerWindow").find("iframe").contents();
/*	if($("#"+id,wi).children().eq(0).hasClass("white_line")){//当前显示的窗口是课堂讨论，不需闪烁
			
	}else{//当前打开的不是课堂讨论，需要闪烁提醒
			blinkFlag=1;
	}*/
	var timer = setInterval(function(){			
			var rgb=$("#"+id,wi).children().eq(0).css("color");	
			
			if(!$.browser.msie){ 
				if(rgb!=undefined){
					rgb = rgb.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/); 
					rgb ="#" + hex(rgb[1]) + hex(rgb[2]) + hex(rgb[3]);
					if (rgb=="#ffffff") {
						$("#"+id,wi).children().eq(0).removeClass("colorWhite white_line").addClass("colorRed");
					}else {
						$("#"+id,wi).children().eq(0).removeClass("colorRed white_line").addClass("colorWhite");
					}	
				}
			} 
		//	console.log(rgb);
	 									
	},frequency);
		timeOut=setTimeout(function(){
					clearInterval(timer);
					closeMusic();
					$("#"+id,wi).children().eq(0).removeClass("colorWhite white_line").addClass("colorRed");
				},durationQ);
		$("#"+id,wi).attr("timer",timer);
		$("#"+id,wi).attr("timeOut",timeOut);
}
//每个组名闪烁
function blinkGroup(id,wi){
	openMusic();
	var timer = setInterval(function(){			
			var rgb=$("#group"+id,wi).css("color");	
			if(!$.browser.msie){ 
				if(rgb!=undefined){
					rgb = rgb.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/); 
					rgb ="#" + hex(rgb[1]) + hex(rgb[2]) + hex(rgb[3]);
					console.log(rgb);
					if (rgb=="#000000") {
						$("#group"+id,wi).removeClass("td_green").addClass("colorRed");
					}else {
						$("#group"+id,wi).removeClass("colorRed").addClass("colorWhite");
					}
				}
			} 
			//console.log(rgb);
	 									
	},frequency);
		timeOut=setTimeout(function(){
					clearInterval(timer);
					closeMusic();
					$("#group"+id,wi).removeClass("colorWhite white_line").addClass("colorRed");
				},durationQ);
		$("#group"+id,wi).attr("timer",timer);
		$("#group"+id,wi).attr("timeOut",timeOut);
}
function clearTimer(timer,timeOut){
	closeMusic();
	clearTimeout(timeOut);
	clearInterval(timer);
}
/**格式化日期
* @param date
* @param pattern
* @returns
*/
function getFormatDate(date, pattern) {   
  if (date == undefined) {   
      date = new Date();   
  }   
  if (pattern == undefined) {   
      pattern = "yyyy-MM-dd hh:mm:ss";   
  }   
  return date.format(pattern);   
}
/**
 * 时间格式转化
 * 使用示例：
 *     var testDate = new Date();
 *     alert(testDate.format("yyyy-MM-dd hh:mm:ss"));
 *
 * author:chenjda
 *
 */
Date.prototype.format = function(format) {
	/*
	 * eg:format="yyyy-MM-dd hh:mm:ss";
	 */
	var o = {
		"M+" :this.getMonth() + 1, // month
		"d+" :this.getDate(), // day
		"h+" :this.getHours(), // hour
		"m+" :this.getMinutes(), // minute
		"s+" :this.getSeconds(), // second
		"q+" :Math.floor((this.getMonth() + 3) / 3), // quarter
		"S" :this.getMilliseconds()
	// millisecond
	};

	if (/(y+)/.test(format)) {
		format = format.replace(RegExp.$1, (this.getFullYear() + "")
				.substr(4 - RegExp.$1.length));
	}

	for ( var k in o) {
		if (new RegExp("(" + k + ")").test(format)) {
			format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k]
					: ("00" + o[k]).substr(("" + o[k]).length));
		}
	}
	return format;
};