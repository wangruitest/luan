<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setAttribute("home", request.getContextPath());
String type=null;
String curCityCode=null;
if(request.getParameter("type")!=null){type=request.getParameter("type");}
if(null==type){type="1";}
if(request.getParameter("cityCode")!=null){curCityCode= request.getParameter("cityCode");}
%>
<html>
  <head>
    <title>旅游资源管理页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<jsp:include flush='true' page='./inc.jsp'></jsp:include>
	<script type="text/javascript" src="<%=request.getContextPath() %>/echarts/build/echarts.common.min.js"></script>
	<link href="<%=request.getContextPath() %>/css/daping/style.css" rel="stylesheet" type="text/css" />
	<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/RegionCoordsAction.js'></script>
	<script type='text/javascript' src='${home}/dwr/interface/TouristResourceAction.js'></script>
	<script type="text/javascript" src="${home}/js/jquery/jquery-form-plugin.js"></script>
	<script type="text/javascript" src="${home}/js/jquery/jquery-validator-plugin.js"></script>
    <script type="text/javascript" src="${home}/js/date/WdatePicker.js"></script>
	<script type="text/javascript" src="${home}/js/jquery/date-functions.js"></script>
	<%-- <jsp:include flush='true' page='TouristResource_Editor_js.jsp'></jsp:include> --%>
	<script>
		var type="<%=type%>";
		var cityCode=<%=curCityCode%>
		var reginoInfo=new Object();
		reginoInfo.cityCode=cityCode;
		RegionCoordsAction.returnRegionsByLevel(reginoInfo,function(result){
			if(result!=null){
				// var infos=eval("("+result+")");
				//document.getElementById("TouristResourceViewForm:region").innerHTML=result.returnObject.regions;
				/* document.getElementById("TouristResourceViewForm:fiveRegion").innerHTML=result.returnObject.fivel;
				document.getElementById("TouristResourceViewForm:fourRegion").innerHTML=result.returnObject.fourl;
				document.getElementById("TouristResourceViewForm:threeRegion").innerHTML=result.returnObject.threel;  */
				var data = result.returnObject.list;
				var legenddata=result.returnObject.legend;
				var alltotal=result.returnObject.regions;
				getOption(data,legenddata,alltotal);
				
			}
		});
		function loadData(){
		RegionCoordsAction.returnRegionsByLevel(reginoInfo,function(result){
			if(result!=null){
				// var infos=eval("("+result+")");
				//document.getElementById("TouristResourceViewForm:region").innerHTML=result.returnObject.regions;
				/* document.getElementById("TouristResourceViewForm:fiveRegion").innerHTML=result.returnObject.fivel;
				document.getElementById("TouristResourceViewForm:fourRegion").innerHTML=result.returnObject.fourl;
				document.getElementById("TouristResourceViewForm:threeRegion").innerHTML=result.returnObject.threel;  */
				var data = result.returnObject.list;
				var legenddata=result.returnObject.legend;
				var alltotal=result.returnObject.regions;
				getOption(data,legenddata,alltotal);
				
			}
		});
		};
		
	</script>
  </head>
  
  <body>	
  
  <table width="99%" border="0" cellspacing="0" cellpadding="0" class="layout">
		<tr valign="top">
          <td class="radius_box"><h2 class="yellow_title">旅游资源</h2>
         
             <!-- <p>景区数量：<span 
						id="TouristResourceViewForm:region" ondblclick="editValue()"></span>个</span></p> 
               <p class="gray">其中5A景区<span id="TouristResourceViewForm:fiveRegion"></span>个，4A景区<span 
						id="TouristResourceViewForm:fourRegion"></span>个，3A景区<span 
						id="TouristResourceViewForm:threeRegion"></span>个
						</p> -->
  		</div>
  		<br/>
        <div>
        <table width="98%" border="0" cellspacing="0" cellpadding="0" class="proportion">
         <tr>
          <td>
			<div id="main" style="height:200px;margin:0 auto;margin-left:10%;" align="center"></div>
           </td>
        </tr>
          </table>
          </div>  
           </td>
        </tr>
	</table>
		<!-- <table id="TouristResourceViewForm"  style="height:100%;width:100%;table-layout:fixed;">
			<tr>
			<td valign="top" class="radius_box"><h2 class="title_public">全省旅游资源</h2>
			<input type="hidden" id="TouristResourceViewForm:id" />
            <div class="space resource">
              <p>景区数量：<span 
						id="TouristResourceViewForm:region" ondblclick="editValue()"></span>个</span></p> 
              <p class="gray">其中5A景区<span id="TouristResourceViewForm:fiveRegion"></span>个，4A景区<span 
						id="TouristResourceViewForm:fourRegion"></span>个，3A景区<span 
						id="TouristResourceViewForm:threeRegion"></span>个
						</p><br/>
              <p>酒店数量：<span 
						id="TouristResourceViewForm:grogshop"></span>个</p> 
              <p class="gray">其中5星酒店<span id="TouristResourceViewForm:fiveGrogshop"></span>个，4星酒店<span 
						id="TouristResourceViewForm:fourGrogshop"></span>个，3星酒店<span 
						id="TouristResourceViewForm:threeGrogshop"></span>个</p><br/>
              <p>旅行社数量：<span 
						id="TouristResourceViewForm:travelAgency"></span>个</p>
              <p>导游数量：<span 
						id="TouristResourceViewForm:guide"></span>个</p>
            </div>
            <br/>
            </td>
			
				</tr>
				<tr id="editor_tr">
					<td style="text-align:right;">
						<span><a href="javascript:void(0);" class="easyui-linkbutton" id="btn_editor">修改</a></span>
					</td>
				</tr>
		</table> -->
		
		<!-- <div id="TouristResourceDialog" style="padding:0px;width:550px;height:470px;display: none;"> -->
		<!-- <table id="TouristResourceForm" class="form_table" style="height:100%;">
			<input type="hidden" id="TouristResourceForm:id" />
				  <tr>
					<th>
												景区数量：</th>
					<td>
												<input type="text" id="TouristResourceForm:region" validation="maxlen(22)"></input>
											</td>
				</tr>
						  <tr>
					<th>
												5A景区个数：</th>
					<td>
												<input type="text" id="TouristResourceForm:fiveRegion" validation="maxlen(22)"></input>
											</td>
				</tr>
						  <tr>
					<th>
												4A景区个数：</th>
					<td>
												<input type="text" id="TouristResourceForm:fourRegion" validation="maxlen(22)"></input>
											</td>
				</tr>
						  <tr>
					<th>
												3A景区个数：</th>
					<td>
												<input type="text" id="TouristResourceForm:threeRegion" validation="maxlen(22)"></input>
											</td>
				</tr>
						  <tr>
					<th>
												酒店数量：</th>
					<td>
												<input type="text" id="TouristResourceForm:grogshop" validation="maxlen(22)"></input>
											</td>
				</tr>
						  <tr>
					<th>
												5星酒店个数：</th>
					<td>
												<input type="text" id="TouristResourceForm:fiveGrogshop" validation="maxlen(22)"></input>
											</td>
				</tr>
						  <tr>
					<th>
												4星酒店个数：</th>
					<td>
												<input type="text" id="TouristResourceForm:fourGrogshop" validation="maxlen(22)"></input>
											</td>
				</tr>
						  <tr>
					<th>
												3星酒店个数：</th>
					<td>
												<input type="text" id="TouristResourceForm:threeGrogshop" validation="maxlen(22)"></input>
											</td>
				</tr>
						  <tr>
					<th>
												旅行社数量：</th>
					<td>
												<input type="text" id="TouristResourceForm:travelAgency" validation="maxlen(22)"></input>
											</td>
				</tr>
						  <tr>
					<th>
												导游数量：</th>
					<td>
												<input type="text" id="TouristResourceForm:guide" validation="maxlen(22)"></input>
											</td>
				</tr>
					</table> -->
	</div>
	<script>
		var mapcitycode = <%=curCityCode%>;
		var myChart = echarts.init(document.getElementById('main'));
		
		var alltotal;
		function getOption(json,legenddata,alltotal){
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

           		        text: "景区总数量："+alltotal+"个",
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
	                    return name+'景区:'+value+'个';
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
