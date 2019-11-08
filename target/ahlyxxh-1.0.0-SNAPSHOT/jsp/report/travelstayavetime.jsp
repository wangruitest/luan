<%@ page language="java" pageEncoding="UTF-8" %>
<%@ page import="com.funo.report.*" %>
<%@page import="com.funo.report.charts.ReportConstants" %>
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
    <title>平均驻留时间统计</title>
    <%@include file="/jsp/common/easyuicommon.jsp" %>
    <jsp:include flush='true' page='../common/file_inc.jsp'></jsp:include>
    <jsp:include flush='true' page='../common/echarts_inc.jsp'></jsp:include>
    <script type="text/javascript" src="../../dwr/interface/ChartReportCommonUtil.js"></script>
    <script type="text/javascript" src="../../dwr/interface/ReportExportExcel.js"></script>
    <script type="text/javascript" src="../../dwr/interface/RegionCfgAction.js"></script>
    <script type="text/javascript" src="../../dwr/interface/UtilsAction.js"></script>
    <script>
        var pieOption=null,barOption=null,lineOption=null;
        var pieChart=null,barChart=null,lineChart=null;
        $(function () {
            initloginerCityList();
            initCountyList();
            init();
            $("#gridbox").datagrid({
                title:'游客平均驻留时间统计',
                singleSelect: true,
                pagination: true,
                rownumbers:true,
                height:getViewportHeight()-95,
                pageSize: 20,
                border:false,
                fitColumns: true,
                columns: [[
                    {field: 'TITLE', title: '景区名称', width: 100},
                    {field: 'AVGTIMESTR', title: '平均驻留时间（分钟）', width: 100},
                    {field: 'RQ', title: '统计时间', width: 100}
                ]]
            });
            $("#tabs").tabs({
                border:false,
                height:getViewportHeight()-65,
                onSelect:function(title){
                    var pObj = getSearchForm();
                    if(!valid(pObj)) return;
                    if (title == '柱状图') {
                        loadEcharts(pObj);
                    }
                    if (title == '数据列表') {
                        loadTableData(pObj);
                    }
                }
            })
        });

        /**获取填写的查询信息，并分装成一个对象*/
        function getSearchForm(){
            var pObj = {};
            pObj.searchType = $('#searchtype').val();
            pObj.beginTime = $("#"+pObj.searchType + "BeginTime").val();
            pObj.endTime = $("#"+pObj.searchType + "EndTime").val();
            pObj.cityid = $('#cityid').val();
            pObj.countyid = $('#countyid').val();
            pObj.qBegin = $('#qQuarterBegin').val();
            pObj.qEnd = $("#qQuarterEnd").val();
            pObj.aLevel=$("#aLevel").val();
            return pObj;
        }

        function searchJc() {
            var pObj = getSearchForm();
            if(!valid(pObj)) return;
            var tab= $('.tabs-selected span:first').html()
            if(tab=='数据列表'){
                loadTableData(pObj);
            }else{
                loadEcharts(pObj);
            }
        }

        /**
         * 加载Echarts控件
         * **/
        function loadEcharts(pObj){
            pObj.diff = getDiff(pObj);
            var dateParams =  getSearchDates(pObj);
            showEChart(pObj,dateParams,getStaticObject()); //显示图
        }

        /**
         * 加载数据列表
         * */
        function loadTableData(pObj){
            pObj.diff = getDiff(pObj);
            var dateParams =  getSearchDates(pObj);
            pObj.IS_NOT_FETCH = "true";
            showDataListTable(getStaticObject(),pObj,dateParams);
        }

        /**
         * Excel导出
         * */
        function exportJc() {
            var number ="1";
            var headerStr = ["景区名称", "平均驻留时间（分钟）", "统计时间"];
            var title = "平均驻留时间统计";
            var pObj = getSearchForm();
            if(!valid(pObj)) return;
            pObj.diff = getDiff(pObj);
            toExportChart(pObj, getStaticObject(), "", headerStr, title,number);
        }

        /**表头参数的定义*/
        function getStaticObject() {
            var tObject = new Object();
            tObject.xname = "单位（景区）";
            tObject.yname = "单位（分钟）";
            tObject.caption = "平均驻留时间统计（单位/分钟）";
            tObject.subTitle = "统计全区县所有景区的游客平均驻留时间，可按年、季度、月、天统计";
            tObject.procedureName = "<%=ReportConstants.TRAVEL_STAY_AVETIME_PROCEDURE%>";
            tObject.PROC_PARAMS = "<%=ReportConstants.TRAVEL_STAY_AVETIME_PROCEDURE_PARAMS%>";
            tObject.chartTypes = "<%=ReportConstants.COLUMN3D_CHART%>";
            tObject.noSplit = "";
            return tObject;
        }

        function toSearchTypeChange() {
            var prefix = ["y", "q", "m", "d"];
            searchTypeChange(prefix);
        }

        function init(){
            toSearchTypeChange();
            var searchtype =$("#searchtype").val();
            var today = new Date();
            var m = today.getMonth();
            var month;
            if(m == 0) {
                month = today.getFullYear()-1 + "-" + 12;
            }else{
                month = today.getFullYear() + "-" + m;
            }
            $("#"+searchtype + "BeginTime").val(month);
            $("#"+searchtype + "EndTime").val(month);
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

</head>

<body>
<input type="hidden" id="procedureName" name="procedureName"
       value="<%=ReportConstants.TRAVEL_STAY_AVETIME_PROCEDURE%>"/>
<input type="hidden" id="PROC_PARAMS" name="PROC_PARAMS"
       value="<%=ReportConstants.TRAVEL_STAY_AVETIME_PROCEDURE_PARAMS%>"/>
<input id="touristtype" name="touristtype" value="0" type="hidden"/>
<div id="parameter" style="background-color: #E3EFFF;width:100%">
    <div >
        <label>城市列表:</label>
        <select id="cityid" name="cityid" onchange="initCountyList()"></select>
        <label>区县列表:</label>
        <select id="countyid" name="countyid"></select>
        <label>景区评级:</label>
        <select  id="aLevel" name="aLevel" onchange="levelChange();">
            <option value="">--请选择--</option>
            <option value="1">A级</option>
            <option value="2">AA级</option>
            <option value="3">AAA级</option>
            <option value="4">AAAA级</option>
            <option value="5">AAAAA级</option>
        </select>
        <label>查询方式:</label>
        <select  id="searchtype" name="searchtype"  onchange="toSearchTypeChange();">
            <option value="m">按月份统计</option>
            <option value="y">按年份统计</option>
            <option value="q">按季度统计</option>
            <!--<option value="d">按天数统计</option>-->
        </select>
        <!--<input type="checkbox" id="isHolidayCk" name="isHolidayCk" onclick="isHolidayCheck(this)"
               disabled/><span style="font-size: 12px;">是否节假日</span>-->
        <input type="hidden" value="0" id="isHoliday" name="isHoliday"/>
        <a class="easyui-linkbutton" icon="icon-search" name="searchbtn" id="searchbtn" onclick="searchValidate();">查询</a>
        <a class="easyui-linkbutton" name="searchbtn2" id="searchbtn2" onclick="exportValidate();">导出Excel</a>
    </div>
    <div >

        <span style="display: none;" id="ySearch">
            <label>开始时间:</label>
            <input type="text"  id="yBeginTime" name="yBeginTime" value="<%=today %>" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy',minDate:'#F{$dp.$D(\'yEndTime\',{y:-10})}',maxDate:'#F{$dp.$D(\'yEndTime\')||\'%y\'}'});" />
            <label>结束时间:</label>
            <input type="text"  id="yEndTime" name="yEndTime" class="Wdate" value="<%=today %>" onfocus="WdatePicker({dateFmt:'yyyy',maxDate:'#F{$dp.$D(\'yBeginTime\',{y:10})}',minDate:'#F{$dp.$D(\'yBeginTime\')}'});" />
        </span>
        <span style="display: none;" id="qSearch">
            <label>开始时间:</label>
            <input type="text" id="qBeginTime" name="qBeginTime" class="Wdate" value="<%=today %>" onfocus="WdatePicker({dateFmt:'yyyy',minDate:'#F{$dp.$D(\'qEndTime\',{y:-1})}',maxDate:'#F{$dp.$D(\'qEndTime\')||\'%y\'}'});" />
            <select id="qQuarterBegin" name="qQuarterBegin">
                <option selected="selected" value="1">第一季度</option>
                <option value="2">第二季度</option>
                <option value="3">第三季度</option>
                <option value="4">第四季度</option>
            </select>
            <label>结束时间:</label>
            <input type="text"  id="qEndTime" name="qEndTime" class="Wdate" value="<%=today %>" onfocus="WdatePicker({dateFmt:'yyyy',maxDate:'#F{($dp.$D(\'qBeginTime\',{y:1}))}',minDate:'#F{$dp.$D(\'qBeginTime\')}'});" />
            <select id="qQuarterEnd" name="qQuarterEnd">
                <option selected="selected" value="1">第一季度</option>
                <option value="2">第二季度</option>
                <option value="3">第三季度</option>
                <option value="4">第四季度</option>
            </select>
        </span>
        <span  id="mSearch">
            <label>开始时间:</label>
            <input type="text"  id="mBeginTime" name="mBeginTime" class="Wdate" value="<%=month %>" onfocus="WdatePicker({dateFmt:'yyyy-MM',minDate:'#F{$dp.$D(\'mEndTime\',{M:-10})}',maxDate:'#F{$dp.$D(\'mEndTime\')||\'%y-%M\'}'});" />
            <label>结束时间:</label>
            <input type="text"  id="mEndTime" name="mEndTime" class="Wdate" value="<%=month %>" onfocus="WdatePicker({dateFmt:'yyyy-MM',maxDate:'#F{($dp.$D(\'mBeginTime\',{M:10}))}',minDate:'#F{$dp.$D(\'mBeginTime\')||\'%y-%M\'}'});" />
        </span>
        <span id="dSearch">
            <label>开始时间:</label>
            <input type="text" id="dBeginTime" name="dBeginTime" class="Wdate" value="<%=day %>" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'dEndTime\',{d:-15})}',maxDate:'#F{$dp.$D(\'dEndTime\')||\'%y-%M-%d\'}'});" />
            <label>结束时间:</label>
            <input type="text"  id="dEndTime" name="dEndTime" class="Wdate" value="<%=day %>" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'dBeginTime\',{d:15})}',minDate:'#F{$dp.$D(\'dBeginTime\')||\'%y-%M-%d\'}'});" />
        </span>
    </div>

</div>

    <div id="tabs" class="easyui-tabs" >
        <div id="<%=ReportConstants.COLUMN3D_CHART%>" title="柱状图">
        </div>
        <div id="grid" title="数据列表">
            <div id="gridboxdiv" >
                <table id="gridbox"></table>
            </div>
        </div>
    </div>
</body>
</html>
