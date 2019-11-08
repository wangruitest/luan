<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
String curCityCode= request.getParameter("cityCode");
%>
<html>
  <head>
    <title>地市日月度人数</title>
	
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<jsp:include flush='true' page='./inc.jsp'></jsp:include>
	<jsp:include flush='true' page='../jsp/common/echarts_inc.jsp'></jsp:include>
	<link href="<%=request.getContextPath() %>/css/daping/style.css" rel="stylesheet" type="text/css" />
	<script type='text/javascript' src='${home}/dwr/interface/RegionRealtimeSumAction.js'></script>
	<script type='text/javascript' src="<%=request.getContextPath() %>/dwr/interface/ProvinceReceiveTouristAction.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery/jquery-form-plugin.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery/jquery-validator-plugin.js"></script>
      <script type="text/javascript" src="<%=request.getContextPath()%>/js/date/WdatePicker.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery/date-functions.js"></script>

  </head>
  
<body>	
		<table width="99%" border="0" cellspacing="0" cellpadding="0" class="layout">
		<tr valign="top">
          <td class="radius_box"><h2 class="title_public">实时游客接待</h2>
          <table width="98%" height="100%" border="0" cellspacing="0" cellpadding="0" class="proportion">
         <tr>
          <td style="height: 100%;">
			<div id="main" style="height:100%;margin-top: -35px;"></div>
           </td>
        </tr>
          </table>
           </td>
        </tr>
	</table>
	
	
	
		<script>
		var myChart;
		var mapcitycode = <%=curCityCode%>;
		var data = null;
		$(function(){
			myChart = echarts.init(document.getElementById('main'));
			loadData();
			
		
	});
		
		function loadData(){
			var obj={
					cityid:mapcitycode
					};
			RegionRealtimeSumAction.returnRealLineData(mapcitycode,function(result){
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
			var ydata = [];//前14天实际数据
			var ydata2 = [];//后7天预测数据
			 for(var i=0;i<dataobj.length;i++){ 
				xdata.push(dataobj[i].time); 
				ydata.push(dataobj[i].timeValue);
			}  
			var option = {
					
				    calculable : true,
				    
				    grid : {
				    	x:'60',
				    	Y:'6',
				    	x2:'60',
				    	Y2:'6'
				    },
				    xAxis : [
				        {
				            type : 'category',
				            boundaryGap : false,
				            data : xdata,
				        	name : '时间'
				        	
				        }
				    ],
				    yAxis : [
				        {
				            type : 'value',
				        	name : '人次(人)'
				        }
				    ],
				    series : [
				        {
				            name:'实时人数',
				            type:'line',
				            data:ydata,
				          	symbol: 'none',
				            itemStyle: {
				                normal: {
				                	labelLine: {
				                        show: true
				                    }
				                }
				            }
				        }
				    ]
				};
				                    
			 myChart.setOption(option);
			 window.onresize = myChart.resize;
		}		
	</script>
</body>
</html>
