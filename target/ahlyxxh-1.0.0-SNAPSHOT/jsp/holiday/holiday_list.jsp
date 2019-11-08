<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setAttribute("home", request.getContextPath());
%>
<html>
  <head>
    <title>假日表管理页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<jsp:include flush='true' page='../common/inc.jsp'></jsp:include>
	<script type='text/javascript' src='${home}/dwr/interface/HolidayAction.js'></script> 
	<script type="text/javascript" src="${home}/js/jquery/jquery-form-plugin.js"></script>
	<script type="text/javascript" src="${home}/js/jquery/jquery-validator-plugin.js"></script>
	<script type="text/javascript" src="${home}/js/date/WdatePicker.js"></script>
	<script type="text/javascript" src="${home}/js/jquery/date-functions.js"></script>
	<jsp:include flush='true' page='holiday_list_js.jsp'></jsp:include>

  </head>
  
  <body style="margin:0px">	
		<table id="HolidayQueryForm" class="form_query" style="height: 50px">
			<tr>
				<td>
					节日名称：
			<!-- 	<select  id="HolidayQueryForm:holidayName" name="HolidayForm:holidayName" class="easyui-combobox" style="width:150px;">
			        <option value="">请选择</option>
			   <option value="元旦">元旦</option>
					<option value="春节">春节</option>
					<option value="清明">清明</option>
					<option value="劳动">劳动</option>
					<option value="端午">端午</option>
					<option value="中秋">中秋</option>
					<option value="国庆">国庆</option>
				</select>-->
			<select  id="HolidayQueryForm:holidayName" name="HolidayQueryForm:holidayName" style="width:150px;"></select> 
					<!--  <input id="HolidayQueryForm:holidayName" style="width:150px;"  placeholder="输入节日名称查询"></input>	-->
					所属年份：<input  type="text" id="HolidayQueryForm:beloneYear"   style="width:150px;" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy'});" readonly="readonly"/>									
					<a href="javascript:void(0);" class="easyui-linkbutton" icon="icon-search" id="btn_query">查询</a> 
				    <a href="javascript:void(0);"class="easyui-linkbutton"  id="btn_reset">重置</a>
				</td>
			</tr>
		</table>
		<table id="HolidayList"></table>

	<div id="HolidayDialog" style="padding:0px;width:400px;height:200px;">
		<table id="HolidayForm" class="form_table2" style="height:100%;">
			   <tr>
				     <th style="width: 20%"><font color="red">*</font>假日名称：</th>
				     <td >
				     <input type="hidden" id="HolidayForm:id"></input>	
				    <select  id="HolidayForm:holidayName"  class="easyui-combobox" style="width:150px;">
					<option value="元旦">元旦</option>
					<option value="春节">春节</option>
					<option value="清明">清明</option>
					<option value="劳动">劳动</option>
					<option value="端午">端午</option>
					<option value="中秋">中秋</option>
					<option value="国庆">国庆</option>
				   </select>
				   可手动添加（例：元旦）
				   <!--   <input  type="text" id="HolidayForm:holidayName" class="easyui-validatebox"  validation="require;maxlen(500)" style="width:150px;" />  -->
				   </td>
				</tr>
				<tr>
				     <th style="width: 20%"><font color="red">*</font>开始日期：</th>
				     <td >
				     <input  type="text" id="HolidayForm:firstDay"   style="width:150px;" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" readonly="readonly"//> 
				   </td>
				</tr>
				<tr>
				     <th style="width: 20%"><font color="red">*</font>结束日期：</th>
				     <td >
				    <input type="text" id="HolidayForm:lastDay"   style="width:150px;" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'HolidayForm:firstDay\')}',onpicking:getHolidayNum()});"   readonly="readonly"/> 
				   </td>
				</tr>
				<tr>
				     <th style="width: 20%"><font color="red">*</font>假期天数：</th>
				     <td >
				  <input id="HolidayForm:holidayDays" class="easyui-numberbox"   min="1" max="100000"  style="width:150px;" required="true" missingMessage="必须填写数字"  readonly="readonly"/> 
				   </td>
				</tr>
			
		</table>
	</div>
</body>
</html>
