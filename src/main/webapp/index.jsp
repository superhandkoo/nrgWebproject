<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	response.setContentType("text/html;charset=UTF-8");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<jsp:include page="base.jsp" />
<html lang="en">  

<head>
<base href="<%=basePath%>">

<title>瑞兰德· 您身边的楼宇暖通能源科技专家</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="瑞兰德· 您身边的楼宇暖通能源科技专家">
<meta name="description" content="瑞兰德· 您身边的楼宇暖通能源科技专家">
<link href="style/gy.css" rel="stylesheet" type="text/css" />
<link href="style/css.css" rel="stylesheet" type="text/css" />
<link href="style/demo.css" rel="stylesheet" type="text/css" />
<link href="style/sodli.css" rel="stylesheet" type="text/css" />
<script src="js/js.js"></script>
<script language="javascript" type="text/javascript"
	src="js/jquery.SuperSlide.2.1.1.js"></script>
<script language="javascript" type="text/javascript" src="js/note.js"></script>

<script src="js/js2.js"></script>
<script type="text/javascript" src="js/banner.js"></script>

<!--  -->
<script type="text/javascript">
$(document).ready(function(){
	//alert(123);
	 $.ajax({
			url:"Image/banner.do",
		    type: 'POST',
		    
		    
		    success:function(data){
		    alert(data);
		    var  data1= eval( '(' + data + ')' );
		    var n1=0;
		    var n2=0;
		    var n3=0;
		    var n4=0;
		    alert(data1[1]);
		    $.each(data1,function(index,iteam){
		    	
		       if(iteam.typeId==1){
		    	   alert(1)
		    	   n1++;
		        	//$("#img_box").append("<a  href='"+iteam.linkAddress+"'    target='_blank'><img id='img"+(index+1)+"' src='"+iteam.imageUrl+"' /></a>")
		        	//$("#imgthumb_box").append("<a  href='' class='thumblink' id='imglink"+(index+1)+"' ><img width='1280' height='527'  src='"+iteam.imageUrl+"' /></a>")
		            $("#img_box img").eq(n1).attr("src",iteam.imageUrl);
		            $("#imgthumb_box img").eq(n1).attr("src",iteam.imageUrl);
		       }
               if(iteam.typeId==2){
            	  
            	 
		            $("#second_2").append(" <li><img src='"+iteam.imageUrl+"' width='306' height='141' />"+
		            "<div class='tabwz' style='background:url("+iteam.imageUrl+");'>"+
		             "<div class='tabt'>"+iteam.title+"</div>"+
		            "<div class='taba fr'><a href='?solution/tid/257/id/333'>了解更多</a> </div></li>");
		        // alert(   $("#second_2 img").eq(n2).attr("src"));
		           // $("#second_2 .tabwz").eq(n2).style("background","url("+iteam.imageUrl+")");
		          //  $("#second_2 .tabt").eq(n2).html(iteam.title);
		            n2++;
		         }
               if(iteam.typeId==3){
            	   n3++;
            	   $("#img_box img").eq(index).attr("src",iteam.imageUrl);
		            $("#imgthumb_box img").eq(index).attr("src",iteam.imageUrl);
                    }
               if(iteam.typeId==4){
            	   n4++;
            	   $("#img_box img").eq(index).attr("src",iteam.imageUrl);
		            $("#imgthumb_box img").eq(index).attr("src",iteam.imageUrl);
                  }
		    	
		    })
		    	
		    	
		    	
		    	
		    }
	        
		 });
	});   
</script>
</head>
  
<body>
	<!--banner-->
<div class="banner">

<div id="lanrenzhijia">
      

      <div id="img_lanrenzhijia">
          <div id="img_box">
                 <a href="?into/id/267.html" target="_blank"><img id="img1" src="asset/upload/1.jpg" /></a>
              <a href="http://www.hailin.com/?prshow/id/117.html" target="_blank"><img id="img2" src="asset/upload/2.jpg" /></a>
              <a href="http://www.hailin.com/?product/tid/203/id/213.html" target="_blank"><img id="img3" src="asset/upload/3.jpg" /></a>
            <div style="clear:both;"></div>
        </div>
      
     <div id="imgthumb_box"> 
 <a href="" class="thumblink" id="imglink1"><img src="asset/upload/1.jpg" width="1280" height="527" /></a>
<a href="" class="thumblink" id="imglink2"><img src="asset/upload/2.jpg" width="1280" height="527" /></a>
<a href="" class="thumblink" id="imglink3"><img src="asset/upload/3.jpg" width="1280" height="527" /></a> 
       </div>
      
      </div>
      
  </div>
<!--news-->
<div class="news">
<div class="new">
<div class="newslb" id="demo">
<ul>
<li><a href="">公司简介</a></li>
<li><a href="">空净市场</a></li>
<li><a href="">黑马 市场</a></li>
<li><a href="">新风系统</a></li>
<li><a href="">前景广阔</a></li>
<li><a href="">规划</a></li>
<li><a href="">两大问题</a></li>
</ul>
</div>
</div>
</div>
<!--news-->


</div>
<!--banner-->

<div class="h20"></div>

<!--内容-->
<div class="con">
<!--tab-->
<div class="tab">
<div class="indexPart5">
<div class="wal2">
    
      <div class="list2">
        <ul id="second_2">
         <!--     <li><img src="http://www.hailin.com/asset/mxupload/up0007359001473154582.jpg" width="306" height="141" />
           <div class="tabwz" style="background:url(asset/mxupload/up0960309001473151623.jpg);">
           <div class="tabt">海林中央空调节能控制系统</div>
           <div class="taba fr"><a href="?solution/tid/257/id/333">了解更多</a></div>
           </div></li>
           <li><img src="http://www.hailin.com/asset/mxupload/up0944647001473154570.jpg" width="306" height="141" />
           <div class="tabwz" style="background:url(http://www.hailin.com/asset/mxupload/up0397538001473151613.jpg);">
           <div class="tabt">海林供热采暖节能控制系统</div>
           <div class="taba fr"><a href="?solution/tid/258/id/339">了解更多</a></div>
           </div></li>
           <li><img src="http://www.hailin.com/asset/mxupload/up0376112001473146503.jpg" width="306" height="141" />
           <div class="tabwz" style="background:url(http://www.hailin.com/asset/mxupload/up0147301001473151604.jpg);">
           <div class="tabt">海林城市太阳能热水系统</div>
           <div class="taba fr"><a href="?solution/tid/259/id/265">了解更多</a></div>
           </div></li>
           <li><img src="http://www.hailin.com/asset/mxupload/up0099598001460973915.jpg" width="306" height="141" />
           <div class="tabwz" style="background:url(http://www.hailin.com/asset/mxupload/up0740836001473151595.jpg);">
           <div class="tabt">海林全面水力平衡系统</div>
           <div class="taba fr"><a href="http://www.hailin.com/?solution/tid/260/id/349">了解更多</a></div>
           </div></li>
           <li><img src="http://www.hailin.com/asset/mxupload/up0108379001473147414.jpg" width="306" height="141" />
           <div class="tabwz" style="background:url(http://www.hailin.com/asset/mxupload/up0771780001473151583.jpg);">
           <div class="tabt">海林建筑能耗监测与节能控制系统</div>
           <div class="taba fr"><a href="http://www.hailin.com/?solution/tid/347/id/348.html">了解更多</a></div>
           </div></li> -->
        </ul>
      </div>
      <a href="javascript:;" class="prev"></a>
      <a href="javascript:;" class="next"></a></div>
</div>
</div>
<script type="text/javascript">
//jQuery(".indexPart5").slide({mainCell:".list ul",autoPage:true,effect:"leftLoop",autoPlay:true});
jQuery(".wal2").slide({mainCell:".list2 ul",autoPage:true,scroll:1,effect:"leftLoop",autoPlay:false,vis:3});

jQuery(".news").slide({mainCell:".newslb ul",autoPage:true,scroll:1,effect:"leftLoop",autoPlay:true,vis:3});
</script>
<!--tab end-->

<div class="h20"></div>

<!--center-->
<div class="center">
<!--滑动-->
<div class="graybg">
  <div class="recommend">



    <div class="recommond">
        <div class="slider">
      <div class="item "  >
                <div class="para i1">
                    <b></b>

                    <div class="main">
                        <h3>管理</h3>
                        <p>留白</p>
                        <a href='http://www.hailin.com/?nshow/id/147.html' target="_blank">了解更多</a>
                    </div>
                </div>
                <img src="asset/upload/s1.jpg" width="290" height="250" />
            </div>
      <div class="item "  >
                <div class="para i2">
                    <b></b>

                    <div class="main">
                        <h3>管理</h3>
                        <p>留白</p>
                        <a href='http://www.hailin.com/?nshow/id/209.html' target="_blank">了解更多</a>
                    </div>
                </div>
                <img src="asset/upload/s3.jpg" width="290" height="250" />
            </div>
      <div class="item active" style='width: 560px;' >
                <div class="para i3">
                    <b></b>

                    <div class="main">
                        <h3>管理</h3>
                        <p>留白</p>
                        <a href='http://www.hailin.com/?nshow/id/220.html' target="_blank">了解更多</a>
                    </div>
                </div>
                <img src="asset/upload/s3.jpg" width="290" height="250" />
            </div>

        </div>
    </div>
</div>

</div>
<!--滑动-->




</div>
<!--center-->


<div class="h20"></div>

<div class="bot">
<ul>
<li>
<a href="?nshow/id/19.html"><img src="http://www.hailin.com/asset/mxupload/up0493619001474161713.jpg" />
<div class="botbj" style="background:#649b04;">
<div class="botwz">
<strong>生活的温暖解救-浅谈地暖控制</strong>
<div style="line-height:2;"><span style="color:#FFF0F5">
<span style="font-family:lucida sans unicode,lucida grande,sans-serif">
<span style="font-size:11px">地暖是地板辐射采暖的简称，英文为Radiant Floor Heating，是以整个地面为散热器，通过地板辐射层中的热媒，均匀加热整个地面，利用地面自身的蓄热和热量向上辐射的规律由下至上进行传导，来达到取暖的目的。</span></span></span></div>
</div>
<div class="bota fr"><img src="images/bot.png" /></div>
</div>
</a>
</li>
<li><a href="http://www.hailin.com/?prshow/id/118.html"><img src="asset/upload/11.png" /></a></li>
<li style="padding-right:0px;"><a href="?video.html"><div class="videos"></div><img src="asset/mxupload/up0313193001474161446.jpg" /></a></li>
</ul>
</div>


</div>
<!--内容-->

<div class="h40"></div>

</body>
<jsp:include page="foot.jsp" />
</html>
