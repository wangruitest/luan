<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setAttribute("home", request.getContextPath());
%>
<html>
  <head>
    <title>本省漫游用户在皖统计</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<jsp:include flush='true' page='../common/inc.jsp'></jsp:include>
	<jsp:include flush='true' page='../common/file_inc.jsp'></jsp:include>
	<script type='text/javascript' src='${home}/dwr/interface/TouristRoamingInAction.js'></script>
	<script type="text/javascript" src="${home}/js/jquery/jquery-form-plugin.js"></script>
	<script type="text/javascript" src="${home}/js/jquery/jquery-validator-plugin.js"></script>
	<script type="text/javascript" src="${home}/js/date/WdatePicker.js"></script>
	<script type="text/javascript" src="${home}/js/date/cityList.js"></script>
    <script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/WebLogoCfgAction.js'></script>
	<jsp:include flush='true' page='TouristRoamingIn_Manager_js.jsp'></jsp:include>
	
  </head>
  <body  style="margin:0px">	
		<table id="TouristRoamingInQueryForm" class="form_query1" style="height: 50px">
			<tr>
				<th align="right" width="120px";>来源地：</th>
				<td valign="middle">
					<span class="tdSpan" style="margin-bottom: 3px;"><input name="provinces" type="checkbox" value="340100"/>合肥市</span>
					<span class="tdSpan" style="margin-bottom: 3px;"><input name="provinces" type="checkbox" value="340200"/>芜湖市</span>
					<span class="tdSpan" style="margin-bottom: 3px;"><input name="provinces" type="checkbox" value="340300"/>蚌埠市</span>
					<span class="tdSpan" style="margin-bottom: 3px;"><input name="provinces" type="checkbox" value="340400"/>淮南市</span>
					<span class="tdSpan" style="margin-bottom: 3px;"><input name="provinces" type="checkbox" value="340600"/>淮北市</span>
					<span class="tdSpan" style="margin-bottom: 3px;"><input name="provinces" type="checkbox" value="340700"/>铜陵市</span>
					<span class="tdSpan" style="margin-bottom: 3px;"><input name="provinces" type="checkbox" value="340800"/>安庆市</span>
					<span class="tdSpan" style="margin-bottom: 3px;"><input name="provinces" type="checkbox" value="340500"/>马鞍山市</span>
					<br/>
					<span class="tdSpan" style="margin-bottom: 3px;"><input name="provinces" type="checkbox" value="341000"/>黄山市</span>
					<span class="tdSpan" style="margin-bottom: 3px;"><input name="provinces" type="checkbox" value="341100"/>滁州市</span>
					<span class="tdSpan" style="margin-bottom: 3px;"><input name="provinces" type="checkbox" value="341200"/>阜阳市</span>
					<span class="tdSpan" style="margin-bottom: 3px;"><input name="provinces" type="checkbox" value="341300"/>宿州市</span>
					<span class="tdSpan" style="margin-bottom: 3px;"><input name="provinces" type="checkbox" value="341500"/>六安市</span>
					<span class="tdSpan" style="margin-bottom: 3px;"><input name="provinces" type="checkbox" value="341600"/>亳州市</span>
					<span class="tdSpan" style="margin-bottom: 3px;"><input name="provinces" type="checkbox" value="341700"/>池州市</span>
					<span class="tdSpan" style="margin-bottom: 3px;"><input name="provinces" type="checkbox" value="341800"/>宣城市</span>			
				</td>
			</tr>
			<tr>
			<th align="right" width="120px";>目的地：</th>
				<td valign="middle" id="mdd_bar_2">
					</td>
			</tr>
			<tr>
				<th align="right" width="120px";>统计月份：</th>
				<td>
						
						<input type="text" style="width:100px" id="TouristRoamingInQueryForm:statMonth" name="TouristRoamingInQueryForm:statMonth" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM'});" readonly="readonly"/>											
						<a href="javascript:void(0);" class="easyui-linkbutton" icon="icon-search" id="btn_query">查询</a> 
						<a href="javascript:void(0);"class="easyui-linkbutton" id="btn_reset">重置</a>
						<a href="javascript:void(0);"class="easyui-linkbutton" id="btn_exp">导出excel</a>
				</td>
			</tr>
		</table>
		<table id="TouristRoamingInList"></table>
</body>
</html>
