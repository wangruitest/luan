<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setAttribute("home", request.getContextPath());
%>
<html>
  <head>
    <title>系统日志管理页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<jsp:include flush='true' page='../common/inc.jsp'></jsp:include>
	<script type='text/javascript' src='${home}/dwr/interface/MonitorAction.js'></script>
	<script type="text/javascript" src="${home}/js/jquery/jquery-form-plugin.js"></script>
	<script type="text/javascript" src="${home}/js/jquery/jquery-validator-plugin.js"></script>
	<script type="text/javascript" src="${home}/js/date/WdatePicker.js"></script>
  	<jsp:include flush='true' page='Monitor_Manager_js.jsp'></jsp:include>

  </head>
  
  <body>
	<table id="MonitorQueryForm" class="form_query" style="height: 50px">
		<tr>
			<td>
				主机IP：<input type="text" id="MonitorQueryForm:hostip" style="width:160px;"></input>											
				主机名：<input type="text" id="MonitorQueryForm:hostname" style="width:160px;"></input>											
				数据获取时间：从&#160;&#160;
				<input type="text" id="MonitorQueryForm:updatetimeFrom" class="Wdate" style="width:160px;" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly"></input>	
				&#160;&#160;到&#160;&#160;
				<input type="text" id="MonitorQueryForm:updatetimeEnd" class="Wdate" style="width:160px;" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly"></input>	
				<a href="javascript:void(0);" class="easyui-linkbutton" icon="icon-search" id="btn_query">查询</a> 
				<a href="javascript:void(0);"class="easyui-linkbutton" id="btn_reset">重置</a>
			</td>
		</tr>
	</table>
	<table id="MonitorList"></table>

	<div id="MonitorDialog" style="padding:0px;width:550px;height:270px;">
		<table id="MonitorForm" class="form_table" style="height: 100%;">
			<tr>
				<th><font color="red">*</font>&#160; 标识：</th>
				<td></td>
			</tr>
			<tr>
				<th>主机IP：</th>
				<td>
				<input type="hidden" id="MonitorForm:id"></input>
				<input type="text" id="MonitorForm:hostip"
					validation="maxlen(50)"></input>
				</td>
			</tr>
			<tr>
				<th>主机名：</th>
				<td><input type="text" id="MonitorForm:hostname"
					validation="maxlen(200)"></input></td>
			</tr>
			<tr>
				<th>CPU空闲率(%)：</th>
				<td><input type="text" id="MonitorForm:cpuidle"
					validation="maxlen(22)"></input></td>
			</tr>
			<tr>
				<th>内存总量(K)：</th>
				<td><input type="text" id="MonitorForm:memtotal"
					validation="maxlen(22)"></input></td>
			</tr>
			<tr>
				<th>可用内存(K)：</th>
				<td><input type="text" id="MonitorForm:memfree"
					validation="maxlen(22)"></input></td>
			</tr>
			<tr>
				<th>所有的磁盘信息：</th>
				<td><input type="text" id="MonitorForm:alldiskinfo"
					validation="maxlen(2000)"></input></td>
			</tr>
			<tr>
				<th>存储率最大硬盘信息(K)：</th>
				<td><input type="text" id="MonitorForm:maxuseddisk"
					validation="maxlen(300)"></input></td>
			</tr>
			<tr>
				<th>所有硬盘IO信息：</th>
				<td><input type="text" id="MonitorForm:allioinfo"
					validation="maxlen(2000)"></input></td>
			</tr>
			<tr>
				<th>IO率最大硬盘信息：</th>
				<td><input type="text" id="MonitorForm:maxusedio"
					validation="maxlen(300)"></input></td>
			</tr>
			<tr>
				<th>数据获取时间：</th>
				<td><input type="text" id="MonitorForm:updatetime"
					validation="maxlen(200)"></input></td>
			</tr>
			<tr>
				<th>网络使用流量：</th>
				<td><input type="text" id="MonitorForm:netkb"
					validation="maxlen(22)"></input></td>
			</tr>
		</table>
	</div>
</body>
</html>
