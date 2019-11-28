<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<script type="text/javascript">

var selectTouristId="";
var timeType="近一个月";
var showType = true;
var state="";
var currentYear = new Date().getFullYear();
$( function(){
	loadMenus();
	getProvinceAndCity();
	autoHeight();
	getSelectDataListClik();
	getScenicByTouristid();
	initRankChart();
	loadHoliday();
	loadHolidayName(currentYear);
	$("#stay").click(function(){
		$(".timeArea2").show();
		$(".timeArea").hide();
		initStayChart();
		state="2";
		showType = false;
	});
	$("#rank").click(function(){
		timeType="近一个月";
		$(".timeArea2").hide();
		$(".timeArea").show();
		initRankChart();
		state="1";
		showType = true;
	});
	
	//选择时间段后，单击后改变样式
	$(".timeDataList").click(function(){
 		timeType = $(this).text();
		initStayChart();

	});
	$(".dayButton").click(function(){
		timeType = $(this).text();	
		initRankChart();
	});
	
	$(".yearText").change(function(){
		var year=$(this).val();
		$(".timeHolidayList li:gt(0)").remove();
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
	    $(".timeHolidayList").append("<li class='dayButton dayButtonMt' id='holiday' value='"+data[index].lastDay.substr(0, 10).replace("-","x").replace("-","x")+"' onclick='changeHolidayName(this);'>"+data[index].holidayName+"</li>");
	    }
	    }
	});
}

function changeHolidayName(obj){
	$(".timeData").hide();
	$(obj).addClass("dayButtonActive");
	$(obj).siblings().removeClass("dayButtonActive");
	$(obj).parent().siblings().children().removeClass("dayButtonActive");
	$(".timeTextLeft").html($(obj).html());
	timeType=$(obj).attr("value").replace("x", "-").replace("x", "-");
	initRankChart();
}
function loadHoliday(){
	$.ajax({
	    type: 'POST',
	    url: '<%=path%>/holidaymanagement/getHolidayYear.html',
	    dataType : "json",
	    success: function (data) {
	    for(var index in data){
	    if(currentYear==data[index].beloneYear){
	    	$("#yearText").append("<option selected='true'>"+data[index].beloneYear+"</option>");
	    }else{
	    	$("#yearText").append("<option >"+data[index].beloneYear+"</option>");
	    }
	    }
	   }
	});
}

function initRankChart(){
	//基于准备好的dom，初始化echarts实例
	$("#dataMain").empty();
	var myPillarChart = echarts.init(document.getElementById("dataMain"),'macarons');
	var showData = true;
	var num = 10;
	var xName;
	var XData ;
	var YData ;
	 $.ajax({
         type : "post",
         async : false, //同步执行
         url : "<%=path %>/scenicMonitor/rank.html",
         data : {
        	 timeType:timeType,
        	 diqu:selectTouristId
         },
         dataType : "json", //返回数据形式为json
         success : function(result) {
             if (result) {
            	 xName=formateX2(result.countLst);
            	 if(result.nameLst.length<10){
            		 showData = false;
            		 num = 100;
            	 }
            	 XData = result.nameLst;
            	 YData = result.countLst;
            	 myPillarChart.hideLoading();
         	    
             }
	     },
	     error : function(errorMsg) {
	         alert("图表请求数据失败啦!");
	         myPillarChart.hideLoading();
	     }
	});
	 option = {
	    		tooltip : {
	    			trigger: 'item',
			      	formatter:'景区：'+'{b0}<br/>客流量：'+'{c0}'+xName
			    },
  	        calculable : true,
  	        legend: {
  	            data:['人数排行'],
  	            itemGap: 5
  	        },
  	        grid: {
  	            top: '12%',
  	            left: '1%',
  	            right: '5%',
  	            containLabel: true
  	        },
  	        xAxis: [
  	            {
  	                type : 'category',
  	                data : XData
  	            }
  	        ],
  	        yAxis: [
  	            {
  	                type : 'value',
 	               	name : '单位('+xName+')'
  	            }
  	        ],
  	        dataZoom: [
  	            {
  	            	show:showData,
  	            	showDetail:false,
  	            	zoomLock:true,
  	                start: 0,
  	                end: num
  	            }
  	        ],
  	        series : [
  	            {
  	                name: '人数排行',
  	                type: 'bar',
    	               label: {
    	            	  normal: {
	                         show: true,
	                         position: 'top',
	                         formatter: '{c} '+xName
	                     }
    	               },
  	               	itemStyle: {
  	               		normal :{
  	               			barBorderRadius:[10,10,0,0]
  	               		}
  	               },
  	                data: YData
  	            }
  	        ]
  	    };

  	    myPillarChart.setOption(option);
}

function initStayChart(){
	//基于准备好的dom，初始化echarts实例
	$("#dataMain").empty();
	var myPillarChart = echarts.init(document.getElementById("dataMain"),'macarons');
	var showData = true;
	var num = 10;
	var xName ;
	var XData ;
	var YData ;
	$.ajax({
         type : "post",
         async : false, //同步执行
         url : "<%=path %>/scenicMonitor/stay.html",
         data : {
        	 timeType:timeType,
        	  diqu:selectTouristId
         },
         dataType : "json", //返回数据形式为json
         success : function(result) {
        	 xName=formateX3(result.countLst);
             if (result) {
            	 if(result.nameLst.length<10){
            		 showData = false;
            		 num = 100;
            	 }
            	 XData = result.nameLst;
            	 YData = result.countLst;
            	 myPillarChart.hideLoading();
         	   
             }
	     },
	     error : function(errorMsg) {
	         alert("图表请求数据失败啦!");
	         myPillarChart.hideLoading();
	     }
	});
	 
	option = {
			tooltip : {
				trigger : 'item',
				formatter : '景区：' + '{b0}<br/>时间：' + '{c0}' + xName
			},
			calculable : true,
			legend : {
				data : [ '驻留时间' ],
				itemGap : 5
			},
			grid : {
				top : '12%',
				left : '1%',
				right : '5%',
				containLabel : true
			},
			xAxis : [ {
				type : 'category',
				data : XData
			} ],
			yAxis : [ {
				type : 'value',
				name : '单位(' + xName + ')'
			} ],
			dataZoom : [ {
				show : showData,
				showDetail : false,
				zoomLock : true,
				start : 0,
				end : num
			} ],
			series : [ {
				name : '驻留时间',
				type : 'bar',
				label : {
					normal : {
						show : true,
						position : 'top',
						formatter : '{c} ' + xName
					}
				},
				itemStyle : {
					normal : {
						barBorderRadius : [ 10, 10, 0, 0 ]
					}
				},
				data : YData
			} ]
		};

		myPillarChart.setOption(option);
	}
</script>