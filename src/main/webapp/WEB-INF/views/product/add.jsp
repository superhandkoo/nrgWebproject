<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'add.jsp' starting page</title>
    
	  
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

    <link rel="stylesheet" href="js/easyform/css/platform-1.css">
    <link rel="stylesheet" href="js/easyform/easyform.css">

    <link rel="stylesheet" href="js/easyform/css/tab.css">
    <script src="js/easyform/jquery-2.1.0.min.js"></script>
    <script src="js/easyform/easyform.js"></script>
  </head>
  
  <body>

	
  <div class="form-div">
        <form id="reg-form" action="/nrg/admin/product/add.do" method="post">
            <table>
                <tr>
                    <td>产品名称</td>
                    <td><input name="name" type="text"
                               data-easyform="length:4 100;"
                               data-message="名称需在4-100字节之间"
                               data-easytip="class:easy-blue;" data-message-ajax="字符超出范围!">
                    </td>
                </tr>
                <tr>
                    <td>产品类型</td>
                    <td><input id="type" name="type" type="text" ></td>
                </tr>
                <tr>
                    <td>详细介绍</td>
                    <td><textarea name="introduction" style="height:100px;width: 268px;" ></textarea>
                    </td>
                </tr>
                <tr>
                    <td>图片地址</td>
                    <td><input name="imageurl" type="text" >
                               </td>
                </tr>
                <tr>
                    <td>产品链接</td>
                    <td><input name="address" type="text" ></td>
                </tr>
                <tr>
                    <td>产品内容</td>
                    <td><textarea name="html" style="height:400px;width: 268px;" ></textarea>
                    </td>
                </tr>
                <tr>
                    <td>排序</td>
                    <td>
                    <select  name="sort"> 
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
        <option value="6">6</option>
        <option value="7">7</option>
        <option value="8">8</option>
        <option value="9">9</option>
        <option value="10">10</option>
      </select>
                    </td>
                </tr>
            </table>

            <div class="buttons" style="margin-top: 50px;">
                <input value="添加" type="submit" style="margin-right:20px; margin-top:20px;">
                <input value="重置" type="reset" style="margin-right:20px; margin-top:20px;">
            </div>

            <br class="clear">
        </form>
    </div>
    <script>
   $(document).ready(function ()
    {
        var v = $('#reg-form').easyform();
        v.is_submit = false;

        v.error = function (ef, i, r)
        {
            //console.log("Error事件：" + i.id + "对象的值不符合" + r + "规则");
        };

        v.success = function (ef)
        {
            //console.log("成功");
        };

        v.complete = function (ef)
        {
            console.log("完成");
        };
    });
   function ajax_demo(p)
   {
       $("#uid").trigger("easyform-ajax", true);
   }
   </script>
  </body>
</html>

