<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="com.funo.report.*"%>
<%@page import="com.funo.report.charts.ReportConstants"%>
<%@page import="com.funo.utils.Constants"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
  <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<title>节假日城市外地游客接待统计</title>
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
			function loseFocus(time) {
			time.blur();
			}
		$(function(){
		        //创建列表
				$("#gridbox").datagrid({
					title:"城市外地游客接待统计",
					singleSelect: true,
					pagination: true,
					rownumbers:true,
					border:false,
					height:getViewportHeight()-94,
					//fit:true,
					pageSize: 20,
					fitColumns: true,
					columns:[[
						{field:'HOLIDAYDATE',title:'年份',width:100},
						{field:'HOLIDAYNAME',title:'节假日',width:100},
						{field:'CITYNAME',title:'地市',width:100},
						{field:'PEOPLENUM',title:'游客数量',width:100}
					]]
				});
				
				firstLoad();
				
				$("#tabs").tabs({
					//fit:true,
					border:false,
					height:getViewportHeight()-65,
					onSelect:function(title){
							if(title=='柱状图' || title=='曲线图'){
							searchValidate();
							}
					}
				});
 	 	 	});


		function initHolidayList(){
			var cityids = document.getElementById("holidayNames");
			cityids.innerHTML="";
			var curYear =  document.getElementById("yBeginTime").value;
			var Obj=new Object();
			Obj.beloneYear =curYear;
			dwr.engine.setAsync(false);
			HolidayAction.getHolidayList(Obj,function(data){
				if(null==data || null==data.returnList)return;
				for (var i=0;i<data.returnList.length;i++) {
					var varItem = new Option(data.returnList[i]['holidayName'],data.returnList[i]['holidayName']);
					cityids.options.add(varItem);
				}
			});
			dwr.engine.setAsync(true);
		}
 	 	 	
 	 	 	 function searchJc()
 			 {
 				 
 				 //获取beginTime ,节假日
 				 var beginTime = document.getElementById("yBeginTime").value;
 				 var holidayName=document.getElementById("holidayNames").value;
 				 var pObject = new Object();
				 pObject.beginTime = beginTime;
				 pObject.holidayName= holidayName;
				 var params  = new Array();
				 var echarts=showEChart(pObject,params,getStaticObject());
                 reTryChart(echarts);				 
				 var pObject2 = new Object();
				 pObject2.IS_NOT_FETCH = "true";
				 pObject2.beginTime = beginTime;
				 pObject2.holidayName= holidayName;
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
				 var headerStr = ["年份","节假日","地市","游客数量"];
				 var beginTime = document.getElementById("yBeginTime").value;
				 var holidayName=document.getElementById("holidayNames").value;
				 var title = beginTime +"年"+holidayName+"城市外地游客接待统计";
				 var pObject = new Object();
				 pObject.beginTime = beginTime;
				 pObject.holidayName= holidayName;
				 var params  = new Array();
				 showExports(pObject,params,getStaticObject(),headerStr,title);
			 }
 			 
 	 	 	/**表头参数的定义*/
 			function getStaticObject(){
 				var tObject = new Object();
 				 var beginTime = document.getElementById("yBeginTime").value;
				 var holidayName=document.getElementById("holidayNames").value;
 				 tObject.caption=beginTime+"年"+holidayName+"城市外地游客接待统计";
				 tObject.subTitle=beginTime+"年"+holidayName+"城市外地游客数量，可按节假日，年份统计。";
 				 tObject.procedureName = "<%=ReportConstants.FOR_TOUR_RECEPTION_PROCEDURE%>";
 				 tObject.PROC_PARAMS = "<%=ReportConstants.FOR_TOUR_RECEPTION_PROCEDURE_PARAMS%>";
 				 tObject.chartTypes = "<%=ReportConstants.COLUMN3D_CHART%>,<%=ReportConstants.PIE3D_CHART%>,<%=ReportConstants.LINE2D_CHART %>";
 				 tObject.noSplit = "NO";
 				 return tObject;
 			}
 			
 			function firstLoad(){
				var today = '<%=today%>';
				var day=new Date();
				today = day.getFullYear();
				document.getElementById("yBeginTime").value=today;
				initHolidayList();
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
 		        
 		        if (beginTime == "") {
 		            alert("请选择年份！");
 		            return;
 		        }
 		       
 		        
 		        if (document.getElementById("holidayNames").value == "") {
 		            alert("请选择节日！");
 		            return;
 		        }
 		        searchJc();
 		        //mygrid.sendQuery();
 		    }
 						
			
   </script>

  </head>
  
 <body style="margin: 0px;">
		<input type="hidden" id="procedureName" name="procedureName" value="<%=ReportConstants.FOR_TOUR_RECEPTION_PROCEDURE%>"/>
		<input type="hidden" id="PROC_PARAMS" name="PROC_PARAMS" value="<%=ReportConstants.FOR_TOUR_RECEPTION_PROCEDURE_PARAMS%>"/>
		<div class="parameter">
			<div >
			    <label>选择年份:</label>
			   <input
				type="text" id="yBeginTime" name="yBeginTime" class="Wdate"
				onclick="WdatePicker({dateFmt:'yyyy',onpicking:initHolidayList()});loseFocus(this);" readonly="readonly" value="2016"/>
				
				<label>选择假日:</label>
				<select  id="holidayNames" name="holidayNames" >
				</select>
				<!-- <input type="button" id="searchbtn" name="searchbtn" value="查 询 " onclick="searchValidate();"/>
				<input type="button" id="searchbtn2" name="searchbtn2" value="导出excel " onclick="exportJc()"/> -->
		 	
			<a href="javascript:void(0);" class="easyui-linkbutton" icon="icon-search" id="btn_query" onclick="searchValidate();">查询</a> 
			<a href="javascript:void(0);"class="easyui-linkbutton" id="btn_exp" onclick="exportJc()">导出excel</a>
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
