<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.Date" %>
<%@page import="com.funo.report.*" %>
<%
    request.setAttribute("home", request.getContextPath());
	String today = DateUtil.format(new Date(), "yyyy");
%>
<html>
<head>
    <title>景区游客驻留时间分析</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <jsp:include flush='true' page='../common/inc.jsp'/>
    <jsp:include flush='true' page='../common/echarts_inc.jsp'/>
    <script type="text/javascript" src="${home}/dwr/interface/UtilsAction.js"></script>
    <script type='text/javascript' src='${home}/dwr/interface/RegionRemainAction.js'></script>
    <script type="text/javascript" src="${home}/js/jquery/jquery-form-plugin.js"></script>
    <script type="text/javascript" src="${home}/js/jquery/jquery-validator-plugin.js"></script>
    <script type="text/javascript" src="${home}/js/date/WdatePicker.js"></script>
    <script type="text/javascript" src="${home}/js/jquery/date-functions.js"></script>
    <jsp:include flush='true' page='RegionRemain_Manager_js.jsp'/>
    <style type="text/css">
        #RegionRemainQueryForm{
            background-color: #E3EFFF;
            width:100%;
            padding: 3px 0px 5px 0px;
            line-height: 24px;
            font-size :12px;
        }
        #RegionRemainQueryForm div{
            padding: 2px;
            height: 24px;
        }
        #RegionRemainQueryForm label{
            margin: 2px;
        }
        #RegionRemainQueryForm input[type=text]{
            width: 100px;
            height: 20px;
        }
        #RegionRemainQueryForm select{
            width: 104px;
            height: 22px;
        }
    </style>
</head>

<body style="margin: 0px;">
<div id="RegionRemainQueryForm" class="form_query" >
    <div>
        <label>游客来源:</label>
        <select id="RegionRemainQueryForm:areaCode" >
            <option value="0">全部游客</option>
            <option value="1">本省游客</option>
            <option value="2">外省游客</option>
        </select>
        <label>所属地市:</label>
        <select id="RegionRemainQueryForm:cityCode" name="RegionRemainQueryForm:cityCode" onchange="cityChange();" style="width:100px;"></select>
        <label>景区评级:</label>
        <select id="RegionRemainQueryForm:aLevel" onchange="levelChange();" >
            <option value="">--请选择--</option>
            <option value="1">A级</option>
            <option value="2">AA级</option>
            <option value="3">AAA级</option>
            <option value="4">AAAA级</option>
            <option value="5">AAAAA级</option>
        </select>
        <label>景区:</label>
        <select id="RegionRemainQueryForm:regionId" ></select>
        <a class="easyui-linkbutton" icon="icon-search" id="btn_query" onclick="searchValidate();">查询</a>
        <!--<a href="javascript:void(0);" class="easyui-linkbutton" id="btn_reset">重置</a>-->

    </div>
    <div>
        <label>查询方式:</label>
        <select id="RegionRemainQueryForm:searchtype" onchange="toSearchTypeChange();">
            <option value="y">按年份查询</option>
            <option value="q">按季度查询</option>
            <option value="m"  selected="selected">按月份查询</option>
        </select>
        <span style="display: none;" id="ySearch">
            <label>开始时间:</label>
            <input type="text" style="width:100px;" id="RegionRemainQueryForm:ybegintime" name="RegionRemainQueryForm:ybegintime" class="Wdate" value="<%=today%>"
                                    onclick="WdatePicker({dateFmt:'yyyy',minDate:'#F{$dp.$D(\'RegionRemainQueryForm:yendtime\',{y:-10})}',maxDate:'#F{$dp.$D(\'RegionRemainQueryForm:yendtime\')||\'%y\'}'});"/>
            <label>结束时间:</label><input type="text" style="width:100px;" id="RegionRemainQueryForm:yendtime" name="RegionRemainQueryForm:yendtime" class="Wdate" value="<%=today%>"
                        onclick="WdatePicker({dateFmt:'yyyy',maxDate:'#F{$dp.$D(\'RegionRemainQueryForm:ybegintime\',{y:10})}',minDate:'#F{$dp.$D(\'RegionRemainQueryForm:ybegintime\')}'});"/>
        </span>
        <span style="display: none;" id="qSearch">
            <label>开始时间:</label><input type="text" style="width:100px;" id="RegionRemainQueryForm:qbegintime" name="RegionRemainQueryForm:qbegintime" class="Wdate" value="<%=today%>"
                                    onclick="WdatePicker({dateFmt:'yyyy',minDate:'#F{$dp.$D(\'RegionRemainQueryForm:qendtime\',{y:-1})}',maxDate:'#F{$dp.$D(\'RegionRemainQueryForm:qendtime\')||\'%y\'}'});"/>
            <select id="RegionRemainQueryForm:qquarterbegin" name="RegionRemainQueryForm:qquarterbegin">
                <option selected="selected" value="1">第一季度</option>
                <option value="2">第二季度</option>
                <option value="3">第三季度</option>
                <option value="4">第四季度</option>
            </select>
            <label>结束时间:</label>
            <input type="text" style="width:100px;" id="RegionRemainQueryForm:qendtime" name="RegionRemainQueryForm:qendtime" class="Wdate" value="<%=today%>"
                        onclick="WdatePicker({dateFmt:'yyyy',maxDate:'#F{($dp.$D(\'RegionRemainQueryForm:qbegintime\',{y:1}))}',minDate:'#F{$dp.$D(\'RegionRemainQueryForm:qbegintime\')}'});"/>
            <select id="RegionRemainQueryForm:qquarterend" name="RegionRemainQueryForm:qquarterend">
                <option selected="selected" value="1">第一季度</option>
                <option value="2">第二季度</option>
                <option value="3">第三季度</option>
                <option value="4">第四季度</option>
            </select>
        </span>
        <span style="display: none;" id="mSearch">
            <label>开始时间:</label>
            <input type="text" style="width:100px;" id="RegionRemainQueryForm:mbegintime" name="RegionRemainQueryForm:mbegintime" class="Wdate" 
                                    onclick="WdatePicker({dateFmt:'yyyy-MM',minDate:'#F{$dp.$D(\'RegionRemainQueryForm:mendtime\',{M:-10})}',maxDate:'#F{$dp.$D(\'RegionRemainQueryForm:mendtime\')||\'%y-%M\'}'});"/>
            <label>结束时间:</label>
            <input type="text" style="width:100px;" id="RegionRemainQueryForm:mendtime" name="RegionRemainQueryForm:mendtime" class="Wdate"
                        onclick="WdatePicker({dateFmt:'yyyy-MM',maxDate:'#F{($dp.$D(\'RegionRemainQueryForm:mbegintime\',{M:10}))}',minDate:'#F{$dp.$D(\'RegionRemainQueryForm:mbegintime\')||\'%y-%M\'}'});"/>
        </span>

    </div>
</div>

<div class="easyui-tabs" id="tabs">
    <div title="柱状图" id="RegionRemainListCHART">
        <div id="RegionRemainListCHART0"></div>
    </div>
    <div title="数据列表">
        <table id="RegionRemainList"></table>
    </div>
</div>


</body>
</html>
