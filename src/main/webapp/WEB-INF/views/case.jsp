    <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
    <%  
    String path = request.getContextPath();  
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
    %>  
    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
    <html>  
    <head>  
    <base href="<%=basePath%>">  
	<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/style.css">
    </head> 
<body>
<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<a href="index.html" class="navbar-brand logo"><img src="" alt="企业logo" style=""></a>
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
		</div>
		<div class="collapse navbar-collapse" id="navbar-collapse">
			<ul class="nav navbar-nav navbar-right">
				<li ><a href="/nrg/welcome.do"><span class="glyphicon glyphicon-home"></span> 首页</a></li>
				<li><a href="/nrg/information.do"><span class="glyphicon glyphicon-list"></span> 资讯</a></li>
				<li class="active"><a href="/nrg/case.do"><span class="glyphicon glyphicon-fire"></span> 商品</a></li>
				<li><a href="/nrg/about.do"><span class="glyphicon glyphicon-question-sign"></span> 关于我们</a></li>
			
			</ul>	
		</div>
	</div>
</nav>

<div class="jumbotron">
	<div class="container">
		<hgroup>
			<h1>案例</h1>
			<h4>和各大明星企业有着紧密合作...</h4>
		</hgroup>
	</div>
</div>

<div id="case">
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
				<div class="thumbnail">
					<img src="img/case1.jpg" alt="">
					<div class="caption">
						<h4>中国移动通信</h4>
						<p>参与了本机构的总裁管理培训课程，学员反馈意见良好。</p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
				<div class="thumbnail">
					<img src="img/case2.jpg" alt="">
					<div class="caption">
						<h4>中国石化</h4>
						<p>参与了本机构的总裁管理培训课程，学员反馈意见良好。</p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
				<div class="thumbnail">
					<img src="img/case3.jpg" alt="">
					<div class="caption">
						<h4>中国联通</h4>
						<p>参与了本机构的总裁管理培训课程，学员反馈意见良好。</p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
				<div class="thumbnail">
					<img src="img/case4.jpg" alt="">
					<div class="caption">
						<h4>中国电信</h4>
						<p>参与了本机构的总裁管理培训课程，学员反馈意见良好。</p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
				<div class="thumbnail">
					<img src="img/case3.jpg" alt="">
					<div class="caption">
						<h4>中国联通</h4>
						<p>参与了本机构的总裁管理培训课程，学员反馈意见良好。</p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
				<div class="thumbnail">
					<img src="img/case4.jpg" alt="">
					<div class="caption">
						<h4>中国电信</h4>
						<p>参与了本机构的总裁管理培训课程，学员反馈意见良好。</p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
				<div class="thumbnail">
					<img src="img/case2.jpg" alt="">
					<div class="caption">
						<h4>中国石化</h4>
						<p>参与了本机构的总裁管理培训课程，学员反馈意见良好。</p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
				<div class="thumbnail">
					<img src="img/case1.jpg" alt="">
					<div class="caption">
						<h4>中国移动通信</h4>
						<p>参与了本机构的总裁管理培训课程，学员反馈意见良好。</p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
				<div class="thumbnail">
					<img src="img/case4.jpg" alt="">
					<div class="caption">
						<h4>中国电信</h4>
						<p>参与了本机构的总裁管理培训课程，学员反馈意见良好。</p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
				<div class="thumbnail">
					<img src="img/case3.jpg" alt="">
					<div class="caption">
						<h4>中国联通</h4>
						<p>参与了本机构的总裁管理培训课程，学员反馈意见良好。</p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
				<div class="thumbnail">
					<img src="img/case4.jpg" alt="">
					<div class="caption">
						<h4>中国电信</h4>
						<p>参与了本机构的总裁管理培训课程，学员反馈意见良好。</p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
				<div class="thumbnail">
					<img src="img/case2.jpg" alt="">
					<div class="caption">
						<h4>中国石化</h4>
						<p>参与了本机构的总裁管理培训课程，学员反馈意见良好。</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<footer id="footer">
	<div class="container">
		<p>企业培训 | 合作事宜 | 版权投诉</p>
		<p>苏ICP 备12345678. © 2009-2029 瑞兰德环境科技 </p>
	</div>
</footer>
</body>
</html>