    <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
    <%  
    String path = request.getContextPath();  
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
    %>  
    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
    <html>  
    <head>  
    <base href="<%=basePath%>">  

    <title>è§è²ç®¡ç ç®æ´Bootstrapååºå¼åå°ç®¡çç³»ç»æ¨¡æ¿ä¸è½½</title>	
	<meta name="keywords" content="Bootstrapæ¨¡æ¿,Bootstrap3æ¨¡ç,Bootstrapæ¨¡æ¿ä¸è½½,Bootstrapåå°æ¨¡æ¿,Bootstrapæç¨,Bootstrapä¸­æ,åå°ç®¡çç³»ç»æ¨¡æ¿,åå°æ¨¡æ¿ä¸è½½,åå°ç®¡çç³»ç»,åå°ç®¡çæ¨¡æ¿" />
	<meta name="description" content="JSä»£ç ç½æä¾Bootstrapæ¨¡æ¿,åå°ç®¡çç³»ç»æ¨¡æ¿,åå°ç®¡ççé¢,Bootstrapåå°æ¿çä¸è½½" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="css/bootstrap.css" rel="stylesheet">
	<link href="css/site.css" rel="stylesheet">
    <link href="css/bootstrap-responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
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
			<a class="btn" href="my-profile.html"><i class="icon-user"></i> Admin</a>
            <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
              <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
			  <li><a href="my-profile.html">Profile</a></li>
              <li class="divider"></li>
              <li><a href="#">Logout</a></li>
            </ul>
          </div>
          <div class="nav-collapse">
            <ul class="nav">
			<li><a href="index.html">Home</a></li>
              <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Users <b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="new-user.html">New User</a></li>
					<li class="divider"></li>
					<li><a href="users.html">Manage Users</a></li>
				</ul>
			  </li>
              <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Roles <b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="new-role.html">New Role</a></li>
					<li class="divider"></li>
					<li><a href="roles.html">Manage Roles</a></li>
				</ul>
			  </li>
			  <li><a href="stats.html">Stats</a></li>
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
              <li class="nav-header"><i class="icon-wrench"></i> Administration</li>
              <li><a href="users.html">Users</a></li>
              <li class="active"><a href="roles.html">Roles</a></li>
              <li class="nav-header"><i class="icon-signal"></i> Statistics</li>
              <li><a href="stats.html">General</a></li>
              <li><a href="user-stats.html">Users</a></li>
              <li><a href="visitor-stats.html">Visitors</a></li>
              <li class="nav-header"><i class="icon-user"></i> Profile</li>
              <li><a href="my-profile.html">My profile</a></li>
              <li><a href="#">Settings</a></li>
			  <li><a href="#">Logout</a></li> 
            </ul>
          </div>
        </div>
        <div class="span9">
		  <div class="row-fluid">
			<div class="page-header">
				<h1>Roles <small>Manage roles</small></h1>
			</div>
			<table class="table table-striped table-bordered table-condensed">
				<thead>
					<tr>
						<th>ID</th>
						<th>Role</th>
						<th>Description</th>
						<th>Slug</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
				<tr class="list-roles">
					<td>1</td>
					<td>Admin</td>
					<td>Aliquam erat volutpat. Vivamus molestie tempor pellentesque. Praesent lobortis, neque.</td>
					<td>admin</td>
					<td>
						<div class="btn-group">
							<a class="btn btn-mini dropdown-toggle" data-toggle="dropdown" href="#">Actions <span class="caret"></span></a>
							<ul class="dropdown-menu pull-right">
								<li><a href="#"><i class="icon-pencil"></i> Edit</a></li>
								<li><a href="#"><i class="icon-trash"></i> Delete</a></li>
							</ul>
						</div>
					</td>
				</tr>				
				<tr class="list-roles">
					<td>2</td>
					<td>Moderator</td>
					<td>Phasellus scelerisque, quam ac bibendum pulvinar, erat ligula pulvinar risus, in ultricies...</td>
					<td>mod</td>
					<td>
						<div class="btn-group">
							<a class="btn btn-mini dropdown-toggle" data-toggle="dropdown" href="#">Actions <span class="caret"></span></a>
							<ul class="dropdown-menu pull-right">
								<li><a href="#"><i class="icon-pencil"></i> Edit</a></li>
								<li><a href="#"><i class="icon-trash"></i> Delete</a></li>
							</ul>
						</div>
					</td>
				</tr>
				<tr class="list-roles">
					<td>3</td>
					<td>User</td>
					<td>Donec cursus, velit eu fermentum ullamcorper, libero est.</td>
					<td>user</td>
					<td>
						<div class="btn-group">
							<a class="btn btn-mini dropdown-toggle" data-toggle="dropdown" href="#">Actions <span class="caret"></span></a>
							<ul class="dropdown-menu pull-right">
								<li><a href="#"><i class="icon-pencil"></i> Edit</a></li>
								<li><a href="#"><i class="icon-trash"></i> Delete</a></li>
							</ul>
						</div>
					</td>
				</tr>
				</tbody>
			</table>
			<a href="new-role.html" class="btn btn-success">New Role</a>
		  </div>
        </div>
      </div>

      <hr>

      <footer class="well">
        &copy; Admin
      </footer>

    </div>

    <script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script>
	$(document).ready(function() {
		$('.dropdown-menu li a').hover(
		function() {
			$(this).children('i').addClass('icon-white');
		},
		function() {
			$(this).children('i').removeClass('icon-white');
		});
	});
	</script>
  </body>
</html>
