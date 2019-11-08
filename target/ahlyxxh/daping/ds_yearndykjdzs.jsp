<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
String curCityCode= request.getParameter("cityCode");
request.setAttribute("home", request.getContextPath());
//页面访问标志  1：市级总览 2：年度总览
String flag = request.getParameter("flag") ;
request.setAttribute("flag", flag);
%>
<html>
  <head>
    <title>年度接待游客总数</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<jsp:include flush='true' page='./inc.jsp'></jsp:include>
	<jsp:include flush='true' page='../jsp/common/echarts_inc.jsp'></jsp:include>
	<link href="<%=request.getContextPath() %>/css/daping/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${home}/js/jquery/jquery-form-plugin.js"></script>
	<script type="text/javascript" src="${home}/js/jquery/jquery-validator-plugin.js"></script>
    <script type="text/javascript" src="${home}/js/date/WdatePicker.js"></script>
	<script type="text/javascript" src="${home}/js/jquery/date-functions.js"></script>
 	<script type="text/javascript" src="${home}/dwr/interface/UtilsAction.js"></script>
 	<script type='text/javascript' src="${home}/dwr/interface/ProvinceReceiveTouristAction.js"></script>
	
  </head>
  
<body>	
		<table width="99%" border="0" cellspacing="0" cellpadding="0" class="layout">
		<tr valign="top">
          <td class="radius_box"><h2 class="green_title">年度接待游客总数</h2>
          <table width="98%" height="100%" border="0" cellspacing="0" cellpadding="0">
         <tr>
          <td>
			<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
                    <tr  height="100%">
                      <td width="80%"><div id="main" style="height:100%;margin-top: -15px;"></div></td>
                      <td class="w_25">
                        <div id="tonbi" class="year_div"></div></td>                      
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

		var flag = <%=flag%>;
		var data = null;
		
		loadData();
		function loadData(){
			var obj ={};
			if(flag == 1){
				 obj.cityid=mapcitycode; //查询市总概览
			}else{
				 obj.provinceid = (mapcitycode+"").substr(0,2); //查询省总概览
			}
			ProvinceReceiveTouristAction.getCityReceiveByYear(obj,function(result){
				data = result;
				getOption(data);
			//	refresh();//刷新
			});
		}
		
		function refresh(){
			setTimeout('loadData()',1000*60*60);//定时刷新
		}
		
		function getOption(json){
			var dataobj = eval(json); 
			//alert(dataobj[0].STAT_MONTH+"..."+dataobj[0].ykzs+"+++++"+dataobj[1].STAT_MONTH+"..."+dataobj[1].ykzs);
			var xdata = [];
			var ydata = [];
			for(var i=0;i<dataobj.length;i++){ 
				xdata.push(dataobj[i].STAT_MONTH); 
				ydata.push(((dataobj[i].ykzs)/10000).toFixed(2));
			}
			var tb;
			if(ydata[0]==0){
				tb=100;
				}else{
			 	tb = ((ydata[1]-ydata[0])/ydata[0])*100;
			 }
			if(tb>0){
				$("#tonbi").html("<span class='up'>"+tb.toFixed(0)+"%"+"</span></br>同比增长");
			}else if(tb<0){
				$("#tonbi").html("<span class='down'>"+tb.toFixed(0)+"%"+"</span></br>同比增长");
				
			}else{
				$("#tonbi").html(tb.toFixed(0)+"%"+"</br>同比增长");
			}
			var option = {
					title : {
				        /* text: '年度接待游客总数' */
				    },
				    grid : {
				    	x:'22%',
				    	Y:'2%',
				    	x2:'12%',
				    	Y2:'2%'
				    },
				    tooltip : {
				        trigger: 'axis'
				    },
				    toolbox: {
				        show : true,
				        feature : {
				        //    mark : {show: true},
				        //    dataView : {show: true, readOnly: false},
				         //   magicType : {show: true, type: ['line', 'bar']},
				        //    restore : {show: true},
				       //     saveAsImage : {show: true}
				        }
				    },
				    calculable : true,
				    xAxis : [
				             {
				            	 name:"年份",
				                 type : 'category',
				                 data : xdata
				             }
				         ],
				         yAxis : [
				             {
				            	 name:"人次(万)",
				                 type : 'value'
				               
				             }
				         ],
				         series : [
				                   {
				                     /*   name:'年接待人数', */
				                       type:'bar',
				                       itemStyle : { 
							            	normal: {
							            		color: function (value){
									       //     	return "#"+("00000"+((Math.random()*16777215+0.5)>>0).toString(16)).slice(-6);
									       			 var colorList = [
		                          							'#00DDDD','#FFC8B4'
		                        						];
		                        					return colorList[value.dataIndex]
									            },
				                   
							           		  label : {show: true, position: 'insideRight'}
							        			}},
				                       data: ydata
				                   }
				               ]
			};
				                    
			 myChart.setOption(option);
			 window.onresize = myChart.resize;
		}		
	</script>
</body>
</html>
