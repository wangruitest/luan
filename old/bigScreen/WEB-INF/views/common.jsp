<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.cmcc.zysoft.login.model.SysUser"%>
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
<div id="blueHeight" class="blueHeight" style="background:#3498db">
			<header class="navbar" id="header-navbar">
				<div class="clearfix">
					<div style="width:15%;float:left; text-align:center;padding-top:5px;">
					<img alt="" src="img/logo4.png">
					</div>
 	                 
					<div class="nav-no-collapse  pull-left"
						id="header-nav" style="float:left;width:85%;">
						
						<div style="overflow:auto;float:left">
					<!-- 	<button class="navbar-toggle" data-target=".navbar-ex1-collapse"
						data-toggle="collapse" type="button">
						<span class="sr-only">Toggle navigation</span> <span
							class="fa fa-bars"></span>
					</button> -->
				 	<div  class="nav-no-collapse navbar-left pull-left hidden-sm hidden-xs" style="float:left;">
						<ul class="nav navbar-nav pull-left">
							<li><a class="btn" id="make-small-nav" id="navBtn" style="width: 65px"> <i
								style="padding-right:6px;margin-top:4px"	class="fa fa-bars"></i>
							</a></li>
						</ul>
					</div>
					</div>
						<ul class="nav navbar-nav" style="width:94%;float:right;">
						<li class="hidden-xxs pull-left">
						
					    <div class="selectText fl" id="selectText" style="width:80px;height:50px;line-height:50px;margin-top:0">
					    </div>  
					    <ul class="selectList fl" id="selectList"></ul>
					    </li>
					   
							<li class="hidden-xxs pull-right" ><a class="btn" id="loginOutLink" onclick="loginOutCheck()"> <i
								style="margin-top:4px"	class="fa fa-power-off"></i>
							</a></li>
							<li class="hidden-xs pull-right" id="xitong" style="width:40px;"></li>
							<li class="hidden-xs pull-right" style="height:50px;line-height:50px;width:95px"><a class="btn"> <i  style="margin-top:4px" class="fa"><%=userName%></i>
							</a></li>
						
						</ul>
					</div>
				</div>
			</header>
		</div>
		<script>
		function loadMenus(){
			$.ajax({
				url : "<%=path %>/loadMenu.html",
				dataType : "json",
				type : "POST",
				async : false,
				data : {
				},
				success : function(data) {
					for(var index in data){
	          $("#getMenus").append(
							"<li id='liname"+index+"'><a href='"+data[index].url+"' onmousemove='changeColor("+index+");' onmouseout='deleteColor("+index+");'   style='text-align: center;'> <img  style='margin-top:-3px' src='"+data[index].icon+"'> <span style='color:#c4c3ce;font-size:16px;font-family:'微软雅黑';margin-left:10px;'>"+data[index].name+"</span></a></li>");
	          if(data[index].name=='系统设置'){
	        	  $("#xitong").append("<a class='btn' href='system.html'> <i style='margin-top:4px' class='fa fa-cog'></i></a>");
	          }
					}
					
				},
				error : function(data) {
				}
			});
			$("#make-small-nav").click(function(){
		})
		}
		
		function loginOutCheck(){
			$("#loginOutModel").modal("show");
		}
		
		function loginOut(){
			var loginUrl = "";
			$.ajax({
					url : "<%=path %>/loginOut.html",
					dataType : "text",
					type : "POST",
					async : false,
					success : function(data) {
						loginUrl=data;
					},
				});
			//alert(loginUrl);
			window.location.href = "<%=path %>/"+loginUrl;
		}
		

		//动态获取省市
		function getProvinceAndCity(){
			$.ajax({
					url : "<%=path%>/touristPhoto/getProvinceAndCity.html",
					dataType : "json",
					type : "POST",
					async : false,
					data : {
					},
					success : function(data) {
						$.each(data,function(index, values) { // 解析出data对应的Object数组  
							$.each(values,function(index2,value){
						$("#selectText").text(value.cityName);
						$("#selectText").append("&nbsp;&nbsp;<img alt='' src='img/sanjiaoxing.png'>");
						selectTouristId = value.cityId;
						$("#selectList").append("<li class='selectDataList topcity' id='"+value.cityId+"'>"+value.cityName+"</li>");
							getAreaByCity();
							});
						});
					},
					error : function(data) {
					}
				});
		}
		
		function changeColor(index){
			$("#liname"+index).addClass("active");
		}
		function deleteColor(index){
			$("#liname"+index).removeClass("active");
		}
		
	//	function getColor(index){
	//		alert("进入a标签的方法");
	//		$("#liname"+index).css("background","red");
	//		alert("借宿方法");
	//	}
		function getAreaByCity(){
			$.ajax({
				url : "<%=path%>/touristPhoto/getAreaByCity.html",
				dataType : "json",
				type : "POST",
				async : false,
				data : {
				},
				success : function(data) {
					$.each(data,function(index, values) { // 解析出data对应的Object数组  
						$.each(values,function(index2,value){
						$("#selectList").append("<li class='selectDataList topcity' id='"+value.cityId+"'>"+value.cityName+"</li>");
					});
					});
				},
				error : function(data) {
				
				}
			});
		}
		
		function getChangeIcon4(){
			$("#hx").css("color","red");
		}
		
		
		</script>