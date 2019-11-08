<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setAttribute("home", request.getContextPath());
%>
<html>
  <head>
    <title>外省漫游用户入皖统计</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<jsp:include flush='true' page='../common/inc.jsp'></jsp:include>
	<jsp:include flush='true' page='../common/file_inc.jsp'></jsp:include>
	<script type='text/javascript' src='${home}/dwr/interface/TouristRoamingOutAction.js'></script>
	<script type="text/javascript" src="${home}/js/jquery/jquery-form-plugin.js"></script>
	<script type="text/javascript" src="${home}/js/jquery/jquery-validator-plugin.js"></script>
	<script type="text/javascript" src="${home}/js/date/WdatePicker.js"></script>
	<script type="text/javascript" src="${home}/js/date/cityList.js"></script>
	    <script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/WebLogoCfgAction.js'></script>
	
                    	<jsp:include flush='true' page='TouristRoamingOut_Manager_js.jsp'></jsp:include>

  </head>
  
  <body style="margin:0px">	
		<table id="TouristRoamingOutQueryForm" class="form_query1" style="height: 50px">
			<tr>
				<th align="right" width="120px";>来源地：</th>
				<td valign="middle">
<span class="tdSpan" style="margin-bottom: 3px;"><input name="provinces" type="checkbox" value="110000"/> 北京</span>
					<span class="tdSpan" style="margin-bottom: 3px;"><input name="provinces" type="checkbox" value="120000"/> 天津</span>
					<span class="tdSpan" style="margin-bottom: 3px;"><input name="provinces" type="checkbox" value="130000"/> 河北</span>
					<span class="tdSpan" style="margin-bottom: 3px;"><input name="provinces" type="checkbox" value="140000"/> 山西</span>
					<span class="tdSpan" style="margin-bottom: 3px;"><input name="provinces" type="checkbox" value="210000"/> 辽宁</span>
					<span class="tdSpan" style="margin-bottom: 3px;"><input name="provinces" type="checkbox" value="220000"/> 吉林</span>
					<span class="tdSpan" style="margin-bottom: 3px;"><input name="provinces" type="checkbox" value="310000"/> 上海</span>
					<span class="tdSpan" style="margin-bottom: 3px;"><input name="provinces" type="checkbox" value="320000"/> 江苏</span>
					<span class="tdSpan" style="margin-bottom: 3px;"><input name="provinces" type="checkbox" value="330000"/> 浙江</span>				
					<span class="tdSpan" style="margin-bottom: 3px;"><input name="provinces" type="checkbox" value="350000"/> 福建</span>
					<span class="tdSpan" style="margin-bottom: 3px;"><input name="provinces" type="checkbox" value="360000"/> 江西</span>
					<span class="tdSpan" style="margin-bottom: 3px;"><input name="provinces" type="checkbox" value="370000"/> 山东</span>				
					<span class="tdSpan" style="margin-bottom: 3px;"><input name="provinces" type="checkbox" value="410000"/> 河南</span>
					<span class="tdSpan" style="margin-bottom: 3px;"><input name="provinces" type="checkbox" value="420000"/> 湖北</span>
					<span class="tdSpan" style="margin-bottom: 3px;"><input name="provinces" type="checkbox" value="150000"/> 内蒙古</span>
					<br/>
					<span class="tdSpan" style="margin-bottom: 3px;"><input name="provinces" type="checkbox" value="430000"/> 湖南</span>
					<span class="tdSpan" style="margin-bottom: 3px;"><input name="provinces" type="checkbox" value="440000"/> 广东</span>
					<span class="tdSpan" style="margin-bottom: 3px;"><input name="provinces" type="checkbox" value="450000"/> 广西</span>
					<span class="tdSpan" style="margin-bottom: 3px;"><input name="provinces" type="checkbox" value="460000"/> 海南</span>
					<span class="tdSpan" style="margin-bottom: 3px;"><input name="provinces" type="checkbox" value="500000"/> 重庆</span>
					<span class="tdSpan" style="margin-bottom: 3px;"><input name="provinces" type="checkbox" value="510000"/> 四川</span>
					<span class="tdSpan" style="margin-bottom: 3px;"><input name="provinces" type="checkbox" value="520000"/> 贵州</span>
					<span class="tdSpan" style="margin-bottom: 3px;"><input name="provinces" type="checkbox" value="530000"/> 云南</span>
					<span class="tdSpan" style="margin-bottom: 3px;"><input name="provinces" type="checkbox" value="540000"/> 西藏</span>
					<span class="tdSpan" style="margin-bottom: 3px;"><input name="provinces" type="checkbox" value="610000"/> 陕西</span>
					<span class="tdSpan" style="margin-bottom: 3px;"><input name="provinces" type="checkbox" value="620000"/> 甘肃</span>
					<span class="tdSpan" style="margin-bottom: 3px;"><input name="provinces" type="checkbox" value="630000"/> 青海</span>
					<span class="tdSpan" style="margin-bottom: 3px;"><input name="provinces" type="checkbox" value="640000"/> 宁夏</span>
					<span class="tdSpan" style="margin-bottom: 3px;"><input name="provinces" type="checkbox" value="650000"/> 新疆</span>
					<span class="tdSpan" style="margin-bottom: 3px;"><input name="provinces" type="checkbox" value="230000"/> 黑龙江</span>
				</td>
			</tr>
			<tr>
			<th align="right" width="120px";>目的地：</th>
				<td valign="middle" id="mdd_bar_2"></td>
			</tr>
			<tr>
				<th align="right" width="120px";>统计月份：</th>
				<td>
								<input type="text" style="width:100px"  id="TouristRoamingOutQueryForm:statMonth" name="TouristRoamingOutQueryForm:statMonth" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM',maxDate:'%y-#{%M}'});" readonly="readonly"/>																						
								<a href="javascript:void(0);" class="easyui-linkbutton" icon="icon-search" id="btn_query">查询</a> 
				<a href="javascript:void(0);"class="easyui-linkbutton" id="btn_reset">重置</a>
				<a href="javascript:void(0);"class="easyui-linkbutton" id="btn_exp">导出excel</a>
				</td>
			</tr>
		</table>
		<table id="TouristRoamingOutList"></table>
</body>
</html>
