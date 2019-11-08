<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setAttribute("home", request.getContextPath());
String type=request.getParameter("type");
if(null==type)type="1";
%>
<html>
  <head>
    <title>游客来源</title>
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
 <!-- 动态取数模块 --> 
 
<!--  -->
 
<body>	
		<div id="main" style="height:400px; width:600px"></div>
		<script>
		var myChart = echarts.init(document.getElementById('main'));
		var data = null;
		
		loadData();
		function loadData(){
			var obj = {
					region : 10,//显示的条数
					guide : 0 //是否显示其他（1：为显示，其他为不显示，默认为显示）
				};
			TouristResourceAction.getSourcePlace(obj,function(result){
				data = result;
				getOption(data);
				refresh();//刷新
			});
		}
		
		function refresh(){
			setTimeout('loadData()',10000);//定时刷新
		}
		
		function getOption(json){
			var jsonobj=eval('('+json+')'); 
			var total = jsonobj.total;
			var datavalue = jsonobj.datavalue;
			var dataobj = eval(datavalue); 
			var datas = [];
			for(var i=0;i<dataobj.length;i++){ 
				datas.push(dataobj[i]); 
			} 
			var option = {
				 title: {
           		        text: total,
           		        x: 'center',
           		        y: 'center',
           		        itemGap: 20,
           		        textStyle : {
           		            color : 'rgba(30,144,255,0.8)',
           		            fontFamily : '微软雅黑',
           		            fontSize : 35,
           		            fontWeight : 'bolder'
           		        }
           		    },
			   calculable : false,
			   animation : false,
			    series : [
			        {
			            name:'游客来源',
			            type:'pie',
			            radius : [100, 140],
			            x: '30%',
			            width: '10%',
			            max: 1048,
			            data:datas,
			            itemStyle:{
			                normal:{
			                      label:{
			                        show: true,
			                        formatter: '{b} {d}%'
	                      		},
		                      labelLine :{show:true}
		                    }
		                }
			        }
			    	]
				};
		 myChart.setOption(option); 
		}
	</script>
</body>

<!--  -->
 
 
 <!-- 静态数据模块 --> 
 
 <!--  
<body> 
	<div id="main" style="height:400px; width:600px"></div>
	<script src="../../echarts/build/dist/echarts.js"></script>
    <script type="text/javascript">
	    function aa(){
			TouristResourceAction.getSourcePlace(obj,function(result){
				data = result;
				alert("aa");
			});
		}
    	var sum = 123456;
        require.config({
            paths: {
                echarts: '../../echarts/build/dist'
            }
        });
        require(
            [
                'echarts',   // 按需加载所需图表，如需动态类型切换功能，别忘了同时加载相应图表
                'echarts/chart/pie'
            ],
            function (ec) {
                var myChart = ec.init(document.getElementById('main'));
                var option = {
                		 title: {
                		        text: sum,
                		        x: 'center',
                		        y: 'center',
                		        itemGap: 20,
                		        textStyle : {
                		            color : 'rgba(30,144,255,0.8)',
                		            fontFamily : '微软雅黑',
                		            fontSize : 35,
                		            fontWeight : 'bolder'
                		        }
                		    },
                		calculable : false,
         			   animation : false,
        			    series : [
							{
							    name:'游客来源',
							    type:'pie',
							    radius : [100, 140],
							    x: '30%',
							    width: '10%',
							    max: 1048,
							    data:[
							        {value:335, name:'直达'},
							        {value:310, name:'邮件营销'},
							        {value:234, name:'联盟广告'},
							        {value:135, name:'视频广告'},
							        {value:1048, name:'百度'},
							        {value:251, name:'谷歌'},
							        {value:147, name:'必应'},
							        {value:102, name:'其他'}
							    ],
							    itemStyle:{
							        normal:{
							              label:{
							                show: true,
							                formatter: '{b}{d}%'
							      		},
							          labelLine :{show:true}
							        }
							    }
							}      
  			              ]
                }
                myChart.setOption(option);
            }
        );
        
      setTimeout('aa()',5000); 
    </script>
</body> 
 -->

</html>
