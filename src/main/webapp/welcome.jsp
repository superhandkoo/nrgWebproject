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
				<li class="active"><a href="/nrg/welcome.do"><span class="glyphicon glyphicon-home"></span> 首页</a></li>
				<li><a href="/nrg/information.do"><span class="glyphicon glyphicon-list"></span> 资讯</a></li>
				<li><a href="/nrg/case.do"><span class="glyphicon glyphicon-fire"></span> 商品</a></li>
				<li><a href="/nrg/about.do"><span class="glyphicon glyphicon-question-sign"></span> 关于我们</a></li>
			
			</ul>	
		</div>
	</div>
</nav>

<div   style="  position: fixed;right:5px;top: 220px;z-index: 999999" >
			<ul class="nav navbar-nav navbar-right">
    	<li >
				
			<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=843576817&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:843576817:51" alt="点击这里给我发消息" title="点击这里给我发消息"/></a>
	     </li>
		</ul>	

</div>


<div id="myCarousel" class="carousel slide" >
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	</ol>
	<div class="carousel-inner">
		<div class="item active" style="background:#223240">
			<img src="img/slide1.png" alt="第一张">
		</div>
		<div class="item" style="background:#F5E4DC;">
			<img src="img/slide2.png" alt="第二张">
		</div>
		<div class="item" style="background:#DE2A2D;">
			<img src="img/slide3.png" alt="第三张">
		</div>
<!-- 		<div style="background:#eee;">
			<img src="img/slide.png" alt="第三张">
		</div> -->
	</div>
	<a href="#myCarousel" data-slide="prev" class="carousel-control left">
		<span class="glyphicon glyphicon-chevron-left"></span>
	</a>
	<a href="#myCarousel" data-slide="next" class="carousel-control right">
		<span class="glyphicon glyphicon-chevron-right"></span>
	</a>
</div>


<div class="tab1">
	<div class="container">
		<h2 class="tab-h2">「为什么选瑞兰德环境科技」</h2>
		<p class="tab-p">强大的科研团队，完美的实战型用户体验，让您的用的放心，用的安心！</p>
		<div class="row">
			<div class="col-md-6 col">
				<div class="media">
					<div class="media-left">
						<a href="#"><img src="img/tab1-1.png" class="media-object" alt=""></a>
					</div>
					<div class="media-body">
						<h4 class="media-heading">团队力量</h4>
						<p class="text-muted">其他：所谓领域专家知名度不够！</p>
						<p>我们：专业人才，在各个领域都有重大建树！</p>
					</div>
				</div>
			</div>
			<div class="col-md-6 col">
				<div class="media">
					<div class="media-left">
						<a href="#"><img src="img/tab1-2.png" class="media-object" alt=""></a>
					</div>
					<div class="media-body">
						<h4 class="media-heading">科技力量</h4>
						<p class="text-muted">其他：非国际专业承认、业界没有足够的声名度！</p>
						<p>我们：一流的专利，世界都在使用！</p>
					</div>
				</div>
			</div>
			<div class="col-md-6 col">
				<div class="media">
					<div class="media-left">
						<a href="#"><img src="img/tab1-3.png" class="media-object" alt=""></a>
					</div>
					<div class="media-body">
						<h4 class="media-heading">用户体验</h4>
						<p class="text-muted">其他：销售，服务，售后无法形成一条链子！</p>
						<p>我们：完美的用户体验，为客户打造放心的产品，！</p>
					</div>
				</div>
			</div>
			<div class="col-md-6 col">
				<div class="media">
					<div class="media-left">
						<a href="#"><img src="img/tab1-4.png" class="media-object" alt=""></a>
					</div>
					<div class="media-body">
						<h4 class="media-heading">服务团队</h4>
						<p class="text-muted">其他：社会招聘的、服务水平参差不齐的普通员工！</p>
						<p>我们：内部培养、经受过良好高端服务培训的高标准员工！</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="tab2">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-sm-6 tab2-img">
				<img src="img/tab2.png" class="auto img-responsive center-block" alt="">
			</div>
			<div class="text col-md-6 col-sm-6 tab2-text">
				<h3>强大的产品检测体系</h3>
				<p>经过层层把关、让您的用的放心用的安心。</p>
			</div>
		</div>
	</div>
</div>


<div class="tab3">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-sm-6">
				<img src="img/tab3.png" class="auto img-responsive center-block" alt="">
			</div>
			<div class="text col-md-6 col-sm-6">
				<h3>最快的处理反应</h3>
				<p>10-20分钟迅速处理您反馈的问题。</p>
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


<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
	//轮播自动播放
	$('#myCarousel').carousel({
		//自动4秒播放
		interval : 4000,
	});

	// //设置垂直居中
	// $('.carousel-control').css('line-height', $('.carousel-inner img').height() + 'px');
	// $(window).resize(function () {
	// 	var $height = $('.carousel-inner img').eq(0).height() || 
	// 				  $('.carousel-inner img').eq(1).height() || 
	// 				  $('.carousel-inner img').eq(2).height();
	// 	$('.carousel-control').css('line-height', $height + 'px');
	// });

	//设置文字垂直居中，谷歌浏览器加载图片的顺序问题，导致高度无法获取
	$(window).load(function () {
		$('.text').eq(0).css('margin-top', ($('.auto').eq(0).height() - $('.text').eq(0).height()) / 2 + 'px');
	});
	

	$(window).resize(function () {
		$('.text').eq(0).css('margin-top', ($('.auto').eq(0).height() - $('.text').eq(0).height()) / 2 + 'px');
	});

	$(window).load(function () {
		$('.text').eq(1).css('margin-top', ($('.auto').eq(1).height() - $('.text').eq(1).height()) / 2 + 'px');
	});

	$(window).resize(function () {
		$('.text').eq(1).css('margin-top', ($('.auto').eq(1).height() - $('.text').eq(1).height()) / 2 + 'px');
	});

</script>

    </body>  
    </html>  