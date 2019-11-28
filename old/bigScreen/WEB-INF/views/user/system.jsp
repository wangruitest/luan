<%@page import="com.cmcc.zysoft.login.model.SysUser"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
	+ request.getServerName() + ":" + request.getServerPort()
	+ path + "/";
%>
<%
	request.setAttribute("home", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>系统设置</title>

<link rel="stylesheet" type="text/css"
	href="<%=path %>/css/bootstrap/bootstrap-treeview.css" />
<link rel="stylesheet" type="text/css"
	href="<%=path %>/css/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/css/libs/font-awesome.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/css/libs/nanoscroller.css" />
<link rel="stylesheet" type="text/css"
	href="<%=path %>/css/compiled/theme_styles.css" />
<link rel="stylesheet" href="<%=path %>/css/caidan.css" />
<link rel="stylesheet" href="<%=path %>/css/kuangjia.css" />
<link type="image/x-icon" href="<%=path %>/favicon.png" rel="shortcut icon" />

<script src="<%=path %>/js/respond.min.js"></script>
<jsp:include page="../common.jsp"></jsp:include>
<script type="text/javascript">
/* <![CDATA[ 
var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-49262924-2']);
_gaq.push(['_trackPageview']);

(function() {
var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();

(function(b){(function(a){"__CF"in b&&"DJS"in b.__CF?b.__CF.DJS.push(a):"addEventListener"in b?b.addEventListener("load",a,!1):b.attachEvent("onload",a)})(function(){"FB"in b&&"Event"in FB&&"subscribe"in FB.Event&&(FB.Event.subscribe("edge.create",function(a){_gaq.push(["_trackSocial","facebook","like",a])}),FB.Event.subscribe("edge.remove",function(a){_gaq.push(["_trackSocial","facebook","unlike",a])}),FB.Event.subscribe("message.send",function(a){_gaq.push(["_trackSocial","facebook","send",a])}));"twttr"in b&&"events"in twttr&&"bind"in twttr.events&&twttr.events.bind("tweet",function(a){if(a){var b;if(a.target&&a.target.nodeName=="IFRAME")a:{if(a=a.target.src){a=a.split("#")[0].match(/[^?=&]+=([^&]*)?/g);b=0;for(var c;c=a[b];++b)if(c.indexOf("url")===0){b=unescape(c.split("=")[1]);break a}}b=void 0}_gaq.push(["_trackSocial","twitter","tweet",b])}})})})(window);
 ]]> */
/*//自适应页面高度iframepage例子参考
	function wrapHeightUnit() {
		var contentHeight=document.getElementById("contentHeightUnit").offsetHeight; 
		var blueHeight=document.getElementById("blueHeight").offsetHeight; 
		var listHeight=document.getElementById("listHeight").offsetHeight;
		var footHeight=document.getElementById("footHeight").offsetHeight;
		var windowHeight=window.innerHeight;
		var mainHeight=windowHeight-blueHeight-blueHeight-listHeight-50;
		if(contentHeight<windowHeight){
			document.getElementById("contentHeightUnit").style.height=mainHeight+ "px";
		}
		if(contentHeight>mainHeight){
			document.getElementById("contentHeightUnit").style.height=contentHeight+ "px";
		}
}*/
</script>
</head>
<!-- css样式区 -->
<style>
a {
	text-decoration: none;
	color: #ffffff;
}

a:hover {
	cursor: pointer;
	color: #ffffff;
	text-decoration: none;
}

a:link {
	text-decoration: none;
}

a:active {
	color: #57a3f1;
	border-bottom: 1px solid #57a3f1;
}

button {
	color: #ffffff;
}

.row {
	padding: 0;
	margin: 0;
}

.container-fluid {
	padding: 0;
	margin: 0;
}

.unSelect {
	color: #333;
}

.spanSelect {
	color: #57a3f1;
}

body {
	margin: 0;
	padding: 0;
	color: #333;
	overflow-x: hidden;
}
html {
	overflow-x: hidden;
}
.blueHeight {
	background: #047DF9;
	height: 50px;
	color: #ffffff;
}

.listHeight {
	padding: 10px 10px;
	border-bottom: 1px solid #d4d4d4;
}

.footHeight {
	background: #c4d9ff;
	padding: 10px;
}

</style>
<body>
	<div id="page-wrapper" class="container-fluid">
		<div class="row"  style="background:#343e4a">
			<%@include file="../left.jsp" %>
			<div id="content-wrapper">
				<ul class="mrHead row"
					style="margin-left: 10px;height:30px;line-height:30px; "
					id="listHeight">
					<div class="mrHeadLeft col-md-2 col-xs-1">
						<span style="font-size: 20px;">系统设置</span>
					</div>
					<ul class="col-md-10 mrHeadList">
					<c:if test="${fn:contains(roles,'节假日管理')}">	
					<li class="fr headList" id="li4" onclick="liclick(this)"
							style="height:30px;margin-right: 50px"><a href="#holidaymanagement" class="listA"
							data-toggle="tab"><span class="unSelect">节假日管理</span></a></li>
					</c:if>			
					<c:if test="${fn:contains(roles,'公告管理')}">
					<li class="fr"><img src="img/line.png" /></li>
						<li class="fr headList" id="li5" onclick="liclick(this)"
							style="height:30px;"><a href="#notice" class="listA"
							data-toggle="tab"><span class="unSelect">公告管理</span></a></li>
					</c:if>	
                    <c:if test="${fn:contains(roles,'告警阈值')}">
						<li class="fr"><img src="img/line.png" /></li>
						<li class="fr headList" id="li0" onclick="liclick(this)"
							style="height:30px;"><a href="#scenic" class="listA"
							data-toggle="tab"><span class="unSelect">告警阈值</span></a></li>
					</c:if>	
					 <c:if test="${fn:contains(roles,'用户管理')}">
						<li class="fr"><img src="img/line.png" /></li>
						<li class="fr headList" id="li1" onclick="liclick(this)"
							style="height:30px;"><a href="#user" class="listA"
							data-toggle="tab"><span class="unSelect">用户管理</span></a></li>
						</c:if>
						 <c:if test="${fn:contains(roles,'单位管理')}">
						<li class="fr"><img src="img/line.png" /></li>
						<li class="fr headList" id="li2" onclick="liclick(this)"
							style="height:30px;"><a href="#unit" class="listA"
							data-toggle="tab"><span class="unSelect">单位管理</span></a></li>
							</c:if>
							 <c:if test="${fn:contains(roles,'菜单管理')}">
						<li class="fr"><img src="img/line.png" /></li>
						<li class="fr headList headListSelect" id="li3"
							onclick="liclick(this)" style="height:30px;"><a
							href="#tab-menu2" class="listA" data-toggle="tab"><span
								class="spanSelect">菜单管理</span></a></li>
								</c:if>
						<li class="fr"><img src="img/line.png" /></li>

					</ul>
				</ul>
				<div class="tab-content">
					<div class="tab-pane fade in active" id="tab-menu" >
						<div class="col-lg-3">
							<div id="tree"></div>
						</div>
					</div>
					<div class="tab-pane fade" id="tab-accounts">
						<h3>
							<span>单位管理</span>
						</h3>
					</div>
					<div class="tab-pane fade" id="user"
						style="padding:10px;background-color:#ffffff;color:#333">
						<iframe name="mainFrame" id="contentHeightUser" frameborder="0"
							src="userController/userList.html"
							style="width: 100%; MARGIN-top: 1px;" border=”0″ marginwidth=”0″
							marginheight=”0″ scrolling=”no” allowtransparency=“true”></iframe>
					</div>
					<div class="tab-pane fade" id="tab-menu2"
						style="padding:10px;background-color:#ffffff;">
						<iframe name="mainFrame" id="contentHeightMenu" frameborder="0"
							src="menumanage/MenuManager.html"
							style="width: 100%;MARGIN-top: 1px;" border=”0″ marginwidth=”0″
							marginheight=”0″ scrolling=”no”></iframe>
					</div>
					<div class="tab-pane fade" id="scenic"
						style="padding:10px;background-color:#ffffff;">
						<iframe src="scenic/showScenic.html" id="contentHeightScenic"
							style="width: 100%;MARGIN-top: 1px;" frameborder="0"
							scrolling="no" allowtransparency=”no”></iframe>
					</div>
					<div class="tab-pane fade" id="unit"
						style="padding:10px;background-color:#ffffff;">
						<iframe src="unit/unitList.html" id="contentHeightUnit"
							style="width: 100%;MARGIN-top: 1px;" frameborder="0"
							scrolling=”no”></iframe>
					</div>
					<div class="tab-pane fade" id="holidaymanagement"
						style="padding:10px;background-color:#ffffff;">
						<iframe src="holidaymanagement/showHolidayManagement.html" id="contentHeightHolidaymanagement"
							style="width: 100%;MARGIN-top: 1px;" frameborder="0"
							scrolling="no" allowtransparency=”no”></iframe>
					</div>
					<div class="tab-pane fade" id="notice"
						style="padding:10px;background-color:#ffffff;">
						<iframe src="noticeCfgController/noticeList.html" id="contentHeightNotice"
						frameborder="0"	style="width: 100%;MARGIN-top: 1px;" border=”0″ 
							scrolling=”no” ></iframe>
					</div>
				</div>
				<div id="footHeight">
					<footer id="footer-bar" class="row" style="height:40px;">
						<p id=footer-copyright class="col-xs-12"
							style="font-size:13px;color:#333;margin-left: -4%;">2016
							&copy; 中国移动集团安徽有限公司</p>
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
				<div class="modal-header addHead">
					<input type="hidden" value="" id="unidOfchangeStatus"></input> <input
						type="hidden" value="" id="statusOfchangeStatus"></input>
					<div type="button" class="fr closeButton" data-dismiss="modal"
						aria-hidden="true" style="width:15px;height: 15px;"></div>
					<h4 class="modal-title" id="myModalLabel"
						style="background:url(img/tishi.png) no-repeat left center;padding-left: 26px;font-size:18px;font-family:'微软雅黑';color:#ffffff;"">
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

	<script src="<%=path %>/js/demo-skin-changer.js"></script>
	<script src="<%=path %>/js/jquery.js"></script>
	<script src="<%=path %>/js/bootstrap.js"></script>
	<script src="<%=path %>/js/bootstrap-treeview.js"></script>
	<script src="<%=path %>/js/jquery.nanoscroller.min.js"></script>
	<script src="<%=path %>/js/demo.js"></script>
	<script src="<%=path %>/js/scripts.js"></script>
	<script src="<%=path %>/js/pace.min.js"></script>
    <script type="text/javascript" src="${home}/js/cookie/cookie.js"></script>
	<script>
	window.onload = function(){
		var liName = document.getElementById("getMenus").getElementsByTagName("span");
		for(i=0;i<liName.length;i++){
			if(liName[i].innerHTML=="系统设置"){
				liName[i].parentNode.parentNode.style.backgroundColor= "#1f1f1f";
				liName[i].style.color="#fff";
				liName[i].style.fontsize="17px";
			}
		}
		var imgName = document.getElementById("getMenus").getElementsByTagName("img");
		for(i=0;i<imgName.length;i++){
			if(imgName[i].src.substring(imgName[i].src.lastIndexOf("/")+1)=="leftshezhi.png"){
			   imgName[i].src=imgName[i].src.substring(0,imgName[i].src.lastIndexOf("/")+1)+"leftshezhilink.jpg";
			}
		}
	};
	$(document).ready(function() {
		autoHeight();//自适应高度
		loadMenus();
		firstOpen();
		getProvinceAndCity();
		/* initialize the external events
		-----------------------------------------------------------------*/
	
		$('#external-events div.external-event').each(function() {
		
			// create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
			// it doesn't need to have a start or end
			var eventObject = {
				title: $.trim($(this).text()) // use the element's text as the event title
			};
			
			// store the Event Object in the DOM element so we can get to it later
			$(this).data('eventObject', eventObject);
			
			// make the event draggable using jQuery UI
			$(this).draggable({
				zIndex: 999,
				revert: true,      // will cause the event to go back to its
				revertDuration: 0  //  original position after the drag
			});
			
			$.ajaxSetup({  
			    contentType : "application/x-www-form-urlencoded;charset=utf-8",  
			    complete : function(XMLHttpRequest, textStatus) {  
			        // 通过XMLHttpRequest取得响应头，sessionstatus  
			        var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");  
			        if (sessionstatus == "timeout") {  
			            // 这里怎么处理在你，这里跳转的登录页面  
			            alert("timeout=========");  
			            window.location.replace(XMLHttpRequest.getResponseHeader("redirectUrl"));  
			        }  
			    }  
			}); 
			
		});
	});
	
	//自适应页面高度iframepagecontentHeightUnit
	function autoHeight(){
		var blueHeight=$("#blueHeight").height();
		var listHeight=$("#listHeight").height();;
		var windowHeight=$(window).height();
		var mainHeight=windowHeight-blueHeight;
	var iframeHeight = windowHeight-blueHeight-blueHeight-listHeight-50;
		document.getElementById("content-wrapper").style.cssText="min-height:"+mainHeight+"px";
		
		document.getElementById("contentHeightMenu").style.cssText="height:"+iframeHeight+"px;"+"width: 100%;MARGIN-top: 1px;";
		document.getElementById("contentHeightUnit").style.cssText="height:"+iframeHeight+"px;"+"width: 100%;MARGIN-top: 1px;";
		document.getElementById("contentHeightUser").style.cssText="height:"+iframeHeight+"px;"+"width: 100%;MARGIN-top: 1px;";
		document.getElementById("contentHeightScenic").style.cssText="height:"+iframeHeight+"px;"+"width: 100%;MARGIN-top: 1px;";
		document.getElementById("contentHeightHolidaymanagement").style.cssText="height:"+iframeHeight+"px;"+"width: 100%;MARGIN-top: 1px;";
	    document.getElementById("contentHeightNotice").style.cssText="height:"+iframeHeight+"px;"+"width: 100%;MARGIN-top: 1px;";
	}
	
	function liclick(self){//这里self接收节点中定义的this
		if(jQuery("#"+self.id).attr("class")=="fr headList"){
			jQuery(".headListSelect").attr("class","fr headList");
			jQuery(".spanSelect").attr("class","unSelect");
			jQuery("#"+self.id).attr("class","fr headList headListSelect");
			//jQuery("#"+self.id+" a").attr("class","listA listASelect");
			jQuery("#"+self.id+" a").find("span").attr("class","spanSelect");
		}
	}
	
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
	
	function firstOpen(){
		if($("#li3").val()!=null){
			$("#tab-menu2").addClass("active in");
			return;
		}
		if($("#li2").val()!=null){
			$("#unit").addClass("active in");
			$("#li2").attr("class","fr headList headListSelect");
			$("#li2 a").find("span").attr("class","spanSelect");
			return;
		}
		if($("#li1").val()!=null){
			$("#user").addClass("active in");
			$("#li1").attr("class","fr headList headListSelect");
			$("#li1 a").find("span").attr("class","spanSelect");
			return;
		}
		if($("#li0").val()!=null){
			$("scenic").addClass("active in");
			$("#li0").attr("class","fr headList headListSelect");
			$("#li0 a").find("span").attr("class","spanSelect");
			return;
		}
	}
</script>
</body>
</html>