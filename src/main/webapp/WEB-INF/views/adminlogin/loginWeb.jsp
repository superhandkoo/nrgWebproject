<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>后台登录</title> 
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link href="../css/loginWeb.css" rel="stylesheet" type="text/css" />
	<link href="../js/layer/skin/default/layer.css" rel="stylesheet" type="text/css" />
	<script>
	</script>
</head>
<body>
<h1>后台登录<!-- <sup>V2014</sup> --></h1>

<div class="login" style="margin:200px auto;">
    
    <div class="header">
        <div class="switch" id="switch">
        	<a class="switch_btn_focus" id="switch_qlogin" href="javascript:void(0);" tabindex="7">快速登录</a>
			<a class="switch_btn" id="switch_login" href="javascript:void(0);" tabindex="8">快速注册</a>
			<div class="switch_bottom" id="switch_bottom" style="position: absolute; width: 64px; left: 0px;"></div>
        </div>
    </div>    
  
     <!--登录-->
    <div class="web_qr_login" id="web_qr_login" style="display: block; height: 235px;">    
    	<div class="web_login" id="web_login">
        	<div class="login-box">
				<div class="login_form" id="loginExcuteForm">
					<form action="javascript:return true;" name="loginform" accept-charset="utf-8" id="login_form" class="loginForm" method="post"><input type="hidden" name="did" value="0"/>
               			<input type="hidden" name="to" value="log"/>
                		<div class="uinArea" id="uinArea">
                			<label class="input-tips" for="u">帐号：</label>
                			<div class="inputOuter" id="uArea">
                    			<input type="text" id="u" name="username" class="inputstyle"/>
                			</div>
                		</div>
                		<div class="pwdArea" id="pwdArea">
               				<label class="input-tips" for="p">密码：</label> 
               				<div class="inputOuter" id="pArea">
                    			<input type="password" id="p" name="p" class="inputstyle"/>
                			</div>
                		</div>
                		<div style="padding-left:50px;margin-top:20px;"><input type="submit" value="登 录" style="width:178px;" class="button_blue"/></div>
              		</form>
           		</div>
            </div>
		</div>
		<!--登录end-->
  	</div>
  	<!--注册-->
    <div class="qlogin" id="qlogin" style="display: none;margin-top:30px;">
    	<div class="web_login" id="registForm">
	    	<form name="form2" id="regUser" accept-charset="utf-8"  action="javascript:return true;" method="post">
		    	<input type="hidden" name="to" value="reg"/>
	        	<ul class="reg_form" id="reg-ul">
	               	<li>
						<label for="user"  class="input-tips2">用户名：</label>
						<div class="inputOuter2">
							<input type="text" id="user" name="user" maxlength="16" class="inputstyle2"/>
	                    </div>
	                </li>
	                <li>
	                	<label for="passwd" class="input-tips2">密码：</label>
	                    <div class="inputOuter2">
	                        <input type="password" id="passwd"  name="passwd" maxlength="16" class="inputstyle2"/>
	                    </div>
	                </li>
	                <li>
	                <label for="passwd2" class="input-tips2">确认密码：</label>
	                    <div class="inputOuter2">
	                        <input type="password" id="passwd2" name="" maxlength="16" class="inputstyle2" />
	                    </div>
	                </li>
	                <li>
	                 <label for="mobile" class="input-tips2">手机号：</label>
	                    <div class="inputOuter2">
	                        <input type="text" id="mobile" name="mobile" maxlength="11" class="inputstyle2"/>
	                    </div>
	                </li>
	                <li>
	                 <label for="jobNumber" class="input-tips2">工号：</label>
	                    <div class="inputOuter2">
	                        <input type="text" id="jobNumber" name="jobNumber" maxlength="11" class="inputstyle2"/>
	                    </div>
	                </li>
	                <li>
	                    <div class="inputArea">
	                        <input type="submit" id="reg"  style="margin-top:10px;margin-left:85px;" class="button_blue" value="同意协议并注册"/> <a href="#" class="zcxy" target="_blank">注册协议</a>
	                    </div>
	                </li>
	                <div class="cl"></div>
	            </ul>
			</form>
		</div> 
    </div>
    <!--注册end-->
</div>
<div class="jianyi">*推荐使用ie8或以上版本ie浏览器或Chrome内核浏览器访问本站</div>
<!-- jquery -->
<script type="text/javascript" src="../js/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="../js/admin/login.js?v=2333"></script>
<script type="text/javascript" src="../js/layer/layer.js"></script>
<script type="text/javascript" src="../js/md5.js"></script>
</body></html>