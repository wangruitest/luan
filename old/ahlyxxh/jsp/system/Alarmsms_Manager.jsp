<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setAttribute("home", request.getContextPath());
%>
<html>
  <head>
    <title>告警信息管理页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<jsp:include flush='true' page='../common/inc.jsp'></jsp:include>
	<jsp:include flush='true' page='../common/file_inc.jsp'></jsp:include>
	<script type='text/javascript' src='${home}/dwr/interface/AlarmsmsAction.js'></script>
	<script type="text/javascript" src="${home}/js/jquery/jquery-form-plugin.js"></script>
	<script type="text/javascript" src="${home}/js/jquery/jquery-validator-plugin.js"></script>
    <script type="text/javascript" src="${home}/js/date/WdatePicker.js"></script>
	<script type="text/javascript" src="${home}/js/jquery/date-functions.js"></script>
	<jsp:include flush='true' page='Alarmsms_Manager_js.jsp'></jsp:include>

  </head>
  
  <body>	
		<table id="AlarmsmsQueryForm" class="form_query" style="height: 50px">
			<tr>
				<td>
					电话号码：<input type="text" id="AlarmsmsQueryForm:phoneNum" style="width:100px;"></input>											
					短信内容：<input type="text" id="AlarmsmsQueryForm:smscontent" style="width:100px;"></input>											
					短信类型:<select  id="AlarmsmsQueryForm:smstype">
							<option value="">--请选择--</option>
							<option value="1">系统告警</option>
							<option value="2">业务告警</option>
							<option value="3">测试短信</option>
						</select>										
					<a href="javascript:void(0);" class="easyui-linkbutton" icon="icon-search" id="btn_query">查询</a> 
				<a href="javascript:void(0);"class="easyui-linkbutton" id="btn_reset">重置</a>
				</td>
			</tr>
		</table>
		<table id="AlarmsmsList"></table>

	<div id="AlarmsmsDialog" style="padding:0px;width:550px;height:270px;">
		<table id="AlarmsmsForm" class="form_table" style="height:100%;">
			<tr>
				<th></th>
				<td></td>
				<th></th>
				<td></td>
			</tr>
			<tr>
				<th><font color="red">*</font>&#160;电话号码：</th>
				<td colspan="3">
					<input type="text" id="AlarmsmsForm:phoneNum" validation="require;maxlen(11);mobile"></input>
					<input type="hidden" id="AlarmsmsForm:smstype" value="3"></input>
					<input type="hidden" id="AlarmsmsForm:smscount"  value="0"></input>
					<input type="hidden" id="AlarmsmsForm:smsresultcode"  value="2"></input>
				</td>
			</tr>
			<tr>
				<th><font color="red">*</font>&#160;短信内容：</th>
				<td colspan="3">
					<textarea rows="5" id="AlarmsmsForm:smscontent" validation="require;maxlen(140)"></textarea>
				</td>
			</tr>
			<tr>
				<th> 备注：</th>
				<td colspan="3">
					<textarea rows="3"  id="AlarmsmsForm:remark" validation="maxlen(100)"></textarea>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
