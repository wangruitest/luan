<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="com.funo.utils.Constants"%>
<%@page import="com.funo.system.model.SysOperator"%>
<%
  SysOperator user = null;
  if(request.getSession() != null && request.getSession().getAttribute(Constants.Session_Attribute_UserEnv) != null){
    user = (SysOperator)request.getSession().getAttribute(Constants.Session_Attribute_UserEnv);
  }
  String curCityCode=(String)user.getOtherParams().get(Constants.CUR_CHOOSE_CITY);
%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <jsp:include flush='true' page='../common/inc.jsp'></jsp:include>
    <script type='text/javascript' src='${home}/dwr/interface/RegionCoordsAction.js'></script>
    <script>
		var mapcitycode = <%=curCityCode%>;
	</script>
    <!-- <script type="text/javascript" src="http://218.207.183.222:8080/maps?v=1.1&key=bf4be0a72f8f4bc8bdfee8c306ab38df"></script>
    <script src="../../js/map/map.js" type="text/javascript"></script>
    <script src="../../js/map/drawRegion.js" type="text/javascript"></script>
     -->
     <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=vsemGPTjudgYoDhNs0kwE8mk"></script>
     <script src="../../js/map/baiduMap.js" type="text/javascript"></script>
    <script type="text/javascript">
      $(document).ready(function() {
     
     	initMap();	
        $('#dataTable').datagrid({
          title : '景区信息列表',
          rownumbers : true,
          singleSelect : true,
          fit : true,
          columns : [ [ {
            field : 'regionName',
            title : '景区名称',
            width : 120,
            resizable : true
          }, {
            field : 'control',
            title : '操作',
            width : 50,
            resizable : false
          } ] ]
        });
        dwr.engine.setAsync(false);
        RegionCoordsAction.getAllRegion(function(data) {
          var result = {
              total : data.length,
              rows : []
          };
          for(var i in data) {
            result.rows.push({
              regionName : "<a href='javascript:void(0)' onclick='showRegionPolygon(\"" + data[i].id + "\")'>" + data[i].regionName + "</a>",
              control : "<a href='javascript:void(0)' onclick='delRegionPolygon(\"" + data[i].id + "\",\"" + data[i].regionName + "\")'>重置</a>"
            });
          }
          $('#dataTable').datagrid('loadData', result);
        });
        dwr.engine.setAsync(true);
      });
      
      function showRegionPolygon(regionid) {
        var regionPolygon = {};
        dwr.engine.setAsync(false);
        RegionCoordsAction.getRegionInfoByRegionId(regionid, function(data){
          regionPolygon = data;
        });
        dwr.engine.setAsync(true);
        initCenter(regionPolygon);
      }
      
      function delRegionPolygon(regionid,regionName) {
        if(!confirm('确定重置景区【' + regionName + '】？')) {
          return;
        }
        dwr.engine.setAsync(false);
        RegionCoordsAction.deleteRegionCoords(regionid, function(data){
          if(data.resultCode == 0) {
            alert('重置成功');
           	RegionCoordsAction.getRegionInfoByRegionId(regionid, function(data){
          	restInit(data);
        	});
            
          } else {
            alert('重置失败');
          }
        });
        dwr.engine.setAsync(true);
      }
      
      function uptRegionLatLng() {

        dwr.engine.setAsync(false);
        RegionCoordsAction.uptRegionLatLng(trp, function(data){
          if(data.resultCode != 0) {
            alert('保存失败');
          }else{
          	$("#savePoint").attr("style","display:none");
			$("#setPoint").attr("style","display:;margin:10px;10px;");
			$("#editPoin").attr("style","display:;margin:10px;10px;");
			map.removeEventListener("click", eventClick);
          }
        });
        dwr.engine.setAsync(true);
      }
      
      function uptRegionCoords(rp) {
        dwr.engine.setAsync(false);
        RegionCoordsAction.uptRegionCoords(rp, function(data){
          if(data.resultCode != 0) {
            alert('保存失败');
          }else{
          	allP=[];
          	$("#savePoint").attr("style","display:none");
			$("#setPoint").attr("style","display:;margin:10px;10px;");
			$("#editPoin").attr("style","display:;margin:10px;10px;");
			$("#delPoin").attr("style","display:none");
			$("#endPoin").attr("style","display:none");
			map.removeEventListener("click", eventGeionClick);
          }
        });
        dwr.engine.setAsync(true);
      }
  	</script>
    <title>景区区域绘制</title>
    <style type="text/css">
    html,body {
    	overflow: hidden;
    }
    div.cell {
      background: url(../../js/map/images/cell.png) no-repeat;
      padding-left: 14px;
      height:16px;
      white-space: nowrap
    }
    div.cell span {
      border: 1px solid #ccc;
      padding: 1px;
      background-color: #fff;
      
    }
    </style>
  </head>
  <body class="easyui-layout" >
    <div data-options="region:'west',split:false,collapsible:false,border:false" style="width:210px;overflow: hidden;">
      <table id="dataTable" class="easyui-datagrid"></table>
    </div>
    <div data-options="region:'center'" style="overflow: hidden;">
      <div id="mapDiv" style="width:100%;height:100%;"></div>
      <div id="mapToolDiv" style="right:10px;top:70px;position:absolute;z-index:100">
      <div style="margin: 10px;10px;"><input type="button"  value="重置地图" onclick="setinit()"/></div>
      <div id="setPoint" style="margin: 10px;10px;"><input type="button"  value="定位中心" onclick="setCenterPoint()"/></div>
      <div id="savePoint" style="display: none;margin:10px;10px;"><input type="button" value="结束定位"  onclick="uptRegionLatLng()"/></div>
      <div id="delPoin" style="display: none;margin: 10px;10px;"><input type="button" value="删除一点" onclick="delPoin()"/></div>
      <div id="editPoin" style="margin: 10px;10px;"><input type="button" value="绘制景区" onclick="editPoin()"/></div>
      <div id="endPoin" style="display: none;margin: 10px;10px;"><input type="button" value="结束绘制" onclick="endPoin()"/></div>
      </div>
    </div>
  </body>
</html>