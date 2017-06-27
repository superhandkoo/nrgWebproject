var subjectList;
var setting = {
	view : {
		showLine : true,
		showIcon : true,
		selectedMulti : false
	},
	data : {
		simpleData : {
			enable : true,
			idKey : 'kpointId',
			pIdKey : 'parentId',
			rootPid : ''
		},
		key : {
			name : 'name',
			title : 'name'
		}
	},
	callback : {
		onClick:seleSubject
	}
};
$(function() {
	/*initSimpleImageUpload('fileuploadButton', 'teacher', callback);
	subjectList = eval('('+subjectList+')');
	var treeObj = $.fn.zTree.init($("#ztreedemo"), setting, subjectList);*/
});
function getTree(courseId){
	alert(courseId);
	$.ajax({
		type:"post",
		url:path+"/front/ajax/getCourseKPoint/"+courseId,
		async : false,
		dataType:"json",
		success:function(data){
			var treeObj = $.fn.zTree.init($("#ztreedemo"), setting, data);
		}
	});
}

function callback(imgUrl) {
	$("#imagesUrl").val(imgUrl);
	$("#subjcetpic").attr("src", imagesPath + imgUrl);
}

/**
 * 选择专业
 */
function seleSubject(event, treeId, treeNode){
	$("#subjectId").val(treeNode.subjectName);
	$("input[name='teacher.subjectId']").val(treeNode.subjectId);
	$("#ztreedemo").hide();
}

/**
 * 显示专业组件
 */
function showSubjectList(){
	$("#ztreedemo").show();
}
