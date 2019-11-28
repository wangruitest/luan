<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
	+ request.getServerName() + ":" + request.getServerPort()
	+ path + "/";
%>
<script type="text/javascript">
	$(document).ready(function () {
		autoHeight();
		loadMenus();
		getProvinceAndCity();
		getScenicByTouristid();
		getSaiDataListClik();//柱状图加载数据后赋予点击事件
		//getListDisplayClik();//柱状图加载数据后赋予点击事件
		getSelectDataListClik();//柱状图加载数据后赋予点击事件
		getBiliDisplayList();
		initPillarChart();
		initPieChart();//加载饼状图
	});
	var myPillarChart = "";//全局定义柱状图实例
	var pillarOption = "";//全局定义柱状图属性Option
	
	var menCount=0;
	var womanCount=0;
	var a20Count = 0;
	var a30Count = 0;
	var a40Count = 0;
	var a50Count = 0;
	var moreCount = 0;
	var level1 = 0;
	var level2 = 0;
	var level3 = 0;
	var level4 = 0;
	
	//游客比例（饼图1）
	function initPieChart(){
		menCount=0;
		womanCount=0;
		a20Count = 0;
		a30Count = 0;
		a40Count = 0;
		a50Count = 0;
		moreCount = 0;
		level1 = 0;
		level2 = 0;
		level3 = 0;
		level4 = 0;
		/* alert(selectTouristId)
		alert(pieTimeSelect)
		alert(pieScenicSelect) */
		//基于准备好的dom，初始化echarts实例
		$("#pieChartArea").empty();
		$.ajax({
			type : "post",
			dataType:"json",
			async:false,
			url:"<%=path%>/touristPhoto/getTouristProperty.html",
			data:{
				selectTouristId : selectTouristId,
        		pieTimeSelect : pieTimeSelect,
        		pieScenicSelect : pieScenicSelect
			},
			success:function(data){
				//sex
				for ( var i = 0; i < data.length; i++) {
					if(data[i].property=="sex" && data[i].propertyValue=="0"){
						menCount=data[i].count;
					}else if(data[i].property=="sex" && data[i].propertyValue=="1"){
						womanCount=data[i].count;
					}
				}
				//age
				for ( var i = 0; i < data.length; i++) {
					if(data[i].property=="age" && data[i].propertyValue=="0"){
						a20Count=data[i].count;
					}else if(data[i].property=="age" && data[i].propertyValue=="1"){
						a30Count=data[i].count;
					}else if(data[i].property=="age" && data[i].propertyValue=="2"){
						a40Count=data[i].count;
					}else if(data[i].property=="age" && data[i].propertyValue=="3"){
						a50Count=data[i].count;
					}else if(data[i].property=="age" && data[i].propertyValue=="4"){
						moreCount=data[i].count;
					}
				}
				//level
				for ( var i = 0; i < data.length; i++) {
					if(data[i].property=="consume" && data[i].propertyValue=="0"){
						level1=data[i].count;
					}else if(data[i].property=="consume" && data[i].propertyValue=="1"){
						level2=data[i].count;
					}else if(data[i].property=="consume" && data[i].propertyValue=="2"){
						level3=data[i].count;
					}else if(data[i].property=="consume" && data[i].propertyValue=="3"){
						level4=data[i].count;
					}
				}
			}
		});
		var myPieChart = echarts.init(document.getElementById("pieChartArea","macarons"));
		// 指定图表的配置项和数据
		var pieOption = {
				title : {
					text: '游客性别',
			        x:'center'
			    },
			    tooltip : {
			        trigger: 'item',
			        formatter: "{a} <br/>{b} : {c} ({d}%)"
			    },
			    legend: {
			        orient: 'vertical',
			        left: 'left',
			        data: ['男性','女性']
			    },
			    series : [
			        {
			            name: '游客性别',
			            type: 'pie',
			            radius: ['15%', '40%'],
			            center: ['50%', '60%'],
			            data:[
			                {value:menCount, name:'男性',itemStyle:{normal : {color:'#22B8DD'}}},
			                {value:womanCount, name:'女性',itemStyle:{normal : {color:'#0066FF'}}}
			            ],
			            itemStyle: {
			                emphasis: {
			                	show : true,
			                	fontWeight: 'bold',
			                    shadowBlur: 10,
			                    shadowOffsetX: 0,
			                    shadowColor: 'rgba(0, 0, 0, 0.5)'
			                }
			            }
			        }
			    ]
		};
		// 使用刚指定的配置项和数据显示图表。
		myPieChart.setOption(pieOption);
		
		initPieChart2();
		initPieChart3();
	}
	
	//游客比例（饼图2）
	function initPieChart2(){
		//基于准备好的dom，初始化echarts实例
		$("#pieChartArea2").empty();
		var myPieChart2 = echarts.init(document.getElementById("pieChartArea2","macarons"));
		// 指定图表的配置项和数据
		var pieOption2 = {
				title : {
					text: '游客年龄',
			        x:'center'
			    },
			    tooltip : {
			        trigger: 'item',
			        formatter: "{a} <br/>{b} : {c} ({d}%)"
			    },
			    legend: {
			        orient: 'vertical',
			        left: 'left',
			        data: ['0-20岁','20-30岁','30-40岁','40-50岁','>50岁']
			    },
			    series : [
			        {
			            name: '游客年龄',
			            type: 'pie',
			            radius: ['15%', '40%'],
			            center: ['50%', '60%'],
			            data:[
			                {value:a20Count, name:'0-20岁',itemStyle:{normal : {color:'#22B8DD'}}},
			                {value:a30Count, name:'20-30岁',itemStyle:{normal : {color:'#00CCFF'}}},
			                {value:a40Count, name:'30-40岁',itemStyle:{normal : {color:'#0066FF'}}},
			                {value:a50Count, name:'40-50岁',itemStyle:{normal : {color:'#0909F7'}}},
			                {value:moreCount, name:'>50岁'}
			            ],
			            itemStyle: {
			                emphasis: {
			                	show : true,
			                	fontWeight: 'bold',
			                    shadowBlur: 10,
			                    shadowOffsetX: 0,
			                    shadowColor: 'rgba(0, 0, 0, 0.5)'
			                }
			            }
			        }
			    ]
		};
		// 使用刚指定的配置项和数据显示图表。
		myPieChart2.setOption(pieOption2);
	}
	
	//游客比例（饼图3）
	function initPieChart3(){
		//基于准备好的dom，初始化echarts实例
		$("#pieChartArea3").empty();
		var myPieChart3 = echarts.init(document.getElementById("pieChartArea3","macarons"));
		// 指定图表的配置项和数据
		var pieOption3 = {
				title : {
					text: '游客消费水平',
			        x:'center'
			    },
			    tooltip : {
			        trigger: 'item',
			        formatter: "{a} <br/>{b} : {c} ({d}%)"
			    },
			    legend: {
			        orient: 'vertical',
			        left: 'left',
			        data: ['<=20元','20-50元','51-100元','>100元']
			    },
			    series : [
			        {
			            name: '游客消费水平',
			            type: 'pie',
			            radius: ['15%', '40%'],
			            center: ['50%', '60%'],
			            data:[
			                {value:level1, name:'<=20元',itemStyle:{normal : {color:'#22B8DD'}}},
			                {value:level2, name:'20-50元',itemStyle:{normal : {color:'#00CCFF'}}},
			                {value:level3, name:'51-100元',itemStyle:{normal : {color:'#0066FF'}}},
			                {value:level4, name:'>100元',itemStyle:{normal : {color:'#0909F7'}}}
			            ],
			            itemStyle: {
			                emphasis: {
			                	show : true,
			                	fontWeight: 'bold',
			                    shadowBlur: 10,
			                    shadowOffsetX: 0,
			                    shadowColor: 'rgba(0, 0, 0, 0.5)'
			                }
			            }
			        }
			    ]
		};
		// 使用刚指定的配置项和数据显示图表。
		myPieChart3.setOption(pieOption3);
	}
	
	//游客归属（柱状图）
	function initPillarChart(){
		$("#pillarChartArea").empty();
		//var pillarBothSelect = "";//柱状图省内外参数选择
		//var pillarTimeSelect = "";//柱状图时间参数选择
		//var pillarScenicSelect = "";//柱状图景区参数选择
		//alert(pillarScenicSelect + pillarBothSelect + pillarTimeSelect + selectTouristId)
		var arrx=[];//x轴数据
		var arry=[];//y轴数据
		var yName = '';//y轴数据单位
		var myarry = [];
		var yName2 = '';
    	if(pillarBothSelect == "省" || pillarBothSelect == ""){//各省x轴数据（不包含安徽省并且页面初始化时默认显示）
    		$.ajax({
                type : "post",
                async : false, //同步执行
                url : "<%=path%>/touristPhoto/getScenicNameForxAxis.html",
                data : {
                	selectTouristId : selectTouristId,
            		pillarBothSelect : pillarBothSelect,
            		pillarTimeSelect : pillarTimeSelect,
            		pillarScenicSelect : pillarScenicSelect
                },
                dataType : "json", //返回数据形式为json
                success : function(result) {
                    if (result) {
                           for(var i=0;i<result.length;i++){		                                   
                              arrx.push(result[i].short_name);
                            }    
                    }
                },
                error : function(errorMsg) {
                    alert("图表请求数据失败啦!");
                    myChart.hideLoading();
                }
           	});
    	}else{//省内x轴数据
    		$.ajax({
                type : "post",
                async : false, //同步执行
                url : "<%=path%>/touristPhoto/getScenicNameForxAxis.html",
                data : {
                	selectTouristId : selectTouristId,
            		pillarBothSelect : pillarBothSelect,
            		pillarTimeSelect : pillarTimeSelect,
            		pillarScenicSelect : pillarScenicSelect
                },
                dataType : "json", //返回数据形式为json
                success : function(result) {
                    if (result) {
                           for(var i=0;i<result.length;i++){
                              arrx.push(result[i].cities);
                            }    
                    }
                },
                error : function(errorMsg) {
                    alert("图表请求数据失败!");
                    myChart.hideLoading();
                }
           	});
    	}
        $.ajax({
	        type : "post",
	        async : false, //同步执行
	        url : "<%=path%>/touristPhoto/getNumberForSeries.html",
	        data : {
	        	selectTouristId : selectTouristId,
	    		pillarBothSelect : pillarBothSelect,
	    		pillarTimeSelect : pillarTimeSelect,
	    		pillarScenicSelect : pillarScenicSelect
	        },
	        dataType : "json", //返回数据形式为json
	        success : function(result) {
		        if (result) {
		               for(var i=0;i<result.length;i++){
		                  arry.push(result[i].sumtourists);
		                  myarry.push(result[i].sumtourists);
		                }  
		        }
		        yName = formateX2(arry);
		        yName2 = formateXforme(myarry);
		    },
		    error : function(errorMsg) {
		        alert("图表请求数据失败!");
		        myChart.hideLoading();
		    }
	   });
    	
    	myPillarChart = echarts.init(document.getElementById("pillarChartArea"),"macarons");
		// 指定图表的配置项和数据
		pillarOption = {
				title : {
			    },
			    tooltip : {
			        trigger: 'axis',
			      	formatter:'来源：'+'{b0}<br/>人数：'+'{c0}'+yName
			    },
			    legend: {
			    	 //data:['人数']
			    },
			    toolbox: {
			        show : false,
			        feature : {
			            dataView : {show: true, readOnly: false},
			            magicType : {show: true, type: ['line', 'bar']},
			            restore : {show: true},
			            saveAsImage : {show: true}
			        }
			    },
			    calculable : true,
			    grid:{
			    	x2:'50px',
			    	x:'50px',
			    	//y:'60px',
			    	//y2:'5%',
			    	//borderWidth:2
			    	//width:1450
			    },
			    xAxis : [//省内外景区名称
			        {
			            type : 'category',
			            data : arrx
			        }
			    ],
			    yAxis : [//游客数量，因为用的两个实体类游客数量字段相同则不用分类，省内省外兼用
			        {
			            type : 'value',
			            name : '单位('+yName+')'
			        }
			    ],
			    series : [
			        {
			            name:'人数',
			            type:'bar',
			            data:arry,
			            label: {
	       	            	  normal: {
		                         show: true,
		                         position: 'top',
		                         formatter: '{c}'+yName2
		                     }
	       	               },
			            itemStyle: {
        	            	 normal: {
        	            		barBorderRadius:[8,8,0,0]
        	            	 }
        	               },
			        }
			    ]
		};
		// 使用刚指定的配置项和数据显示图表。
		myPillarChart.setOption(pillarOption);
	}
	
	//报表区域自适应页面高宽度
	function autoHeight(){
		var blueHeight=document.getElementById("blueHeight").offsetHeight;
		var windowHeight=$(window).height();
		//var windowWidth=$(window).width();
		var mainHeight=(windowHeight-50)*1.7;
		document.getElementById("content-wrapper").style.cssText="min-height:"+mainHeight+"px";//内容高度
		//var contentMainHeight=document.getElementById("contentMainHeight").offsetHeight;
		var dataTableHeadHeight=document.getElementById("dataTableHeadHeight").offsetHeight;
		var displayTextHeight = document.getElementById("belongText").offsetHeight;
		//var displayBiliTextHeight = document.getElementById("timeText").offsetHeight;biliMain
		var footerHeight = document.getElementById("footer-bar").offsetHeight;
		var commonHeight=mainHeight-dataTableHeadHeight-displayTextHeight-footerHeight-20;
		document.getElementById("pillarChartArea").style.height = commonHeight*0.5 + "px";
		document.getElementById("biliMain").style.height = commonHeight*0.4 + "px";
		document.getElementById("pieChartArea").style.height = commonHeight*0.35+ "px";
		document.getElementById("pieChartArea2").style.height = commonHeight*0.35 + "px";
		document.getElementById("pieChartArea3").style.height = commonHeight*0.35 + "px";


		//document.getElementById("pillarChartArea").style.width = windowWidth - 220 + "px";
		//document.getElementById("contentHeightMenu").style.cssText="height:"+iframeHeight+"px;"+"width: 100%;MARGIN-top: 1px;";
	}
	
	//echarsdiv改变其内容宽度自适应
	function refreshEcharsWidth(){
		var windowWidth=window.innerWidth;
		document.getElementById("pillarChartArea").style.width = 100 + "%";
		document.getElementById("mainHeight").style.width=100+"%";//内容宽度
		var leftDiv=document.getElementById("page-wrapper");
		var leftDivClassName = leftDiv.className;//获取的classname--container：左边为张开状态，container nav-small：左边为收缩状态
		var option = myPillarChart.getOption();
		if(leftDivClassName == "container"){//点击收缩
			document.getElementById("pillarChartArea").style.width = windowWidth - 64 + "px";
			//myPillarChart.getRenderedCanvas({  
		      // width:1700
		    //});  
			option.grid={
		    	x2:'1px',
		    	x:'60px'
		    };
		}else if(leftDivClassName = "container nav-small"){
			document.getElementById("pillarChartArea").style.width = windowWidth - 220 + "px";
			option.grid={
			    x2:'150px',
			    x:'60px'
			};
		}
		myPillarChart.setOption(option);//重新设置的属性值加到原来echarts报表的option里
		
		//window.onresize = myPillarChart.resize;
	}
	
	function formateXforme(xAxis){
		var max=Math.max.apply(null, xAxis);
		if(max>10000){
			for (var i = 0; i < xAxis.length; i++) {
				xAxis[i]=(xAxis[i]/10000).toFixed(2);
			}
			return "";
		}else if(max>1000) {
			for (var i = 0; i < xAxis.length; i++) {
				xAxis[i]=(xAxis[i]/1000).toFixed(2);
			}
			return "";
		}else{
			return "";
		}
	}

</script>