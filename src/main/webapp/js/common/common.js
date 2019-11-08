
//设置页面宽度和高度	
var width =window.top.location.href.indexOf("desktop")>=0?978: document.documentElement.clientWidth-60;
var height=window.top.location.href.indexOf("desktop")>=0?300: document.documentElement.clientHeight-160;
/** 多个图的显示
	dateParams: 包括时间的各个跨度 数组 如 2011,2010,2009
	tObject   : 包括caption、xAxisName、yAxisName、procedureName、chartType
	pObject   : 包括diff、searchType、endTime、qEnd、eMonth、areaCodes
*/
function showChart(pObject,dateParams,tObject){
  var searchType = document.getElementById("searchtype").value;
  var timeType = getTimeType(searchType);//获取时间类型
  var str = [];
  dwr.engine.setAsync(false);//dwr非同步 
  ChartReportCommonUtil.getChartXmlStr(pObject,dateParams,tObject,
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
		     	if(pObject.showTB) //是否显示同比
		     		chart.render(property+(i+1));
		     	else chart.render(property+i); //div的渲染
		     }
	       }
  		});
  dwr.engine.setAsync(true);
}

function showEChart(pObject,dateParams,tObject){
	
	dwr.engine.setAsync(false);//dwr非同步 
	var chars=new Array();
	ChartReportCommonUtil.getEChartJson(pObject,dateParams,tObject,function(data){

		var myChart;
		for(var property in data){
			var charOne=new Object();
			var chartArr = data[property];
			var i=0;
			if(pObject.showTB=='undefind'||!pObject.showTB){
				hiddenDiv(property);
			}
			for(var k=0;k<chartArr.length;k++){
				var optionStr = chartArr[k];
				var option = eval("(" + optionStr + ")");
				if(property=="Column3D"){
					barOption = option;
				}else if(property=="Pie3D"){
					pieOption = option;
				}else if(property=="Line"){
					lineOption = option;
				}
				if(pObject.showTB) //是否显示同比
				{
					try{
						//加载同比的图形控件
						var obj = document.getElementById(property+(i+1));
						if(obj=='undefined'||obj==null){
							createSubDiv(property,(i+1));
							obj = document.getElementById(property+(i+1));
						}
						myChart = echarts.init(obj);
						charOne.name=property;
						charOne.chart=myChart;
						chars.push(charOne);
						//myChart.setTheme('macarons', 'infographic');
						//var xAxis=option['xAxis'];
						//var axisLabel=(null!=xAxis?xAxis[0]:null);
						/*if(null!=tObject.axisLabel && null!=axisLabel){
							axisLabel['axisLabel']=tObject.axisLabel;
						}*/
						myChart.setOption(option,true);
					}catch(e){}
				}else {
					try{
						//加载同比的图形控件
						var obj = document.getElementById(property+i);
						if(obj=='undefined'||obj==null){
							createSubDiv(property,i);
							obj = document.getElementById(property+i);
						}
						
						myChart = echarts.init(obj);
						charOne.name=property;
						charOne.chart=myChart;
						chars.push(charOne);
						chars[i].chart.setTheme('macarons', 'infographic');
						var xAxis=option['xAxis'];
						/*var axisLabel=(null!=xAxis?xAxis[0]:null);
						if(null!=tObject.axisLabel && null!=axisLabel){
							axisLabel['axisLabel']=tObject.axisLabel;
						}*/
						myChart.setOption(option,true);
					}catch(e){}
				}
				i++;
			}
		}
		
	});
	return chars;
}

function showMSEChart(pObject,dateParams,tObject){

	ChartReportCommonUtil.getEChartJson(pObject,dateParams,tObject,function(data){

		for(var property in data){
			var optionStr = data[property];
			if(pObject.showTB=='undefind'||!pObject.showTB){
				hiddenDiv(property);
			}
			var option = eval("(" + optionStr + ")");
			if(property=="MSColumn3D"){
				barOption = option;
			}if(property=="MSLine"){
				lineOption = option;
			}
			if(pObject.showTB) //是否显示同比
			{
				try{
					createSubDiv(property,1);
					var myChart = echarts.init(document.getElementById(property+'1'));
					myChart.setOption(option);
				}catch(e){}
			}else{
				try{
					createSubDiv(property,0);
					var myChart = echarts.init(document.getElementById(property+'0'));
					myChart.setOption(option);
				}catch(e){}
			}
		}
	});
}

/** 导出显示
*/
function showExport(pObject,dateParams,tObject,headerStr,title,number){
	var searchType = document.getElementById("searchtype").value;
	var timeType = null;
	var timeType = getTimeType(searchType);//获取时间类型
	var str = [];
	dwr.engine.setAsync(false);//dwr非同步 
	ReportExportExcel.reportExport(pObject,dateParams,tObject,headerStr,title,number,{
		callback:function(data){
			if(data == null){
				alert("查询结果为空，无数据导出！");
				return;
			}
			var fileName=data[1]+".xls";
			fileDownload(fileName);
		}});
	dwr.engine.setAsync(true);
}

/***
 * 获取时间类型
 * @param searchType
 * @return
 */
function getTimeType(searchType){
	if("q"==(searchType)) {
		timeType = "季度";
	}else if("m"==(searchType)){
		timeType = "月";
	}
	else if("d"==searchType){
		timeType="日";
	}
	else if("w"==searchType){
		timeType ="周";
	}else{
		timeType ="年";
	}
	return timeType;
}

/** 隐藏显示柱状图的显示的画板 */
function hiddenDiv(divId){
	 var allDiv = document.getElementById(divId);
	 while(null!=allDiv && allDiv.firstChild){
		  var oldNode =allDiv.removeChild(allDiv.firstChild);
		  oldNode = null;
	 }
}
/**创建子div*/
function createSubDiv(divId,ind){
	var allDiv = document.getElementById(divId);
	var divobj = document.createElement("div");
	var height = document.documentElement.clientHeight-108;
	divobj.id = divId+ind;
	divobj.style.display = "block";
	divobj.style.height = height+"px";
	allDiv.appendChild(divobj);
}

/**生成统计图像及其渲染的画板*/
function toShowEChart(pObject,tObject,chartType,textval){
	var searchType = pObject.searchType;
	var dateParams = [];
	var chartTypes = tObject.chartTypes;
	var types= chartTypes.split(",");
	for(var j=0;j<types.length;j++){
		var timef = pObject.qEnd;
		var timeg = pObject.endTime;
		chartType = types[j];
		hiddenDiv(chartType);//清除面板
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
				if(pObject.eMonth-i==0){
					var year = pObject.endTime.substring(0,4);
					timeInt = (parseInt(year,10)-1)+"-12";
				}else if(pObject.eMonth-i<0){
					var y_diff = Math.floor((pObject.eMonth-i)/12);
					var m_diff = (pObject.eMonth-i)%12;
					var year = pObject.endTime.substring(0,4);
					var new_year = parseInt(year,10)+y_diff;
					var new_month = 12+m_diff;
					if(new_month<10) timeInt = new_year+"-0"+new_month;
					else timeInt = new_year+"-"+new_month;
				}else if(0<(pObject.eMonth-i)&&(pObject.eMonth-i)<10) {timeInt = year+"0"+(pObject.eMonth-i);}
				else
					timeInt = year+(pObject.eMonth-i);
			}else if(searchType=='d'){
				timeInt = getDiffDate(pObject.endTime,'d',-i);
			}
			dateParams[i]=timeInt;
		}
	}
	showEChart(pObject,dateParams,tObject); //显示图
	pObject.IS_NOT_FETCH = "true";
	showDataListTable(tObject,pObject,dateParams);
}

/**查询验证**/
function valid(pObj){
	if (pObj.searchType == ""||pObj.searchType==null) {
		alert("请选择查询方式");
		return false;
	}
	if (pObj.beginTime == ""||pObj.beginTime == null) {
		alert("请选择开始时间！");
		return false;
	}
	if (pObj.endTime == ""||pObj.beginTime == null) {
		alert("请选择结束时间！");
		return false;
	}
	if (pObj.cityid == ""||pObj.cityid == null) {
		alert("请选择城市列表！");
		return false;
	}
	return true;
}

/***
 * 获取开始时间与结束时间之间的所有时间点
 * @param pObject
 * @returns {Array}
 */
function getSearchDates(pObject){
	var searchType = pObject.searchType;
	var dateParams = [];
	var timef = pObject.qEnd;
	var timeg = pObject.endTime;
	for(var i =0;i<=pObject.diff;i++){
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
			if(pObject.eMonth-i==0){
				var year = pObject.endTime.substring(0,4);
				timeInt = (parseInt(year,10)-1)+"-12";
			}else if(pObject.eMonth-i<0){
				var y_diff = Math.floor((pObject.eMonth-i)/12);
				var m_diff = (pObject.eMonth-i)%12;
				var year = pObject.endTime.substring(0,4);
				var new_year = parseInt(year,10)+y_diff;
				var new_month = 12+m_diff;
				if(new_month<10) timeInt = new_year+"-0"+new_month;
				else timeInt = new_year+"-"+new_month;
			}else if(0<(pObject.eMonth-i)&&(pObject.eMonth-i)<10) {timeInt = year+"0"+(pObject.eMonth-i);}
			else
				timeInt = year+(pObject.eMonth-i);
		}else if(searchType=='d'){
			timeInt = getDiffDate(pObject.endTime,'d',-i);
		}
		dateParams[i]=timeInt;
	}
	return dateParams;
}

/**
 * 获取时间差
 * (即开始时间与结束时间之间时间隔数量)
 * **/
function getDiff(pObj){
	var diff = null;
	//时间间隔
	if(pObj.searchType == 'y'){
		diff = parseInt(pObj.endTime) - parseInt(pObj.beginTime);
	}else if (pObj.searchType == 'q') { //如果是季度的查询
		diff = parseInt(pObj.endTime) - parseInt(pObj.beginTime);
		diff = parseInt(pObj.qEnd) - parseInt(pObj.qBegin) + diff * 4;
	} else if (pObj.searchType == 'm') { //若为月份的查询
		var bYear = pObj.beginTime.substring(0,pObj.beginTime.indexOf('-'));
		var eYear = pObj.endTime.substring(0,pObj.endTime.indexOf('-'));
		var bMonth = pObj.beginTime.substring(pObj.beginTime.indexOf('-') + 1);
		var eMonth = pObj.endTime.substring(pObj.endTime.indexOf('-') + 1);
		pObj.bMonth = bMonth;
		pObj.eMonth = eMonth;
		if(bYear == eYear){
			diff = parseInt(eMonth, 10) - parseInt(bMonth, 10);
		}else{
			var y_diff = parseInt(eYear, 10) - parseInt(bYear, 10);
			diff = y_diff * 12 + parseInt(eMonth, 10) - parseInt(bMonth, 10);
		}
	} else if (pObj.searchType == 'd') {
		diff = parseInt(DateDiff(pObj.beginTime, pObj.endTime), 10);
	}
	return diff;
}

/**生成导出excel报表*/
function toExportChart(pObject,tObject,chartType,headerStr,title,number){
	 var searchType = pObject.searchType;
	 var dateParams = [];
	 var chartTypes = tObject.chartTypes;
	 var types= chartTypes.split(",");
	 for(var j=0;j<types.length;j++){
		 chartType = types[j];
		 var timef = pObject.qEnd;
		 var timeg = pObject.endTime;
		 //hiddenDiv(chartType);//清除面板
		 for(var i =0;i<=pObject.diff;i++){
			 //以下是对渲染div的创建
			// createSubDiv(chartType,i);
			//各个时间段的组装 
			var timeInt= parseInt(pObject.endTime)-i;
			if(searchType=='q'){
				//timeInt =pObject.endTime+"-"+ (parseInt(pObject.qEnd)-i);
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
				if(pObject.eMonth-i==0){
					var year = pObject.endTime.substring(0,4);
					timeInt = (parseInt(year,10)-1)+"-12";
				}else if(pObject.eMonth-i<0){
					var y_diff = Math.floor((pObject.eMonth-i)/12);
					var m_diff = (pObject.eMonth-i)%12;
					var year = pObject.endTime.substring(0,4);
					var new_year = parseInt(year,10)+y_diff;
					var new_month = 12+m_diff;
					if(new_month<10) timeInt = new_year+"-0"+new_month;
					else timeInt = new_year+"-"+new_month;
				}else if(0<(pObject.eMonth-i)&&(pObject.eMonth-i)<10) {timeInt = year+"0"+(pObject.eMonth-i);}
				else
					timeInt = year+(pObject.eMonth-i);
			}else if(searchType=='d'){
				timeInt = getDiffDate(pObject.endTime,'d',-i);
			}
			dateParams[i]=timeInt;
		  }
	 }
	 showExport(pObject,dateParams,tObject,headerStr,title,number); //显示图
}



	/*
	 *当景区类型改变时，景区也将发生变化
	 */
	function regionTypeChange(){
		var regionTypeValue = document.getElementById("regionType").value;
		if(regionTypeValue!=""){
			var regionName = document.getElementById("regionId");
			removeAllOptions();//删除已有的option
			dwr.engine.setAsync(false);
			var str;
			ReportDwrUtil.getRegionByType(regionTypeValue,function(data){
				var i=0;
				for(var property in data){
					i=i+1;
					var varItem = new Option(data[property],property);
					regionName.options.add(varItem);
				}
				if(i==0){
					var varItem = new Option('无','');
					regionName.options.add(varItem);
				}
			});
			dwr.engine.setAsync(true);
		}
	}
	
	/*删除select控件中所有的options*/
	function removeAllOptions(){
		var region = document.getElementById("regionId");
		var length = region.options.length;
		if(length>0){
			for(var i=0;i<length;i++){
				region.removeChild(region.options[region.options.length-1]);
			}
		}
	}
	//是否勾选同比的按钮
	function toCheck(pObj){
		var checkvalue=	searchValidate();
		if(pObj.checked) {
			if(!checkvalue){
				pObj.checked =false;
			}
		}
	} 
	function getMinuteInDates(date1,date2){
		 var y1=  date1.substr(0,4);
		    var y2=  date2.substr(0,4);
		    var m1 = date1.substr(5,2);
		    var m2= date2.substr(5,2);
		    var time = (y2-y1)*12+m2-m1;
		    return time;
	}

	/**显示饼状图*/
	function showPie3D(beginTime,endTime,callClass){
	  var searchType = document.getElementById("searchtype").value;
	  dwr.engine.setAsync(false);
	  var piestr;
	  if(callClass =='TouristSourcePlaceQuery') //游客来源地统计
		  TouristSourcePlaceQuery.getFusionPieXmlStr(searchType,beginTime,endTime,areaCodes,function(data){piestr = data;});
	  else if(callClass =='reportRegionHot')//归属地热点统计
		  RegionHotQuery.getFusionPieXmlStr(searchType,beginTime,endTime,areaCodes,function(data){piestr = data;});
	  else if(callClass=='reportStayDays'){ //旅游天数的统计
		  TouristStayDaysQuery.getFusionPieXmlStr(searchType,beginTime,endTime,function(data){piestr = data;});
	  }
	  var chartpie = new FusionCharts("../../charts/report/Pie3D.swf?ChartNoDataText=无数据显示", "ChartId", width, height, "0", "0");
	  chartpie.setDataXML(piestr); 
	  chartpie.render("chartpiediv");
	  dwr.engine.setAsync(true);
	}


	/**显示线状图*/
	function showLine(beginTime,endTime,callClass){
	  var searchType = document.getElementById("searchtype").value;
	  dwr.engine.setAsync(false);
	  var linestr;
	  if(callClass=='TouristSourcePlaceQuery'){ //旅客来源
		  TouristSourcePlaceQuery.getFusionLineXmlStr(searchType,beginTime,endTime,areaCodes,function(data){linestr = data; });
	  }else if(callClass=='reportStayDays'){ //旅游天数
		  TouristStayDaysQuery.getFusionLineXmlStr(searchType,beginTime,endTime,function(data){linestr = data;});
	  }
	 
	  var chartpie = new FusionCharts("../../charts/report/MSLine.swf?ChartNoDataText=无数据显示", "ChartId", width, height, "0", "0");
	  chartpie.setDataXML(linestr); 
	  chartpie.render("chartlinediv");
	  dwr.engine.setAsync(true);
	}

/***
 * 显示列表
 * @param headerStr
 * @param widthStr
 * @return
 */
function showTable(headerStr,widthStr){
	  mygrid = new dhtmlXGridObject('gridbox');
	  mygrid.setHeader(headerStr);
	  mygrid.setImagePath("../../images/dhtmlx/");
	  mygrid.setSkin("dhx_skyblue");
	  mygrid.enableMultiline(true);
	  mygrid.setInitWidthsP(widthStr);
	  mygrid.enableAutoWidth(true,width,width);
	  mygrid.enableAutoHeight(false,height-58,true);
	  mygrid.init();
	  mygrid.setIs_paging(true);
	  mygrid.setPageCount(25);
	  mygrid.setPaging_div("paging_toolbar");
	  mygrid.setPaging_callback("pagingCallback");
	  mygrid.setPaging_class_name("com.funo.report.ReportManager");
	  mygrid.sendQuery();
	  body_resize();
	}


/**
 * 设置查询方式
 * @param prefixs
 * @return
 */
function searchTypeChange(prefixs) {
	var searchType = document.getElementById("searchtype").value;
	if(searchType==""){
		searchType="0";
	}
	var isHolidayCkObj = document.getElementById("isHolidayCk");
	if (isHolidayCkObj) {
		if (searchType=="d") {
			isHolidayCkObj.disabled=false;
		}else{
			isHolidayCkObj.disabled=true;
			isHolidayCkObj.checked=false;
			document.getElementById("isHoliday").value="0";
		}
	}
	var flag;
	for(var i=0;i<prefixs.length;i++){
		searchType==prefixs[i]?flag="":flag="none";
		document.getElementById(prefixs[i]+"Search").style.display = flag;
	}
}

//安徽--获取所有节假日信息
function initHolidayList(){
	var holidayid = document.getElementById("holidayid");
	dwr.engine.setAsync(false);
	UtilsAction.getAllHolidayList(function(data){
		if(null==data || null==data.returnList)return;
		var defId=null;
		for (var i=0;i<data.returnList.length;i++) {
				var varItem = new Option(data.returnList[i]['holidayName'],data.returnList[i]['id']);
				holidayid.options.add(varItem);
				if(data.returnList[i]['holidayName']=="端午节(2015)")defId=data.returnList[i]['id'];
		}
		if(null!=defId){
			holidayid.value=defId;
		}
	});
	dwr.engine.setAsync(true);
}

/**
 * 安徽--设置查询时间范围
 * @param prefixs
 * @return
 */
function ahSetSearchTime() {
	var holidayid = document.getElementById("holidayid").value;
	dwr.engine.setAsync(false);
	UtilsAction.getHolidayById(holidayid,function(data){
		if(null==data || null==data.returnList)return;
		document.getElementById("beginTime").value=data.returnList[0]['begTime'];
		document.getElementById("endTime").value=data.returnList[0]['endTime'];
	});
	dwr.engine.setAsync(true);
}

/**
 * 页面的宽度的控制
 */
 function body_resize(){
    try{
      if(mygrid.is_paging){
        gridbox.style.height=300+"px";
      }else{
        gridbox.style.height=300+"px";
      }
    }catch(Ex){}
  }
	
function pagingCallback(current_page1){
	//self.parent.org_tree.window.current_page=current_page1;
}
/**
 * 查询验证
 * @return
 */
function searchValidate() {
	var searchtype = document.getElementById("searchtype").value;
	if(searchtype == "") {
		alert("请选择查询方式！");
		return;
	}
	var beginTime=null; 
	if(document.getElementById(searchtype+"BeginTime")!=null){
		beginTime= document.getElementById(searchtype+"BeginTime").value;
	}
	
	var endTime =null;   
	if(document.getElementById(searchtype+"EndTime")!=null){
		endTime=document.getElementById(searchtype+"EndTime").value;
	}
	
	if(beginTime=="") {
		alert("请选择开始时间！");
		return;
	}
	if(endTime == "") {
		alert("请选择结束时间！");
		return;
	}

	if(searchtype=='q'){
		 var qBegin = document.getElementById("qQuarterBegin").value;
		 var qEnd = document.getElementById("qQuarterEnd").value;
		if(beginTime==endTime&&qBegin>qEnd){
			alert('开始时间不能大于结束时间');
			return;
		}
	}
	searchJc();
	//mygrid.sendQuery();
	return true;
}

/**
 * 安徽 --查询验证
 * @return
 */
function ahSearchValidate() {
	
	searchJc();
	//mygrid.sendQuery();
	return true;
}

/**
 * 安徽--导出验证
 * @return
 */
function ahExportValidate() {
	
	exportJc();
	return true;
}

/**
 * 查询验证(演示使用)
 * @return
 */
function searchValidateYs() {
	var searchtype = document.getElementById("searchtype").value;
	if(searchtype == "") {
		alert("请选择查询方式！");
		return;
	}
	var beginTime  = document.getElementById("beginTime").value;
	var endTime    = document.getElementById("endTime").value;
	if(beginTime=="" ) {
		alert("请选择开始时间！");
		return;
	}
	if(endTime == "") {
		alert("请选择结束时间！");
		return;
	}
	/*
	if(searchtype=='m'){
		var bYear= beginTime.substring(0,4);
		var eYear = endTime.substring(0,4);
		if(bYear!==eYear){
			alert('不能跨年度选择月份！');
			return ;
		}
	}
	 */
	if(searchtype=='q'){
		var qBegin = document.getElementById("qQuarterBegin").value;
		var qEnd = document.getElementById("qQuarterEnd").value;
		if(beginTime==endTime&&qBegin>qEnd){
			alert('开始时间不能大于结束时间');
			return;
		}
	}
	searchJc();
	//mygrid.sendQuery();
	return true;
}

/**
 * 导出验证
 * @return
 */
function exportValidate() {
	var searchtype = document.getElementById("searchtype").value;
	if(searchtype == "") {
		alert("请选择查询方式！");
		return;
	}
	var beginTime=null; 
	if(document.getElementById(searchtype+"BeginTime")!=null){
		beginTime= document.getElementById(searchtype+"BeginTime").value;
	}
	
	var endTime =null;   
	if(document.getElementById(searchtype+"EndTime")!=null){
		endTime=document.getElementById(searchtype+"EndTime").value;
	}
	if(beginTime=="" ) {
		alert("请选择开始时间！");
		return;
	}
	if(endTime == "") {
		alert("请选择结束时间！");
		return;
	}

	if(searchtype=='q'){
		 var qBegin = document.getElementById("qQuarterBegin").value;
		 var qEnd = document.getElementById("qQuarterEnd").value;
		if(beginTime==endTime&&qBegin>qEnd){
			alert('开始时间不能大于结束时间');
			return;
		}
	}
	exportJc();
	return true;
}
/**
 * 导出验证
 * @return
 */
function exportValidateYs() {
	var searchtype = document.getElementById("searchtype").value;
	if(searchtype == "") {
		alert("请选择查询方式！");
		return;
	}
	var beginTime  = document.getElementById("beginTime").value;
	var endTime    = document.getElementById("endTime").value;
	if(beginTime=="" ) {
		alert("请选择开始时间！");
		return;
	}
	if(endTime == "") {
		alert("请选择结束时间！");
		return;
	}
	/*
	if(searchtype=='m'){
		var bYear= beginTime.substring(0,4);
		var eYear = endTime.substring(0,4);
		if(bYear!==eYear){
			alert('不能跨年度选择月份！');
			return ;
		}
	}
	 */
	if(searchtype=='q'){
		var qBegin = document.getElementById("qQuarterBegin").value;
		var qEnd = document.getElementById("qQuarterEnd").value;
		if(beginTime==endTime&&qBegin>qEnd){
			alert('开始时间不能大于结束时间');
			return;
		}
	}
	exportJc();
	return true;
}

/***
 * 日期比较函数
 * @param d1
 * @param d2
 * @return
 */
function CompareDate(d1,d2)
{
   return ((new Date(d1.replace(/-/g,"\/"))) > (new Date(d2.replace(/-/g,"\/"))));
}

/**
 * 日期差得获取
 * @param sDate1
 * @param sDate2
 * @return
 */
function DateDiff(sDate1,sDate2){
   var aDate,oDate1,oDate2,iDays ;
   aDate =sDate1.split('-'); 
   oDate1 = new Date(aDate[1]+'-'+aDate[2]+'-'+aDate[0]) ;
   aDate = sDate2.split('-'); 
   oDate2 = new Date(aDate[1]+'-'+ aDate[2] +'-'+aDate[0]); 
   iDays = parseInt(Math.abs(oDate1 -oDate2)/1000/60/60/24);//把相差的毫秒数转换为天数 
   return iDays ;
  }


/**
 * 获取日期的差值的天数
 * @param pDate
 * @param type
 * @param diff
 * @return
 */
function getDiffDate(pDate,type,diff){
    var StartDate =pDate;
    strDate = StartDate;
    if(strDate.indexOf("-")>-1) {
	     Arr = strDate.split("-");
	     strDate = (Arr[0]) + "" + (Arr[1].length<2?"0":"") + Arr[1] + (Arr[2].length<2?"0":"") + (Arr[2]);
    }

    if(strDate.length!=8) return false;
   
    MyDate = eval( strDate.replace( /^(\d{4})(\d{2})(\d{2})$/, "new Date($1,$2-1,$3)" ) );
    MyDate = DateAdd(type,diff,MyDate);
   // EndDate = MyDate.getFullYear() + "-" + (MyDate.getMonth()+1) + "-" + MyDate.getDate();
    
    var EndDate = MyDate.Format("yyyy-MM-dd");
    return EndDate;
}
//========================
//日期变量上加上指定时间间隔
//strInterval：s-秒；n-分；h-小时；d-天；w-周；m-月
//========================
function DateAdd(strInterval, NumDay, dtDate){
	var dtTmp = new Date(dtDate);
	if (isNaN(dtTmp))
		dtTmp = new Date();
	switch (strInterval) {
	case "s":
		return new Date(Date.parse(dtTmp) + (1000 * NumDay));
	case "n":
		return new Date(Date.parse(dtTmp) + (60000 * NumDay));
	case "h":
		return new Date(Date.parse(dtTmp) + (3600000 * NumDay));
	case "d":
		return new Date(Date.parse(dtTmp) + (86400000 * NumDay));
	case "w":
		return new Date(Date.parse(dtTmp) + ((86400000 * 7) * NumDay));
	case "m":
		return new Date(dtTmp.getFullYear(), (dtTmp.getMonth()) + NumDay, dtTmp
				.getDate(), dtTmp.getHours(), dtTmp.getMinutes(), dtTmp
				.getSeconds());
	case "y":
		return new Date((dtTmp.getFullYear() + NumDay), dtTmp.getMonth(), dtTmp
				.getDate(), dtTmp.getHours(), dtTmp.getMinutes(), dtTmp
				.getSeconds());
	}
}

//日期的格式化
Date.prototype.Format = function(fmt)   {  
 var o = {   
   "M+" : this.getMonth()+1,                 //月份    
    "d+" : this.getDate(),                    //日    
    "h+" : this.getHours(),                   //小时    
    "m+" : this.getMinutes(),                 //分    
    "s+" : this.getSeconds(),                 //秒    
   "q+" : Math.floor((this.getMonth()+3)/3), //季度    
    "S"  : this.getMilliseconds()             //毫秒    
  };   
 if(/(y+)/.test(fmt))   
   fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));   
 for(var k in o)   
    if(new RegExp("("+ k +")").test(fmt))   
  fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));   
  return fmt;   
}
function initloginerCityList(){
	var cityid = document.getElementById("cityid");
	dwr.engine.setAsync(false);
	UtilsAction.getMyCitycode(function(data){
		if(null==data || null==data.returnList)return;
		for (var i=0;i<data.returnList.length;i++) {
			//页面不需要省级，排除
			if(data.returnList[i]['cityid'] != '340000'){
				var varItem = new Option(data.returnList[i]['name'],data.returnList[i]['cityid']);
				cityid.options.add(varItem);
			}
		}
	});
	dwr.engine.setAsync(true);
}
//特殊页面处理
function initProvinceCityList(curCityCode){
	var cityid = document.getElementById("cityid");
	dwr.engine.setAsync(false);
	UtilsAction.getMyCitycode(function(data){
		if(null==data || null==data.returnList)return;
		for (var i=0;i<data.returnList.length;i++) {
			var varItem = new Option(data.returnList[i]['name'],data.returnList[i]['cityid']);
			cityid.options.add(varItem);
		}
	});
	dwr.engine.setAsync(true);
}
function provinceCityChange(){
	var cityid = document.getElementById("cityid").value;
	var regionId = document.getElementById("regionId");
	removeAllOptions();//删除已有的option
	if (cityid=='') {
		return;
	}
	dwr.engine.setAsync(false);
	if(cityid == '340000'){
		regionId.options.add(new Option("所有景区","99999999"));
		document.getElementById("regionId").disabled=true;
	}else{
		document.getElementById("regionId").disabled=false;
	}
	UtilsAction.getMyRegionCfgByOrgCode(cityid,null,function(data){
		if(null==data || null==data.returnList)return;
		var varItem = new Option("全部","0000");
		regionId.options.add(varItem);
		for (var i=0;i<data.returnList.length;i++) {
			var varItem = new Option(data.returnList[i]['regionName'],data.returnList[i]['id']);
			regionId.options.add(varItem);
		}
	});
	dwr.engine.setAsync(true);
}
function cityChange(){
	var cityid = document.getElementById("cityid").value;
	var regionId = document.getElementById("regionId");
	var aLevel = document.getElementById("aLevel").value;
	removeAllOptions();//删除已有的option
	if (cityid=='') {
		return;
	}
	dwr.engine.setAsync(false);
	UtilsAction.getMyRegionCfgByOrgCode(cityid,null,function(data){
		if(null==data || null==data.returnList)return;
		for (var i=0;i<data.returnList.length;i++) {
			if(aLevel==''){
				var varItem = new Option(data.returnList[i]['regionName'],data.returnList[i]['id']);
				regionId.options.add(varItem);
			}else if(data.returnList[i]['aLevel']==aLevel){
				var varItem = new Option(data.returnList[i]['regionName'],data.returnList[i]['id']);
				regionId.options.add(varItem);
			}
		}
	});
	dwr.engine.setAsync(true);
}
function cityChangeRegionType(){
	var cityid = document.getElementById("cityid").value;
	var regionType = document.getElementById("regionType");
	removeAllTypeOptions();//删除已有的option
	removeAllOptions();
	if (cityid=='') {
		return;
	}
	dwr.engine.setAsync(false);
	UtilsAction.getMyRegionCfgType(cityid,function(data){
		if(null==data || null==data.returnList)return;
		for (var i=0;i<data.returnList.length;i++) {
			var varItem = new Option(data.returnList[i]['typename'],data.returnList[i]['id']);
			regionType.options.add(varItem);
			if(data.returnList[i]['typename'].indexOf("景点")>=0)regionType.value=data.returnList[i]['id'];
		}
	});
	dwr.engine.setAsync(true);
	regionTypeChangeRegion();
}

function levelChange(){
	var cityid = document.getElementById("cityid").value;
	var aLevel = document.getElementById("aLevel").value;
	if(aLevel==null||aLevel.length==0){
		cityChange();
		return;
	}
	var regionId = document.getElementById("regionId");
	removeAllOptions();//删除已有的option
	if (cityid==''||aLevel=='') {
		return;
	}
	dwr.engine.setAsync(false);
	UtilsAction.getMyRegionCfgByOrgCode(cityid,null,function(data){
		if(null==data || null==data.returnList)return;
		for (var i=0;i<data.returnList.length;i++) {
			if(data.returnList[i]['aLevel']==aLevel){
				var varItem = new Option(data.returnList[i]['regionName'],data.returnList[i]['id']);
				regionId.options.add(varItem);
			}
		}
	});
	dwr.engine.setAsync(true);
}

/*删除景区类型控件中所有的options*/
function removeAllTypeOptions(){
	var region = document.getElementById("regionType");
	var length = region.options.length;
	if(length>0){
		for(var i=0;i<length;i++){
			region.removeChild(region.options[region.options.length-1]);
		}
	}
}
function regionTypeChangeRegion(){
	var cityid = document.getElementById("cityid").value;
	var regionType = document.getElementById("regionType").value;
	var regionId = document.getElementById("regionId");
	var aLevel = document.getElementById("aLevel").value;
	removeAllOptions();//删除已有的option
	if (cityid==''||regionType=='') {
		return;
	}
	dwr.engine.setAsync(false);
	UtilsAction.getMyRegionCfgByOrgCode(cityid,regionType,function(data){
		if(null==data || null==data.returnList)return;
		for (var i=0;i<data.returnList.length;i++) {
			if(aLevel==''){
				var varItem = new Option(data.returnList[i]['regionName'],data.returnList[i]['id']);
				regionId.options.add(varItem);
			}else if(data.returnList[i]['aLevel']==aLevel){
				var varItem = new Option(data.returnList[i]['regionName'],data.returnList[i]['id']);
				regionId.options.add(varItem);
			}

		}
	});
	dwr.engine.setAsync(true);
}

function levelChangeByType(){
	var cityid = document.getElementById("cityid").value;
	var regionType = document.getElementById("regionType").value;
	var regionId = document.getElementById("regionId");
	var aLevel = document.getElementById("aLevel").value;
	removeAllOptions();//删除已有的option
	if (cityid==''||regionType==''||aLevel=='') {
		return;
	}
	dwr.engine.setAsync(false);
	UtilsAction.getMyRegionCfgByOrgCode(cityid,regionType,function(data){
		if(null==data || null==data.returnList)return;
		for (var i=0;i<data.returnList.length;i++) {
			if(data.returnList[i]['aLevel']==aLevel){
				var varItem = new Option(data.returnList[i]['regionName'],data.returnList[i]['id']);
				regionId.options.add(varItem);
			}
		}
	});
	dwr.engine.setAsync(true);
}

//显示easyui数据列表
function showDataListTable(tObject,pObject,dateParams){

	ChartReportCommonUtil.getTableStr(tObject,pObject,dateParams,function(data){
		$('#gridbox').datagrid('unselectAll');
		if(data!=null && data.length>0){
			if(null!=data[1]){
				$('#gridbox').datagrid({loadFilter:pagerFilter}).datagrid('loadData', {total:data[1].length,rows:data[1]});
				$('#gridbox').datagrid('getPager').pagination('select',1);
			}else{
				$('#gridbox').datagrid('loadData',{total:0,rows:[]});
			}
		}else{
			$('#gridbox').datagrid('loadData',{total:0,rows:[]});
	 	}
  	});
}

//安徽--获取所有节假日信息
function initHolidayList(){
	var holidayid = document.getElementById("holidayid");
	dwr.engine.setAsync(false);
	UtilsAction.getAllHolidayList(function(data){
		if(null==data || null==data.returnList)return;
		var defId=null;
		for (var i=0;i<data.returnList.length;i++) {
			var varItem = new Option(data.returnList[i]['holidayName'],data.returnList[i]['id']);
			holidayid.options.add(varItem);
			if(data.returnList[i]['holidayName']=="端午节(2015)")defId=data.returnList[i]['id'];
		}
		if(null!=defId){
			holidayid.value=defId;
		}
	});
	dwr.engine.setAsync(true);
}
/**
 * 安徽--设置查询方式
 * @param prefixs
 * @return
 */
function ahSearchTypeChange(prefixs) {
	var searchType = document.getElementById("searchtype").value;
	if(searchType==""){
		searchType="0";
	}
	var isHolidayCkObj = document.getElementById("isHolidayCk");
	if (isHolidayCkObj) {
		if (searchType=="d") {
			isHolidayCkObj.disabled=false;
		}else{
			isHolidayCkObj.disabled=true;
			isHolidayCkObj.checked=false;
			document.getElementById("isHoliday").value="0";
		}
	}
	var flag;
	for(var i=0;i<prefixs.length;i++){
		searchType==prefixs[i]?flag="":flag="none";
		document.getElementById(prefixs[i]+"Search").style.display = flag;
	}
}
/**
 * 安徽--设置查询时间范围
 * @param prefixs
 * @return
 */
function ahSetSearchTime() {
	var holidayid = document.getElementById("holidayid").value;
	dwr.engine.setAsync(false);
	UtilsAction.getHolidayById(holidayid,function(data){
		if(null==data || null==data.returnList)return;
		document.getElementById("beginTime").value=data.returnList[0]['begTime'];
		document.getElementById("endTime").value=data.returnList[0]['endTime'];
	});
	dwr.engine.setAsync(true);
}
/**
 * 安徽 --查询验证
 * @return
 */
function ahSearchValidate() {

	searchJc();
	//mygrid.sendQuery();
	return true;
}
/**
 * 安徽--导出验证
 * @return
 */
function ahExportValidate() {

	exportJc();
	return true;
}
function getCountyList(){
	var cityid = document.getElementById("cityid").value;
	var countyId = document.getElementById("countyid");
	removeAllCountyOptions();//删除已有的option
	if (cityid=='') {
		return;
	}
	dwr.engine.setAsync(false);
	RegionCfgAction.getAreasList(cityid,function(data){
		if(null==data || null==data.returnList)return;
		debugger;
		var all = new Option('全部区县','0');
		countyId.options.add(all);
		for (var i=0;i<data.returnList.length;i++) {
			var varItem = new Option(data.returnList[i]['areas'],data.returnList[i]['id']);
			countyId.options.add(varItem);
		//	if(data.returnList[i]['countyId'].indexOf("景点")>=0)countyId.value=data.returnList[i]['id'];
		}
	});
	dwr.engine.setAsync(true);
//	regionTypeChangeRegion();
	
}

function removeAllCountyOptions(){
	var county = document.getElementById("countyid");
	var length = county.options.length;
	if(length>0){
		for(var i=0;i<length;i++){
			county.removeChild(region.options[county.options.length-1]);
		}
	}
	
}
