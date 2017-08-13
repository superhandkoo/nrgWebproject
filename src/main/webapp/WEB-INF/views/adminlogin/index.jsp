    <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
    <%  
    String path = request.getContextPath();  
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
    %>  
    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
    <html>  
    <head>  
    <base href="<%=basePath%>">  

	<title>瑞兰德后台管理系统</title>	
	<meta name="keywords" content="瑞兰德" />
	<meta name="description" content="瑞兰德环境" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/admin/bootstrap.css" rel="stylesheet">
	<link href="css/admin/site.css" rel="stylesheet">
    <link href="css/admin/bootstrap-responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
	<!--[if lte IE 8]><script src="js/excanvas.min.js"></script><![endif]-->
    <style type="text/css">
   html, body {
        height: 100%;
    }
    </style>
  </head>
  <body>
    <div class="navbar navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container-fluid">
          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <a class="brand" href="#">Admin</a>
          <!-- 
          <div class="btn-group pull-right">
			<a class="btn" href="/nrg/my-profile.do"><i class="icon-user"></i> Admin</a>
            <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
              <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
			  <li><a href="/nrg/my-profile.do">个人资料</a></li>
              <li class="divider"></li>
              <li><a href="#">退出</a></li>
            </ul>
          </div>
           -->
          <div class="nav-collapse">
            <ul class="nav">
			<li><a href="/nrg/admin.do">首页</a></li>
              <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">用户 <b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="/nrg/new-user.do">新建用户</a></li>
					<li class="divider"></li>
					<li><a href="/nrg/users.do">管理用户</a></li>
				</ul>
			  </li>
			  <!--  
              <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">角色 <b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="/nrg/new-role.do">新建角色</a></li>
					<li class="divider"></li>
					<li><a href="/nrg/roles.do">管理角色</a></li>
				</ul>
			  </li>
			  <li><a href="/nrg/stats.do">统计</a></li>
			  -->
            </ul>
          </div>
        </div>
      </div>
    </div>

    <div class="container-fluid">
      <div class="row-fluid">
        <div class="span3">
          <div class="well sidebar-nav">
            <ul class="nav nav-list">
              <li class="nav-header"><i class="icon-wrench"></i>banner管理</li>
                  <li><a  href="javascript:void(0)"  onclick="ahref(this)" url="/nrg/admin/banner/add.do">添加banner</a></li>
                  <li><a  href="javascript:void(0)"  onclick="ahref(this)" url="/nrg/admin/banner/list.do">banner列表</a></li>
                  <li><a  href="javascript:void(0)"  onclick="ahref(this)" url="/nrg/admin/BannerList.do">宣传图片</a></li>
              <li class="nav-header"><i class="icon-solution"></i>解决方案管理</li>
                  <li><a href="javascript:void(0)"  onclick="ahref(this)" url="/nrg/admin/solutionType/list.do">类型列表</a></li>
                  <li><a href="javascript:void(0)"  onclick="ahref(this)" url="/nrg/admin/solution/list.do">方案列表</a></li>
              <li class="nav-header"><i class="icon-product"></i>产品中心管理</li>
                  <li><a href="javascript:void(0)"  onclick="ahref(this)" url="/nrg/admin/productType/list.do">类型列表</a></li>
                  <li><a href="javascript:void(0)"  onclick="ahref(this)" url="/nrg/admin/product/list.do">产品列表</a></li>
              <li class="nav-header"><i class="icon-news"></i>新闻管理</li>
                  <li><a href="javascript:void(0)"  onclick="ahref(this)" url="/nrg/admin/news/toAdd.do">添加新闻</a></li>
                  <li><a href="javascript:void(0)"  onclick="ahref(this)" url="/nrg/admin/news/list.do">新闻列表</a></li>
              <li class="nav-header"><i class="icon-user"></i>用户管理</li>
              <!-- 
                  <li><a href="javascript:void(0)"  onclick="ahref(this)" url="/nrg/admin/user/add.do">添加用户</a></li>
              -->
                  <li><a href="javascript:void(0)"  onclick="ahref(this)" url="/nrg/admin/user/list.do">用户列表</a></li>
              <li class="nav-header"><i class="icon-about"></i>关于我们</li>
                  <li><a href="javascript:void(0)"  onclick="ahref(this)" url="/nrg/admin/about/goNRG.do">走进瑞兰德</a></li>
                  <li><a href="javascript:void(0)"  onclick="ahref(this)" url="/nrg/admin/about/marketing.do">营销网络</a></li>
                  <li><a href="javascript:void(0)"  onclick="ahref(this)" url="/nrg/admin/about/joinUs.do">加入我们</a></li>
                  <li><a href="javascript:void(0)"  onclick="ahref(this)" url="/nrg/admin/about/contactUs.do">联系我们</a></li>
              <li class="nav-header"><i class="icon-log"></i>操作日志</li>
                  <li><a href="javascript:void(0)"  onclick="ahref(this)" url="/nrg/admin/log/list.do">日志列表</a></li>
                  
            </ul>
          </div>
        </div>
        <div class="span9">
		  <div class="row-fluid">
			<div  style="width:100%;height:800px;">
			<iframe  id="iframeq_windows"  src="" style="width:100%;height:800px;border: none;">
			     
			</iframe>
			</div>
			<br />
			
		  </div>
        </div>
      </div>

      <hr>

      <footer class="well">
        &copy; Admin
      </footer>

    </div>

    <script src="js/jquery.min.js"></script>
	<script src="js/admin/jquery.flot.js"></script>
	<script src="js/admin/jquery.flot.resize.js"></script>	
	<script src="js/bootstrap.min.js"></script>
	<script>
	
	function ahref (e){
	
	  $("#iframeq_windows").attr("src",$(e).attr("url"));
	 
	}
	
	$(function () {
		var data = [
		{
			label: 'Page Views',
			data: [[0, 19000], [1, 15500], [2, 11100], [3, 15500]]
		}];
		var dataVisits = [
		{
			label: 'Visits',
			data: [[0, 1980], [1, 1198], [2, 830], [3, 1550]]
		}];
		var options = {
			legend: {
				show: true,
				margin: 10,
				backgroundOpacity: 0.5
			},
			points: {
				show: true,
				radius: 3
			},
			lines: {
				show: true
			},
			grid: {
				borderWidth:1,
				hoverable: true
			},
			xaxis: {
				axisLabel: 'Month',
				ticks: [[0, 'Jan'], [1, 'Feb'], [2, 'Mar'], [3, 'Apr'], [4, 'May'], [5, 'Jun'], [6, 'Jul'], [7, 'Aug'], [8, 'Sep'], [9, 'Oct'], [10, 'Nov'], [11, 'Dec']],
				tickDecimals: 0
			},
			yaxis: {
				tickSize:1000,
				tickDecimals: 0
			}
		};
		var optionsVisits = {
			legend: {
				show: true,
				margin: 10,
				backgroundOpacity: 0.5
			},
			bars: {
				show: true,
				barWidth: 0.5,
				align: 'center'
			},
			grid: {
				borderWidth:1,
				hoverable: true
			},
			xaxis: {
				axisLabel: 'Month',
				ticks: [[0, 'Jan'], [1, 'Feb'], [2, 'Mar'], [3, 'Apr'], [4, 'May'], [5, 'Jun'], [6, 'Jul'], [7, 'Aug'], [8, 'Sep'], [9, 'Oct'], [10, 'Nov'], [11, 'Dec']],
				tickDecimals: 0
			},
			yaxis: {
				tickSize:1000,
				tickDecimals: 0
			}
		};
		function showTooltip(x, y, contents) {
			$('<div id="tooltip">' + contents + '</div>').css( {
				position: 'absolute',
				display: 'none',
				top: y + 5,
				left: x + 5,
				border: '1px solid #D6E9C6',
				padding: '2px',
				'background-color': '#DFF0D8',
				opacity: 0.80
			}).appendTo("body").fadeIn(200);
		}
		var previousPoint = null;
		$("#placeholder, #visits").bind("plothover", function (event, pos, item) {
			if (item) {
				if (previousPoint != item.dataIndex) {
					previousPoint = item.dataIndex;

					$("#tooltip").remove();
					showTooltip(item.pageX, item.pageY, item.series.label + ": " + item.datapoint[1]);
				}
			}
			else {
				$("#tooltip").remove();
				previousPoint = null;            
			}
		});
		$.plot( $("#placeholder") , data, options );
		$.plot( $("#visits") , dataVisits, optionsVisits );
	});
	
	
	</script>
  </body>
</html>

