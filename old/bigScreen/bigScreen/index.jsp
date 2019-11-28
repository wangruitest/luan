<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8"/>
		<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
		<title></title>
		<link  rel="stylesheet" href="<%=path %>/css/style.css"/>
		<script type="text/javascript" src="<%=path %>/	js/jquery.min.js" ></script>
		<script src="http://apps.bdimg.com/libs/zepto/1.1.4/zepto.min.js"></script>

    <link href="<%=path %>/css/font-awesome.min.css" rel="stylesheet">
    <link href="<%=path %>/css/bootstrap.css" rel="stylesheet">
    <link href="<%=path %>/css/carousel.css" rel="stylesheet">
    <link href="<%=path %>/css/echartsHome.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <script src="<%=path %>/js/echarts.js"></script>
    <script src="<%=path %>/js/echarts/default.js"></script>
   
    

    <link href="<%=path %>/css/codemirror.css" rel="stylesheet">
    <link href="<%=path %>/css/monokai.css" rel="stylesheet">
    <style>
    	body{font-family: "微软雅黑";padding: 0;}
    	.nameNumLeft{font-size:15px}
    </style>
	</head>
	<body>
		<div class="top">
			<ul>
				<li class="titleText fl" id="titleText"></li>
				<li class="topCenter fl"><span class="topDate"></span><span class="tem"></span></li>
				<li class="fl topRight">
					<ul id="weatherul">
						<%-- <li class="fr">
							<div class="wearther"><img src="<%=path %>/img/weather5.png"/></div>
							<div class="weartherText">星期六 19°C/23°C</div>
						</li>
						<li class="fr">
							<div class="wearther"><img src="<%=path %>/img/weather4.png"/></div>
							<div class="weartherText">星期五 19°C/23°C</div>
						</li>
						<li class="fr">
							<div class="wearther"><img src="<%=path %>/img/weather3.png"/></div>
							<div class="weartherText">星期四 19°C/23°C</div>
						</li>
						<li class="fr">
							<div class="wearther"><img src="<%=path %>/img/weather2.png"/></div>
							<div class="weartherText">今日 19°C/23°C</div>
						</li> 
						<li class="fr">
							<div class="wearther"><img src="<%=path %>/img/weather1.png"/></div>
							<div class="weartherText">昨日 17°C/23°C</div>
						</li>--%>
					</ul>
				</li>
			</ul>
		</div>
		<div class="mainArea clearfix" >
			<div class="mainLeft fl">
				<div class="mainLeftTop mainLeftArea" style="position:relative;">
					<div class="areaTitle clearfix" style="position: absolute;top: 0;">
						<div class="areaDian fl"></div>
						<div class="areaText fl">昨日外省游客前十省份</div>
					</div>
					<iframe class="prov" src="<%=path %>/bigScreen/prov.jsp" allowTransparency="true"  id="prov" style="border: none;" name="prov"  frameborder="0" scrolling="no" marginwidth="0" marginheight="0"></iframe>
				</div>
				<div class="mainLeftMt"></div>
				<div class="mainLeftCenter mainLeftArea " style="position:relative;">
					<div class="areaTitle clearfix" style="position:absolute;top:0;">
						<div class="areaDian fl"></div>
						<div class="areaText fl">景区人流曲线图</div>
					</div>
					<iframe class="perLine" src="<%=path %>/bigScreen/perline.jsp" allowTransparency="true"  style="border: none;"  frameborder="0" scrolling="no" marginwidth="0" marginheight="0"></iframe>
				</div>
				<div class="mainLeftMt"></div>
				<div class="mainLeftBottom mainLeftArea " style="position:relative;">
					<div class="areaTitle clearfix" style="position:absolute;top:0;">
						<div class="areaDian fl"></div>
						<div class="areaText fl">近一周接待游客数量</div>
					</div>
					<iframe class="perWeek" id="perWeek" src="<%=path %>/bigScreen/perWeek.jsp" style="border: none;" allowTransparency="true"  frameborder="0" scrolling="no" marginwidth="0" marginheight="0"></iframe>
				</div>
			</div>
			<div class="mainCenter fl">
				<div class="mainCenterTop">
					<div class="mainCenterLeft fl">
						<div class="mainCenterTitle">
							景区实时人数：
						</div>
						<div class="mainCenterArea clearfix">
							<div class="mainCenterAreaIcon fl maiCenterAreaTop">
								<img src="<%=path %>/img/icon1.png" />
							</div>
							<div class="mainCenterAreaText fl" id="shishi">
								0
							</div>
						</div>
						<div class="mainCenterAreaTwo clearfix">
							<div class="mainCenterTitle mainCenterTitleSmall fl" >环比前一小时：</div>
							<div class="data fl" id="huanbi">0.00%</div>
							<div class="topIcon fl"><img   id="huanImg" /></div>
						</div>
						<div class="mainCenterTitle mainTitleMt">
							景区今日游客累计：
						</div>
						<div class="mainCenterArea clearfix ">
							<div class="mainCenterAreaIcon fl maiCenterAreaBottom">
								<img src="<%=path %>/img/icon2.png"  />
							</div>
							<div class="mainCenterAreaText fl" id="jinri">
								0
							</div>
						</div>
						<div class="mainCenterAreaTwo clearfix">
							<div class="mainCenterTitle mainCenterTitleSmall fl" >同比昨日此时：</div>
							<div class="data fl" id="zhanbi">0%</div>
							<div class="topIcon fl"><img id="zhanImg"/></div>
						</div>
						<div class="numberGrounp clearfix mainTitleMt" >
							<div class="numberList fl">
								<div class="mainCenterTitle">监控景区数：</div>
								<div class="numberListBg"  id="allregions">
									
								</div>
							</div>
							<div class="numberList fr ">
								<div class="mainCenterTitle">报警景区数：</div>
								<div class="numberListBg" id="alarmregion">
									
								</div>
							</div>
						</div>
					</div>
					<div class="mainCenterRight fr" >
						<div class="areaDian fl"></div>
						<div class="areaText fl">昨日本省游客前十城市</div>
						<div class="mapArea" >
							<iframe class="ahmapArea" src="<%=path %>/bigScreen/ahmap.jsp"style="border: none;" allowTransparency="true"  frameborder="0" scrolling="no" marginwidth="0" marginheight="0"></iframe>
							<div class="ahmap clearfix" >
								<!-- 目的地城市或区县 -->
								<div class="lineArea" id="cityNamelaArea">
									<div class="name" style="top:61%;left: 17%;" id="cityNamela"></div>
								</div>
								<div class="lineArea" id="cityNamechizhouArea">
									<div class="name" style="top:88%;left: 43%;" id="cityNamechizhou"></div>
								</div>
								<div class="lineArea" id="cityNamefuyangArea">
									<div class="name" style="top:39%;left: 10%;" id="cityNamefuyang"></div>
								</div>
								<div class="lineArea" id="cityNamebozhouArea">
									<div class="name" style="top:19%;left: 15%;" id="cityNamebozhou"></div>
								</div>
								<div class="lineArea" id="cityNamesuzhouArea">
									<div class="name" style="top:18%;left: 56%;" id="cityNamesuzhou"></div>
								</div>
								<div class="lineArea" id="cityNamechuzhouArea">
									<div class="name" style="top:42%;left: 67%;" id="cityNamechuzhou"></div>
								</div>
								<div class="lineArea" id="cityNamexuanchengArea">
									<div class="name" style="top:71%;left: 68%;" id="cityNamexuancheng"></div>
								</div>
								<div class="lineArea" id="cityNamehuangshanArea">
									<div class="name" style="top:92%;left: 60%;" id="cityNamehuangshan"></div>
								</div>
								<div class="lineArea" id="cityNameanqingArea">
									<div class="name" style="top:74%;left: 16%;" id="cityNameanqing"></div>
								</div>
								<div class="lineArea" id="cityNamemaanshanArea">
									<div class="name" style="top:53%;left: 60%;" id="cityNamemaanshan"></div>
								</div>
								<div class="lineArea" id="cityNamehefeiArea">
									<div class="name" style="top:49%;left: 44%;" id="cityNamehefei"></div>
								</div>
								<div class="lineArea" id="cityNametonglingArea">
									<div class="name" style="top:65%;left: 50%;" id="cityNametongling"></div>
								</div>
								<div class="lineArea" id="cityNamebengbuArea">
									<div class="name" style="top:28%;left: 39%;" id="cityNamebengbu"></div>
								</div>
								<div class="lineArea" id="cityNamehuaibeiArea">
									<div class="name" style="top:17%;left: 26%;" id="cityNamehuaibei"></div>
								</div>
								<div class="lineArea" id="cityNamewuhuArea">
									<div class="name" style="top:62%;left: 70%;" id="cityNamewuhu"></div>
								</div>
								<div class="lineArea" id="cityNamehuainanArea">
									<div class="name" style="top:34%;left: 25%;" id="cityNamehuainan"></div>
								</div>
								
								<!-- 游客所属城市 -->
								<div class="lineArea" id="cityNamelanArea">
									<div class="cityName" style="top:51%;left: 17%;" id="cityNamelan">六安:0%</div>
								</div>
								<div class="lineArea" id="cityNamefyArea">
									<div class="cityName" style="top:29%;left: 5%;" id="cityNamefy">阜阳:0%</div>
								</div>
								<div class="lineArea" id="cityNamebzArea">
									<div class="cityName" style="top:22%;left: 15%;" id="cityNamebz">亳州:0%</div>
								</div>
								<div class="lineArea" id="cityNameszArea">
									<div class="cityName" style="top:12%;left: 36%;" id="cityNamesz">宿州:0%</div>
								</div>
								<div class="lineArea" id="cityNameczArea">
									<div class="cityName" style="top:37%;left: 51%;" id="cityNamecz">滁州:0%</div>
								</div>
								<div class="lineArea" id="cityNamexcArea">
									<div class="cityName" style="top:71%;left: 68%;" id="cityNamexc">宣城:0%</div>
								</div>
								<div class="lineArea" id="cityNamehsArea">
									<div class="cityName" style="top:92%;left: 60%;" id="cityNamehs">黄山:0%</div>
								</div>
								<div class="lineArea" id="cityNameaqArea">
									<div class="cityName" style="top:74%;left: 16%;" id="cityNameaq">安庆:0%</div>
								</div>
								<div class="lineArea" id="cityNamemasArea">
									<div class="cityName" style="top:53%;left: 60%;" id="cityNamemas">马鞍山:0%</div>
								</div>
								<div class="lineArea" id="cityNamehfArea">
									<div class="cityName" style="top:49%;left: 44%;" id="cityNamehf">合肥:0%</div>
								</div>
								<div class="lineArea" id="cityNametlArea">
									<div class="cityName" style="top:65%;left: 50%;" id="cityNametl">铜陵:0%</div>
								</div>
								<div class="lineArea" id="cityNamebbArea"><!--不是前十名的添加  areaHide 类名进行隐藏-->
									<div class="cityName" style="top:28%;left: 39%;" id="cityNamebb">蚌埠:0%</div>
								</div>
								<div class="lineArea" id="cityNamehbArea">
									<div class="cityName" style="top:17%;left: 26%;" id="cityNamehb">淮北:0%</div>
								</div>
								<div class="lineArea" id="cityNamewhArea">
									<div class="cityName" style="top:62%;left: 70%;" id="cityNamewh">芜湖:0%</div>
								</div>
								<div class="lineArea" id="cityNamecziArea">
									<div class="cityName" style="top:78%;left:52%;" id="cityNameczi">池州:0%</div>
								</div>
								<div class="lineArea" id="cityNamehnArea">
									<div class="cityName" style="top:34%;left: 25%;" id="cityNamehn">淮南:0%</div>
								</div>
							</div>
						</div>
						<ul class="ten" id="tenCityPercentArea" style="display:none;">
						
						</ul>
					</div>
				</div>
				<div class="mainCenterBottom mainLeftArea">
					    <div class="areaTitle clearfix">
							<div class="areaDian fl"></div>
							<div class="areaText fl">重点景区情况</div>
						</div>
						<!--圆环进度表-->
						<ul class="mainCenterRightArea clearfix" >
						    <iframe class="sceneryArea" name="sceneryArea" id="sceneryArea" src="<%=path %>/bigScreen/scenery.jsp" style="border: none;" allowTransparency="true"  frameborder="0" scrolling="no" marginwidth="0" marginheight="0"> </iframe>
						    <li class="fl" style="position: relative;">
							   <!--  <div class="nameText">天堂寨</div> -->
							    <div class="nameNum clearfix greenBorder">
							    	<div class="nameNumLeft greenBg fl" id="greenScenic">0个</div>
							    	<div class="nameTextRight fl">正常景区</div>
							    </div>
							</li>
							<li class="fl">
							    <!-- <div class="nameText">天堂寨</div> -->
							    <div class="nameNum clearfix blueBorder">
							    	<div class="nameNumLeft blueBg fl" id="blueScenic">0个</div>
							    	<div class="nameTextRight fl">蓝色景区</div>
							    </div>
							</li>
							<li class="fl">  
							    <!-- <div class="nameText">天堂寨</div> -->
							    <div class="nameNum clearfix yellowBorder">
							    	<div class="nameNumLeft yellowBg fl" id="yellowScenic">0个</div>
							    	<div class="nameTextRight fl">黄色景区</div>
							    </div>
							</li>
							<li class="fl"> 
							    <!-- <div class="nameText">天堂寨</div> -->
							    <div class="nameNum clearfix orangeBorder">
							    	<div class="nameNumLeft orangeBg fl" id="orangeScenic">0个</div>
							    	<div class="nameTextRight fl">橙色景区</div>
							    </div>
							</li>
							<li class="fl">  
							    <!-- <div class="nameText">天堂寨</div> -->
							    <div class="nameNum clearfix redBorder">
							    	<div class="nameNumLeft redBg fl" id="redScenic">0个</div>
							    	<div class="nameTextRight fl">红色景区</div>
							    </div>
							</li>
						</ul>	
				</div>
		</div>
			<div class="mainRight fl">
				<div class="mainLeftArea mainRightOne">
					<div class="areaTitle clearfix" >
						<div class="areaDian fl"></div>
						<div class="areaText fl">滚动提示</div>
					</div>
					<ul class="listGroup">
						<li class="listLi clearfix">
							<div class="listLiText fl">本月累计游客数：</div>
							<div class="listLiNum fl" id="regionSumByMonth">0</div>
						</li>
						<li class="listLi clearfix">
							<div class="listLiText fl">本月日游客数峰值：</div>
							<div class="listLiNum fl" id="peakDay">0</div>
						</li>
						<li class="listLi clearfix">
							<div class="listLiText fl">昨日一日游过夜客：</div>
							<div class="listLiNum fl" id="overnight">0</div>
						</li>
						<li class="listLi clearfix">
							<div class="listLiText fl">昨日城市旅客：</div>
							<div class="listLiNum fl" id="cityVisitor">0</div>
						</li>
						<li class="listLi clearfix">
							<div class="listLiText fl">游客景区停留时间：</div>
							<div class="listLiNum fl" id="stayMin">0</div>
						</li>
					</ul>
				</div>
				<div class="mainLeftMt"></div>
				<div class="mainLeftArea mainRightTwo">
					<div class="areaTitle clearfix" >
						<div class="areaDian fl"></div>
						<div class="areaText fl">游客属性</div>
					</div>
					<div class="iframeArea" style="width: 100%;overflow: hidden;">
						<!--年龄饼图表-->
						<iframe class="natureArea fr" id="age" src="<%=path %>/bigScreen/age.jsp"  allowTransparency="true"  frameborder="0" scrolling="no" marginwidth="0" marginheight="0">
							
						</iframe>
						<!--性别指示-->
						<ul class="natureList">
							<li>
								<div class="natureListIcon fl nanArea"></div>
								<div class="natureListText fl">男</div>
							</li>
							<li>
								<div class="natureListIcon fl nvArea"></div>
								<div class="natureListText fl">女</div>
							</li>
						</ul>
					<!--性别饼图表-->
						<iframe class="natureArea fl" id="sex" src="<%=path %>/bigScreen/sex.jsp" allowTransparency="true"  frameborder="0" scrolling="no" marginwidth="0" marginheight="0">
							
						</iframe>
						<!--年龄指示-->
						<ul class="natureList ageListArea1">
							<li>
								<div class="natureListIcon fl age1"></div>
								<div class="natureListText fl">0-20</div>
							</li>
							<li>
								<div class="natureListIcon fl age2"></div>
								<div class="natureListText fl">20-30</div>
							</li>
							<li>
								<div class="natureListIcon fl age3"></div>
								<div class="natureListText fl">30-40</div>
							</li>
							<!-- <li>
								<div class="natureListIcon fl age4"></div>
								<div class="natureListText fl">35-60</div>
							</li> -->
						</ul>
						<ul class="natureList ageListArea2" style="margin-left: 250.15px;">
							<!-- <li>
								<div class="natureListIcon fl age1"></div>
								<div class="natureListText fl">0-12</div>
							</li>
							<li>
								<div class="natureListIcon fl age2"></div>
								<div class="natureListText fl">12-20</div>
							</li> -->
							<li>
								<div class="natureListIcon fl age4"></div>
								<div class="natureListText fl">40-50</div>
							</li>
							<li>
								<div class="natureListIcon fl age5" style="background:blue"></div>
								<div class="natureListText fl">>50</div>
							</li>
						</ul>
					</div>
					<ul class="natureBottom">
						<li class="fl">性 别</li>
						<li class="fl">年 龄</li>
					</ul>
				</div>
				<div class="mainLeftMt"></div>
				<div class="mainLeftArea mainRightThree" >
					<div class="areaTitle clearfix" >
						<div class="areaDian fl"></div>
						<div class="areaText fl">游客状态</div>
					</div>
					<%-- <div class="mrtBottom">
						<div class="fl mrtbArea" >
							<img src="<%=path %>/img/qiche.png" class="cheImg" />
							<div class="mrthBottomNum" >35%</div>
						</div>
						<div class="fl mrtbArea">
							<img src="<%=path %>/img/huoche.png" class="cheImg" />
							<div class="mrthBottomNum" >65%</div>
						</div>
						<div class="bottomTextArea clearfix fl">
							<div class="mrthBottomText ">汽车</div>
						</div>
						<div class="bottomTextArea fl">
							<div class="mrthBottomText ">火车</div>
						</div>
					</div> --%>
					<div class="iframeArea" style="width: 100%;overflow: hidden;">
						<!--驻留时间饼图表-->
						<iframe class="natureArea fr" src="<%=path %>/bigScreen/time.jsp"  allowTransparency="true"  frameborder="0" scrolling="no" marginwidth="0" marginheight="0">
							
						</iframe>
						<!--消费金额指示-->
						<ul class="natureList levelList1">
							<li>
								<div class="natureListIcon fl level1"></div>
								<div class="natureListText fl">≤20元</div>
							</li>
							<li>
								<div class="natureListIcon fl level2"></div>
								<div class="natureListText fl">20-50元</div>
							</li>
							<!-- <li>
								<div class="natureListIcon fl level3"></div>
								<div class="natureListText fl">51-100元</div>
							</li>
							<li>
								<div class="natureListIcon fl level4"></div>
								<div class="natureListText fl">≥100元</div>
							</li> -->
						</ul>
						<ul class="natureList levelList2">
							<!-- <li>
								<div class="natureListIcon fl level1"></div>
								<div class="natureListText fl">≤20元</div>
							</li>
							<li>
								<div class="natureListIcon fl level2"></div>
								<div class="natureListText fl">20-50元</div>
							</li> -->
							<li>
								<div class="natureListIcon fl level3"></div>
								<div class="natureListText fl">51-100元</div>
							</li>
							<li>
								<div class="natureListIcon fl level4"></div>
								<div class="natureListText fl">>100元</div>
							</li>
						</ul>
					    <!--消费水平饼图表-->
						<iframe class="natureArea fl"  src="<%=path %>/bigScreen/level.jsp" allowTransparency="true"  frameborder="0" scrolling="no" marginwidth="0" marginheight="0">
							
						</iframe>
						<!--驻留时间指示-->
						<ul class="natureList ageListArea timeList1">
							<li>
								<div class="natureListIcon fl time1"></div>
								<div class="natureListText fl">0-2小时</div>
							</li>
							<li>
								<div class="natureListIcon fl time2"></div>
								<div class="natureListText fl">2-6小时</div>
							</li>
							<li>
								<div class="natureListIcon fl time3"></div>
								<div class="natureListText fl">6-24小时</div>
							</li>
							<!-- <li>
								<div class="natureListIcon fl time4"></div>
								<div class="natureListText fl">24-48小时</div>
							</li>
							<li>
								<div class="natureListIcon fl time5"></div>
								<div class="natureListText fl">≥48小时</div>
							</li> -->
						</ul>
						<ul class="natureList ageListArea timeList2">
							<!-- <li>
								<div class="natureListIcon fl time1"></div>
								<div class="natureListText fl">0-2小时</div>
							</li>
							<li>
								<div class="natureListIcon fl time2"></div>
								<div class="natureListText fl">2-6小时</div>
							</li>
							<li>
								<div class="natureListIcon fl time3"></div>
								<div class="natureListText fl">6-24小时</div>
							</li> -->
							<li>
								<div class="natureListIcon fl time4"></div>
								<div class="natureListText fl">24-48小时</div>
							</li>
							<li>
								<div class="natureListIcon fl time5"></div>
								<div class="natureListText fl">>48小时</div>
							</li>
						</ul>
					</div>
					<ul class="natureBottom">
						<li class="fl">消费水平</li>
						<li class="fl">驻留时长</li>
					</ul>
					
				</div>
			</div>
		</div>
	<script type="text/javascript">
	window.setInterval("getRegionSum()", 60000); //一分钟执行一次
	window.setInterval("getScrollTip();getRegionSumByDay()", 300000); //五分钟执行一次
	window.setInterval("setScenicState()", 60000); //一秒钟执行一次
	window.setInterval("getWeather()", 21600000); //六小时执行一次
	window.setInterval("getCurrentTime()", 1000); //一分钟执行一次
	window.setInterval("getRegionSum()", 300000); //五分钟执行一次
	window.setInterval("getProvinceYesterdayVisitors()", 300000); //五分钟执行一次
	$(document).ready(function(){
		getCfg();
		getCurrentTime();//获取当前时间
		getWeather();//获取国家气象局天气
		getRegionSum();
		getRegionSumByDay();
		getScrollTip();  
		setScenicState();
		getProvinceYesterdayVisitors();
		
	});
	var titleName="";
	var areacode = '';//城市或区县id
	var flag = '';//城市区县标示，0：省，1：市，2：区县
	var simple_name = '';
	function getCfg(){
		$.ajax({
			url:"<%=path%>/bigScreenCfg/getBigScreenCfg.html",
			async:false,
			dataType:"json",
			success:function(data){
				for ( var i = 0; i < data.length; i++) {
					titleName = data[i].area_name+"旅游景区监控中心";
					areacode = data[i].areaCode;
					flag = data[i].flag;
					simple_name = data[i].simple_name;
				}
				document.title=titleName;
				$("#titleText").html(titleName);
			}
		});
	}
	function setScenicState(){
		$.ajax({
			url:"<%=path%>/keyScenic/getScenicStateNum.html",
			async:false,
			dataType:"json",
			success:function(data){
					$("#greenScenic").html("0个");
					$("#blueScenic").html("0个");
					$("#yellowScenic").html("0个");
					$("#orangeScenic").html("0个");
					$("#redScenic").html("0个");
				for ( var i = 0; i < data.length; i++) {
					if(data[i].color=='0'){
						$("#greenScenic").html(data[i].num+"个");
					}else if(data[i].color=='1'){
						$("#blueScenic").html(data[i].num+"个");
					}else if(data[i].color=='2'){
						$("#yellowScenic").html(data[i].num+"个");
					}else if(data[i].color=='3'){
						$("#orangeScenic").html(data[i].num+"个");
					}else if(data[i].color=='4'){
						$("#redScenic").html(data[i].num+"个");
					}
				}
			}	
			
		});
	}
	function getRegionSum(){
		$.ajax({
			url : "<%=path%>/regionRealtimeController/regionRealtimeSum.html",
			dataType : "json",
			type : "POST",
			async : false,
			success : function(data){
				$.each(data, function(index,values){
	                $.each(values,function(index2,value){  
	                 $("#shishi").html(format_number(value.currentMonth));
	                 $("#huanbi").html(value.huanBi.substr(0,4)+"%");
	                 $("#huanImg").attr('src','<%=path %>/img/'+value.showImg);
	                 if(value.showImg=="less.png"){
	                 $("#huanbi").css("color","red");	 
	                 }else{
	                $("#huanbi").css("color",""); 
	                 }
	                });  
	            });  
			}
		
	});
	}
	
	function getRegionSumByDay(){
		$.ajax({
			url : "<%=path%>/regionRealtimeController/regionRealtimeSumByDay.html",
			dataType : "json",
			type : "POST",
			async : false,
			success : function(data){
				$.each(data, function(index,values){
	                $.each(values,function(index2,value){   
	                 $("#jinri").html(format_number(value.currentMonth));
	                 $("#zhanbi").html(value.zhanBi.substr(0,4)+"%");
	                 $("#zhanImg").attr('src','<%=path %>/img/'+value.showImg);
	                 if(value.showImg=="less.png"){
	                 $("#zhanbi").css("color","red");	 
	                 }
	                 $("#allregions").empty();
	                 $("#alarmregion").empty();
	                 if(value.regionNum.length==1){
	                	$("#allregions").append("<div class='listNum fl'><div class='numText'>0</div></div><div class='listNum fl'><div class='numText'>"+value.regionNum+"</div></div>"); 
	                }
	                 if(value.regionNum.length==2){
		                $("#allregions").append("<div class='listNum fl'><div class='numText'>"+value.regionNum.substring(0,1)+"</div></div><div class='listNum fl'><div class='numText'>"+value.regionNum.substring(1,2)+"</div></div>"); 
		                }	
	                 if(value.redAlarm.length=1){
	                	$("#alarmregion").append("<div class='listNum fl listRedNum'><div class='numText redNumText'>0</div></div><div class='listNum fl listRedNum'><div class='numText redNumText'>"+value.redAlarm+"</div></div>"); 
	                 }
	                 if(value.redAlarm.length==2){
		                $("#alarmregion").append("<div class='listNum fl listRedNum'><div class='numText redNumText'>"+value.redAlarm.substring(0,1)+"</div></div><div class='listNum fl'><div class='numText'>"+value.redAlarm.substring(1,2)+"</div></div>"); 
		                 }
	                });  
	            });  
			}
		
	});
	}
	
	function getScrollTip(){
		$.ajax({
			url : "<%=path%>/regionRealtimeController/scrollTip.html",
			dataType : "json",
			type : "POST",
			async : false,
			success : function(data){
				$.each(data, function(index,values){
	                $.each(values,function(index2,value){	                 
	                 $("#regionSumByMonth").html(formatWan(value.currentMonth)+"万人");
	                 $("#peakDay").html(formatWan(value.touristPeak)+"万人");
	                 $("#overnight").html(formatWan(value.overnightGuest)+"万人");
	                 $("#cityVisitor").html(formatWan(value.cityVisitor)+"万人");
	                 $("#stayMin").html(value.scenicSpot+"分钟");
	                });  
	            });  
			}
		
	});
	}
	
	//获取大屏天气函数
	function getWeather(){
		$("#weatherul").empty();
		var path = "<%=path %>";
		var yestedayMaxTemp = "";//昨日最高气温
		var yestedayMintemp = "";//昨日最低气温
		var yestedayTemp = "";//昨日气温差
		var yesterdayIcon = "";//昨日天气图标
		//获取国家气象局历史天气（昨日）
		$.ajax({
			url : "<%=path%>/bigScreenWeather/getCurrentScreenWeather.html",
			//dataType : "json",
			type : "POST",
			async : false,
			data : {
			},
			success : function(data) {
				var weatherDatas = eval(data);
				$(".tem").html(weatherDatas[0].temperature_curr);
			}
		});
		//获取国家气象局历史天气（昨日）
		$.ajax({
			url : "<%=path%>/bigScreenWeather/getYestedayScreenWeather.html",
			//dataType : "json",
			type : "POST",
			async : false,
			data : {
			},
			success : function(data) {
				var weatherDatas = eval(data);
				//格式化昨日天气
				for(var i=1;i<weatherDatas.length;i++){
					if(weatherDatas[i].temperature.replace("℃","")>weatherDatas[i-1].temperature.replace("℃","")){
						yestedayMaxTemp = weatherDatas[i].temperature.replace("℃","");
					}else{
						yestedayMintemp = weatherDatas[i-1].temperature.replace("℃","");
					}
				}
				yestedayTemp = yestedayMaxTemp+"℃";
				yesterdayIcon = weatherDatas[12].weather_icon.substring(37, weatherDatas[12].weather_icon.length-4);
			}
		});
		//获取国家气象局未来天气（未来5-7天天气，这里只取未来4天天气：包括今天）
		$.ajax({
			url : "<%=path%>/bigScreenWeather/getFutureScreenWeather.html",
			//dataType : "json",
			type : "POST",
			async : false,
			data : {
			},
			success : function(data) {
				var weatherDatas = eval(data);//将数据转化为json格式
				//填充今日天气
				$("#weatherul").append("<li class=fr>"
						+"<div class='wearther'><img src='"+path+"/img/wearther/"+weatherDatas[3].weather_icon.substring(37, weatherDatas[3].weather_icon.length-4)+".png'/></div>"
						+"<div class='weartherText'>"+weatherDatas[3].week+" "+weatherDatas[3].temperature.substring(0,3)+"</div>"
						+"</li>");
				$("#weatherul").append("<li class=fr>"
						+"<div class='wearther'><img src='"+path+"/img/wearther/"+weatherDatas[2].weather_icon.substring(37, weatherDatas[2].weather_icon.length-4)+".png'/></div>"
						+"<div class='weartherText'>"+weatherDatas[2].week+" "+weatherDatas[2].temperature.substring(0,3)+"</div>"
						+"</li>");
				$("#weatherul").append("<li class=fr>"
						+"<div class='wearther'><img src='"+path+"/img/wearther/"+weatherDatas[1].weather_icon.substring(37, weatherDatas[1].weather_icon.length-4)+".png'/></div>"
						+"<div class='weartherText'>"+weatherDatas[1].week+" "+weatherDatas[1].temperature.substring(0,3)+"</div>"
						+"</li>");
				$("#weatherul").append("<li class=fr>"
						+"<div class='wearther'><img src='"+path+"/img/wearther/"+weatherDatas[0].weather_icon.substring(37, weatherDatas[0].weather_icon.length-4)+".png'/></div>"
						+"<div class='weartherText'>今天 "+weatherDatas[0].temperature.substring(0,3)+"</div>"
						+"</li>");
				//填充昨日天气
				$("#weatherul").append("<li class=fr>"
						+"<div class='wearther'><img src='"+path+"/img/wearther/"+yesterdayIcon+".png"+"'/></div>"
						+"<div class='weartherText'>昨日 "+yestedayTemp+"</div>"
						+"</li>");
			}
		});
	}
	/*function getWeather(){
		$("#weatherul").empty();
		var path = "<%=path %>";
		var yestedayMaxTemp = "";//昨日最高气温
		var yestedayMintemp = "";//昨日最低气温
		var yestedayTemp = "";//昨日气温差
		var yesterdayIcon = "";//昨日天气图标
		//获取国家气象局历史天气（昨日）
		$.ajax({
			url : "<%=path%>/bigScreenWeather/getCurrentScreenWeather.html",
			//dataType : "json",
			type : "POST",
			async : false,
			data : {
			},
			success : function(data) {
				var weatherDatas = eval(data);
				$(".tem").html(weatherDatas[0].temperature_curr);
			}
		});
		//获取国家气象局历史天气（昨日）
		$.ajax({
			url : "<%=path%>/bigScreenWeather/getYestedayScreenWeather.html",
			//dataType : "json",
			type : "POST",
			async : false,
			data : {
			},
			success : function(data) {
				var weatherDatas = eval(data);
				//格式化昨日天气
				for(var i=1;i<weatherDatas.length;i++){
					if(weatherDatas[i].temperature.replace("℃","")>weatherDatas[i-1].temperature.replace("℃","")){
						yestedayMaxTemp = weatherDatas[i].temperature.replace("℃","");
					}else{
						yestedayMintemp = weatherDatas[i-1].temperature.replace("℃","");
					}
				}
				yestedayTemp = yestedayMaxTemp+"℃/"+yestedayMintemp+"℃";
				yesterdayIcon = weatherDatas[12].weather_icon.substring(40, weatherDatas[12].weather_icon.length-4);
			}
		});
		//获取国家气象局未来天气（未来5-7天天气，这里只取未来4天天气：包括今天）
		$.ajax({
			url : "<%=path%>/bigScreenWeather/getFutureScreenWeather.html",
			//dataType : "json",
			type : "POST",
			async : false,
			data : {
			},
			success : function(data) {
				var weatherDatas = eval(data);//将数据转化为json格式
				//填充今日天气
				$("#weatherul").append("<li class=fr>"
						+"<div class='wearther'><img src='"+path+"/img/wearther/"+weatherDatas[3].weather_icon.substring(40, weatherDatas[3].weather_icon.length-4)+".png'/></div>"
						+"<div class='weartherText'>"+weatherDatas[3].week+" "+weatherDatas[3].temperature+"</div>"
						+"</li>");
				$("#weatherul").append("<li class=fr>"
						+"<div class='wearther'><img src='"+path+"/img/wearther/"+weatherDatas[2].weather_icon.substring(40, weatherDatas[2].weather_icon.length-4)+".png'/></div>"
						+"<div class='weartherText'>"+weatherDatas[2].week+" "+weatherDatas[2].temperature+"</div>"
						+"</li>");
				$("#weatherul").append("<li class=fr>"
						+"<div class='wearther'><img src='"+path+"/img/wearther/"+weatherDatas[1].weather_icon.substring(40, weatherDatas[1].weather_icon.length-4)+".png'/></div>"
						+"<div class='weartherText'>"+weatherDatas[1].week+" "+weatherDatas[1].temperature+"</div>"
						+"</li>");
				$("#weatherul").append("<li class=fr>"
						+"<div class='wearther'><img src='"+path+"/img/wearther/"+weatherDatas[0].weather_icon.substring(40, weatherDatas[0].weather_icon.length-4)+".png'/></div>"
						+"<div class='weartherText'>今天 "+weatherDatas[0].temperature+"</div>"
						+"</li>");
				//填充昨日天气
				$("#weatherul").append("<li class=fr>"
						+"<div class='wearther'><img src='"+path+"/img/wearther/"+yesterdayIcon+".png"+"'/></div>"
						+"<div class='weartherText'>昨日 "+yestedayTemp+"</div>"
						+"</li>");
			}
		});
	}*/
	
	//获取昨日本省游客前十城市信息函数
	function getProvinceYesterdayVisitors(){
		$("#tenCityPercentArea").empty();
		var arrCities = [];//前十城市
		var ayyCitiesNum = [];//前十城市游客数量
		var alltourists = '';//游客总数
		var touristPercent = [];//前十游客数量占比
		var countyCity = simple_name;
		if(flag == "2"){//flag为2表示为区县，则需要根据区县id获取其城市名供地图目的地范围使用
			$.ajax({
				url : "<%=path%>/bigScreenYesterdayVisitors/getCountyCityName.html",
				dataType : "json",
				type : "POST",
				async : false,
				data : {
					areacode : areacode,
					flag : flag
				},
				success : function(data) {
					countyCity = data.cities.substring(0,data.cities.length-1);
				}
			});
		}
		$.ajax({
	        type : "post",
	        async : false, //同步执行
	        url : "<%=path%>/bigScreenYesterdayVisitors/getProvinceYesterdayVisitors.html",
	        data : {
	        	areacode : areacode,
				flag : flag
	        },
	        dataType : "json", //返回数据形式为json
	        success : function(result) {
		        if (result) {
		        	var yesterdayVisitors = result.data;
		        	if(yesterdayVisitors.length > 0){
		        		alltourists = yesterdayVisitors[0].alltourists;
			            for(var i=0;i<yesterdayVisitors.length;i++){
			            	arrCities.push(yesterdayVisitors[i].cities);
			            	ayyCitiesNum.push(yesterdayVisitors[i].tourist);
			            	touristPercent.push((yesterdayVisitors[i].tourist/alltourists*100).toFixed(1));
			            }
		        	}
		            //将前十城市显示在地图上
		            $("#cityNamelaArea").addClass("areaHide");
	            	$("#cityNamefuyangArea").addClass("areaHide");
	            	$("#cityNamebozhouArea").addClass("areaHide");
	            	$("#cityNamesuzhouArea").addClass("areaHide");
	            	$("#cityNamechuzhouArea").addClass("areaHide");
	            	$("#cityNamexuanchengArea").addClass("areaHide");
	            	$("#cityNamehuangshanArea").addClass("areaHide");
	            	$("#cityNameanqingArea").addClass("areaHide");
	            	$("#cityNamemaanshanArea").addClass("areaHide");
	            	$("#cityNamehefeiArea").addClass("areaHide");
	            	$("#cityNametonglingArea").addClass("areaHide");
	            	$("#cityNamebengbuArea").addClass("areaHide");
	            	$("#cityNamehuaibeiArea").addClass("areaHide");
	            	$("#cityNamewuhuArea").addClass("areaHide");
	            	$("#cityNamechizhouArea").addClass("areaHide");
	            	$("#cityNamehuainanArea").addClass("areaHide");
		            if(countyCity == '六安'){
		            	$("#cityNamela").html(simple_name);
		            	$("#cityNamelaArea").removeClass("areaHide");
		            }else if(countyCity == '阜阳'){
		            	$("#cityNamefuyang").html(simple_name);
		            	$("#cityNamefuyangArea").removeClass("areaHide");
		            }else if(countyCity == '亳州'){
		            	$("#cityNamebozhou").html(simple_name);
		            	$("#cityNamebozhouArea").removeClass("areaHide");
		            }else if(countyCity == '宿州'){
		            	$("#cityNamesuzhou").html(simple_name);
		            	$("#cityNamesuzhouArea").removeClass("areaHide");
		            }else if(countyCity == '滁州'){
		            	$("#cityNamechuzhou").html(simple_name);
		            	$("#cityNamechuzhouArea").removeClass("areaHide");
		            }else if(countyCity == '宣城'){
		            	$("#cityNamexuancheng").html(simple_name);
		            	$("#cityNamexuanchengArea").removeClass("areaHide");
		            }else if(countyCity == '阜阳'){
		            	$("#cityNamechizhou").html(simple_name);
		            	$("#cityNamechizhouArea").removeClass("areaHide");
		            }else if(countyCity == '黄山'){
		            	$("#cityNamehuangshan").html(simple_name);
		            	$("#cityNamehuangshanArea").removeClass("areaHide");
		            }else if(countyCity == '安庆'){
		            	$("#cityNameanqing").html(simple_name);
		            	$("#cityNameanqingArea").removeClass("areaHide");
		            }else if(countyCity == '马鞍山'){
		            	$("#cityNamemaanshan").html(simple_name);
		            	$("#cityNamemaanshanArea").removeClass("areaHide");
		            }else if(countyCity == '合肥'){
		            	$("#cityNamehefei").html(simple_name);
		            	$("#cityNamehefeiArea").removeClass("areaHide");
		            }else if(countyCity == '铜陵'){
		            	$("#cityNametongling").html(simple_name);
		            	$("#cityNametonglingArea").removeClass("areaHide");
		            }else if(countyCity == '蚌埠'){
		            	$("#cityNamebengbu").html(simple_name);
		            	$("#cityNamebengbuArea").removeClass("areaHide");
		            }else if(countyCity == '淮北'){
		            	$("#cityNamehuaibei").html(simple_name);
		            	$("#cityNamehuaibeiArea").removeClass("areaHide");
		            }else if(countyCity == '芜湖'){
		            	$("#cityNamewuhu").html(simple_name);
		            	$("#cityNamewuhuArea").removeClass("areaHide");
		            }else if(countyCity == '池州'){
		            	$("#cityNamechizhou").html(simple_name);
		            	$("#cityNamechizhouArea").removeClass("areaHide");
		            }else if(countyCity == '淮南'){
		            	$("#cityNamehuainan").html(simple_name);
		            	$("#cityNamehuainanArea").removeClass("areaHide");
		            }
		            
		            $("#cityNamelanArea").addClass("areaHide");
	            	$("#cityNamefyArea").addClass("areaHide");
	            	$("#cityNamebzArea").addClass("areaHide");
	            	$("#cityNameszArea").addClass("areaHide");
	            	$("#cityNameczArea").addClass("areaHide");
	            	$("#cityNamexcArea").addClass("areaHide");
	            	$("#cityNamehsArea").addClass("areaHide");
	            	$("#cityNameaqArea").addClass("areaHide");
	            	$("#cityNamemasArea").addClass("areaHide");
	            	$("#cityNamehfArea").addClass("areaHide");
	            	$("#cityNametlArea").addClass("areaHide");
	            	$("#cityNamebbArea").addClass("areaHide");
	            	$("#cityNamehbArea").addClass("areaHide");
	            	$("#cityNamewhArea").addClass("areaHide");
	            	$("#cityNamecziArea").addClass("areaHide");
	            	$("#cityNamehnArea").addClass("areaHide");
		            for(var i = 0 ; i < arrCities.length ; i++){
		            	if(arrCities[i] == '阜阳市'){
		            		$("#cityNamefyArea").removeClass("areaHide");
		            		$("#cityNamefy").html(arrCities[i].substring(0,arrCities[i].length-1)+":"+touristPercent[i]+"%");
		            	}else if(arrCities[i] == '六安市'){
		            		$("#cityNamelanArea").removeClass("areaHide");
		            		$("#cityNamelan").html(arrCities[i].substring(0,arrCities[i].length-1)+":"+touristPercent[i]+"%");
		            	}else if(arrCities[i] == '亳州市'){
		            		$("#cityNamebzArea").removeClass("areaHide");
		            		$("#cityNamebz").html(arrCities[i].substring(0,arrCities[i].length-1)+":"+touristPercent[i]+"%");
		            	}else if(arrCities[i] == '宿州市'){
		            		$("#cityNameszArea").removeClass("areaHide");
		            		$("#cityNamesz").html(arrCities[i].substring(0,arrCities[i].length-1)+":"+touristPercent[i]+"%");
		            	}else if(arrCities[i] == '滁州市'){
		            		$("#cityNameczArea").removeClass("areaHide");
		            		$("#cityNamecz").html(arrCities[i].substring(0,arrCities[i].length-1)+":"+touristPercent[i]+"%");
		            	}else if(arrCities[i] == '宣城市'){
		            		$("#cityNamexcArea").removeClass("areaHide");
		            		$("#cityNamexc").html(arrCities[i].substring(0,arrCities[i].length-1)+":"+touristPercent[i]+"%");
		            	}else if(arrCities[i] == '黄山市'){
		            		$("#cityNamehsArea").removeClass("areaHide");
		            		$("#cityNamehs").html(arrCities[i].substring(0,arrCities[i].length-1)+":"+touristPercent[i]+"%");
		            	}else if(arrCities[i] == '安庆市'){
		            		$("#cityNameaqArea").removeClass("areaHide");
		            		$("#cityNameaq").html(arrCities[i].substring(0,arrCities[i].length-1)+":"+touristPercent[i]+"%");
		            	}else if(arrCities[i] == '马鞍山市'){
		            		$("#cityNamemasArea").removeClass("areaHide");
		            		$("#cityNamemas").html(arrCities[i].substring(0,arrCities[i].length-1)+":"+touristPercent[i]+"%");
		            	}else if(arrCities[i] == '合肥市'){
		            		$("#cityNamehfArea").removeClass("areaHide");
		            		$("#cityNamehf").html(arrCities[i].substring(0,arrCities[i].length-1)+":"+touristPercent[i]+"%");
		            	}else if(arrCities[i] == '铜陵市'){
		            		$("#cityNametlArea").removeClass("areaHide");
		            		$("#cityNametl").html(arrCities[i].substring(0,arrCities[i].length-1)+":"+touristPercent[i]+"%");
		            	}else if(arrCities[i] == '蚌埠市'){
		            		$("#cityNamebbArea").removeClass("areaHide");
		            		$("#cityNamebb").html(arrCities[i].substring(0,arrCities[i].length-1)+":"+touristPercent[i]+"%");
		            	}else if(arrCities[i] == '淮北市'){
		            		$("#cityNamehbArea").removeClass("areaHide");
		            		$("#cityNamehb").html(arrCities[i].substring(0,arrCities[i].length-1)+":"+touristPercent[i]+"%");
		            	}else if(arrCities[i] == '芜湖市'){
		            		$("#cityNamewhArea").removeClass("areaHide");
		            		$("#cityNamewh").html(arrCities[i].substring(0,arrCities[i].length-1)+":"+touristPercent[i]+"%");
		            	}else if(arrCities[i] == '池州市'){
		            		$("#cityNamecziArea").removeClass("areaHide");
		            		$("#cityNameczi").html(arrCities[i].substring(0,arrCities[i].length-1)+":"+touristPercent[i]+"%");
		            	}else if(arrCities[i] == '淮南市'){
		            		$("#cityNamehnArea").removeClass("areaHide");
		            		$("#cityNamehn").html(arrCities[i].substring(0,arrCities[i].length-1)+":"+touristPercent[i]+"%");
		            	}else{
		            		
		            	}
		            }
		            $(".ten").css("display","none");
		          //将前十城市占比显示在大屏上
		          if(touristPercent.length > 0){
			          for(var i = 0 ; i < touristPercent.length ; i++){
			        	  $("#tenCityPercentArea").append("<li class='tenList clearfix'>"
									+"<div class='tenNum fl'>"+(i+1)+" </div>"
									+"<div class='tenName fl'>"+arrCities[i].substring(0,arrCities[i].length-1)+" "+touristPercent[i] +"%</div>"
									+"</li>");
			          }
		          }else{
		        	  $("#tenCityPercentArea").append("<li class='tenList clearfix'>"
								+"<div class='tenNum fl'></div>"
								+"<div class='tenName fl'>城市排名等待更新</div>"
								+"</li>");
		          }
		          $(".ten").fadeIn(1500);
		        }
		    }
	   	});
	}
	
	//右侧获取当前时间
	function getCurrentTime(){
		var mydate = new Date();
		var year=mydate.getFullYear();//获取当前年份
		var month=mydate.getMonth()+1;//获取当前月份
		var day=mydate.getDate();//获取当前日
		var hour=mydate.getHours(); //获取当前小时数(0-23)
		var min=mydate.getMinutes(); //获取当前分钟数(0-59)
		var seconds = mydate.getSeconds();
		var date = month+"/"+day+"/"+year;
		var dayd = new Date(Date.parse(date));   //需要正则转换的则 此处为 ： var day = new Date(Date.parse(date.replace(/-/g, '/')));  
		var today = new Array('星期日','星期一','星期二','星期三','星期四','星期五','星期六');  
		var week = today[dayd.getDay()]; //获取当前星期几
		if(parseInt(hour)<10){
			hour = '0'+ hour;
		}
		if(parseInt(min)<10){
			min = '0'+ min;
		}
		if(parseInt(seconds)<10){
			seconds = '0'+ seconds;
		}
		$(".topDate").html(year+"年"+month+"月"+day+"日"+" "+week+" "+hour+":"+min+""+":"+seconds+" ");
	}
	
	//中间区域，前十城市排名，展开效果   (添加部分)
	window.onload = function(){
		$(".ten").fadeIn(1500);
	};

	 
	//一屏展示，获取除top区域外内容区域高度
	var windowHeight=$(window).height();
	var mainHeight=windowHeight-75-5;
	$(".mainArea").height(mainHeight);
	
    //数字垂直居中
    var th=$(".mainCenterAreaText").height();
    $(".mainCenterAreaText").css("line-height",th+'px');
    var nn=$(".numText").height();
    $(".numText").css("line-height",nn+'px');
    var nnl=$(".nameNumLeft").height();
    $(".nameNumLeft").css("line-height",nnl+'px');
    var btah=$(".bottomTextArea").height();
    var btmt=(btah-20)/2;
    $(".mrthBottomText").css("margin-top",btmt+'px');
    
    //与上方的间距
     var at=$(".mainCenterAreaTwo").height();
     var ml=$(".mainCenterLeft").height();
     var mt=at+ml*0.05;
     $(".mainTitleMt").css("margin-top",mt+'px');
     var adian=$(".areaDian").height();
     var atext=$(".areaText").height();
     var atitle=$(".areaTitle").height();
     var admt=(atitle-adian)/2;
     var atmt=(atitle-atext)/2;
     
     //右侧底部
     var mrth=$(".mainRightThree .areaTitle").height();
     var mrdh=(mrth-10)/2;
     $(".mainRightThree .areaText").css("line-height",mrth+'px');
     $(".mainRightThree .areaDian").css("margin-top",mrdh+'px');
     
     //右侧上部
     var mrth=$(".mainLeftArea .areaTitle").height();
     var mrdh=(mrth-10)/2;
     $(".mainLeftArea .areaText").css("line-height",mrth+'px');
     $(".mainLeftArea .areaDian").css("margin-top",mrdh+'px');
     
     //中间区域底部区域
     /* var mcbh=$(".mainCenterBottom").height();
     var mcrah=$(".mainCenterRightArea").height();
     var nth=$(".nameText").height();
     var nnh=$(".nameNum").height();
     var sah=mcbh-nth-nnh-atitle-22;
     var mcbmt=mcbh-sah-atitle-nth-nnh;//22px
     var mcraw=$(".mainCenterRightArea").width();
     $(".nameNum").css("margin-top",10+'px');
     $(".sceneryArea").css("width",mcraw-2+'px');
     $(".sceneryArea").css("height",sah+'px'); */
     //中间区域底部区域
     var mcbh=$(".mainCenterBottom").height();
     var mcrah=$(".mainCenterRightArea").height();
     var nnh=$(".nameNum").height();
     var sah=mcbh-nnh-atitle-12;
     var mcbmt=mcbh-sah-atitle-nnh;//22px
     var mcraw=$(".mainCenterRightArea").width();
     $(".nameNum").css("margin-top",2+'px');
     $(".sceneryArea").css("width",mcraw-2+'px');
     $(".sceneryArea").css("height",sah+'px');
     
     
    //交通工具根据高度进行车图片自适应改变
    var mrtbAreaW=$(".mrtbArea").width();
    var mrtbAreaH=$(".mrtbArea").height();
    $(".cheImg").height(mrtbAreaH);
    var cgh=mrtbAreaH*0.72;
    
    //交通工具设置交通图片的   margin-left 值
    $(".cheImg").width(cgh);
    var cheimgW=$(".cheImg").width();
    var cheMargin=(mrtbAreaW-cheimgW)*0.5;
    $(".cheImg").css("margin-left",cheMargin+"px");
    
    //交通工具设置所占比例的  top 值
    var numMt=mrtbAreaH*0.7;
    $(".mrthBottomNum").css("top",numMt+"px");

    
    //改变游客累计左侧图标
    var mcabW=$(".maiCenterAreaBottom").width();
    var mcabH=$(".mainCenterAreaIcon").height();
    
    var mcatImgH=$(".maiCenterAreaTop img").height();
    var mcatImgMt=(mcabH-mcatImgH)/2;
    $(".maiCenterAreaTop img").css("margin-top",mcatImgMt+"px");
    
    var mcabImgH=$(".maiCenterAreaBottom img").height();
    var mcabImgMt=(mcabH-mcabImgH)/2;
    $(".maiCenterAreaBottom img").css("margin-top",mcabImgMt+"px");
    
    if(mcabW<=74){
    	var mcabMt=mcabImgMt+5;
    	$(".maiCenterAreaBottom").children("img").attr({src:"<%=path %>/img/icon2Small.png"});
    	$(".maiCenterAreaBottom").children("img").css("margin-top",mcabMt+"px");
    };
    
    //右侧上方list
    var mroH=$(".mainRightOne").height();
    var atH=$(".mainRightOne .areaTitle").height();
    var listH=(mroH-atH-150)/7;
    $(".listLi").css("margin-top",listH+"px");
    
    var mcraW=$(".mainCenterRightArea li").width();
    var cBottomLeft=(mcraW-90)/2-5;
    $(".oneCircleBottom").css("left",cBottomLeft+"px");
    
    //游客属性
    var natureW=$(".mainRightTwo").width();
    var natureH=$(".mainRightTwo").height();
    var leftNatureH=(natureH-atitle)*0.75;
    var leftNatureMt=(natureH-atitle)*0.05;
    var leftNatureW=natureW*0.49;
    $(".natureArea").css("width",leftNatureW+"px");
    $(".natureArea").css("height",leftNatureH+"px");
    $(".natureArea").css("margin-top",leftNatureMt+"px");
    $(".ageListArea1").css("margin-left",leftNatureW+"px");
    $(".ageListArea2").css("margin-left",leftNatureW*1.5+"px");
    
    //游客状态
    var natureW=$(".mainRightThree").width();
    var leftNatureW=natureW*0.49;
    $(".natureArea").css("width",leftNatureW+"px");
    $(".level").css("margin-left",leftNatureW*0+"px");
    $(".levelList1").css("margin-left",leftNatureW*0+"px");
    $(".levelList2").css("margin-left",leftNatureW*0.5+"px");
    $(".timeList1").css("margin-left",leftNatureW+"px");
    $(".timeList2").css("margin-left",leftNatureW*1.5+"px");
    
    //前十省份线条图
   var mlth=$(".mainLeftTop").height();
   var provh=mlth;
   $(".prov").css("height",provh+"px");
   
   //人流量曲线图
   var mlch=$(".mainLeftCenter").height();
   var lineh=mlch-atitle;
   var mlcw=$(".mainLeftCenter").width();
   $(".perLine").css("height",mlch+"px");
   $(".perLine").css("width",mlcw+"px");
   
   //一周接待游客
   var mlbh=$(".mainLeftBottom").height();
   var lineh=mlbh-atitle;
   var mlbw=$(".mainLeftBottom").width();
   $(".perWeek").css("height",mlbh+"px");
   $(".perWeek").css("width",mlbw+"px");
   
 //安徽地图
   var mclw=$(".mainCenterLeft").width();
   var mclh=$(".mainCenterLeft").height();
   var mcw=$(".mainCenterTop").width();
   var mcrw=mcw-mclw-10;
   var mapareah=mclh-atitle;
   $(".mainCenterRight").width(mcrw);
   $(".mainCenterRight").height(mclh);
   $(".mapArea").width(mcrw);
   $(".mapArea").height(mapareah);
   //(添加部分  2016-11-25）
   $(".ahmap").width(mcrw);
   $(".ahmap").height(mapareah);
   $(".ahmapArea").width(mcrw);
   $(".ahmapArea").height(mapareah);

   
   //地图等比例缩放，使其自适应屏幕
   var mapAreaH=$(".mapArea").height();
   var mapImgH=mapAreaH*0.97;
   var mapImgW=mapImgH*0.72;
   $(".mapImg").height(mapImgH);
   $(".mapImg").width(mapImgW);
   $(".lineArea img").width(mapImgW);
   $(".lineArea img").height(mapImgH);
   $(".ahmap").height(mapImgH);
   $(".ahmap").width(mapImgW);
   var mapml=(mcrw-mapImgW)/2;
   $(".ahmap").css("margin-left",mapml+"px");
   
   //根据map区域大小改变字体间距
    var ahw=$(".mainCenterRight").width();
    if(ahw<410){
    	$(".cityName").css("font-size", 12);
    	$(".cityName").css("padding", 2);
    	$(".tenName").css("font-size", 12);
    	$(".tenNum").css("font-size", 12);
    	$(".mainCenterAreaText").css("font-size", 40);
    	$(".data").css("font-size", 25);
    	$(".numText").css("font-size", 40);
    }
    
    function format_number(n){  
    	   var b=parseInt(n).toString();  
    	   var len=b.length;  
    	   if(len<=3){return b;}  
    	   var r=len%3;  
    	   return r>0?b.slice(0,r)+","+b.slice(r,len).match(/\d{3}/g).join(","):b.slice(r,len).match(/\d{3}/g).join(",");  
    	 }  
    
    function formatWan(n){
    	var b=parseInt(n).toString();
    	var r=b/10000;
    	return r.toFixed(2);
    }
    
    function formatQian(n){
    	var b=parseInt(n).toString();
    	var r=b/1000;
    	return r.toFixed(2);
    }
    
	</script>
	<!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    
   
    
  <!--    <script type="text/javascript" src="<%=path %>/js/echartsHome.js"></script>-->
     <script src="<%=path %>/js/jquery.min.js"></script>
     <script src="<%=path %>/js/bootstrap.min.js"></script>
     <script src="<%=path %>/js/codemirror.js"></script>
     <script src="<%=path %>/js/javascript.js"></script>
     <script src="<%=path %>/js/echartsExample.js"></script>
	</body>
</html>
