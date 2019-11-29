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
    <style>
			body{overflow: hidden;background-color:rgba(30,50,75,0.37);background:none;padding: 0;margin: 0;}
			.nameText{width:23%;}
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
   		 <div id="main" class="main" style="padding: 0;margin: 0;"></div>
   		 <div class="sceneryBottom">
	    	 <div class="nameText fl" id="scenicOne" style="overflow:hidden; white-space:nowrap">待定</div>
	    	 <div class="nameText fl" id="scenicTwo" style="overflow:hidden; white-space:nowrap">待定</div>
	    	 <div class="nameText fl" id="scenicThree" style="overflow:hidden; white-space:nowrap">待定</div>
	    	 <div class="nameText fl" id="scenicFour" style="overflow:hidden; white-space:nowrap;text-overflow:clip">待定</div>
	    	 <!-- <div class="nameText fl" id="scenicFive" style="overflow:hidden; white-space:nowrap">待定</div> -->
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
	
	var mh=$(".mainArea").height();
	var hh=parent.window.$(".sceneryArea").height();
	var mhn=hh*0.75;
	var mbh=hh*0.23;
	$(".mainArea").height(hh);
	$(".main").height(mhn);
	setScenery();
	window.setInterval("setScenery()", 60000);
function setScenery(){
	$(".main").empty();
	var scenicYuzhi=[];
	var scenicName=[];
	var scenicColor=[];
	$.ajax({
		dataType:"json",
		async:false,
		url:"<%=path%>/keyScenic/getKeyScenicMonitor.html",
		success:function(data){
			var loopCount=data.length>4?4:data.length;
			for ( var i = 0; i < loopCount; i++) {
				var oYz= parseFloat(data[i].yuZhi);
				var yz=parseInt(oYz);
				if(oYz>=100){
					yz=100;
				}else if(oYz<1&& oYz>=0){
					yz=1;
				}
				scenicYuzhi.push(yz);
				scenicName.push(data[i].scenicName);
				var color;
				if(data[i].color==0){	
					color='green';
				}else if(data[i].color==1){
					color='blue';
				}else if(data[i].color==2){
					color='yellow';
				}else if(data[i].color==3){
					color='orange';
				}else{
					color='red';
				}
				
				if(i==0){
					$("#scenicOne").html(data[i].scenicName.replace("景区",""));
				}else if(i==1){
					$("#scenicTwo").html(data[i].scenicName.replace("景区",""));
				}else if(i==2){
					$("#scenicThree").html(data[i].scenicName.replace("景区",""));
				}else if(i==3){
					$("#scenicFour").html(data[i].scenicName.replace("景区",""));
				}else if(i==4){
					// $("#scenicFive").html(data[i].scenicName);
				}
				scenicColor.push(color);
				// document.getElementById("scenicFive").style.textOverflow="d"
			}
		}
	})
	var echart = echarts.init(document.getElementById("main"),"macarons");
	var labelTop = {
				  normal : {
								        label : {
								            show : true,
								            position : 'center',
								            formatter : '{b}'
								            
								        },
								        labelLine : {
								            show : false
								        }
								    }
				};
			var labelFromatter = {
			   normal : {
							        label : {
							        	show:true,
							      		position : 'up',
							            formatter : function (params){
							            	if(params.value<=0){
							               	 return  '≥100%'
							            	}else{
							            		return 100 - params.value + '%'
							            	}
							            },
							            textStyle: {color:'#ffffff',
							            	fontFamily:'Bebas',
							            	fontSize:18	
							            }
							        }
							    }
			};
			var labelBottom = {
			  normal : {
							        color: '#ffffff',
							        label : {
							            show : true,
							            position : 'center'
							        },
							        labelLine : {
							            show : false
							        }
							    },
							    emphasis: {
							        color: '#ffffff'
							    }
			};
			var radius = ['60%', '70%'];
			option = {
			    legend: {
			        x : 'center',
			        y : 'center',
			        data:[
			          
			        ]
			    },
			   
			    toolbox: {
			        show : false,
			        feature : {
			            dataView : {show: true, readOnly: false},
			            magicType : {
			                show: true, 
			                type: ['pie', 'funnel'],
			                option: {
			                    funnel: {
			                        width: '20%',
			                        height: '30%',
			                        itemStyle : {
			                            normal : {
			                                label : {
			                                    formatter : function (params){
			                                        return 'other\n' + params.value + '%\n'
			                                    },
			                                    textStyle: {
			                                        baseline : 'center'
			                                    }
			                                }
			                            },
			                        } 
			                    }
			                }
			            },
			            restore : {show: true},
			            saveAsImage : {show: true}
			        }
			    },
			    series : [
			        {
			            type : 'pie',
			            center : ['12.5%', '50%','20%',0],
			            radius :radius,
			            x: '0%', // for funnel
			            itemStyle : labelFromatter,
			            data : [
			                {name:scenicName[0], value:scenicYuzhi[0], itemStyle : { normal:{color:scenicColor[0],
							                										label : {
																                        show : false
																                    },
																                    labelLine : {
																                        show : false
																                    }
																                   }
																          }},
			                {name:'other', value:100-scenicYuzhi[0],itemStyle : labelBottom}
			            ]
			        },
			        {
			            type : 'pie',
			            center : ['37.5%',  '50%','20%',0],
			            radius : radius,
			            x:'25%', // for funnel
			            itemStyle : labelFromatter,
			            data : [
			                {name:scenicName[1], value:scenicYuzhi[1], itemStyle :{ normal:{color:scenicColor[1],
							            											label : {
																                        show : false
																                    },
																                    labelLine : {
																                        show : false
																                    }
																            		}
																            	}},
			                {name:'other', value:100-scenicYuzhi[1],itemStyle : labelBottom}
			            ]
			        },
			        {
			            type : 'pie',
			            center : ['62.5%', '50%','20%',0],
			            radius : radius,
			            x:'50%', // for funnel
			            itemStyle : labelFromatter,
			            data : [
			                {name:scenicName[2],value:scenicYuzhi[2], itemStyle : { normal:{color:scenicColor[2],
							                												label : {
																                        show : false
																                    },
																                    labelLine : {
																                        show : false
																                    }
							                }}},
			                {name:'other', value:100-scenicYuzhi[2],itemStyle : labelBottom}
			            ]
			        },
			        {
			            type : 'pie',
			            center : ['87.5%', '50%','20%',0],
			            radius : radius,
			            x:'75%', // for funnel
			            itemStyle : labelFromatter,
			            data : [
			                {name:scenicName[3], value:scenicYuzhi[3], itemStyle : { normal:{color:scenicColor[3],
							                												label : {
																                        show : false
																                    },
																                    labelLine : {
																                        show : false
																                    }
							                }}},
			                {name:'other', value:100-scenicYuzhi[3],itemStyle : labelBottom}
			            ]
							}
							// ,
			        // {
			        //     type : 'pie',
			        //     center : ['90%',  '50%','20%',0],
			        //     radius : radius,
			        //     x:'80%', // for funnel
			        //     itemStyle : labelFromatter,
			        //     data : [
			        //         {name:scenicName[4], value:scenicYuzhi[4], itemStyle : { normal:{color:scenicColor[4],
							//                 											label : {
							// 									                        show : false
							// 									                    },
							// 									                    labelLine : {
							// 									                        show : false
							// 									                    }
							//                 }}},
			        //         {name:'other', value:100-scenicYuzhi[4],itemStyle : labelBottom}
			        //     ]
			        // }
			      
			       
			        
			       
			      
			    ]
			};
       echart.setOption(option);   
       }         
	</script>
   
</body>
</html>
