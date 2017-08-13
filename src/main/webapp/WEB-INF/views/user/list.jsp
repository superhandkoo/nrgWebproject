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
    
    <title>用户列表</title>
    
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
<div class="container">
     <form action="/nrg/admin/user/list.do" method="post">
        <input  type="hidden" value="10"  name="pageSize" />
        <input  type="hidden" value="${pageBean.pageNo}" name="pageNo" />
      
        <label>用户名：</label>
        <input type="text" value="" name="name" id="name"/>
        &nbsp;&nbsp;
        
        <label>手机号：</label>
        <input type="text" value="" name="mobile" id="mobile"/>
        &nbsp;&nbsp;
        
        <label>工号：</label>
        <input type="text" value="" name="jobNumber" id="jobNumber"/>
        &nbsp;&nbsp;
       
      <button class="btn btn-primary"   onclick="searchButton()" >查询</button>
      <!--  
      <a class="btn btn-primary"     href="/nrg/admin/user/add.do">添加</a>
      -->
     </form>
     <div class="table-responsive">
	<table class="table table-hover">
		<caption></caption>
		<thead>
			<tr style="background-color: threedshadow;">
				<th>Id</th>
				<th>用户名</th>
				<th>工号</th>
				<th>手机号</th>
				<th>创建时间</th>
				<th>状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		
			<c:forEach varStatus="status" var="d" items="${pageBean.rows}">
			<tr>
				<td>${d.userId }</td>
				<td>${d.name }</td>
				<td>${d.jobNumber }</td>
				<td>${d.mobile }</td>
				<td>${d.addtime }</td>
				<td><c:if test="${d.isDelete==1 }">
				      已下架
	
				     </c:if>
				     <c:if test="${d.isDelete==0 }">
				      已上架
	
				     </c:if></td>
				<td>
				     <a  href="javascript:void(0)" data-id="${d.userId }" class="batchDelete">删除</a>
				     <c:if test="${d.isDelete==0 }">
				       <a  href="javascript:void(0)" data-id="${d.userId }" class="delete">去下架</a>
				     </c:if>
				</td>
			</tr>
		</c:forEach>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="10" style="text-align:center;">
					<div class="M-box1" style="float:left;"></div>
					<div style="float:right;">
					    总行数：${pageBean.total}&nbsp;&nbsp;
					    总页数：${pageBean.pages}&nbsp;&nbsp;
					    每页行数：${pageBean.pageSize}</div>
				</td>
			</tr>
		</tfoot>
	</table>
	</div> 
</div> 
<script>
     
	$(function(){
		$('.M-box1').pagination({
		    totalData:${pageBean.total},
		    pageCount:${pageBean.pages},
		    showData:5,
		    current:${pageBean.pageNo},
		    keepShowPN:true, 
		    coping:false,
		    isHide:true,
		    callback:function(api){
		        var page = api.getCurrent(); 
		        window.location.href="/nrg/admin/user/list.do?pageNo="+page+"&pageSize="+5;
		    }    
	   });
		
	   $('.batchDelete').click(function(){
		   var id = $(this).attr("data-id");
		   $.ajax({
	            type:"get",
			    url:"/nrg/admin/user/remove.do",
			    contentType : "application/json;charset=UTF-8",
			    data:{"id":id},
			    success:function(data){
			        if(data=="success"){
			        	alert(data);
			        	location.reload();
			        }else{
			        	alert(data);
			        }
			         
			    },
			    error : function(XMLHttpRequest, textStatus, errorThrown) {
			     
			    }
	        });
	   });
	   
       $('.delete').click(function(){
    	   var id = $(this).attr("data-id");
    	   $.ajax({
	            type:"get",
			    url:"/nrg/admin/user/delete.do",
			    contentType : "application/json;charset=UTF-8",
			    data:{"id":id},
			    success:function(data, textStatus){
			    	if(data=="success"){
			        	alert(data);
			        	location.reload();
			        }else{
			        	alert(data);
			        }
			    },
			    error : function(XMLHttpRequest, textStatus, errorThrown) {
			     
			    }
	        });
		   
	   });
	});
	

	
</script>
  </body>
</html>
