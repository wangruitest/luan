<%@page import="java.util.List"%>
<%@page import="com.cmcc.zysoft.login.model.SysUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setAttribute("home", request.getContextPath());
%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>城市客流</title>
<link rel="stylesheet" type="text/css"
	href="<%=path %>/css/bootstrap/bootstrap-treeview.css" />
<link rel="stylesheet" type="text/css"
	href="<%=path %>/css/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/css/libs/font-awesome.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/css/libs/nanoscroller.css" />
<link rel="stylesheet" type="text/css"
	href="<%=path %>/css/compiled/theme_styles.css" />
<link rel="stylesheet" href="<%=path %>/css/caidan.css" />
<link rel="stylesheet" href="<%=path %>/css/data.css" />
<link rel="stylesheet" href="<%=path %>/css/control.css" />
<link rel="stylesheet" href="<%=path %>/css/kuangjia.css" />
<link type="image/x-icon" href="<%=path %>/favicon.png" rel="shortcut icon" />
<script src="<%=path %>/js/respond.min.js"></script>
</head>
<jsp:include page="../common.jsp"></jsp:include>
<style>
html {
	overflow-x: hidden;
}

#content-wrapper {
	background: #e7ebee;
	height: 100%;
	margin-top: 0;
	margin-bottom: 0;
	position: relative;
	min-height: 500px;
	padding: 15px 15px 35px 15px;
}

a {
	text-decoration: none;
	color: #ffffff;
}

a:hover {
	cursor: pointer;
	color: #fff;
	text-decoration: none;
}
li:hover{
	cursor:pointer;
}
</style>
<body>
	<div id="page-wrapper" class="container" style="width:100%;margin:0">
		<div class="row" style="background:#343e4a">
			<%@include file="../left.jsp"%>
			<div id="content-wrapper" style="min-height:900px;">
				<div class="fl" id="mainW" style="width: 100%;background: #eceff4;"
					id="content">
					<div class="main">
						<!--城市客流显示的所有区域-->
					<!--  	<div class="contentMain"  id="contentMainHeight">城市客流</div>-->
						<div class="contentData" style="position: relative;">
							<div class="contentHead" id="contentHead1">
								<div class="fl contentDataHeadLeftImg">
									<img src="img/month.png" />
								</div>
								<div class="fl contentDataHeadLeftText">30天人数分析</div>
								<div class="fr zheArea">
									<div class="zhe zheList "></div>
								</div>
								<div class="fr saiArea" style="margin-right:5px;position: relative;">
									<div class="saiText">旅客</div>
									<ul class="saiData"  style="width:80px">
										<li class="saiDataList  topRadius">旅客</li>
										<li class="saiDataList bottomRadius">游客</li>
									</ul>
								</div>
							</div>

							<div class="contentDataMain" id="citymain"
								style="height: 320px;width: 104%"></div>
						</div>
						<div class="contentData dayData">
							<div class="contentHead" id="contentHead2">
								<div class="fl contentDataHeadLeftImg">
									<img src="img/day.png" />
								</div>
								<div class="fl contentDataHeadLeftText" >几日游分析</div>
								<div class="fr zheList twoZhe"></div>
								<div class="fr timeArea" style="margin-right:5px;position: relative;">
									<div class="timeText">近一个月</div>
									<!--<div class="time" ></div>-->
									<ul class="timeData" style="right: 3px;">
										<li class="timeDataList  topRadius"  style="cursor:pointer;">近一个月</li><!--去掉listBottomBorder类-->
										<li class="timeDataList ">近一个季度</li>
										<li class="timeDataList bottomRadius">近半年</li>
									</ul>
								</div>
							</div>
							<div class="dayDataMain" id="daymain" style="height:320px; width: 104%;"></div>
						</div>
						<div class="contentData" style="position: relative;border-top: 2px solid #57a3f1;margin-top: 10px;"><!--增加了旅客归属区域-->
								<div class="contentHead">
									<div class="fl contentDataHeadLeftImg"><img src="img/dingwei.png"/></div>
									<div class="fl contentDataHeadLeftText">旅客归属</div>
									<div class="fr zheArea" >
										<div class=" zheList threeZhe"></div>
									</div> 
									<input id="Hidden1" type="hidden"  value="1" class="fr"/>
										<div class="fr " style="margin-right:5px;position: relative;">
										<div class="clearfix dayArea">
											<div class=" belongTimeText fl" >近一个月</div>
											<div class="timeTextRight fl"></div>
										</div>
											<ul class="belongDayAreaLeft belongData " style="right:0px;background: #ffffff">
												<div class="dateTitle date1">按日期选择</div>
												<div class="dateList">
													<li class="belongDayButton belongButtonActive">近一个月</li>
													<li class="belongDayButton  dayButtonMt">近一季度</li>
													<li class="belongDayButton   dayButtonMt">近半年</li>
												</div>
												
												<div class="dateTitle date2 bt">按节假日选择</div>
												<div class="holidayList" id="holidayList">
													<li class="clearfix belogYearArea">
														<select class="fl belogYearText" id="belogYearText">请选择年份</select>
													</li>
													<!-- <li class="belongDayButton  clearfix">元旦节</li>
													<li class="belongDayButton  dayButtonMt">清明节</li>
													<li class="belongDayButton  dayButtonMt">五一节</li>
													<li class="belongDayButton   dayButtonMt">端午节</li>
													<li class="belongDayButton   dayButtonMt">中秋节</li>
													<li class="belongDayButton   dayButtonMt">国庆节</li> -->
												</div>
											</ul>
										</div>
							
									
								</div>
								<div class="dataTableHead">
									<ul class="dataTableHeadList  fl">
										<li class="fl sceneryTableHeadListLi tableHeadListLine sceneryTableHeadListLiStyle leftRadius threeTime sceneryHour" >省</li>
										<li class="fl sceneryTableHeadListLi rightRadius threeTime sceneryMonth">市</li>
									</ul>
								</div>
								<div class="sceneryDataMain" id="touristsAttribute">
								</div>	
							</div>
					</div>
				</div>
				<div>
					<footer id="footer-bar" class="row" style="height:40px;">
					<p id=footer-copyright class="col-xs-12"
						style="font-size:13px;color:#333;">2016 &copy; 中国移动集团安徽有限公司</p>
					</footer>
				</div>
			</div>
		</div>
	</div>

	<!-- 退出系统确认弹出框开始 -->
	<div class="modal fade" id="loginOutModel" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true"
		data-backdrop="false">
		<div class="modal-dialog" style="margin-top:10%;width:300px;">
			<div class="modal-content" style="border-radius:5px;border:none;">
				<div class="modal-header addHead" style="padding-left:8px">
					<input type="hidden" value="" id="unidOfchangeStatus" /> 
					<input type="hidden" value="" id="statusOfchangeStatus" />
					<div type="button" class="fr closeButton" data-dismiss="modal"
						aria-hidden="true" style="width:15px;height: 15px;"></div>
					<h4 class="modal-title" id="myModalLabel"
						style="background:url(img/tishi.png) no-repeat left center;padding-left: 26px;font-size:18px;font-family:'微软雅黑';color:#ffffff;">
						提示</h4>
				</div>
				<div class="modal-body"
					style="color:#666666;text-align:center;font-size:16px;"
					id="comfirmMsg">
					<!--添加文区域-->
					您确认要退出系统吗？
				</div>
				<div class="buttonArea">
					<button type="submit" class="buttonConfirm" onclick="loginOut();"
						data-dismiss="modal">确 定</button>
					<button type="submit" class="buttonConfirm"
						style="background:#D5D5D5;" data-dismiss="modal"
						aria-hidden="true">取 消</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 退出系统确认弹出框结束 -->
	<script src="<%=path %>/js/echarts/echarts.min.js"></script>
	<script src="<%=path %>/js/demo-skin-changer.js"></script>
	<script src="<%=path %>/js/jquery.js"></script>
	<script src="<%=path %>/js/bootstrap.js"></script>
	<script src="<%=path %>/js/bootstrap-treeview.js"></script>
	<script src="<%=path %>/js/jquery.nanoscroller.min.js"></script>
	<script src="<%=path %>/js/demo.js"></script>
	<script src="<%=path %>/js/scripts.js"></script>
    <script src="<%=path %>/js/echarts/echarts.min.js"></script>
	<script src="<%=path %>/js/echarts/macarons.js"></script>
	<script src="<%=path %>/js/xFormate/xFormate.js"></script>
	<script src="<%=path %>/js/lyz.calendar.min.js" type="text/javascript"></script>
	<!-- 引用js函数的jsp页面 -->
	<jsp:include flush='true' page='cityFlow_js.jsp'></jsp:include>
	<script type="text/javascript">
	window.onload = function(){
		var liName = document.getElementById("getMenus").getElementsByTagName("span");
		for(i=0;i<liName.length;i++){
			if(liName[i].innerHTML=="城市客流"){
				liName[i].parentNode.parentNode.style.backgroundColor= "black";
				//liName[i].parentNode.parentNode.style.borderColor= "#3498db"
			    //liName[i].parentNode.parentNode.style.borderLeft= "4px solid transparent"
			    liName[i].style.color="#fff";
				liName[i].style.fontsize="17px";
			}
		}
		
		var imgName = document.getElementById("getMenus").getElementsByTagName("img");
		for(i=0;i<imgName.length;i++){
			if(imgName[i].src.substring(imgName[i].src.lastIndexOf("/")+1)=="leftcity.jpg"){
			   imgName[i].src=imgName[i].src.substring(0,imgName[i].src.lastIndexOf("/")+1)+"leftcitylink.png";
			}
		}
	};
	$(document).ready(function () {
		loadMenus();		
		getSelectDataListClik();//加载数据后赋予点击事件		
	});
	
		//选择城市
		$("#selectText").on("click", function(e) {
			if ($("#selectList").is(":hidden")) {
				$("#selectList").show();
			} else {
				$("#selectList").hide();
			}

			$(document).one("click", function() {
				$("#selectList").hide();
			});

			e.stopPropagation();
		});
		$("#selectList").on("click", function(e) {
			e.stopPropagation();
		});
			
		//选择客
		$(".sai").on("click", function(e) {
			if ($(".saiData").is(":hidden")) {
				$(".saiData").show(500);
				$(".sai").addClass("saiActive");
			} else {
				$(".saiData").hide(500);
				$(".sai").removeClass("saiActive");
			}

			$(document).one("click", function() {
				$(".saiData").hide(500);
			});

			e.stopPropagation();
		});
		$(".saiData").on("click", function(e) {
			e.stopPropagation();
		});
		//选择旅客或游客，单击后改变样式

		$(".saiDataList").click(function() {
			$(this).removeClass("saiDataList");
			$(this).addClass("saiDataListActive");
			$(".saiData").hide(500);
			$(this).siblings().addClass("saiDataList");
			$(this).siblings().removeClass("saiDataListActive");
		});
		//展开收起30天人数分析的折线表
		$(".zhe").click(function() {
			var Cwidth  = $(".contentDataMain").width();
			$(".contentDataMain").toggle();
			document.getElementById("citymain").style.width=Cwidth+"px";
		});
		//选择时间段
		$(".timeText").on("click", function(e){//更改
			if($(".timeData").is(":hidden")){
		    	$(".timeData").show();
		    	
		    }else{
		    	$(".timeData").hide();
		    	
		    }
		
		    $(document).one("click", function(){
		        $(".timeData").hide();
		    });
		
		    e.stopPropagation();
		});
		$(".timeData").on("click", function(e) {
			e.stopPropagation();
		});
		//选择时间段后，单击后改变样式
		$(".timeDataList").click(function(){
			$(this).removeClass("timeDataList");
			$(this).addClass("timeDataListActive");
			$(".timeData").hide(500);
			$(this).siblings().addClass("timeDataList");
			$(this).siblings().removeClass("timeDataListActive");
		});
		//展开收起几日游分析线条表
		$(".twoZhe").click(function() {
			var dWidth = $(".dayDataMain").width();
			$(".dayDataMain").toggle();
			document.getElementById("daymain").style.width=dWidth+"px";
		});
		
		$(".saiText").on("click", function(e){
			if($(".saiData").is(":hidden")){
		    	$(".saiData").show();
		    	$(".sai").addClass("saiActive");
		    }else{
		    	$(".saiData").hide();
		    	$(".sai").removeClass("saiActive");
		    }
		
		    $(document).one("click", function(){
		        $(".saiData").hide();
		    });
		
		    e.stopPropagation();
		});
		
		//景区数据内，选择时间，单击在左边显示	
	$('.timeDataList').click(function() {    
	    $(".timeText").html($(this).text());    
	});
	//景区数据内，选择时间，单击在左边显示	
	$('.saiDataList').click(function() {    
	    $(".saiText").html($(this).text());    
	});
		/* //景区数据内，选择时间，单击在左边显示	
		 $('.timeDataList').click(function() {
		 	console.log($(this).text());
			$(".timeText").html($(this).text());
		}); 
		//景区数据内，选择时间，单击在左边显示	
		$('.saiDataList').click(function() {
			$(".saiText").html($(this).text());
		}); */  
		function autoHeight() {//自动获取屏幕高度后，设置报表高度
			var blueHeight = document.getElementById("blueHeight").offsetHeight;//最上面蓝色导航栏高度
			var windowHeight = $(window).height();
			var mainHeight = (windowHeight - blueHeight);
		//	var contentMainHeight = document.getElementById("contentMainHeight").offsetHeight;//景区客流高度
			var displayTextHeight = document.getElementById("contentHead1").offsetHeight;//	游客数量一行高度
			var displayBiliTextHeight = document.getElementById("contentHead2").offsetHeight;
			var footerHeight = document.getElementById("footer-bar").offsetHeight;
			//var commonHeight=mainHeight-dataTableHeadHeight-displayTextHeight-displayBiliTextHeight-contentMainHeight-footerHeight-150;
			var commonHeight = windowHeight  - blueHeight
					- displayTextHeight  - 20;
			document.getElementById("citymain").style.height = commonHeight * 0.8 + "px";
			document.getElementById("daymain").style.height = commonHeight * 0.8 + "px";
			document.getElementById("touristsAttribute").style.height = commonHeight * 0.8+ "px";
			var contentwrapperHeight = windowHeight + commonHeight * 1.8;
			document.getElementById("content-wrapper").style.cssText = "min-height:" + contentwrapperHeight + "px";
		}

		 function refreshEcharsWidth(){
			document.getElementById("mainW").style.width = 100 + "%";//内容宽度
			var leftDivWidth = 98;
			var windowWidth = window.innerWidth;
			var leftDiv = document.getElementById("page-wrapper");
			var leftDivClassName = leftDiv.className;
			if (leftDivClassName == "container") {
				leftDivWidth = 98;
			} else {
				leftDivWidth = 256;
			}
			document.getElementById("citymain").style.width = windowWidth
					- leftDivWidth + "px";
					document.getElementById("daymain").style.width = windowWidth
					- leftDivWidth + "px";
			getData1();
			getData2();
		} 
		
			
	function getSelectDataListClik(){
		//选择城市动态赋值
		$("#selectList").children("li").click(function(){
			selectTouristId = $(this).attr("id");//记录选择的城市id
			$(".selectText").html($(this).text());
			$("#selectList").hide();
			getData1();
			getData2();
			initPillarChart();
		});
	}
	
	//以下是   旅客归属区域增加js的部分
//选择省市，单击后改变样式
		$(".threeTime").click(function(){
			$(this).addClass("sceneryTableHeadListLiStyle");
			$(this).siblings().removeClass("sceneryTableHeadListLiStyle");
			pillarBothSelect = $(this).html();
			if(pillarBothSelect == "省"){
				pillarBothSelect = "sheng";
			}else if (pillarBothSelect == "市"){
				pillarBothSelect = "shi";
			}
			initPillarChart();
		});
//展开收起旅客属性区域
	 $(".threeZhe").click(function(){
	    $(".sceneryDataMain").toggle();
	  });
 //点击左侧字展开
   	$(".dayArea").on("click", function(e){//更改
		if($(this).siblings(".belongData").is(":hidden")){
	    	$(this).siblings(".belongData").show();
	    	
	    }else{
	    	$(this).siblings(".belongData").hide();
	    	
	    }
	    $(document).one("click", function(){
	        $(".dayArea").siblings(".belongData").hide();
	    });
	    e.stopPropagation();
	});
	//选择日期还是节假日
	$(".date1").click(function(e){
		e.stopPropagation();
		$(".belongData").show();
		$(".holidayList").hide();
	    $(".dateList").toggle();
	    $(".dateList").css("margin-bottom","5px");
	  });
	  $(".date2").click(function(e){
		e.stopPropagation();
		$(".belongData").show();
		$(".dateList").hide();
	    $(".holidayList").toggle();
	  });
	//选择年份左侧展开继续显示
	$(".belogYearText").on("click", function(e){
		 e.stopPropagation();
		 event.stopPropagation();
		$(".belongData").show();
		$(".belogYearText").css("color","#666666");
	});
	$(".belongDayButton").on("click", function(e){
		$(".belongData").hide();
		$(this).addClass("belongButtonActive");
		$(this).siblings().removeClass("belongButtonActive");
		$(this).parent().siblings().children().removeClass("belongButtonActive");
		$(".belongTimeText").html($(this).text());
		pillarTimeSelect = $(this).text();
		if(pillarTimeSelect == "近一个月" || pillarTimeSelect == ""){
			pillarTimeSelect = "";
		}else if(pillarTimeSelect == "近一季度"){
			pillarTimeSelect = "-2";
		}else if(pillarTimeSelect == "近半年"){
			pillarTimeSelect = "-5";
		}
		stat_date = "";
		initPillarChart();
	});
/* var currentYear = new Date().getFullYear();
    var select = document.getElementById("belogYearText");
    for (var i = 0; i <= 4; i++) {
        var theOption = document.createElement("option");
        theOption.innerHTML = currentYear+i + " 年";
        theOption.value = currentYear-i;
        select.appendChild(theOption);
    }  */
    
//近一个月
	//点击左侧字展开
   	$(".dayArea").on("click", function(e){//更改
   		
		if($(this).siblings(".timeData").is(":hidden")){
	    	$(this).siblings(".timeData").show();
	    	
	    }else{
	    	$(this).siblings(".timeData").hide();
	    	
	    }
	    $(document).one("click", function(){
	        $(".dayArea").siblings(".timeData").hide();
	    });
	    e.stopPropagation();
	});
	//选择日期还是节假日
	$(".date3").click(function(e){
		e.stopPropagation();
		$(".timeData").show();
		$(".timeHolidayList").hide();
	    $(".timeDayList").toggle();
	    $(".timeDayList").css("margin-bottom","5px");
	  });
	  $(".date4").click(function(e){
		e.stopPropagation();
		$(".timeData").show();
		$(".timeDayList").hide();
	    $(".timeHolidayList").toggle();
	  });
	//选择年份左侧展开继续显示
	$(".belogYearArea").on("click", function(e){
		 e.stopPropagation();
		 event.stopPropagation();
		$(".belongDayAreaLeft").show();
		$(".belogYearText").css("color","#666666");
	});
	$(".dayButton").on("click", function(e){
		$(".timeData").hide();
		$(this).addClass("dayButtonActive");
		$(this).siblings().removeClass("dayButtonActive");
		$(this).parent().siblings().children().removeClass("dayButtonActive");
		$(".timeTextLeft").html($(this).text());
	});
//var currentYear = new Date().getFullYear();
//    var select = document.getElementById("yearText");
//    for (var i = 0; i <= 4; i++) {
//        var theOption = document.createElement("option");
//        theOption.innerHTML = currentYear-i + " 年";
//        theOption.value = currentYear-i;
//        select.appendChild(theOption);
//    }
	</script>
</body>
</html>