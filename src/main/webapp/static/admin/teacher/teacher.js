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
			idKey : 'subjectId',
			pIdKey : 'parentId',
			rootPid : ''
		},
		key : {
			name : 'subjectName',
			title : 'subjectName'
		}
	},
	callback : {
		onClick:seleSubject
	}
};
$(function() {
	initSimpleImageUpload('fileuploadButton', 'teacher', callback);
	subjectList = eval('('+subjectList+')');
	var treeObj = $.fn.zTree.init($("#ztreedemo"), setting, subjectList);
});


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
/**
 * 保存讲师信息
 */
function teacherFormSubmit() {
	checkMobile();
	var mobile=$("input[name='teacher.mobile']").val();
	if(mobile==""||mobile==undefined||mobile==null){
		alert("填写的手机号为空");
		return false;
	}
	var subjectId = $("input[name='teacher.subjectId']").val();
	if(subjectId<=0){
		alert("请选择讲师专业！");
		return false;
	}
	
	$("#saveTeacherForm").submit();
}

function checkMobile(){
	$(".correctMob").hide();
	$(".errorMob").hide();
	$(".unreMob").hide();
	var reg=/^(13[0-9]|15[012356789]|18[012356789]|14[57]|17[012356789])[0-9]{8}$/; //验证手机正则
	var mobile=$("input[name='teacher.mobile']").val();
	var mesflag=0;
	if(flag==2){
		var orginalMobile=$("#orginMobile").val();
		if(orginalMobile==mobile){
			//是原来的手机号
			mesflag=1;
		}
	}
	if(reg.test(mobile)==false){//格式不正确
		$(".unreMob").show();
		return;
	};
	var url="/admin/checkMobile";
	$.ajax({
		url:url,
		type :'post',
		data : {
			"mobile" : mobile
		},
		dataType :'json',
		success:function(result){
			if(result.success==false){
				//重复了
				if(mesflag==0){
					$(".errorMob").show();
					$(".unreMob").hide();
					return false;
				}else{
					//是原手机号
					$(".correctMob").show();
					$(".unreMob").hide();
					$("#mobilecheck").val(1);
				}
			}else{
				$(".correctMob").show();
				$(".unreMob").hide();
				$("#mobilecheck").val(1);
			}
		}
	});
}




