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
    
    <title>更新</title>
    
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
<form action="/nrg/admin/solutionType/update.do"  onsubmit="return check();" method="post">
<h3>更新解问类型</h3>
  <label>ID：${pageBean.id }</label>
  <br>
  <label>内容：</label>
  <input type="text" name="typeName" id="typeName" value="${pageBean.typeName }"/>
  <br>
  <label>创建时间：${pageBean.createdOn }</label>
  <br>
   <label>是否上架：<c:if test="${pageBean.isDeleted==1 }">
				      已下架
				</c:if>
				<c:if test="${pageBean.isDeleted==0 }">
				      正上架
				</c:if>
</label>
  <br>
  <label>排序：</label>
  <select name="sort" id="sort">
     <option>${pageBean.sort }</option>
     <option>1</option>
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
  <input type="hidden" value="${pageBean.id }" name="id">
  <input type="hidden" value="${pageBean.createdOn }" name="createdOn">
  <input type="hidden" value="${pageBean.createdBy }" name="createdBy">
  <input type="hidden" value="${pageBean.isDeleted }" name="isDeleted">
    <br>
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