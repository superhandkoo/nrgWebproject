<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>瑞兰德· 您身边的楼宇暖通能源科技专家</title>
<meta name="keywords" content="瑞兰德· 您身边的楼宇暖通能源科技专家">
<meta name="description" content="瑞兰德· 您身边的楼宇暖通能源科技专家">
<link href="style/gy.css" rel="stylesheet" type="text/css" />
<link href="style/css.css" rel="stylesheet" type="text/css" />
<link href="style/demo.css" rel="stylesheet" type="text/css" />
<link href="style/sodli.css" rel="stylesheet" type="text/css" />
<script src="js/js.js"></script>
<script language="javascript" type="text/javascript" src="js/jquery.SuperSlide.2.1.1.js"></script>
<script language="javascript" type="text/javascript" src="js/note.js"></script>

<script src="js/js2.js"></script>
<script type="text/javascript" src="js/banner.js"></script>
<script type="text/javascript">
jQuery(document).ready(function(){
	var qcloud={};
	$('[_t_nav]').hover(function(){
		var _nav = $(this).attr('_t_nav');
		clearTimeout( qcloud[ _nav + '_timer' ] );
		qcloud[ _nav + '_timer' ] = setTimeout(function(){
		$('[_t_nav]').each(function(){
		$(this)[ _nav == $(this).attr('_t_nav') ? 'addClass':'removeClass' ]('nav-up-selected');
		});
		$('#'+_nav).stop(true,true).slideDown(200);
		}, 150);
	},function(){
		var _nav = $(this).attr('_t_nav');
		clearTimeout( qcloud[ _nav + '_timer' ] );
		qcloud[ _nav + '_timer' ] = setTimeout(function(){
		$('[_t_nav]').removeClass('nav-up-selected');
		$('#'+_nav).stop(true,true).slideUp(200);
		}, 150);
	});
});
</script>
    <script type="text/javascript" language="javascript">
        var url = location.href;
        if (url.indexOf("pc") < 0) {
            var is_iPd = navigator.userAgent.match(/(iPad|iPod|iPhone)/i) != null;
            var is_mobi = navigator.userAgent.toLowerCase().match(/(ipod|iphone|android|coolpad|mmp|smartphone|midp|wap|xoom|symbian|j2me|blackberry|win ce)/i) != null;
           // if (is_mobi && window.location.search.indexOf("mv=fp") < 0) {
            //    window.location.href = "mobile/";
           // }
        }
    </script>
<!--head-->
<div class="head">
<div class="top">
<div class="logo fl"><a href="./login.html"><img src="images/logo.jpg" /></a></div>
<div class="search fl">
<script type="text/javascript">
			function searchres()
			{
				var s = document.getElementById("Search").value;
				if(s==''){
				//alert("请输入关键词！");
				return false;}else{
				document.location = './?search/key/'+encodeURI(s);
				return false;}
			}
</script>
<form action="./search.do" method="post" onSubmit="return searchres();">
<input name="Search" id="Search" type="text" value="请输入关键字" onfocus="javascript:this;if(this.value=='请输入关键字')this.value='';" onblur="javascript:if(this.value==''){this.value='请输入关键字';}" class="kk" />
<input type="submit" value=" " class="niu">
</form>
</div>
<div class="language fr"></div>
</div>

<div class="clear"></div>

<!--nav-->
<div class="head-v3">
	<div class="navigation-up">
		<div class="navigation-inner">
			<div class="navigation-v3">
				<ul>
					<li><h2><a href="./?app.html">首页</a></h2></li>
					<li class="" _t_nav="solution">
						<h2>
							<a href="javascript:void(0);">解决方案</a>
						</h2>
					</li>
					<li class="" _t_nav="product">
						<h2>
							<a href="javascript:void(0);">产品中心</a>
						</h2>
					</li>
					<li class="" _t_nav="wechat">
						<h2>
							<a href="javascript:void(0);">新闻中心</a>
						</h2>
					</li>
					<li class="" _t_nav="support">
						<h2>
							<a href="javascript:void(0);">关于我们</a>
						</h2>
					</li>
					
					
				</ul>
			</div>
		</div>
	</div>
	<div class="navigation-down">
		<div id="solution" class="nav-down-menu menu-1" style="display: none;height:300px;" _t_nav="solution">
			<div class="navigation-down-inner">
				<dl style='margin-left: 120px;' >
					<dt>中央空调节能控制系统方案</dt>
					<dd>
						<a hotrep="hp.header.product.compute1" href="./?solution/tid/257/id/333.html">中央空调计费系统</a>
					</dd>
					<dd>
						<a hotrep="hp.header.product.compute1" href="./?solution/tid/257/id/334.html">DDC节能控制系统</a>
					</dd>
				</dl>
				<dl  >
					<dt>供热采暖节能控制系统方案</dt>
					<dd>
						<a hotrep="hp.header.product.compute1" href="./?solution/tid/258/id/339.html">供热计量方案</a>
					</dd>
					<dd>
						<a hotrep="hp.header.product.compute1" href="./?solution/tid/258/id/356.html">换热站节能控制方案</a>
					</dd>
					<dd>
						<a hotrep="hp.header.product.compute1" href="./?solution/tid/258/id/357.html">分户采暖智能控制系统</a>
					</dd>
				</dl>
				<dl  >
					<dt>城市太阳能热水应用方案</dt>
					<dd>
						<a hotrep="hp.header.product.compute1" href="./?solution/tid/259/id/265.html">太阳能热水解决方案</a>
					</dd>
					<dd>
						<a hotrep="hp.header.product.compute1" href="./?solution/tid/259/id/365.html">太阳能辅助采暖解决方案</a>
					</dd>
					<dd>
						<a hotrep="hp.header.product.compute1" href="./?solution/tid/259/id/266.html">公共建筑太阳能热水解决方案</a>
					</dd>
				</dl>
				<dl  >
					<dt>全面水力平衡系统方案</dt>
					<dd>
						<a hotrep="hp.header.product.compute1" href="./?solution/tid/260/id/349.html">变流量系统解决方案</a>
					</dd>
					<dd>
						<a hotrep="hp.header.product.compute1" href="./?solution/tid/260/id/366.html">智慧阀应用方案</a>
					</dd>
				</dl>
				<dl  >
					<dt>建筑能源监测与节能控制系统</dt>
					<dd>
						<a hotrep="hp.header.product.compute1" href="./?solution/tid/347/id/348.html">建筑能源监测与节能控制系统</a>
					</dd>
				</dl>
			</div>
		</div>
		<div id="product" class="nav-down-menu menu-1" style="display: none; height:300px;" _t_nav="product">
			<div class="navigation-down-inner">
				<dl  style="margin-right:80px; margin-left: 180px; " >
					<dt>温控器</dt>
					<dd>
						<a hotrep="hp.header.product.compute1" href="./?product/tid/202/id/209.html">空调温控器</a>
					</dd>
					<dd>
						<a hotrep="hp.header.product.compute1" href="./?product/tid/202/id/210.html">采暖温控器</a>
					</dd>
					<dd>
						<a hotrep="hp.header.product.compute1" href="./?product/tid/202/id/367.html">锅炉温控器</a>
					</dd>
					<dd>
						<a hotrep="hp.header.product.compute1" href="./?product/tid/202/id/369.html">新风控制器</a>
					</dd>
					<dd>
						<a hotrep="hp.header.product.compute1" href="./?product/tid/202/id/368.html">热计量控制器</a>
					</dd>
					<dd>
						<a hotrep="hp.header.product.compute1" href="./?product/tid/202/id/371.html">防结露温控器</a>
					</dd>
				</dl>
				<dl  style="margin-right:80px;  " >
					<dt>控制阀</dt>
					<dd>
						<a hotrep="hp.header.product.compute1" href="./?product/tid/203/id/370.html">电动开关阀</a>
					</dd>
					<dd>
						<a hotrep="hp.header.product.compute1" href="./?product/tid/203/id/212.html">电动调节阀</a>
					</dd>
					<dd>
						<a hotrep="hp.header.product.compute1" href="./?product/tid/203/id/213.html">平衡阀</a>
					</dd>
					<dd>
						<a hotrep="hp.header.product.compute1" href="./?product/tid/203/id/215.html">恒温阀及供热控制阀</a>
					</dd>
					<dd>
						<a hotrep="hp.header.product.compute1" href="./?product/tid/203/id/321.html">分集水器</a>
					</dd>
				</dl>
				<dl  style="margin-right:80px;  " >
					<dt>监测与控制</dt>
					<dd>
						<a hotrep="hp.header.product.compute1" href="./?product/tid/207/id/322.html">传感器</a>
					</dd>
					<dd>
						<a hotrep="hp.header.product.compute1" href="./?product/tid/207/id/361.html">数据采集箱</a>
					</dd>
					<dd>
						<a hotrep="hp.header.product.compute1" href="./?product/tid/207/id/362.html">气候补偿器</a>
					</dd>
					<dd>
						<a hotrep="hp.header.product.compute1" href="./?product/tid/207/id/363.html">热能表</a>
					</dd>
					<dd>
						<a hotrep="hp.header.product.compute1" href="./?product/tid/207/id/332.html">楼宇控制器</a>
					</dd>
					<dd>
						<a hotrep="hp.header.product.compute1" href="./?product/tid/207/id/238.html">控制箱</a>
					</dd>
				</dl>
				<dl  style="margin-right:80px;  " >
					<dt>太阳能光热</dt>
					<dd>
						<a hotrep="hp.header.product.compute1" href="./?product/tid/314/id/315.html">高效平板太阳能集热器</a>
					</dd>
					<dd>
						<a hotrep="hp.header.product.compute1" href="./?product/tid/314/id/316.html">太阳能控制器</a>
					</dd>
					<dd>
						<a hotrep="hp.header.product.compute1" href="./?product/tid/314/id/318.html">太阳能泵站</a>
					</dd>
				</dl>

			</div>
		</div>
		<div id="wechat" class="nav-down-menu menu-1" style="display: none;height:60px;" _t_nav="wechat">
			<div class="navigation-down-inner">

				<dl style="margin-left:460px;" >
					<dt style="float:left; padding-right:50px;"><a href="./?news.html">行业资讯</a></dt>
                    <dt style="float:left; padding-right:50px;"><a href="./?dynamic.html">海林动态</a></dt>
                    <dt style="float:left; padding-right:50px;"><a href="./?topic.html">特色专题</a></dt>
				</dl>
                
			</div>
		</div>

		<div id="support" class="nav-down-menu menu-1" style="display: none;height:60px;" _t_nav="support">
			<div class="navigation-down-inner">

				<dl style="margin-left:540px;" >
					<dt style="float:left; padding-right:50px;"><a href="./?into/id/267.html">走近海林</a></dt>
                    <dt style="float:left; padding-right:50px;"><a href="./?marketing.html">营销网络</a></dt>
                    <dt style="float:left; padding-right:50px;"><a href="./?job.html">加入我们</a></dt>
                    <dt style="float:left; padding-right:50px;"><a href="./?into/id/270.html">联系我们</a></dt>
				</dl>
                
			</div>
		</div>

	</div>
</div>
<!--nav-->

</div><!--head-->