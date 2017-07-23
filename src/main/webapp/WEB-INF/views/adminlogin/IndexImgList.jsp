<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/public/header_top.jsp"%>
<%@include file="/WEB-INF/public/header_middle.jsp"%>
<script type="text/javascript">
if('${msg}'!=null&&'${msg}'>0&&'${msg}'!=""){
 alert("成功");
}
if('${msg}'!=null&&'${msg}'==0&&'${msg}'!=""){
 alert("操作失败，请稍后操作");
}
  function searchButton() {
	  $("#searchForm").submit();
	  
}
  
 function sNumber_Stauts(imageId,seriesNumber) {
	 
	$.ajax({
		url:"updatImgStauts.do",
	    type: 'get',
	    data:{'imageId':imageId,'seriesNumber':seriesNumber},
	    
	    success:function(data){
	       
	    
	    	if(data!="0"){
	    		alert("编辑成功");
	    		window.location.reload();
	    		
	    	}
	    	
	    	
	    }
		
	});
 }
	// href="/nrg/admin/toBannerupdate.do" 
	function img_upate(imgId){
		window.location.href="/nrg/admin/toBannerupdate.do?imgId="+imgId;	
	}
    
  function addImg(){
  alert(123);
		window.location.href="/nrg/admin/toAddImg.do";	
	}
    
  
  
</script>
<div class="container">
     <form action="<%=request.getContextPath()%>/admin/BannerSearch.do"  id="searchForm" >
        <input  type="hidden" value="5"  name="pageSize" />
        <input  type="hidden" value="${pageBean.pageNo}" name="pageNo" />
      <select  name="images.typeId">
     
          <option value="0">选择图片种类</option>
          <option value="1">首页banner图</option>
          <option value="2">第二部分轮转图</option>
          <option value="3">第三部分展示图</option>
          <option value="4">待定</option>
          
    
        
	  
      </select> 
        <select  name="images.seriesNumber">
     
          <option value="0">选择图片状态</option>
          <option value="1">上架</option>
          <option value="2">下架</option>
       
          
    
        
	  
      </select>   
      <button class="btn btn-primary"   onclick="searchButton()" >查询</button>
      
      <a class="btn btn-primary"     href="/nrg/admin/toAddImg.do">添加</a>
     </form>
     <div class="table-responsive">
	<table class="table table-hover">
		<caption></caption>
		<thead>
			<tr style="background-color: threedshadow;">
				<th width="5%"  >Id</th>
				<th width="8%">图片地址</th>
				<th width="9%">链接地址</th>
				<th width="5%">标题</th>
				<th width="8%">类别</th>
				<th width="8%">状态</th>
				<th width="10%">previewUrl</th>
				<th width="5%">color</th>
				<th width="8%">describe</th>
				<th width="5%">sort</th>
				<th width="20%">操作</th>
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
				<td>
				     <a    href="javascript:void(0)"  onclick="img_upate('${d.imageId}')"  >编辑</a>
				     <c:if test="${d.seriesNumber==1 }">
				      <a   href="javascript:void(0)"  onclick="sNumber_Stauts('${d.imageId}',0)"  >上架</a>
	
				     </c:if>
				     <c:if test="${d.seriesNumber==0 }">
				      <a  href="javascript:void(0)"   onclick="sNumber_Stauts('${d.imageId}',1)"  >下架</a>
	
				     </c:if>
				    			</td>
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
		        window.location.href="<%=request.getContextPath()%>/admin/BannerList.do?pageNo="+page+"&pageSize="+5;
		    }    
	   });
	});
</script>
<%@include file="/WEB-INF/public/footer_bottom.jsp"%>