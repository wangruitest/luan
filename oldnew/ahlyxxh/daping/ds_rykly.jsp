<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
String curCityCode= request.getParameter("cityCode");
%>
<html>
  <head>
    <title>地市日游客来源</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<jsp:include flush='true' page='./inc.jsp'></jsp:include>
	<script type="text/javascript" src="<%=request.getContextPath() %>/echarts/build/echarts.common.min.js"></script>
	<link href="<%=request.getContextPath() %>/css/daping/style.css" rel="stylesheet" type="text/css" />
	<script type='text/javascript' src="<%=request.getContextPath() %>/dwr/interface/TouristResourceAction.js"></script>
	<script type='text/javascript' src="<%=request.getContextPath() %>/dwr/interface/ProvinceReceiveTouristAction.js"></script>
	<script type='text/javascript' src='${home}/dwr/interface/RegionRealtimeSumAction.js'></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery/jquery-form-plugin.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery/jquery-validator-plugin.js"></script>
      <script type="text/javascript" src="<%=request.getContextPath()%>/js/date/WdatePicker.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery/date-functions.js"></script>

  </head>
  
<body>	
		<table width="99%" border="0" cellspacing="0" cellpadding="0" class="layout">
		<tr valign="top">
          <td class="radius_box"><h2 class="yellow_title">游客来源</h2>
          <table width="98%" border="0" cellspacing="0" cellpadding="0" class="proportion">
         <tr>
          <td>
			<div id="main" style="height:300px;margin:0 auto;"></div>
           </td>
        </tr>
          </table>
           </td>
        </tr>
	</table>
	
		<script>
		var mapcitycode = <%=curCityCode%>;
		var myChart = echarts.init(document.getElementById('main'));
		var data = null;
		var alltotal;
		
		loadData();
		function loadData(){
			var obj = {
					cityCode:mapcitycode
					
				};
			var obj1={cityid:mapcitycode};
			DWREngine.setAsync(false);
			/* ProvinceReceiveTouristAction.getNewCityReceiveTourist(obj1,function(result2){
				alltotal=result2.returnObject.ykzs;
			});
			DWREngine.setAsync(true);
			TouristResourceAction.getSourcePlace(obj,function(result){
				data = result;
				getOption(data);
				refresh();//刷新
			}); */
			RegionRealtimeSumAction.getRealTimeFromByCity(mapcitycode,function(result){
				data = result.returnObject.list;
				var legenddata=result.returnObject.legend;
				alltotal=result.returnObject.total;
				getOption(data,legenddata);
				refresh();//刷新
			});
		}
		
		function refresh(){
			setTimeout('loadData()',refreshTime);//定时刷新
		}
		
		function getOption(json,legenddata){
			var jsonobj=eval('('+json+')'); 
			var jsonlegend=eval(legenddata);
			/*var total = jsonobj.total;
			var datavalue = jsonobj.datavalue;
			var dataobj = eval(datavalue); 
			*/
			/* var datas = [];
			for(var i=0;i<jsonobj.length;i++){ 
				datas.push(jsonobj[i]); 
			}   */
			var option = {
					title: {
           		        text: "总接待人数："+alltotal+"人次",
           		        x: 'left',
           		        y: 'top',
           		        itemGap: 20,
           		        textStyle : {
           		            color : '#483D8B',
           		            fontFamily : '微软雅黑',
           		            fontSize : 17,
           		            fontWeight : 'bolder'
           		        }
           		    },
           		 tooltip : {
           	        trigger: 'item',
           	        formatter: "{a} <br/>{b} : {c} ({d}%)"
           	    },
           	 label: {
                 normal: {
                     show: false,
                     position: 'inside'
                 },
                 emphasis: {
                     show: true,
                     textStyle: {
                         fontSize: '30',
                         fontWeight: 'bold'
                     }
                 }
             },
			   labelLine: {
	                normal: {
	                    show: false
	                }
	            },
	            legend: {
	            	 orient: 'vertical',
		                x: 'left',
	    	            y:'50',
	                data:jsonlegend,
	                formatter: function (name) {
	                	var value=0;
	                	for(var i=0;i<jsonobj.length;i++){
	                		if(jsonobj[i].name==name){
	                			value=jsonobj[i].value;
	                			break;
	                		}
	                	}
	                    return name+':'+'('+toPercent(value,alltotal)+')';
	                }
	            },
			    series : [
			        {
			            name:'游客来源',
			            type:'pie',
			            center : ['70%', '50%'],
			            radius : ['0%', '70%'],
			            x: '30%',
			            y:'1%',
			            width: '10%',
			            avoidLabelOverlap: false,
			            max: 1048,
			            color:['#62b0ff','#1b9a61','#9d2a64','#c4ccd3','#3983cf','#ffc07b'],
			            label: {
			            	normal: {
			                     show: false,
			                     position: 'center'
			                 },
			                emphasis: {
			                    show: true,
			                    textStyle: {
			                        fontSize: '30',
			                        fontWeight: 'bold'
			                    }
			                }
			            },
			            labelLine: {
			                normal: {
			                    show: false
			                }
			            },
			            data:jsonobj
			            /* itemStyle:{
			                normal:{
			                      label:{
			                        show: true,
			                        formatter:'{b}' 
	                      		},
		                      labelLine :{show:true}
		                    }
		                } */
			        }
			    	]
				};
		 myChart.setOption(option); 
		 window.onresize = myChart.resize;
		}
		
		function toPercent(numb1,numb2){
			var numb=numb1/numb2;
			var f=(parseFloat(numb.toFixed(6))*100).toFixed(1); 
			return f+"%";
		}
		
	</script>
</body>
</html>
