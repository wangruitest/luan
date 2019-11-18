<!DOCTYPE html
    PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    request.setAttribute("home", request.getContextPath());
%>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <title>景区时时流量统计</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">

    <jsp:include flush='true' page='../common/inc.jsp'></jsp:include>
    <jsp:include flush='true' page='../common/file_inc.jsp'></jsp:include>
    <jsp:include flush='true' page='../common/echarts_inc.jsp'></jsp:include>
    <script type="text/javascript" src="${home}/dwr/interface/UtilsAction.js"></script>
    <script type='text/javascript' src='${home}/dwr/interface/RegionRealtimeSumAction.js'></script>
    <script type="text/javascript" src="${home}/js/jquery/jquery-form-plugin.js"></script>
    <script type="text/javascript" src="${home}/js/jquery/jquery-validator-plugin.js"></script>
    <script type="text/javascript" src="${home}/js/date/specialDate.js"></script>
    <script type="text/javascript" src="${home}/js/date/WdatePicker.js"></script>
    <script type="text/javascript" src="${home}/js/jquery/date-functions.js"></script>
    <jsp:include flush='true' page='RegionRealtimeSum_Manager_js.jsp'></jsp:include>
</head>

<body style="padding: 0px;margin:0px;">
    <div id="RegionRealtimeSumQueryForm" class="form_query parameter">
        <div>
            <label>城市列表：</label>
            <select id="RegionRealtimeSumQueryForm:cityCode" name="RegionRealtimeSumQueryForm:cityCode"
                onchange="provinceCityChange();" style="width:160px;"></select>
            景区评级：<select id="RegionRealtimeSumQueryForm:aLevel" onchange="levelChange();" style="width:160px;">
                <option value="">--请选择--</option>
                <option value="1">A级</option>
                <option value="2">AA级</option>
                <option value="3">AAA级</option>
                <option value="4">AAAA级</option>
                <option value="5">AAAAA级</option>
            </select>
            景区：<select id="RegionRealtimeSumQueryForm:regionId" style="width:300px;"></select>
        </div>
        <div>
            <label>统计日期：</label><input type="text" id="RegionRealtimeSumQueryForm:begindate"
                name="RegionRealtimeSumQueryForm:begindate" class="Wdate"
                onclick="WdatePicker({dateFmt:'yyyy-MM-dd',onpicking:isSpecDate($dp.cal.newdate)});" readonly="readonly"
                style="width:160px;" />
            <!--<input type="checkbox" id="RegionRealtimeSumQueryForm:holiday" value="yes"
                         style="vertical-align:middle;width:20px;"/><span style="vertical-align:middle;">是否节假日</span>-->
            <input type="checkbox" name="showTb" id="showTb" onclick="toCheck(this);"
                style="vertical-align:middle;width:20px;" />
            <span style="vertical-align:middle;">显示同比</span> 
            <a href="javascript:void(0);" class="easyui-linkbutton" icon="icon-search" id="btn_query">查询</a>
            <a href="javascript:void(0);" class="easyui-linkbutton" id="btn_exp">导出excel</a>

        </div>
    </div>
    <div class="easyui-tabs" id="tabs">
        <div id="RegionRealtimeSumListCHART" title="柱状图">
            <div id="RegionRealtimeSumListCHART0"></div>
        </div>
        <div id="RegionRealtimeSumListLine" title="曲线图">
            <div id="RegionRealtimeSumListLine0"></div>
        </div>
        <div title="数据列表">
            <table id="RegionRealtimeSumList"></table>
        </div>
    </div>
</body>

</html>