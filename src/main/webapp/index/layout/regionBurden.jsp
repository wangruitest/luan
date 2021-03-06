<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.funo.utils.Constants"%>
<%@page import="com.funo.system.model.SysOperator"%>
<%
	request.setAttribute("home", request.getContextPath());
	SysOperator user = null;
    if(request.getSession() != null && request.getSession().getAttribute(Constants.Session_Attribute_UserEnv) != null){
    	user = (SysOperator)request.getSession().getAttribute(Constants.Session_Attribute_UserEnv);
    }
    String curCityCode=(String)user.getOtherParams().get(Constants.CUR_CHOOSE_CITY);
%>
<!DOCTYPE html>
<html style="height: 100%">
<head>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<jsp:include flush='true' page='../../jsp/common/inc.jsp'></jsp:include>
<jsp:include flush='true' page='../../jsp/common/echarts_inc.jsp'></jsp:include>

<script type='text/javascript'
	src='<%=request.getContextPath()%>/dwr/interface/UtilsAction.js'></script>
<script type='text/javascript'
	src='<%=request.getContextPath()%>/dwr/interface/RegionCoordsAction.js'></script>
<script type='text/javascript'
	src='<%=request.getContextPath()%>/dwr/interface/RegionRealtimeSumAction.js'></script>	
	
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=vsemGPTjudgYoDhNs0kwE8mk"></script>
     <script src="<%=request.getContextPath()%>/js/map/baidurb.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery/jquery-1.9.1.min.js"></script>
<script>
	var mapcitycode = <%=curCityCode%>;
</script>
<title>景区信息</title>
<style type="text/css">
html,body {
	height: 100%;
	overflow: hidden;
}
.discharge {
    background-color: #fff;
    border: 1px solid #ccc;
    height: auto;
    opacity: 0.9;
    padding: 0 16px;
    position: absolute;
    right: 20px;
    top: 50px;
    width: 492px;
    z-index: 9999;
}
ul li{
color: #fff;
    display: inline-block;
    float: right;
    height: 20px;
    margin-right: 5px;
    text-align: center;
    width: 50px;
}
</style>

</head>
<body style="height: 100%">
	


	
		<div id="hotSite" class="nav">
			<a href="javascript:void(0);" onClick="changeSelectMap('01')"><div
					class="site_bg"></div></a> <img
				src="<%=request.getContextPath()%>/images/map/anchor.png" width="17" height="22" />
			<label class="">景点游客数量</label> 
			<label class="num"></label> <span>今日总接待</span> 
			<label class="num"></label> <span>总人数</span>
		</div>

	<!-- 折线图DIV，初始时隐藏 -->
		<div id="lineDiv" style="margin-top:20px;padding: 10px;width:900px;height:900px;">
			
			<!-- <div style="position:absolute; left:89%; top:25px;"><a href="###" onclick="openMap()">热力</a></div> -->
		</div>
	<!--实时流量-->
	<div id="realTimeInfo" class="discharge">
			<div class="mytitle clearfix">
				<h2>实时客流量</h2>
				<ul>
					<!--             	<li class="zheng">正常</li>
                <li class="yiban">一般</li>
                <li class="jin">近饱和</li>
                <li class="baohe">饱和</li>
            	<li class="chao">超饱和</li> -->
					<li class="zheng">绿色</li>
					<li class="yiban">蓝色预警</li>
					<li class="jin">黄色预警</li>
					<li class="baohe">橙色预警</li>
					<li class="chao">红色预警</li>
				</ul>
			</div>
			<div class="time">
				<a href="javascript:void(0)" class="aaa"></a> 更新时间：
			</div>
			<div class="mycontent">
				<div class="palce clearfix">

						<label class="ml10">地市选择:&nbsp;</label> 
						<select class="dropdown w70" name="citysel" id="cityList" onchange="reginChangeCity(this.value)">
							
						</select> 
						<label class="ml10">景点选择:&nbsp;</label> 
						<select class="dropdown w120" name="spotsel" id="spotsel">
							
						</select> 
						<label class="ml10">类型:&nbsp;</label> 
						<select
							class="dropdown w70" name="level" id="level">
							<option value="-1" selected="selected">全部</option>
							<option value="4">红色</option>
							<option value="3">橙色</option>
							<option value="2">黄色</option>
							<option value="1">蓝色</option>
							<option value="0">绿色</option>
						</select> 
						<input class="textInput" type="button" value="查询" onclick="searchSubmit()" />
					
				</div>
				<table width="490" class="tab" id="regionRealList">
					<tr>
						<th>景点</th>
						<th>所属地市</th>
						<th>客流量</th>
						<th>景点状态</th>
					</tr>

				</table>
			</div>
		</div>
		<!--end-->

	<div id="mapDiv" style="float: right;border-style:solid;border-width:1pt; border-color:#C1C1C1"></div>
	<div id="mapToolDiv" style="right:10px;top:40px;position:absolute;z-index:100"></div>
	<script type="text/javascript">
	
	var imgIcons=['<%=request.getContextPath()%>/daping/images/green.png','<%=request.getContextPath()%>/daping/images/blue.png',
	              '<%=request.getContextPath()%>/daping/images/yellow.png','<%=request.getContextPath()%>/daping/images/orange.png'];
	var allDaySum=0;
		var aRegionInfo = [];
	var nowCityCode="-1";
	var nowCityName="全部";
	var oldCityName="";
	var regionIds=[];
	var regionRealData=[];
	var width=document.body.clientWidth;
	var height=document.body.clientHeight;
	
		$(document).ready(function() {
			
			//$('#dataTable').height("500");
			//$('.panel-body').height("500px");
			
		    $('#mapDiv').width(width);
			$('#mapDiv').height(height);
			$('#lineDiv').width((width*0.98)-200);
			$('#lineDiv').height(height*0.71);
			$('#lineDiv').hide();
			//$('#lineMain').width((width*0.98)-220);
			//$('#lineMain').height(height*0.7); 
			
			
			oldCityName=$("#cityList").find("option:selected").text();
			
			//setInterval(reginChangeCity(nowCityCode,nowCityName), 1000);
			reloadDataForRegion();
			
			
			UtilsAction.getMyCitycode(function(data){
				
				if(null==data || null==data.returnList){
					initMap([],"");
					return;}
				var isLoad=true;
				 $("#cityList").append("<option value='-1'>全部</option>"); 
				for (var i=0;i<data.returnList.length;i++) {
					//页面不需要省级，排除
					if(data.returnList[i]['cityid'] != '340000'){
						$("#cityList").append("<option value='"+data.returnList[i]['cityid']+"'>"+data.returnList[i]['name']+"</option>");
						if(isLoad){
							reginChangeCity('-1','全部');
							nowCityCode="-1";
							nowCityName="全部";
							isLoad=false;
						}
					}
				}
			});
			//alert($("#cityList").val());
			//initMap($("#cityList").val());
		});
		
		function showInfo(regionId) {
			regionInit(regionId);
		}
		
		function initAllRegion() {
			rb.initAllRegion(aRegionInfo);
		}
		
		function reloadDataForRegion(){
			
			var checkText=$("#cityList").find("option:selected").text();
			RegionCoordsAction.getAllRegionInfo(regionIds,nowCityCode,function(data){
				/* var result = {
						total : data.length,
						rows : []
				}; */
				
				if(data[0]!=null) allDaySum=data[0].jamValue;
				for (var i = 0; i < regionRealData.length; i++) {
					for (var j = 0; j < data.length; j++) {
						if(regionRealData[i].id==data[j].regionId){
							data[j].cityId=regionRealData[i].cityName;
							break;
						}
					}
				}
				aRegionInfo = data;
				var totalNum=0;
				var totalRegion=0;
				$("#spotsel").html("");
				$("#spotsel").append("<option value='-1'>全部</option>");
				for(var i in data) {
					/* result.rows.push({
						regionName : "<a href='javascript:void(0)' onclick='showInfo(" + data[i].regionId + ")'>" + data[i].regionName + "</a>",
						peopleNum : data[i].atNum
					}); */
					totalNum+=data[i].atNum;
					totalRegion+=1;
					$("#spotsel").append("<option value='"+data[i].regionId+"'>"+data[i].regionName+"</option>");
				}
				//$('#dataTable').datagrid('loadData', result);
				$("#hotSite label").eq(0).html(checkText+"景点游客数量");
				$("#hotSite label").eq(1).html(allDaySum);
				$("#hotSite label").eq(2).html(totalNum);
				initMap(aRegionInfo,nowCityName);
				oldCityName=nowCityName;
			});
			///lineChart();
		}
		
		function lineChart(){
			RegionRealtimeSumAction.getQtimeDatasForLineByRegionCodes(regionIds,nowCityCode,function(data){
				//alert(data.resultCode);
				if(data.resultCode=='0'||data.resultCode==0){
					initLine($("#hotSite label").eq(0)+'景点游客数量',data.returnList[0],data.returnList[1]);
				}
			});
		}
		
		//CityCode=0则返回全部景区
		function reginChangeCity(cityCode,cityName){
			//$("#spotsel").html("");
			//$("#spotsel").append("<option value='-1'>全部</option>");
			nowCityCode=cityCode;
			mapcitycode=cityCode==-1||cityCode=='-1'?'340100':cityCode;
			var checkText=$("#cityList").find("option:selected").text();
			//checkText=
			cityName=checkText=="全部"?"安徽省":checkText;
			
			nowCityName=checkText;
			//getBoundary(map,cityName);
			$("#mapDiv").html("");
			$("#mapToolDiv").html("");
			
			
			var myRegionIds="";
			UtilsAction.getMyRegionCfgByOrgCode(cityCode,null,function(data){
				if(null==data || null==data.returnList)return;
				for (var i=0;i<data.returnList.length;i++) {
					myRegionIds+=data.returnList[i].id+",";
				}
				var regionData=data.returnList;
				
				regionIds=myRegionIds;
				regionRealData=regionData;
				reloadDataForRegion();
			});
			
			
			
			//$('#reginChangeCitys').dialog({top:130,left:395});
			//$('#reginChangeCitys').dialog('open');
		}
		
		function initLine(title,xAxisdata,seriesdata){
			
			//var myChart = echarts.init(document.getElementById('lineMain'));
			var option = getOption(title,xAxisdata,seriesdata);
			//myChart.setOption(option);
			 var myChart = echarts.init(document.getElementById("lineDiv"));
             //myChart.clear();
             myChart.setOption(option,true);
            
		}
		
		 function getOption(title,xAxisdata,seriesdata){
		   	    var option = {
		   	   
				color:['#87cefa'],
		    
		        tooltip : {
		        trigger: 'axis'
		        },
		        toolbox: {
		        show : true

		        },
		        xAxis : [
		        {
		            type : 'category',
		            data:xAxisdata,
		           	axisLine:{ 
		           		lineStyle:{
		           			color: '#48b'
		           		}
		           	},
		           	splitLine:{
									show:false
								},
								axisLabel:{
									textStyle:{
										color: 'black'
									},
									rotate:'0',
		            	interval:'auto'
								},
					boundaryGap : false			
		        }
		        ],
		        yAxis : [
		        { 
								type : 'value', 
								name : '单位：人', 
								nameTextStyle :{
									color: 'black'
								},
								splitNumber:5,
								axisLabel : { 
									textStyle:{
										color: 'black'
									},
									formatter: '{value}' 
								} 
						}
		         ],
		         series : [
		         {
		            name:'人数',
		            type:'line',
		            data:seriesdata,
		            markPoint : {
		                data : [
		                    {type : 'max', name: '最大值'},
		                    {type : 'min', name: '最小值'}
		                ]
		            },
		            markLine : {
		                data : [
		                    {type : 'average', name: '平均值'}
		                ]
		            }
		        }
		    ]
			};
			return option;
		  }
		
		function changeSelectMap(type){
			   var lineDiv=document.getElementById("lineDiv");
			   if(lineDiv.style.display!="none"){
				   $("#lineDiv").hide();
				   $("#realTimeInfo").show();
				   $("#mapDiv").show();
				   $("#hotSite div").eq(0).attr("class","site_bg");
			   }else{
				   $("#lineDiv").show();
				   lineChart();
				   $("#realTimeInfo").hide();
				   $("#mapDiv").hide();
				   $("#hotSite div").eq(0).attr("class","site_line_bg");

			   }
		}
	</script>
</body>
</html>