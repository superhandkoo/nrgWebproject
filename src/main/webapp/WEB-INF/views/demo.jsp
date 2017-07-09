<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../public/header_top.jsp"%>
<%@include file="../public/header_middle.jsp"%>
<div class="container">
安全而
	<table class="table table-bordered">
		<caption>图片表中的数据</caption>
		<thead>
			<tr>
				<th>imageId</th>
				<th>imageUrl</th>
				<th>linkAddress</th>
				<th>title</th>
				<th>typeId</th>
				<th>seriesNumber</th>
				<th>previewUrl</th>
				<th>color</th>
				<th>describe</th>
				<th>sort</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach varStatus="status" var="d" items="${pageBean.rows}">
			<tr>
				<td>${d.imageId }</td>
				<td>${d.imageUrl }</td>
				<td>${d.linkAddress }</td>
				<td>${d.title }</td>
				<td>${d.typeId }</td>
				<td>${d.seriesNumber }</td>
				<td>${d.previewUrl }</td>
				<td>${d.color }</td>
				<td>${d.describe }</td>
				<td>${d.sort }</td>
			</tr>
		</c:forEach>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="10" style="text-align:center;">
					<div class="M-box1"></div>
				</td>
			</tr>
		</tfoot>
	</table>
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
		    callback:function(api){
		        var page = api.getCurrent(); 
		        window.location.href="<%=request.getContextPath()%>/demo/img.do?pageNo="+page+"&pageSize="+5;
		    }    
	   });
	});
</script>
<%@include file="../public/footer_bottom.jsp"%>