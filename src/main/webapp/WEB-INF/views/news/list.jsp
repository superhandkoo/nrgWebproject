<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/public/header_top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%-- <jsp:include page="base.jsp" /> --%>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'list.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	.con{ width:940px; margin:0px auto; min-height:280px;}
	.newbj{ width:100%; height:145px; background:#edf6df;}
	.newbj .newcon{ width:940px; height:145px; margin:0px auto;}
	.newbj .newtit{ width:100%; height:108px; line-height:108px; color:#020202; font-size:34px;}
	.newbj .newtit .zc{width:256px;}
	.newbj .newtit .yc{width:300px; font-size:14px; line-height:30px; padding-top:45px;}
	.newbj .newtit .yc span{color:#6fbf1e;}
	
	.newbj .new_tab{ width:100%; height:37px;}
	.newbj .new_tab ul li{ width:110px; height:37px; float:left; padding-right:5px;}
	.newbj .new_tab ul li a{ display:block; height:37px; line-height:37px; width:110px; background:#dfdfdf; font-size:16px; color:#020202; text-align:center;}
	.newbj .new_tab ul li a:hover{ background:#fff;}
	.newbj .new_tab ul li a.xz{ background:#fff;}
	
	.newlb{ width:100%;}
	.newlb ul li{ width:100%; height:54px; line-height:54px; border-top:1px dashed #dcdcdc;}
	.newlb ul li a{ color:#7b7b7b; font-size:16px;}
	.newlb ul li a:hover{ color:#020202;}
	.newlb .time{ width:90px; padding-right:20px;}
	
	/**page**/
	.pageNum{margin:0 auto;height:35px; overflow:hidden;padding:10px 43px 10px 0px; text-align:right; color:#407aa0;}
	.pageNum input{border:#407aa0 solid 1px;}
	.pageNum a{display:inline-block;height:30px; padding:0px 11px 0px 11px; line-height:30px; text-align:center; overflow:hidden; background:#FFFFFF; border:#d1d1d1 solid 1px; margin:0 2px; color:#000; font-size:14px;}
	.pageNum a:hover, .pageNum .aNow{border:#71BF1E solid 1px; background:#edf6df;color:#2c515a;}
	/**page**/
	</style>

  </head>
  
  <body>
  <!--shang-->
	<div class="newbj">
		<div class="newcon">
		<div class="newtit">新闻中心</div>
		<!-- <div class="new_tab">
			<ul>
				<li><a href="">行业资讯</a></li>
				<li><a href="">海林动态</a></li>
				<li><a href="">特色专题</a></li>
			</ul>
		</div> -->
	
		</div>
	</div>
 <!--shang-->
	
	<%-- <div class="h40"></div>
	<!--内容-->
	<div class="con">
		<div class="newlb">
			<ul>
			<!-- <li><a href="./?nshow/id/229.html"><span class="time fl">2017.07.30</span><span class="fl">hahhah </span></a></li> -->
			<c:forEach var="news" items="${page.list }" varStatus="vs">
				<li><a href="./?nshow/id/229.html"><span class="time fl"><fmt:formatDate type="date" value="${news.createTime }" /></span><span class="fl">${news.introduction }</span></a></li>
			</c:forEach> <!-- pattern="yyyy-MM-dd" -->
			</ul>
		</div>
	</div> --%>
	
	<div class="container">
    <input  type="hidden" value="10"  name="pageSize" />
    <input  type="hidden" value="${page.pageNum}" name="pageNo" />
  
    <label>新闻(按标题/名称等)模糊查询：</label>
    
    <input type="text" value="" name="fuzzyName" id="fuzzyName"/>
         
       
    <input type="submit" class="btn btn-primary" value="查询" onclick="searchButton()" />
    
      <a class="btn btn-primary" href="<%=basePath%>/admin/news/toAdd.do">添加</a>
      
     <div class="table-responsive">
	<table class="table table-hover">
		<caption></caption>
		<thead>
			<tr style="background-color: threedshadow;">
				<th>Id</th>
				<th>新闻标题</th>
				<th>新闻名称</th>
				<th>排序</th>
				<th>创建时间</th>
				<th>状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach varStatus="status" var="news" items="${page.list}">
			<tr>
				<td>${news.id }</td>
				<td>${news.title }</td>
				<td>${news.name }</td>
				<td>${news.sort }</td>
				<td><fmt:formatDate type="date" value="${news.createTime }" /></td>
				<th><c:if test="${news.status==1 }">
				      已下架
	
				     </c:if>
				     <c:if test="${news.status==0 }">
				      去下架
	
				     </c:if></th>
				<td>
				    <a class="btn" href="<%=basePath%>/admin/news/update.do?id=${news.id}">编辑</a>
				    <a class="btn" href="<%=basePath%>/admin/news/delete.do?id=${news.id}" >删除</a>
				</td>
			</tr>
		</c:forEach>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="10" style="text-align:center;">
					<div class="M-box1" style="float:left;"></div>
					<div style="float:right;">
					    总记录数：${page.total}&nbsp;&nbsp;
					    总页数：${page.pages}&nbsp;&nbsp;
					    每页行数：${page.pageSize}</div>
				</td>
			</tr>
		</tfoot>
	</table>
	</div> 
</div> 
	
	<!--page-->
<%-- 	<div class="pageNum">
	<div id="page_style"></div>
	<div class="ims_pager" mod="#page_style:1">{"tag":"pageNo","pageSize":"6","current_page":${page.pageNum},"last_page":${page.lastPage},"next_page":${page.nextPage},"up_page":${page.prePage},"total":${page.total}}</div>
	</div> --%>
	<!-- <div class="M-box1"></div> -->
	<!--page-->
	  <script>
	  // 
		$(function(){
			$('.M-box1').pagination({
			    totalData:${page.total},
			    pageCount:${page.pages},
			    showData:10, 
			    current:${page.pageNum},
			    keepShowPN:true, 
			    coping:false,
			    callback:function(api){
			        var page = api.getCurrent();
			        window.location.href="<%=request.getContextPath()%>/admin/news/list.do?pageNo="+page+"&pageSize="+10;
			    }    
		   });
		});
		
		function searchButton(){
			var fuzzyName = $("#fuzzyName").val();
			window.location.href = "<%=request.getContextPath()%>/admin/news/list.do?condition="+fuzzyName;
		}
		
	</script>
  </body>
</html>
