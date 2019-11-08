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
    String curCityCode=(String)user.getOtherParams().get(Constants.CUR_CHOOSE_CITY);
%>
<html style="height: 100%">
<head>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">

<jsp:include flush='true' page='./inc.jsp'></jsp:include>
<script type='text/javascript' src='${home}/dwr/interface/SysMenuAction.js'></script>
<script type='text/javascript' src='${home}/dwr/interface/LoginAction.js'></script>
<script type='text/javascript' src='${home}/dwr/interface/RegionCoordsAction.js'></script>
<script type='text/javascript' src='${home}/dwr/interface/UtilsAction.js'></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery/jquery.cookie.js"></script>

<script type="text/javascript" src="http://218.207.183.222:8080/maps?v=1.1&key=bf4be0a72f8f4bc8bdfee8c306ab38df"></script>


<script>
	var mapcitycode = <%=curCityCode%>;
</script>
<title>景区信息</title>
<style type="text/css">
html,body {
	height: 100%;
	overflow: hidden;
}
</style>
</head>
<body style="height: 100%">
	
	<script type="text/javascript">
		var aRegionInfo = [];
		$(document).ready(function() {
			$('#dataTable').height($(document).height() - 145);
			$('#mapDiv').width($(document).width() - 440);
			$('#mapDiv').height($(document).height() - 145);
			$('#dataTable').datagrid({
				title : '&#160;&#160;<select id="cityList" style="width:80px" onchange="reginChangeCity(this.value)"></select>&#160;&#160;景区在园人数',
				rownumbers : true,
				singleSelect : true,
				width : 200,
				height : $(document).height()-145,
				columns : [ [ {
					field : 'regionName',
					title : '景区名称',
					width : 90,
					resizable : true
				}, {
					field : 'peopleNum',
					title : '在园人数',
					width : 80,
					resizable : true
				} ] ]
			});
			
			/**
			UtilsAction.getMyRegionCfgByOrgCode(mapcitycode,null,function(data){
				if(null==data || null==data.returnList)return;
				for (var i=0;i<data.returnList.length;i++) {
					aRegionInfo = data.returnList;
					var result = {
							total : data.returnList.length,
							rows : []
					};
					for(var i in data.returnList) {
						result.rows.push({
							regionName : "<a href='javascript:void(0)' onclick='showInfo(" + data.returnList[i].regionId + ")'>" + data.returnList[i].regionName + "</a>",
							peopleNum : data.returnList[i].atNum
						});
					}
					$('#dataTable').datagrid('loadData', result);
				}
			});
			*/
			UtilsAction.getMyCitycode(function(data){
				if(null==data || null==data.returnList)return;
				var isLoad=true;
				for (var i=0;i<data.returnList.length;i++) {
					//页面不需要省级，排除
					if(data.returnList[i]['cityid'] != '590'){
						$("#cityList").append("<option value='"+data.returnList[i]['cityid']+"'>"+data.returnList[i]['name']+"</option>");
						if(isLoad){
							reginChangeCity(data.returnList[i]['cityid']);
							isLoad=false;
						}
					}
				}
			});
			
		});
		
		function showInfo(regionId) {
			rb.centerRegion(regionId);
		}
		
		function initAllRegion() {
			rb.initAllRegion(aRegionInfo);
		}
		
		function reginChangeCity(cityCode){
			mapObj.curCityCode=cityCode;
			$("#mapDiv").html("");
			$("#mapToolDiv").html("");
			var myRegionIds="";
			UtilsAction.getMyRegionCfgByOrgCode(cityCode,null,function(data){
				if(null==data || null==data.returnList)return;
				for (var i=0;i<data.returnList.length;i++) {
					myRegionIds+=data.returnList[i].id+",";
				}
				RegionCoordsAction.getAllRegionInfo(myRegionIds,cityCode,function(data){
					aRegionInfo = data;
					var result = {
							total : data.length,
							rows : []
					};
					for(var i in data) {
						result.rows.push({
							regionName : "<a href='javascript:void(0)' onclick='showInfo(" + data[i].regionId + ")'>" + data[i].regionName + "</a>",
							peopleNum : data[i].atNum
						});
					}
					$('#dataTable').datagrid('loadData', result);
					mapObj.core.init();
				});
			});
			
			
			
			//$('#reginChangeCitys').dialog({top:130,left:395});
			//$('#reginChangeCitys').dialog('open');
		}
	</script>
	<div id="leftDiv" style="width: 100px; float: left;">
		<table id="dataTable" class="easyui-datagrid">
		</table>
	</div>
	<div id="mapDiv" style="float: right;border-style:solid;border-width:1pt; border-color:#C1C1C1"></div>
	<div id="mapToolDiv" style="right:10px;top:40px;position:absolute;z-index:100"></div>
</body>
</html>