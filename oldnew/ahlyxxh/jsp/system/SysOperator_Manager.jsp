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
	<script type='text/javascript' src='${home}/dwr/interface/SysOperatorAction.js'></script>
	<script type="text/javascript" src="${home}/js/jquery/jquery-form-plugin.js"></script>
	<script type="text/javascript" src="${home}/js/jquery/jquery-validator-plugin.js"></script>
    <jsp:include flush='true' page='SysOperator_Manager_js.jsp'></jsp:include>

  </head>
  
  <body style="padding: 0px; margin: 0px;">
		<table id="SysOperatorQueryForm" class="form_query" style="height: 50px">
			<tr>
				<td>
					&#160;&#160;姓名：<input type="text" id="SysOperatorQueryForm:name" style="width:150px;"></input>											
					&#160;登录名：<input type="text" id="SysOperatorQueryForm:loginName" style="width:150px;"></input>											
					&#160;状态：<select id="SysOperatorQueryForm:status" style="width:150px;"><option value="0">启用</option><option value="1">禁用</option></select>
					&#160;备注：<input type="text" id="SysOperatorQueryForm:remark" style="width:150px;"></input>											
					<a href="javascript:void(0);" class="easyui-linkbutton" icon="icon-search" id="btn_query">查询</a> 
					<a href="javascript:void(0);"class="easyui-linkbutton" id="btn_reset">重置</a>
				</td>
			</tr>
		</table>
		<table id="SysOperatorList"></table>

	<div id="SysOperatorDialog" style="padding: 0px; width: 850px; height: 350px;margin:0px;">
		<table id="SysOperatorForm" class="form_table" >
			<tr>
				<th><font color="red">*</font>&#160; 姓名：</th>
				<td>
					<input type="text" id="SysOperatorForm:name"
					validation="require;maxlen(50)"></input>
					<input type="hidden" id="SysOperatorForm:unid"
					></input>
					</td>
				<th><font color="red">*</font>&#160; 登录名：</th>
				<td><input type="text" id="SysOperatorForm:loginName"
					validation="require;maxlen(256)"></input></td>
			</tr>
			<tr>
				<th><font color="red">*</font>&#160; 密码：</th>
				<td>
					<input type="password" id="SysOperatorForm:password"
						validation="require;maxlen(256)"></input>
					<input type="hidden" id="SysOperatorForm:oldPassword"
						></input>
				</td>
				<th><font color="red">*</font>&#160; 状态：</th>
				<td>
				<select id="SysOperatorForm:status" style="width:100px;"><option value="0">启用</option><option value="1">禁用</option></select>
				</td>
			</tr>
			<tr>
				<th>所属城市：</th>
				<td>
					<select id="SysOperatorForm:orgUnid" style="width:100px;">
					<option value="0">安徽省</option>
					<option value="1">合肥市</option>
					<option value="2">芜湖市</option>
					<option value="3">蚌埠市</option>
					<option value="4">淮南市</option>
					<option value="5">马鞍山市</option>
					<option value="6">淮北市</option>
					<option value="7">铜陵市</option>
					<option value="8">安庆市</option>
					<option value="9">黄山市</option>
					<option value="10">滁州市</option>
					<option value="11">阜阳市</option>
					<option value="12">宿州市</option>
					<option value="13">六安市</option>
					<option value="14">亳州市</option>
					<option value="15">池州市</option>
					<option value="16">宣城市</option>
					</select>
				</td>
				<th>所属角色：</th>
				<td><input type="text" id="SysOperatorForm:sysRoles" readonly="readonly" style="width:70%;background-color: #cad0cd"></input>
				<a href="javascript:void(0);" class="easyui-linkbutton" id="btn_select_roles">选择</a>
				</td>
			</tr>
			<tr>
				<th>性别：</th>
				<td>
					<select id="SysOperatorForm:sex" style="width:100px;"><option value="1">男</option><option value="0">女</option></select>
				</td>
				<th>用户类型：</th>
				<td>
					<select id="SysOperatorForm:operatorType" style="width:100px;">
					<option value="0">web用户</option>
					<option value="2">手机用户</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<th>客户端角色：</th>
				<td>
					<select id="SysOperatorForm:mobileRole" style="width:100px;">
					<option value="0">省级管理员</option>
					<option value="1">市级管理员</option>
					<option value="2">景区管理员</option>
					</select>
				</td>
				<th></th>
				<td>
					
				</td>
			</tr>
			
			<tr>
				<th>电话号码：</th>
				<td><input type="text" id="SysOperatorForm:telephoneNumber"
					validation="maxlen(32)"></input></td>
				<th>手机号码：</th>
				<td><input type="text" id="SysOperatorForm:mobileNumber"
					validation="maxlen(32)"></input></td>
			</tr>
			<tr>
				<th>身份证号码：</th>
				<td><input type="text" id="SysOperatorForm:idNumber"
					validation="maxlen(256)"></input></td>
				
				<th>邮箱地址：</th>
				<td><input type="text" id="SysOperatorForm:mail"
					validation="maxlen(256)"></input></td>
			</tr>
			<tr>
				<th>备注：</th>
				<td colspan="3"><textarea id="SysOperatorForm:remark" rows="5" 
					validation="maxlen(256)"></textarea></td>
			</tr>
		</table>
	</div>
</body>
</html>
