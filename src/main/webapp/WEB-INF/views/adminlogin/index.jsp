    <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
    <%  
    String path = request.getContextPath();  
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
    %>  
    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
    <html>  
    <head>  
    <base href="<%=basePath%>">  

	<title>简洁Bootstrap响应式后台管理系统模板下载</title>	
	<meta name="keywords" content="Bootstrap模板,Bootstrap3模版,Bootstrap模板下载,Bootstrap后台模板,Bootstrap教程,Bootstrap中文,后台管理系统模板,后台模板下载,后台管理系统,后台管理模板" />
	<meta name="description" content="JS代码网提供Bootstrap模板,后台管理系统模板,后台管理界面,Bootstrap后台板版下载" />
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
          <div class="btn-group pull-right">
			<a class="btn" href="/springmvc/my-profile.do"><i class="icon-user"></i> Admin</a>
            <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
              <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
			  <li><a href="/springmvc/my-profile.do">个人资料</a></li>
              <li class="divider"></li>
              <li><a href="#">退出</a></li>
            </ul>
          </div>
          <div class="nav-collapse">
            <ul class="nav">
			<li><a href="/springmvc/admin.do">首页</a></li>
              <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">用户 <b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="/springmvc/new-user.do">新建用户</a></li>
					<li class="divider"></li>
					<li><a href="/springmvc/users.do">管理用户</a></li>
				</ul>
			  </li>
              <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">角色 <b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="/springmvc/new-role.do">新建角色</a></li>
					<li class="divider"></li>
					<li><a href="/springmvc/roles.do">管理角色</a></li>
				</ul>
			  </li>
			  <li><a href="/springmvc/stats.do">统计</a></li>
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
             <!-- <li><a href="/springmvc/users.do">用户</a></li>
              <li><a href="/springmvc/roles.do">角色</a></li>  -->
              <li><a  href="javascript:void(0)"  onclick="ahref(this)" url="/springmvc/admin/BannerList.do">宣传图片</a></li>
              <li class="nav-header"><i class="icon-signal"></i> 商品管理</li>
              <!--<li class="active"><a href="/springmvc/stats.do">通用</a></li>
              <li><a href="/springmvc/user-stats.do">用户</a></li>
               <li><a href="/springmvc/visitor-stats.do">访问者</a></li>-->
              <li><a href="/springmvc/roles.do">我的商品</a></li>
             
              <li class="nav-header"><i class="icon-user"></i> 新闻管理</li>
              <li><a href="/springmvc/my-profile.do">新闻编辑</a></li>
              <li><a href="#">设置</a></li>
			  <li><a href="#">退出</a></li> 
            </ul>
          </div>
        </div>
        <div class="span9">
		  <div class="row-fluid">
			<div class="page-header">
				<h1>网站统计 <small></small></h1>
			</div>
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

