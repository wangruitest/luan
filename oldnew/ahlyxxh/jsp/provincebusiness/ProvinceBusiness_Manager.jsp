<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setAttribute("home", request.getContextPath());
%>
<html>
  <head>
    <title>商户信息管理页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<jsp:include flush='true' page='../common/inc.jsp'></jsp:include>
	<script type='text/javascript' src='${home}/dwr/interface/ProvinceBusinessAction.js'></script>
	<script type="text/javascript" src="${home}/js/jquery/jquery-form-plugin.js"></script>
	<script type="text/javascript" src="${home}/js/jquery/jquery-validator-plugin.js"></script>
                                            <script type="text/javascript" src="${home}/js/date/WdatePicker.js"></script>
	<script type="text/javascript" src="${home}/js/jquery/date-functions.js"></script>
	<jsp:include flush='true' page='ProvinceBusiness_Manager_js.jsp'></jsp:include>
  </head>
  
  <body>	
		<table id="ProvinceBusinessQueryForm" class="form_query" style="height: 50px">
			<tr>
				<td>
					商户名字：<input type="text" id="ProvinceBusinessQueryForm:businessname" style="width:100px;"></input>											
					归属地市：<select  id="ProvinceBusinessQueryForm:cityCode">
								<option value="">--请选择--</option>
								<option value="591">福州</option>
								<option value="592">厦门</option>
								<option value="593">宁德</option>
								<option value="594">莆田</option>
								<option value="595">泉州</option>
								<option value="596">漳州</option>
								<option value="597">龙岩</option>
								<option value="598">三明</option>
								<option value="599">南平</option>
							</select>					
					<a href="javascript:void(0);" class="easyui-linkbutton" icon="icon-search" id="btn_query">查询</a> 
				<a href="javascript:void(0);"class="easyui-linkbutton" id="btn_reset">重置</a>
				</td>
			</tr>
		</table>
		<table id="ProvinceBusinessList"></table>

	<div id="ProvinceBusinessDialog" style="padding:10px;width:850px;height:400px;">
		<table id="ProvinceBusinessForm" class="form_table1" style="height:95%;">
				<tr>
					<th></th>
					<td>
						<input type="hidden" id="ProvinceBusinessForm:businessid"></input>
					</td>
				</tr>
				<tr>
					<th><font color="red">*</font>&#160;商户名字：</th>
					<td>
						<input type="text" id="ProvinceBusinessForm:businessname" validation="require;maxlen(100)" style="background-color: #cad0cd" readonly="readonly"></input>
					</td>
					<th><font color="red">*</font>&#160;归属地市：</th>
					<td>
						<select  id="ProvinceBusinessForm:cityCode" style="background-color: #cad0cd" disabled="disabled">
								<option value="">--请选择--</option>
								<option value="591">福州</option>
								<option value="592">厦门</option>
								<option value="593">宁德</option>
								<option value="594">莆田</option>
								<option value="595">泉州</option>
								<option value="596">漳州</option>
								<option value="597">龙岩</option>
								<option value="598">三明</option>
								<option value="599">南平</option>
							</select>
<!-- 						<input type="text" id="ProvinceBusinessForm:cityCode" validation="require;maxlen(5)" style="background-color: #cad0cd" readonly="readonly"></input>
 -->					</td>
				</tr>
				<tr>
					<td colspan="4">
						<div class="easyui-tabs" style="width:800px;height:270px">
							<div title="常用区域配置" style="padding:0px">
								<table id="OftenUsedAreaCfgList"></table>
							</div>
							<div title="所属网关配置" style="padding:0px">
								<table id="PrGwCfgList"></table>
							</div>
						</div>
					</td>
				</tr>
		</table>
	</div>
</body>
</html>
