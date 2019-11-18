<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setAttribute("home", request.getContextPath());
%>
<html>
  <head>
    <title>菜单管理页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<jsp:include flush='true' page='../common/inc.jsp'></jsp:include>
	<script type='text/javascript' src='${home}/dwr/interface/SysMenuAction.js'></script>
	<script type="text/javascript" src="${home}/js/jquery/jquery-form-plugin.js"></script>
	<script type="text/javascript" src="${home}/js/jquery/jquery-validator-plugin.js"></script>
                	<jsp:include flush='true' page='SysMenu_Manager_js.jsp'></jsp:include>

  </head>
  
<body class="easyui-layout" >
	<div data-options="region:'west',split:true,title:'父菜单'" style="width: 200px;">
		<div id="type_tree"></div>
	</div>
	<div data-options="region:'center'">
		<div id="SysMenuQueryForm" class="form_query parameter">
			<div>
					&#160;&#160;菜单标识：<input type="text" id="SysMenuQueryForm:menuid" style="width:100px;"></input>
					&#160;名称：<input type="text" id="SysMenuQueryForm:name" style="width:100px;"></input>
					&#160;地址：<input type="text" id="SysMenuQueryForm:url" style="width:100px;"></input>
					&#160;状态：<select id="SysMenuQueryForm:status" style="width:80px;"><option value="0">启用</option><option value="1">禁用</option></select>
					<a href="javascript:void(0);" class="easyui-linkbutton" icon="icon-search" id="btn_query">查询</a> 
					<a href="javascript:void(0);"class="easyui-linkbutton" id="btn_reset">重置</a>
			</div>
		</div>
		<table id="SysMenuList"></table>
	
		<div id="SysMenuDialog" style="padding: 0px; width: 650px; height: 250px;margin:0px;">
			<table id="SysMenuForm" class="form_table" >
				<tr>
					<th><font color="red">*</font>&#160; 名称：</th>
					<td><input type="text" id="SysMenuForm:name"
						validation="require;maxlen(256)"></input></td>
					<th>&#160; 显示名称：</th>
					<td><input type="text" id="SysMenuForm:displayName"
						validation="maxlen(256)"></input></td>
				</tr>
				<tr>
					<th><font color="red">*</font>&#160; 数据源类型：</th>
					<td>
						<select id="SysMenuForm:dsTypes"
							validation="require;maxlen(256)">
							<option value="0" selected="selected">景区短彩信</option>
							<option value="1">游客采样</option>
							<option value="2">双重数据</option>
						</select>
					</td>
					<th><font color="red">*</font>&#160; 状态：</th>
					<td><select id="SysMenuForm:status" style="width:100px;"><option value="0">启用</option><option value="1">禁用</option></select></td>
				</tr>
				<tr>
					<th><font color="red">*</font>&#160; 菜单标识：</th>
					<td><input type="text" id="SysMenuForm:menuid"
						validation="require;maxlen(128)"></input>
						<input type="hidden" id="SysMenuForm:unid"
						></input>
					</td>
					<th>菜单图标：</th>
					<td><input type="text" id="SysMenuForm:menuIcon"
						validation="maxlen(256)" style="width:93%"></input></td>
				</tr>
				<tr>
					<th><font color="red">*</font>&#160; URL地址：</th>
					<td colspan="3"><input type="text" id="SysMenuForm:url"
						validation="require;maxlen(1024)"></input></td>
				</tr>
				<tr>
					<th>桌面图标：</th>
					<td><input type="text" id="SysMenuForm:desktopIcon"
						validation="maxlen(256)"></input></td>
					<th>排序号：</th>
					<td><input type="text" id="SysMenuForm:sortNum"
						validation="maxlen(22)" style="width:93%"></input></td>
				</tr>
				<tr>
					<th>&#160; 所属菜单：</th>
					<td><select id="SysMenuForm:punid" class="easyui-combotree"
					style="width: 210px;" maxlength="32"></select></td>
					<th></th>
					<td></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>
