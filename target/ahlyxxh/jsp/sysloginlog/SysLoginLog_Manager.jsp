<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setAttribute("home", request.getContextPath());
%>
<html>
  <head>
    <title>登录日志表管理页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<jsp:include flush='true' page='../common/inc.jsp'></jsp:include>
	<script type='text/javascript' src='${home}/dwr/interface/SysLoginLogAction.js'></script>
	<script type="text/javascript" src="${home}/js/jquery/jquery-form-plugin.js"></script>
	<script type="text/javascript" src="${home}/js/jquery/jquery-validator-plugin.js"></script>
	<script type="text/javascript" src="${home}/js/date/WdatePicker.js"></script>
    <jsp:include flush='true' page='SysLoginLog_Manager_js.jsp'></jsp:include>

  </head>
  
  <body>	
		<table id="SysLoginLogQueryForm" class="form_query" style="height: 50px">
			<tr>
				<td>
					登录名：<input type="text" id="SysLoginLogQueryForm:loginName" style="width:100px;"></input>											
					显示名称：<input type="text" id="SysLoginLogQueryForm:name" style="width:100px;"></input>
					登录时间：<input type="text" id="SysLoginLogQueryForm:starttime" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" style="width:135px;"></input>
						   至<input type="text" id="SysLoginLogQueryForm:endtime" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" style="width:135px;"></input>
				</td>
			</tr>
			<tr>
				<td>
					用户类型：<select id="SysLoginLogQueryForm:operatorType" style="width:100px;">
							<option value="">--请选择--</option>
							<option value="0">本地用户</option>
							<option value="1">ADC用户</option>
					</select>											
					操作类型：<select id="SysLoginLogQueryForm:loginType" style="width:100px;">
							<option value="">--请选择--</option>
							<option value="0">登录</option>
							<option value="1">注销</option>
							</select>											
					登录结果：<select id="SysLoginLogQueryForm:sucOrFail" style="width:100px;">
							<option value="">--请选择--</option>
							<option value="0">成功</option>
							<option value="1">失败</option>
							</select>											
				<a href="javascript:void(0);" class="easyui-linkbutton" icon="icon-search" id="btn_query">查询</a> 
				<a href="javascript:void(0);"class="easyui-linkbutton" id="btn_reset">重置</a>
				</td>
			</tr>
		</table>
		<table id="SysLoginLogList"></table>

</body>
</html>
