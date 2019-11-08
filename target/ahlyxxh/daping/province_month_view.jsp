<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setAttribute("home", request.getContextPath());
String cityCode=request.getParameter("cityCode");
%>
<html>
<!--  -->
  <head>
    <title>省-月概览</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<jsp:include flush='true' page='./inc.jsp'></jsp:include>
	<jsp:include flush='true' page='../jsp/common/echarts_inc.jsp'></jsp:include>
	<link href="<%=request.getContextPath() %>/css/daping/style.css" rel="stylesheet" type="text/css" />
		<script type='text/javascript' src="<%=request.getContextPath() %>/dwr/interface/UtilsAction.js"></script>
	
  <script>
  
  var cityCode="<%=cityCode%>";
  var cityName={591:"福州市",592:"厦门市",593:"宁德市",594:"莆田市",595:"泉州市",596:"漳州市",597:"龙岩市",598:"三明市",599:"南平市"};
  var refreshTime=1000*60*60*24;
  var myDate = new Date();
  var nows = myDate.getFullYear()+"-"+(myDate.getMonth()+1)+"-"+myDate.getDate();
  $(function(){
	  
	  $("#curTime").text(nows);
	  $("#months").text(myDate.getMonth()+1);
	  $(document.body).css({
		    "overflow-x":"hidden",
		    "overflow-y":"hidden"
		  });
	  
	  
	  setInterval('loadAllData()', refreshTime);
	 
  });
  
  function loadAllData(){
	  
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
    <td class="top"><h3>安徽省月游客接待概览</h3>
      <h4>【截止<span id="curTime"></span>&#160;】</h4></td>
  </tr>
  <tr>
    <td valign="top" height="100%"><table width="100%" border="0" cellspacing="20" cellpadding="0" height="100%">
        <tr>
          <td height="50%" colspan="2" valign="top"><table width="100%" border="0" cellspacing="0" height="100%">
              <tr>
                <td width="50%" valign="top" class="radius_box"><h2 class="title_public">月度景区游客接待统计</h2>
                  <table width="100%" border="0" cellspacing="10" cellpadding="0" height="300px;">
                    <tr>
                      <td valign="top" height="264px;">
                      <iframe frameborder="0" scrolling="no" src="./ds_monthsyjdyktj.jsp" style="width: 100%;height: 100%;"></iframe>
                      </td>
                      <td valign="top" height="264px;">
                       <iframe frameborder="0" scrolling="no" src="./ds_monthbyjdyktj.jsp" style="width: 100%;height: 100%;"></iframe>
                        </td>
                    </tr>
                  </table></td>
                <td width="20px">&nbsp;</td>
                <td valign="top" class="radius_box">
                
                <h2 class="title_public" id="month" ><span id="months"></span>月份城市旅客分析</h2>
                  <table width="100%" border="0" cellspacing="10" cellpadding="0">
                    <tr>
                      <td width="50%" valign="top" height="264px;">
                      <iframe frameborder="0" scrolling="no" src="./ydjdtj.jsp" style="width: 100%;height: 100%;"></iframe>
                      </td>
                      <td valign="top" height="264px;">
                      <iframe frameborder="0" scrolling="no" src="./ydtjbt.jsp" style="width: 100%;height: 100%;"></iframe>
                        </td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td width="28%" valign="top" height="330px;">
          <iframe frameborder="0" scrolling="no" src="./dpqslyzy.jsp" style="width: 100%;height: 100%;"></iframe>
          </td>
          <td width="72%" valign="top" height="295px;">
          <iframe frameborder="0" scrolling="no" src="./ydtjxt.jsp" style="width: 100%;height: 100%;"></iframe>
            </td>
        </tr>
      </table></td>
  </tr>
</table>
</body>

</html>
