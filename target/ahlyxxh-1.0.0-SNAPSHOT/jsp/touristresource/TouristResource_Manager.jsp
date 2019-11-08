<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setAttribute("home", request.getContextPath());
%>
<html>
  <head>
    <title>旅游资源管理页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<jsp:include flush='true' page='../common/inc.jsp'></jsp:include>
	<script type='text/javascript' src='${home}/dwr/interface/TouristResourceAction.js'></script>
	<script type="text/javascript" src="${home}/js/jquery/jquery-form-plugin.js"></script>
	<script type="text/javascript" src="${home}/js/jquery/jquery-validator-plugin.js"></script>
                                      <script type="text/javascript" src="${home}/js/date/WdatePicker.js"></script>
	<script type="text/javascript" src="${home}/js/jquery/date-functions.js"></script>
	<jsp:include flush='true' page='TouristResource_Manager_js.jsp'></jsp:include>

  </head>
  
  <body>	
		<table id="TouristResourceQueryForm" class="form_query" style="height: 50px">
			<tr>
				<td>
								省份：<input type="text" id="TouristResourceQueryForm:provinceName" style="width:100px;"></input>											
								修改用户：<input type="text" id="TouristResourceQueryForm:updateUser" style="width:100px;"></input>											
								备注：<input type="text" id="TouristResourceQueryForm:remark" style="width:100px;"></input>											
								<a href="javascript:void(0);" class="easyui-linkbutton" icon="icon-search" id="btn_query">查询</a> 
				<a href="javascript:void(0);"class="easyui-linkbutton" id="btn_reset">重置</a>
				</td>
			</tr>
		</table>
		<table id="TouristResourceList"></table>

	<div id="TouristResourceDialog" style="padding:0px;width:550px;height:270px;">
		<table id="TouristResourceForm" class="form_table" style="height:100%;">
			<input type="hidden" id="TouristResourceForm:id" />
				  <tr>
					<th>
												景区数量：</th>
					<td>
												<input type="text" id="TouristResourceForm:region" validation="maxlen(22)"></input>
											</td>
				</tr>
						  <tr>
					<th>
												5A景区个数：</th>
					<td>
												<input type="text" id="TouristResourceForm:fiveRegion" validation="maxlen(22)"></input>
											</td>
				</tr>
						  <tr>
					<th>
												4A景区个数：</th>
					<td>
												<input type="text" id="TouristResourceForm:fourRegion" validation="maxlen(22)"></input>
											</td>
				</tr>
						  <tr>
					<th>
												3A景区个数：</th>
					<td>
												<input type="text" id="TouristResourceForm:threeRegion" validation="maxlen(22)"></input>
											</td>
				</tr>
						  <tr>
					<th>
												酒店数量：</th>
					<td>
												<input type="text" id="TouristResourceForm:grogshop" validation="maxlen(22)"></input>
											</td>
				</tr>
						  <tr>
					<th>
												5星酒店个数：</th>
					<td>
												<input type="text" id="TouristResourceForm:fiveGrogshop" validation="maxlen(22)"></input>
											</td>
				</tr>
						  <tr>
					<th>
												4星酒店个数：</th>
					<td>
												<input type="text" id="TouristResourceForm:fourGrogshop" validation="maxlen(22)"></input>
											</td>
				</tr>
						  <tr>
					<th>
												3星酒店个数：</th>
					<td>
												<input type="text" id="TouristResourceForm:threeGrogshop" validation="maxlen(22)"></input>
											</td>
				</tr>
						  <tr>
					<th>
												旅行社数量：</th>
					<td>
												<input type="text" id="TouristResourceForm:travelAgency" validation="maxlen(22)"></input>
											</td>
				</tr>
						  <tr>
					<th>
												导游数量：</th>
					<td>
												<input type="text" id="TouristResourceForm:guide" validation="maxlen(22)"></input>
											</td>
				</tr>
						  <tr>
					<th>
												省份：</th>
					<td>
												<input type="text" id="TouristResourceForm:provinceName" validation="maxlen(30)"></input>
											</td>
				</tr>
						  <tr>
					<th>
												备注：</th>
					<td>
												<input type="text" id="TouristResourceForm:remark" validation="maxlen(200)"></input>
											</td>
				</tr>
					</table>
	</div>
	
	
	<div id="TouristResourceViewDialog" style="padding:0px;width:600px;height:370px;">
		<div style="padding-left: 20px; padding-top: 20px">
		<table id="TouristResourceViewForm" class="form_table" style="height:100%;">
			<input type="hidden" id="TouristResourceViewForm:id" />
				  <tr>
					<td>
						<span style="font-size: 18px; font-family: 'SimHei';">景区数量：<span 
						id="TouristResourceViewForm:region"></span>个</span>
					</td>
				</tr>
				<tr>
					<td>
						<br><span style="font-size: 18px">
						其中5A景区<span id="TouristResourceViewForm:fiveRegion"></span>个，4A景区<span 
						id="TouristResourceViewForm:fourRegion"></span>个，3A景区<span 
						id="TouristResourceViewForm:threeRegion"></span>个
						</span>
					</td>
				</tr>
				<tr>
					<td>
						<br><span style="font-size: 18px; font-family: 'SimHei';">酒店数量：<span 
						id="TouristResourceViewForm:grogshop"></span>个</span>
					</td>
				</tr>
				<tr>
					<td>
						<br><span style="font-size: 18px">
						其中5星酒店<span id="TouristResourceViewForm:fiveGrogshop"></span>个，4星酒店<span 
						id="TouristResourceViewForm:fourGrogshop"></span>个，3星酒店<span 
						id="TouristResourceViewForm:threeGrogshop"></span>个
						</span>
					</td>
				</tr>
				<tr>
					<td>
						<br><span style="font-size: 18px; font-family: 'SimHei';">旅行社数量：<span 
						id="TouristResourceViewForm:travelAgency"></span>个</span>					
					</td>
				</tr>
				<tr>
					<td>
						<br><span style="font-size: 18px; font-family: 'SimHei';">导游数量：<span 
						id="TouristResourceViewForm:guide"></span>个</span>							
					</td>
				</tr>
					</table>
		</div>
	</div>
</body>
</html>
