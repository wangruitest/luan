<%@ page language="java" pageEncoding="UTF-8" %>
<%@page import="com.funo.report.*" %>
<%@page import="java.util.Date" %>
<%@page import="com.funo.report.charts.ReportConstants" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>景区热度分析</title>
    <%@include file="/jsp/common/easyuicommon.jsp" %>
    <script type="text/javascript" src="../../dwr/interface/ChartReportCommonUtil.js"></script>
    <script type="text/javascript" src="../../dwr/interface/ReportExportExcel.js"></script>
    <script type="text/javascript" src="../../dwr/interface/UtilsAction.js"></script>
    <script type="text/javascript" src="../../dwr/interface/RegionCfgAction.js"></script>
    <jsp:include flush='true' page='../common/file_inc.jsp'></jsp:include>
    <jsp:include flush='true' page='../common/echarts_inc.jsp'></jsp:include>
    <%
    Date date=new Date();
    String today = DateUtil.format(date, "yyyy");
	String month=DateUtil.format(date, "yyyy-MM");
	String day=DateUtil.format(DateUtil.getDateAfter(date, -1), "yyyy-MM-dd");
    %>
</head>
<style type="text/css">
    	input, textarea, keygen, select, button {
		    text-rendering: auto;
		    color: initial;
		    letter-spacing: normal;
		    word-spacing: normal;
		    text-transform: none;
		    text-indent: 0px;
		    text-shadow: none;
		    display: inline-block;
		    text-align: start;
		    margin: 0em 0em 0em 0em;
		    font: 13.3333px Arial;
		    line-height:23px;
		}
    </style>
<script>
    $(function () {
        $("#gridbox").datagrid({
            title: "景区游客排行统计",
            singleSelect: true,
            pagination: true,
            rownumbers: true,
            height: getViewportHeight() - 99,
            //fit:true,
            pageSize: 20,
            border: false,
            fitColumns: true,
            columns: [[
                {field: 'TITLE', title: '景区名称', width: 100},
                {field: 'TOURISTCOUNT', title: '游客数量（人次）', width: 100},
                {field: 'TIME', title: '统计时间', width: 100}
            ]]
        });
        initloginerCityList();
        initCountyList();
        init();
        $("#tabs").tabs({
            border: false,
            height: getViewportHeight() - 70,
            onSelect: function (title) {
                var pObj = getSearchForm();
                if (!valid(pObj)) return;
                if (title == '柱状图' || title == '曲线图') {
                    loadEcharts(pObj);
                }
                if (title == '数据列表') {
                    loadTableData(pObj);
                }
            }
        });
    });

    /**获取填写的查询信息，并分装成一个对象*/
    function getSearchForm() {
        var pObj = {};
        pObj.searchType = $('#searchtype').val();
        pObj.beginTime = $("#" + pObj.searchType + "BeginTime").val();
        pObj.endTime = $("#" + pObj.searchType + "EndTime").val();
        pObj.cityid = $('#cityid').val();
        pObj.countyid = $('#countyid').val();
        pObj.qBegin = $('#qQuarterBegin').val();
        pObj.qEnd = $("#qQuarterEnd").val();
        pObj.aLevel = $("#aLevel").val();
        return pObj;
    }

    /**表头参数的定义*/
    function getStaticObject() {
        var tObject = {};
        tObject.xname = "单位（景区）";
        tObject.yname = "单位（人次）";
        tObject.caption = "景区热度统计";
        tObject.subTitle = "根据全市所有景区的游客数量进行统计排行。";
        tObject.procedureName = "<%=com.funo.report.charts.ReportConstants.REGION_HOT_PROCEDURE%>";
        tObject.PROC_PARAMS = "<%=com.funo.report.charts.ReportConstants.REGION_HOT_PROCEDURE_PARAMS%>";
        tObject.chartTypes = "<%=ReportConstants.COLUMN3D_CHART%>,<%=ReportConstants.LINE2D_CHART%>";
        return tObject;
    }
    function toSearchTypeChange() {
        var prefixs = ["y", "q", "m", "d"];
        searchTypeChange(prefixs);
    }

    function searchJc() {
        var pObj = getSearchForm();
        if (!valid(pObj)) return;
        var tab= $('.tabs-selected span:first').html()
        if(tab=='数据列表'){
            loadTableData(pObj);
        }else{
            loadEcharts(pObj);
        }
    }

    
    function getEndTime(){
    	var beginTime=$('#dBeginTime').val();
    	var d = new Date(beginTime);
    	d.setDate(d.getDate()+30); 
    	var month=d.getMonth()+1; 
    	var day = d.getDate(); 
    	if(month<10){ 
    	month = "0"+month; 
    	} 
    	if(day<10){ 
    	day = "0"+day; 
    	} 
    	var time = d.getFullYear()+"-"+month+"-"+day; 
    	$('#dEndTime').val(time);
    }
    /**
     * 加载Echarts控件
     * **/
    function loadEcharts(pObj) {
        pObj.diff = getDiff(pObj);
        var dateParams = getSearchDates(pObj);
        showEChart(pObj, dateParams, getStaticObject()); //显示图
    }

    /**
     * 加载数据列表
     * */
    function loadTableData(pObj) {
        pObj.diff = getDiff(pObj);
        var dateParams = getSearchDates(pObj);
        pObj.IS_NOT_FETCH = "true";
        showDataListTable(getStaticObject(), pObj, dateParams);
    }

    function exportJc() {
        var headerStr = ["景区名称", "游客数量（人次）", "统计时间"];
        var title = "景区游客排行统计";
        var pObj = getSearchForm();
        if (!valid(pObj)) return;
        pObj.diff = getDiff(pObj);
        toExportChart(pObj, getStaticObject(), "", headerStr, title);
    }

    function init() {
        toSearchTypeChange();
        var searchtype = $("#searchtype").val();
        var today = '<%=today%>';
        var day = new Date();
        if (searchtype == "y" && day.getMonth() == 0) {
            today = (day.getFullYear() - 1);
        }
        $("#" + searchtype + "BeginTime").val(today);
        $("#" + searchtype + "EndTime").val(today);
    }
    function initCountyList(){
			var cityid=$("#cityid").val();
			var countyid=$("#countyid");
			dwr.engine.setAsync(false);
			RegionCfgAction.getAreasListByOperator(cityid,function(data){
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
<input type="hidden" id="procedureName" name="procedureName" value="<%=ReportConstants.REGION_HOT_PROCEDURE%>"/>

<div id="parameter">
    <div>
        <label>城市列表:</label>
        <select id="cityid" name="cityid" onchange="initCountyList()"></select>
        <label>区县列表:</label>
        <select id="countyid" name="countyid"></select>
        <label>景区评级:</label>
        <select id="aLevel" name="aLevel" onchange="levelChange();">
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
        <!--<input type="checkbox" id="isHolidayCk" name="isHolidayCk" onclick="isHolidayCheck(this)"
               disabled/><span style="font-size: 12px;">是否节假日</span>-->
        <input type="hidden" value="0" id="isHoliday" name="isHoliday"/>
        <a class="easyui-linkbutton" icon="icon-search" name="searchbtn" id="searchbtn"
           onclick="searchValidate();">查询</a>
        <a class="easyui-linkbutton" name="searchbtn2" id="searchbtn2"
           onclick="exportValidate();">导出Excel</a>
    </div>
    <div>

        <span style="display: none;" id="ySearch">
            <label>开始时间:</label>
            <input type="text" id="yBeginTime" name="yBeginTime" class="Wdate" value="<%=today %>"
                   onfocus="WdatePicker({dateFmt:'yyyy',minDate:'#F{$dp.$D(\'yEndTime\',{y:-10})}',maxDate:'#F{$dp.$D(\'yEndTime\')||\'%y\'}'});"/>
            <label>结束时间:</label>
            <input type="text" id="yEndTime" name="yEndTime" class="Wdate" value="<%=today %>"
                   onfocus="WdatePicker({dateFmt:'yyyy',maxDate:'#F{$dp.$D(\'yBeginTime\',{y:10})}',minDate:'#F{$dp.$D(\'yBeginTime\')}'});"/>
        </span>
        <span style="display: none;" id="qSearch">
            <label>开始时间:</label>
            <input type="text" id="qBeginTime" name="qBeginTime" class="Wdate" value="<%=today %>"
                   onfocus="WdatePicker({dateFmt:'yyyy',minDate:'#F{$dp.$D(\'qEndTime\',{y:-1})}',maxDate:'#F{$dp.$D(\'qEndTime\')||\'%y\'}'});"/>
            <select id="qQuarterBegin" name="qQuarterBegin">
                <option selected="selected" value="1">第一季度</option>
                <option value="2">第二季度</option>
                <option value="3">第三季度</option>
                <option value="4">第四季度</option>
            </select>
            <label>结束时间:</label>
            <input type="text" id="qEndTime" name="qEndTime" class="Wdate" value="<%=today %>"
                   onfocus="WdatePicker({dateFmt:'yyyy',maxDate:'#F{($dp.$D(\'qBeginTime\',{y:1}))}',minDate:'#F{$dp.$D(\'qBeginTime\')}'});"/>
            <select id="qQuarterEnd" name="qQuarterEnd">
                <option selected="selected" value="1">第一季度</option>
                <option value="2">第二季度</option>
                <option value="3">第三季度</option>
                <option value="4">第四季度</option>
            </select>
        </span>
        <span style="display: none;" id="mSearch">
            <label>开始时间:</label>
            <input type="text" id="mBeginTime" name="mBeginTime" class="Wdate" value="<%=month %>"
                   onfocus="WdatePicker({dateFmt:'yyyy-MM',minDate:'#F{$dp.$D(\'mEndTime\',{M:-10})}',maxDate:'#F{$dp.$D(\'mEndTime\')||\'%y-%M\'}'});"/>
            <label>结束时间:</label>
            <input type="text" id="mEndTime" name="mEndTime" class="Wdate" value="<%=month %>"
                   onfocus="WdatePicker({dateFmt:'yyyy-MM',maxDate:'#F{($dp.$D(\'mBeginTime\',{M:10}))}',minDate:'#F{$dp.$D(\'mBeginTime\')||\'%y-%M\'}'});"/>
        </span>
        <span id="dSearch">
            <label>开始时间:</label>
            <input type="text" id="dBeginTime" name="dBeginTime" class="Wdate" value="<%=day %>"
                onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true,onpicked:getEndTime()})"/>
            <label>结束时间:</label>
            <input type="text" id="dEndTime" name="dEndTime" class="Wdate" value="<%=day %>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'dBeginTime\',{d:30})}',minDate:'#F{$dp.$D(\'dBeginTime\')||\'%y-%M-%d\'}'});"/>
        </span>
    </div>

</div>
<div id="tabs" class="easyui-tabs">
    <div id="<%=ReportConstants.COLUMN3D_CHART %>" title="柱状图">
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