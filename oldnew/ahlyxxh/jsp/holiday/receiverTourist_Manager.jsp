<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="com.funo.report.charts.ReportConstants"%>
<%
request.setAttribute("home", request.getContextPath());
%>
<html>
<head>
    <title>景区游客接待统计</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <%@include file="/jsp/common/easyuicommon.jsp" %>
    <jsp:include flush='true' page='../common/echarts_inc.jsp'/>
    <script type="text/javascript" src="${home}/dwr/interface/ChartReportCommonUtil.js"></script>
    <script type="text/javascript" src="${home}/dwr/interface/ReportExportExcel.js"></script>
    <script type="text/javascript" src="${home}/dwr/interface/UtilsAction.js"></script>
    <script type='text/javascript' src='${home}/dwr/interface/RegionRemainAction.js'></script>
    <script type='text/javascript' src='${home}/dwr/interface/HolidayAction.js'></script>
    <script type="text/javascript" src="${home}/js/jquery/jquery-form-plugin.js"></script>
    <script type="text/javascript" src="${home}/js/jquery/jquery-validator-plugin.js"></script>
    <script type="text/javascript" src="${home}/js/date/WdatePicker.js"></script>
    <script type="text/javascript" src="${home}/js/jquery/date-functions.js"></script>
    <jsp:include flush='true' page='../common/file_inc.jsp'></jsp:include>
    <jsp:include flush='true' page='receiverTourist_Manager_js.jsp'/>

</head>
<script type="text/javascript">
		function loseFocus(time) {time.blur();}
</script>
<body style="margin: 0px;">
<table id="ReceiverToursitForm" class="form_query" style="height: 60px;background-color: #E3EFFF;width:100%;">
    <tr>
        <td>
       &nbsp;&nbsp;
            选择地市：<select id="ReceiverToursitQueryForm:cityCode" name="ReceiverToursitQueryForm:cityCode" style="width:150px;"></select>
           选择年份： <input type="text" style="width:100px;" id="ReceiverToursitQueryForm:searchYear"
                        name="ReceiverToursitQueryForm:searchYear" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy',onpicking:initSearchHolidyList()});loseFocus(this);"  value="2016"  readOnly/>
           选择节假日：<select id="ReceiverToursitQueryForm:searchHolidy" style="width:100px;"></select>
            <a href="javascript:void(0);" class="easyui-linkbutton" icon="icon-search" id="btn_query" >查询</a>
            <input type="button" id="searchbtn2" name="searchbtn2" value="导出excel"  onclick="exportJc()" />
      		<input type="hidden" id="searchtype" value="y"/>
        </td>
    </tr>
</table>
<div class="easyui-tabs" id="tabs">
		<div id="<%=ReportConstants.COLUMN3D_CHART %>" title="柱状图">
			</div>
		
			<%-- <div id="<%=ReportConstants.PIE3D_CHART %>" title="饼状图">
			</div> --%>
			
			<div id="<%=ReportConstants.LINE2D_CHART %>" title="曲线图">
			</div>
			<div id="grid" title="数据列表">
				<div id="gridboxdiv">
					<table id="gridbox"></table>
			</div>
</div>


</body>
</html>
