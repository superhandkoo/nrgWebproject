<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@include file="/WEB-INF/public/header_top.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
<center>
<form action="/nrg/admin/productType/add.do"  onsubmit="return check();" method="post">
<h3>添加产品类型</h3>
  <label>内容：</label>
  <input type="text" name="typeName" id="typeName"/>
  <br>
  <label>排序：</label>
  <select name="sort" id="sort">
     <option value="1">1</option>
     <option>2</option>
     <option>3</option>
     <option>4</option>
     <option>5</option>
     <option>6</option>
     <option>7</option>
     <option>8</option>
     <option>9</option>
     <option>10</option>
  </select>
  <button class="btn btn-primary">提交</button>
</form>
</center>
  </body>
  <script>
	function check(){
		document.charset='utf-8';
		var typeName = $('#typeName').val();
		if(typeName==""||!typeName){
			alert("请输入内容");
			return false;
		}else{
			return true;
		}
	}
	
</script>
</html>
