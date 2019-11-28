<%@page import="java.util.List"%>
<%@page import="com.cmcc.zysoft.login.model.SysUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
	+ request.getServerName() + ":" + request.getServerPort()
	+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>省旅游前端页面</title>

<script type="text/javascript">
	//<![CDATA[
	try {
		if (!window.CloudFlare) {
			var CloudFlare = [ {
				verbose : 0,
				p : 1419364062,
				byc : 0,
				owlid : "cf",
				bag2 : 1,
				mirage2 : 0,
				oracle : 0,
				paths : {
					cloudflare : "/cdn-cgi/nexp/dok2v=1613a3a185/"
				},
				atok : "1fca8a26fb9678bbb4b5c54c34e227b9",
				petok : "4ca96b72a62631073dd6873922c67f1bf6e51b65-1420553914-1800",
				zone : "adbee.technology",
				rocket : "0",
				apps : {
					"ga_key" : {
						"ua" : "UA-49262924-2",
						"ga_bs" : "2"
					}
				}
			} ];
			!function(a, b) {
						a = document.createElement("script"),
						b = document.getElementsByTagName("script")[0],
						a.async = !0,
						a.src = "//ajax.cloudflare.com/cdn-cgi/nexp/dok2v=919620257c/cloudflare.min.js",
						b.parentNode.insertBefore(a, b)
			}()
		}
	} catch (e) {
	};
	//]]>
</script>
<link rel="stylesheet" type="text/css"
	href="<%=path %>/css/bootstrap/bootstrap.min.css" />
<script src="js/demo-rtl.js"></script>
<link rel="stylesheet" type="text/css" href="<%=path %>/css/libs/font-awesome.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/css/libs/nanoscroller.css" />
<link rel="stylesheet" type="text/css"
	href="<%=path %>/css/compiled/theme_styles.css" />
<link type="image/x-icon" href="favicon.png" rel="shortcut icon" />
<link rel="stylesheet" href="<%=path %>/css/caidan.css" />
<link rel="stylesheet" href="<%=path %>/css/kuangjia.css" />
<jsp:include page="../views/common.jsp"></jsp:include>
<script type="text/javascript">
	//自适应页面高度
	window.onload = function() {
		wrapHeightHome();
	};
	function wrapHeightHome() {
		var contentHeight = document.getElementById("contentHeightHome").offsetHeight;
		var blueHeight = document.getElementById("blueHeight").offsetHeight;
		var listHeight = document.getElementById("listHeight").offsetHeight;
		var footHeight = document.getElementById("footHeight").offsetHeight;
		var windowHeight = window.innerHeight;
		var mainHeight = windowHeight - blueHeight - blueHeight - listHeight
				- 50;
		if (contentHeight < windowHeight) {
			document.getElementById("contentHeightHome").style.height = mainHeight
					+ "px";
		}
		if (contentHeight > mainHeight) {
			document.getElementById("contentHeightHome").style.height = contentHeight
					+ "px";
		}
	}
	
</script>
</head>
<style>
html {
	overflow-x: hidden;
}

html {
	overflow-y: hidden;
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
		
		<div id="page-wrapper" class="container">
			<div class="row" style="background:#343e4a">
				<%@include file="left.jsp" %>
				<div id="content-wrapper" style="min-height:500px;">
					<ul class="mrHead row"
						style="margin-top: 20px;margin-left: 10px;height:30px;line-height:30px; border-bottom: 0px solid #d4d4d4;"
						id="listHeight">
					</ul>
					<div class="tab-content">
						<div class="tab-pane fade active in" id="home"
							style="padding:10px;background-color:#ffffff;color:#333">
							<iframe name="mainFrame" id="contentHeightHome" frameborder="0"
								style="width: 100%;MARGIN-top: 1px;" border=”0″ marginwidth=”0″
								marginheight=”0″ scrolling=”no”></iframe>
						</div>
					</div>
					<div id="footHeight">
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
			<div class="modal-content">
				<div class="modal-header addHead">
					<input type="hidden" value="" id="unidOfchangeStatus"></input>
					<input type="hidden" value="" id="statusOfchangeStatus"></input>
					<div type="button" class="fr closeButton" data-dismiss="modal" aria-hidden="true" style="width:15px;height: 15px;">
					</div>
					<h4 class="modal-title" id="myModalLabel"  style="padding-left: 23px;font-size:16px;font-family:'微软雅黑';color:#ffffff;"">
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
	<script src="<%=path %>/js/jquery.min.js"></script>
	<script src="<%=path %>/js/bootstrap.js"></script>
    <script src="<%=path %>/js/jquery.nanoscroller.min.js"></script>
	<script src="<%=path %>/js/scripts.js"></script>
	<script src="<%=path %>/js/pace.min.js"></script>
	
	
	<script>
		$(document).ready(function() {
			loadMenus();
			getProvinceAndCity();
			/* initialize the external events
			-----------------------------------------------------------------*/

			$('#external-events div.external-event').each(function() {

				// create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
				// it doesn't need to have a start or end
				var eventObject = {
					title : $.trim($(this).text())
				// use the element's text as the event title
				};

				// store the Event Object in the DOM element so we can get to it later
				$(this).data('eventObject', eventObject);

				// make the event draggable using jQuery UI
				$(this).draggable({
					zIndex : 999,
					revert : true, // will cause the event to go back to its
					revertDuration : 0
				//  original position after the drag
				});

			});

		});
		
		
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
	</script>
</body>
</html>