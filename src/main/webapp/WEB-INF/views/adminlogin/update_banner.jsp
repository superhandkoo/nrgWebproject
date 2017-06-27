<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%> 
<%  
    String path = request.getContextPath();  
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
  <base href="<%=basePath%>"> 
<title></title>
<meta http-equiv="X-UA-Compatible" content="chrome=1"/>

<script type="text/javascript" src="static/umeditor1.2.3-utf8-jsp/third-party/jquery.min.js"></script>



   <link href="static/umeditor1.2.3-utf8-jsp/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
    
    <script type="text/javascript" src="static/umeditor1.2.3-utf8-jsp/third-party/template.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="static/umeditor1.2.3-utf8-jsp/umeditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="static/umeditor1.2.3-utf8-jsp/umeditor.min.js"></script>
    <script type="text/javascript" src="static/umeditor1.2.3-utf8-jsp/lang/zh-cn/zh-cn.js"></script>
    <script type="text/javascript" src="js/admin/jquery.uploadView.js"></script>

   
    
</head>
<body>


<!--style给定宽度可以影响编辑器的最终宽度-->


<div class="clear"></div>


<div class="pad20" style="background-color: #f0f0f0;">
		<form action="/springmvc/admin/Bannerupdate.do" method="post" id="saveCourseForm" data-validator-option="{stopOnError:false, timely:false}">
						<table style="line-height: 35px;"  >
			
			
						<tr>
					<td>课程简介:</td>
					<td style="text-align: left;">
						<input name="title"  data-rule="required;" value="${course.title}" type="text" style="width: 580px;" />
					</td>
				</tr>
				<tr>
					<td>课程图片：</td>
					<td style="text-align: left;">
					<div class="control-group js_uploadBox">
                  <div class="btn-upload">
                 <a href="javascript:void(0);"><i class="icon-upload"></i><span class="js_uploadText">上传</span>图片</a>
                 <input class="js_upFile" type="file" name="file"   id="file" />
             </div>
    
         <div class="js_showBox "><img class="js_logoBox" src="" width="100px"/></div>
              </div>					</td>
				</tr>
				<tr>
					<td>课程详情:</td>
					<td style="text-align: left;">
						<textarea name="describe" id="describe" data-rule="required;"></textarea>
					</td>
				</tr>

				
			</table>
		</form>
	</div>

<script type="text/javascript">

  window.onload=function(){
        // alert($("#content").html());
        $(".edui-body-container").eq(0).css("min-height","220px");
         $(".edui-body-container").eq(0).css("width","590px");
        $(".edui-container").eq(0).css("width","600px"); 
       
       
       }
    
    //实例化编辑器
    var um = UM.getEditor('describe');
   
    um.addListener('focus',function(){
        $('#focush2').html('')
    });
    //按钮的操作
    function insertHtml() {
        var value = prompt('插入html代码', '');
        um.execCommand('insertHtml', value)
    }
    function isFocus(){
        alert(um.isFocus())
    }
    function doBlur(){
        um.blur()
    }
    function createEditor() {
        enableBtn();
        um = UM.getEditor('myEditor');
    }
    function getAllHtml() {
        alert(UM.getEditor('myEditor').getAllHtml())
    }
    
    $(".js_upFile").uploadView({
	uploadBox: '.js_uploadBox',//设置上传框容器
	showBox : '.js_showBox',//设置显示预览图片的容器
	width : 100, //预览图片的宽度，单位px
	height : 100, //预览图片的高度，单位px
	allowType: ["gif", "jpeg", "jpg", "bmp", "png"], //允许上传图片的类型
	maxSize :2, //允许上传图片的最大尺寸，单位M
	success:function(e){
		$(".js_uploadText").text('更改');
	
		   var $form = document.createElement("form");  
                    //$form.action = "javascript:return true;";  
                    $form.method = "post";  
                    $form.enctype = "multipart/form-data";  
                    $form.style.display = "none"; 
                    $form.id="formbanner" ;
                    //将表单加当document上，  
                    document.body.appendChild($form);  //创建表单后一定要加上这句否则得到的form不能上传。document后要加上body,否则火狐下不行。  
                     $("#formbanner").append($("#file"));
                     $("#formbanner").form("submit",{
                     	url:"/springmvc/admin/BannerupdateImage.do",
                     	onSubmit:function(){
                     		return true;
                     	},success:function(){
                     		alert(1);
                     	}
                     });
		
	       /*   $.ajax({  
           type: "POST",  
           url: "/springmvc/admin/BannerupdateImage.do",  
           data:$("#formbanner").serialize(),  
           async: false,  
          error: function(request) {  
           alert("Connection error");  
          },  
            success: function(data) {  
        //接收后台返回的结果  
         }  
  });*/
		
		
		alert('图片上传成功');
	}
});

 
  function uploadImage() {
        //判断是否有选择上传文件
            var imgPath = $("#uploadFile").val();
            if (imgPath == "") {
                alert("请选择上传图片！");
                return;
            }
            //判断上传文件的后缀名
           // var strExtension = imgPath.substr(imgPath.lastIndexOf('.') + 1);
          //  if (strExtension != 'jpg' && strExtension != 'gif'
           // && strExtension != 'png' && strExtension != 'bmp') {
            //    alert("请选择图片文件");
              //  return;
         //   }
            $.ajax({
                type: "POST",
                url: "handler/UploadImageHandler.ashx",
                data: { imgPath: $("#uploadFile").val() },
                cache: false,
                success: function(data) {
                    alert("上传成功");
                    $("#imgDiv").empty();
                    $("#imgDiv").html(data);
                    $("#imgDiv").show();
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    alert("上传失败，请检查网络后重试");
                }
            });
        }
 
   
</script>

</body>
</html>
