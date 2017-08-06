<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/public/header_top.jsp"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'update.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" language="javascript" src="<%=basePath%>/js/jquery.min.js"></script>
  </head>
  
  <body>
    新闻编辑 <br>
    <form role="form">
	  <div class="form-group">
	  	<input type="hidden" id="newsId" value="${news.id }">
	    <label for="name">新闻标题</label>
	    <input type="text" class="form-control" name="title" id="title" value="${news.title }" placeholder="请输入新闻标题">
	  </div>
	  <div class="form-group">
	    <label for="name">新闻名称</label>
	    <input type="text" class="form-control" name="name" id="name" value="${news.name }" placeholder="请输入新闻名称">
	  </div>
	  <div class="form-group">
	    <label for="name">新闻介绍</label>
	    <input type="text" class="form-control" name="introduction" id="name" value="${news.introduction }" placeholder="请输入新闻介绍">
	  </div>
	  
	  <label for="name">新闻状态</label>
      <select id="status" class="form-control" name="status">
        <option value="0">上架</option>
        <option value="1">下架</option>
      </select>
	  
	  <div class="form-group">
	    <label for="inputfile">上传新闻图片</label>
	    <input type="file" id="inputfile">
	  </div>
	  
	  <label for="name">新闻排序</label>
      <select id="sort" class="form-control" name="sort">
        <option value="0">0</option>
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
        <option value="6">6</option>
        <option value="7">7</option>
        <option value="8">8</option>
        <option value="9">9</option>
      </select>
	  
	  <div class="form-group">
	    <label for="name">新闻内容</label><span style="color:red;">(应该放富文本编辑框_TODO)</span>
	    <textarea id="hc" name="htmlContent" class="form-control" rows="3">
	    	${news.htmlContent }
	    </textarea>
	  </div>
	  
	  <input type="button" class="btn btn-default" value="提交" onclick="newsSubmit();" />
	</form>
	
	<script type="text/javascript">
		function newsSubmit(){
			var newsId = $("#newsId").val();
			var title = $.trim($("#title").val());
			if(title.length == 0){
				alert("新闻标题不能为空字符");
			} else{
				 $.ajax({
				   type: "POST",
				   async:false,
				   url: "<%=basePath%>/admin/news/updateadd.do?id="+newsId,
				   data: $("form").serialize(),
				   success: function(msg){
				     var data = $.parseJSON(msg);
				     //console.log(data);
				     if(data.isError==false){
				     	alert(data.successMsg);
				     	window.location.href="<%=basePath%>/admin/news/list.do";
				     }else{
				     	alert(data.errorMsg);
				     }
				     
				   }
				});
			}
		}
		
		$(function(){
			$("#status").val(${news.status});
			$("#sort").val(${news.sort});
		});
	</script>
  </body>
</html>