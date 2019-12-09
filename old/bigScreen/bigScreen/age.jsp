<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%><!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="ECharts">
    <meta name="author" content="kener.linfeng@gmail.com">
    <title>年龄饼图</title>

    <link href="<%=path %>/css/font-awesome.min.css" rel="stylesheet">
    <link href="<%=path %>/css/bootstrap.css" rel="stylesheet">
    <link href="<%=path %>/css/carousel.css" rel="stylesheet">
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
    <link href="<%=path %>/css/codemirror.css" rel="stylesheet"> --%>
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
    <style>
    	body{overflow: hidden;background-color:rgba(30,50,75,0.37) ;background:none;padding: 0;margin: 0;}
    </style>
</head>

<body>
    <!--实现图表代码部分-->
    <div class="well sidebar-nav" style="display: none;">
       <!--  <textarea id="code" name="code">
		
        </textarea> -->
    </div>
    
    <!--图表显示区域-->
    <div id="graphic" >
        <div id="main" class="main" style="border:none;margin: 0 ; padding: 0; "></div>
        <select id="theme-select" style="display: none;"></select>
    </div>
    
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="<%=path %>/js/jquery.min.js"></script>
    <script type="text/javascript">
	//图表在iframe中自适应显示
	var mh=$(".main").height();
	var hh=parent.window.$(".perLine").height();
	$(".main").height(hh);
	
	getAge();
	window.setInterval("getAge()", 60000*5);
	
function getAge(){
	$(".main").empty();
	var a20Count=0;
	var a30Count=0;
	var aa40Count=0;
	var a50Count=0;
	var ma50Count=0;
	var allCount=0;
	var a20Per=0;
	var a30Per=0;
	var a40Per=0;
	var a50Per=0;
	var ma50Per=0;
	$.ajax({
		dataType:"json",
		async:false,
		url:"<%=path%>/touristProperty/getTouristProperty.html",
		success:function(data){
			for ( var i = 0; i < data.length; i++) {
				if(data[i].property=="age" && data[i].propertyValue=="0"){
					a20Count=data[i].count;
					allCount+=parseInt(data[i].count);
				}else if(data[i].property=="age" && data[i].propertyValue=="1"){
					a30Count=data[i].count;
					allCount+=parseInt(data[i].count);
				}else if(data[i].property=="age" && data[i].propertyValue=="2"){
					aa40Count=data[i].count;
					allCount+=parseInt(data[i].count);
				}else if(data[i].property=="age" && data[i].propertyValue=="3"){
					a50Count=data[i].count;
					allCount+=parseInt(data[i].count);
				}else if(data[i].property=="age" && data[i].propertyValue=="4"){
					ma50Count=data[i].count;
					allCount+=parseInt(data[i].count);
				}
			}
			a20Per=(a20Count/(allCount=="0"?1:allCount)).toFixed(2)*100;
			a30Per=(a30Count/(allCount=="0"?1:allCount)).toFixed(2)*100;
			a40Per=(aa40Count/(allCount=="0"?1:allCount)).toFixed(2)*100;
			a50Per=(a50Count/(allCount=="0"?1:allCount)).toFixed(2)*100;
			ma50Per=(ma50Count/(allCount=="0"?1:allCount)).toFixed(2)*100;
		}
	})
	
	
	var echart = echarts.init(document.getElementById("main"),"macarons");
	var idx = 1;
		option = {
		    timeline : {
		    	show:false,
		        data : [
		            { name:'', symbol:'emptyStar6', symbolSize:8 },
		            { name:'', symbol:'star6', symbolSize:8 }
		        ],
		    },
		    options : [
		        {
		            legend: {
		                data:[]
		            },
		            
		            series : [
		                {
		                    name:'浏览器（数据纯属虚构）',
		                    type:'pie',
		                    center: ['50%', '45%'],
		                    radius: '50%',
		                    data:[
		                        {value: a20Per,  name:'0-20',itemStyle : { normal : {color:'#98D87D',
												                    label : {
												                        position : 'inner',
												                        formatter : function (params) {                         
												                          return (params.percent - 0).toFixed(0) + '%'
												                        }
												                    },
												                    labelLine : {
												                        show : false
												                    }
												        },
												        emphasis : {
											                    label : {
											                        show : true
											                    }
											                },
												         }},
		                        {value: a30Per,  name:'20-30',itemStyle : { normal : {color:'#FFD562',
												                    label : {
												                        position : 'inner',
												                        formatter : function (params) {                         
												                          return (params.percent - 0).toFixed(0) + '%'
												                        }
												                    },
												                    labelLine : {
												                        show : false
												                    }
												        },
												        emphasis : {
											                    label : {
											                        show : true
											                    }
											                },
												         }},
		                        {value: a40Per,  name:'30-40',itemStyle : { normal : {color:'#F27B71',
												                    label : {
												                        position : 'inner',
												                        formatter : function (params) {                         
												                          return (params.percent - 0).toFixed(0) + '%'
												                        }
												                    },
												                    labelLine : {
												                        show : false
												                    }
												        },
												        emphasis : {
											                    label : {
											                        show : true
											                    }
											                },
												         }},
		                        {value: a50Per,  name:'40-50',itemStyle : { normal : {color:'#8996E7',
												                    label : {
												                        position : 'inner',
												                        formatter : function (params) {                         
												                          return (params.percent - 0).toFixed(0) + '%'
												                        }
												                    },
												                    labelLine : {
												                        show : false
												                    }
												        },
												        emphasis : {
											                    label : {
											                        show : true
											                    }
											                },
												         }},
								{value: ma50Per,  name:'>50',itemStyle : { normal : {color:'#CC3333',
												                    label : {
												                        position : 'inner',
												                        formatter : function (params) {                         
												                          return (params.percent - 0).toFixed(0) + '%'
												                        }
												                    },
												                    labelLine : {
												                        show : false
												                    }
												        },
												        emphasis : {
											                    label : {
											                        show : true
											                    }
											                },
												         }}
		                    ]
		                }
		            ]
		        },
		        
		        
		    ]
		};
		echart.setOption(option);
}  
	</script>
   
</body>
</html>
