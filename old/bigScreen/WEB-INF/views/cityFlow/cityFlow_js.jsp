<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<script type="text/javascript">
//----------------------几日游、三十天人数分析全局变量-------------------------
	var	selectTouristId  ="";
	var ProAndCitySelect = "";//省市参数选择
	var BothSelect = "";//省内外参数选择
	var TimeSelect = "";//时间参数选择
	var Choose = "";
	var choose = "旅客";//游客类型的选择
	var xName = "";
	var xName2 = "";
	var xName3 = "";
	var pName="";
	var namedanwei ="";
	var arr = [];
	var arr1 = [];//折线图X轴时间坐标
	var arr2 = [];//折线图Y轴 旅客
	var arr3 = [];//折线图Y轴 游客

	var arr4 = [];//省内多日游游客数量
	var arr5 = [];//省多日游游客数量
	var arr6 = [];//多日游游客驻留天数
//----------------------------------------------------------------------------

//---------------------------游客归属全局变量initPillarChart-------------------
var pillarBothSelect = "";//柱状图省内外参数选择
var pillarTimeSelect = "";//柱状图时间选择
var currentYear = new Date().getFullYear();
var stat_date = "";//所选假期时间，取假期最后一天时间
//----------------------------------------------------------------------------
	//var reslut1;
	$(function() {
		getProvinceAndCity();
 		autoHeight();
 		getData1();
		getData2();
		initPillarChart();
		loadHoliday();
		loadHolidayName(currentYear);
		
		$(".belogYearText").change(function(){
			var year=$(this).val();
			$(".holidayList li:gt(0)").remove();
			loadHolidayName(year);
		});
	});
function loadHolidayName(year){
	$.ajax({
	    type: 'POST',
	    url: '<%=path%>/holidaymanagement/showHolidayManagementInfor.html',
	    dataType : "json",
	    data: {
			holidayYear : year
		},
	    success: function (data) {
	    for(var index in data){
	    $(".holidayList").append("<li class='dayButton dayButtonMt' id='holiday' value='"+data[index].lastDay.substr(0, 10).replace("-","x").replace("-","x")+"' onclick='changeHolidayName(this);'>"+data[index].holidayName+"</li>");
	    }
	    }
	});
	
}
function loadHoliday(){
	$.ajax({
	    type: 'POST',
	    url: '<%=path%>/holidaymanagement/getHolidayYear.html',
	    dataType : "json",
	    success: function (data) {
	    for(var index in data){
	    if(currentYear==data[index].beloneYear){
	    	$("#belogYearText").append("<option selected='true' value='"+data[index].beloneYear+"'>"+data[index].beloneYear+"</option>");
	    }else{
	    	$("#belogYearText").append("<option value='"+data[index].beloneYear+"'>"+data[index].beloneYear+"</option>");
	    }
	    }
	   }
	});
}
function changeHolidayName(obj){
	$(".belongData").hide();
	$(obj).addClass("belongButtonActive");
	$(obj).siblings().removeClass("belongButtonActive");
	$(obj).parent().siblings().children().removeClass("belongButtonActive");
	$(".belongTimeText").html($(obj).html());
	stat_date=$(obj).attr("value").replace("x", "-").replace("x", "-");
	pillarTimeSelect="";
	initPillarChart();
}
function getData1(){
	$("#citymain").empty();
	arr1 = [];//折线图X轴时间坐标
	arr2 = [];//折线图Y轴 旅客
	arr3 = [];//折线图Y轴 游客
	$.ajax({
		type : "post",
		async : false, // 同步执行
		url : "<%=path%>/cityFlow/getStatDayForxAxis.html",
		data : {
			selectTouristId :selectTouristId,
			BothSelect : BothSelect,
			TimeSelect : TimeSelect,
			Choose : Choose
		},
		dataType : "json", // 返回数据形式为json
		success : function(result) {

			if (result.length>0) {			
				for ( var i = 0; i < result.length; i++) {
					//console.log(result[i].statday);
					arr1.push(result[i].statday);
					arr2.push(result[i].sumtourists);//旅客
					arr3.push(result[i].sumcitycount);//游客
				}
				//xName = formateX4(arr2, arr3);
				xName2 = formateX2(arr2);				
				xName3 = formateX2(arr3);				
			}
			if($(".saiText").html() == "旅客" || $(".saiText").html() == ""){
				$(".saiText").html(choose);
				xName = xName2;
				namedanwei = '时间：'+'{b0}<br/>人数：'+'{c0}'+xName2,
				initMyCharts(arr1, arr2, arr);
			}else if($(".saiText").html() == "游客"){
				$(".saiText").html(choose);
				xName = xName3;
				namedanwei = '时间：'+'{b1}<br/>人数：'+'{c1}'+xName3,
				initMyCharts(arr1, arr, arr3);
			}
			
		},
		error : function(errorMsg) {
			alert("图表请求数据失败啦!");
			myChart.hideLoading();
		}
	});
}
	function initMyCharts(n1, n2, n3) {
		// 基于准备好的dom，初始化echarts实例
		$("#citymain").empty();
		var myChart1 = echarts.init(document.getElementById('citymain'),
				"macarons");

		// 指定图表的配置项和数据
		var option1 = {
			title : {
				text : ''
			},
			tooltip : {
				trigger : 'axis',
				formatter:namedanwei,
			},
			legend : {
				data : []
			},
			grid : {
				top: '12%',
				left : '1%',
				right : '6%',
				bottom : '3%',
				containLabel : true
			},
			xAxis : [ {
				type : 'category',
				boundaryGap : false,
				data : n1
			} ],
			yAxis : [ {
				type : 'value',
				name : '单位(' + xName + ')'
			} ],
			series : [ {
				name : '旅客',
				type : 'line',
				//stack : '总量',
				areaStyle : {
					normal : {}
				},
				data : n2
			}, {
				name : '游客',
				type : 'line',
				//stack : '总量',
				areaStyle : {
					normal : {}
				},
				data : n3
			} ]
		};
		// 使用刚指定的配置项和数据显示图表。
		myChart1.setOption(option1);
	}

	//景区数据内，选择时间，单击在左边显示	
	$('.saiDataList').click(function() {
		choose = $(this).text();
		if (choose == "游客") {
			xName = xName3;
			namedanwei = '时间：'+'{b1}<br/>人数：'+'{c1}'+xName3,
			initMyCharts(arr1, arr, arr3);
		} else if (choose == "旅客") {
			xName = xName2;
			namedanwei = '时间：'+'{b0}<br/>人数：'+'{c0}'+xName2,
			initMyCharts(arr1, arr2, arr);
		}
	});	

	 $('.timeDataList').click(function() {
		TimeSelect = $(this).text();
		if (TimeSelect == "近一个月") {
			getData2();
		}else if (TimeSelect == "近一个季度") {
			getData2();
		} else if (TimeSelect == "近半年") {
			getData2();
		}
		initMyCharts2(arr4, arr5, arr6, pName);

	});

	function getData2() {
		$("#daymain").empty();
		arr4 = [];
		arr5 = [];
		arr6 = [];

		$.ajax({
			type : "post",
			async : false, // 同步执行
			url : "<%=path%>/cityFlow/getStayDayForBar.html",
			data : {
				selectTouristId : selectTouristId,
				BothSelect : BothSelect,
				TimeSelect : TimeSelect,
				Choose : Choose
			},
			dataType : "json", // 返回数据形式为json
			success : function(result) {
				if (result.length>0) {
					for ( var i = 1; i < result.length; i++) {
						arr6.push(result[i].statday);
						arr4.push(result[i].sumtourists1);//省内旅客
						arr5.push(result[i].sumcitycount1);//省外游客
					}					
					arr4.push(result[0].sumtourists1);//省内旅客
					arr5.push(result[0].sumcitycount1);//省外游客
					 pName = formateX4(arr4, arr5);					
				}
				initMyCharts2(arr4, arr5, arr6, pName);
			},
			error : function(errorMsg) {
				alert("图表请求数据失败啦!");
				//myChart.hideLoading();
			}
		});
	}

	function initMyCharts2(arr4, arr5, arr6, pName) {
		// 基于准备好的dom，初始化echarts实例
		var myChart2 = echarts.init(document.getElementById('daymain'),
				"macarons");

		// 指定图表的配置项和数据
		var option2 = {
			title : {
				text : '',
				subtext : ''
			},
			grid : {
				top: '12%',
				left : '2%',
				right : '6%',
				bottom : '3%',
				containLabel : true
			},
			tooltip : {
				trigger : 'axis',
				formatter:"{b0}<br/><div style='display:inline-block;width:12px;height:12px;background:#00BBFF;border-radius:50%'></div>"+" 省内：{c0}"+pName+
  				      		"<br/><div style='display:inline-block;width:12px;height:12px;background:#DDA0DD ;border-radius:50%'></div> 省外：{c1}"+pName
			},
			legend : {
				data : [ '省内', '省外' ]
			},
			calculable : true,
			xAxis : [ {
				type : 'category',
				data : [ "一日游", "二日游", "三日游", "四日游", "多日游" ]
			} ],
			yAxis : [ {
				type : 'value',
				name : '单位(' + pName + ')'
			} ],
			series : [ {
				name : '省内',
				type : 'bar',
				data : arr4,
				label: {
   	            	  normal: {
                         show: true,
                         position: 'top',
                         formatter: '{c} '+pName
                    
                     }
   	               },
				itemStyle : {
					normal : {
						barBorderRadius : [ 10, 10, 0, 0 ]
					}
				},

			}, {
				name : '省外',
				type : 'bar',
				data : arr5,
				label: {
 	            	  normal: {
                       show: true,
                       position: 'top',
                       formatter: '{c} '+pName
                   }
 	               },
				itemStyle : {
					normal : {
						barBorderRadius : [ 10, 10, 0, 0 ]
					}
				},
			} ]
		};
		// 使用刚指定的配置项和数据显示图表。
		myChart2.setOption(option2);
	}

//旅客归属报表
function initPillarChart(){
		$("#touristsAttribute").empty();
		var arrx=[];//x轴数据
		var arry=[];//y轴数据
		var yName = '';//y轴数据单位
		$.ajax({
			url:"<%=path%>/cityFlow/getTouristsAttribute.html",
			data:{
				pillarBothSelect : pillarBothSelect,
				selectTouristId : selectTouristId,
				pillarTimeSelect : pillarTimeSelect,
				stat_date : stat_date
			},
			dataType:"json",
			async:false,
			success:function(result){
				if(result == null || result == ""){
					arrx.push(0);
					arry.push(0);
				}
				if (result) {
					if(pillarBothSelect == "sheng" || pillarBothSelect == ""){
						for(var i=0;i<result.length;i++){
			            	arrx.push(result[i].provinces);
			            }
					}else if(pillarBothSelect == "shi"){
						for(var i=0;i<result.length;i++){
			            	arrx.push(result[i].cities);
			            }
					}
		            for(var i=0;i<result.length;i++){
		            	arry.push(result[i].num);
			        }
		            	yName = formateX2(arry);
		        }
			},
			error:function(errorMsg){
				alert("加载图表错误");
			}
		});
    
    	
    	myPillarChart = echarts.init(document.getElementById("touristsAttribute"),"macarons");
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
			    },
			    xAxis : [
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
		                         formatter:function(a,b,c){
		                        	 if(pillarBothSelect == "sheng" || pillarBothSelect == ""){
		                        		 return "";
		                        	 }else{
			                        	 return c;
		                        	 }
		                       	 }
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
	
	function formateX4(xAxis1, xAxis2) {
		var max1 = Math.max.apply(null, xAxis1);
		var max2 = Math.max.apply(null, xAxis2);
		var max = Math.max(max1, max2);
		if (max > 10000) {
			for ( var i = 0; i < xAxis1.length; i++) {
				xAxis1[i] = (xAxis1[i] / 10000).toFixed(2);
			}
			for ( var i = 0; i < xAxis2.length; i++) {
				xAxis2[i] = (xAxis2[i] / 10000).toFixed(2);
			}
			return "万人";
		} else if (max > 1000) {
			for ( var i = 0; i < xAxis1.length; i++) {
				xAxis1[i] = (xAxis1[i] / 1000).toFixed(2);
			}
			for ( var i = 0; i < xAxis2.length; i++) {
				xAxis2[i] = (xAxis2[i] / 1000).toFixed(2);
			}
			return "千人";
		} else {
			return "人";
		}
	}
</script>