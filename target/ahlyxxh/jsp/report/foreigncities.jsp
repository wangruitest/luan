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
    <title>省外地市游客来源地分析</title>
    <script type="text/javascript" src="../../dwr/interface/ReportDwrUtil.js"></script>
    <script type="text/javascript" src="../../dwr/interface/ChartReportCommonUtil.js"></script>
    <script type="text/javascript" src="../../dwr/interface/ReportExportExcel.js"></script>
    <script type="text/javascript" src="../../dwr/interface/UtilsAction.js"></script>
    <script type="text/javascript" src="../../dwr/interface/RegionCfgAction.js"></script>
    <script type='text/javascript' src='../../dwr/interface/RegionRealtimeSumAction.js'></script>
    <%@include file="/jsp/common/easyuicommon.jsp" %>
    <jsp:include flush='true' page='../common/echarts_inc.jsp'></jsp:include>
    <jsp:include flush='true' page='../common/file_inc.jsp'></jsp:include>
</head>

<script>
    var areaCodes = "";//获取选择地区的字符串
    var areaCount = 0; //获取选择地区个数
    $(function () {
    	initForm();
        $("#ForeignCitiesSumList").datagrid({
            title:'省外地市游客来源地分析',
            singleSelect: true,
            pagination: true,
            rownumbers:true,
            height:getViewportHeight()-98,
            border:false,
            pageSize: 20,
            fitColumns: true,
            columns: [[
				{field: 'regionName', title: '景区名称', width: 100},
                {field: 'city', title: '地区名称', width: 100},
                {
                    field: 'ABC', title: '游客数量（人次）', width: 100, formatter: function (index, obj) {
                    if (null == obj)return "";
                    var result = obj['sumtourists'];
                    if (null == result)result = "";
                    return result;
                }
                }
               /*  {field: 'time', title: '统计时间', width: 100}, */
            ]]
        });
        $("#tabs").tabs({
            border:false,
            height:getViewportHeight()-68,
            onSelect:function(title){
            	var queryObj = getSearchForm();
            	if(!valid(queryObj)) return;
            	query(queryObj);
            }
        });
    });
    
    function initForm() {
        //$("#btn_query").click(query);
        //$("#btn_exp").click(downloadExcel);
    	initProvinceCityList();
        initCountyList();
        getForeignprovince();
        levelChange1();
    }
    
  	//查询
    function query(queryObj) {
    	reLoadGridData(queryObj);
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
    function searchJc(){
    	var queryObj = getSearchForm();
    	if(!valid(queryObj)) return;
    	query(queryObj);
    }
    
    function exportJc() {
    	var queryObj = getSearchForm();
    	if(!valid(queryObj)) return;
        RegionRealtimeSumAction.expExcel1(queryObj, function (result) {
            if (result.resultCode == "0") {
                var fileName = result.returnObject[1] + ".xls";
                fileDownload(fileName);
            } else {
                showMsg("导出Excel时出错，可能原因为：\n" + result.resultMessage);
            }
        });
    }
  	
  //加载表格数据
    function loadData(data) {
        $('#ForeignCitiesSumList').datagrid('unselectAll');
        if (data != null && data.length > 0) {
            $('#ForeignCitiesSumList').datagrid({loadFilter:pagerFilter}).datagrid('loadData', {total:data.length,rows:data}).datagrid('getPager').pagination('select',1);
        } else {
            $('#ForeignCitiesSumList').datagrid('loadData', {total: 0, rows: []});
        }
    }
	
    function reLoadGridData(queryObj) {
    	RegionRealtimeSumAction.getForeignCities(queryObj, function (result) {
            if (result.resultCode == "0") {
                var tab= $('.tabs-selected span:first').html();
                if(tab=='数据列表'){
                    loadData(result.returnList);
                }else {
                    var obj = result.returnObject;
                    var height = document.documentElement.clientHeight - 108;
                    try {
                        var barOption = eval("(" + obj[0] + ")");
                        var barDiv = document.getElementById("ForeignCitiesListCHART0");
                        barDiv.style.height = height + "px";
                        var barChart = echarts.init(barDiv);
                        barChart.clear();
                        barChart.setOption(barOption);
                    } catch (e) {
                    }
                    try {
                        var lineOption = eval("(" + obj[1] + ")");
                        var lineDiv = document.getElementById("ForeignCitiesListLine0");
                        lineDiv.style.height = height + "px";
                        var lineChart = echarts.init(lineDiv);
                        lineChart.clear();
                        lineChart.setOption(lineOption);
                    } catch (e) {
                    }
                }
            } else {
                showMsg("省外地市游客来源地分析数据时出错，可能原因为：\n" + result.resultMessage);
            }
        });
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

    /**改变查询方式时，改变对应的日期控件**/
    function toSearchTypeChange() {
        var prefix = ["y", "q", "m","d"];
        searchTypeChange(prefix);
    }
    
    /**获取填写的查询信息，并分装成一个对象*/
    function getSearchForm(){
        var pObj = {};
        pObj.searchType = $('#searchtype').val();
        pObj.beginTime = $("#"+pObj.searchType + "BeginTime").val();
        pObj.endTime = $("#"+pObj.searchType + "EndTime").val();
        pObj.regionId = $('#regionId').val();
        pObj.regionName = $('#regionId option:selected') .text();
        pObj.qBegin = $('#qQuarterBegin').val();
        pObj.qEnd = $("#qQuarterEnd").val();
        pObj.cityid = $("#cityid").val();
        pObj.provinces_code = $("#foreignprovince").val();
        return pObj;
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
				   var quanbu  = new Option('全部','');
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
    
    //获取外省省份（除安徽省和港澳台、境外、其他）
    function getForeignprovince(){
    	var foreignprovince = document.getElementById("foreignprovince");
    	$("#foreignprovince").empty();
    	dwr.engine.setAsync(false);
		UtilsAction.getProvince(function(data){
			if(null==data || null==data.returnList)
			return;
			for (var i=0;i<data.returnList.length;i++) {
				var varItem = new Option(data.returnList[i]['provinces'],data.returnList[i]['provinces_code']);
				foreignprovince.options.add(varItem);
			}
		});
		dwr.engine.setAsync(true);
    }
		
		function initCountyList(){
			var cityid=$("#cityid").val();
			var countyid=$("#countyid");
			dwr.engine.setAsync(false);
			RegionCfgAction.getAreasListByOperator(cityid,function(data){
				$('#countyid option:selected').text("");
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
        <label>选择游客来源省份:</label>
        <select  id="foreignprovince" name="foreignprovince">
        </select>
        <label>查询方式:</label>
        <select  id="searchtype" name="searchtype" onchange="toSearchTypeChange();">
            <option value="y">按年份统计</option>
            <!-- <option value="q">按季度统计</option> -->
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
        <a class="easyui-linkbutton" icon="icon-search" name="searchbtn" id="searchbtn" onclick="searchJc();">查询</a>
        <a class="easyui-linkbutton" name="searchbtn2" id="searchbtn2" onclick="exportJc();">导出Excel</a>
    </div>
</div>

<div class="easyui-tabs" id="tabs">
    <div id="ForeignCitiesListCHART" title="柱状图" >
        <div id="ForeignCitiesListCHART0"></div>
    </div>
    <div id="ForeignCitiesListLine" title="曲线图" >
        <div id="ForeignCitiesListLine0"></div>
    </div>
    <div title="数据列表" >
        <table id="ForeignCitiesSumList"></table>
    </div>
</div>
</body>
</html>
