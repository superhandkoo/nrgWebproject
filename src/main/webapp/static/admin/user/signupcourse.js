var subjectList;
$(function(){
	$("#levelId").change(function() {
		alert("选择修改");
/*		var levelId2=$("#levelId").children().eq(1).html();//第二级
		alert(levelId2);
		var levelId3=$("#levelId").children().eq[2].html();//第三级
		alert(levelId3);*/
		var subjectId = $("input[name='course.subjectId']").val();
		if(subjectId<=0){
			alert("请选择课程专业");
			return false;
		}
		$.ajax({
			type : "POST",
			async : false,
			url :  "/admin/cou/getCoursesBySubjectId",
			data:{"subjectId":subjectId},
			dataType:"json",
			success : function(Courses, tst, jqXHR) {
				//alert(CourseKpoints.length);
				if(Courses.length>0){
					$("#courses").empty();								
					var str="";
					for(var i = 0 ; i<Courses.length; i++){
						str+="<option value=\""+Courses[i].courseId+"\" lessionNum=\""+Courses[i].lessionNum+"\">"+Courses[i].courseName+"</option>";
					}
					$("#courses").append(str);
					$("#courses").show();
				}else{
					$("#courses").hide();
				}

			},
			error : function(jqXHR, textStatus) {
				//util.error("操作失败请稍后尝试");
			}
		});
});
});
/**
 * 图片上传回调
 * @param imgUrl 图片路径
 */
function callback(imgUrl){
	$("input[name='course.logo']").val(imgUrl);
	$("#showImage").attr('src',imagesPath+imgUrl);
}

/**
 * 选择讲师后的回调 
 * @param tcArr 讲师数组
 */
function addTeahcerList(tcArr){
	var pList = $("#teacherList p");
	var ids = $("input[name='teacherIdArr']").val();
	var tcHtml='';
	var tcIds='';
	for(var i=0;i<tcArr.length;i++){
		if(pList!=null && pList.length>0){
			for(var j=0;j<pList.length;j++){
				var id = $(pList[j]).attr('id');
				if(id==tcArr[i].id){
					$(pList[j]).remove();
					ids= ids.replace(id+',','');
				}
			}
		}
		tcIds+=tcArr[i].id+',';
		tcHtml+='<p id="'+tcArr[i].id+'" style="margin: 0 0 0em;">'+tcArr[i].name+'&nbsp;&nbsp;<a href="javascript:void(0)" onclick="deleteTc('+tcArr[i].id+')">删除</a></p>';
	}
	$("input[name='teacherIdArr']").val(tcIds+ids);
	$("#teacherList").append(tcHtml);
}

/**
 * 删除老师
 * @param tcId 老师ID
 */
function deleteTc(tcId){
	$("#teacherList #"+tcId).remove();
	var ids = $("input[name='teacherIdArr']").val();
	ids= ids.replace(tcId+',','');
	$("input[name='teacherIdArr']").val(ids);
}


/**
 * 保存报名课程
 */
function SignUpCourse(){
	var subjectId = $("input[name='course.subjectId']").val();
	var courseId=$("#courses option:selected").val();
	var userId=$("#userId").val();
	if(subjectId<=0){
		alert("请选择课程专业");
		return false;
	}
	$.ajax({
		type : "POST",
		async : false,
		url :  "/admin/cou/signupMyCourse",
		data:{"courseId":courseId,
			"userId":userId},
		success : function(data) {
			//alert(data);
			if(data=="1"){
				alert("报名课程成功");
			}else{
				alert("您已报名此课程");
			}
window.location.href="/admin/user/getuserList";
		},
		error : function(jqXHR, textStatus) {
			//util.error("操作失败请稍后尝试");
		}
	});
	//$("#saveCourseForm").submit();
}

/**
 * 有效期类型change事件
 */
function losetypeShow() {
	$("#losetype").change(function() {
		$(".loseTimeShow").hide();
		$(".endTimeShow").hide();
		if ($(this).val() == 1) {
			$(".loseTimeShow").show();
			$("#endTime").val('');
		}
		if ($(this).val() == 0) {
			$(".endTimeShow").show();
			$("#loseTime").val('');
		}
	});
}
