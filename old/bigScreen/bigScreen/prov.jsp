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
    <title>昨日外省游客前十省份</title>
    <link href="<%=path %>/css/font-awesome.min.css" rel="stylesheet">
    <link href="<%=path %>/css/bootstrap.css" rel="stylesheet">
    <link href="<%=path %>/css/carousel.css" rel="stylesheet">
    <link href="<%=path %>/css/monokai.css" rel="stylesheet">
    <style>
    	body{overflow: hidden;background-color:rgba(30,50,75,0.01);background:none;padding: 0;margin: 0;width: 100%;}
    </style>
</head>
<body>
	<!--实现图表代码部分-->
	<div class="well" style="display: none;">
	    <div class="nav-header"><a href="#" onclick="autoResize()" class="glyphicon glyphicon-resize-full" id ="icon-resize" ></a>option</div>
	</div>
    
    <!--图表显示区域-->
    <div id="graphic" >
    <div id="main" class="main"></div>
    <select id="theme-select" ></select>
    </div>
	
    <script src="<%=path %>/js/jquery.min.js"></script>
    
	<script type="text/javascript">
	//图表在iframe中自适应显示
	var mh=$(".main").height();
	var hh=parent.window.$(".prov").height();
	$(".main").height(hh);
	var myPillarChart = "";//全局定义柱状图实例
	var pillarOption = "";//全局定义柱状图属性Option
	$(document).ready(function(){
		getOtherProvinceYesterdayVisitors();
	});
	window.setInterval("getOtherProvinceYesterdayVisitors()", 300000); //五分钟执行一次
	
	var areacode = '';//城市或区县id
	var flag = '';//城市区县标示，0：省，1：市，2：区县
	//外省游客前十省份游客数量
	function getOtherProvinceYesterdayVisitors(){
		$(".main").empty();
		$.ajax({
			url:"<%=path%>/bigScreenCfg/getBigScreenCfg.html",
			async:false,
			dataType:"json",
			success:function(data){
				for ( var i = 0; i < data.length; i++) {
					areacode = data[i].areaCode;
					flag = data[i].flag;
				}
			}
		});
		var arrx=[];//x轴数据
		var arry=[];//y轴数据
		var alltourists = '';//游客总数
		var yName = '';//y轴数据单位
		//var arrypercent=[];//游客数量占比
		$.ajax({
	        type : "post",
	        async : false, //同步执行
	        url : "<%=path%>/bigScreenYesterdayVisitors/getOtherProvinceYesterdayVisitors.html",
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
			            	arrx.push(yesterdayVisitors[i].province);
			            	arry.push(parseInt(yesterdayVisitors[i].touristpercentage*100));
			            }
		        	}
		        }
		    },
		    error : function(errorMsg) {
		        //alert("昨日外省游客前十省份图表请求数据失败!");
		    }
	   	});
		
		myPillarChart = echarts.init(document.getElementById("main"));
		// 指定图表的配置项和数据
		pillarOption = {
			    calculable : true,
			     grid:{ borderWidth :'0px' ,
	                    x:65,
	                    y:15,
	                    x2:10,
	                    y2:30
	                },
	                tooltip : {
			        trigger: 'axis',
			    },
	            // 提示框
				tooltip: {
				    trigger: 'axis',           // 触发类型，默认数据触发，见下图，可选为：'item' ¦ 'axis'
				    showDelay: 20,             // 显示延迟，添加显示延迟可以避免频繁切换，单位ms
				    hideDelay: 100,            // 隐藏延迟，单位ms
				    transitionDuration : 0.4,  // 动画变换时间，单位s
				    backgroundColor: 'rgba(0,0,0,0.7)',     // 提示背景颜色，默认为透明度为0.7的黑色
				    borderColor: '#333',       // 提示边框颜色
				    borderRadius: 4,           // 提示边框圆角，单位px，默认为4
				    borderWidth: 0,            // 提示边框线宽，单位px，默认为0（无边框）
				    padding: 5,                // 提示内边距，单位px，默认各方向内边距为5，
				                               // 接受数组分别设定上右下左边距，同css
				    axisPointer : {            // 坐标轴指示器，坐标轴触发有效
				        type : 'line',         // 默认为直线，可选为：'line' | 'shadow'
				        lineStyle : {        // 直线指示器样式设置
				            color: '#1e324b',
				            width: 0,
				            type: 'solid'
				        },
				        shadowStyle : {                       // 阴影指示器样式设置
				            width: 'auto',                   // 阴影大小
				            color: 'rgba(150,150,150,0.3)'  // 阴影颜色
				        }
				    },
				    textStyle: {
				        color: '#fff'
				    }
				},
				grid:{
			    	x2:'20px',
			    	x:'48px',
			    	y:'50px',
			    	y2:'20%',
			    	//borderWidth:2
			    	//width:1450
			    },
			    xAxis : [
			        {
			            type : 'category',
			            data : arrx,
			            axisLine : {    // 轴线
			                show: false,
			            },
			            splitLine : {
					                show:false,
					            },
					    axisLabel : {
			            	formatter: '{value}', 
			            	textStyle: {
				               color: '#ffffff'
				            },
				            formatter:function(val){
				               return val.split("").join("\n");
				            }
			            },
			            
			        }
			    ],
			    yAxis : [
			        { 
			           type : 'value',
			           //min: 0,
			            //max: 100,
			            splitNumber: 4,
			            axisLine : {    // 轴线
			                show: true,
			                lineStyle: {
			                    color: '#5e5e5e',
			                    width: 1
			                }
			            },
			            axisLabel : {
			            	formatter: '{value}%', 
			            	textStyle: {
				                    color: '#ffffff'
				                }
			            },
			            splitArea : {
						                show: false,
						                areaStyle:{
						                    color:['red','red']
						                }
						           },
						splitLine : {
					                show:true,
					                lineStyle: {
					                    color: '#1e324b',
					                    width: 1
					                }
					            },
			        }
			    ],
			    series : [
			        {
			            name:'客流量占比',
			            type:'bar',
			            stack: 'sum',
			            barCategoryGap: '50%',
			            itemStyle: {
			                normal: {
			                    color: '#5345dd',
			                    barBorderRadius:0,
			                    label : {
			                        show: false, position: 'insideTop'
			                    },
			                    barBorderRadius:[6,6,0,0]
			                }
			            },
			            data:arry,
			            label: {
	       	            	  normal: {
		                         show: true,
		                         position: 'top',
		                         formatter: '{c}'+"%"
		                     }
	       	               }
			        }
			    ]
			};
		// 使用刚指定的配置项和数据显示图表。
		myPillarChart.setOption(pillarOption);
	};
	</script>
    <script src="<%=path %>/js/bootstrap.min.js"></script>
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
</body>
</html>
