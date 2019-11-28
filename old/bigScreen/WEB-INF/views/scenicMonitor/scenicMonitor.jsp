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
<link type="image/x-icon" href="favicon.png" rel="shortcut icon" />
<script src="<%=path %>/js/respond.min.js"></script>


</head>
<jsp:include page="../common.jsp"></jsp:include>
<style>
	.theme-whbl a:hover{
		color:#fff;
		background:#000;
		border:none;
	}
	a{text-decoration: none;color: #ffffff;}
	a:hover{cursor: pointer;color: #fff;text-decoration: none;}
	body{background:#ebf0f4;}
	td{border:0}
	#statusTable_paginate{
		float:right;
		margin-bottom: 0;
		margin-top: 20px;
		right: 2%;
		z-index: 999;
		font-size:10px
	}
	pagination>.disabled>a{color:#777;background-color:#fff;border-color:#ddd;cursor:not-allowed}
</style>
<body>
		<div id="page-wrapper" class="container" style="width:100%;margin:0">
			<div class="row" style="background:#343e4a">
				<%@include file="../left.jsp" %>
				<div  class="clearfix" id="content-wrapper" style="min-height:400px;padding:0" >
				<div class="fl" style="width: 95%;background: #eceff4;" id="content" >
					 <!--    <div class="controlHead" id="controlHead">景区监控</div> --> 
						<div class="controlLeft fl" id="controlLeft" style="width: 45%;">
							<div class="controlLeftMain" >
							 	<div class="fl "><img src="img/controlMap.png"/></div>
								<div class="fl controlMainHead" id="mapnamediv">安徽地图</div>
								<div class="fr contronDisplay"><img src="img/leftline.png" /></div>
							</div>
							<div class="mapMain" id="mapMain" style="height: 94%;margin-top: 1%">
							
								<div class="controlMap" id="mapinforarea" style="margin-top: 0">
								</div>
								
							</div>
						</div>
						<div class="controlRight fr" id="controlRight" style="width: 54%;">
								<div class="controlRightTop " id="controlRightTop" style="height: 32%;">
									<div class="controlLeftMain" style="height: 20px">
										<div class="fl "><img src="img/control.png"/></div>
										<div class="fl controlMainHead">景区游客</div>
										<div class="fr personDisplay"><img src="img/leftline.png" /></div>
									</div>
									<div class="personMain" >
										<div class="personMainArea pMainAreaLeft fl">
											<div class="personText fl">
												<div class="personTextTop">
													实时游客
												</div>
												<div class="personTextBottom" id="realTimeNum">
												</div>
											</div>
											<div class="personImg personLeftImg fl">
												<img src="img/personLeft.png" />
											</div>
										</div>
										<div class="personMainArea pMainAreaCenter fl">
											<div class="personText fl">
												<div class="personTextTop">
												    今日累计
												</div>
												<div class="personTextBottom" id="dayNum">
												</div>
											</div>
											<div class="personImg personCenterImg fl">
												<img src="img/personCenter.png" />
											</div>
										</div>
										<div class="personMainArea pMainAreaRight fl">
											<div class="personText fl">
												<div class="personTextTop">
													外省累计
												</div>
												<div class="personTextBottom" id="waishengNum">
												</div>
											</div>
											<div class="personImg personRightImg fl">
												<img src="img/personRight.png" 	  />
											</div>
										</div>
									</div>
									<div class="personLeftTime">
										<span class="fr leftTimeNum"></span>
										<img class="fr" src="img/controlTime.png"/>
									</div>
								</div>
								<div style="background: #eceff4;width: 100%;height: 1%;"></div>
								<div class="controlRightBottom " id="controlRightBottom" style="height: 66%;">
									<div class="controlLeftMain" style="height: 10%">
										<div class="fl "><img src="img/controlT.png"/></div>
										<div class="fl controlMainHead">景区状态</div>
										<div class="fr statusDisplay"><img src="img/leftline.png" /></div>
									</div>
									<div class="colorArea">
										<img src="img/h.png" class="fr hButton"/>
										<img src="img/b.png" class="fr bButton"/>
										<img src="img/y.png" class="fr yButton"/>
										<img src="img/o.png" class="fr oButton"/>
										<img src="img/r.png" class="fr rButton"/>
									</div>
								<div class="statusTable clearfix"  >
										<table id="statusTable"  border="0" cellspacing="0" style="width:100%">
											<thead>
												<tr style="display:none"  class="tableHead tableList">
													<th></th>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
								</div>
							</div>
						</div>
					</div>
					<!-- <div style="background:none;">
						<footer id="footer-bar" class="row" style="background:none;height:40px;">
						<p id=footer-copyright class="col-xs-12"
							style="text-align:center;position:fixed;bottom: 0;background:none;font-size:13px;color:#333;">2016 &copy; 中国移动集团安徽有限公司</p>
						</footer>
					</div> -->
				    </div>			
					<div class="footerText" style="position:fixed;bottom: 0;color: #333;width: 100%;text-align: center;">
					<span style="background:#ffffff">2016  中国移动集团安徽有限公司</span>
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
<script src="<%=path %>/js/demo-skin-changer.js"></script>
	<script src="<%=path %>/js/jquery.js"></script>
	<script src="<%=path %>/js/bootstrap.js"></script>
	<script src="<%=path %>/js/bootstrap-treeview.js"></script>
	<script src="<%=path %>/js/jquery.nanoscroller.min.js"></script>
	<script src="<%=path %>/js/demo.js"></script>
	<script src="<%=path %>/js/scripts.js"></script>
	<script src="<%=path %>/js/pace.min.js"></script>
    <script src="<%=path %>/js/echarts/echarts.min.js"></script>
	<script src="<%=path %>/js/echarts/macarons.js"></script>
	<script src="<%=path %>/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" language="javascript" src="<%=path %>/js/dataTables.bootstrap.js"></script>
	<script type="text/javascript" src="<%=path%>/js/xFormate/xFormate.js"></script>
	
	<jsp:include flush='true' page='scenicMonitor_js.jsp'></jsp:include>
	
	<script>
	window.onload = function(){
		var liName = document.getElementById("getMenus").getElementsByTagName("span");
		for(i=0;i<liName.length;i++){
			if(liName[i].innerHTML=="景区监控"){
				liName[i].parentNode.parentNode.style.backgroundColor= "#1f1f1f";
				liName[i].style.color="#fff";
				liName[i].style.fontsize="17px";
			}
		}
		var imgName = document.getElementById("getMenus").getElementsByTagName("img");
		for(i=0;i<imgName.length;i++){
			if(imgName[i].src.substring(imgName[i].src.lastIndexOf("/")+1)=="leftkongzhi.jpg"){
				
			   imgName[i].src=imgName[i].src.substring(0,imgName[i].src.lastIndexOf("/")+1)+"leftkongzhilink.png";
			}
		}
	};
		function areaHeight() {
			  var windowHeight=document.body.clientHeight;//窗口高度
			  var mainHeight=windowHeight-50;//除头部显示区域
			  var controlHeadHeight=mainHeight*0.06;//显示区域景区监控高度
			  var controlLeftHeight=mainHeight//显示区域左边高度
			  var mapMainHeight=controlLeftHeight;
			  
//			  alert(windowHeight+"窗口高度");
//			  alert(mainHeight+"除头部显示区域");
//		      alert(controlHeadHeight+"显示区域景区监控高度");
//			  alert(controlLeftHeight+"显示区域左边高度"); 
//		      alert(mapMainHeight+"显示区域左边地图高度"); 
 		  	  document.getElementById("nav-col").style.height=mainHeight+ "px";
 			  document.getElementById("content-wrapper").style.height=mainHeight+ "px";
              //显示区域景区监控高度及行高
			 // document.getElementById("controlHead").style.height=controlHeadHeight+ "px";
			//  document.getElementById("controlHead").style.lineHeight=controlHeadHeight+ "px";
			  //显示区域左侧高度
			  document.getElementById("controlLeft").style.height=controlLeftHeight+ "px";
			  
			  
			  //右边显示高度
			   document.getElementById("controlRight").style.height=controlLeftHeight+ "px";
			  //右边top显示高度
			  
		}
	$(".hefeiMap area").mouseover(function(){
		  $(this).siblings("span").show();
	})
	$(".hefeiMap area").mouseout(function(){
		  $(this).siblings("span").hide();
	})
	$(".sceneryArea").mouseover(function(){
		  $(this).siblings("span").show();
	})
	$(".sceneryArea").mouseout(function(){
		  $(this).siblings("span").hide();
	})
	//选择城市
   	$("#selectText").on("click", function(e){
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
	//展开收起地图
	 $(".contronDisplay").click(function(){
	    $(".mapMain").toggle();
	  });
	
	
	 //展开景区游客
	 $(".personDisplay").click(function(){
	    $(".personMain").toggle();
	  });
	//展开景区状态
	 $(".statusDisplay").click(function(){
	    $(".statusTable").toggle();
	  });
	
	
	</script>
	

</body>
</html>