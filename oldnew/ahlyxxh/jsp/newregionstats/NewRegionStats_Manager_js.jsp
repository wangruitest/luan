<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<script type="text/javascript">
	var queryFormCach=null;
	var treeSelectCach=null;
	$(function(){

		//初始化表单元素
		initForm();
	});//结束初始化函数

//--------------------初始化和公用方法 start ------------------------
	function initForm(){
		$("#btn_query").click(searchJc);
		//query();
	}
	function toSearchTypeChange(){
		var prefixs = ["y","q","m","d"];
		searchTypeChange(prefixs);
	}
	//查询
	function query(){
		$('#NewRegionStatsList').datagrid('unselectAll');
		var queryObj = {
	id:$("#NewRegionStatsQueryForm\\:id").val(),
	regionName:$("#NewRegionStatsQueryForm\\:regionName").val(),
	cityCode:$("#NewRegionStatsQueryForm\\:cityCode").val(),
	touristtype:$("#NewRegionStatsQueryForm\\:touristtype").val(),
	distinctCounts:$("#NewRegionStatsQueryForm\\:distinctCounts").val(),
	statMonth:$("#NewRegionStatsQueryForm\\:statMonth").val(),
	submitTime:$("#NewRegionStatsQueryForm\\:submitTime").val(),
				codeGenerator:'codeGenerator'
					};
		treeSelectCach=null;
		queryFormCach=queryObj;
		
		reLoadGridData(queryObj);
	}

	function reset(){
		$("#NewRegionStatsQueryForm\\:id").val('');
		$("#NewRegionStatsQueryForm\\:regionName").val('');
		$("#NewRegionStatsQueryForm\\:cityCode").val('');
		$("#NewRegionStatsQueryForm\\:touristtype").val('');
		$("#NewRegionStatsQueryForm\\:distinctCounts").val('');
		$("#NewRegionStatsQueryForm\\:statMonth").val('');
		$("#NewRegionStatsQueryForm\\:submitTime").val('');
	}
	
	//加载表格数据
	function loadData(data){
		$('#NewRegionStatsList').datagrid('unselectAll');
		if(data!=null && data.length>0){
			$('#NewRegionStatsList').datagrid('loadData', {total:data.length,rows:data});
		}else{
			$('#NewRegionStatsList').datagrid('loadData',{total:0,rows:[]});
		}
	}

	

	function getFormObj(){
		var obj = $("#NewRegionStatsForm").getJSON().NewRegionStatsForm;
		return obj;
	}

	function reLoadGridData(queryObj){
		NewRegionStatsAction.getNewRegionStatsList(queryObj,function(result){
				if(result.resultCode=="0"){
					loadData(result.returnList);
				}else{
					showMsg("加载列表数据时出错，可能原因为：\n"+result.resultMessage);
				}
			});
	}

	function searchJc(){
		 //获取searchType、beginTime、endTime 
		 var searchType = document.getElementById("searchtype").value;
		 var beginTime = document.getElementById(searchType + "BeginTime").value;
		 var endTime = document.getElementById(searchType + "EndTime").value;

		 var qBegin = document.getElementById("qQuarterBegin").value;
		 var qEnd = document.getElementById("qQuarterEnd").value;

		 var bMonth = beginTime.substring(beginTime.indexOf('-')+1);
		 var eMonth = endTime.substring(endTime.indexOf('-')+1);

		 //时间间隔 
		 var diff = parseInt(endTime)-parseInt(beginTime);
		 var tempEndTime = endTime;
		 if(searchType=='q'){ //如果是季度的查询
			 diff=parseInt(qEnd)-parseInt(qBegin);
				beginTime += "-" + document.getElementById("qQuarterBegin").value;
			 	endTime += "-" + document.getElementById("qQuarterEnd").value;
		 	}else if(searchType=='m'){ //若为月份的查询
				diff = parseInt(eMonth,10)-parseInt(bMonth,10);
	       }else if(searchType=='d'){
				diff = parseInt(DateDiff(beginTime,endTime),10);
	         }
		   var pObject = new Object();
			 pObject.diff = diff;
			 pObject.searchType = searchType;
			 pObject.endTime = tempEndTime;
			 pObject.qEnd = qEnd;
			 pObject.eMonth = eMonth;
			 pObject.cityid =$("#NewRegionStatsQueryForm\\:cityCode").val();
			 var textval = "根据全市所有景区的游客数量进行统计排行。";
			 alert(0);
			 toShowChartnew(pObject,getStaticObject(),"",textval);
	 }
	function getStaticObject(){
		var tObject = new Object();
		 tObject.caption="景区热度统计";
		 tObject.xAxisName = "景区";
		 tObject.yAxisName ="游客人次";
		 tObject.chartTypes = "Column3D,Pie3D";
		 return tObject;
	}
	/**生成统计图像及其渲染的画板*/
	function toShowChartnew(pObject,tObject,chartType,textval){
		 var searchType = pObject.searchType;alert(111);
		 var dateParams = [];
		 var chartTypes = tObject.chartTypes;
		 var types= chartTypes.split(",");
		 for(var j=0;j<types.length;j++){
			 var timef = pObject.qEnd;
			 var timeg = pObject.endTime;
			 chartType = types[j];
			 hiddenDiv(chartType);//清除面板
			 //alert("2:"+pObject.diff);
			 for(var i =0;i<=pObject.diff;i++){
				 //以下是对渲染div的创建
				 createSubDiv(chartType,i,textval);
				//各个时间段的组装 
				var timeInt= parseInt(pObject.endTime)-i;
				if(searchType=='q'){
					if(parseInt(timef)<1){
						timef = 4;
						timeg = parseInt(timeg)-1;
						timeInt =parseInt(timeg)+"-"+ (timef);
						timef= parseInt(timef)-1;
					}else{
						timeInt =timeg+"-"+ (parseInt(timef));
						timef = timef-1;
						}
				}else if(searchType=='m'){
					var year = pObject.endTime.substring(0,5);
					if(pObject.eMonth-i<10) timeInt = year+"0"+(pObject.eMonth-i);
					else 
					  timeInt = year+(pObject.eMonth-i);	
				}else if(searchType=='d'){
					timeInt = getDiffDate(pObject.endTime,'d',-i);
				}
				dateParams[i]=timeInt;
			  }
		 }
		 // tObject.chartType= chartType;
		 // tObject.chartTypes = pObject.chartTypes;
		  showChartnew(pObject,dateParams,tObject); //显示图
		  pObject.IS_NOT_FETCH = "true";
		  showDataListTable(tObject,pObject,dateParams);
	}
	function showChartnew(pObject,dateParams,tObject){
		alert(1);
		  var searchType = document.getElementById("searchtype").value;
		  var timeType = getTimeType(searchType);//获取时间类型
		  var str = [];alert(2);
		  dwr.engine.setAsync(false);//dwr非同步 
		  NewRegionStatsAction.getChartXmlStr(pObject,dateParams,tObject,
			 function(data){
				 for(var property in data){ 
			         var bean = data[property]; 
			         str =bean;
				     for(var i =0;i<str.length;i++){
				    	var tstr ='';
				    	if(typeof tObject.noSplit =='undefined'){
				    		 tstr = dateParams[i];
				    	}
				    	var chart = new FusionCharts("../../charts/report/"+property+".swf?ChartNoDataText=查询"
				     			 		+tstr+timeType+"无数据显示", "ChartId", width, height, "0", "0");
				     	chart.setDataXML(str[i]); 
				     	chart.render(property+i); //div的渲染
				     }
			       }
		  		});
		  dwr.engine.setAsync(true);
		}
//--------------------初始化和公用方法 start ------------------------

</script>