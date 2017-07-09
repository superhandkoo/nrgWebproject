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
				"password":pass
			},
			dataType:"json"
		}).done(function(data){
			var flag=data.flag;
			var message=data.message;
			console.log(message);
			if(flag){
				layer.msg("稍后跳转",function(){
					//添加跳转
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
		//判断
		if(username==null||username==""||username==undefined){
			layer.msg("请填写用户名",function(){
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
				"password":password,
				"mobile":mobile
			},
			dataType:"json"
		}).done(function(data){
			var flag=data.flag;
			var message=data.message;
			console.log(message);
			if(flag){
				layer.msg("注册成功",function(){
					//添加跳转
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




/*$(document).ready(function() {


	$('#reg').click(function() {
		if ($('#user').val() == "") {
			$('#user').focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
			$('#userCue').html("<font color='red'><b>×用户名不能为空</b></font>");
			return false;
		}
		if ($('#user').val().length < 4 || $('#user').val().length > 16) {

			$('#user').focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
			$('#userCue').html("<font color='red'><b>×用户名位4-16字符</b></font>");
			return false;

		}
		$.ajax({
			type: reMethod,
			url: "/member/ajaxyz.php",
			data: "uid=" + $("#user").val() + '&temp=' + new Date(),
			dataType: 'html',
			success: function(result) {

				if (result.length > 2) {
					$('#user').focus().css({
						border: "1px solid red",
						boxShadow: "0 0 2px red"
					});$("#userCue").html(result);
					return false;
				} else {
					$('#user').css({
						border: "1px solid #D7D7D7",
						boxShadow: "none"
					});
				}

			}
		});
		if ($('#passwd').val().length < pwdmin) {
			$('#passwd').focus();
			$('#userCue').html("<font color='red'><b>×密码不能小于" + pwdmin + "位</b></font>");
			return false;
		}
		if ($('#passwd2').val() != $('#passwd').val()) {
			$('#passwd2').focus();
			$('#userCue').html("<font color='red'><b>×两次密码不一致！</b></font>");
			return false;
		}

		var sqq = /^[1-9]{1}[0-9]{4,9}$/;
		if (!sqq.test($('#qq').val()) || $('#qq').val().length < 5 || $('#qq').val().length > 12) {
			$('#qq').focus().css({
				border: "1px solid red",
				boxShadow: "0 0 2px red"
			});
			$('#userCue').html("<font color='red'><b>×QQ号码格式不正确</b></font>");return false;
		} else {
			$('#qq').css({
				border: "1px solid #D7D7D7",
				boxShadow: "none"
			});
			
		}

		$('#regUser').submit();
	});
	

});*/