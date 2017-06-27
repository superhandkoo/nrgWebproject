<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%> 
<%  
    String path = request.getContextPath();  
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
 %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	
	  <head>
         
		<meta http-equiv="content-type" content="text/html; charset=utf-8">
		 
         <script type="text/javascript" language="javascript" src="<%=basePath%>/js/admin/table/jquery-1.10.2.min.js"></script>
		  <link href="<%=basePath%>/css/admin/bootstrap.css" rel="stylesheet">
		 <link rel="stylesheet" type="text/css" href="<%=basePath%>/js/admin/table/css/bootstrap.min.css"> 
		<link rel="stylesheet" type="text/css" href="<%=basePath%>/js/admin/table/dataTables.bootstrap.css">
        <script src="<%=basePath%>/js/bootstrap.min.js"></script>
		<script type="text/javascript" language="javascript" src="<%=basePath%>/js/admin/table/jquery.dataTables.min.js"></script>
		<script type="text/javascript" language="javascript" src="<%=basePath%>/js/admin/table/dataTables.bootstrap.js"></script>
		<script type="text/javascript" charset="utf-8">
			$(document).ready(function() {
				$('#example').dataTable();
				$('.row').eq(1).empty();
				$('.row').eq(3).empty();
			} );
		</script>
		<style type="text/css">
		 .modal {
    background-clip: padding-box;
    background-color: #ffffff;
    border: 1px solid rgba(0, 0, 0, 0.3);
    border-radius: 6px;
    box-shadow: 0 3px 7px rgba(0, 0, 0, 0.3);
    left: 40%;
  
    overflow: auto;
    position: fixed;
    top: 50%;
    width: 560px;
    z-index: 1050;
}
.modal-body {
    min-height: 620px;
    overflow-y: auto;
    padding: 15px;
    
}
.modal.fade.in {
    top: 35%;
}

		</style>
	</head>
	<body>
		<div class="container">

<div id="example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">

<div class="row">
<div class="col-sm-12">
<table id="example" class="table table-striped table-bordered dataTable no-footer" cellspacing="0" width="100%" role="grid" aria-describedby="example_info" style="width: 100%;">
<thead><tr role="row">
<th class="sorting_asc" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 20%;">序列</th>
<th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 20%;">标题</th>
<th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Office: activate to sort column ascending" style="width: 20%;">内容</th>
<th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending" style="width: 10%;">状态</th>
<th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending" style="width: 10%;">顺序</th>
<th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending" style="width: 20%;">编辑</th></tr>

</thead>
<tbody>
  <c:forEach var="blist"  items="${blist }"   varStatus="status">
      
      <tr  role="row" class="odd">
        <td class="sorting_1">${status.index+1}</td>
        <td class="sorting_1">${blist.title }</td>
        <td class="sorting_1">${blist.describe }</td>
        <td class="sorting_1">${blist.typeId }</td>
        <td class="sorting_1">${blist.seriesNum }</td>
        <td class="sorting_1">删除 |<a data-toggle="modal"    data-target="#banner_update" class="btn btn-primary btn-large">编辑</a>
        <!-- 
        <a href="/springmvc/admin/toBannerupdate.do">编辑</a></td></tr>
      -->
    
    </c:forEach>

</tbody>
</table>
</div>
</div>
<div class="row">

<div class="col-sm-12">
<div class="dataTables_paginate paging_simple_numbers" id="example_paginate">
<ul class="pagination">
<li class="paginate_button previous disabled" id="example_previous">
<a href="#" aria-controls="example" data-dt-idx="0" tabindex="0">Previous</a></li>
<li class="paginate_button active"><a href="javascript:void(0)" aria-controls="example" data-dt-idx="1" tabindex="0">1</a></li>
<li class="paginate_button "><a  aria-controls="example" data-dt-idx="2" tabindex="0">2</a></li>
<li class="paginate_button "><a href="javascript:void(0)" aria-controls="example" data-dt-idx="3" tabindex="0">3</a></li>
<li class="paginate_button "><a href="javascript:void(0)" aria-controls="example" data-dt-idx="4" tabindex="0">4</a></li>
<li class="paginate_button "><a href="javascript:void(0)" aria-controls="example" data-dt-idx="5" tabindex="0">5</a></li>
<li class="paginate_button "><a href="javascript:void(0)" aria-controls="example" data-dt-idx="6" tabindex="0">6</a></li>
<li class="paginate_button next" id="example_next" aria-controls="example" data-dt-idx="7" tabindex="0"><a href="javascript:void(0)" aria-controls="example" data-dt-idx="7" tabindex="0">Next</a></li>
</ul></div></div></div></div>
			
		</div>
		
		
 <!-- 编辑模态框 -->	
 <div class="container">
    <div id="banner_update"  style="margin-bottom: 80px;width: 75%;" class="modal fade" >
        
      
        <div class="modal-body">
          <iframe  id="iframeq_windows"  src="/springmvc/admin/toBannerupdate.do" style="width:100%;height:600px;border: none;">
          </iframe>       
</div>
        <div class="modal-footer">
            <a href="#" class="btn btn-success" onclick="saveCourse()">唤醒活动</a>
            <a href="#" class="btn" data-dismiss="modal">关闭</a>
        </div>
    </div>
</div>


	<script type="text/javascript">
	// For demo to fit into DataTables site builder...
	$('#example')
		.removeClass( 'display' )
		.addClass('table table-striped table-bordered');
		
		
		  function  saveCourse(){
  alert(123);
  var child = document.getElementById("iframeq_windows").contentWindow;
  child.document.getElementById("saveCourseForm").submit();
   
 };
</script>
	
</body></html>
