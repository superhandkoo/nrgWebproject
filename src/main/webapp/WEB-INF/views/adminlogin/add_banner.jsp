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
<meta http-equiv="X-UA-Compatible" content="chrome=1" />

<script type="text/javascript" src="js/admin/jquery-2.1.0.js"></script>



<link
	href="static/umeditor1.2.3-utf8-jsp/themes/default/css/umeditor.css"
	type="text/css" rel="stylesheet">
<link rel="stylesheet" href="css/cropper.css" />
<link rel="stylesheet" href="css/cropperindex.css" />
<script type="text/javascript"
	src="static/umeditor1.2.3-utf8-jsp/third-party/template.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="static/umeditor1.2.3-utf8-jsp/umeditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="static/umeditor1.2.3-utf8-jsp/umeditor.min.js"></script>
<script type="text/javascript"
	src="static/umeditor1.2.3-utf8-jsp/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" src="js/admin/jquery.uploadView.js"></script>
<script type="text/javascript" src="js/admin/jquery-form.js"></script>
<script type="text/javascript" src="js/admin/cropper.js"></script>
<script type="text/javascript" src="js/admin/upImg.js"></script>


</head>
<body>


	<!--style给定宽度可以影响编辑器的最终宽度-->


	<div class="clear"></div>


	<div class="pad20" style="background-color: #f0f0f0;">
		<form action="/nrg/admin/AddImg.do" method="post"
			id="saveForm"
			data-validator-option="{stopOnError:false, timely:false}">
			
			<input  type="hidden"  name="images.imageUrl"   id="imageUrl"     value="" />
			
			<table style="line-height: 35px;">


				<tr>
					<td>图片标题:</td>
					<td style="text-align: left;"><input name="images.title"
						data-rule="required;" value="" type="text"
						style="width: 680px;height: 50px" /></td>
				</tr>
				<tr id="remove">
					<td>图片：(点击图片可以更换)</td>
					<td style="text-align: left;">
						<div id="content">

							<div class="SeeCont">

								<div class="SeeImg image_container TxText xzBtn"
									id="imgReplaceBtn">
									<img class="myimg" src='' id="file" />
                                    
								</div>


							</div>

						</div></td>
					<tr>
						<td>图片种类:</td>
						<td style="text-align: left;"><select name="images.typeId">


								<option value="1">首页banner图</option>
								<option value="2">第二部分轮转图</option>
								<option value="3">第三部分展示图</option>
								<option value="4">待定</option>




						</select></td>
					</tr>
					<tr>
						<td>选择排序:</td>
						<td style="text-align: left;"><select name="images.sort">


								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>




						</select></td>
					</tr>
				</tr>
				<tr>
					<td>图片种类:</td>
					<td style="text-align: left;"><textarea name="images.describe"
							id="describe" data-rule="required;"
							style="width: 680px;height: 150px"></textarea></td>
				</tr>
				<tr>
					<td>图片链接:</td>
					<td style="text-align: left;" ><input  type="text" /></td>
				</tr>
				
			
			</table>
				
                   <input  type="button"  onclick="history.go(-1);" class="btn btn-primary" value="取消"/>
			       <input  type="submit"   onclick="saveFormSubmit()"  class="btn btn-primary" value="提交"/>
			
			
		</form>
	</div>
	<iframe name="posthere" frameborder=0 width=0 height=0></iframe>
	<script type="text/javascript">


	upImg(1/1)
	var upImgageToken=''
	
  window.onload=function(){
        // alert($("#content").html());
        $(".edui-body-container").eq(0).css("min-height","220px");
         $(".edui-body-container").eq(0).css("width","590px");
       
        $(".edui-container").eq(0).css("width","600px"); 
      
       
       }
       function saveFormSubmit(){
       	
         $("#saveForm").submit();
       
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
    
   
    /**
     * @param base64Codes
     *            图片的base64编码
     */
    function img_upload(){
    	
    	var base64Codes=$("#file").attr("src");
    	
        $.ajax({
            url : "/nrg/admin/BannerupdateImage.do",
            type : "POST",
            data : {'imageName':base64Codes},
            
           
            
            success:function(data){
            var datas=data.split(",");
            	if(datas[0]=="1"){
            	
            	    $("#imageUrl").val(datas[1]);
            		alert("上传成功");
            		
            	}else{
            		alert("系统出现错误，请稍后在上传");
            	}
            }
          
          
        });
    }

    /**
     * 将以base64的图片url数据转换为Blob
     * @param urlData
     *            用url方式表示的base64图片数据
     */
    function convertBase64UrlToBlob(urlData){
        
        var bytes=window.atob(urlData.split(',')[1]);        //去掉url的头，并转换为byte
        
        //处理异常,将ascii码小于0的转换为大于0
        var ab = new ArrayBuffer(bytes.length);
        var ia = new Uint8Array(ab);
        for (var i = 0; i < bytes.length; i++) {
            ia[i] = bytes.charCodeAt(i);
        }

        return new Blob( [ab] , {type : 'image/png'});
    }

 
  
   
</script>

</body>
</html>

