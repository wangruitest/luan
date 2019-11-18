<%@page import="com.funo.report.charts.ReportConstants" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@page import="java.util.Date" %>
<%@page import="com.funo.report.*" %>
<%
	Date date=new Date();
    String today = DateUtil.format(date, "yyyy");
	String month=DateUtil.format(date, "yyyy-MM");
	String day=DateUtil.format(DateUtil.getDateAfter(date, -1), "yyyy-MM-dd");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>各景区接待人员统计</title>
    <%@include file="/jsp/common/easyuicommon.jsp" %>
    <script type="text/javascript" src="../../dwr/interface/ChartReportCommonUtil.js"></script>
    <script type="text/javascript" src="../../dwr/interface/ReportExportExcel.js"></script>
    <script type="text/javascript" src="../../dwr/interface/UtilsAction.js"></script>
    <script type="text/javascript" src="../../js/date/specialDate.js"></script>
    <jsp:include flush='true' page='../common/file_inc.jsp'/>
    <jsp:include flush='true' page='../common/echarts_inc.jsp'/>
    <script>
        $(function () {
            initloginerCityList();
            cityChange();
            init();
            //创建列表
            $("#gridbox").datagrid({
                title: "景区游客接待统计",
                singleSelect: true,
                pagination: true,
                rownumbers: true,
                border: false,
                height: getViewportHeight() - 94,
                pageSize: 20,
                fitColumns: true,
                columns: [[
                    {field: 'RQ', title: '统计时间', width: 100},
                    {field: 'TITLE', title: '游客数量', width: 100},
                    {field: 'TOURISTTYPE', title: '游客类型', width: 100}
                ]]
            });
            $("#tabs").tabs({
                border: false,
                height: getViewportHeight() - 65,
                onSelect: function (title) {
                    var pObj = getSearchForm();
                    if (!valid(pObj)) return;
                    if (title == '柱状图' || title == '饼状图' || title == '曲线图') {
                        loadEcharts(pObj);
                    }
                    if (title == '数据列表') {
                        loadTableData(pObj);
                    }
                }
            });
        });
        /**
         * 获取填写的查询条件信息
         * */
        function getSearchForm() {
            var pObj = {};
            pObj.searchType = $('#searchtype').val();
            pObj.touristType = $('#touristtype').val();
            pObj.cityid = $('#cityid').val();
            pObj.aLevel = $('#aLevel').val();
            pObj.regionId = $('#regionId').val();
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

        /**查询验证**/
        function valid(pObj) {
            if (pObj.searchType == "" || pObj.searchType == null) {
                alert("请选择查询方式");
                return false;
            }
            if (pObj.beginTime == "" || pObj.beginTime == null) {
                alert("请选择开始时间！");
                return false;
            }
            if (pObj.endTime == "" || pObj.beginTime == null) {
                alert("请选择结束时间！");
                return false;
            }
            if (pObj.cityid == "" || pObj.cityid == null) {
                alert("请选择城市列表！");
                return false;
            }
            if (pObj.regionId == "" || pObj.regionId == null) {
                alert("请选择景区！");
                return false;
            }
            return true;
        }
        /**执行查询操作*/
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

        /**加载Echarts数据*/
        function loadEcharts(pObj) {
            var params = [pObj.endTime, pObj.beginTime];
            var isShowTb = $('#showTb').attr("checked");
            //同比时同步，否则异步加载数据
            if (isShowTb) {
                //同步加载echarts数据
                dwr.engine.setAsync(false);
                showEChart(pObj, params, getStaticObject());
                dwr.engine.setAsync(true);
                //获取同比的开始时间与结束时间
                var tbYear = pObj.beginTime.substring(0, 4);
                var teYear = pObj.endTime.substring(0, 4);
                var bYear = parseInt(tbYear, 10) - 1;
                var eYear = parseInt(teYear, 10) - 1;
                var bTime = bYear + pObj.beginTime.substring(4);
                var eTime = eYear + pObj.endTime.substring(4);
                params = [eTime, bTime];
                pObj.showTB = true;
                showEChart(pObj, params, getStaticObject());
            } else {
                showEChart(pObj, params, getStaticObject());
            }
        }

        /**加载数据列表数据*/
        function loadTableData(pObj) {
            pObj.IS_NOT_FETCH = "true";
            if ($('#showTb').attr("checked")) {
                pObj.showTb = true;
            }
            var params = [pObj.endTime, pObj.beginTime];
            showDataListTable(getStaticObject(), pObj, params);
        }

        function exportJc() {
            //获取searchType、beginTime、endTime
            var headerStr = ["统计时间", "游客数量", "游客类型"];
            var title = "各个景区接待统计";
            var pObj = getSearchForm();
            if (!valid(pObj)) return;
            if ($('#showTb').attr("checked")) {
                pObj.showTb = true;
            }
            var params = [pObj.endTime, pObj.beginTime];
            showExport(pObj, params, getStaticObject(), headerStr, title);
        }

        function toSearchTypeChange() {
            var prefix = ["y", "q", "m", "d"];
            searchTypeChange(prefix);
        }

        //是否勾选同比的按钮
        function toCheck(pObj) {
            var checkvalue = searchValidate();
            if (pObj.checked) {
                if (!checkvalue) {
                    pObj.checked = false;
                }
            }
        }
        /**表头参数的定义*/
        function getStaticObject() {
            var tObject = {};
            var selectObj = document.getElementById("regionId");
            var regionName = selectObj.options[selectObj.selectedIndex].text;
            tObject.caption = regionName + "接待游客统计";
            tObject.subTitle = '统计各个景区在不同时间维度下的游客数量，可选择景点和日期查询，游客可按全部游客、外地游客、本地游客分别统计，可同比显示去年同期的统计。';
            tObject.procedureName = "<%=ReportConstants.ONE_REG_RECEIVE_PROCEDURE%>";
            tObject.PROC_PARAMS = "<%=ReportConstants.ONE_REG_RECEIVE_PROCEDURE_PARAMS%>";
            tObject.chartTypes = "<%=ReportConstants.COLUMN3D_CHART%>,<%=ReportConstants.PIE3D_CHART%>,<%=ReportConstants.LINE2D_CHART %>";
            tObject.noSplit = "NO";
            return tObject;
        }

        /**默认日期初始化，默认显示最近7天的数据*/
        function init() {
            var searchtypestr = document.getElementById("searchtype").value;
            var date = new Date().Format("yyyy-MM-dd");
            var beginTime = getDiffDate(date, 'd', -7);
            var endTime = getDiffDate(date, 'd', -1);
            document.getElementById(searchtypestr + "BeginTime").value = beginTime;
            document.getElementById(searchtypestr + "EndTime").value = endTime;
        }

    </script>

</head>

<body style="margin: 0px;">
<input type="hidden" id="procedureName" name="procedureName" value="<%=ReportConstants.ONE_REG_RECEIVE_PROCEDURE%>"/>
<input type="hidden" id="PROC_PARAMS" name="PROC_PARAMS" value="<%=ReportConstants.ONE_REG_RECEIVE_PROCEDURE_PARAMS%>"/>

<div class="parameter">
    <div>
        <label>游客类型:</label>
        <select id="touristtype" name="touristtype">
            <option value="0" selected="selected">全部游客</option>
            <option value="1">外地游客</option>
            <option value="2">本地游客</option>
        </select>
        <label>城市列表:</label>
        <select id="cityid" name="cityid" onchange="cityChange();"></select>
    </div>
    <div>
        <label>景区评级:</label>
        <select id="aLevel" name="aLevel" onchange="levelChange();">
            <option value="">--请选择--</option>
            <option value="1">A级</option>
            <option value="2">AA级</option>
            <option value="3">AAA级</option>
            <option value="4">AAAA级</option>
            <option value="5">AAAAA级</option>
        </select>
        <label>选择景区:</label>
        <select id="regionId" name="regionId" style="width: 340px;"></select>
        <!--<input type="checkbox" id="isHolidayCk" name="isHolidayCk" style="font-size: 12px;" onclick="isHolidayCheck(this)" disabled/>是否节假日-->
        <input type="hidden" value="0" id="isHoliday" name="isHoliday"/>
    </div>
    <div>
        <label>查询方式:</label>
        <select id="searchtype" name="searchtype" onchange="toSearchTypeChange();">
            <option value="y">按年份统计</option>
            <option value="q">按季度统计</option>
            <option value="m">按月份统计</option>
            <option value="d" selected="selected">按天数统计</option>
        </select>
				<span style="display: none;" id="ySearch">
					<label>开始时间:</label>
					<input type="text" id="yBeginTime" name="yBeginTime" class="Wdate"  value="<%=today %>"
                           onclick="WdatePicker({dateFmt:'yyyy',minDate:'#F{$dp.$D(\'yEndTime\',{y:-10})}',maxDate:'#F{$dp.$D(\'yEndTime\')||\'%y\'}'});"/>
					<label>结束时间:</label> 
					<input type="text" id="yEndTime" name="yEndTime" class="Wdate"  value="<%=today %>"
                           onclick="WdatePicker({dateFmt:'yyyy',maxDate:'#F{$dp.$D(\'yBeginTime\',{y:10})}',minDate:'#F{$dp.$D(\'yBeginTime\')}'});"/>
				</span>
				<span style="display: none;" id="qSearch">
					<label>开始时间:</label>
					<input type="text" id="qBeginTime" name="qBeginTime" class="Wdate" value="<%=today %>"
                           onclick="WdatePicker({dateFmt:'yyyy',minDate:'#F{$dp.$D(\'qEndTime\',{y:-1})}',maxDate:'#F{$dp.$D(\'qEndTime\')||\'%y\'}'});"/>
					<select id="qQuarterBegin" name="qQuarterBegin" style="width: 120px;">
                        <option selected="selected" value="1" >第一季度</option>
                        <option value="2">第二季度</option>
                        <option value="3">第三季度</option>
                        <option value="4">第四季度</option>
                    </select>
					<label>结束时间:</label>
					<input type="text" id="qEndTime" name="qEndTime" class="Wdate" value="<%=today %>"
                           onclick="WdatePicker({dateFmt:'yyyy',maxDate:'#F{($dp.$D(\'qBeginTime\',{y:1}))}',minDate:'#F{$dp.$D(\'qBeginTime\')}'});"/>
					<select id="qQuarterEnd" name="qQuarterEnd" style="width: 120px;">
                        <option selected="selected" value="1">第一季度</option>
                        <option value="2">第二季度</option>
                        <option value="3">第三季度</option>
                        <option value="4">第四季度</option>
                    </select>
				</span>
				<span style="display: none;" id="mSearch">
					<label>开始时间:</label>
					<input type="text" id="mBeginTime" name="mBeginTime" class="Wdate" value="<%=month %>"
                           onclick="WdatePicker({dateFmt:'yyyy-MM',minDate:'#F{$dp.$D(\'mEndTime\',{M:-10})}',maxDate:'#F{$dp.$D(\'mEndTime\')||\'%y-%M\'}'});"/>
					<label>结束时间:</label>
					<input type="text" id="mEndTime" name="mEndTime" class="Wdate" value="<%=month %>"
                           onclick="WdatePicker({dateFmt:'yyyy-MM',maxDate:'#F{($dp.$D(\'mBeginTime\',{M:10}))}',minDate:'#F{$dp.$D(\'mBeginTime\')||\'%y-%M\'}'});"/>
				</span>
				<span id="dSearch">
					<label>开始时间:</label>
					<input type="text" id="dBeginTime" name="dBeginTime" style="width:140px;" class="Wdate" value="<%=day %>"
                           onclick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'dEndTime\',{d:-15})}',maxDate:'#F{$dp.$D(\'dEndTime\')||\'%y-%M-%d\'}',onpicking:isSpecDate($dp.cal.newdate)});"/>
					<label>结束时间:</label>
					<input type="text" id="dEndTime" name="dEndTime" style="width:140px;"  class="Wdate" value="<%=day %>"
                           onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'dBeginTime\',{d:15})}',minDate:'#F{$dp.$D(\'dBeginTime\')||\'%y-%M-%d\'}',onpicking:isSpecDate($dp.cal.newdate)});"/>
				</span></div>
                <div>
                        <input type="checkbox" name="showTb" id="showTb" onclick="toCheck(this);"/> 显示同比

        <a class="easyui-linkbutton" icon="icon-search" name="searchbtn" id="searchbtn"
           onclick="searchValidate();">查询</a>
        <a class="easyui-linkbutton" name="searchbtn2" id="searchbtn2"
           onclick="exportValidate();">导出Excel</a>

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
