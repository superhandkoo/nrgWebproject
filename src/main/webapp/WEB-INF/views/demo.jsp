<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../public/header_top.jsp"%>
<%@include file="../public/header_middle.jsp"%>


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
		<c:forEach varStatus="status" items="d">
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
</table>
<%@include file="../public/footer_bottom.jsp"%>