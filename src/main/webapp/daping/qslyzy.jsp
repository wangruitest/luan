<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
String curCityCode= request.getParameter("cityCode");
%>
<html>
  <head>
    <title>地市日月度人数</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<link href="<%=request.getContextPath() %>/css/daping/style.css" rel="stylesheet" type="text/css" />
	<jsp:include flush='true' page='./inc.jsp'></jsp:include>
	<jsp:include flush='true' page='../jsp/common/echarts_inc.jsp'></jsp:include>
	<script type='text/javascript' src='${home}/dwr/interface/ProvinceReceiveTouristAction.js'></script>
	<script type="text/javascript" src="${home}/js/jquery/jquery-form-plugin.js"></script>
	<script type="text/javascript" src="${home}/js/jquery/jquery-validator-plugin.js"></script>
    <script type="text/javascript" src="${home}/js/date/WdatePicker.js"></script>
	<script type="text/javascript" src="${home}/js/jquery/date-functions.js"></script>

  </head>
  
<body>	
		<table width="95%" border="0" cellspacing="0" cellpadding="0" class="layout">
		<tr>
          <td width="28%" height="45%" valign="top" class="radius_box"><h2 class="title_public">全省旅游资源</h2>
            <div class="space resource">
              <p>景区数量：321个</p>
              <p class="gray">其中5A景区102个，4A景区83个，3A景区139个</p>
              <p>酒店数量：93742个</p>
              <p class="gray">其中5星酒店52个，4星酒店103个，3星酒店166个</p>
              <p>旅行社数量：123125个</p>
              <p>导游数量：104个</p>
            </div></td>
        </tr>
	</table>
	
		<script>
		
	</script>
</body>
</html>
