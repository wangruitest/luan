<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="com.funo.report.*"%>
<%@page import="com.funo.report.charts.ReportConstants"%>
<%@page import="com.funo.utils.Constants"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
  <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<title>城市游客来源地分析</title>
		<%  String today =DateUtil.format(new Date(),"yyyy"); %>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<script type="text/javascript" src="../../dwr/interface/ChartReportCommonUtil.js"></script>
		<script type="text/javascript" src="../../dwr/interface/ReportExportExcel.js"></script>
 		<script type="text/javascript" src="../../dwr/interface/UtilsAction.js"></script>
 		<script type='text/javascript' src='../../dwr/interface/HolidayAction.js'></script>
 		  <script type="text/javascript" src="../../js/jquery/date-functions.js"></script>
 		<%@include file="/jsp/common/easyuicommon.jsp" %>
 		<jsp:include flush='true' page='../common/file_inc.jsp'></jsp:include>
		<jsp:include flush='true' page='../common/echarts_inc.jsp'></jsp:include>
		<script type="text/javascript">
		    var pieOption=null,barOption=null,lineOption=null;
			var pieChart=null,barChart=null,lineChart=null;
		$(function(){
				initloginerCityList();
				var jieriList=document.getElementById("holidayLastDay");
				
		        //创建列表
				$("#gridbox").datagrid({
					title:"所有景区接待统计",
					singleSelect: true,
					pagination: true,
					rownumbers:true,
					border:false,
					height:getViewportHeight()-94,
					//fit:true,
					pageSize: 20,
					fitColumns: true,
					columns : [ [ {
						field : 'PNAME',
						title : '来源地',
						width : 100
					}, {
						field : 'PCOUNT',
						title : '人数',
						width : 100
					}, {
						field : 'PTIME',
						title : '节假日',			
						formatter: function(value,row,index){
							var jieriName=jieriList.options[jieriList.selectedIndex ].text;
							var regx=/节/;
							if(!regx.test(jieriName)){
								jieriName=jieriName+'节';
							}
							return value+' '+jieriName;
						},
						width : 100
					} ] ]
				});
				
				firstLoad();
				
				$("#tabs").tabs({
					//fit:true,
					border:false,
					height:getViewportHeight()-65,
					onSelect:function(title){
							if(title=='柱状图' || title=='曲线图'){
							searchJc();
							}
					}
				});
 	 	 	});


		function initHolidayList(curYear){
			var cityids = document.getElementById("holidayLastDay");
			cityids.innerHTML="";
			//var curYear =  document.getElementById("yBeginTime").value;
			var Obj=new Object();
			Obj.firstDay =curYear;
			dwr.engine.setAsync(false);
			HolidayAction.getHolidayListByYear(Obj,function(data){
				if(null==data || null==data.returnList)return;
				for (var i=0;i<data.returnList.length;i++) {
					var varItem = new Option(data.returnList[i]['holidayName'],data.returnList[i]['lastDay']);
					cityids.options.add(varItem);
				}
			});
			dwr.engine.setAsync(true);
		}
 	 	 	
 	 	 	 function searchJc()
 			 {
 				 //获取beginTime ,节假日
 				 var beginTime = document.getElementById("yBeginTime").value;
 				var areaCode= document.getElementById("cityid").value;
 				var holidayLastDay= document.getElementById("holidayLastDay").value;
 				 var pObject = new Object();
				 pObject.beginTime = beginTime;
				 pObject.areaCode= areaCode;
				 pObject.holidayLastDay= holidayLastDay;
				 
				 var params  = new Array();
				 var echarts=showEChart(pObject,params,getStaticObject());
                 reTryChart(echarts);				 
				 var pObject2 = new Object();
				 pObject2.IS_NOT_FETCH = "true";
				 pObject2.areaCode = areaCode;
				 pObject2.holidayLastDay= holidayLastDay;
				 showDataListTable(getStaticObject(),pObject2,[]);
				 
				// reTryChart();
				 
 			 }
 	 	 	 
 	 	 	function reTryChart(chars){
 	 			for(var i=0;i<chars.length;i++){
 	 				if(chars[i].name!='<%=ReportConstants.PIE3D_CHART%>')
 	 				 chars[i].chart.setOption({
 	 					 xAxis : [
 	 					          {
 	 					        	  axisLabel :{
 	 					        		  interval :0,
 	 					        		  formatter: function (value, index) {
 	 					        			  return value.split('').join('\n');
 	 					        			}
 	 					        	  }
 	 					          }
 	 					          ]				
 	 				}); 
 	 				
 	 			}
 	 		}
 	 	    
 			 function exportJc()
			 {
 				var jieriList=document.getElementById("holidayLastDay");
 				var cityList=document.getElementById("cityid");
 				var city=cityList.options[cityList.selectedIndex ].text;
 				var jieri=jieriList.options[jieriList.selectedIndex ].text;
 				var beginTime=document.getElementById("yBeginTime").value;
 				 var headerStr = ["来源地","人数","节假日"];
 				 var title = beginTime+" "+jieri+" "+city+" 游客来源地分析";
 				var pObject = new Object();
 				 pObject.areaCode = document.getElementById("cityid").value;
 				 pObject.holidayLastDay = document.getElementById("holidayLastDay").value;
				 var params  = new Array();
				 showExports(pObject,params,getStaticObject(),headerStr,title);
			 }
 			 
 	 	 	/**表头参数的定义*/
 			function getStaticObject(){
 				var tObject = new Object();
 				var tObject = new Object();
 				var jieriList=document.getElementById("holidayLastDay");
 				var cityList=document.getElementById("cityid");
 				var city=cityList.options[cityList.selectedIndex ].text;
 				var jieri=jieriList.options[jieriList.selectedIndex ].text;
 				var time=document.getElementById("yBeginTime").value;
 				 tObject.caption=time+" "+jieri+" "+city+" 游客来源地分析";
 				 tObject.subTitle="统计节假日地市游客来源地，可按地市、节日查询";
 				 tObject.procedureName = "<%=ReportConstants.HOLIDAY_AREA%>";
 				 tObject.PROC_PARAMS = "<%=ReportConstants.HOLIADY_AREA_PARAMS%>";
 				 tObject.chartTypes = "<%=ReportConstants.COLUMN3D_CHART%>,<%=ReportConstants.PIE3D_CHART%>,<%=ReportConstants.LINE2D_CHART %>";
 				 tObject.noSplit = "NO";
 				 return tObject;
 			}
 			
 			function firstLoad(){
				var today = '<%=today%>';
				var day=new Date();
				today = day.getFullYear();
				document.getElementById("yBeginTime").value=today;
				initHolidayList(today);
				//document.getElementById("holidayName").value="元旦";
			}

 			function showExports(pObject,dateParams,tObject,headerStr,title){
 				dwr.engine.setAsync(false);//dwr非同步 
 				
 				ReportExportExcel.reportExport(pObject,dateParams,tObject,headerStr,title,{
 					callback:function(data){
 						if(data == null){
 							alert("查询结果为空，无数据导出！");
 							return;
 						}
 						var fileName=data[1]+".xls";
 						fileDownload(fileName);
 					}});
 				dwr.engine.setAsync(true);
 			}
 			
 			
 			function searchValidate() {
 		        var beginTime = document.getElementById("yBeginTime").value;
 		        
 		       var beginTime = document.getElementById("yBeginTime").value;
 				
 		        if (beginTime == "") {
 		            alert("请选择年份！");
 		            return;
 		        }
 		       
 		        if (document.getElementById("holidayLastDay").value == "") {
 		            alert("请选择节日！");
 		            return;
 		        }
 		        searchJc();
 		        //mygrid.sendQuery();
 		    }
 						
			
   </script>

  </head>
  
 <body style="margin: 0px;">
		<input type="hidden" id="procedureName" name="procedureName" value="<%=ReportConstants.HOLIDAY_AREA%>"/>
		<input type="hidden" id="PROC_PARAMS" name="PROC_PARAMS" value="<%=ReportConstants.HOLIADY_AREA_PARAMS%>"/>
		<div id="parameter">
			<div>
			<label>城市列表:</label> <select id="cityid" name="cityid"style="width: 100px"></select> 
			<label>选择年份:</label> <input type="text" id="yBeginTime" name="yBeginTime" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy',onpicking:function(dp){initHolidayList(dp.cal.getNewDateStr())}});" />
			<label>节日列表:</label> <select id="holidayLastDay" name="holidayLastDay" style="width: 100px"></select>

			<input type="button" id="searchbtn" name="searchbtn" value="查 询 " onclick="searchValidate();" /> 
			<input type="button" id="searchbtn2"name="searchbtn2" value="导出excel " onclick="exportValidate()" /> 
			<input type="hidden" id="searchtype" value="y"/>
		</div>
		</div>
			
		<div id="tabs" class="easyui-tabs">
			<div id="<%=ReportConstants.COLUMN3D_CHART %>" title="柱状图" ></div>
		    <div id="<%=ReportConstants.LINE2D_CHART %>" title="曲线图" ></div>
			<div id="grid" title="数据列表" >
				<div id="gridboxdiv" >
					<table id="gridbox"></table>
				</div>
			</div>
		</div>
	</body>
</html>
