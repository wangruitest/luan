<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setAttribute("home", request.getContextPath());
%>
<html>
  <head>
    <title>行业类型表管理页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<jsp:include flush='true' page='../common/inc.jsp'></jsp:include>
	<script type='text/javascript' src='${home}/dwr/interface/IndustryAction.js'></script>
	<script type="text/javascript" src="${home}/js/jquery/jquery-form-plugin.js"></script>
	<script type="text/javascript" src="${home}/js/jquery/jquery-validator-plugin.js"></script>
    	<jsp:include flush='true' page='Industry_Manager_js.jsp'></jsp:include>

  </head>
  
  <body>	
		<table id="IndustryQueryForm" class="form_query" style="height: 50px">
			<tr>
				<td>
								行业类型名：<input type="text" id="IndustryQueryForm:typename" style="width:100px;"></input>											
								<a href="javascript:void(0);" class="easyui-linkbutton" icon="icon-search" id="btn_query">查询</a> 
				<a href="javascript:void(0);"class="easyui-linkbutton" id="btn_reset">重置</a>
				</td>
			</tr>
		</table>
		<table id="IndustryList"></table>

	<div id="IndustryDialog" style="padding:0px;width:400px;height:200px;">
		<table id="IndustryForm" class="form_table" style="height:100%;">
		<input type="hidden" id="IndustryForm:industryid"></input>
						  <tr>
					<th>
												<font color="red">*</font>行业类型名：</th>
					<td>
												<input type="text" id="IndustryForm:typename" style="width:250px;" validation="require;maxlen(100)"></input>
											</td>
				</tr>
					</table>
	</div>
</body>
</html>
