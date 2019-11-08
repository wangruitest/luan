<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setAttribute("home", request.getContextPath());
%>
<html>
  <head>
    <title>境外入皖漫游用户统计</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<jsp:include flush='true' page='../common/inc.jsp'></jsp:include>
	<jsp:include flush='true' page='../common/file_inc.jsp'></jsp:include>
	<script type='text/javascript' src='${home}/dwr/interface/TouristRoamingAction.js'></script>
	<script type="text/javascript" src="${home}/js/jquery/jquery-form-plugin.js"></script>
	<script type="text/javascript" src="${home}/js/jquery/jquery-validator-plugin.js"></script>
	<script type="text/javascript" src="${home}/js/date/WdatePicker.js"></script>
	<script type="text/javascript" src="${home}/js/jquery/date-functions.js"></script>
	<jsp:include flush='true' page='TouristRoaming_Manager_js.jsp'></jsp:include>

  </head>
  
  <body style="margin:0px">	
		<table id="TouristRoamingQueryForm" class="form_query" style="height: 50px">
		<tr>
			<td>
				统计月份：
				<input type="text" style="width:100px" id="TouristRoamingQueryForm:statMonth" name="TouristRoamingQueryForm:statMonth" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM',maxDate:'%y-#{%M}',isShowClear:false,isShowToday:false});" readonly="readonly"/>										
				<a href="javascript:void(0);" class="easyui-linkbutton" icon="icon-search" id="btn_query">查询</a> 
				<a href="javascript:void(0);"class="easyui-linkbutton" id="btn_reset">重置</a>
				<a href="javascript:void(0);"class="easyui-linkbutton" id="btn_exp">导出excel</a>
				</td>
			</tr>
		</table>
		<table id="TouristRoamingList"></table>
</body>
</html>
