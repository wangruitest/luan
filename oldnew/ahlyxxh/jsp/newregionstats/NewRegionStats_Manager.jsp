<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.funo.report.charts.ReportConstants"%>
<%
request.setAttribute("home", request.getContextPath());
%>
<html>
	<head>
	    <title>管理页</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<jsp:include flush='true' page='../common/inc.jsp'></jsp:include>
		<jsp:include flush='true' page='../common/file_inc.jsp'></jsp:include>
		<script type='text/javascript' src='${home}/dwr/interface/NewRegionStatsAction.js'></script>
		<script type="text/javascript" src="${home}/js/jquery/jquery-form-plugin.js"></script>
		<script type="text/javascript" src="${home}/js/jquery/jquery-validator-plugin.js"></script>
	    <script type="text/javascript" src="${home}/js/date/WdatePicker.js"></script>
		<script type="text/javascript" src="${home}/js/jquery/date-functions.js"></script>
		<script type="text/javascript" src ="${home}/js/common/common.js"></script>
		<jsp:include flush='true' page='NewRegionStats_Manager_js.jsp'></jsp:include>
	</head>
	<style type="text/css"></script>
		.text1{
			padding-left:10px;
			margin-left:17px;
			margin-right:20px;
			margin-top:10px;
			border:1px #CCC solid; 
		}
	</style>
	<body>	
	<table id="NewRegionStatsQueryForm" class="form_query" style="height: 50px">
		<tr>
			<td>
				所属地市:<select style="width: 100px" id="NewRegionStatsQueryForm:cityCode">
					<option value=""></option>
					<option value="591">福州市</option>
					<option value="592">厦门市</option>
					<option value="593">宁德市</option>
					<option value="594">莆田市</option>
					<option value="595">泉州市</option>
					<option value="596">漳州市</option>
					<option value="597">龙岩市</option>
					<option value="598">三明市</option>
					<option value="599">南平市</option>
				</select>
				游客类型:<select id="NewRegionStatsQueryForm:touristtype" style="width:100px;">
						<option value="2">全部游客</option>
						<option value="0">本地游客</option>
						<option value="1">外地游客</option>
				</select>	
				查询方式:<select style="width: 100px" id="searchtype" name="searchtype"  onchange="toSearchTypeChange()">
					<option value="y">按年份统计</option>
					<option value="q">按季度统计</option>
					<option value="m">按月份统计</option>
					<option value="d">按天数统计</option>
				</select>
				<a href="javascript:void(0);" class="easyui-linkbutton" icon="icon-search" id="btn_query">查询</a> 
			</td>
		</tr>
		<!-- 年份查询 -->
		<tr id="ySearch">
			<td>
				开始时间:<input type="text" style="width:100px" id="yBeginTime" name="yBeginTime" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy',minDate:'#F{$dp.$D(\'yEndTime\',{y:-10})}',maxDate:'#F{$dp.$D(\'yEndTime\')||\'%y\'}'});" />
				结束时间:<input type="text" style="width:100px" id="yEndTime" name="yEndTime" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy',maxDate:'%y',minDate:'#F{$dp.$D(\'yBeginTime\')}'});" />
			</td>
		</tr>
		<!-- 季度查询 -->
		<tr id="qSearch" style="display: none">
			<td>
				开始时间:<input type="text" style="width:100px" id="qBeginTime" name="qBeginTime" class="Wdate"
						 onfocus="document.getElementById('qEndTime').value=this.value"
						 onclick="WdatePicker({dateFmt:'yyyy',minDate:'#F{$dp.$D(\'qEndTime\',{y:-1})}',maxDate:'#F{$dp.$D(\'qEndTime\')||\'%y\'}'});" />
						<select id="qQuarterBegin" name="qQuarterBegin">
							<option selected="selected" value="1">第一季度</option>
							<option value="2">第二季度</option>
							<option value="3">第三季度</option>
							<option value="4">第四季度</option>
						</select>
				结束时间:<input type="text" style="width:100px" id="qEndTime" name="qEndTime" class="Wdate" 
						onclick="WdatePicker({dateFmt:'yyyy',maxDate:'#F{($dp.$D(\'qBeginTime\',{y:0}))}',minDate:'#F{$dp.$D(\'qBeginTime\')}'});" />
						<select id="qQuarterEnd" name="qQuarterEnd">
							<option selected="selected" value="1">第一季度</option>
							<option value="2">第二季度</option>
							<option value="3">第三季度</option>
							<option value="4">第四季度</option>
						</select>
			</td>
		</tr>
		<!-- 月份查询 -->
		<tr id="mSearch" style="display: none">
			<td>
				开始时间:<input type="text" style="width:100px" id="mBeginTime" name="mBeginTime" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM',minDate:'#F{$dp.$D(\'mEndTime\',{M:-10})}',maxDate:'#F{$dp.$D(\'mEndTime\')||\'%y-%M\'}'});" />
				结束时间:<input type="text" style="width:100px" id="mEndTime" name="mEndTime" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM',maxDate:'%y-%M',minDate:'#F{$dp.$D(\'mBeginTime\')||\'%y-%M\'}'});" />
			</td>
		</tr>
		<!-- 天数查询 -->
		<tr id="dSearch" style="display: none">
			<td>
				开始时间:<input type="text" style="width:100px" id="dBeginTime" name="dBeginTime" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'dEndTime\',{d:-10})}',maxDate:'#F{$dp.$D(\'dEndTime\')||\'%y-%M-%d\'}'});" />
				结束时间:<input type="text" style="width:100px" id="dEndTime" name="dEndTime" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'dBeginTime\',{d:5})}',minDate:'#F{$dp.$D(\'dBeginTime\')||\'%y-%M-%d\'}'});" />
			</td>
		</tr>									
	</table>
	<div style="height:430px">
		<div id="tabs" class="easyui-tabs">
			<div id="<%=ReportConstants.COLUMN3D_CHART %>" title="柱状图">
				<div class="text1">
				 	<ul>
				 		<li style="color: #6a6b6c">根据全市所有景区的游客数量进行统计排行。</li>
				 	</ul>
				</div>
				<div id="<%=ReportConstants.COLUMN3D_CHART %>0"></div>
			</div>
		
			<div id="<%=ReportConstants.PIE3D_CHART %>" title="饼状图">
				<div class="text1">
				 	<ul>
				 		<li style="color: #6a6b6c">根据全市所有景区的游客数量进行统计排行。</li>
				 	</ul>
				</div>
				<div id="<%=ReportConstants.PIE3D_CHART %>0"></div>
			</div>
			<div id="grid" title="数据列表">
				<div class="text1">
				 	<ul>
				 		<li style="color: #6a6b6c">根据全市所有景区的游客数量进行统计排行。</li>
				 	</ul>
				</div>
				<div id="gridboxdiv" style="margin-left: 16px;margin-top:10px">
					<table id="gridbox"></table>
				</div>
				<div id="paging_toolbar"></div>
			</div>
		</div>
	</div>
</body>
</html>
