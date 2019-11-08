<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.funo.utils.Constants"%>
<%@page import="com.funo.system.model.SysOperator"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%
	String curCityCode = request.getParameter("cityCode");
	
%>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<jsp:include flush='true' page='../jsp/common/inc.jsp'></jsp:include>
<link href="<%=request.getContextPath()%>/css/rlt/timeBar.css"
	rel="stylesheet" type="text/css" />
<script type='text/javascript'
	src='<%=request.getContextPath()%>/dwr/interface/RegionCoordsAction.js'></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery/jquery-form-plugin.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery/jquery-validator-plugin.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/date/WdatePicker.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery/date-functions.js"></script>
<script src="<%=request.getContextPath()%>/js/map/timeProgressBar.js"
	type="text/javascript"></script>
<title>地市景区区域</title>
</head>
<body>
	<style type="text/css">
body, html, #allmap {
	width: 100%;
	height: 100%;
	overflow: hidden;
	margin: 0;
}
</style>
	<script type="text/javascript"
		src="http://api.map.baidu.com/api?v=2.0&ak=vsemGPTjudgYoDhNs0kwE8mk"></script>
	<script type="text/javascript"
		src="http://api.map.baidu.com/library/Heatmap/2.0/src/Heatmap_min.js"></script>
	<script src="../js/map/baiduMap.js" type="text/javascript"></script>

	<script type="text/javascript">
var aRegionInfo = [];
var mapcitycode = <%=curCityCode%>;

var cityName={340100:"合肥市",340200:"芜湖市",340300:"蚌埠市",340400:"淮南市",340500:"马鞍山市",340600:"淮北市",
  		340700:"铜陵市",340800:"安庆市",341000:"黄山市",341100:"滁州市",341200:"阜阳市",341300:"宿州市",
  		341500:"六安市",341600:"亳州市",341700:"池州市",341800:"宣城市"};
var  aCenterPoint = {// 各地市的市中心位置
        340100 : new BMap.Point(117.233592, 31.82672), // 合肥
        340200 : new BMap.Point(118.43955, 31.358825), // 芜湖
        340300 : new BMap.Point(117.395863, 32.921631), // 蚌埠
        340400 : new BMap.Point(116.984596, 32.628679), // 淮南
        340500 : new BMap.Point(118.520195, 31.67681), // 马鞍山
        340600 : new BMap.Point(116.804647, 33.963341), // 淮北
        340700 : new BMap.Point(117.818511, 30.951581), // 铜陵
        340800 : new BMap.Point(117.121138, 30.539035), // 安庆
        341000 : new BMap.Point(118.343696, 29.720918),//黄山
		341100 : new BMap.Point(118.33978, 32.261723), // 滁州
		341200 : new BMap.Point(115.820572, 32.896378), // 阜阳
		341300 : new BMap.Point(116.970717, 33.652072), // 宿州
		341500 : new BMap.Point(116.526047, 31.741413), // 六安
		341600 : new BMap.Point(115.785196, 33.850588), // 亳州
		341700 : new BMap.Point(117.497834, 30.670997), // 池州
		341800 : new BMap.Point(118.765648, 30.946564) // 宣城
    };

var imgIcons=['<%=request.getContextPath()%>/daping/images/green.png','<%=request.getContextPath()%>/daping/images/blue.png',
              '<%=request.getContextPath()%>/daping/images/yellow.png','<%=request.getContextPath()%>/daping/images/orange.png'];

var opts=[{
 			strokeColor:"green",    //边线颜色。
            fillColor:"green",      //填充颜色。当参数为空时，圆形将没有填充效果。
            strokeWeight: 3,       //边线的宽度，以像素为单位。
            strokeOpacity: 0.8,    //边线透明度，取值范围0 - 1。
            fillOpacity: 0.6,      //填充的透明度，取值范围0 - 1。
            strokeStyle: 'solid'
 			},{
 	            strokeColor:"blue",    //边线颜色。
 	            fillColor:"blue",      //填充颜色。当参数为空时，圆形将没有填充效果。
 	            strokeWeight: 3,       //边线的宽度，以像素为单位。
 	            strokeOpacity: 0.8,    //边线透明度，取值范围0 - 1。
 	            fillOpacity: 0.6,      //填充的透明度，取值范围0 - 1。
 	            strokeStyle: 'solid'}
 			,{strokeColor:"yellow",    //边线颜色。
            fillColor:"yellow",      //填充颜色。当参数为空时，圆形将没有填充效果。
            strokeWeight: 3,       //边线的宽度，以像素为单位。
            strokeOpacity: 0.8,    //边线透明度，取值范围0 - 1。
            fillOpacity: 0.6,      //填充的透明度，取值范围0 - 1。
            strokeStyle: 'solid'},{
            strokeColor:"orange",    //边线颜色。
            fillColor:"orange",      //填充颜色。当参数为空时，圆形将没有填充效果。
            strokeWeight: 3,       //边线的宽度，以像素为单位。
            strokeOpacity: 0.8,    //边线透明度，取值范围0 - 1。
            fillOpacity: 0.6,      //填充的透明度，取值范围0 - 1。
            strokeStyle: 'solid'},{
                strokeColor:"red",    //边线颜色。
                fillColor:"red",      //填充颜色。当参数为空时，圆形将没有填充效果。
                strokeWeight: 3,       //边线的宽度，以像素为单位。
                strokeOpacity: 0.8,    //边线透明度，取值范围0 - 1。
                fillOpacity: 0.6,      //填充的透明度，取值范围0 - 1。
                strokeStyle: 'solid'}];    
    
var map;
var heatmapOverlay= new BMapLib.HeatmapOverlay({"radius":40});
var gsheatmapOverlay= new BMapLib.HeatmapOverlay({"radius":20});
var datas =[];
var runId;
var runs=0;

function initialize() {
  // 百度地图API功能
//  setRegions();
  map = new BMap.Map("map_canvas");
  map.addControl(new BMap.NavigationControl());               // 添加平移缩放控件
  map.addControl(new BMap.ScaleControl());                    // 添加比例尺控件
  map.addControl(new BMap.OverviewMapControl());              //添加缩略地图控件
  map.enableScrollWheelZoom();                            //启用滚轮放大缩小
 // map.addControl(new BMap.MapTypeControl()); 
  var point = aCenterPoint[mapcitycode];   // 创建点坐标
  map.centerAndZoom(point,13);  
//  map.addOverlay(gsheatmapOverlay);
//  getBoundary(map,cityName[mapcitycode]);
  setRegions();
  initMapData();
}

function initMapData(){
	
	setInterval('setRegions()', refreshTime);
}

 /* function eventClick(e){//中心点事件
			
			//var marker = new BMap.Marker(new BMap.Point(e.point.lng, e.point.lat));
			var count =parseInt(Math.random()*100);
			var obj={};
			obj.lng=e.point.lng;
			obj.lat=e.point.lat;
			obj.count = count;
			
			//alert(obj);
			datas.push(obj);
			//alert(heatmapOverlay);
			map.addOverlay(heatmapOverlay);
			heatmapOverlay.setDataSet({data:datas,max:100});
			//heatmapOverlay.show();
			//alert(JSON.stringify(heatmapOverlay));
		}
*/
function dfregion(regionInfo){
	var path = [];
	if(regionInfo.aRegionCoords != null){//绘制景区范围
		if(regionInfo.aRegionCoords.length > 2){
        	for ( var i in regionInfo.aRegionCoords) {
           	 path.push(new BMap.Point(
                    regionInfo.aRegionCoords[i].lng,
                    regionInfo.aRegionCoords[i].lat));
        	}
		}
	var polygon = new BMap.Polygon(path,opts[regionInfo.colorIndex]);
	map.addOverlay(polygon); 
	}
}
function setRegions(){
	map.clearOverlays(); 
	var myRegionIds="";
	getBoundary(map,cityName[mapcitycode]);
	dwr.engine.setAsync(false);
	RegionCoordsAction.getAllRegionInfoByCityDayView(mapcitycode,function(data){
		//if(null==data || null==data.returnList)return;
		aRegionInfo = data;
		//alert(JSON.stringify(data));
		for(var i=0;i<data.length;i++){
  			dfregion(data[i]);
  		//	showInfoWiondow(data[i]);
  			var sContent = "<div>" 
                + "<p>景区："  
                + data[i].regionName + "</p><p>在园人数:" +data[i].atNum +"</p></div>"; 
  			addMark(data[i],sContent);
  		}
	});
	
	dwr.engine.setAsync(true);
}

function showInfoWiondow(regionInfo){
//	map.closeInfoWindow();
//	var regionInfo = alltrs[index];
	var content = regionInfo.regionName + "<hr/><div style='font-size:12px'>";
	var lnglat = {};
	if(regionInfo.lat != null) {
		lnglat = new BMap.Point(regionInfo.lng, regionInfo.lat);
	} else {
		lnglat = aCenterPoint[mapcitycode];
		content += "<font color='red'><b>注：</b>景区尚未绘制，位置可能有误。<br/></font>";
	}
	var optes={
		width:150,     // 信息窗口宽度
		height:50     // 信息窗口高度
	};
	var infoWindow = new BMap.InfoWindow(content,optes);
	map.openInfoWindow(infoWindow, lnglat);
}

function addMark(regionInfo,info_html){
	
	//var lnglat = {};
	if(regionInfo.lat != null) {
		var lnglat = new BMap.Point(regionInfo.lng, regionInfo.lat);
		var _marker;
		if(regionInfo.colorIndex>=imgIcons.length){
			_marker=new BMap.Marker(lnglat);
		}else{
		var myIcon =new BMap.Icon(imgIcons[regionInfo.colorIndex], new BMap.Size(23, 25), {
								// 指定定位位置。   
								// 当标注显示在地图上时，其所指向的地理位置距离图标左上    
								// 角各偏移10像素和25像素。您可以看到在本例中该位置即是   
								// 图标中央下端的尖角位置。    
								offset : new BMap.Size(0, 0),
							// 设置图片偏移。   
							// 当您需要从一幅较大的图片中截取某部分作为标注图标时，您   
							// 需要指定大图的偏移位置，此做法与css sprites技术类似。    
								imageOffset: new BMap.Size(0,0)   // 设置图片偏移    
							});
					_marker = new BMap.Marker(lnglat, {icon : myIcon});
				}
				map.addOverlay(_marker);
				//		_marker.addEventListener("click", function(e) {
				//            this.openInfoWindow(new BMap.InfoWindow(info_html));  
				//       });
				_marker.addEventListener("mouseover", function(e) {
					this.openInfoWindow(new BMap.InfoWindow(info_html));
					//  this.setTitle("景区:"+regionInfo.regionName);  
				});
			}
		}
		
//绘制行政quyu
function getBoundary(map,cityName){    
	
	//alert(map+"----------------->"+cityName);
	var bdary = new BMap.Boundary();
	bdary.get(cityName, function(rs){       //获取行政区域
		//alert(rs);
		//map.clearOverlays();        //清除地图覆盖物       
		var count = rs.boundaries.length; //行政区域的点有多少个
		if (count === 0) {
			alert('未能获取当前输入行政区域');
			return ;
		}
      	var pointArray = [];
		for (var i = 0; i < count; i++) {
			var ply = new BMap.Polygon(rs.boundaries[i], {strokeWeight: 2, strokeColor: "blue", 
				strokeOpacity:0.0, fillOpacity: 0.0, fillColor: "none"}); //建立多边形覆盖物
			map.addOverlay(ply);  //添加覆盖物
			pointArray = pointArray.concat(ply.getPath());
		}    
		map.setViewport(pointArray);    //调整视野                 
	});   
}

		function play() {

			var stop = document.getElementById("stop");
			var start = document.getElementById("start");
			stop.style.display = "";
			start.style.display = "none";
			//show.innerHTML=JSON.stringify(datas);
			runId = window.setInterval(run, 2000);
		}

		function stop() {

			var stop = document.getElementById("stop");
			var start = document.getElementById("start");
			stop.style.display = "none";
			start.style.display = "";
			//show.innerHTML=JSON.stringify(datas);
			window.clearInterval(runId);
		}

		function run() {
			if (runs >= 5) {
				runs = 0;
			}

			gsheatmapOverlay.setDataSet({
				data : rld[runs],
				max : 100
			});
			runs++;
		}
	</script>
	</head>
	<body onLoad="initialize()">
		<div id="map_canvas" style="width: 100%; height: 100%;"></div>
		<!--  
  <div id="time-panel" class="time-panel-hour" style="display: block;">
	
<div class="time-panel-title">
		
<span class="time-panel-date"></span>
<span class="time-panel-time"></span>
	
</div>
	
<div class="time-panel-control">
	
<div class="time-panel-progress-container">
		
<div class="time-panel-progress-bar">
		
<span class="time-panel-progress" style="left: 2px;"></span>
		
</div>
			
<div class="time-panel-progress-text"></div>
	
</div>
		
<div class="time-panel-btn play" isplaying="true"></div>
	
</div>-->

		</div>
	</body>
</html>
