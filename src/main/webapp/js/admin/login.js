$(function(){
	//登录/注册切换样式
	$('#switch_qlogin').click(function(){
		$('#switch_login').removeClass("switch_btn_focus").addClass('switch_btn');
		$('#switch_qlogin').removeClass("switch_btn").addClass('switch_btn_focus');
		$('#switch_bottom').animate({left:'0px',width:'70px'});
		$('#qlogin').css('display','none');
		$('#web_qr_login').css('display','block');
		
	});
	$('#switch_login').click(function(){
		$('#switch_login').removeClass("switch_btn").addClass('switch_btn_focus');
		$('#switch_qlogin').removeClass("switch_btn_focus").addClass('switch_btn');
		$('#switch_bottom').animate({left:'154px',width:'70px'});
		
		$('#qlogin').css('display','block');
		$('#web_qr_login').css('display','none');
	});
	if(getParam("a")=='0'){
		$('#switch_login').trigger('click');
	}
	//登陆功能
	$("#loginExcuteForm").on("submit",function(event){
		event.preventDefault();
		var name=$.trim($("#u").val());
		var pass=$.trim($("#p").val());
		//判断
		if(name==null||name==""||name==undefined){
			layer.msg("请填写用户名",function(){
				$("#u").focus();
			});
			return false;
		}
		if(pass==null||pass==""||pass==undefined){
			layer.msg("请填写用户密码",function(){
				$("#p").focus();
			});
			return false;
		}
		
		var url="/nrg/admin/loginExcute.do";
		$.ajax({
			url:url,
			type:"post",
			data:{
				"username":name,
				"password":_md5(pass)
			},
			dataType:"json"
		}).done(function(data){
			var flag=data.flag;
			var message=data.message;
			console.log(message);
			if(flag){
				layer.msg("稍后跳转",function(){
					//添加跳转
					_trun();
				});
			}else{
				layer.msg(message,function(){
					$("#u").focus();
				});
			}
		});
		
	});
	var reMethod = "GET",
	pwdmin = 6;
	//用户注册
	$("#registForm").on("submit",function(event){
		
		event.preventDefault();
		var username=$.trim($("#user").val());
		var password=$.trim($("#passwd").val());
		var password2=$.trim($("#passwd2").val());
		var mobile=$.trim($("#mobile").val());
		var jobNumber=$.trim($("#jobNumber").val());
		//判断
		if(username==null||username==""||username==undefined){
			layer.msg("请填写用户名",function(){
				$("#user").focus();
			});
			return false;
		}
		if(jobNumber==null||jobNumber==""||jobNumber==undefined){
			layer.msg("请填写工号",function(){
				$("#user").focus();
			});
			return false;
		}
		if(user.length<4||user.length>16){
			layer.msg("用户名为4-16字符",function(){
				$("#user").focus();
			});
			return false;
		}
		if(password==null||password==""||password==undefined){
			layer.msg("请填写用户密码",function(){
				$("#passwd").focus();
			});
			return false;
		}
		if(password.length<pwdmin){
			layer.msg("密码不能小于"+pwdmin+"位",function(){
				$("#user").focus();
			});
			return false;
		}
		if(password2==null||password2==""||password2==undefined){
			layer.msg("两次密码不一致",function(){
				$("#passwd2").focus();
			});
			return false;
		}
		if (password != password2) {
			layer.msg("两次密码不一致",function(){
				$("#passwd2").focus();
			});
			return false;
		}
		//mobile
		var smobile = /^1[3|4|5|8][0-9]\d{4,8}$/;
		if (!smobile.test(mobile) || mobile.length != 11 ) {
			layer.msg("手机号格式不正确",function(){
				$("#passwd2").focus();
			});
			return false;
		}
		
		var url="/nrg/admin/registExcute.do";
		$.ajax({
			url:url,
			type:"post",
			data:{
				"username":username,
				"password":_md5(password),
				"mobile":mobile,
				"jobNumber":jobNumber
			},
			dataType:"json"
		}).done(function(data){
			var flag=data.flag;
			var message=data.message;
			console.log(message);
			if(flag){
				layer.msg("注册成功",function(){
					//添加跳转
					_trun();
				});
			}else{
				layer.msg(message,function(){
					$("#username").focus();
				});
			}
		});
	});
	
});
	
function logintab(){
	scrollTo(0);
	$('#switch_qlogin').removeClass("switch_btn_focus").addClass('switch_btn');
	$('#switch_login').removeClass("switch_btn").addClass('switch_btn_focus');
	$('#switch_bottom').animate({left:'154px',width:'96px'});
	$('#qlogin').css('display','none');
	$('#web_qr_login').css('display','block');
	
}


//根据参数名获得该参数 pname等于想要的参数名 
function getParam(pname) { 
    var params = location.search.substr(1); // 获取参数 平且去掉？ 
    var ArrParam = params.split('&'); 
    if (ArrParam.length == 1) { 
        //只有一个参数的情况 
        return params.split('=')[1]; 
    } 
    else { 
         //多个参数参数的情况 
        for (var i = 0; i < ArrParam.length; i++) { 
            if (ArrParam[i].split('=')[0] == pname) { 
                return ArrParam[i].split('=')[1]; 
            } 
        } 
    } 
}  

function _trun(){
	window.location.href="/nrg/admin.do";
}
/**
 * 密码加密
 */
function _md5(str){
	return hex_md5(str);
}