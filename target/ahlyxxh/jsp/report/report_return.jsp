<%@ page language="java" pageEncoding="UTF-8" %>
<%@page import="com.funo.report.charts.ReportConstants" %>
<%@page import="java.util.Date" %>
<%@page import="com.funo.report.*" %>
<%
	request.setAttribute("home", request.getContextPath());
	Date date=new Date();
    String today = DateUtil.format(date, "yyyy");
	String month=DateUtil.format(date, "yyyy-MM");
	String day=DateUtil.format(DateUtil.getDateAfter(date, -1), "yyyy-MM-dd");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>游客回头客统计</title>
    <script type="text/javascript" src="../../dwr/interface/ReportDwrUtil.js"></script>
    <script type="text/javascript" src="../../dwr/interface/ChartReportCommonUtil.js"></script>
    <script type="text/javascript" src="../../dwr/interface/ReportExportExcel.js"></script>
    <script type="text/javascript" src="../../dwr/interface/UtilsAction.js"></script>
    <script type="text/javascript" src="../../dwr/interface/RegionCfgAction.js"></script>
    <script type='text/javascript' src='../../dwr/interface/RegionRealtimeSumAction.js'></script>
    <script type="text/javascript" src="${home}/js/date/specialDate.js"></script>
    <script type="text/javascript" src="${home}/js/date/WdatePicker.js"></script>
    <%@include file="/jsp/common/easyuicommon.jsp" %>
    <jsp:include flush='true' page='../common/echarts_inc.jsp'></jsp:include>
    <jsp:include flush='true' page='../common/file_inc.jsp'></jsp:include>
</head>

<script>
    var areaCodes = "";//获取选择地区的字符串
    var areaCount = 0; //获取选择地区个数
    $(function () {
    	initForm();
        $("#ForeignCitiesSumList").datagrid({
            title:'游客回头客统计',
            singleSelect: true,
            pagination: true,
            rownumbers:true,
            height:getViewportHeight()-98,
            border:false,
            pageSize: 20,
            fitColumns: true,
            columns: [[
                {field: 'curTime', title: '当前年份人数', width: 100},
                {field: 'lastTime', title: '去年年份人数', width: 100 },
                {field: 'per', title: '回头客比例', width: 100}
            ]],
            data:[
	             {"curTime":   "0","lastTime":  "0","per":    "0%"}
            ]
        });
       /*  $("#tabs").tabs({
            border:false,
            height:getViewportHeight()-68,
            onSelect:function(title){
            	var queryObj = getSearchForm();
            	if(!valid(queryObj)) return;
            	query(queryObj);
            }
        }); */
    });
    
    function initForm() {
        //$("#btn_query").click(query);
        //$("#btn_exp").click(downloadExcel);
    	initProvinceCityList();
        initCountyList();
        //getForeignprovince();
    }
    
  	//查询
    function query(queryObj) {
    	reLoadGridData(queryObj);
    }
  	
    function searchJc(){
    	var queryObj = getSearchForm();
    	if(!valid(queryObj)) return;
    	query(queryObj);
    }
    
    function exportJc() {
    	var queryObj = getSearchForm();
    	if(!valid(queryObj)) return;
        RegionRealtimeSumAction.expExcel1(queryObj, function (result) {
            if (result.resultCode == "0") {
                var fileName = result.returnObject[1] + ".xls";
                fileDownload(fileName);
            } else {
                showMsg("导出Excel时出错，可能原因为：\n" + result.resultMessage);
            }
        });
    }
  	
  //加载表格数据
    function loadData(data) {
        $('#ForeignCitiesSumList').datagrid('unselectAll');
        if (data != null && data.length > 0) {
            $('#ForeignCitiesSumList').datagrid({loadFilter:pagerFilter}).datagrid('loadData', {total:data.length,rows:data});
        } else {
            $('#ForeignCitiesSumList').datagrid('loadData', {total: 0, rows: []});
        }
    }
	
    function reLoadGridData(queryObj) {
    	RegionRealtimeSumAction.getForeignCities(queryObj, function (result) {
            /* if (result.resultCode == "0") {
                var tab= $('.tabs-selected span:first').html();
                if(tab=='数据列表'){
                    loadData(result.returnList);
                }else {
                    var obj = result.returnObject;
                    var height = document.documentElement.clientHeight - 108;
                    try {
                        var barOption = eval("(" + obj[0] + ")");
                        var barDiv = document.getElementById("ForeignCitiesListCHART0");
                        barDiv.style.height = height + "px";
                        var barChart = echarts.init(barDiv);
                        barChart.clear();
                        barChart.setOption(barOption);
                    } catch (e) {
                    }
                    try {
                        var lineOption = eval("(" + obj[1] + ")");
                        var lineDiv = document.getElementById("ForeignCitiesListLine0");
                        lineDiv.style.height = height + "px";
                        var lineChart = echarts.init(lineDiv);
                        lineChart.clear();
                        lineChart.setOption(lineOption);
                    } catch (e) {
                    }
                } 
            } else {
                showMsg("游客回头客统计数据时出错，可能原因为：\n" + result.resultMessage);
            }*/
        });
    }

    /**查询验证**/
    function valid(pObj){
        if (pObj.beginTime == ""||pObj.beginTime == null) {
            alert("请选择查询时间！");
            return false;
        }
        return true;
    }
    
   /*  function qTimeCheck(){
    	var eValue=$("#qQuarterEnd").val();
    	var bValue=$("#qQuarterBegin").val();
    	//alert(value+"--------"+bValue);
    	var bYear= $("#qBeginTime").val();
    	var eYear= $("#qEndTime").val();
    	if(bYear<=eYear){
    		if(eValue>=bValue){
    			return true;
    		}else{
    			alert("开始时间不能大于结束时间！");
    		}
    	}else{
    		alert("开始时间不能大于结束时间！");
    	}
    } */

    /**改变查询方式时，改变对应的日期控件**/
    function toSearchTypeChange() {
        var prefix = ["y", "q", "m","d"];
        searchTypeChange(prefix);
    }
    
    /**获取填写的查询信息，并分装成一个对象*/
    function getSearchForm(){
        var pObj = {};
        pObj.searchType = $('#searchtype').val();
        pObj.beginTime = $("#BeginTime").val();
        pObj.regionId = $('#regionId').val();
        pObj.regionName = $('#regionId option:selected') .text();
        pObj.cityid = $("#cityid").val();
        pObj.provinces_code = $("#foreignprovince").val();
        return pObj;
    }
    
    
    //获取外省省份（除安徽省和港澳台、境外、其他）
    function getForeignprovince(){
    	var foreignprovince = document.getElementById("foreignprovince");
    	$("#foreignprovince").empty();
    	dwr.engine.setAsync(false);
		UtilsAction.getProvince(function(data){
			if(null==data || null==data.returnList)
			return;
			for (var i=0;i<data.returnList.length;i++) {
				var varItem = new Option(data.returnList[i]['provinces'],data.returnList[i]['provinces_code']);
				foreignprovince.options.add(varItem);
			}
		});
		dwr.engine.setAsync(true);
    }
		
		function initCountyList(){
			var cityid=$("#cityid").val();
			var countyid=$("#countyid");
			dwr.engine.setAsync(false);
			RegionCfgAction.getAreasListByOperator(cityid,function(data){
				$('#countyid option:selected').text("");
				countyid.empty();
				if(null==data || null==data.returnList)return;
				//countyid.prepend("<option value='0'>全部</option>");
				for (var i=0;i<data.returnList.length;i++) {
			    countyid.append("<option value='"+ data.returnList[i]['areaid']+"'>"+ data.returnList[i]['areas'] +"</option>");
				}
			});
			dwr.engine.setAsync(true);
		}
		
</script>
<body style="margin: 0px;">
<div id="parameter">
    <div >
        <label>城市列表:</label>
        <select id="cityid" name="cityid"  onchange="initCountyList();"></select>
        <label>区县列表:</label>
        <select id="countyid" name="countyid"></select>
        <input type="hidden" value="0" id="isHoliday" name="isHoliday"/>
        <select style="display: none;" id="regionType" name="regionType" onchange="regionTypeChangeRegion();"> </select>
        <span id="ySearch">
            <label>查询时间:</label>
            <input type="text" id="BeginTime" name="BeginTime"	value="<%=today %>" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy',onpicking:isSpecDate($dp.cal.newdate)});" />
        </span>
        <a class="easyui-linkbutton" icon="icon-search" name="searchbtn" id="searchbtn" onclick="searchJc();">查询</a>
        <a class="easyui-linkbutton" name="searchbtn2" id="searchbtn2" onclick="">导出Excel</a>
    </div>
</div>

<div class="easyui-tabs" id="tabs">
    <!-- <div id="ForeignCitiesListCHART" title="柱状图" >
        <div id="ForeignCitiesListCHART0"></div>
    </div>
    <div id="ForeignCitiesListLine" title="曲线图" >
        <div id="ForeignCitiesListLine0"></div>
    </div> -->
    <div title="数据列表" >
        <table id="ForeignCitiesSumList"></table>
    </div>
</div>
</body>
</html>