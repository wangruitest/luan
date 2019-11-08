<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.funo.utils.Constants"%>
<%@page import="com.funo.system.model.SysOperator"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%
String curCityCode= request.getParameter("cityCode");
//页面访问标志  1：市级总览 2：年度总览
String flag = request.getParameter("flag") ;
request.setAttribute("flag", flag);
%>
<head>
<title>年度人数</title>
<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
			<jsp:include flush='true' page='./inc.jsp'></jsp:include>
			<jsp:include flush='true' page='../jsp/common/echarts_inc.jsp'></jsp:include>
			<link href="<%=request.getContextPath() %>/css/daping/style.css"
				rel="stylesheet" type="text/css" />
			<script type='text/javascript'
				src='<%=request.getContextPath()%>/dwr/interface/JqykjdAction.js'></script>
			<script type="text/javascript"
				src="<%=request.getContextPath()%>/js/jquery/jquery-form-plugin.js"></script>
			<script type="text/javascript"
				src="<%=request.getContextPath()%>/js/jquery/jquery-validator-plugin.js"></script>
			<script type="text/javascript"
				src="<%=request.getContextPath()%>/js/date/WdatePicker.js"></script>
			<script type="text/javascript"
				src="<%=request.getContextPath()%>/js/jquery/date-functions.js"></script>
	<script>
		var cityId = <%=curCityCode%>;
 		var flag = <%=flag%>;
		var myChart;
		$(function(){
		myChart = echarts.init(document.getElementById('main'));
		loadData();
	});
		function loadData(){
			var obj ={};
			if(flag == 1){
				 obj.cityId=cityId; //查询市总概览
			}else{
				 obj.cityFlag = (cityId+'').substr(0,2); //查询省总概览
				
			}
		JqykjdAction.getNdtj(obj,function(result){
		if(result.resultCode=="0"){
			getOption(result.returnList);
		}
	});	
   }


		function getOption(json){
			var option = {
				    calculable : true,
				    animation : false,
				    legend: {
				        data:['游客人数','旅客人数']
				    },
				    grid:{
				    	
				    	y:'20',
				    	x:'60',
				    	x2:'20',
				    	y2:'25'
				    },
				    splitLine : [
		                {
				    	show: false
				    	}
				    ],
				    xAxis : [
				        {
				            type : 'category',
				            boundaryGap : false,
				            data : json[0],
				        	name : ''
				        }
				    ],
				    yAxis : [
				        {
				            type : 'value',
				        	name : '人次(万)'
				        }
				    ],
				    series : [
				        {
				            name:'游客人数',
				            type:'line',
				            data:json[1],
				            symbol: 'none',
				            itemStyle: {
				                normal: {
				                	labelLine: {
				                        show: true
				                    }
				                }
				            }
				        },
				        {
				            name:'旅客人数',
				            type:'line',
				            data:json[2],
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
</head>

<body>
	<table width="99%" border="0" cellspacing="0" cellpadding="0"
		class="layout">
		<tr valign="top">
			<td width="60%" class="radius_box"><h2 class="yellow_title">年度人数</h2>
				<table width="98%" border="0" cellspacing="0" cellpadding="0"
					class="proportion">
					<tr>
						<td>
							<div id="main" style="height: 160px"></div>
						</td>
					</tr>
				</table></td>
		</tr>

	</table>

</body>

</html>
