<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.funo.utils.Constants"%>
<%@page import="com.funo.system.model.SysOperator"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%
String curCityCode= request.getParameter("cityCode");
String flag = request.getParameter("flag");
%>
<head>
<title>年度人数</title>
<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
			<jsp:include flush='true' page='./inc.jsp'></jsp:include>
			<jsp:include flush='true' page='../jsp/common/echarts_inc.jsp'></jsp:include>
			<script type="text/javascript" src="<%=request.getContextPath() %>/echarts/build/echarts.common.min.js"></script>
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
		var flag =<%=flag%>;
		var myChart ;
		var alltotal ;
		$(function(){
			myChart = echarts.init(document.getElementById('main'));
			loadData();
				
		});
	   function loadData(){
			var obj ={};
			if(1 == flag){
				obj.cityId = cityId;
			}else{
			obj.provinceId = cityId;
			}
			JqykjdAction.getNdtjBt(obj,function(result){	
			getOption(result);	
			});	
		}


		function getOption(json){
			var jsonobj=eval('('+json+')');
			var total = jsonobj.total;
			var datavalue = jsonobj.datavalue;
			var dataobj = eval(datavalue); 
			var datas = [];
			var jsonlegend=[];
			
			for(var i=0;i<dataobj.length;i++){ 
				datas.push(dataobj[i]); 
				jsonlegend.push(dataobj[i].name);
			} 
			option = {
				title: {
           		        text: "总计："+total+"人次",
           		        x: 'left',
           		        y: 'top',
           		        itemGap: 20,
           		        textStyle : {
           		            color : '#483D8B',
           		            fontFamily : '微软雅黑',
           		            fontSize : 16,
           		            fontWeight : 'bolder'
           		        }
           		    },
        		tooltip : {
         	        	trigger: 'item',
         	        	formatter: "{a} <br/>{b} : {c} ({d}%)"
         	    	},
			    legend: {
    	                orient: 'vertical',
    	                x: 'left',
    	                y:'26',
    	                data:jsonlegend,
    	                formatter: function (name) {
    	                	var value=0;
    	                	for(var i=0;i<dataobj.length;i++){
    	                		if(dataobj[i].name==name){
    	                			value=dataobj[i].value;
    	                			break;
    	                		}
    	                	}
    	                    var datas= datas= name+':'+ '('+toPercent(value,total)+')';
    	                return datas;
    	                }
    	            },

			    series : [
			        {
			            name:'访问来源',
			            type:'pie',
			            center : ['68%', '40%'],    
			            radius : ['0%', '70%'],
			            itemStyle : {
			                normal : {
			                    label : {
			                        show : false
			                    },
			                    labelLine : {
			                        show : false
			                    }
			                },
			                emphasis : {
			                    label : {
			                        show : true,
			                        position : 'center',
			                        textStyle : {
			                            fontSize : '30',
			                            fontWeight : 'bold'
			                        }
			                    }
			                }
			            },
			            data:datas,
			        }
    			]
			};
		 myChart.setOption(option); 
		 window.onresize = myChart.resize;
		}
		
		function toPercent(numb1,numb2){
			var numb=numb1/numb2*100;
			var f=parseFloat(numb.toFixed(0)); 
			return f+"%";
		}

	</script>
</head>

<body>
	<table width="99%" border="0" cellspacing="0" cellpadding="0"
		class="layout">
		<tr valign="top">
			<td width="60%" class="radius_box"><h2 class="yellow_title">游客来源</h2>
				<table width="98%" border="0" cellspacing="0" cellpadding="0"
					class="proportion">
					<tr>
						<td>
							<div id="main" style="height: 200px"></div>
						</td>
					</tr>
				</table></td>
		</tr>

	</table>

</body>

</html>
