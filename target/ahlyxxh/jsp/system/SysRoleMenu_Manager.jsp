<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setAttribute("home", request.getContextPath());
%>
<html>
  <head>
    <title>角色菜单管理页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<jsp:include flush='true' page='../common/inc.jsp'></jsp:include>
	<script type='text/javascript' src='${home}/dwr/interface/SysRoleMenuAction.js'></script>
	<script type="text/javascript" src="${home}/js/jquery/jquery-form-plugin.js"></script>
	<script type="text/javascript" src="${home}/js/jquery/jquery-validator-plugin.js"></script>
      	<jsp:include flush='true' page='SysRoleMenu_Manager_js.jsp'></jsp:include>

  </head>
  
  <body>	
		<table id="SysRoleMenuQueryForm" class="form_query" style="height: 50px">
			<tr>
				<td>
								标识：<input type="text" id="SysRoleMenuQueryForm:unid" style="width:100px;"></input>											
								角色标识：<input type="text" id="SysRoleMenuQueryForm:roleUnid" style="width:100px;"></input>											
								菜单标识：<input type="text" id="SysRoleMenuQueryForm:menuUnid" style="width:100px;"></input>											
								<a href="javascript:void(0);" class="easyui-linkbutton" icon="icon-search" id="btn_query">查询</a> 
				<a href="javascript:void(0);"class="easyui-linkbutton" id="btn_reset">重置</a>
				</td>
			</tr>
		</table>
		<table id="SysRoleMenuList"></table>

	<div id="SysRoleMenuDialog" style="padding:0px;width:550px;height:270px;">
		<table id="SysRoleMenuForm" class="form_table" style="height:100%;">
						  <tr>
					<th>
												<font color="red">*</font>&#160;
												标识：</th>
					<td>
												<input type="text" id="SysRoleMenuForm:unid" validation="require;maxlen(32)"></input>
											</td>
				</tr>
						  <tr>
					<th>
												<font color="red">*</font>&#160;
												角色标识：</th>
					<td>
												<input type="text" id="SysRoleMenuForm:roleUnid" validation="require;maxlen(32)"></input>
											</td>
				</tr>
						  <tr>
					<th>
												<font color="red">*</font>&#160;
												菜单标识：</th>
					<td>
												<input type="text" id="SysRoleMenuForm:menuUnid" validation="require;maxlen(32)"></input>
											</td>
				</tr>
					</table>
	</div>
</body>
</html>
