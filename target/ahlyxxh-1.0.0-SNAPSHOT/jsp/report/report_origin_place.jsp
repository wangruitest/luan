<%@ page language="java" pageEncoding="UTF-8" %>
<%@page import="com.funo.report.charts.ReportConstants" %>
<%@page import="java.util.Date" %>
<%@page import="com.funo.report.*" %>
<%
	Date date=new Date();
    String today = DateUtil.format(date, "yyyy");
	String month=DateUtil.format(date, "yyyy-MM");
	String day=DateUtil.format(DateUtil.getDateAfter(date, -1), "yyyy-MM-dd");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>游客来源地分析</title>
    <script type="text/javascript" src="../../dwr/interface/ReportDwrUtil.js"></script>
    <script type="text/javascript" src="../../dwr/interface/ChartReportCommonUtil.js"></script>
    <script type="text/javascript" src="../../dwr/interface/ReportExportExcel.js"></script>
    <script type="text/javascript" src="../../dwr/interface/UtilsAction.js"></script>
    <script type="text/javascript" src="../../dwr/interface/RegionCfgAction.js"></script>
    <%@include file="/jsp/common/easyuicommon.jsp" %>
    <jsp:include flush='true' page='../common/echarts_inc.jsp'></jsp:include>
    <jsp:include flush='true' page='../common/file_inc.jsp'></jsp:include>

</head>
<style type="text/css">
    	input, textarea, keygen, select, button {
		    text-rendering: auto;
		    color: initial;
		    letter-spacing: normal;
		    word-spacing: normal;
		    text-transform: none;
		    text-indent: 0px;
		    text-shadow: none;
		    display: inline-block;
		    text-align: start;
		    margin: 0em 0em 0em 0em;
		    font: 13.3333px Arial;
		    line-height:23px;
		}
    </style>
<script>
    var areaCodes = "";//获取选择地区的字符串
    var areaCount = 0; //获取选择地区个数
    $(function () {
        initProvinceCityList();
        //provinceCityChange();
        initCountyList();
        levelChange1();
        init();
        $("#gridbox").datagrid({
            title:'景区游客归属地统计',
            singleSelect: true,
            pagination: true,
            rownumbers:true,
            height:getViewportHeight()-98,
            border:false,
            pageSize: 20,
            fitColumns: true,
            columns: [[
                {field: 'TITLE', title: '地区名称', width: 100},
                {
                    field: 'ABC', title: '游客数量（人次）', width: 100, formatter: function (index, obj) {
                    if (null == obj)return "";
                    var result = obj['TOURISTCOUNT'];
                    if (null == result)result = "";
                    return result;
                }
                },
                {field: 'TIME', title: '统计时间', width: 100},
                {field: 'REGION_NAME', title: '景区名称', width: 100}
            ]]
        });
        $("#tabs").tabs({
            border:false,
            height:getViewportHeight()-68,
            onSelect:function(title){
                var pObj = getSearchForm();
                if(!valid(pObj)) return;
                if (title == '柱状图' || title == '曲线图') {
                    loadEcharts(pObj);
                }
                if (title == '数据列表') {
                    loadTableData(pObj);
                }
            }
        });
    });

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
        if (pObj.regionId == null) {
            alert("请选择景区！");
            return false;
        } 
        return true;
    }
    
    function qTimeCheck(){
    	var eValue=$("#qQuarterEnd").val();
    	var bValue=$("#qQuarterBegin").val();
    	//alert(value+"--------"+bValue);
    	var bYear= $("#qBeginTime").val();
    	var eYear= $("#qEndTime").val();
    	if(bYear<=eYear){
    		if(eValue>=bValue){
    			return true;
    		}else{
    			alert("开始时间不能大于结束时间！");
    		}
    	}else{
    		alert("开始时间不能大于结束时间！");
    	}
    }
    
    function getEndTime(){
    	var beginTime=$('#dBeginTime').val();
    	var d = new Date(beginTime);
    	d.setDate(d.getDate()+30); 
    	var month=d.getMonth()+1; 
    	var day = d.getDate(); 
    	if(month<10){ 
    	month = "0"+month; 
    	} 
    	if(day<10){ 
    	day = "0"+day; 
    	} 
    	var time = d.getFullYear()+"-"+month+"-"+day; 
    	$('#dEndTime').val(time);
    }

    /**获取填写的查询信息，并分装成一个对象*/
    function getSearchForm(){
        var pObj = {};
        pObj.searchType = $('#searchtype').val();
        pObj.beginTime = $("#"+pObj.searchType + "BeginTime").val();
        pObj.endTime = $("#"+pObj.searchType + "EndTime").val();
        pObj.regionId = $('#regionId').val();
        pObj.qBegin = $('#qQuarterBegin').val();
        pObj.qEnd = $("#qQuarterEnd").val();
        pObj.cityid = $("#cityid").val();
        pObj.province = null;
        return pObj;
    }

    /**表头参数的定义*/
    function getStaticObject() {
        var tObject = {};
        var regionName = $('#regionId').find('option:selected').text();
        tObject.regionId = $('#regionId').val();
        var regionName = regionName;
        tObject.xname = "单位（省市）";
        tObject.yname = "单位（人次）";
        tObject.caption = regionName + "游客来源地统计";
        tObject.subTitle = "针对各个景区，按照来源地进行统计游客数量，可按年、季度、月统计。";
        tObject.axisLabel={interval:0,formatter:function(val){
            return val.split('').join('\n');
        }};
        tObject.procedureName = " <%=ReportConstants.ORGIN_PLACE_PROCEDURE%>";
        tObject.PROC_PARAMS = "<%=ReportConstants.ORGIN_PLACE_PROCEDURE_PARAMS%>";
        tObject.chartTypes = "<%=ReportConstants.COLUMN3D_CHART%>,<%=ReportConstants.LINE2D_CHART%>";
        return tObject;
    }

    /**改变查询方式时，改变对应的日期控件**/
    function toSearchTypeChange() {
        var prefix = ["y", "q", "m","d"];
        searchTypeChange(prefix);
    }

    /**
     * 执行查询操作
     * **/
    function searchJc() {
        var pObj = getSearchForm();
        if(!valid(pObj)) return;
        //if(!qTimeCheck()) return;
        var tab= $('.tabs-selected span:first').html()
        if(tab=='数据列表'){
            loadTableData(pObj);
        }else{
            loadEcharts(pObj);
        }
    }

    /**
     * 加载Echarts控件
     * **/
    function loadEcharts(pObj){
        pObj.diff = getDiff(pObj);
        var dateParams =  getSearchDates(pObj);
        showEChart(pObj,dateParams,getStaticObject()); //显示图
    }

    /**
     * 加载数据列表
     * */
    function loadTableData(pObj){
        pObj.diff = getDiff(pObj);
        var dateParams =  getSearchDates(pObj);
        pObj.IS_NOT_FETCH = "true";
        showDataListTable(getStaticObject(),pObj,dateParams);
    }

    /**
     * excel导出操作
     * */
    function exportJc() {
        var number="1";
        var headerStr = ["地区名称", "游客数量（人次）", "统计时间", "景区名称"];
        var title = "景区游客来源统计";
        var pObj = getSearchForm();
        if(!valid(pObj)) return;
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
        pObj.diff = getDiff(pObj);
        toExportChart(pObj, getStaticObject(), "", headerStr, title,number);
    }


    /**默认页面初始化**/
    function init(){
        toSearchTypeChange();
        var searchtype = $('#searchtype').val();
        var myDate = new Date();
        var todaystr = myDate.getFullYear();
        if (searchtype == "y" && myDate.getMonth() == 0) {
            todaystr = (myDate.getFullYear() - 1);
        }
        $("#"+searchtype + "BeginTime").val(todaystr);
        $("#"+searchtype + "EndTime").val(todaystr);
    }
    
    function levelChange1(){
			var countyid = document.getElementById("countyid").value;
			var regionId = document.getElementById("regionId");
			var aLevel = document.getElementById("aLevel").value;
			//removeAllOptions();//删除已有的option
			$('#regionId option:selected').text("");
			$("#regionId").empty();
			if (countyid=='') {
				return;
			}
			dwr.engine.setAsync(false);
			UtilsAction.getMyRegionCfgByCounty(countyid,aLevel,function(data){
				if(null==data || null==data.returnList)return;
				if(aLevel=='0'){
				   var quanbu  = new Option('全部','0000');
				   regionId.options.add(quanbu);
				}
				for (var i=0;i<data.returnList.length;i++) {
					if(aLevel=='0'){
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
		
		function initCountyList(){
			var cityid=$("#cityid").val();
			var countyid=$("#countyid");
			dwr.engine.setAsync(false);
			RegionCfgAction.getAreasListByOperator(cityid,function(data){
				$("#countyid option:selected").text("");
				countyid.empty();
				if(null==data || null==data.returnList)return;
				//countyid.prepend("<option value='0'>全部</option>");
				for (var i=0;i<data.returnList.length;i++) {
			    countyid.append("<option value='"+ data.returnList[i]['areaid']+"'>"+ data.returnList[i]['areas'] +"</option>");
				}
			});
			dwr.engine.setAsync(true);
			levelChange1();
		}
		
</script>
<body style="margin: 0px;">
<input type="hidden" id="procedureName" name="procedureName" value="<%=ReportConstants.ORGIN_PLACE_PROCEDURE%>"/>
<input type="hidden" id="PROC_PARAMS" name="PROC_PARAMS" value="<%=ReportConstants.ORGIN_PLACE_PROCEDURE_PARAMS%>"/>
<input type="hidden" id="areaCodes" name="areaCodes"/>
<input type="hidden" id="provinces_code" name="provinces_code" value="<%=request.getParameter("provinces_code")%>"/>
<div id="parameter">
    <div >
        <label>城市列表:</label>
        <select id="cityid" name="cityid"  onchange="initCountyList();"></select>
        <label>区县列表:</label>
        <select id="countyid" name="countyid" onchange="levelChange1();"></select>
        <label>景区评级:</label>
        <select id="aLevel" name="aLevel" onchange="levelChange1();">
            <option value="0">--请选择--</option>
            <option value="1">A级</option>
            <option value="2">AA级</option>
            <option value="3">AAA级</option>
            <option value="4">AAAA级</option>
            <option value="5">AAAAA级</option>
        </select>
        <label>选择景区:</label>
        <select id="regionId" name="regionId" ></select>
        <label>查询方式:</label>
        <select  id="searchtype" name="searchtype" onchange="toSearchTypeChange();">
            <option value="y">按年份统计</option>
            <option value="q">按季度统计</option>
            <option value="m">按月份统计</option>
            <option value="d">按日期统计</option>
        </select>

        <input type="hidden" value="0" id="isHoliday" name="isHoliday"/>
        <select style="display: none;" id="regionType" name="regionType" onchange="regionTypeChangeRegion();"> </select>
    </div>
    <div >
        <span id="ySearch">
            <label>开始时间:</label>
            <input type="text" id="yBeginTime" name="yBeginTime"	value="<%=today %>" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy',minDate:'#F{$dp.$D(\'yEndTime\',{y:-10})}',maxDate:'#F{$dp.$D(\'yEndTime\')||\'%y\'}'});" />
            <label>结束时间:</label>
            <input type="text"  id="yEndTime" name="yEndTime"	value="<%=today %>" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy',maxDate:'#F{$dp.$D(\'yBeginTime\',{y:10})}',minDate:'#F{$dp.$D(\'yBeginTime\')}'});" />
        </span>
        <span style="display: none;" id="qSearch">
            <label>开始时间:</label>
            <input type="text"  id="qBeginTime" name="qBeginTime" value="<%=today %>" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy',minDate:'#F{$dp.$D(\'qEndTime\',{y:-1})}',maxDate:'#F{$dp.$D(\'qEndTime\')||\'%y\'}'});" />
            <select id="qQuarterBegin" name="qQuarterBegin">
                <option selected="selected" value="1">第一季度</option>
                <option value="2">第二季度</option>
                <option value="3">第三季度</option>
                <option value="4">第四季度</option>
            </select>
            <label>结束时间:</label>
            <input type="text"  id="qEndTime" name="qEndTime" value="<%=today %>" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy',maxDate:'#F{($dp.$D(\'qBeginTime\',{y:1}))}',minDate:'#F{$dp.$D(\'qBeginTime\')}'});" />
            <select id="qQuarterEnd" name="qQuarterEnd">
                <option selected="selected" value="1">第一季度</option>
                <option value="2">第二季度</option>
                <option value="3">第三季度</option>
                <option value="4">第四季度</option>
            </select>
        </span>
        <span style="display: none;" id="mSearch">
            <label>开始时间:</label>
            <input type="text"  id="mBeginTime" name="mBeginTime" value="<%=month %>" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM',minDate:'#F{$dp.$D(\'mEndTime\',{M:-10})}',maxDate:'#F{$dp.$D(\'mEndTime\')||\'%y-%M\'}'});" />
            <label>结束时间:</label>
            <input type="text"  id="mEndTime" name="mEndTime" class="Wdate" value="<%=month %>" onfocus="WdatePicker({dateFmt:'yyyy-MM',maxDate:'#F{($dp.$D(\'mBeginTime\',{M:10}))}',minDate:'#F{$dp.$D(\'mBeginTime\')||\'%y-%M\'}'});" />
        </span>
        <span style="display: none;" id="dSearch">
            <label>开始时间:</label>
            <input type="text" id="dBeginTime" name="dBeginTime" class="Wdate" value="<%=day %>"
                onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true,onpicked:getEndTime()})"/>
            <label>结束时间:</label>
            <input type="text" id="dEndTime" name="dEndTime" class="Wdate" value="<%=day %>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'dBeginTime\',{d:30})}',minDate:'#F{$dp.$D(\'dBeginTime\')||\'%y-%M-%d\'}'});"/>
        </span>
        <a class="easyui-linkbutton" icon="icon-search" name="searchbtn" id="searchbtn" onclick="searchValidate();">查询</a>
        <a class="easyui-linkbutton" name="searchbtn2" id="searchbtn2" onclick="exportJc();">导出Excel</a>
    </div>
</div>


<div id="tabs" class="easyui-tabs">
    <div id="<%=ReportConstants.COLUMN3D_CHART %>" title="柱状图">

    </div>
    <div id="<%=ReportConstants.LINE2D_CHART %>" title="曲线图">
    </div>
    <div id="grid" title="数据列表">
        <div id="gridboxdiv" >
            <table id="gridbox"></table>
        </div>
    </div>
</div>

</body>

</html>
 
