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
    <jsp:include flush='true' page='../common/commonSelect.jsp'></jsp:include>
	<script type='text/javascript' src='${home}/dwr/interface/SysRoleAction.js'></script>
	<script type='text/javascript' src='${home}/dwr/interface/SysMenuAction.js'></script>
	<script type='text/javascript' src='${home}/dwr/interface/RegionCfgAction.js'></script>
	<script type='text/javascript' src='${home}/dwr/interface/RoleRegionCfgAction.js'></script>
	<script type="text/javascript" src="${home}/js/jquery/jquery-form-plugin.js"></script>
	<script type="text/javascript" src="${home}/js/jquery/jquery-validator-plugin.js"></script>
	<jsp:include flush='true' page='SysRole_Manager_js.jsp'></jsp:include>
	<style type="text/css">
		table tr th{width:100px;}
	</style>
  </head>
  
  <body style="margin: 0px;padding: 0px;">
		<table id="SysRoleQueryForm" class="form_query" style="height: 50px">
			<tr>
				<td>
					&#160;&#160;角色名称：<input type="text" id="SysRoleQueryForm:name" style="width:200px;"></input>											
					&#160;状态：<select id="SysRoleQueryForm:status" style="width:150px;"><option value="0">启用</option><option value="1">禁用</option></select>
					&#160;备注：<input type="text" id="SysRoleQueryForm:remark" style="width:200px;"></input>											
					<a href="javascript:void(0);" class="easyui-linkbutton" icon="icon-search" id="btn_query">查询</a> 
					<a href="javascript:void(0);" class="easyui-linkbutton" id="btn_reset">重置</a>
				</td>
			</tr>
		</table>
		<table id="SysRoleList"></table>

	<div id="SysRoleDialog" style="padding: 0px; width: 520px; height: 330px;margin:0px;">
		<table id="SysRoleForm" class="form_table">
			<tr>
				<th><font color="red">*</font>&#160; 角色名称：</th>
				<td>
					<input type="hidden" id="SysRoleForm:unid"></input>
					<input type="text" id="SysRoleForm:name" validation="require;maxlen(50)"></input>
				</td>
				<th><font color="red">*</font>&#160; 状态：</th>
				<td>
					<select id="SysRoleForm:status" ><option value="0">启用</option><option value="1">禁用</option></select>
				</td>
			</tr>
			<tr>
				<th><font color="red">*</font>&#160;角色成员：</th>
				<td colspan="3"><textarea id="SysRoleForm:sysOperators" readonly="readonly" 
					validation="require('请选择角色成员！');" rows="7" style="width: 380px;background-color: #cad0cd"></textarea>
					<a href="javascript:void(0);" class="easyui-linkbutton" id="btn_select_users">选择</a>
				</td>
			</tr>
			<tr>
				<th>&#160;首页地址：</th>
				<td colspan="3"><input type="text" id="SysRoleForm:homepage" validation="maxlen(256)" style="width: 380px;"></input></td>
			</tr>
			<tr>
				<th>&#160;备注：</th>
				<td colspan="3"><textarea id="SysRoleForm:remark"
					validation="maxlen(512)" rows="3" style="width: 380px;"></textarea></td>
			</tr>
		</table>
	</div>
	<div id="roleMenuDialog" style="padding:0px;width:300px;height:400px;">
		<div id="menu_tree"></div>
	</div>
	<div id="regionRoleDialog" style="padding:0px;width:300px;height:400px;">
		<div id="region_tree"></div>
	</div>
</body>
</html>
