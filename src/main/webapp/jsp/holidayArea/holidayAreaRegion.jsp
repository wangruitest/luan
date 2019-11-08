<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="com.funo.report.*"%>
<%@page import="com.funo.report.charts.ReportConstants"%>
<%@page import="com.funo.utils.Constants"%>
<%@page import="com.funo.system.model.SysOperator" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
  <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<title>城市游客来源地分析</title>
<% 
String today =DateUtil.format(new Date(),"yyyy"); 
SysOperator user = null;
    if (request.getSession() != null && request.getSession().getAttribute(Constants.Session_Attribute_UserEnv) != null) {
        user = (SysOperator) request.getSession().getAttribute(Constants.Session_Attribute_UserEnv);
    }
    String curCountyCode = "";
    if (null != user.getCountyCode()) {
    	curCountyCode = user.getCountyCode();
    }
%>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<script type="text/javascript" src="../../dwr/interface/ChartReportCommonUtil.js"></script>
		<script type="text/javascript" src="../../dwr/interface/ReportExportExcel.js"></script>
		<script type='text/javascript' src='../../dwr/interface/RegionCfgAction.js'></script>
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
				initCountyList();
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
							if(value.length > 4){
								return value;
							}else{
								return value+' '+jieriName;
							}
							
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

		/***
	     * 初始化区县列表
	     **/
	    function initCountyList(){
	    	var cityid=$("#cityid").val();
	    	var countyid=$("#countyCode");
	    	var countyCode='<%=curCountyCode%>';
	    	if(countyCode==null||countyCode==""||countyCode==0){
	    	dwr.engine.setAsync(false);
	    	RegionCfgAction.getAreasList(cityid,function(data){
	    		countyid.empty();
	    		if(null==data || null==data.returnList)return;
	    		countyid.prepend("<option value='0'>全部</option>");
	    		for (var i=0;i<data.returnList.length;i++) {
	    	    countyid.append("<option value='"+ data.returnList[i]['areaid']+"'>"+ data.returnList[i]['areas'] +"</option>");
	    		}
	    	});
	    	dwr.engine.setAsync(true);
	    	}else{
	    		dwr.engine.setAsync(false);
		    	RegionCfgAction.getArea(countyCode,function(data){
		    		countyid.empty();
		    		if(null==data || null==data.returnList)return;
                    for (var i=0;i<data.returnList.length;i++) {
		    	    countyid.append("<option value='"+ data.returnList[i]['areaid']+"'>"+ data.returnList[i]['areas'] +"</option>");
		    		}
		    	});
		    	dwr.engine.setAsync(true);
	    	}
	    }
		
	    function initHolidayList(){
			var cityids = document.getElementById("holidayLastDay");
			cityids.innerHTML="";
			var curYear =  document.getElementById("yBeginTime").value;
			var Obj=new Object();
			Obj.beloneYear =curYear;
			dwr.engine.setAsync(false);
			HolidayAction.getHolidayList(Obj,function(data){
				if(null==data || null==data.returnList)return;
				for (var i=0;i<data.returnList.length;i++) {
					var varItem = new Option(data.returnList[i]['holidayName'],data.returnList[i]['lastDay']);
					cityids.options.add(varItem);
				}
			});
			dwr.engine.setAsync(true);
		}
		
	/*	function initHolidayList(curYear){
			var cityids = document.getElementById("holidayLastDay");
			cityids.innerHTML="";
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
 	 	 	*/
 	 	 	 function searchJc()
 			 {
 				 //获取beginTime ,节假日
 				 var beginTime = document.getElementById("yBeginTime").value;
 				var areaCode= document.getElementById("cityid").value;
 				var countyCode=document.getElementById("countyCode").value;
 				var holidayLastDay= document.getElementById("holidayLastDay").value;
 				 var pObject = new Object();
				 pObject.beginTime = beginTime;
				 pObject.areaCode= areaCode;
				 pObject.countyCode= countyCode;
				 pObject.holidayLastDay= holidayLastDay;
				 
				 var params  = new Array();
				 var echarts=showEChart(pObject,params,getStaticObject());
                 //reTryChart(echarts);				 
				 var pObject2 = new Object();
				 pObject2.IS_NOT_FETCH = "true";
				 pObject2.areaCode = areaCode;
				 pObject2.countyCode = countyCode;
				 pObject2.holidayLastDay= holidayLastDay;
				 showDataListTable(getStaticObject(),pObject2,[]);
				 
				//reTryChart();
				 
 			 }
 	 	 	 
 	 	 	function reTryChart(chars){
 	 			for(var i=0;i<chars.length;i++){
 	 				if(chars[i].name!='<%=ReportConstants.PIE3D_CHART%>')
 	 				 chars[i].chart.setOption({
 	 					 xAxis : [
 	 					          {
 	 					        	  axisLabel :{
 	 					        		  
 	 					        	  }
 	 					          }
 	 					          ]				
 	 				}); 
 	 				
 	 			}
 	 		}
 	 	    
 			 function exportJc()
			 {
			    var number="1";
 				var jieriList=document.getElementById("holidayLastDay");
 				var cityList=document.getElementById("cityid");
 				var countyList=document.getElementById("countyCode");
 				var city=cityList.options[cityList.selectedIndex ].text;
 				var jieri=jieriList.options[jieriList.selectedIndex ].text;
 				var county=countyList.options[countyList.selectedIndex].text;
 				var beginTime=document.getElementById("yBeginTime").value;
 				 var headerStr = ["来源地","人数","节假日"];
 				 var title = beginTime+" "+jieri+" "+city+county+" 游客来源地分析";
 				var pObject = new Object();
 				 pObject.areaCode = document.getElementById("cityid").value;
 				 pObject.holidayLastDay = document.getElementById("holidayLastDay").value;
 				 pObject.countyCode=document.getElementById("countyCode").value;
				 var params  = new Array();
				 showExports(pObject,params,getStaticObject(),headerStr,title,number);
			 }
 			 
 	 	 	/**表头参数的定义*/
 			function getStaticObject(){
 				var tObject = new Object();
 				var tObject = new Object();
 				var jieriList=document.getElementById("holidayLastDay");
 				var cityList=document.getElementById("cityid");
 				var countyList=document.getElementById("countyCode");
 				var city=cityList.options[cityList.selectedIndex ].text;
 				var jieri=jieriList.options[jieriList.selectedIndex ].text;
 				var county=countyList.options[countyList.selectedIndex].text;
 				var time=document.getElementById("yBeginTime").value;
 				tObject.xname="单位（省市）";
 				tObject.yname="单位（人数）";
 				 tObject.caption=time+" "+jieri+" "+city+county+" 游客来源地分析";
 				 tObject.subTitle="统计节假日地市区县游客来源地，可按地市区县、节日查询";
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

 			function showExports(pObject,dateParams,tObject,headerStr,title,number){
 				dwr.engine.setAsync(false);//dwr非同步 
 				
 				ReportExportExcel.reportExport(pObject,dateParams,tObject,headerStr,title,number,{
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
 		        
 		     //  var beginTime = document.getElementById("yBeginTime").value;
 				
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
			<label>城市列表:</label> <select id="cityid" name="cityid"style="width: 100px" onchange="initCountyList()"></select> 
			<label>区县列表:</label> <select id="countyCode" name="countyCode" style="width:100px;"></select>
			<label>选择年份:</label> <input type="text" id="yBeginTime" name="yBeginTime" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy',onpicking:initHolidayList()});" />
			<label>节日列表:</label> <select id="holidayLastDay" name="holidayLastDay" style="width: 100px"></select>

			<a href="javascript:void(0);" class="easyui-linkbutton" icon="icon-search" id="searchbtn" onclick="searchValidate();">查询</a> 
			<a href="javascript:void(0);"class="easyui-linkbutton" id="searchbtn2" onclick="exportValidate()">导出excel</a>
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
