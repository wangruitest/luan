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
    <title>景区人流曲线图</title>

    <link href="<%=path %>/css/font-awesome.min.css" rel="stylesheet">
    <link href="<%=path %>/css/bootstrap.css" rel="stylesheet">
    <link href="<%=path %>/css/carousel.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <link href="<%=path %>/css/monokai.css" rel="stylesheet">
    <script src="<%=path %>/js/echarts/echarts.min.js"></script>
	<script src="<%=path %>/js/demo-skin-changer.js"></script>
	<script src="<%=path %>/js/jquery.js"></script>
	<script src="<%=path %>/js/bootstrap.js"></script>
	<script src="<%=path %>/js/bootstrap-treeview.js"></script>
	<script src="<%=path %>/js/jquery.nanoscroller.min.js"></script>
	<script src="<%=path %>/js/scripts.js"></script>
    <script src="<%=path %>/js/echarts/echarts.min.js"></script>
	<script src="<%=path %>/js/echarts/macarons.js"></script>
	<script src="<%=path %>/js/xFormate/xFormate.js"></script>
    <style>
    	body{overflow: hidden;background-color:rgba(30,50,75,0.01) ;background:none;padding: 0;margin: 0;}
    </style>
</head>

<body>
	<!--实现图表代码部分-->
    <div class="well" style="display: none;">
        <div class="nav-header"><a href="#" onclick="autoResize()" class="glyphicon glyphicon-resize-full" id ="icon-resize" ></a>option</div>
     <!--    <textarea id="code" name="code">
			option={ calculable : false,
	    grid:{ borderWidth :'0',
	            x:45,
                y:15,
                x2:20,
                y2:30
            },
        
	    tooltip : {
	        trigger: 'axis',formatter: '{a} <br/>{b}: {c} ({d}%)' 
	        
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
        
	    xAxis : [
	        {   
	            type : 'category',
	            boundaryGap : false,
	            data : ['00:00','04:00','08:00','12:00','16:00','20:00','24:00'],
	            splitLine : {
			                show:true,
			                lineStyle: {
			                    color: '#1e324b',
			                    width: 1
			                }
			                
			            },
			    axisLabel : {
	            	formatter: '{value}', 
	            	textStyle: {
		                    color: '#ffffff'
		                }
	            },
	            splitArea : {
				                show: false
				           },
				axisLine : {    // 轴线
	                show: true,
	                lineStyle: {
	                    color: '#5e5e5e',
	                    width: 1
	                }
	            },
	        }
	    ],
	    yAxis : [
	        {   name : '',
	            type : 'value',
	            min: 0,
	            max: 1000,
	            splitNumber: 5,
	            splitLine : {
			                show:true,
			                lineStyle: {
			                    color: '#1e324b',
			                    width: 1
			                }
			                
			            },
			    axisLabel : {
	            	formatter: '{value}人', 
	            	textStyle: {
		                    color: '#ffffff'
		                }
	            },
	            splitArea : {
				                show: false
				           },
				axisLine : {    // 轴线
	                show: true,
	                lineStyle: {
	                    color: '#5e5e5e',
	                    width: 1
	                }
	            },
	        }
	    ],
	    series : [
	        {   symbol:'none',
	            name:'当前最高',
	            type:'line',
	            smooth:false,
	            itemStyle: {normal: {color:"#00ffff",areaStyle: {type: 'default',color:'rgba(0, 255, 255, 0.2)'}}},
	            data:[10,160,500,790,990,230,330]
	        }
	       
	    ]
	};
	   </textarea>--> 
    </div>
    
    <!--图表显示区域-->
    <div id="graphic">
    <div id="main" class="main" ></div>
    <select id="theme-select" style="display: none;"></select>
    </div>
    
    <script type="text/javascript">
	//图表在iframe中自适应显示
	var mh=$(".main").height();
	var hh=parent.window.$(".perLine").height();
	$(".main").height(hh);
	
	getData();
	window.setInterval("getData()", 60000*1);
	function getData(){
		$(".main").empty();
	var xAxisStr=[];
	var yAxisStr=[];
	
	$.ajax({
		type : "POST",
		async:false,
		dataType:"json",
		url:"<%=path%>/regionRealtimeController/realtimeForDaping.html",
		success:function(data){
			$.each(data, function(index,values){
                $.each(values,function(index2,value){ 
                	xAxisStr.push(value.xtime);
    				yAxisStr.push(value.touristNum);
               });  
            });  
			
		}
	});
	xName=formateX2(yAxisStr);
    var echart = echarts.init(document.getElementById("main"),"macarons");
    option={ calculable : false,
    	    grid:{ borderWidth :'0',
    	            x:65,
                    y:50,
                    x2:20,
                    y2:30
                },
            
    	    tooltip : {
    	        trigger: 'axis',formatter: '{a} <br/>{b}: {c} ({d}%)' 
    	        
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
            
    	    xAxis : [
    	        {   
    	            type : 'category',
    	            boundaryGap : false,
    	            data : xAxisStr,
    	            splitLine : {
    			                show:true,
    			                lineStyle: {
    			                    color: '#1e324b',
    			                    width: 1
    			                }
    			                
    			            },
    			    axisLabel : {
    	            	formatter: '{value}', 
    	            	textStyle: {
    		                    color: '#ffffff'
    		                }
    	            },
    	            splitArea : {
    				                show: false
    				           },
    				axisLine : {    // 轴线
    	                show: true,
    	                lineStyle: {
    	                    color: '#5e5e5e',
    	                    width: 1
    	                }
    	            },
    	        }
    	    ],
    	    yAxis : [
    	        {   name : '',
    	            type : 'value',
    	            splitNumber: 5,
    	            splitLine : {
    			                show:true,
    			                lineStyle: {
    			                    color: '#1e324b',
    			                    width: 1
    			                }
    			                
    			            },
    			    axisLabel : {
    			    	formatter: '{value}'+xName, 
    	            	//formatter: function (value, index) {
		            	//    return parseInt(value/1000)+"千人";
	            	  //  }, 
    	            	textStyle: {
    		                    color: '#ffffff'
    		                }
    	            },
    	            splitArea : {
    				                show: false
    				           },
    				axisLine : {    // 轴线
    	                show: true,
    	                lineStyle: {
    	                    color: '#5e5e5e',
    	                    width: 1
    	                }
    	            },
    	        }
    	    ],
    	    series : [
    	        {   symbol:'none',
    	            name:'游客数量',
    	            type:'line',
    	            smooth:false,
    	            itemStyle: {normal: { areaStyle: {color : (function (){})()}}},//color:'rgba(0, 255, 255, 0.2)'
    	            data:yAxisStr,
    	            markPoint : {
    	                data : [
    	                    {type : 'max', name: '最大值'},
    	                    {type : 'min', name: '最小值'}
    	                ]
    	            },
    	        }
    	       
    	    ]
    	};
    
    echart.setOption(option);
	}
	</script>
</body>
</html>
