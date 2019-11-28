<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>系统设置</title>

<script type="text/javascript">
//<![CDATA[
try{if (!window.CloudFlare) {var CloudFlare=[{verbose:0,p:1419364062,byc:0,owlid:"cf",bag2:1,mirage2:0,oracle:0,paths:{cloudflare:"/cdn-cgi/nexp/dok2v=1613a3a185/"},atok:"1fca8a26fb9678bbb4b5c54c34e227b9",petok:"4ca96b72a62631073dd6873922c67f1bf6e51b65-1420553914-1800",zone:"adbee.technology",rocket:"0",apps:{"ga_key":{"ua":"UA-49262924-2","ga_bs":"2"}}}];!function(a,b){a=document.createElement("script"),b=document.getElementsByTagName("script")[0],a.async=!0,a.src="//ajax.cloudflare.com/cdn-cgi/nexp/dok2v=919620257c/cloudflare.min.js",b.parentNode.insertBefore(a,b)}()}}catch(e){};
//]]>
</script>
<link rel="stylesheet" type="text/css"
	href="<%=path %>/css/bootstrap/bootstrap-treeview.css" />
<link rel="stylesheet" type="text/css"
	href="<%=path %>/css/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/css/libs/font-awesome.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/css/libs/nanoscroller.css" />
<link rel="stylesheet" type="text/css"
	href="<%=path %>/css/compiled/theme_styles.css" />


<link type="image/x-icon" href="favicon.png" rel="shortcut icon" />

<link
	href='//fonts.googleapis.com/css?family=Open+Sans:400,600,700,300|Titillium+Web:200,300,400'
	rel='stylesheet' type='text/css'>
<!--[if lt IE 9]>
		<script src="js/html5shiv.js"></script>
		<script src="js/respond.min.js"></script>
	<![endif]-->
<script type="text/javascript">
/* <![CDATA[ */
var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-49262924-2']);
_gaq.push(['_trackPageview']);

(function() {
var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();

(function(b){(function(a){"__CF"in b&&"DJS"in b.__CF?b.__CF.DJS.push(a):"addEventListener"in b?b.addEventListener("load",a,!1):b.attachEvent("onload",a)})(function(){"FB"in b&&"Event"in FB&&"subscribe"in FB.Event&&(FB.Event.subscribe("edge.create",function(a){_gaq.push(["_trackSocial","facebook","like",a])}),FB.Event.subscribe("edge.remove",function(a){_gaq.push(["_trackSocial","facebook","unlike",a])}),FB.Event.subscribe("message.send",function(a){_gaq.push(["_trackSocial","facebook","send",a])}));"twttr"in b&&"events"in twttr&&"bind"in twttr.events&&twttr.events.bind("tweet",function(a){if(a){var b;if(a.target&&a.target.nodeName=="IFRAME")a:{if(a=a.target.src){a=a.split("#")[0].match(/[^?=&]+=([^&]*)?/g);b=0;for(var c;c=a[b];++b)if(c.indexOf("url")===0){b=unescape(c.split("=")[1]);break a}}b=void 0}_gaq.push(["_trackSocial","twitter","tweet",b])}})})})(window);
/* ]]> */
</script>
</head>
<body>
	<div id="theme-wrapper">
		<header class="navbar" id="header-navbar">
		<div class="container">
			<div class="clearfix">
				<button class="navbar-toggle" data-target=".navbar-ex1-collapse"
					data-toggle="collapse" type="button">
					<span class="sr-only">Toggle navigation</span> <span
						class="fa fa-bars"></span>
				</button>
				<div
					class="nav-no-collapse navbar-left pull-left hidden-sm hidden-xs">
					<ul class="nav navbar-nav pull-left">

						<li class="dropdown profile-dropdown pull-right"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"> <span
								class="hidden-xs">安徽省</span> <b class="caret"></b>
						</a>
							<ul class="dropdown-menu">
								<li><a href="#">合肥市</a></li>
								<li><a href="#">芜湖市</a></li>
								<li><a href="#">蚌埠市</a></li>
							</ul></li>
						<li><a class="btn" id="make-small-nav"> <i
								class="fa fa-bars"></i>
						</a></li>
					</ul>
				</div>
				<div class="nav-no-collapse navbar-right pull-right" id="header-nav">
					<ul class="nav navbar-nav ">

						<li class="hidden-xs pull-right"><a class="btn"> <i
								class="fa fa-cog"></i>
						</a></li>
						<li class="hidden-xs"><a class="btn"> <i>Admin</i>
						</a></li>
					</ul>
				</div>
			</div>
		</div>
		</header>
		<div id="page-wrapper" class="container">
			<div class="row">
				<div id="nav-col">
					<section id="col-left" class="col-left-nano">
					<div id="col-left-inner" class="col-left-nano-content">
						<div class="collapse navbar-collapse navbar-ex1-collapse"
							id="sidebar-nav">
							<ul class="nav nav-pills nav-stacked">
								<li><a href="#"> <i class="fa fa-table"></i> <span>景区监控</span>
								</a></li>
								<li><a href="#"> <i class="fa fa-envelope"></i> <span>城市客流</span>
								</a></li>
								<li><a href="#"> <i class="fa fa-bar-chart-o"></i> <span>景区客流</span>
								</a></li>
								<li><a href="#"> <i class="fa fa-th-large"></i> <span>游客画像</span>
								</a></li>
								<li><a href="#"> <i class="fa fa-edit"></i> <span>系统设置</span>
								</a></li>
								<li></li>
							</ul>
						</div>
					</div>
					</section>
				</div>
				<div id="content-wrapper">
					<h4>系统设置</h4>
					<ul class="nav nav-tabs">
						<li><a href="#tab-accounts" data-toggle="tab">显示景区位置</a></li>
						<li><a href="#tab-home" data-toggle="tab">公告管理</a></li>
						<li><a href="user.html" data-toggle="tab">景区告警阈值</a></li>
						<li><a href="#user" data-toggle="tab">用户账号</a></li>
						<li><a href="#tab-accounts" data-toggle="tab">单位管理</a></li>
						<li><a href="#tab-menu" data-toggle="tab">菜单管理</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane fade in active" id="tab-menu">
							<div class="col-lg-3">
								<div id="tree"></div>
							</div>
						</div>
						
						<div class="tab-pane fade" id="tab-menu" style="height:1000px;">
							<h3><span>景区告警阈值</span></h3>
							<iframe src="scenic/showScenic.html" style="height:100%;width:100%;MARGIN-top:1px;" frameborder="0"  scrolling="no"></iframe> 
						</div>

						
						<div class="tab-pane fade" id="tab-accounts">
							<h3>
								<span>单位管理</span>
							</h3>
						</div>

						<div class="tab-pane fade" id="user">
							<div class="col-lg-1">
								<div class="form-group">
									<select class="form-control">
										<option>启用</option>
										<option>禁用</option>
									</select>
								</div>
							</div>
							<div class="col-lg-2">
								<div class="form-group">
									<select class="form-control">
										<option>单位</option>
										<option>省旅游公司</option>
										<option>市旅游公司</option>
										<option>县旅游公司</option>
										<option>区旅游公司</option>
									</select>
								</div>
							</div>
							<div class="col-lg-1">
								<input type="text" class="form-control" placeholder="姓名">

							</div>
							<button type="submit" class="btn btn-default">Submit</button>
							<a style="float: right" data-toggle="modal" href="#myModal"
								class="btn btn-primary mrg-b-lg">添加</a>

							<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
								aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">&times;</button>
											<h4 class="modal-title">添加用户</h4>
										</div>
										<div class="modal-body">
											<form class="form-horizontal" role="form">
												<div class="form-group">
													<label for="firstname" class="col-sm-2 control-label">用户名：</label>
													<div class="col-sm-10">
														<input type="text" class="form-control"
															id="exampleInputEmail1" placeholder="用户名">
													</div>
												</div>
												<div class="form-group">
													<label for="firstname" class="col-sm-2 control-label">登录名：</label>
													<div class="col-sm-10">
														<input type="text" class="form-control"
															id="exampleInputPassword1" placeholder="登录名">
													</div>
												</div>
												<div class="form-group">
													<label for="firstname" class="col-sm-2 control-label">手机号：</label>
													<div class="col-sm-10">
														<input type="text" class="form-control"
															id="exampleInputPassword1" placeholder="手机号">
													</div>
												</div>
												<div class="form-group">
													<label for="firstname" class="col-sm-2 control-label">登陆密码：</label>
													<div class="col-sm-10">
														<input type="password" class="form-control"
															id="exampleInputPassword1" placeholder="登陆密码">
													</div>
												</div>
												<div class="form-group">
													<label for="firstname" class="col-sm-2 control-label">确认密码：</label>
													<div class="col-sm-10">
														<input type="password" class="form-control"
															id="exampleInputPassword1" placeholder="确认密码">
													</div>
												</div>
											</form>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">关闭</button>
											<button type="button" class="btn btn-primary">保存</button>
										</div>
									</div>
								</div>
							</div>

							<table class="table table-bordered">
								<tr
									style="background: rgba(0, 77, 255, 0.64); color: #fff; font-size: 0.75em; text-align: center;">
									<td>用户名</td>
									<td>登录名</td>
									<td>手机号</td>
									<td>景区权限</td>
									<td>单位</td>
									<td>操作</td>
								</tr>
								<tr>
									<td>赵智展</td>
									<td>admin</td>
									<td>15856993297</td>
									<td>全部</td>
									<td>安徽省旅游局</td>
									<td style="width: 15%;"><a href="#myMenu"
										class="table-link" data-toggle="modal"> <span
											class="fa-stack"> <i class="fa fa-square fa-stack-2x"></i>
												<i class="fa fa-search-plus fa-stack-1x fa-inverse"></i>
										</span>
									</a> <a href="#myModal" class="table-link" data-toggle="modal">
											<span class="fa-stack"> <i
												class="fa fa-square fa-stack-2x"></i> <i
												class="fa fa-pencil fa-stack-1x fa-inverse"></i>
										</span>
									</a> <a href="#" class="table-link danger"> <span
											class="fa-stack"> <i class="fa fa-square fa-stack-2x"></i>
												<i class="fa fa-trash-o fa-stack-1x fa-inverse"></i>
										</span>
									</a></td>
								</tr>

								<tr>
									<td>袁满</td>
									<td>yuanman</td>
									<td>15856993298</td>
									<td>全部</td>
									<td>安徽省旅游局</td>
									<td style="width: 15%;"><a href="#myMenu"
										class="table-link" data-toggle="modal"> <span
											class="fa-stack"> <i class="fa fa-square fa-stack-2x"></i>
												<i class="fa fa-search-plus fa-stack-1x fa-inverse"></i>
										</span>
									</a> <a href="#myModal" class="table-link" data-toggle="modal">
											<span class="fa-stack"> <i
												class="fa fa-square fa-stack-2x"></i> <i
												class="fa fa-pencil fa-stack-1x fa-inverse"></i>
										</span>
									</a> <a href="#" class="table-link danger"> <span
											class="fa-stack"> <i class="fa fa-square fa-stack-2x"></i>
												<i class="fa fa-trash-o fa-stack-1x fa-inverse"></i>
										</span>
									</a></td>
								</tr>

								<tr>
									<td>吴宝龙</td>
									<td>wubao</td>
									<td>15856993299</td>
									<td>全部</td>
									<td>安徽省旅游局</td>
									<td style="width: 15%;"><a href="#myMenu"
										class="table-link" data-toggle="modal"> <span
											class="fa-stack"> <i class="fa fa-square fa-stack-2x"></i>
												<i class="fa fa-search-plus fa-stack-1x fa-inverse"></i>
										</span>
									</a> <a href="#myModal" class="table-link" data-toggle="modal">
											<span class="fa-stack"> <i
												class="fa fa-square fa-stack-2x"></i> <i
												class="fa fa-pencil fa-stack-1x fa-inverse"></i>
										</span>
									</a> <a href="#" class="table-link danger"> <span
											class="fa-stack"> <i class="fa fa-square fa-stack-2x"></i>
												<i class="fa fa-trash-o fa-stack-1x fa-inverse"></i>
										</span>
									</a></td>
								</tr>

								<tr>
									<td>徐航</td>
									<td>xuhang</td>
									<td>15856993295</td>
									<td>全部</td>
									<td>安徽省旅游局</td>
									<td style="width: 15%;"><a href="#myMenu"
										class="table-link" data-toggle="modal"> <span
											class="fa-stack"> <i class="fa fa-square fa-stack-2x"></i>
												<i class="fa fa-search-plus fa-stack-1x fa-inverse"></i>
										</span>
									</a> <a href="#myModal" class="table-link" data-toggle="modal">
											<span class="fa-stack"> <i
												class="fa fa-square fa-stack-2x"></i> <i
												class="fa fa-pencil fa-stack-1x fa-inverse"></i>
										</span>
									</a> <a href="#" class="table-link danger" data-toggle="modal">
											<span class="fa-stack"> <i
												class="fa fa-square fa-stack-2x"></i> <i
												class="fa fa-trash-o fa-stack-1x fa-inverse"></i>
										</span>
									</a></td>
								</tr>
							</table>
							<ul class="pagination pull-right">
								<li><a href="#"><i class="fa fa-chevron-left"></i></a></li>
								<li><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
								<li><a href="#"><i class="fa fa-chevron-right"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div class="modal fade" id="myMenu" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">
							菜单配置 <a style="float: right" class="btn btn-primary mrg-b-lg">全选</a>
						</h4>
					</div>
					<div class="modal-body">
						<form role="form">
							<div class="form-group">
								用户名：<input type="text" class="form-control"
									id="exampleInputEmail1" placeholder="用户名">
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary">保存</button>
					</div>
				</div>
			</div>
		</div>
		<footer id="footer-bar" class="row">
		<div
			style="text-align: center; color: #fff; background-color: #0069ff;">
			<p>
				建议分辨率1024*768&nbsp;&nbsp;&nbsp;&nbsp;IE8以上版本浏览器&nbsp;&nbsp;&nbsp;&nbsp;技术支持：
				<a href="" target="_blank"><span style="color: #FFFFFF">安徽中移通信技术工程有限公司</span>
				</a>
			</p>
		</div>
		</footer>
	</div>


	<script src="<%=path %>/js/demo-skin-changer.js"></script>
	<script src="<%=path %>/js/jquery.js"></script>
	<script src="<%=path %>/js/bootstrap.js"></script>
	<script src="<%=path %>/js/bootstrap-treeview.js"></script>
	<script src="<%=path %>/js/jquery.nanoscroller.min.js"></script>
	<script src="<%=path %>/js/demo.js"></script>
	<script src="<%=path %>/js/scripts.js"></script>
	<script src="<%=path %>/js/pace.min.js"></script>
	<script>
	$(document).ready(function() {
		
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
			
		});
		
		$('#tree').treeview({
			
			data: getTree()
			
		});
	
	});
	function getTree() {
		var tree = [
		            {
		              text: "景区游客分析",
		              nodes: [
		                {
		                  text: "Child 1",
		                  nodes: [
		                    {
		                      text: "Grandchild 1"
		                    },
		                    {
		                      text: "Grandchild 2"
		                    }
		                  ]
		                },
		                {
		                  text: "Child 2"
		                }
		              ]
		            },
		            {
		              text: "游客统计报表"
		            },
		            {
		              text: "节假日数据统计"
		            },
		            {
		              text: "数据维护"
		            },
		            {
		              text: "用户数据配置"
		            }
		          ];
		  return tree;
		}
	
	</script>
</body>
</html>