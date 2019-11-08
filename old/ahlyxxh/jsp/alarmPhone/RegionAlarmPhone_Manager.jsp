<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    request.setAttribute("home", request.getContextPath());
%>
<html>
<head>
    <title>景区预警人员配置页</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <jsp:include flush='true' page='../common/inc.jsp'></jsp:include>
    <jsp:include flush='true' page='../common/commonSelect.jsp'></jsp:include>
    <script type='text/javascript' src='${home}/dwr/interface/RegionAlarmPhoneAction.js'></script>
    <script type='text/javascript' src='${home}/dwr/interface/RegionAlarmLevelAction.js'></script>
    <script type="text/javascript" src="${home}/js/jquery/jquery-form-plugin.js"></script>
    <script type="text/javascript" src="${home}/js/jquery/jquery-validator-plugin.js"></script>
    <script type="text/javascript" src="${home}/js/date/WdatePicker.js"></script>
    <script type="text/javascript" src="${home}/js/jquery/date-functions.js"></script>
    <jsp:include flush='true' page='RegionAlarmPhone_Manager_js.jsp'></jsp:include>
	<script type="text/javascript">
	$(function(){
		$("#btn_query").on("click",function(){
			var name=$("#RegionAlarmPhoneQueryForm\\:name").val();
			name=name.replace(/(^\s+)/,'');
			name=name.replace(/(\s+$)/,'');
			if(name.length<=0){
				return ;
			}	
		});
	});
		
	</script>
</head>

<body style="margin: 0px;">
<table id="RegionAlarmPhoneQueryForm" class="form_query" style="height: 50px">
    <tr>
        <td>
            &nbsp;姓   名：<input type="text" id="RegionAlarmPhoneQueryForm:name" style="width:100px;"/>
            &nbsp;手机号码：<input type="text" id="RegionAlarmPhoneQueryForm:phone" style="width:100px;"/>
            &nbsp;景区名称：<select id="RegionAlarmPhoneQueryForm:regionId" style="width:100px;"></select>
            <a href="javascript:void(0);" class="easyui-linkbutton" icon="icon-search" id="btn_query">查询</a>
            <a href="javascript:void(0);" class="easyui-linkbutton" id="btn_reset">重置</a>
        </td>
    </tr>
</table>
<table id="RegionAlarmPhoneList"></table>

<div id="RegionAlarmPhoneDialog" style="padding:0px;width:380px;height:250px;">
    <table id="RegionAlarmPhoneForm" class="form_table" style="height:100%;">
        <input type="hidden" id="RegionAlarmPhoneForm:id" validation="maxlen(36)"/>
        <tr>
            <th>
                <font color="red">*</font>&#160;
                姓名：
            </th>
            <td>
                <input type="text" id="RegionAlarmPhoneForm:name" validation="require;maxlen(22)"/>
            </td>
        </tr>
        <tr>
            <th>
                <font color="red">*</font>&#160;
                手机号码：
            </th>
            <td>
                <input type="text" id="RegionAlarmPhoneForm:phone" validation="require;mobile;maxlen(11,'手机号码为11位数字')"/>
            </td>
        </tr>
        <tr>
            <th>
                <font color="red">*</font>&#160;
                预警景区：
            </th>
            <td>
                <input type="text" id="RegionAlarmPhoneForm:regions" validation="require" readonly="readonly" style="width:70%;background-color: #cad0cd"/>
                <a href="javascript:void(0);" class="easyui-linkbutton" id="btn_select_regions">选择</a>
            </td>
        </tr>

    </table>
    <table id="RegionList"></table>
</div>
</body>
</html>
