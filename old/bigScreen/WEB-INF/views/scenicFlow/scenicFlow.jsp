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
<title>景区客流</title>
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
</head>
<jsp:include page="../common.jsp"></jsp:include>
<style  type = "text/css">
html {
	overflow-x: hidden;
}

#content-wrapper {
	background: #e7ebee;
	height: 100%;
	margin-top: 0;
	margin-bottom: 0;
	position: relative;
	padding: 15px 15px 35px 15px;
}

a{text-decoration: none;color: #ffffff;}
a:hover{background: red;}
</style>
<body>
		<div id="page-wrapper" class="container" style="width:100%;margin:0">
			<div class="row" style="background:#343e4a">
				<%@include file="../left.jsp" %>
				<div  class="clearfix" id="content-wrapper" style="min-height:900px;">
					<div class="fl" style="width: 100%;background: #eceff4;" id="content">
						<div class="main"><!--景区客流显示的所有区域-->
						<!-- <div class="contentMain" id="contentMainHeight" >
								景区客流
							</div> -->	
							<div class="contentData" style="position: relative;" id="AllcontentData">
								<div class="contentHead clearfix" id="contentHead1">
									<div class="fl contentDataHeadLeftImg"><img src="img/personnum.png"/></div>
									<div class="fl contentDataHeadLeftText">游客数量</div>
									<div class="fr zheArea" >
										<div class="zhe zheList "></div>
									</div> 
									<div class="fr saiArea" style="position: relative;right:3px;">
										<div class="sceneryText" ></div>
										<!-- <div class="scenery"  ></div> 去掉小旗子-->
										<ul class="sceneryData" id="sceneryData" style="right:3px;">
										</ul>
									</div>
								</div>
								<div class="dataTableHead" id="dataTableHeadHeight">
									<ul class="dataTableHeadList sceneryTableHeadListWidth fl">
										<li class="fl sceneryTableHeadListLi tableHeadListLine sceneryTableHeadListLiStyle leftRadius threeTime sceneryHour" >小时</li>
										<li class="fl sceneryTableHeadListLi tableHeadListLine threeTime sceneryDay">日期</li>
										<li class="fl sceneryTableHeadListLi rightRadius threeTime sceneryMonth">月份</li>
									</ul>
									<ul class="dataTableHeadList hourTableListWidth fl">
										<li class="fl sceneryTableHeadListLi tableHeadListLine hourList sceneryTableHeadListLiStyle leftRadius">累计</li>
										<li class="fl sceneryTableHeadListLi hourList rightRadius">新增</li>
									</ul>
								</div>
								<!-- 折线图区域 -->
								<div class="sceneryDataMain" id="sceneryDataMain" style="width:100%;">
									
									
								</div>	
							</div>
							<div class="contentData dayData">
								<div class="contentHead"  id="contentHead2">
									<div class="fl contentDataHeadLeftImg"><img src="img/persondata.png"/></div>
									<div class="fl contentDataHeadLeftText">景区数据</div>
									<div class="fr zheList twoZhe" >
										
									</div> 
									<div class="fr timeArea"  style="position: relative;right:3px;">
										<div class="clearfix dayArea" >
											<div class="timeTextLeft fl">近一个月</div>
											<div class="timeTextRight fl"></div>
										</div>
										<!--<div class="time" ></div>-->
										<ul class="dayAreaLeft timeData" style="right: 3px;">
											<div class="dateTitle date3">按日期选择</div>
											<div class="timeDayList">
												<li class="dayButton dayButtonActive">近一个月</li>
												<li class="dayButton  dayButtonMt">近一季度</li>
												<li class="dayButton  dayButtonMt">近半年</li>	
											</div>
											<div class="dateTitle date4 bt">按节假日选择</div>
											<div class="timeHolidayList">
												<li class="clearfix yearArea">
													<select class="fl yearText" id="yearText">请选择年份</select>
												</li>
											<!-- 	<li class="dayButton  clearfix">元旦节</li>
												<li class="dayButton dayButtonMt">清明节</li>
												<li class="dayButton dayButtonMt">五一节</li>
												<li class="dayButton  dayButtonMt">端午节</li>
												<li class="dayButton  dayButtonMt">中秋节</li>
												<li class="dayButton  dayButtonMt">国庆节</li>
												 -->
											</div>
											
										</ul>
									</div>
									<div class="fr timeArea2"  style="position: relative;right:3px;display: none;">
										<div class="clearfix dayArea" >
											<div class="  fl timeTextLeftTwo">近一个月</div>
											<div class="timeTextRight fl"></div>
										</div>
										<ul class="areaTimeData"  style="right: 3px;display: none;z-index:999">
											<li class="timeDataList  biliDisplayList  ">近一个月</li><!--去掉下面的listBottomBorder-->
											<li class="timeDataList  biliDisplayList ">近一个季度</li>
											<li class="timeDataList biliDisplayList ">近半年</li>
										</ul>
									</div>
								</div>
								<div class="dataTableHead dataTableHeadData">
									<ul class="dataTableHeadList  fl">
										<li id="rank" class="fl  tableHeadListLine sceneryTableHeadListLiStyle leftRadius dataHeadLi per">人数排行</li>
										<li id="stay" class="fl  rightRadius dataHeadLi stay">驻留时间</li>
									</ul>
								</div>
								<div id="dataMain" class="dataMain" id="dataMain">
									
								</div>	
							</div>
				    	</div>
				    </div>			
					<div class="clearfix">
						<footer id="footer-bar" class="row" style="height:40px;">
						<p id=footer-copyright class="col-xs-12"
							style="font-size:13px;color:#333;">2016 &copy; 中国移动集团安徽有限公司</p>
						</footer>
					</div>
				</div>
			</div>
		</div>
	
	<!-- 退出系统确认弹出框开始 -->
	<div class="modal fade" id="loginOutModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="false">
		<div class="modal-dialog" style="margin-top:10%;width:300px;">
			<div class="modal-content" style="border-radius:5px;border:none;">
				<div class="modal-header addHead">
					<input type="hidden" value="" id="unidOfchangeStatus" />
					<input type="hidden" value="" id="statusOfchangeStatus" />
					<div type="button" class="fr closeButton" data-dismiss="modal" aria-hidden="true" style="width:15px;height: 15px;">
					</div>
					<h4 class="modal-title" id="myModalLabel"  style="background:url(img/tishi.png) no-repeat left center;padding-left: 26px;font-size:18px;font-family:'微软雅黑';color:#ffffff;">
						提示
					</h4>
				</div>
				<div class="modal-body"  style="color:#666666;text-align:center;font-size:16px;" id="comfirmMsg"><!--添加文区域-->
					您确认要退出系统吗？
				</div>
				<div  class="buttonArea">
					<button type="submit" class="buttonConfirm" onclick="loginOut();" data-dismiss="modal">确 定</button>
					<button type="submit" class="buttonConfirm"  style="background:#D5D5D5;" data-dismiss="modal" aria-hidden="true">取 消</button>
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
	<jsp:include flush='true' page='scenicFlow_js.jsp'></jsp:include>
	
	<script>
	window.onload = function(){
		var liName = document.getElementById("getMenus").getElementsByTagName("span");
		for(i=0;i<liName.length;i++){
			if(liName[i].innerHTML=="景区客流"){
				liName[i].parentNode.parentNode.style.backgroundColor= "black";
				liName[i].style.color="#fff";
				liName[i].style.fontsize="17px";
			}
		}
		
		var imgName = document.getElementById("getMenus").getElementsByTagName("img");
		for(i=0;i<imgName.length;i++){
			if(imgName[i].src.substring(imgName[i].src.lastIndexOf("/")+1)=="leftkeliu.jpg"){
				
			   imgName[i].src=imgName[i].src.substring(0,imgName[i].src.lastIndexOf("/")+1)+"leftkeliulink.png";
			}
		}
	};
	//选择城市
	var tim;//时间类型
	var hourList;//小时类型
	var scenic;//地区
	var timeType;// 景区数据时间类型
	
	function getSelectDataListClik(){
		//选择城市动态赋值
		$(".selectDataList").click(function(){
			selectTouristId = $(this).attr("id");//记录选择的城市id
			$(".selectText").html($(this).text());
			$(".sceneryText").html("");
			$("#sceneryData").find("li").remove();
			getScenicByTouristid();//获取景区
			$("#selectList").hide();
			changeType();
			if (state=="2" ){
				initStayChart();
			}else{
				initRankChart();
				}
		});
	}
	function getScenicByTouristid(){
		$.ajax({
					url : "<%=path%>/touristPhoto/getScenicByUser.html?Math.random()",
					dataType : "json",
					type : "POST",
					async : false,
					data : {
						selectTouristId : selectTouristId
					},
					success : function(data) {
						$("#sceneryData").append(
								"<li class='saiDataListActive ' id='0'>全部景区</li>");
						for(var index in data){
							$("#sceneryData").append(
						"<li class='saiDataList ' id="+data[index].scenicid+">"+data[index].scenicName+"</li>");
						};
						$(".sceneryText").html("全部景区");
					},
					error : function(data) {
						//toastr.error("获取省市内容出错！");
					}
			});
		}
		
   	$("#selectText").on("click", function(e){
   		scenic="";
		if($("#selectList").is(":hidden")){
	    	$("#selectList").show();
	    }else{
	    	$("#selectList").hide();
	    }
	
	    $(document).one("click", function(){
	        $("#selectList").hide();
	    });
		$(".sceneryData").hide(500);
	    e.stopPropagation();
	});
	$("#selectList").on("click", function(e){
	    e.stopPropagation();
	});
	
	//选择景区
   	$(".sceneryText").on("click", function(e){
		if($(".sceneryData").is(":hidden")){
	    	$(".sceneryData").show();
	    	
	    }else{
	    	$(".sceneryData").hide();
	    	
	    }
	
	    $(document).one("click", function(){
	        $(".sceneryData").hide();
	    });
		$("#selectList").hide();
	    e.stopPropagation();
	});
	$(".sceneryData").on("click", function(e){
	    e.stopPropagation();
	});
	//选择景区，单击后改变样式
		$("#sceneryData").delegate(".saiDataList","click",function(){
			$(".sceneryText").html($(this).text());
	   	 scenic = $(this).attr("id");  //给景区赋值
	   	 $(".sceneryData").hide();
	   	 changeType();
			$(this).removeClass("saiDataList");
			$(this).addClass("saiDataListActive");
			$(".sceneryData").hide();
			$(this).siblings().addClass("saiDataList");
			$(this).siblings().removeClass("saiDataListActive");
		});
	//展开收起30天人数分析的折线表
	 $(".zhe").click(function(){
	 	var Swidth=$("#sceneryDataMain").width();
		$("#sceneryDataMain").toggle();
		document.getElementById("sceneryDataMain").style.width=Swidth+"px";
	  });
// 	//选择时间段
	
	$(".areaTimeData").on("click", function(e){
	    e.stopPropagation();
	});
	
	//展开收起几日游分析线条表
	 $(".twoZhe").click(function(){
	 	var Dwidth = $(".dataMain").width();
	    $(".dataMain").toggle();
	    document.getElementById("dataMain").style.width=Dwidth+"px";
	    
	  });
	//选择小时日期月份，单击后改变样式
		$(".threeTime").click(function(){
			$(this).addClass("sceneryTableHeadListLiStyle");
			$(this).siblings().removeClass("sceneryTableHeadListLiStyle");
			if ($(this).text()=="日期") {
				tim=1;
			}else if($(this).text()=="月份"){
				tim=2;
			}else{
				tim=0;
			}
			changeType();
		});
	//展开收起小时对应的累计和新增
	 $(".sceneryHour").click(function(){
	    $(".hourTableListWidth").toggle();
	  });
	//点击日期和月份隐藏累计和新增
	 $(".sceneryDay").click(function(){
	    $(".hourTableListWidth").hide();
	  });
	 $(".sceneryMonth").click(function(){
	    $(".hourTableListWidth").hide();
	  });
	//选择小时累计和新增，单击后改变样式
		$(".hourList").click(function(){
			$(this).addClass("sceneryTableHeadListLiStyle");
			$(this).siblings().removeClass("sceneryTableHeadListLiStyle");
			if($(this).text()=="新增"){
				hourList=1;
			}else{
				hourList=0;
			}
			changeType();
		});
	//选择人数排行驻留时间，单击后改变样式
		$(".dataHeadLi").click(function(){
			$(this).addClass("sceneryTableHeadListLiStyle");
			$(this).siblings().removeClass("sceneryTableHeadListLiStyle");
		});
	//景区数据内，选择时间，单击在左边显示	
// 	$('.timeDataList').click(function() {    
// 	    $(".timeTextLeftTwo").html($(this).text());    
// 	});
		//游客数量折线图
		$(document).ready(function(){
			changeType();
		})
		function changeType(){//加载折线图图表
			$("#sceneryDataMain").empty();	
			var x=[];
			var bensheng=[];
			var waisheng=[];
			var itv=0;
			if(tim=='1'){
				itv=4;
			}
			else{
				itv=0;
			}
			$.ajax({
				url:"<%=path%>/scenicFlow/touristNum.html?"+new Date(),
				async:false, 
				type:"POST",
				dataType:"json",
				data:{timeType:tim,scenicId:scenic,hourType:hourList,cityId:selectTouristId},
				success:function(data){
					for(var i=0;i<data.length;i++){
							x.push(data[i].time);
							bensheng.push(data[i].benShengNum);
							waisheng.push(data[i].waiShengNum);
					}
					xName=formateX4(bensheng,waisheng);
				},
				error : function(errorMsg) {
			         alert("图表请求数据失败啦!");
			         myPillarChart.hideLoading();
	   			  }
			});
			var echart1 = echarts.init(document.getElementById("sceneryDataMain"),"macarons");
			var option1 = {
			     legend: {
			        data:['省内','省外']//头部显示线条颜色介绍
			    }, 
			    grid: {//折线图位置
			        x: '3%',
			        x2: '3%',
			        y2: '10%',
			        containLabel: true
			    },
			    xAxis: {//X坐标
			        type: 'category',
			        boundaryGap: false,
			        data:x,
			        show : true,
			        axisLabel:{
			        	interval:itv,
			        	//rotate: 40,//倾斜度数
			        	formatter:function(val){
  						  return val;
						}  
			        }
           		   },
			    yAxis: {
			        type: 'value',
			        name : '单位('+xName+')'
			    },
			     tooltip : {
         	    			trigger: 'axis',
  				      		formatter:function (params,ticket,callback) {
  				      			console.log(params[0].value);
  				      			if(params[0].value=="" || params[0].value==null){
  				      				params[0].value="0"
  				      			}
  				      			if(params[1].value=="" ||params[0].value==null){
  				      				params[1].value="0"
  				      			}
  				      			var data = params[0].name+"<br/><div style='display:inline-block;width:12px;height:12px;background:green;border-radius:50%'></div>"+" 省内："+params[0].value+xName+
  				      			"<br/><div style='display:inline-block;width:12px;height:12px;background:red;border-radius:50%'></div> 省外："+params[1].value+xName;
  				      			return data;
  				      		
  				  		 	 }	
  				  		  },
			    series: [//线条
			        {
			            name:'省内',
			            type:'line',
			            itemStyle:{
                		 	normal:{color:'green'}
             					 },
			            data:bensheng,
			        },
			        {
			            name:'省外',
			            type:'line',
			            itemStyle:{
                		 	normal:{color:'red'}
             					 },
			            data:waisheng
			        }
			    ]
			};
			echart1.setOption(option1)
		};
		 function autoHeight(){//自动获取屏幕高度后，设置报表高度
			var blueHeight=document.getElementById("blueHeight").offsetHeight;//最上面蓝色导航栏高度
			var windowHeight=$(window).height();
			var mainHeight=(windowHeight-blueHeight);
			//var contentMainHeight=document.getElementById("contentMainHeight").offsetHeight;//景区客流高度
			var dataTableHeadHeight=document.getElementById("dataTableHeadHeight").offsetHeight;//小时日期月份一行
			var displayTextHeight = document.getElementById("contentHead1").offsetHeight;//	游客数量一行高度
			var displayBiliTextHeight = document.getElementById("contentHead2").offsetHeight;
			var footerHeight = document.getElementById("footer-bar").offsetHeight;
			//var commonHeight=mainHeight-dataTableHeadHeight-displayTextHeight-displayBiliTextHeight-contentMainHeight-footerHeight-150;
			var commonHeight=windowHeight-dataTableHeadHeight-blueHeight-displayTextHeight-20;
			document.getElementById("sceneryDataMain").style.height = commonHeight + "px";
			document.getElementById("dataMain").style.height = commonHeight*0.8 + "px";
			var contentwrapperHeight=windowHeight+commonHeight*1.2;
			document.getElementById("content-wrapper").style.cssText="min-height:"+contentwrapperHeight+"px";
			//alert(mainHeight)
			//document.getElementById("contentHeightMenu").style.cssText="height:"+iframeHeight+"px;"+"width: 100%;MARGIN-top: 1px;";
		}
		function formateX4(xAxis1,xAxis2){
			var max1=Math.max.apply(null, xAxis1);
			var max2=Math.max.apply(null, xAxis2);
			var max=Math.min(max1,max2)
			if(max>10000){
				for (var i = 0; i < xAxis1.length; i++) {
					if (xAxis1[i]!="") {
						xAxis1[i]=(xAxis1[i]/10000).toFixed(2);
					}
				}
				for (var i = 0; i < xAxis2.length; i++) {
					if (xAxis2[i]!="") {
						xAxis2[i]=(xAxis2[i]/10000).toFixed(2);
					}
				}
				return "万人";
			}else if(max>1000) {
				for (var i = 0; i < xAxis1.length; i++) {
					if (xAxis1[i]!="") {
						xAxis1[i]=(xAxis1[i]/1000).toFixed(2);
					}
					
				}
				for (var i = 0; i < xAxis2.length; i++) {
					if (xAxis2[i]!="") {
						xAxis2[i]=(xAxis2[i]/1000).toFixed(2);
					}
					
				}
				return "千人";
			}else{
				return "人";
			}
		}
		
		//选择景区，单击在左边显示	
		$('.saiDataList').click(function() {  
		    $(".sceneryText").html($(this).text());    
		}); 
		//景区数据内，选择时间，单击在左边显示	
		$('.timeDataList').click(function() { 
			
		    $(".timeTextLeftTwo").html($(this).text());    
		}); 
		
		$(".timeDataList").click(function(){
		//	$(this).removeClass("timeDataList");
			$(this).addClass("timeDataListActive");
			$(".timeData").hide(500);
		//	$(".areaTimeData").hide(500);
			$(this).siblings().addClass("timeDataList");
			$(this).siblings().removeClass("timeDataListActive");
		});
		
		$(".per").click(function(){
			$(".timeArea2").hide();
			$(".timeArea").show();
		})
		$(".stay").click(function(){
			$(".timeArea2").show();
			$(".timeArea").hide();
		})
		
		
		//近一个月(添加部分)
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
		//只显示日期段不显示节假日
		$(".dayArea").on("click", function(e){//更改
	   		
			if($(this).siblings(".areaTimeData").is(":hidden")){
		    	$(this).siblings(".areaTimeData").show();
		    	
		    }else{
		    	$(this).siblings(".areaTimeData").hide();
		    	
		    }
		    $(document).one("click", function(){
		        $(".dayArea").siblings(".areaTimeData").hide();
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
		$(".yearArea").on("click", function(e){
			 e.stopPropagation();
			 event.stopPropagation();
			$(".dayAreaLeft").show();
			$(".yearText").css("color","#666666")
		})
		$(".dayButton").on("click", function(e){
			$(".timeData").hide();
			$(this).addClass("dayButtonActive");
			$(this).siblings().removeClass("dayButtonActive");
			$(this).parent().siblings().children().removeClass("dayButtonActive");
			$(".timeTextLeft").html($(this).text());
		})
     	var currentYear = new Date().getFullYear();
	/*    var select = document.getElementById("yearText");
	    for (var i = 0; i <= 4; i++) {
	        var theOption = document.createElement("option");
	        theOption.innerHTML = currentYear+i + " 年";
	        theOption.value = currentYear-i;
	        select.appendChild(theOption);
	    }
     */
	</script>
</body>
</html>