<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.funo.utils.Constants"%>
<%@page import="com.funo.system.model.SysOperator"%>
<%
	request.setAttribute("home", request.getContextPath());
	SysOperator user = null;
    if(request.getSession() != null && request.getSession().getAttribute(Constants.Session_Attribute_UserEnv) != null){
    	user = (SysOperator)request.getSession().getAttribute(Constants.Session_Attribute_UserEnv);
    }
    String userUnid=user.getUnid();
%>
<html>
  <head>
    <title>景区信息配置</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<jsp:include flush='true' page='../common/inc.jsp'></jsp:include>
	<script type='text/javascript' src='${home}/dwr/interface/RegionCfgAction.js'></script>
	<script type='text/javascript' src='${home}/dwr/interface/RegionTypeCfgAction.js'></script>
	<script type="text/javascript" src="${home}/js/jquery/jquery-form-plugin.js"></script>
	<script type="text/javascript" src="${home}/js/jquery/jquery-validator-plugin.js"></script>
    <script type="text/javascript" src="${home}/js/date/WdatePicker.js"></script>
	<script type="text/javascript" src="${home}/js/jquery/date-functions.js"></script>
	<jsp:include flush='true' page='RegionCfg_Manager_js.jsp'></jsp:include>
	<script type="text/javascript">
	$(function(){
	   var userUnidFlag = "<%=userUnid%>";
		if(userUnidFlag=="99999"){
		     $("#RegionCfgForm\\:id").removeAttr('disabled');
		}else{
		     $("#RegionCfgForm\\:id").addAttr('disabled','disabled');
		}
	});
	</script>
  </head>
  
  <body style="margin:0px">	
		<table id="RegionCfgQueryForm" class="form_query" style="height: 50px">
			<tr>
				<td>
					景区名称：<input type="text" id="RegionCfgQueryForm:regionName" style="width:100px;"></input>											
					更新人员：<input type="text" id="RegionCfgQueryForm:updateuser" style="width:100px;"></input>
					重点景区：<select  id="RegionCfgQueryForm:iskey" name="RegionCfgQueryForm:iskey" class="easyui-combobox" style="width:150px;">
			        <option value="">请选择</option>
			        <option value="0">否</option>
			        <option value="1">是</option>
			        </select>											
					<a href="javascript:void(0);" class="easyui-linkbutton" icon="icon-search" id="btn_query">查询</a> 
					<a href="javascript:void(0);"class="easyui-linkbutton" id="btn_reset">重置</a>
				</td>
			</tr>
		</table>
		<table id="RegionCfgList"></table>

		<div id="RegionCfgDialog" style="padding:0px;width:800px;height:250px;">
		<table id="RegionCfgForm" class="form_table1">
		<input type="hidden" id="RegionCfgForm:unid"></input>
		<tr>
				<th></th>
				<td></td>
				<th></th>
				<td></td>
			</tr>
			<tr>
				<th style="width:100px;"><font color="red">*</font>&#160;景区名称：</th>
				<td>
					<input type="text" id="RegionCfgForm:regionName" validation="require;maxlen(30)" style="width: 99%"></input>
				</td>
				<th style="width:100px;"><font color="red">*</font>&#160;序号：</th>
				<td> 
					<input type="text" id="RegionCfgForm:orderNumber" validation="require;maxlen(30)" style="width: 99%"></input>
				</td>
			</tr>
			<tr>
				<th style="width:100px;"><font color="red">*</font>&#160;景区编号：</th>
				<td>
					<input type="text" id="RegionCfgForm:id" disabled='disabled' validation="require;number;maxlen(15,'长度不超过15位的数字')" style="width: 99%"></input>
				</td>
				<th style="width:100px;"><font color="red">*</font>&#160;景区级别：</th>
				<td>
					<select id="RegionCfgForm:aLevel" style="width:100px;">
					<option value="5">AAAAA级</option>
					<option value="4">AAAA级</option>
					<option value="3">AAA级</option>
					<option value="2">AA级</option>
					<option value="1">A级</option>
					</select>
				</td>
			</tr>
			<tr>
				<th><font color="red">*</font>&#160;景区类型：</th>
				<td >
					<select id="RegionCfgForm:typeid" style="width:100px;">
					<option value="4">景点</option>
					</select>
					
				</td>
				<th><font color="red">*</font>&#160;景区城市：</th>
				<td>
					<select id="RegionCfgForm:cityCode" style="width:100px;" onchange="initCountyList()">
					<option value="340100">合肥市</option>
					<option value="340200">芜湖市</option>
					<option value="340300">蚌埠市</option>
					<option value="340400">淮南市</option>
					<option value="340500">马鞍山市</option>
					<option value="340600">淮北市</option>
					<option value="340700">铜陵市</option>
					<option value="340800">安庆市</option>
					<option value="341000">黄山市</option>
					<option value="341100">滁州市</option>
					<option value="341200">阜阳市</option>
					<option value="341300">宿州市</option>
					<option value="341500">六安市</option>
					<option value="341600">亳州市</option>
					<option value="341700">池州市</option>
					<option value="341800">宣城市</option>
					</select>
				 <select id="RegionCfgForm:countyCode" name="countyCode" style="width: 100px"></select>
				</td>
			</tr>
			<tr>
				<th><font color="red">*</font>&#160;重点景区：</th>
				<td >

				<select id="RegionCfgForm:iskey" style="width:100px;">
					<option value="0">否</option>
					<option value="1">是</option>
				</select>

				</td>
				
			</tr>
			<tr>
				<th><font color="red">*</font>&#160;畅通人数：</th>
				<td >

					<input type="text" id="RegionCfgForm:expediteValue"  validation="require;maxlen(10);integer;min(0)" style="width: 99%"></input>

				</td>
				<th><font color="red">*</font>&#160;拥挤人数：</th>
				<td >


					<input type="text" id="RegionCfgForm:jamValue" validation="require;maxlen(10);integer;min(0)" style="width: 99%"></input>

				</td>
			</tr>
			<!-- 
			<tr>
				<th style="width:100px;">包含小区：</th>
				
				<td colspan="3">
					<table id="Select_CellcfgList" style="width: 99%"></table>
				</td>
			</tr> -->
			<tr>
				<th>备注：</th>
				<td colspan="3">
					<textarea id="RegionCfgForm:notes" rows="2" validation="maxlen(30)" style="width: 99%"></textarea>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
