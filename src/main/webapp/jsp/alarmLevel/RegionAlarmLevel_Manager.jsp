<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    request.setAttribute("home", request.getContextPath());
%>
<html>
<head>
    <title>景区预警阀值配置页</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <jsp:include flush='true' page='../common/inc.jsp'></jsp:include>
    <script type='text/javascript' src='${home}/dwr/interface/RegionAlarmLevelAction.js'></script>
    <script type="text/javascript" src="${home}/js/jquery/jquery-form-plugin.js"></script>
    <script type="text/javascript" src="${home}/js/jquery/jquery-validator-plugin.js"></script>
    <script type="text/javascript" src="${home}/js/date/WdatePicker.js"></script>
    <script type="text/javascript" src="${home}/js/jquery/date-functions.js"></script>
    <jsp:include flush='true' page='RegionAlarmLevel_Manager_js.jsp'></jsp:include>

</head>

<body style="margin:0px">
<table id="RegionAlarmLevelQueryForm" class="form_query" style="height: 50px">
    <tr>
        <td>
            &nbsp;&nbsp;景区名称：<input type="text" id="RegionAlarmLevelQueryForm:regionName" style="width:100px;"/>
            &nbsp;&nbsp;当前预警级别：<select id="RegionAlarmLevelQueryForm:currentLevel" style="width:100px;">
            <option value="" >--请选择--</option>
            <option value="0" >无预警</option>
            <option value="1" >红色预警</option>
            <option value="2" >橙色预警</option>
            <option value="3" >黄色预警</option>
            <option value="4" >蓝色预警</option>
        </select>
            <a href="javascript:void(0);" class="easyui-linkbutton" icon="icon-search" id="btn_query">查询</a>
            <a href="javascript:void(0);" class="easyui-linkbutton" id="btn_reset">重置</a>
        </td>
    </tr>
</table>
<table id="RegionAlarmLevelList"></table>

<div id="RegionAlarmLevelDialog" style="padding:25px;width:500px;height:270px;">
    <table id="RegionAlarmLevelForm" class="form_table" style="height:100%;">
        <input id="RegionAlarmLevelForm:id" type="hidden">
        <tr>
            <th>
                <font color="red">*</font>&#160;
                景区名称：
            </th>
            <td>
                <select id="RegionAlarmLevelForm:regionId"> </select>

            </td>
        </tr>
        <tr>
            <th>
                <font color="red">*</font>&#160;
                红色预警(人数)：
            </th>
            <td>
                <input type="text" id="RegionAlarmLevelForm:level1Num" validation="require;number;maxlen(10);"/>
            </td>
        </tr>
        <tr>
            <th>
                <font color="red">*</font>&#160;
                橙色预警(人数)：
            </th>
            <td>
                <input type="text" id="RegionAlarmLevelForm:level2Num" validation="require;number;maxlen(10)"/>
            </td>
        </tr>
        <tr>
            <th>
                <font color="red">*</font>&#160;
                黄色预警(人数)：
            </th>
            <td>
                <input type="text" id="RegionAlarmLevelForm:level3Num" validation="require;number;maxlen(10)"/>
            </td>
        </tr>
        <tr>
            <th>
                <font color="red">*</font>&#160;
                蓝色预警(人数)：
            </th>
            <td>
                <input type="text" id="RegionAlarmLevelForm:level4Num" validation="require;number;maxlen(10)"/>
            </td>
        </tr>
    </table>
</div>
</body>
</html>
