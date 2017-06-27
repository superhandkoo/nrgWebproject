 var courseId;
 var groupId;
 var classTeacherId;
 var ws = null;	
 var heartcount=0;//表示心跳次数，用来判断是否刷新时候触发的onclose
 $(function(){
		websocket();
		//getHistoryMessage(0);//查询历史记录
});

function print() {
	if (console) {
		if (arguments.length == 1)
			console.log(arguments[0]);
		else 
			console.log(arguments[0] + ": " + arguments[1]);
	}
}

 function websocket(){	   
	   courseId = $.trim($('#courseId').val());
	   classId = $.trim($('#classId').val());
	   kPointId=$("#kPointId").val();
	   classTeacherId=$("#classTeacherId").val();
	 //  console.log("classTeacherId:"+classTeacherId);
	/*   if(groupId==""||groupId==null){
		   groupId=0;
	   }*/
	   //alert(window.WebSocket);
		if(window.WebSocket){
			try{
				//alert("ws://"+window.location.host+"/socket?courseId="+courseId+"&isStudent="+flag);
				ws = new WebSocket("ws://"+window.location.host+"/socket?courseId="+courseId+"&kPointId="+kPointId+"&isStudent="+flag+"&classId="+classId+"&classTeacherId="+classTeacherId);
			}catch(e){
				ws == null;
			}
		    if (ws == null||ws=="") {
		      showConfirm("页面加载异常，是否重新加载页面",function(){window.location.reload();},null,"确定","取消");
		    }
		    //打开Socket 
		    ws.onopen = function(event) {
		    //5s检测一次该用户是否在线
		    setInterval(function(){			
		    	SendHeart();
		    },5000);
		 
		    };
		    ws.onmessage = function(event) {
		        var DATA=eval("("+event.data+")"); 
		        print("DATA.Flag", DATA.Flag);
	           /* var dateAndTime=getFormatDate(new Date()); //显示日期和时间
	            var timeHour =dateAndTime.split(" ")[1]; //显示时间           
	*/         //alert(DATA.Flag);
		        if(DATA.Flag==0){ //学生、助教上下线
					if(DATA.OnOrOff==0){//上线
						if(DATA.Role==0){//学生<学生，助教处看到>
							showOnlineOrExit(1, DATA.userId); // 上线
						}else{//助教<主讲出看到>
							showOnlineOrExit(1, DATA.userId); // 上线
						}
					}else{//下线
						if(DATA.Role==0){//学生<学生，助教处看到>
							showOnlineOrExit(0, DATA.userId); // 下线
						}else{//助教<主讲出看到>
							showOnlineOrExit(0, DATA.userId); // 下线
						}
					}
			//alert(DATA);
					//alert(DATA.userId);
					print("学生、助教上下线，DATA.userId", DATA.userId);
					
					//showOnlineOrExit(0, DATA.userId); // 下线
					//showOnlineOrExit(1, DATA.userId); // 上线
					
		    	}else if(DATA.Flag==1){//socket收到文字消息
		    		print("收到消息，DATA.isStudent", DATA.isStudent);
		    		if(DATA.isStudent==2){//老师发送给助教的消息，显示在左下角对话框
		    			//DATA.userName发送消息人名字，DATA.discussionId每条记录ID
		    			insertReply(DATA);
		    		}else{
		    			insertReply(DATA);
		    		}
		    	}else if(DATA.Flag==3){//助教评星
		    		if(DATA.isDis==1){
		    			starReply(DATA);
		    		}else{
		    			//alert("收到了");
		    			starReply2(DATA);
		    		}
		    	}else if(DATA.Flag==4){//老师提示
		    		teacherNoticeReply(DATA);
		    	}else if(DATA.Flag==9){//助教转发
		    		/*if(DATA.isStudent==1){//助教发送给老师的消息，显示在左下角对话框
		    			//DATA.userName发送消息人名字，DATA.discussionId每条记录ID
		    			insertToTeacher(DATA);
		    		}else{
		    			insertReply(DATA);
		    		}*/
		    		if(DATA.filePath==""){//课堂讨论中助教推送
		    			insertModelDiscussion(DATA);
		    		}else{
		    			insertModel(DATA);
		    		}
		    	}else if(DATA.Flag==8){//助教回复
		    		//alert(DATA.message+"*"+DATA.userName+"*"+DATA.discussionId);
		    		if(DATA.act==1){
		    			changeReply(DATA);   
		    		}else{
		    			changeRestore(DATA);//学生提问中的回答
		    		}
		    	}else if(DATA.Flag==11){
		    		//alert(DATA.isQorDis);
		    		if(DATA.isQorDis==1){
		    			insertTeaDis(DATA);//三个地方都没加
		    		}else{
		    			insertTeaQ(DATA);
		    		}
		    	}else if(DATA.Flag==99){//修改课堂讨论/提问的状态了
		    		console.log(DATA);
		    		changeType(DATA);
		    	}else if(DATA.Flag==97){//老师确定提交互评信息
		    		//groupStarsStep3(DATA);
		    	}else if(DATA.Flag==98){//小组长确定提交互评信息
		    		groupStarsStep1(DATA);
		    	}else if(DATA.Flag==12){
		    		stuQuiz(DATA);
		    	}else if(DATA.Flag==13){//老师选择两个小组互评
		    		TwoGroupComment(DATA);
		    	}else if(DATA.Flag==2){//表示是老师通知学生考试或作业、助教推送典型题给老师
		    		getTeacherNotice(DATA);   
		    	}else if(DATA.Flag==6){//用户重复登录
	
		    	   	document.addEventListener('touchmove', function(event) {
			            if($(".span_div").css("display")=="block"){
			                event.preventDefault();
			            }
			        });
		    	   showConfirm("您已在其他地方登录",function(){
		    	   try {
			    	    window.opener = window;
		       			var win = window.open("","_self");
		      			win.close();
		      	 		top.close();
	   					} catch (e) {
							alert("您的手机浏览器不支持自动关闭，请手动关闭该页面");
	  					 }
	  					 },null,"退出",null);
		    	}else if(DATA.Flag==110){//服务端返回的心跳
		    		heartcount=0;
		    	}
		    };
	
		    ws.onclose = function(event) {	    
		    	 if(heartcount>3)
				 {
					window.location.reload();
					 
				 }		
				
		    };
	 }else{
		 //location.href="index.jsp";
		 alert("您浏览器不支持讨论功能");
	 }
 }
	 
	 function SendHeart()
	 {	 
		 try{
		/*	 if(heartcount>3){//网页端掉线了，需要重连
				 console.log("掉线了，重连："+heartcount);
				 websocket();
			 }else{*/
				ws.send("@websocket#check*online");	
				heartcount++;
//			 }
		 }
		 catch(e)
		 {
			  alert("已掉线，请刷新页面");	//没捕捉到不起作用
		 } 
	 }
	 
	 function sendMessage(msg) {
	        waitForSocketConnection(socket, function() {
	        	ws.send(msg);
	        });
	    };


	function waitForSocketConnection(socket, callback){
	        setTimeout(
	            function(){
	                if (socket.readyState === 1) {
	                    if(callback !== undefined){
	                        callback();
	                    }
	                    return;
	                } else {
	                    waitForSocketConnection(socket,callback);
	                }
	            }, 5);
	    };

