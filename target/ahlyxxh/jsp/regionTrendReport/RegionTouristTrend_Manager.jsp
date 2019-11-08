<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setAttribute("home", request.getContextPath());
%>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>景区游客趋势分析</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	  <jsp:include flush='true' page='../common/inc.jsp'></jsp:include>
	  <jsp:include flush='true' page='../common/file_inc.jsp'></jsp:include>
	  <jsp:include flush='true' page='../common/echarts_inc.jsp'></jsp:include>
	<script type="text/javascript" src="${home}/dwr/interface/UtilsAction.js"></script>
	<script type='text/javascript' src='${home}/dwr/interface/RegionTouristTrendAction.js'></script>
	<script type="text/javascript" src="${home}/js/jquery/jquery-form-plugin.js"></script>
	<script type="text/javascript" src="${home}/js/jquery/jquery-validator-plugin.js"></script>
    <script type="text/javascript" src="${home}/js/date/WdatePicker.js"></script>
	<script type="text/javascript" src="${home}/js/jquery/date-functions.js"></script>
	<jsp:include flush='true' page='RegionTouristTrend_Manager_js.jsp'/>

  </head>
  
  <body style="padding: 0px;margin: 0px;">
		<table id="RegionTouristTrendQueryForm" class="form_query" style="height: 50px;background-color: #E3EFFF;">
			<tr>
				<td>
					&nbsp;&nbsp;景区：<select id="RegionTouristTrendQueryForm:regionid" style="width:100px;"></select>
					<a href="javascript:void(0);" class="easyui-linkbutton" icon="icon-search" id="btn_query">查询</a>
					<a href="javascript:void(0);"class="easyui-linkbutton" id="btn_exp">导出excel</a>
				</td>
			</tr>
		</table>
		<div class="easyui-tabs" id="tabs">
		<div id="RegionTouristTrendListLine" title="曲线图" style="padding:10px">
			<div id="RegionTouristTrendListLine0"></div>
		</div>
		<div id="RegionTouristTrendListCHART" title="柱状图" style="padding:10px">
			<div id="RegionTouristTrendListCHART0"></div>
		</div>
		</div>
</body>
</html>
