<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setAttribute("home", request.getContextPath());
%>
<html>
  <head>
    <title>告警人员管理页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<jsp:include flush='true' page='../common/inc.jsp'></jsp:include>
	<script type='text/javascript' src='${home}/dwr/interface/AlarmstarffAction.js'></script>
	<script type="text/javascript" src="${home}/js/jquery/jquery-form-plugin.js"></script>
	<script type="text/javascript" src="${home}/js/jquery/jquery-validator-plugin.js"></script>
    <script type="text/javascript" src="${home}/js/date/WdatePicker.js"></script>
	<script type="text/javascript" src="${home}/js/jquery/date-functions.js"></script>
	<jsp:include flush='true' page='Alarmstarff_Manager_js.jsp'></jsp:include>

  </head>
  
  <body>
		<table id="AlarmstarffQueryForm" class="form_query" style="height: 50px">
			<tr>
				<td>
					&#160;&#160;姓名：<input type="text" id="AlarmstarffQueryForm:name" style="width:100px;"></input>
					&#160;&#160;电话号码：<input type="text" id="AlarmstarffQueryForm:phoneNum" style="width:100px;"></input>
					&#160;&#160;系统告警短信：<select id="AlarmstarffQueryForm:systemAlarmtype" style="width:100px;">
					<option value="">--请选择--</option><option value="0">关闭</option><option value="1">开启</option></select>
					&#160;&#160;业务告警短信：<select id="AlarmstarffQueryForm:businessAlarmtype" style="width:100px;">
					<option value="">--请选择--</option><option value="0">关闭</option><option value="1">开启</option></select>
					&#160;&#160;通道测试短信：<select id="AlarmstarffQueryForm:smstestAlarmtype" style="width:100px;">
					<option value="">--请选择--</option><option value="0">关闭</option><option value="1">开启</option></select>
					&#160;&#160;<a href="javascript:void(0);" class="easyui-linkbutton" icon="icon-search" id="btn_query">查询</a> 
					&#160;&#160;<a href="javascript:void(0);"class="easyui-linkbutton" id="btn_reset">重置</a>
				</td>
			</tr>
			
		</table>
		<table id="AlarmstarffList"></table>

	<div id="AlarmstarffDialog" style="padding:0px;width:550px;height:300px;">
		<table id="AlarmstarffForm" class="form_table" style="height:100%;">
		<tr>
			<th>
			  	<td><input type="hidden" id="AlarmstarffForm:id"></input>
			  </td>
			  </tr>
			  <tr> 
			  	<th><font color="red">*</font>&#160;姓名：</th>
			  <td>
			  	<input type="text" id="AlarmstarffForm:name" validation="require;maxlen(100)"></input>
			  </td>
			  </tr>
			  <tr>
			  	<th><font color="red">*</font>&#160;手机号码：</th>
			  <td>
			  	<input type="text" id="AlarmstarffForm:phoneNum" validation="require;mobile"></input>
			  </td>
			  </tr>			 	 
			  <tr>
			 	 <th>&#160;系统告警短信：</th>
			  <td>
			 	 <select id="AlarmstarffForm:systemAlarmtype">
					<option value="0">---关闭---</option><option value="1">---开启---</option></select>
			  </td>
			  </tr>			 	 
			  <tr>
				  <th>&#160;业务告警短信：</th>
			  <td>
			  	<select id="AlarmstarffForm:businessAlarmtype">
					<option value="0">---关闭---</option><option value="1">---开启---</option></select>
				</td>
			  </tr>			 	 
			  <tr>
				  <th>&#160;通道测试短信：</th>
			  <td>
			  <select id="AlarmstarffForm:smstestAlarmtype">
					<option value="0">---关闭---</option><option value="1">---开启---</option></select>
			 	</td>
			  </tr>
			  <tr>
			  		<th>备注：</th>
			 	 <td>
			  		<textarea id="AlarmstarffForm:remark" rows="5" validation="maxlen(200)"></textarea>
			  	</td>
			  	</tr>
			  
		<!-- 	  <tr>
			 	 <th>更新时间</th>
			  <td>
			  	<input type="text" id="AlarmstarffForm:updatetime" class="Wdate" onClick="WdatePicker()" readonly="readonly"></input>
			  </td>
			  </tr> -->
					</table>
	</div>
</body>
</html>
