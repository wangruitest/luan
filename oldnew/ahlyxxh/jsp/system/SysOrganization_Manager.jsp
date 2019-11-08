<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setAttribute("home", request.getContextPath());
%>
<html>
  <head>
    <title>组织管理页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<jsp:include flush='true' page='../common/inc.jsp'></jsp:include>
	<script type='text/javascript' src='${home}/dwr/interface/SysOrganizationAction.js'></script>
	<script type="text/javascript" src="${home}/js/jquery/jquery-form-plugin.js"></script>
	<script type="text/javascript" src="${home}/js/jquery/jquery-validator-plugin.js"></script>
        	<jsp:include flush='true' page='SysOrganization_Manager_js.jsp'></jsp:include>

  </head>
  
  <body>	
		<table id="SysOrganizationQueryForm" class="form_query" style="height: 50px">
			<tr>
				<td>
								标识：<input type="text" id="SysOrganizationQueryForm:unid" style="width:100px;"></input>											
								组织编号：<input type="text" id="SysOrganizationQueryForm:code" style="width:100px;"></input>											
								名称：<input type="text" id="SysOrganizationQueryForm:name" style="width:100px;"></input>											
								父级标识：<input type="text" id="SysOrganizationQueryForm:parentUnid" style="width:100px;"></input>											
								<a href="javascript:void(0);" class="easyui-linkbutton" icon="icon-search" id="btn_query">查询</a> 
				<a href="javascript:void(0);"class="easyui-linkbutton" id="btn_reset">重置</a>
				</td>
			</tr>
		</table>
		<table id="SysOrganizationList"></table>

	<div id="SysOrganizationDialog" style="padding:0px;width:550px;height:270px;">
		<table id="SysOrganizationForm" class="form_table" style="height:100%;">
						  <tr>
					<th>
												标识：</th>
					<td>
												<input type="text" id="SysOrganizationForm:unid" validation="maxlen(32)"></input>
											</td>
				</tr>
						  <tr>
					<th>
												组织编号：</th>
					<td>
												<input type="text" id="SysOrganizationForm:code" validation="maxlen(16)"></input>
											</td>
				</tr>
						  <tr>
					<th>
												名称：</th>
					<td>
												<input type="text" id="SysOrganizationForm:name" validation="maxlen(128)"></input>
											</td>
				</tr>
						  <tr>
					<th>
												父级标识：</th>
					<td>
												<input type="text" id="SysOrganizationForm:parentUnid" validation="maxlen(32)"></input>
											</td>
				</tr>
					</table>
	</div>
</body>
</html>
