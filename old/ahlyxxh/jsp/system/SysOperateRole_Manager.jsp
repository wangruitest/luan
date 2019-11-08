<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setAttribute("home", request.getContextPath());
%>
<html>
  <head>
    <title>用户角色管理页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<jsp:include flush='true' page='../common/inc.jsp'></jsp:include>
	<script type='text/javascript' src='${home}/dwr/interface/SysOperateRoleAction.js'></script>
	<script type="text/javascript" src="${home}/js/jquery/jquery-form-plugin.js"></script>
	<script type="text/javascript" src="${home}/js/jquery/jquery-validator-plugin.js"></script>
      	<jsp:include flush='true' page='SysOperateRole_Manager_js.jsp'></jsp:include>

  </head>
  
  <body style="padding: 0px;margin: 0px;">
		<table id="SysOperateRoleQueryForm" class="form_query" style="height: 50px">
			<tr>
				<td>
								标识：<input type="text" id="SysOperateRoleQueryForm:unid" style="width:100px;"></input>											
								用户标识：<input type="text" id="SysOperateRoleQueryForm:operateUnid" style="width:100px;"></input>											
								角色标识：<input type="text" id="SysOperateRoleQueryForm:roleUnid" style="width:100px;"></input>											
								<a href="javascript:void(0);" class="easyui-linkbutton" icon="icon-search" id="btn_query">查询</a> 
				<a href="javascript:void(0);"class="easyui-linkbutton" id="btn_reset">重置</a>
				</td>
			</tr>
		</table>
		<table id="SysOperateRoleList"></table>

	<div id="SysOperateRoleDialog" style="padding:0px;width:550px;height:270px;">
		<table id="SysOperateRoleForm" class="form_table" style="height:100%;">
						  <tr>
					<th>
												<font color="red">*</font>&#160;
												标识：</th>
					<td>
												<input type="text" id="SysOperateRoleForm:unid" validation="require;maxlen(32)"></input>
											</td>
				</tr>
						  <tr>
					<th>
												用户标识：</th>
					<td>
												<input type="text" id="SysOperateRoleForm:operateUnid" validation="maxlen(32)"></input>
											</td>
				</tr>
						  <tr>
					<th>
												角色标识：</th>
					<td>
												<input type="text" id="SysOperateRoleForm:roleUnid" validation="maxlen(32)"></input>
											</td>
				</tr>
					</table>
	</div>
</body>
</html>
