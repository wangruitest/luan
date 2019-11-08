<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
String curCityCode= request.getParameter("cityCode");
//页面访问标志  1：市级总览 2：年度总览
String flag = request.getParameter("flag") ;
request.setAttribute("flag", flag);
%>
<html>
  <head>
    <title>景区游客（本地+外地）接待TOP3</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<link href="<%=request.getContextPath() %>/css/daping/style.css" rel="stylesheet" type="text/css" />
	<jsp:include flush='true' page='./inc.jsp'></jsp:include>
	<jsp:include flush='true' page='../jsp/common/echarts_inc.jsp'></jsp:include>
	<script type='text/javascript' src='${home}/dwr/interface/ProvinceReceiveTouristAction.js'></script>
	<script type="text/javascript" src="${home}/js/jquery/jquery-form-plugin.js"></script>
	<script type="text/javascript" src="${home}/js/jquery/jquery-validator-plugin.js"></script>
    <script type="text/javascript" src="${home}/js/date/WdatePicker.js"></script>
	<script type="text/javascript" src="${home}/js/jquery/date-functions.js"></script>

  </head>
  
<body>	
		<table width="99%" border="0" cellspacing="0" cellpadding="0" class="layout">
        <tr valign="top">
          <td class="radius_box"><h2 class="red_title">景区游客（本地+外地）接待TOP3</h2>
          <table width="98%" height="100%"  border="0" cellspacing="0" cellpadding="0">
         <tr>
          <td>
			<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr  height="100%">
                      <td>
                      	<div id="main" style="height:100%;margin-top: -15px;"></div>
                      </td>                    
                    </tr>
            </table>
          </td>
        </tr>
          </table>
           </td>
        </tr>
	</table>
	
		<script>
		var myChart = echarts.init(document.getElementById('main'));
		var mapcitycode = <%=curCityCode%>;
		var data = null;
		var flag = <%=flag%>;
		loadData();
		function loadData(){
			var obj ={};
			if(flag == 1){
				 obj.cityid=mapcitycode; //查询市总概览
			}else{
				 obj.provinceid = mapcitycode; //查询省总概览
			}
			ProvinceReceiveTouristAction.getCityRegionYearTourist(obj,function(result){
				data = result;
				getOption(data);
		//		refresh();//刷新
			});
		}
		
	//	function refresh(){
	//		setTimeout('loadData()',30000);//定时刷新
	//	}
		
		function getOption(json){
			var dataobj = eval(json); 
			var xdata = [];
			var ydata = [];
			for(var i=dataobj.length-1;i>=0;i--){
				var str=dataobj[i].regionname;
				var arr = str.split('');
				if(arr.length>=7){
					 arr[6]+="\n";
				} 
				 arr = arr.join('');
				xdata.push(dataobj[i].ykzs); 
				ydata.push(arr);
				//alert(dataobj[i].ykzs+"...."+dataobj[i].regionname);
			}
			var option = {
					calculable : true,
					
				    animation : false,
					    grid : {
					    	x:'100',
					    	Y:'0',
					    	x2:'15',
					    	Y2:'0'
					    },
					    splitLine : [
						                {
								    	show: true
								    	}
								    ],
					    xAxis : [
					        {
					            type : 'value',
					            show : false,
					            boundaryGap : [0, 0.01]
					        }
					    ],
					    yAxis : [
					        {
					            type : 'category',
					            data : ydata
					        }
					    ],
					    series : [
					        {
					        	name:'人次',
					         type:'bar',
					            itemStyle : { 
					            	normal: {
					            		color: function (value){					
							       			 var colorList = [
                          							'#FFA500','#00AA00','#33CCFF'
                        						];
                        					return colorList[value.dataIndex]
							            },
					            		label : {show: true, position: 'insideRight'}
					        			}},
					            data:xdata
					        }
					    ]
			};
				                    
			 myChart.setOption(option);
			 window.onresize = myChart.resize;
		}
		
	
	</script>
</body>
</html>
