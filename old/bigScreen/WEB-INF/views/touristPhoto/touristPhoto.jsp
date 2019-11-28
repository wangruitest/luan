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
<%
	HttpSession Session = request.getSession();
String userName=null;
List<SysUser> userList = (List<SysUser>)Session.getAttribute("user");
userName = userList.get(0).getName();
if(userName==null||userName.equals("")||userName.equals("null")){
 userName=userList.get(0).getUsername();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>游客画像</title>
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
	padding: 15px 15px 35px 15px;
}
#header-navbar .nav>li>a {
    font-size: 0.875em;
    padding-left: 20px;
    padding-right: 20px;
    color: #484848;
    border: none;
    border-radius: 0;
    background-clip: padding-box;
}
a{text-decoration: none;color: #ffffff;}
a:hover{cursor: pointer;color: #fff;text-decoration: none;}
.photobelongText,.biliText,.timeText,.photosceneryText,.belongDataList:hover{cursor: pointer;}

.listHover:hover{color:#fff;background:#1f1f1f;border-left:none;}
</style>
<body>

		<div id="page-wrapper" class="container" style="width:100%;margin:0">
			<div class="row" style="background:#343e4a">
		<%@include file="../left.jsp" %>
				<div id="content-wrapper">
					<div class="fl" style="width: 100%;background: #eceff4;" id="content">
						<div class="main" id="mainHeight">
						<!-- 	<div class="contentMain" id="contentMainHeight">
								游客画像
							</div> -->
							<div class="contentData" style="position: relative;width:100%">
								<div class="contentHead">
									<div class="fl contentDataHeadLeftImg"><img src="img/dingwei.png"/></div>
									<div class="fl contentDataHeadLeftText">游客归属</div>
									<div class="fr zheArea" >
										<div class="zhe zheList "></div>
									</div> 
									<input id="Hidden1" type="hidden"  value="1" class="fr"/>
									<div class="displayHead">
										<div class="fr" style="position: relative;margin-right: 5px;">
											<!-- <div class="scenery"  ></div> -->
											<div class="photosceneryText" >全部景区</div>
											<ul class="sceneryData" id="sceneryData" style="right:0;">
											</ul>
										</div>
										<div class="fr"  style="position: relative;margin-right:5px;">
											<!-- <div class="belong" ></div> -->
											<div class="photobelongText" id="belongText" >近一个月</div>
											<ul class="belongData"  style="right:0px;">
												<li class="belongDataList  listDisplay dayBelong topRadius">近一个月</li>
												<li class="belongDataList  listDisplay dayBelong">近一个季度</li>
												<li class="belongDataList listDisplay dayBelong bottomRadius">近半年</li>
											</ul>
										</div>
									</div>
									<!-- <div class="displayText" id="displayTextHeight">
										<div id="oddTextBelong" class="oddTextBelong fr" style="display:hidden"></div>
										<div id="evenTextBelong" class="evenTextBelong fr"  style="display:hidden"></div>
									</div> -->
								</div>
								<div class="dataTableHead" id="dataTableHeadHeight">
									<ul class="dataTableHeadList  fl">
										<li class="fl sceneryTableHeadListLi tableHeadListLine sceneryTableHeadListLiStyle leftRadius threeTime sceneryHour" >省</li>
										<li class="fl sceneryTableHeadListLi rightRadius threeTime sceneryMonth">市</li>
									</ul>
								</div>
								<div id="pillarChartArea" class="sceneryDataMain" id="sceneryDataMain" style="width: 100%">
									
								</div>	
							</div>
							
							<div class="contentData dayData">
								<div class="contentHead">
									<div class="fl contentDataHeadLeftImg"><img src="img/bili.png"/></div>
									<div class="fl contentDataHeadLeftText">游客比例</div>
									<div class="fr zheList twoZhe" >
										
									</div>
									<input id="Hidden2" type="hidden"  value="1" class="fr"/>
									<div class="displayHead" style="margin-top: 5px">
										<div class="fr saiArea" style="position: relative;margin-right:5px;">
											<div class="biliText">全部景区</div>
											<ul class="biliData"  style="right:0" id="biliData">
												
											</ul>
										</div>
										<div class="fr timeArea"  style="position: relative;margin-right:5px;">
											
											<div class="timeText" id="timeText" style="top:0px;">近一个月</div>
											<ul class="timeData"  style="right:0">
												<li class="timeDataList listBottomBorder biliDisplayList biliTime topRadius">近一个月</li>
												<li class="timeDataList listBottomBorder biliDisplayList biliTime">近一个季度</li>
												<li class="timeDataList biliDisplayList biliTime bottomRadius">近半年</li>
											</ul>
										</div>
									</div>
								</div>
								
								<div class="biliMain" id="biliMain">
									<div id="pieChartArea" class="mainLeft mainArea fl">
									</div>
									<div id="pieChartArea2" class="mainCenter mainArea fl"></div>
									<div id="pieChartArea3" class="mainRight mainArea fl"></div>
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
	
	<!-- 引用js函数的jsp页面 -->
	<jsp:include flush='true' page='touristPhoto_js.jsp'></jsp:include>
	
	<script>
	window.onload = function(){
		var liName = document.getElementById("getMenus").getElementsByTagName("span");
		for(i=0;i<liName.length;i++){
			if(liName[i].innerHTML=="游客画像"){
				liName[i].parentNode.parentNode.style.backgroundColor= "#1f1f1f";
				liName[i].style.color="#fff";
				liName[i].style.fontsize="17px";
			}
		}
		
		var imgName = document.getElementById("getMenus").getElementsByTagName("img");
		for(i=0;i<imgName.length;i++){
			if(imgName[i].src.substring(imgName[i].src.lastIndexOf("/")+1)=="lefthuaxiang.jpg"){
			   imgName[i].src=imgName[i].src.substring(0,imgName[i].src.lastIndexOf("/")+1)+"lefthuaxianglink.png";
			}
		}
	};
	var pillarScenicSelect = "";//柱状图景区参数选择
	var pillarBothSelect = "";//柱状图省内外参数选择
	var pillarTimeSelect = "";//柱状图时间参数选择
	var selectTouristId = "";//选择城市的区域id记录
	var pieTimeSelect = "";//饼状图时间参数选择
	var pieScenicSelect = "";//饼状图景区参数选择
	var pieProvincesAndCitySelect = "";
	
	//选择城市
   	$("#selectText").on("click", function(e){
	    $(".belongData").hide();
	    $(".sceneryData").hide();
	    //$(".selectList").hide();
		if($("#selectList").is(":hidden")){
	    	$("#selectList").show();
	    }else{
	    	$("#selectList").hide();
	    }
	
	    $(document).one("click", function(){
	        $("#selectList").hide();
	    });
	    e.stopPropagation();
	});
	$("#selectList").on("click", function(e){
	    e.stopPropagation();
	});
	
	function getSelectDataListClik(){
		//选择城市动态赋值
		$(".selectDataList").click(function(){
			//$(".oddTextBelong").html("");
			//$(".evenTextBelong").html("");
			 $(".sceneryText").html("全部");
			pillarScenicSelect = "";
			selectTouristId = $(this).attr("id");//记录选择的城市id
			//alert($(this).attr("value"))
			$(".selectText").html($(this).text());
			$("#sceneryData").find("li").remove();
			$("#biliData").find("li").remove();
			getScenicByTouristid();//获取景区
			$(".photosceneryText").html("全部景区");
			$(".biliText").html("全部景区");
			getSaiDataListClik();//柱状图加载数据后赋予点击事件
			getListDisplayClik();//柱状图加载数据后赋予点击事件
			getBiliDisplayList();
			$("#selectList").hide();
			initPillarChart();
			initPieChart();
		});
	}
	
	//选择景区
   	$(".sceneryText").on("click", function(e){
   		$(".belongData").hide();
	    $(".selectList").hide();
		if($(".sceneryData").is(":hidden")){
	    	$(".sceneryData").show();
	    	
	    }else{
	    	$(".sceneryData").hide();
	    	
	    }
	
	    $(document).one("click", function(){
	        $(".sceneryData").hide();
	    });
	
	    e.stopPropagation();
	});
	
   	$(".photosceneryText").on("click", function(e){
   		$(".belongData").hide();
		if($(".sceneryData").is(":hidden")){
	    	$(".sceneryData").show();
	    	
	    }else{
	    	$(".sceneryData").hide();
	    	
	    }
	
	    $(document).one("click", function(){
	        $(".sceneryData").hide();
	    });
	
	    e.stopPropagation();
	});
   	$(".saiDataList").click(function(){
		$(this).removeClass("saiDataList");
		$(this).addClass("saiDataListActive");
		$(".sceneryData").hide(500);
		$(this).siblings().addClass("saiDataList");
		$(this).siblings().removeClass("saiDataListActive");
	});

	$(".sceneryData").on("click", function(e){
	    e.stopPropagation();
	});
	//游客画像，选择景区，单击后改变样式
	function getSaiDataListClik(){
		$(".saiDataList").click(function(){
			$(this).removeClass("saiDataList");
			$(this).addClass("saiDataListActive");
			$(".sceneryData").hide();
			$(".photosceneryText").html($(this).text());
			$(this).siblings().addClass("saiDataList");
			$(this).siblings().removeClass("saiDataListActive");
			pillarScenicSelect = $(this).val();
			initPillarChart();
		});
	}
		
	//展开收起折线表
	 $(".zhe").click(function(){
	 	var sWidth = $(".sceneryDataMain").width();
	    $(".sceneryDataMain").toggle();
	    document.getElementById("pillarChartArea").style.width=sWidth+"px";
	    
	  });
	//选择时间段
   	$(".timeText").on("click", function(e){
		if($(".timeData").is(":hidden")){
	    	$(".timeData").show();
	    	
	    }else{
	    	$(".timeData").hide();
	    	
	    }
	
	    $(document).one("click", function(){
	        $(".timeData").hide();
	    });
		$(".biliData").hide();
	    e.stopPropagation();
	});
	$(".timeData").on("click", function(e){
	    e.stopPropagation();
	});
	//选择时间段后，单击后改变样式
		$(".timeDataList").click(function(){
			$(this).removeClass("timeDataList");
			$(this).addClass("timeDataListActive");
			$(".timeData").hide();
			$(".timeText").html($(this).text());
			$(this).siblings().addClass("timeDataList");
			$(this).siblings().removeClass("timeDataListActive");
			pieTimeSelect = $(this).html();
			initPieChart();
		});
	//展开收起线条表
	 $(".twoZhe").click(function(){
	 	var bWidth = $(".biliMain").width();
	    $(".biliMain").toggle();
	    document.getElementById("biliMain").style.width=bWidth+"px";
	  });
	//选择省市，单击后改变样式
		$(".threeTime").click(function(){
			$(this).addClass("sceneryTableHeadListLiStyle");
			$(this).siblings().removeClass("sceneryTableHeadListLiStyle");
			pillarBothSelect = $(this).html();
			//alert(pillarBothSelect);
			initPillarChart();
		});
	//景区数据内，选择时间，单击在左边显示	
	$('.timeDataList').click(function() {    
	    $(".timeText").html($(this).text());
	}); 
	//游客归属，选择时间段
   	$(".belongText").on("click", function(e){
   		//$(".belongData").hide();
	    $(".sceneryData").hide();
	    $(".selectList").hide();
		if($(".belongData").is(":hidden")){
	    	$(".belongData").show();
	    	
	    }else{
	    	$(".belongData").hide();
	    	
	    }
	
	    $(document).one("click", function(){
	        $(".belongData").hide();
	    });
	
	    e.stopPropagation();
	});
	$(".belongData").on("click", function(e){
	    e.stopPropagation();
	});
	$(".photobelongText").on("click", function(e){
		$(".sceneryData").hide();
		if($(".belongData").is(":hidden")){
	    	$(".belongData").show();
	    	
	    }else{
	    	$(".belongData").hide();
	    	
	    }
	
	    $(document).one("click", function(){
	        $(".belongData").hide();
	    });
	
	    e.stopPropagation();
	});


	//游客归属，选择时间段后，单击后改变样式
		$(".belongDataList").click(function(){
			$(this).removeClass("belongDataList");
			$(this).addClass("timeDataListActive");
			$(".belongData").hide();
			$(".photobelongText").html($(this).text());
			$(this).siblings().addClass("belongDataList");
			$(this).siblings().removeClass("timeDataListActive");
			pillarTimeSelect = $(this).html();
			initPillarChart();
		});
	//游客比例，选择景区
   	$(".biliText").on("click", function(e){
		if($(".biliData").is(":hidden")){
	    	$(".biliData").show();
	    	
	    }else{
	    	$(".biliData").hide();
	    	
	    }
	
	    $(document).one("click", function(){
	        $(".biliData").hide();
	    });
		$(".timeData").hide();
	    e.stopPropagation();
	});
	$(".biliData").on("click", function(e){
	    e.stopPropagation();
	});
	//游客比例，选择时间段后，单击后改变样式\
	function getBiliDataList(){
		$(".biliDataList").click(function(){
			$(this).removeClass("biliDataList");
			$(this).addClass("saiDataListActive");
			$(".biliData").hide();
			$(".biliText").html($(this).text());
			$(this).siblings().addClass("biliDataList");
			$(this).siblings().removeClass("saiDataListActive");
			pieScenicSelect = $(this).val();
			initPieChart();
		});
	}
	
	function getListDisplayClik(){
		$('.dayBelong').click(function(){
				if($("#shijian").html()!=undefined){
					$("#shijian").html($(this).text());
				}else if($(".oddTextBelong").html()==''){
					$(".oddTextBelong").html("<div id='shijian'>"+$(this).text()+"</div>");
				}else{
					$(".evenTextBelong").html("<div id='shijian'>"+$(this).text()+"</div>");
				}
				if($("#shijian").html() == "全部"){
					$("#shijian").html("");
					//document.getElementById("shijian").parent().style.width="0px";
				}
			});
			$('.jin').click(function(){
				if($("#jingqu").html()!=undefined){
					$("#jingqu").html($(this).text());
				}else if($(".oddTextBelong").html()==''){
					$(".oddTextBelong").html("<div id='jingqu'>"+$(this).text()+"</div>");
				}else{
					$(".evenTextBelong").html("<div id='jingqu'>"+$(this).text()+"</div>");
				}
				if($("#jingqu").html() == "全部"){
					$("#jingqu").html("");
					//alert($("#jingqu").parent().offsetWidth)
					//document.getElementById("jingqu").parent().style.width="0px";
				}
			});
	}
	//游客比例，单击在左边显示
	function getBiliDisplayList(){
	$('.biliDisplayList').click(function() { 
		var aa=document.getElementById("Hidden2").value++; 
		var nameb=$(this).parent().attr('class');//点击后的父元素
		if(aa==1){
			 $(".oddTextBili").html($(this).text());
			if(nameb=="biliData"){
					$('.biliScenery').click(function(){
						$(".oddTextBili").html($(this).text());
					});
					$('.biliTime').click(function(){
						$(".evenTextBili").html($(this).text());
					});
	 		}
			if(nameb=="timeData"){
				    $('.biliTime').click(function(){
						$(".oddTextBili").html($(this).text());
					});
					$('.biliScenery').click(function(){
						$(".evenTextBili").html($(this).text());
					});
					
	 		}
		}
	      
	});
	}
	
		
		//根据城市、景区或省份id获取对应的景区名称	
		function getScenicByTouristid(){
			$
				.ajax({
					url : "<%=path%>/touristPhoto/getScenicByUser.html",
					dataType : "json",
					type : "POST",
					async : false,
					data : {
						selectTouristId : selectTouristId
					},
					success : function(data) {
						$("#sceneryData").append(
								"<li class='saiDataList  listDisplay jin' value='0_0'>全部景区</li>");
						$("#biliData").append(
						"<li class='biliDataList listBottomBorder biliDisplayList biliScenery' value='0_0'>全部景区</li>");
						for(var index in data){
							//alert(data[index].scenicid + "," + data[index].scenicName);
							$("#sceneryData").append(
								"<li class='saiDataList  listDisplay jin' value="+data[index].scenicid+">"+data[index].scenicName+"</li>");
							$("#biliData").append(
									"<li class='biliDataList listBottomBorder biliDisplayList biliScenery' value="+data[index].scenicid+">"+data[index].scenicName+"</li>");
						}
						//getListDisplayClik();
						//getBiliDisplayList();
						getBiliDataList();
					},
					error : function(data) {
						//toastr.error("获取省市内容出错！");
					}
				});
		}
	</script>
</body>
</html>