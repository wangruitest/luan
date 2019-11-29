<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="ECharts">
    <meta name="author" content="kener.linfeng@gmail.com">
    <title>驻留时长饼图</title>

    <link href="<%=path %>/css/font-awesome.min.css" rel="stylesheet">
    <link href="<%=path %>/css/bootstrap.css" rel="stylesheet">
    <link href="<%=path %>/css/carousel.css" rel="stylesheet">
    <link href="<%=path %>/css/echartsHome.css" rel="stylesheet">
   <%--  <script src="<%=path %>/js/jquery.min.js"></script>
    <script src="<%=path %>/js/bootstrap.min.js"></script>
    <script src="<%=path %>/js/echartsExample.js"></script> --%>
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <%-- <script src="<%=path %>/js/echarts.js"></script>
    <script src="<%=path %>/js/codemirror.js"></script>
    <script src="<%=path %>/js/javascript.js"></script>
    <link href="<%=path %>/css/codemirror.css" rel="stylesheet"> --%>
    <link href="<%=path %>/css/monokai.css" rel="stylesheet">
    
    <link href="<%=path %>/css/monokai.css" rel="stylesheet">
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
    <style>
    	body{overflow: hidden;background-color:rgba(30,50,75,0.37) ;background:none;padding: 0;margin: 0;}
    </style>
</head>

<body>
    <!--实现图表代码部分-->
    <div class="well sidebar-nav" style="display: none;">
        <!-- <textarea id="code" name="code">
		
        </textarea> -->
    </div>
    
    <!--图表显示区域-->
    <div id="graphic" >
        <div id="main" class="main" style="border:none;margin: 0 ; padding: 0; "></div>
        <select id="theme-select" style="display: none;"></select>
        <span id='wrong-message' style="color:red;display: none;"></span>
    </div>
    
    <!-- Placed at the end of the document so the pages load faster -->
    
    <script type="text/javascript">
	//图表在iframe中自适应显示
	var mh=$(".main").height();
	var hh=parent.window.$(".perLine").height();
	$(".main").height(hh);
	
	getConsume();
	window.setInterval("getConsume()", 60000);
	function getConsume(){
	$(".main").empty();
	var level1=0;
	var level2=0;
	var level3=0;
	var level4=0;
	var allCount=0;
	var perLevel1=0;
	var perLevel2=0;
	var perLevel3=0;
	var perLevel4=0;
	$.ajax({
		dataType:"json",
		async:false,
		url:"<%=path%>/touristProperty/getTouristProperty.html",
		success:function(data){
			for ( var i = 0; i < data.length; i++) {
				if(data[i].property=="consume" && data[i].propertyValue=="0"){
					level1=data[i].count;
					allCount+=parseInt(data[i].count);
				}else if(data[i].property=="consume" && data[i].propertyValue=="1"){
					level2=data[i].count;
					allCount+=parseInt(data[i].count);
				}else if(data[i].property=="consume" && data[i].propertyValue=="2"){
					level3=data[i].count;
					allCount+=parseInt(data[i].count);
				}else if(data[i].property=="consume" && data[i].propertyValue=="3"){
					level4=data[i].count;
					allCount+=parseInt(data[i].count);
				}
			}
			perLevel1=(level1/(allCount=="0"?1:allCount)).toFixed(2)*100;
			perLevel2=(level2/(allCount=="0"?1:allCount)).toFixed(2)*100;
			perLevel3=(level3/(allCount=="0"?1:allCount)).toFixed(2)*100;
			perLevel4=(level4/(allCount=="0"?1:allCount)).toFixed(2)*100;
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
		                    type:'pie',
		                    center: ['50%', '45%'],
		                    radius: '50%',
		                    data:[
		                        {value: perLevel1,  name:'20元以下',itemStyle : { normal : {color:'#98D87D',
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
		                        {value: perLevel2,  name:'20-50元',itemStyle : { normal : {color:'#FFD562',
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
		                        {value: perLevel3,  name:'51-100元',itemStyle : { normal : {color:'#F27B71',
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
							    {value: perLevel4,  name:'100元以上',itemStyle : { normal : {color:'#8996E7',
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
    <!--<script type="text/javascript" src="js/echartsHome.js"></script>-->
</body>
</html>
