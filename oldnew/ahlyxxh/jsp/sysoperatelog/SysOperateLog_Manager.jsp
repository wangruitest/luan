<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setAttribute("home", request.getContextPath());
%>
<html>
  <head>
    <title>管理页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<jsp:include flush='true' page='../common/inc.jsp'></jsp:include>
	<script type='text/javascript' src='${home}/dwr/interface/SysOperateLogAction.js'></script>
	<script type="text/javascript" src="${home}/js/jquery/jquery-form-plugin.js"></script>
	<script type="text/javascript" src="${home}/js/jquery/jquery-validator-plugin.js"></script>
	<script type="text/javascript" src="${home}/js/date/WdatePicker.js"></script>
	<jsp:include flush='true' page='SysOperateLog_Manager_js.jsp'></jsp:include>
  </head>
  <body>	
		<table id="SysOperateLogQueryForm" class="form_query" style="height: 50px">
			<tr>
				<td>
					操作动作：<select id="SysOperateLogQueryForm:operateAction">
						<option value="">--请选择--</option>
						<option value="create">创建</option>
						<option value="update">修改</option>
						<option value="delete">删除</option>
						<option value="ByArgs">查询</option>
					</select>										
					操作时间：<input type="text" id="SysOperateLogQueryForm:startTime" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" style="width:135px;"></input>
						   至<input type="text" id="SysOperateLogQueryForm:endTime" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" style="width:135px;"></input>											
					操作用户：<input type="text" id="SysOperateLogQueryForm:operateLoginName" style="width:100px;"></input>											
					操作城市：<select style="width: 100px" id="SysOperateLogQueryForm:operateCityCode">
						<option value="">--请选择--</option>
						<option value="591">福州市</option>
						<option value="592">厦门市</option>
						<option value="593">宁德市</option>
						<option value="594">莆田市</option>
						<option value="595">泉州市</option>
						<option value="596">漳州市</option>
						<option value="597">龙岩市</option>
						<option value="598">三明市</option>
						<option value="599">南平市</option>
					</select>									
					<a href="javascript:void(0);" class="easyui-linkbutton" icon="icon-search" id="btn_query">查询</a> 
					<a href="javascript:void(0);"class="easyui-linkbutton" id="btn_reset">重置</a>
				</td>
			</tr>
		</table>
		<table id="SysOperateLogList"></table>
</body>
</html>
