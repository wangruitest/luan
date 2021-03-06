<%@ page language="java" pageEncoding="UTF-8" %>
<%@page import="com.funo.report.*" %>
<%@page import="java.util.Date" %>
<%@page import="com.funo.report.charts.ReportConstants" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>外地游客旅游天数统计</title>
    <%@include file="/jsp/common/easyuicommon.jsp" %>
    <jsp:include flush='true' page='../common/file_inc.jsp'></jsp:include>
    <jsp:include flush='true' page='../common/echarts_inc.jsp'></jsp:include>
    <script type="text/javascript" src="../../dwr/interface/ChartReportCommonUtil.js"></script>
    <script type="text/javascript" src="../../dwr/interface/ReportExportExcel.js"></script>
    <script type="text/javascript" src="../../js/date/specialDate.js"></script>
    <script type="text/javascript" src="../../dwr/interface/UtilsAction.js"></script>
    <%
        String functionid = request.getParameter("function_id");
        String today = DateUtil.format(new Date(), "yyyy-MM");
        String year=DateUtil.format(new Date(), "yyyy");
    %>
</head>

<script language="javascript">
    $(function () {
        initloginerCityList();
        init();
        $("#gridbox").datagrid({
            title:'游客旅游天数统计',
            singleSelect: true,
            pagination: true,
            rownumbers:true,
            height:getViewportHeight()-100,
            pageSize: 20,
            border:false,
            fitColumns: true,
            columns: [[
                {field: 'RQ', title: '统计时间', width: 100},
                {field: '一日游', title: '一日游', width: 100},
                {field: '二日游', title: '二日游', width: 100},
                {field: '三日游', title: '三日游', width: 100},
                {field: '四日游', title: '四日游', width: 100},
                {field: '多日游', title: '多日游', width: 100}
            ]]
        });
        $("#tabs").tabs({
            border:false,
            height:getViewportHeight()-70,
            onSelect:function(title){
                var pObj = getSearchForm();
                if(!valid(pObj)) return;
                if (title == '柱状图'||title=='曲线图') {
                    loadEcharts(pObj);
                }
                if (title == '数据列表') {
                    loadTableData(pObj);
                }
            }
        });
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

    /**
     * 获取填写的查询条件信息
     * */
    function getSearchForm() {
        var pObj = {};
        pObj.searchType = $('#searchtype').val();
        pObj.touristType = $('#touristtype').val();
        pObj.cityid = $('#cityid').val();
        var beginTime = $("#" + pObj.searchType + "BeginTime").val();
        var endTime = $("#" + pObj.searchType + "EndTime").val();
        if (pObj.searchType == 'q') { //如果是季度的查询
            beginTime += "-" + $("#qQuarterBegin").val();
            endTime += "-" + $("#qQuarterEnd").val();
        }
        pObj.beginTime = beginTime;
        pObj.endTime = endTime;
        return pObj;
    }

    /**
     * 加载Echarts控件
     * **/
    function loadEcharts(pObj){
        var params = [pObj.endTime, pObj.beginTime];
        var isShowTb = $('#showTb').attr("checked");
        //同比时同步，否则异步加载数据
        if (isShowTb) {
            //同步加载echarts数据
            dwr.engine.setAsync(false);
            showMSEChart(pObj, params, getStaticObject());
            dwr.engine.setAsync(true);
            //加载同比的echarts控件
            pObj.showTB = true;
            var tbYear = pObj.beginTime.substring(0, 4);
            var teYear = pObj.endTime.substring(0, 4);
            var bYear = parseInt(tbYear, 10) - 1;
            var eYear = parseInt(teYear, 10) - 1;
            var bTime = bYear + pObj.beginTime.substring(4);
            var eTime = eYear + pObj.endTime.substring(4);
            var dateParams = [eTime, bTime];
            showMSEChart(pObj, dateParams, getStaticObject());
        } else {
            showMSEChart(pObj, params, getStaticObject());
        }
    }

    /**
     * 加载数据列表
     * */
    function loadTableData(pObj) {
        pObj.IS_NOT_FETCH = "true";
        if ($('#showTb').attr("checked")) {
            pObj.showTb = true;
        }
        var params = [pObj.endTime, pObj.beginTime];
        showDataListTable(getStaticObject(), pObj, params);
    }

    /**获取填写的查询信息，并分装成一个对象*/
    function getSearchForm(){
        var pObj = {};
        pObj.searchType = $('#searchtype').val();
        var beginTime = $("#" + pObj.searchType + "BeginTime").val();
        var endTime = $("#" + pObj.searchType + "EndTime").val();
        if (pObj.searchType == 'q') { //如果是季度的查询
            beginTime += "-" + $("#qQuarterBegin").val();
            endTime += "-" + $("#qQuarterEnd").val();
        }
        pObj.beginTime = beginTime;
        pObj.endTime = endTime;
        pObj.cityid = $('#cityid').val();
        pObj.qBegin = $('#qQuarterBegin').val();
        pObj.qEnd = $("#qQuarterEnd").val();
        pObj.aLevel=$("aLevel").val();
        return pObj;
    }

    /**显示查询方式*/
    function toSearchTypeChange() {
        var prefixs = ["y", "q", "m", "d"];
        searchTypeChange(prefixs);
    }

    function searchJc() {
        var pObj = getSearchForm();
        if(!valid(pObj)) return;
        if(!qTimeCheck()) return;
        var tab= $('.tabs-selected span:first').html();
        if(tab=='数据列表'){
            loadTableData(pObj);
        }else{
            loadEcharts(pObj);
        }
    }

    function exportJc() {
    	if(!qTimeCheck()) return;
        var headerStr = ["统计时间", "一日游", "二日游", "三日游", "四日游", "多日游"];
        var title = "游客旅游天数统计";
        var pObj = getSearchForm();
        var isShowTb = $('#showTb').attr("checked");
        if(isShowTb){
            pObj.showTb = true;
        }
        var dateParams = [pObj.endTime, pObj.beginTime];
        showExport(pObj, dateParams, getStaticObject(), headerStr, title);
    }


    /**表头参数的定义*/
    function getStaticObject() {
        var tObject = new Object();
        tObject.caption = "外地游客旅游天数统计";
        tObject.subTitle= "统计所有外地游客的旅游天数，可按年、季度、月统计，具体包括一日游、二日游、三日游、四日游、多日游，可同比显示去年同期的统计。";
        tObject.procedureName = "<%=ReportConstants.TOURIST_STAT_DAYS_PROCEDURE%>";
        tObject.PROC_PARAMS = "<%=ReportConstants.TOURIST_STAT_DAYS_PROCEDURE_PARAMS%>";
        tObject.noSplit = "yes";
        tObject.chartTypes = "<%=ReportConstants.MSCOUMN3D_CHART%>,<%=ReportConstants.MSLINE_CHART%>";
        return tObject;
    }

    /**
     * 默认初始化
     * **/
    function init(){
        toSearchTypeChange();
        var searchtype = $("#searchtype").val();
        var today = new Date();
        var month = today.getMonth();
        var endMonth,beginMonth;
        if(month == 0) {
            endMonth = today.getFullYear()-1 + "-" + 12;
        }else{
            endMonth = today.getFullYear() + "-" + month;
        }
        today.setMonth(today.getMonth()-2);
        month = today.getMonth();
        if(month == 0) {
            beginMonth = today.getFullYear()-1 + "-" + 12;
        }else{
            beginMonth = today.getFullYear() + "-" + month;
        }
        $("#"+searchtype + "BeginTime").val(beginMonth);
        $("#"+searchtype + "EndTime").val(endMonth);
    }

</script>
<body>

<input type="hidden" id="procedureName" name="procedureName" value="<%=ReportConstants.TOURIST_STAT_DAYS_PROCEDURE%>"/>
<input type="hidden" id="PROC_PARAMS" name="PROC_PARAMS" value="<%=ReportConstants.TOURIST_STAT_DAYS_PROCEDURE_PARAMS%>"/>
<div class="parameter">
    <div>
        <label>城市列表:</label>
        <select id="cityid" name="cityid"></select>
        <label>查询方式:</label>
        <select  id="searchtype" name="searchtype"  onchange="toSearchTypeChange();">
            <option value="m">按月份统计</option>
            <option value="y">按年份统计</option>
            <option value="q">按季度统计</option>
        </select>
        <a class="easyui-linkbutton" icon="icon-search" name="searchbtn" id="searchbtn" onclick="searchJc();">查询</a>
        <a class="easyui-linkbutton" name="searchbtn2" id="searchbtn2" onclick="exportJc();">导出Excel</a>
        <input type="checkbox" name="showTb" id="showTb" onclick="toCheck(this);"/>显示同比
    </div>
    <div>
        <span style="display: none;" id="ySearch">
            <label>开始时间:</label>
            <input type="text" id="yBeginTime" name="yBeginTime" value="<%=year %>" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy',minDate:'#F{$dp.$D(\'yEndTime\',{y:-10})}',maxDate:'#F{$dp.$D(\'yEndTime\')||\'%y\'}'});" />
            <label>结束时间:</label>
            <input type="text" id="yEndTime" name="yEndTime" class="Wdate" value="<%=year %>"  onclick="WdatePicker({dateFmt:'yyyy',maxDate:'#F{$dp.$D(\'yBeginTime\',{y:10})}',minDate:'#F{$dp.$D(\'yBeginTime\')}'});" />
        </span>
        <span style="display: none;" id="qSearch">
            <label>开始时间:</label>
            <input type="text" id="qBeginTime" name="qBeginTime" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy',minDate:'#F{$dp.$D(\'qEndTime\',{y:-1})}',maxDate:'#F{$dp.$D(\'qEndTime\')||\'%y\'}'});"  value="<%=year%>"/>
            <select id="qQuarterBegin" name="qQuarterBegin" >
                <option selected="selected" value="1">第一季度</option>
                <option value="2">第二季度</option>
                <option value="3">第三季度</option>
                <option value="4">第四季度</option>
            </select>
            <label>结束时间:</label>
            <input type="text" id="qEndTime" name="qEndTime" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy',maxDate:'#F{($dp.$D(\'qBeginTime\',{y:1}))}',minDate:'#F{$dp.$D(\'qBeginTime\')}'});"  value="<%=year%>"/>
            <select id="qQuarterEnd" name="qQuarterEnd">
                <option selected="selected" value="1">第一季度</option>
                <option value="2">第二季度</option>
                <option value="3">第三季度</option>
                <option value="4">第四季度</option>
            </select>
        </span>
        <span  id="mSearch">
            <label>开始时间:</label>
            <input type="text" id="mBeginTime" name="mBeginTime" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM',minDate:'#F{$dp.$D(\'mEndTime\',{M:-10})}',maxDate:'#F{$dp.$D(\'mEndTime\')||\'%y-%M\'}'});" />
            <label>结束时间:</label>
            <input type="text" id="mEndTime" name="mEndTime" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM',maxDate:'#F{($dp.$D(\'mBeginTime\',{M:10}))}',minDate:'#F{$dp.$D(\'mBeginTime\')||\'%y-%M\'}'});" />
        </span>
        <span style="display: none;" id="dSearch">
            <label>开始时间:</label>
            <input type="text" id="dBeginTime" name="dBeginTime" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'dEndTime\',{d:-15})}',maxDate:'#F{$dp.$D(\'dEndTime\')||\'%y-%M-%d\'}',onpicking:isSpecDate($dp.cal.newdate)});" />
            <label>结束时间:</label>
            <input type="text" id="dEndTime" name="dEndTime" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'dBeginTime\',{d:15})}',minDate:'#F{$dp.$D(\'dBeginTime\')||\'%y-%M-%d\'}',onpicking:isSpecDate($dp.cal.newdate)});" />
        </span>
    </div>

</div>


<div id="tabs" class="easyui-tabs">

    <div id="<%=ReportConstants.MSCOUMN3D_CHART %>" title="柱状图">
    </div>

    <div id="<%=ReportConstants.MSLINE_CHART %>" title="曲线图">
    </div>

    <div id="grid" title="数据列表">
        <div id="gridboxdiv" >
            <table id="gridbox"></table>
        </div>
    </div>
</div>

</body>
</html>
 