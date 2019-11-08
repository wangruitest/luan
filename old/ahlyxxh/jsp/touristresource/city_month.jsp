<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setAttribute("home", request.getContextPath());
String type=request.getParameter("type");
if(null==type)type="1";
%>
<html>
  <head>
    <title>月度人数</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<jsp:include flush='true' page='../common/inc.jsp'></jsp:include>
	<jsp:include flush='true' page='../common/echarts_inc.jsp'></jsp:include>
	<script type='text/javascript' src='${home}/dwr/interface/TouristResourceAction.js'></script>
	<script type="text/javascript" src="${home}/js/jquery/jquery-form-plugin.js"></script>
	<script type="text/javascript" src="${home}/js/jquery/jquery-validator-plugin.js"></script>
    <script type="text/javascript" src="${home}/js/date/WdatePicker.js"></script>
	<script type="text/javascript" src="${home}/js/jquery/date-functions.js"></script>
  </head>
 
<body>	
		<div id="main" style="height:400px; width:600px"></div>
		<script>
		var myChart = echarts.init(document.getElementById('main'));
		var data = null;
		loadData();
		function loadData(){
			TouristResourceAction.getCityMonth(function(result){
				data = result;
				getOption(data);
			});
		}
		//var xdata = ['1','5','9','11','13','15','21','23','25','27','30'];
		//var ydata = [11, 11, 15, 30, 12, 13, 10,15,19,10,12];
		//getOption();
		
		function getOption(json){
			var dataobj = eval(json); 
			var xdata = [];
			var ydata = [];
			for(var i=0;i<dataobj.length;i++){ 
				xdata.push(dataobj[i].dateTime); 
				ydata.push(dataobj[i].tiemValue); 
			} 
			var option = {
				    calculable : true,
				    animation : false,
				    splitLine : [
		                {
				    	show: false
				    	}
				    ],
				    xAxis : [
				        {
				            type : 'category',
				            boundaryGap : false,
				            data : xdata,
				        	name : '日期'
				        }
				    ],
				    yAxis : [
				        {
				            type : 'value',
				        	name : '万人次'
				        }
				    ],
				    series : [
				        {
				            name:'最高气温',
				            type:'line',
				            data:ydata,
				            itemStyle: {
				                normal: {
				                	areaStyle : {
							        	color : 'rgba(30,144,255,0.8)'
							        }
				                }
				            }
				        }
				    ]
				};
				                    
			 myChart.setOption(option);
		}
	</script>
</body>

</html>
