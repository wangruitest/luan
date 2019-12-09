<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="ECharts">
	<meta name="author" content="kener.linfeng@gmail.com">
	<title>景区圆环图表</title>

	<link href="<%=path %>/css/font-awesome.min.css" rel="stylesheet">
	<link href="<%=path %>/css/bootstrap.css" rel="stylesheet">
	<link href="<%=path %>/css/carousel.css" rel="stylesheet">
	<link href="<%=path %>/css/style.css" rel="stylesheet">
	<link href="<%=path %>/css/echartsHome.css" rel="stylesheet">
	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

	<%-- <script src="<%=path %>/js/echarts.js"></script>
	<script src="<%=path %>/js/codemirror.js"></script>
	<script src="<%=path %>/js/javascript.js"></script>
	<script src="<%=path %>/js/bootstrap.min.js"></script>
	<script src="<%=path %>/js/echartsExample.js"></script>
	<link href="<%=path %>/css/codemirror.css" rel="stylesheet">
	<script src="<%=path %>/js/jquery.min.js"></script> --%>
	<link href="<%=path %>/css/monokai.css" rel="stylesheet">
	<script src="<%=path %>/js/echarts/echarts.min.js"></script>
	<!-- <script src="<%=path %>/js/demo-skin-changer.js"></script> -->
	<script src="<%=path %>/js/jquery.js"></script>
	<script src="<%=path %>/js/bootstrap.js"></script>
	<script src="<%=path %>/js/bootstrap-treeview.js"></script>
	<script src="<%=path %>/js/jquery.nanoscroller.min.js"></script>
	<script src="<%=path %>/js/demo.js"></script>
	<script src="<%=path %>/js/scripts.js"></script>
	<script src="<%=path %>/js/echarts/echarts.min.js"></script>
	<script src="<%=path %>/js/echarts/macarons.js"></script>
	<script src="<%=path %>/js/xFormate/xFormate.js"></script>
	<script type='text/javascript' src='http://cdn.jsdelivr.net/jquery.marquee/1.4.0/jquery.marquee.min.js'></script>
	<style>
		body {
			overflow: hidden;
			background-color: rgba(30, 50, 75, 0.37);
			background: none;
			padding: 0;
			margin: 0;
		}

		.nameText {
			width: 23%;
			margin: 0 0 0 5px;
		}
	</style>
</head>

<body>
	<!--实现图表代码部分-->
	<div id="sidebar-code" style="display: none;">
		<!-- <textarea id="code" name="code" >
			
        </textarea> -->
	</div>

	<!--图表显示区域-->
	<div class="mainArea">
		<div id="main" class="main marquee" style="padding: 0;margin: 0;"></div>
		<div class="sceneryBottom marquee" id="sceneryBottom">
			<div class="nameText fl " id="scenic1" style="overflow:hidden; white-space:nowrap">待定</div>
			<div class="nameText fl " id="scenic2" style="overflow:hidden; white-space:nowrap">待定</div>
			<div class="nameText fl " id="scenic3" style="overflow:hidden; white-space:nowrap">待定</div>
			<div class="nameText fl " id="scenic4" style="overflow:hidden; white-space:nowrap;text-overflow:clip">待定</div>
			<div class="nameText fl " id="scenic5" style="overflow:hidden; white-space:nowrap">待定</div>
			<div class="nameText fl " id="scenic6" style="overflow:hidden; white-space:nowrap">待定</div>
			<div class="nameText fl " id="scenic7" style="overflow:hidden; white-space:nowrap">待定</div>
			<div class="nameText fl " id="scenic8" style="overflow:hidden; white-space:nowrap">待定</div>
			<div class="nameText fl " id="scenic9" style="overflow:hidden; white-space:nowrap;text-overflow:clip">待定</div>
			<div class="nameText fl" id="scenic10" style="overflow:hidden; white-space:nowrap">待定</div>
		</div>
	</div>
	<select id="theme-select" style="display: none;"></select>

	<span id='wrong-message' style="color:red;display: none;"></span>
	<!-- Placed at the end of the document so the pages load faster -->

	<script type="text/javascript">
		//图表在iframe中自适应显示
		/* var mh=$(".main").height();
		var hh=parent.window.$(".sceneryArea").height();
		$(".main").height(hh); */

		var mh = $(".mainArea").height();
		var mw = $(".mainArea").width();
		var hh = parent.window.$(".sceneryArea").height();
		var mhn = hh * 0.75;
		var mbh = hh * 0.23;
		$(".mainArea").height(hh);
		$(".main").height(mhn);
		// $('.nameText').width(mhn - 5);
		$('.nameText').width(mw/5-5);
		$('.sceneryBottom').width(mw*2);
		$('.main').width(mw * 2);

		var r= 0;
		if(mhn/2>mw/10){
			r=mw/10;
		}else{
			r=mhn/2;
		}

		setScenery();
		window.setInterval("setScenery()", 60000);
		function setScenery() {
			// $('.marquee').marquee('destroy');
			// $(".main").empty();
			var scenicYuzhi = [];
			var scenicName = [];
			var scenicColor = [];
			var touristNums = [];
			$.ajax({
				dataType: "json",
				async: false,
				url: "<%=path%>/keyScenic/getKeyScenicMonitor.html",
				success: function (data) {
					// var loopCount = data.length > 10 ? 4 : data.length;
					for (var i = 0; i < data.length; i++) {
						var oYz = parseFloat(data[i].yuZhi);
						var yz = parseInt(oYz);
						touristNums.push(data[i].touristNum);
						if (oYz >= 100) {
							yz = 100;
						} else if (oYz < 1 && oYz >= 0) {
							yz = 1;
						}
						scenicYuzhi.push(yz);
						scenicName.push(data[i].scenicName);
						var color;
						if (data[i].color == 0) {
							color = 'green';
						} else if (data[i].color == 1) {
							color = 'blue';
						} else if (data[i].color == 2) {
							color = 'yellow';
						} else if (data[i].color == 3) {
							color = 'orange';
						} else {
							color = 'red';
						}

						if (i == 0) {
							$("#scenic1").html(data[i].scenicName.replace("景区", ""));
						} else if (i == 1) {
							$("#scenic2").html(data[i].scenicName.replace("景区", ""));
						} else if (i == 2) {
							$("#scenic3").html(data[i].scenicName.replace("景区", ""));
						} else if (i == 3) {
							$("#scenic4").html(data[i].scenicName.replace("景区", ""));
						} else if (i == 4) {
							$("#scenic5").html(data[i].scenicName.replace("景区", ""));
						} else if (i == 5) {
							$("#scenic6").html(data[i].scenicName.replace("景区", ""));
						} else if (i == 6) {
							$("#scenic7").html(data[i].scenicName.replace("景区", ""));
						} else if (i == 7) {
							$("#scenic8").html(data[i].scenicName.replace("景区", ""));
						} else if (i == 8) {
							$("#scenic9").html(data[i].scenicName.replace("景区", ""));
						} else if (i == 9) {
							$("#scenic10").html(data[i].scenicName.replace("景区", ""));
						}

						scenicColor.push(color);
						// document.getElementById("scenicFive").style.textOverflow="d"
					}
				}
			})
			var echart = echarts.init(document.getElementById("main"), "macarons");
			var labelTop = {
				normal: {
					label: {
						show: true,
						position: 'center',
						formatter: '{b}'

					},
					labelLine: {
						show: false
					}
				}
			};
			var labelFromatter = {
				normal: {
					label: {
						show: true,
						position: 'up',
						formatter: function (params) {
							// console.log(params.data.cnt);
							if (params.value <= 0) {
								return '≥100%'
							} else {
								return 100 - params.value + '%'
							}
							// return params.data.cnt
						},
						textStyle: {
							color: '#ffffff',
							fontFamily: 'Bebas',
							fontSize: 18
						}
					}
				}
			};
			var labelBottom = {
				normal: {
					color: '#ffffff',
					label: {
						show: true,
						position: 'center',
						formatter: function (params) {
							return params.data.cnt + '人'
						}
					},
					labelLine: {
						show: false
					}
				},

				emphasis: {
					color: '#ffffff'
				}
			};
			var labelBottom2 = {
				normal: {
					color: '#ffffff',
					label: {
						show: true,
						position: 'outside',
						formatter: function (params) {
							return params.data.jqName
						}
					},
					labelLine: {
						show: true
					}
				},

				emphasis: {
					color: '#ffffff'
				}
			};
			// var radius = ['60%', '70%'];
			var radius = [r-10, r];
			option = {
				legend: {
					x: 'center',
					y: 'center',
					data: [

					]
				},

				toolbox: {
					show: false,
					feature: {
						dataView: { show: true, readOnly: false },
						magicType: {
							show: true,
							type: ['pie', 'funnel'],
							option: {
								funnel: {
									width: '20%',
									height: '30%',
									itemStyle: {
										normal: {
											label: {
												formatter: function (params) {
													return 'other\n' + params.value + '%\n'
												},
												textStyle: {
													baseline: 'center'
												}
											}
										},
									}
								}
							}
						},
						restore: { show: true },
						saveAsImage: { show: true }
					}
				},
				series: [
					{
						type: 'pie',
						center: [r, '50%'],
						radius: radius,
						x: '0%', // for funnel
						itemStyle: labelFromatter,
						data: [
							{
								name: scenicName[0], value: scenicYuzhi[0], jqName: scenicName[0], itemStyle:
								{
									normal: {
										color: scenicColor[0],
										label: {
											show: false,
											position: 'bottom',
											formatter: function (params) {
												return params.data.jqName
											}
										},
										labelLine: {
											show: false
										}
									}
								}
							},
							{
								name: 'other',
								value: 100 - scenicYuzhi[0], cnt: touristNums[0],
								// value:touristNums[0],
								itemStyle: labelBottom
							}
							// ,{name:'cnt',value:touristNums[0],itemStyle:labelBottom}

						]
					},
					{
						type: 'pie',
						center: [r * 3, '50%', '10%', 0],
						radius: radius,
						x: '25%', // for funnel
						itemStyle: labelFromatter,
						data: [
							{
								name: scenicName[1], value: scenicYuzhi[1], jqName: scenicName[1], itemStyle: {
									normal: {
										color: scenicColor[1],
										label: {
											show: false
										},
										labelLine: {
											show: false
										}
									}
								}
							},
							{ name: 'other', value: 100 - scenicYuzhi[1], itemStyle: labelBottom, cnt: touristNums[1] }
						]
					},
					{
						type: 'pie',
						center: [r * 5, '50%', '20%', 0],
						radius: radius,
						x: '50%', // for funnel
						itemStyle: labelFromatter,
						data: [
							{
								name: scenicName[2], value: scenicYuzhi[2], jqName: scenicName[2], itemStyle: {
									normal: {
										color: scenicColor[2],
										label: {
											show: false
										},
										labelLine: {
											show: false
										}
									}
								}
							},
							{ name: 'other', value: 100 - scenicYuzhi[2], itemStyle: labelBottom, cnt: touristNums[2] }
						]
					}
					,
					{
						type: 'pie',
						center: [r * 7, '50%', '20%', 0],
						radius: radius,
						x: '75%', // for funnel
						itemStyle: labelFromatter,
						data: [
							{
								name: scenicName[3], value: scenicYuzhi[3], itemStyle: {
									normal: {
										color: scenicColor[3],
										label: {
											show: false
										},
										labelLine: {
											show: false
										}
									}
								}
							},
							{ name: 'other', value: 100 - scenicYuzhi[3], itemStyle: labelBottom, cnt: touristNums[3] }
						]
					}
					,
					{
						type: 'pie',
						center: [r * 9, '50%', '20%', 0],
						radius: radius,
						x: '80%', // for funnel
						itemStyle: labelFromatter,
						data: [
							{
								name: scenicName[4], value: scenicYuzhi[4], itemStyle: {
									normal: {
										color: scenicColor[4],
										label: {
											show: false
										},
										labelLine: {
											show: false
										}
									}
								}
							},
							{ name: 'other', value: 100 - scenicYuzhi[4], itemStyle: labelBottom, cnt: touristNums[4] }
						]
					},
					{
						type: 'pie',
						center: [r * 11, '50%', '20%', 0],
						radius: radius,
						x: '80%', // for funnel
						itemStyle: labelFromatter,
						data: [
							{
								name: scenicName[5], value: scenicYuzhi[5], itemStyle: {
									normal: {
										color: scenicColor[5],
										label: {
											show: false
										},
										labelLine: {
											show: false
										}
									}
								}
							},
							{ name: 'other', value: 100 - scenicYuzhi[5], itemStyle: labelBottom, cnt: touristNums[5] }
						]
					},
					{
						type: 'pie',
						center: [r * 13, '50%', '20%', 0],
						radius: radius,
						x: '80%', // for funnel
						itemStyle: labelFromatter,
						data: [
							{
								name: scenicName[6], value: scenicYuzhi[6], itemStyle: {
									normal: {
										color: scenicColor[6],
										label: {
											show: false
										},
										labelLine: {
											show: false
										}
									}
								}
							},
							{ name: 'other', value: 100 - scenicYuzhi[6], itemStyle: labelBottom, cnt: touristNums[6] }
						]
					},
					{
						type: 'pie',
						center: [r * 15, '50%', '20%', 0],
						radius: radius,
						x: '80%', // for funnel
						itemStyle: labelFromatter,
						data: [
							{
								name: scenicName[7], value: scenicYuzhi[7], itemStyle: {
									normal: {
										color: scenicColor[7],
										label: {
											show: false
										},
										labelLine: {
											show: false
										}
									}
								}
							},
							{ name: 'other', value: 100 - scenicYuzhi[7], itemStyle: labelBottom, cnt: touristNums[7] }
						]
					},
					{
						type: 'pie',
						center: [r * 17, '50%', '20%', 0],
						radius: radius,
						x: '80%', // for funnel
						itemStyle: labelFromatter,
						data: [
							{
								name: scenicName[8], value: scenicYuzhi[8], itemStyle: {
									normal: {
										color: scenicColor[8],
										label: {
											show: false
										},
										labelLine: {
											show: false
										}
									}
								}
							},
							{ name: 'other', value: 100 - scenicYuzhi[8], itemStyle: labelBottom, cnt: touristNums[8] }
						]
					},
					{
						type: 'pie',
						center: [r * 19, '50%', '20%', 0],
						radius: radius,
						x: '80%', // for funnel
						itemStyle: labelFromatter,
						data: [
							{
								name: scenicName[9], value: scenicYuzhi[9], itemStyle: {
									normal: {
										color: scenicColor[9],
										label: {
											show: false
										},
										labelLine: {
											show: false
										}
									}
								}
							},
							{ name: 'other', value: 100 - scenicYuzhi[9], itemStyle: labelBottom, cnt: touristNums[9] }
						]
					}





				]
			};
			echart.setOption(option);
			// $mq =	$('.marquee').marquee({
			// 		duration: 20000
			// 	});
		}
		// var $mq;
		$(function () {

		});
		window.setInterval("move()",5000);
		var moveFlag=0;
		function move(){
			if(moveFlag===0){
				$('#main').css("margin-left",-1*mw+'px');
				$('#sceneryBottom').css("margin-left",-1*mw+'px');
				moveFlag=1;
			}else{
				$('#main').css("margin-left",'0px');
				$('#sceneryBottom').css("margin-left",'0px');
				moveFlag=0;
			}
		}
	</script>

</body>

</html>