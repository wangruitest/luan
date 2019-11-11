﻿
<%@ page language="java" pageEncoding="UTF-8" %>
<%@page import="java.util.Date" %>
<%@page import="com.funo.report.*" %>
<%@page import="com.funo.report.charts.ReportConstants" %>
<%@page import="com.funo.utils.Constants" %>
<%@page import="com.funo.system.model.SysOperator" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<title>所有景区接待统计</title>
<%
	Date date=new Date();
    String today = DateUtil.format(date, "yyyy");
	String month=DateUtil.format(date, "yyyy-MM");
	String day=DateUtil.format(DateUtil.getDateAfter(date, -1), "yyyy-MM-dd");
    SysOperator user = null;
    if (request.getSession() != null && request.getSession().getAttribute(Constants.Session_Attribute_UserEnv) != null) {
        user = (SysOperator) request.getSession().getAttribute(Constants.Session_Attribute_UserEnv);
    }
    String curCityCode = "";
    if (null != user && null != user.getOrg()) {
        curCityCode = user.getOrg().getCode();
    }
%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script type="text/javascript" src="../../dwr/interface/ChartReportCommonUtil.js"></script>
    <script type="text/javascript" src="../../dwr/interface/ReportExportExcel.js"></script>
    <script type="text/javascript" src="../../dwr/interface/UtilsAction.js"></script>
    <%@include file="/jsp/common/easyuicommon.jsp" %>
    <jsp:include flush='true' page='../common/file_inc.jsp'/>
    <jsp:include flush='true' page='../common/echarts_inc.jsp'/>
    <script type="text/javascript" src="../../js/date/specialDate.js"></script>
    <script>
        $(function () {
            initProvinceCityList(<%=curCityCode%>);
            init();
            //创建列表
            $("#gridbox").datagrid({
                title: '所有景区接待统计',
                singleSelect: true,
                pagination: true,
                rownumbers: true,
                border: false,
                height: getViewportHeight() - 93,
                pageSize: 20,
                fitColumns: true,
                frozenColumns: [[
                    {field: 'ck', checkbox: false}
                ]],
                columns: [[
                    {field: 'TITLE', title: '查询时间', width: 100},
                    {field: 'TOURISTTYPE', title: '游客类型', width: 100},
                    {field: 'TOURISTCOUNT', title: '游客总量', width: 100}
                ]]
            });

            $("#tabs").tabs({
                border: false,
                onSelect: function (title) {
                    var pObject = getSearchForm();
                    if(!valid(pObject)) return;
                    if (title == '柱状图' || title == '饼状图' || title == '曲线图') {
                        loadEcharts(pObject);
                    }
                    if (title == '数据列表') {
                        loadTableData(pObject);
                    }
                }
            });
            
            //alert($dp.$D('yBeginTime').y);

        });
        
        function qTimeCheck(){
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
        }

        function toSearchTypeChange() {
            var prefix = ["y", "q", "m", "d"];
            searchTypeChange(prefix);
        }

        function searchJc() {
            var pObject = getSearchForm();
            if(!valid(pObject)) return;
            if(!qTimeCheck()) return;
            var tab= $('.tabs-selected span:first').html()
            if(tab=='数据列表'){
                loadTableData(pObject);
            }else{
                loadEcharts(pObject);
            }
        }

        /**
         * 加载Echarts控件
         * */
        function loadEcharts(pObject) {
            var params = [pObject.endTime, pObject.beginTime];
            try {
                showEChart(pObject, params, getStaticObject());
            } catch (e) {}
        }

        /**加载数据列表*/
        function loadTableData(pObject) {
            try {
                pObject.IS_NOT_FETCH = "true";
                var params = [pObject.endTime, pObject.beginTime];
                showDataListTable(getStaticObject(), pObject, params);
            } catch (e) {}
        }

        /**excel导出*/
        function exportJc() {
            var headerStr = ["查询日期", "游客类型", "游客总量"];
            var title = "所有景区接待统计";
            var pObject = getSearchForm();
            if(!valid(pObject)) return;
            if(!qTimeCheck()) return;
            var params = [pObject.endTime, pObject.beginTime];
            showExport(pObject, params, getStaticObject(), headerStr, title);
        }

        /**
         * 获取查询条件
         */
        function getSearchForm() {
            var pObject = {};
            pObject.searchType = $('#searchtype').val();
            pObject.touristType = $('#touristtype').val();
            pObject.cityid = $('#cityid').val();
            pObject.aLevel = $('#aLevel').val();
            var beginTime = $("#" + pObject.searchType + "BeginTime").val();
            var endTime = $("#" + pObject.searchType + "EndTime").val();
            if (pObject.searchType == 'q') { //如果是季度的查询
                beginTime += "-" + $("#qQuarterBegin").val();
                endTime += "-" + $("#qQuarterEnd").val();
            }
            pObject.beginTime = beginTime;
            pObject.endTime = endTime;
            return pObject;
        }

        /**表头参数的定义*/
        function getStaticObject() {
            var tObject = new Object();
            tObject.caption = "所有景区接待统计";
            tObject.subTitle= "统计全市所有景区某时段内的游客数量，可按年、季度、月、天统计，游客可按全部游客、本地游客、外地游客分别统计.";
            tObject.procedureName = "<%=ReportConstants.ALL_REG_RECEIVE_PROCEDURE%>";
            tObject.PROC_PARAMS = "<%=ReportConstants.ALL_REG_RECEIVE_PROCEDURE_PARAMS%>";
            tObject.chartTypes = "<%=ReportConstants.COLUMN3D_CHART%>,<%=ReportConstants.PIE3D_CHART%>,<%=ReportConstants.LINE2D_CHART %>";
            tObject.noSplit = "NO";
            return tObject;
        }

        /**查询条件默认初始化*/
        function init() {
            toSearchTypeChange();
            var searchType = $('#searchtype').val();
            var today = '<%=today%>';
            var day = new Date();
            if (searchType == "y" && day.getMonth() == 0) {
                today = (day.getFullYear() - 1);
            }
            $("#" + searchType + "BeginTime").val(today);
            $("#" + searchType + "EndTime").val(today);
        }
    </script>

</head>

<body style="margin: 0px;">
<input type="hidden" id="procedureName" name="procedureName" value="<%=ReportConstants.ALL_REG_RECEIVE_PROCEDURE%>"/>
<input type="hidden" id="PROC_PARAMS" name="PROC_PARAMS" value="<%=ReportConstants.ALL_REG_RECEIVE_PROCEDURE_PARAMS%>"/>

<div id="parameter">
    <div>
        <label>游客类型:</label>
        <select class="easyui-combobox" style="width:120px;" id="touristtype" name="touristtype">
            <option value="0" selected="selected"> 全部游客</option>
            <option value="1"> 外地游客</option>
            <option value="2">本地游客</option>
        </select>
        <label>城市列表:</label>
        <select id="cityid" name="cityid" style="width: 100px"></select>
        <label>景区评级:</label>
        <select id="aLevel" name="aLevel">
            <option value="">--请选择--</option>
            <option value="1">A级</option>
            <option value="2">AA级</option>
            <option value="3">AAA级</option>
            <option value="4">AAAA级</option>
            <option value="5">AAAAA级</option>
        </select>
        <label>查询方式:</label>
        <select id="searchtype" name="searchtype" onchange="toSearchTypeChange();">
            <option value="y">按年份统计</option>
            <option value="q">按季度统计</option>
            <option value="m">按月份统计</option>
            <option value="d">按天数统计</option>
        </select>
        <!--<input type="checkbox" id="isHolidayCk" name="isHolidayCk" onclick="isHolidayCheck(this)" disabled/>是否节假日-->
        <input type="hidden" value="0" id="isHoliday" name="isHoliday"/>

    </div>
    <div>
				<span style="display: none;" id="ySearch">
					<label>开始时间:</label>
					<input type="text" id="yBeginTime" name="yBeginTime" class="Wdate" value="<%=today%>"
                           onclick="WdatePicker({dateFmt:'yyyy',minDate:'#F{$dp.$D(\'yEndTime\',{y:-10})}',maxDate:'#F{$dp.$D(\'yEndTime\')||\'%y\'}'});"/>
					<label>结束时间:</label>
					<input type="text" id="yEndTime" name="yEndTime" class="Wdate" value="<%=today%>"
                           onclick="WdatePicker({dateFmt:'yyyy',maxDate:'#F{$dp.$D(\'yBeginTime\',{y:10})}',minDate:'#F{$dp.$D(\'yBeginTime\')}'});"/>
				</span>
				<span style="display: none;" id="qSearch">
					<label>开始时间:</label>
					<input type="text" id="qBeginTime" name="qBeginTime" class="Wdate" value="<%=today%>"
                           onclick="WdatePicker({dateFmt:'yyyy',maxDate:'#F{$dp.$D(\'qEndTime\')||\'%y\'}'});"/>
					<select id="qQuarterBegin" name="qQuarterBegin">
                        <option selected="selected" value="1">第一季度</option>
                        <option value="2">第二季度</option>
                        <option value="3">第三季度</option>
                        <option value="4">第四季度</option>
                    </select>
					<label>结束时间:</label>
					<input type="text" id="qEndTime" name="qEndTime" class="Wdate" value="<%=today%>"
                           onclick="WdatePicker({dateFmt:'yyyy',maxDate:'#F{($dp.$D(\'qBeginTime\',{y:1}))}'});"/>
					<select id="qQuarterEnd" name="qQuarterEnd">
                        <option selected="selected" value="1">第一季度</option>
                        <option value="2">第二季度</option>
                        <option value="3">第三季度</option>
                        <option value="4">第四季度</option>
                    </select>
				</span>
				<span style="display: none;" id="mSearch">
					<label>开始时间:</label>
					<input type="text" id="mBeginTime" name="mBeginTime" class="Wdate" value="<%=month%>"
                           onclick="WdatePicker({dateFmt:'yyyy-MM',minDate:'#F{$dp.$D(\'mEndTime\',{M:-10})}',maxDate:'#F{$dp.$D(\'mEndTime\')||\'%y-%M\'}'});"/>

					<label>结束时间:</label>
					<input type="text" id="mEndTime" name="mEndTime" class="Wdate" value="<%=month%>"
                           onclick="WdatePicker({dateFmt:'yyyy-MM',maxDate:'#F{($dp.$D(\'mBeginTime\',{M:10}))}',minDate:'#F{$dp.$D(\'mBeginTime\')||\'%y-%M\'}'});"/>
				</span>
				<span style="display: none;" id="dSearch">
					<label>开始时间:</label>
					<input type="text" id="dBeginTime" name="dBeginTime" class="Wdate" value="<%=day %>"
                           onclick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'dEndTime\',{d:-15})}',maxDate:'#F{$dp.$D(\'dEndTime\')||\'%y-%M-%d\'}'});"/>
					<label>结束时间:</label>
					<input type="text" id="dEndTime" name="dEndTime" class="Wdate" value="<%=day %>"
                           onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'dBeginTime\',{d:15})}',minDate:'#F{$dp.$D(\'dBeginTime\')||\'%y-%M-%d\'}'});"/>
				</span>
        <a class="easyui-linkbutton" icon="icon-search" name="searchbtn" id="searchbtn"
           onclick="searchJc();">查询</a>
        <a class="easyui-linkbutton" name="searchbtn2" id="searchbtn2"
           onclick="exportJc();">导出Excel</a>
    </div>
</div>

<div id="tabs" class="easyui-tabs">
    <div id="<%=ReportConstants.COLUMN3D_CHART %>" title="柱状图">

    </div>

    <div id="<%=ReportConstants.PIE3D_CHART %>" title="饼状图">
    </div>

    <div id="<%=ReportConstants.LINE2D_CHART %>" title="曲线图">
    </div>
    <div id="grid" title="数据列表">
        <div id="gridboxdiv">
            <table id="gridbox"></table>
        </div>
    </div>

</div>

</body>
</html>