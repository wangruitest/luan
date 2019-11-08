<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setAttribute("home", request.getContextPath());
	String isHideToolBar=request.getParameter("type");
	if(null==isHideToolBar)isHideToolBar="false";
%>
<html>
<head>
<title>商户信息管理页</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<jsp:include flush='true' page='../common/inc.jsp'></jsp:include>
<jsp:include flush='true' page='../common/file_inc.jsp'></jsp:include>
<jsp:include flush='true' page='UserBusinessSelect.jsp'></jsp:include>
<script type='text/javascript'
	src='${home}/dwr/interface/BusinessAction.js'></script>
<script type='text/javascript'
	src='${home}/dwr/interface/IndustryAction.js'></script>
<script type="text/javascript"
	src="${home}/js/jquery/jquery-form-plugin.js"></script>
<script type="text/javascript"
	src="${home}/js/jquery/jquery-validator-plugin.js"></script>
<script type="text/javascript" src="${home}/js/date/WdatePicker.js"></script>
<script type="text/javascript" src="${home}/js/jquery/date-functions.js"></script>
<jsp:include flush='true' page='Business_Manager_js.jsp'></jsp:include>
<script type='text/javascript' src='${home}/dwr/interface/RegionCfgAction.js'></script>
<script type='text/javascript' src='${home}/dwr/interface/BusinessRegionCfgAction.js'></script>
	<script>
		var isHideToolBar="<%=isHideToolBar%>";
	</script>
</head>

<body style="margin:0px">
	<table id="BusinessQueryForm" class="form_query" style="height: 50px;margin:0px;">
		<tr>
			<td>商户名称：<input type="text" id="BusinessQueryForm:businessname"
				style="width: 100px;"></input> 是否有建集团：<select
				id="BusinessQueryForm:isgroup">
					<option value="">--请选择--</option>
					<option value="0">未建集团</option>
					<option value="1">有建集团</option>
			</select> 集团编号：<input type="text" id="BusinessQueryForm:businesscode"
				style="width: 100px;"></input> <a href="javascript:void(0);"
				class="easyui-linkbutton" icon="icon-search" id="btn_query">查询</a> <a
				href="javascript:void(0);" class="easyui-linkbutton" id="btn_reset">重置</a>
			</td>
		</tr>
	</table>
	<div style="margin:0px">
	<table id="BusinessList"></table></div>

	<div id="BusinessDialog"
		style="padding: 0px; width: 850px; height: 250px;margin:0px;">
		<table id="BusinessForm" class="form_table">
			<tr>
				<th style="width: 17%"></th>
				<td style="width: 33%"></td>
				<th style="width: 17%"></th>
				<td style="width: 33%"></td>
			</tr>
			<tr>
				<th><font color="red">*</font>&#160;商户名称：</th>
				<td>
				<input type="hidden" id="BusinessForm:businessid"></input>
				<input type="text" id="BusinessForm:businessname"
					validation="require;maxlen(100)"></input></td>
				<th>联系人：</th>
				<td><input type="text" id="BusinessForm:linkman"
					validation="maxlen(100)"></input></td>
			</tr>
			<tr>
				<th><font color="red">*</font>&#160;是否集团用户：</th>
				<td><select id="BusinessForm:isgroup" validation="require;maxlen(100)">
						<option value="1">是</option>
						<option value="0">否</option>
				</select></td>
				<th>集团编号：</th>
				<td><input type="text" id="BusinessForm:businesscode"
					validation="maxlen(100)"></input></td>
			</tr>
			<tr>
				<th>商户地址：</th>
				<td colspan="3"><input type="text" id="BusinessForm:address"
					validation="maxlen(100)"></input></td>
			</tr>
	<!-- 	<tr>
			<!--  
				<th>状态：</th>
				<td><select id="BusinessForm:status">
						<option value="0">启用</option>
						<option value="1">禁用</option>
				</select></td>
				<th>短信签名：</th>
				<td><input type="text" id="BusinessForm:smslabel"
					validation="maxlen(16)"></input></td>
			</tr>
			<tr>
				<th>管理员用户：</th>
				<td><input type="text" id="BusinessForm:adminuser"
					validation="maxlen(16)"></input></td>
				<th>端口长号：</th>
				<td><input type="text" id="BusinessForm:ecaccessport"
					validation="maxlen(16)"></input></td>
			</tr>-->
			<tr>
				<th>商户成员：</th>
				<td colspan="3"><input type="text" id="BusinessForm:userBusinessCfgList" readonly="readonly" 
					style="width:86%;background-color: #cad0cd"></input>
					<a href="javascript:void(0);" class="easyui-linkbutton" id="select_users_business">选择</a>
				</td>
			</tr>
			<tr>
				<th>商户Logo：</th>
				<td colspan="3">
				<input type="text" id="BusinessForm:logoSrc" style="width: 550px" disabled/>
					<input id="myfile" name="myfile" type="file" onchange="$('#BusinessForm\\:logoSrc').val(this.value);" class="fileUpload" style="width:45px" hidefocus>
					<button type="button" >浏览</button>
		 			<button onclick="fileUpload($('#BusinessForm\\:logoSrc').val(),fileUploadBack,'jpg,gif,png,bmp,jpeg')" type="button" >上传</button>
				</td>
			</tr>
			<tr style="display: none">
				<th>首页地址：</th>
				<td colspan="3">
				<input type="text" id="BusinessForm:homepage"/>
				</td>
			</tr>
			
		</table>
	</div>
	<div id="regionBusinessDialog" style="padding:0px;width:300px;height:400px;">
		<div id="region_tree"></div>
	</div>
</body>
</html>
