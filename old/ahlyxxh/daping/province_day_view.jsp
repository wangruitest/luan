<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setAttribute("home", request.getContextPath());
%>
<html>
<!--  -->
  <head>
    <title>省-日概览</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<jsp:include flush='true' page='./inc.jsp'></jsp:include>
	<jsp:include flush='true' page='../jsp/common/echarts_inc.jsp'></jsp:include>
	<link href="<%=request.getContextPath() %>/css/daping/style.css" rel="stylesheet" type="text/css" />
	<script type='text/javascript' src="<%=request.getContextPath() %>/dwr/interface/UtilsAction.js"></script>
	
  <script>
  
  var refreshTime=30000;
  $(function(){
	  $(document.body).css({
		    "overflow-x":"hidden",
		    "overflow-y":"hidden"
		  });
	  UtilsAction.getCurDate(function(result){
		  $("#curTime").text(result);
	  });
	  //loadAllData();
	  setInterval('loadAllData()', refreshTime);
	 
  });
  
  function loadAllData(){
	  UtilsAction.getCurDate(function(result){
		  $("#curTime").text(result);
	  });
	  
	  var frames=document.getElementsByTagName("iframe");
	  for(var i=0;i<frames.length;i++){
		  try{
			  
		  frames[i].contentWindow.loadData();
		  }catch(e){
			  //alert(e.message);
		  }
	  }
  }
  </script>
  
  </head>
 
<body>	
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layout">
  <tr>
    <td class="top"><h3><span id="cityName">安徽省</span>今日景区游客接待概览</h3>
      <h4>【<span id="curTime"></span>&#160;更新】</h4></td>
  </tr>
  <tr>
    <td valign="top" height="100%">
       <table width="100%" border="0" cellspacing="20" cellpadding="0" height="100%">
        <tr>
          <td width="40%" rowspan="2" align="center" valign="middle" class="radius_box">
            <iframe frameborder="0" scrolling="no" src="./srykzs.jsp" style="width: 99%;height: 99%;"></iframe>
          </td>
          <td  width="60%" height="55%" colspan="2" valign="top" >
             <iframe frameborder="0" scrolling="no" src="./province_jrjdtj.jsp" style="width: 99%;height: 99%;"></iframe>
          </td>
        </tr>
        <tr>
          <td height="45%" valign="top" width="28%">
            <iframe frameborder="0" scrolling="no" src="./dpqslyzy.jsp" style="width: 100%;height: 100%;"></iframe>
          </td>
          <td valign="top" width="35%">
            <iframe frameborder="0" scrolling="no" src="./sr_jqssdt.jsp" style="width: 100%;height: 100%;"></iframe>
          </td>
        </tr>
      </table> 
    </td>
  </tr>
</table>
</body>

</html>
