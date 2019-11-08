<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setAttribute("home", request.getContextPath());
%>
<html>
  <head>
    <title>公告表管理页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<jsp:include flush='true' page='../common/inc.jsp'></jsp:include>
	<script type='text/javascript' src='${home}/dwr/interface/NoticeCfgAction.js'></script>
	<script type="text/javascript" src="${home}/js/jquery/jquery-form-plugin.js"></script>
	<script type="text/javascript" src="${home}/js/jquery/jquery-validator-plugin.js"></script>
                    <script type="text/javascript" src="${home}/js/date/WdatePicker.js"></script>
	<script type="text/javascript" src="${home}/js/jquery/date-functions.js"></script>
	<jsp:include flush='true' page='NoticeCfg_Manager_js.jsp'></jsp:include>

  </head>
  
  <body style="margin:0px">	
		<table id="NoticeCfgQueryForm" class="form_query" style="height: 50px">
			<tr>
				<td>
					公告标题：<input type="text" id="NoticeCfgQueryForm:newsTitle" style="width:100px;"></input>											
					公告内容：<input type="text" id="NoticeCfgQueryForm:newsContent" style="width:100px;"></input>											
					<a href="javascript:void(0);" class="easyui-linkbutton" icon="icon-search" id="btn_query">查询</a> 
				<a href="javascript:void(0);"class="easyui-linkbutton" id="btn_reset">重置</a>
				</td>
			</tr>
		</table>
		<table id="NoticeCfgList"></table>

	<div id="NoticeCfgDialog" style="padding:0px;width:530px;height:400px;">
		<table id="NoticeCfgForm" class="form_table2" style="height:100%;">
			<tr>
				<th style="width: 17%"><font color="red">*</font>&#160;公告标题：</th>
				<td>	
					<input type="hidden" id="NoticeCfgForm:id"></input>			
					<input type="text" id="NoticeCfgForm:newsTitle" validation="require;maxlen(200)"></input>
				</td>
				</tr>
				<tr>
				<th><font color="red">*</font>&#160;公告内容：</th>
				<td><textarea id="NoticeCfgForm:newsContent" rows="15" 
					validation="require;maxlen(4000)"></textarea></td>
			</tr>			
		</table>
	</div>
</body>
</html>
