<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.funo.utils.Constants"%>
<%@page import="com.funo.system.model.SysOperator"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%
String curCityCode= request.getParameter("cityCode");

%>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
	<jsp:include flush='true' page='../jsp/common/inc.jsp'></jsp:include>
	<link href="<%=request.getContextPath() %>/css/rlt/timeBar.css" rel="stylesheet" type="text/css" />
	<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/JqykjdAction.js'></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery/jquery-form-plugin.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery/jquery-validator-plugin.js"></script>
      <script type="text/javascript" src="<%=request.getContextPath()%>/js/date/WdatePicker.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery/date-functions.js"></script>
<script src="<%=request.getContextPath()%>/js/map/timeProgressBar.js" type="text/javascript"></script>
<title>热力图</title>
</head>
<body>
<style type="text/css">
body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;}
</style>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=vsemGPTjudgYoDhNs0kwE8mk"></script>
<script type="text/javascript" src="http://api.map.baidu.com/library/Heatmap/2.0/src/Heatmap_min.js"></script>

<script type="text/javascript">
var map;
var heatmapOverlay= new BMapLib.HeatmapOverlay({"radius":40});
var gsheatmapOverlay= new BMapLib.HeatmapOverlay({"radius":20});
var datas =[];
var runId;
var runs=0;
var gs=[{"lng":119.388805,"lat":26.071341},
{"lng":119.405765,"lat":26.079},
{"lng":119.411802,"lat":26.071081},
{"lng":119.412376,"lat":26.063292},
{"lng":119.409214,"lat":26.054334},
{"lng":119.40519,"lat":26.04927},
{"lng":119.401309,"lat":26.045895},
{"lng":119.393548,"lat":26.041999},
{"lng":119.388949,"lat":26.040831},
{"lng":119.382193,"lat":26.04953},
{"lng":119.381475,"lat":26.054594}];

var jq=[{"lng":119.342359,"lat":26.093446},
{"lng":119.358456,"lat":26.092797},
{"lng":119.367655,"lat":26.093317},
{"lng":119.371176,"lat":26.074236},
{"lng":119.371033,"lat":26.07456},
{"lng":119.369164,"lat":26.071445},
{"lng":119.365643,"lat":26.065928},
{"lng":119.355079,"lat":26.06807},
{"lng":119.349689,"lat":26.067875},
{"lng":119.34509,"lat":26.071899},
{"lng":119.342646,"lat":26.07852},
{"lng":119.342431,"lat":26.086243}];

var rld= new Array([{"lng":119.344824,"lat":26.077085,"count":26},
{"lng":119.349315,"lat":26.076825,"count":25},
{"lng":119.35316,"lat":26.076533,"count":24},
{"lng":119.351328,"lat":26.071698,"count":22},
{"lng":119.347411,"lat":26.072477,"count":27},
{"lng":119.349064,"lat":26.074164,"count":22},
{"lng":119.393814,"lat":26.065701,"count":25},
			  {"lng":119.401072,"lat":26.065636,"count":22},
			  {"lng":119.399491,"lat":26.062325,"count":26},
			  {"lng":119.397766,"lat":26.064597,"count":26},
			  {"lng":119.396185,"lat":26.062715,"count":21},
			  {"lng":119.401934,"lat":26.055574,"count":26},
			  {"lng":119.395898,"lat":26.051809,"count":25},
			  {"lng":119.389502,"lat":26.056872,"count":27},
			  {"lng":119.397335,"lat":26.056548,"count":31},
			  {"lng":119.392951,"lat":26.060832,"count":27},
			  {"lng":119.391658,"lat":26.062585,"count":32},
			  {"lng":119.403875,"lat":26.064337,"count":29},{"lng":119.396832,"lat":26.072808,"count":36},
{"lng":119.403012,"lat":26.074106,"count":22},
{"lng":119.407396,"lat":26.066642,"count":35},
{"lng":119.400785,"lat":26.068654,"count":28},
{"lng":119.393814,"lat":26.065084,"count":45},
{"lng":119.405959,"lat":26.062487,"count":19},
{"lng":119.405096,"lat":26.055022,"count":23},
{"lng":119.39985,"lat":26.06424,"count":29},
{"lng":119.400066,"lat":26.051192,"count":25},
{"lng":119.398341,"lat":26.054373,"count":5},
{"lng":119.397263,"lat":26.06041,"count":28},
{"lng":119.390867,"lat":26.059242,"count":6},
{"lng":119.388065,"lat":26.05684,"count":27},
{"lng":119.389358,"lat":26.049959,"count":24},
{"lng":119.395682,"lat":26.045739,"count":35},
{"lng":119.388424,"lat":26.0447,"count":28},
{"lng":119.391227,"lat":26.069692,"count":21},{"lng":119.353713,"lat":26.083452,"count":25},
{"lng":119.357522,"lat":26.085075,"count":15},
{"lng":119.361978,"lat":26.085464,"count":30},
{"lng":119.367152,"lat":26.083257,"count":27},
{"lng":119.363487,"lat":26.079558,"count":21},
{"lng":119.368805,"lat":26.076572,"count":25},
{"lng":119.362193,"lat":26.074625,"count":36},
{"lng":119.358672,"lat":26.072094,"count":26},
{"lng":119.35472,"lat":26.076897,"count":25},
{"lng":119.353498,"lat":26.078325,"count":29},
{"lng":119.357019,"lat":26.080207,"count":28},
{"lng":119.358097,"lat":26.076443,"count":45},
{"lng":119.34897,"lat":26.075339,"count":16},
{"lng":119.34509,"lat":26.082868,"count":21},
{"lng":119.350839,"lat":26.073262,"count":29}],
			  [{"lng":119.344824,"lat":26.077085,"count":56},
{"lng":119.349315,"lat":26.076825,"count":45},
{"lng":119.35316,"lat":26.076533,"count":44},
{"lng":119.351328,"lat":26.071698,"count":42},
{"lng":119.347411,"lat":26.072477,"count":47},
{"lng":119.349064,"lat":26.074164,"count":42},
{"lng":119.393814,"lat":26.065701,"count":45},
			  {"lng":119.401072,"lat":26.065636,"count":42},
			  {"lng":119.399491,"lat":26.062325,"count":46},
			  {"lng":119.397766,"lat":26.064597,"count":46},
			  {"lng":119.396185,"lat":26.062715,"count":41},
			  {"lng":119.401934,"lat":26.055574,"count":46},
			  {"lng":119.395898,"lat":26.051809,"count":45},
			  {"lng":119.389502,"lat":26.056872,"count":47},
			  {"lng":119.397335,"lat":26.056548,"count":41},
			  {"lng":119.392951,"lat":26.060832,"count":47},
			  {"lng":119.391658,"lat":26.062585,"count":42},
			  {"lng":119.403875,"lat":26.064337,"count":49},{"lng":119.396832,"lat":26.072808,"count":46},
{"lng":119.403012,"lat":26.074106,"count":52},
{"lng":119.407396,"lat":26.066642,"count":35},
{"lng":119.400785,"lat":26.068654,"count":58},
{"lng":119.393814,"lat":26.065084,"count":45},
{"lng":119.405959,"lat":26.062487,"count":19},
{"lng":119.405096,"lat":26.055022,"count":43},
{"lng":119.39985,"lat":26.06424,"count":49},
{"lng":119.400066,"lat":26.051192,"count":45},
{"lng":119.398341,"lat":26.054373,"count":5},
{"lng":119.397263,"lat":26.06041,"count":88},
{"lng":119.390867,"lat":26.059242,"count":6},
{"lng":119.388065,"lat":26.05684,"count":67},
{"lng":119.389358,"lat":26.049959,"count":44},
{"lng":119.395682,"lat":26.045739,"count":35},
{"lng":119.388424,"lat":26.0447,"count":48},
{"lng":119.391227,"lat":26.069692,"count":41},{"lng":119.353713,"lat":26.083452,"count":45},
{"lng":119.357522,"lat":26.085075,"count":45},
{"lng":119.361978,"lat":26.085464,"count":40},
{"lng":119.367152,"lat":26.083257,"count":67},
{"lng":119.363487,"lat":26.079558,"count":41},
{"lng":119.368805,"lat":26.076572,"count":45},
{"lng":119.362193,"lat":26.074625,"count":36},
{"lng":119.358672,"lat":26.072094,"count":46},
{"lng":119.35472,"lat":26.076897,"count":5},
{"lng":119.353498,"lat":26.078325,"count":49},
{"lng":119.357019,"lat":26.080207,"count":48},
{"lng":119.358097,"lat":26.076443,"count":45},
{"lng":119.34897,"lat":26.075339,"count":46},
{"lng":119.34509,"lat":26.082868,"count":41},
{"lng":119.350839,"lat":26.073262,"count":29}],
			  [{"lng":119.344824,"lat":26.077085,"count":66},{"lng":119.396832,"lat":26.072808,"count":66},
{"lng":119.403012,"lat":26.074106,"count":52},
{"lng":119.407396,"lat":26.066642,"count":65},
{"lng":119.400785,"lat":26.068654,"count":58},
{"lng":119.393814,"lat":26.065084,"count":95},
{"lng":119.405959,"lat":26.062487,"count":69},
{"lng":119.405096,"lat":26.055022,"count":83},
{"lng":119.39985,"lat":26.06424,"count":79},
{"lng":119.400066,"lat":26.051192,"count":65},
{"lng":119.398341,"lat":26.054373,"count":5},
{"lng":119.397263,"lat":26.06041,"count":68},
{"lng":119.390867,"lat":26.059242,"count":6},
{"lng":119.388065,"lat":26.05684,"count":67},
{"lng":119.389358,"lat":26.049959,"count":84},
{"lng":119.395682,"lat":26.045739,"count":35},
{"lng":119.388424,"lat":26.0447,"count":68},
{"lng":119.391227,"lat":26.069692,"count":61},
{"lng":119.349315,"lat":26.076825,"count":65},
{"lng":119.35316,"lat":26.076533,"count":64},
{"lng":119.351328,"lat":26.071698,"count":62},
{"lng":119.347411,"lat":26.072477,"count":67},
{"lng":119.349064,"lat":26.074164,"count":62},
{"lng":119.393814,"lat":26.065701,"count":65},
			  {"lng":119.401072,"lat":26.065636,"count":62},
			  {"lng":119.399491,"lat":26.062325,"count":66},
			  {"lng":119.397766,"lat":26.064597,"count":66},
			  {"lng":119.396185,"lat":26.062715,"count":61},
			  {"lng":119.401934,"lat":26.055574,"count":66},
			  {"lng":119.395898,"lat":26.051809,"count":65},
			  {"lng":119.389502,"lat":26.056872,"count":67},
			  {"lng":119.397335,"lat":26.056548,"count":61},
			  {"lng":119.392951,"lat":26.060832,"count":67},
			  {"lng":119.391658,"lat":26.062585,"count":62},
			  {"lng":119.403875,"lat":26.064337,"count":69},{"lng":119.353713,"lat":26.083452,"count":65},
{"lng":119.357522,"lat":26.085075,"count":65},
{"lng":119.361978,"lat":26.085464,"count":60},
{"lng":119.367152,"lat":26.083257,"count":67},
{"lng":119.363487,"lat":26.079558,"count":61},
{"lng":119.368805,"lat":26.076572,"count":65},
{"lng":119.362193,"lat":26.074625,"count":66},
{"lng":119.358672,"lat":26.072094,"count":66},
{"lng":119.35472,"lat":26.076897,"count":65},
{"lng":119.353498,"lat":26.078325,"count":69},
{"lng":119.357019,"lat":26.080207,"count":68},
{"lng":119.358097,"lat":26.076443,"count":45},
{"lng":119.34897,"lat":26.075339,"count":66},
{"lng":119.34509,"lat":26.082868,"count":61},
{"lng":119.350839,"lat":26.073262,"count":69}],
			  [{"lng":119.344824,"lat":26.077085,"count":86},
{"lng":119.349315,"lat":26.076825,"count":85},
{"lng":119.35316,"lat":26.076533,"count":84},
{"lng":119.351328,"lat":26.071698,"count":92},
{"lng":119.347411,"lat":26.072477,"count":87},
{"lng":119.349064,"lat":26.074164,"count":82},
{"lng":119.393814,"lat":26.065701,"count":85},
			  {"lng":119.401072,"lat":26.065636,"count":82},
			  {"lng":119.399491,"lat":26.062325,"count":86},
			  {"lng":119.397766,"lat":26.064597,"count":86},
			  {"lng":119.396185,"lat":26.062715,"count":81},
			  {"lng":119.401934,"lat":26.055574,"count":86},
			  {"lng":119.395898,"lat":26.051809,"count":85},
			  {"lng":119.389502,"lat":26.056872,"count":87},
			  {"lng":119.397335,"lat":26.056548,"count":91},
			  {"lng":119.392951,"lat":26.060832,"count":97},
			  {"lng":119.391658,"lat":26.062585,"count":92},
			  {"lng":119.403875,"lat":26.064337,"count":99},{"lng":119.396832,"lat":26.072808,"count":96},
{"lng":119.403012,"lat":26.074106,"count":52},
{"lng":119.407396,"lat":26.066642,"count":35},
{"lng":119.400785,"lat":26.068654,"count":58},
{"lng":119.393814,"lat":26.065084,"count":95},
{"lng":119.405959,"lat":26.062487,"count":19},
{"lng":119.405096,"lat":26.055022,"count":83},
{"lng":119.39985,"lat":26.06424,"count":79},
{"lng":119.400066,"lat":26.051192,"count":95},
{"lng":119.398341,"lat":26.054373,"count":5},
{"lng":119.397263,"lat":26.06041,"count":88},
{"lng":119.390867,"lat":26.059242,"count":6},
{"lng":119.388065,"lat":26.05684,"count":67},
{"lng":119.389358,"lat":26.049959,"count":84},
{"lng":119.395682,"lat":26.045739,"count":35},
{"lng":119.388424,"lat":26.0447,"count":98},
{"lng":119.391227,"lat":26.069692,"count":91},{"lng":119.353713,"lat":26.083452,"count":85},
{"lng":119.357522,"lat":26.085075,"count":85},
{"lng":119.361978,"lat":26.085464,"count":80},
{"lng":119.367152,"lat":26.083257,"count":87},
{"lng":119.363487,"lat":26.079558,"count":81},
{"lng":119.368805,"lat":26.076572,"count":85},
{"lng":119.362193,"lat":26.074625,"count":86},
{"lng":119.358672,"lat":26.072094,"count":86},
{"lng":119.35472,"lat":26.076897,"count":85},
{"lng":119.353498,"lat":26.078325,"count":69},
{"lng":119.357019,"lat":26.080207,"count":68},
{"lng":119.358097,"lat":26.076443,"count":85},
{"lng":119.34897,"lat":26.075339,"count":86},
{"lng":119.34509,"lat":26.082868,"count":91},
{"lng":119.350839,"lat":26.073262,"count":89}],
			  [{"lng":119.344824,"lat":26.077085,"count":66},
{"lng":119.349315,"lat":26.076825,"count":65},
{"lng":119.35316,"lat":26.076533,"count":64},
{"lng":119.351328,"lat":26.071698,"count":92},
{"lng":119.347411,"lat":26.072477,"count":67},
{"lng":119.349064,"lat":26.074164,"count":62},
{"lng":119.393814,"lat":26.065701,"count":65},
			  {"lng":119.401072,"lat":26.065636,"count":62},
			  {"lng":119.399491,"lat":26.062325,"count":66},
			  {"lng":119.397766,"lat":26.064597,"count":66},
			  {"lng":119.396185,"lat":26.062715,"count":61},
			  {"lng":119.401934,"lat":26.055574,"count":66},
			  {"lng":119.395898,"lat":26.051809,"count":65},
			  {"lng":119.389502,"lat":26.056872,"count":67},
			  {"lng":119.397335,"lat":26.056548,"count":61},
			  {"lng":119.392951,"lat":26.060832,"count":67},
			  {"lng":119.391658,"lat":26.062585,"count":62},
			  {"lng":119.403875,"lat":26.064337,"count":69},{"lng":119.396832,"lat":26.072808,"count":46},
{"lng":119.403012,"lat":26.074106,"count":52},
{"lng":119.407396,"lat":26.066642,"count":35},
{"lng":119.400785,"lat":26.068654,"count":58},
{"lng":119.393814,"lat":26.065084,"count":45},
{"lng":119.405959,"lat":26.062487,"count":19},
{"lng":119.405096,"lat":26.055022,"count":43},
{"lng":119.39985,"lat":26.06424,"count":49},
{"lng":119.400066,"lat":26.051192,"count":45},
{"lng":119.398341,"lat":26.054373,"count":5},
{"lng":119.397263,"lat":26.06041,"count":88},
{"lng":119.390867,"lat":26.059242,"count":6},
{"lng":119.388065,"lat":26.05684,"count":67},
{"lng":119.389358,"lat":26.049959,"count":44},
{"lng":119.395682,"lat":26.045739,"count":35},
{"lng":119.388424,"lat":26.0447,"count":48},
{"lng":119.391227,"lat":26.069692,"count":41},{"lng":119.353713,"lat":26.083452,"count":45},
{"lng":119.357522,"lat":26.085075,"count":45},
{"lng":119.361978,"lat":26.085464,"count":60},
{"lng":119.367152,"lat":26.083257,"count":67},
{"lng":119.363487,"lat":26.079558,"count":41},
{"lng":119.368805,"lat":26.076572,"count":45},
{"lng":119.362193,"lat":26.074625,"count":66},
{"lng":119.358672,"lat":26.072094,"count":66},
{"lng":119.35472,"lat":26.076897,"count":44},
{"lng":119.353498,"lat":26.078325,"count":49},
{"lng":119.357019,"lat":26.080207,"count":48},
{"lng":119.358097,"lat":26.076443,"count":45},
{"lng":119.34897,"lat":26.075339,"count":46},
{"lng":119.34509,"lat":26.082868,"count":41},
{"lng":119.350839,"lat":26.073262,"count":49}]);


function initialize() {
  // 百度地图API功能
  map = new BMap.Map("map_canvas");
  map.addControl(new BMap.NavigationControl());               // 添加平移缩放控件
  map.addControl(new BMap.ScaleControl());                    // 添加比例尺控件
  map.addControl(new BMap.OverviewMapControl());              //添加缩略地图控件
  map.enableScrollWheelZoom();                            //启用滚轮放大缩小
  map.addControl(new BMap.MapTypeControl()); 
  var point = new BMap.Point(119.31061639184439, 26.076403495378038);    // 创建点坐标
  map.centerAndZoom(point,13);  
  map.addOverlay(gsheatmapOverlay);
  gsheatmapOverlay.setDataSet({data:rld[0],max:100});
  //datas = [];
 // map.addEventListener("click", eventClick); //鼠标事件
	                  // 初始化地图,设置中心点坐标和地图级别。
	  var polygon = new BMap.Polygon(gs, {strokeColor:"blue",fillColor:"blue", strokeWeight:1, strokeOpacity:0,fillOpacity:0.1});
	  var polygon1 = new BMap.Polygon(jq, {strokeColor:"blue",fillColor:"blue", strokeWeight:1, strokeOpacity:0,fillOpacity:0.1});
		map.addOverlay(polygon);
		map.addOverlay(polygon1);
  //showToolAutoDef();
  //时间条begin
var myDate = new Date();

var nows = myDate.getFullYear()+"."+(myDate.getMonth()+1)+"."+myDate.getDate();
var timeText = myDate.getHours()+":"+myDate.getMinutes();
var horlList=[];

for(var i=8;i>0;i--){
horlList.push(myDate.getHours()-i);
}
  $("#time-panel").timeProgressBar({
			speed : 4000,
	
isAutoRePlay : true,
		
overHourAction :run,
	
dateText : nows,
	
timeText : timeText,
		
hourList:horlList
	
});
//时间条end
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
function play(){

 var stop = document.getElementById("stop");
var start = document.getElementById("start");
 stop.style.display = "";
 start.style.display = "none";
	//show.innerHTML=JSON.stringify(datas);
runId=window.setInterval(run,2000); 
}

function stop(){

 var stop = document.getElementById("stop");
var start = document.getElementById("start");
 stop.style.display = "none";
 start.style.display = "";
	//show.innerHTML=JSON.stringify(datas);
	window.clearInterval(runId); 
}

function run(){
	if(runs>=5){
		runs = 0;
	}

			  
			  gsheatmapOverlay.setDataSet({data:rld[runs],max:100});
runs++;
}

</script>
</head>
<body onLoad="initialize()">
  <div id="map_canvas" style="width: 100%; height: 100%;"></div>
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
	
</div>

</div>
</body>
</html>
