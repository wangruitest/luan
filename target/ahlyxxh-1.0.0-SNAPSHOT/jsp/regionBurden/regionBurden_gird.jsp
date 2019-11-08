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
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=vsemGPTjudgYoDhNs0kwE8mk"></script>
 <script src="<%=request.getContextPath()%>/js/map/baidurb.js" type="text/javascript"></script>

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
	var nowCityCode=mapcitycode;
	var nowCityName="";
	var oldCityName="";
	var imgIcons=['<%=request.getContextPath()%>/daping/images/green.png','<%=request.getContextPath()%>/daping/images/blue.png',
	              '<%=request.getContextPath()%>/daping/images/yellow.png','<%=request.getContextPath()%>/daping/images/orange.png'];
		var aRegionInfo = [];
		$(document).ready(function() {
			$('#dataTable').height($(document).height() - 145);
			$('#mapDiv').width($(document).width() - 440);
			$('#mapDiv').height($(document).height() - 145);
			oldCityName=$("#cityList").find("option:selected").text();
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
					if(data.returnList[i]['cityid'] != '340000'){
						$("#cityList").append("<option value='"+data.returnList[i]['cityid']+"'>"+data.returnList[i]['name']+"</option>");
						if(isLoad){
							reginChangeCity(data.returnList[i]['cityid']);
							isLoad=false;
						}
					}
				}
			});
			//initMap();
		});
		
		function showInfo(regionId) {
			regionInit(regionId);
		}
		
		function initAllRegion() {
			rb.initAllRegion(aRegionInfo);
		}
		
		function reginChangeCity(cityCode){
			mapcitycode=cityCode;
			$("#mapDiv").html("");
			$("#mapToolDiv").html("");
			var checkText=$("#cityList").find("option:selected").text();
			//checkText=
			cityName=checkText=="全部"?"安徽省":checkText;
			nowCityName=checkText;
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
					initMap(aRegionInfo,cityName);
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