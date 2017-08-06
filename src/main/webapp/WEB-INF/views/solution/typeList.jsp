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
    
    <title>类型</title>
    
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
     <form action="/nrg/admin/solutionType/list.do"  onsubmit="return check();" method="post">
        <input  type="hidden" value="10"  name="pageSize" />
        <input  type="hidden" value="${pageBean.pageNo}" name="pageNo" />
      
        <label>类型名称：</label>
        
        <input type="text" value="" name="typeName" id="typeName"/>
         
       
      <button class="btn btn-primary"   onclick="searchButton()" >查询</button>
      
      <a class="btn btn-primary"     href="/nrg/admin/solutionType/add.do">添加</a>
     </form>
     <div class="table-responsive">
	<table class="table table-hover">
		<caption></caption>
		<thead>
			<tr style="background-color: threedshadow;">
				<th>Id</th>
				<th>类型名称</th>
				<th>排序</th>
				<th>创建人</th>
				<th>创建时间</th>
				<th>状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach varStatus="status" var="d" items="${pageBean.rows}">
			<tr>
				<td>${d.id }</td>
				<td>${d.typeName }</td>
				<td>${d.sort }</td>
				<td>${d.createdBy }</td>
				<td>${d.createdOn }</td>
				<th><c:if test="${d.isDeleted==1 }">
				      已下架
	
				     </c:if>
				     <c:if test="${d.isDeleted==0 }">
				      已上架
	
				     </c:if></th>
				<td>
				     <a  href="javascript:void(0)" data-id="${d.id }" class="batchDelete">删除</a>
				     <c:if test="${d.isDeleted==0 }">
				       <a  href="javascript:void(0)" data-id="${d.id }" class="delete">去下架</a>
				     </c:if>
				     <a  href="/nrg/admin/solutionType/update.do?id=${d.id }">修改</a>
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
		        window.location.href="/nrg/admin/solutionType/list.do?pageNo="+page+"&pageSize="+5;
		    }    
	   });
		
	   $('.batchDelete').click(function(){
		   var id = $(this).attr("data-id");
		   $.ajax({
	            type:"get",
			    url:"/nrg/admin/solutionType/remove.do",
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
			    url:"/nrg/admin/solutionType/delete.do",
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
  </body>
</html>
