<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    request.setAttribute("home", request.getContextPath());
%>
<html>
<head>
    <title>景区新增游客统计</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <jsp:include flush='true' page='../common/inc.jsp'></jsp:include>
    <jsp:include flush='true' page='../common/file_inc.jsp'></jsp:include>
    <jsp:include flush='true' page='../common/echarts_inc.jsp'></jsp:include>
    <script type="text/javascript" src="${home}/dwr/interface/UtilsAction.js"></script>
    <script type='text/javascript' src='${home}/dwr/interface/RegionRealtimeSumAddAction.js'></script>
    <script type="text/javascript" src="${home}/js/jquery/jquery-form-plugin.js"></script>
    <script type="text/javascript" src="${home}/js/jquery/jquery-validator-plugin.js"></script>
    <script type="text/javascript" src="${home}/js/date/WdatePicker.js"></script>
    <script type="text/javascript" src="${home}/js/date/specialDate.js"></script>
    <script type="text/javascript" src="${home}/js/jquery/date-functions.js"></script>
    <jsp:include flush='true' page='RegionRealtimeSumAdd_Manager_js.jsp'></jsp:include>
</head>

<body style="margin: 0px;">
<table id="RegionRealtimeSumAddQueryForm" class="form_query" style="height: 65px;background-color: #E3EFFF;">
    <tr>
        <td>
            &nbsp;&nbsp;游客类型：<select id="RegionRealtimeSumAddQueryForm:areacode" style="width:100px;"></select>
            城市列表：<select id="RegionRealtimeSumAddQueryForm:cityCode" onchange="provinceCityChange();"
                         style="width:100px;"></select>
            景区评级：<select id="RegionRealtimeSumAddQueryForm:aLevel" onchange="levelChange();"
                         style="width:100px;">
                        <option value="">--请选择--</option>
                        <option value="1">A级</option>
                        <option value="2">AA级</option>
                        <option value="3">AAA级</option>
                        <option value="4">AAAA级</option>
                        <option value="5">AAAAA级</option>
                    </select>
            选择景区：<select id="RegionRealtimeSumAddQueryForm:regionId" style="width:100px;"></select>

        </td>
    </tr>
    <tr>
        <td>
            &nbsp;&nbsp;查询日期：<input type="text" id="RegionRealtimeSumAddQueryForm:begindate"
                        name="RegionRealtimeSumAddQueryForm:begindate" class="Wdate"
                        onclick="WdatePicker({dateFmt:'yyyy-MM-dd',onpicking:isSpecDate($dp.cal.newdate)});" readonly="readonly" style="width:100px;"/>
            <!--<input type="checkbox" id="RegionRealtimeSumAddQueryForm:holiday" value="yes"
                   style="vertical-align:middle;width:20px;"/><span style="vertical-align:middle;">是否节假日</span>-->

            <a href="javascript:void(0);" class="easyui-linkbutton" icon="icon-search" id="btn_query">查询</a>
            <a href="javascript:void(0);" class="easyui-linkbutton" id="btn_exp">导出excel</a>
            <input type="checkbox" name="showTb" id="showTb" onclick="toCheck(this);" style="vertical-align:middle;width:20px;"/>
            <span style="vertical-align:middle;">显示同比</span>
        </td>
    </tr>
</table>
<div class="easyui-tabs" id="tabs" style="overflow: hidden;">
    <div id="RegionRealtimeSumAddListCHART" title="柱状图" >
        <div id="RegionRealtimeSumAddListCHART0"></div>
    </div>
    <div title="数据列表" >
        <table id="RegionRealtimeSumAddList"></table>
    </div>
</div>

</body>
</html>
