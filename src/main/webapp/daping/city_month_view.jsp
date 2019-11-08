<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setAttribute("home", request.getContextPath());
String cityCode=request.getParameter("cityCode");
%>
<html>
<!--  -->
  <head>
    <title>地市-月概览</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<jsp:include flush='true' page='./inc.jsp'></jsp:include>
	<jsp:include flush='true' page='../jsp/common/echarts_inc.jsp'></jsp:include>
	<link href="<%=request.getContextPath() %>/css/daping/style.css" rel="stylesheet" type="text/css" />
		<script type='text/javascript' src="<%=request.getContextPath() %>/dwr/interface/UtilsAction.js"></script>
	
  <script>
  
  var cityCode="<%=cityCode%>";
  
  var cityName={340100:"合肥市",340200:"芜湖市",340300:"蚌埠市",340400:"淮南市",340500:"马鞍山市",340600:"淮北市",
		  		340700:"铜陵市",340800:"安庆市",341000:"黄山市",341100:"滁州市",341200:"阜阳市",341300:"宿州市",
		  		341500:"六安市",341600:"亳州市",341700:"池州市",341800:"宣城市"};
  var refreshTime=1000*60*60*24;
  var myDate = new Date();
  var nows = myDate.getFullYear()+"."+(myDate.getMonth()+1)+"."+myDate.getDate();
  $(function(){
	  $("#cityName").text(cityName[cityCode]);
	  $("#curTime").text(nows);
	  $("#month").text(myDate.getMonth()+1+"月份城市旅客分析");
	  $(document.body).css({
		    "overflow-x":"hidden",
		    "overflow-y":"hidden"
		  });
	  
	  
	  setInterval('loadAllData()', refreshTime);
	 
  });
  
  function loadAllData(){
	 // alert("刷新页面");
	  var frames=document.getElementsByTagName("iframe");
	  for(var i=0;i<frames.length;i++){
		  try{
			  
		  frames[i].contentWindow.loadData();
		  }catch(e){
			  //alert(e.message);
		  }
	  }
	 location.reload();
  }
  </script>
  
  </head>
 <body>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layout">
  <tr>
    <td class="top"><h3><span id="cityName"></span>月游客接待概览</h3>
      <h4>【<span id="curTime"></span>&#160;更新】</h4></td>
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
                      <iframe frameborder="0" scrolling="no" src="./ds_monthsyjdyktj.jsp?cityCode=<%=cityCode %>" style="width: 100%;height: 100%;"></iframe>
                      </td>
                      <td valign="top" height="264px;">
                       <iframe frameborder="0" scrolling="no" src="./ds_monthbyjdyktj.jsp?cityCode=<%=cityCode %>" style="width: 100%;height: 100%;"></iframe>
                        </td>
                    </tr>
                  </table></td>
                <td width="20px">&nbsp;</td>
                <td valign="top" class="radius_box">
                
                <h2 class="title_public" id="month" ></h2>
                  <table width="100%" border="0" cellspacing="10" cellpadding="0">
                    <tr>
                      <td width="50%" valign="top" height="264px;">
                      <iframe frameborder="0" scrolling="no" src="./ydjdtj.jsp?cityCode=<%=cityCode %>" style="width: 100%;height: 100%;"></iframe>
                      </td>
                   <td valign="top" height="264px;">
                      <iframe frameborder="0" scrolling="no" src="./ydtjbt.jsp?cityCode=<%=cityCode %>" style="width: 100%;height: 100%;"></iframe>
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
          <iframe frameborder="0" scrolling="no" src="./ydtjxt.jsp?cityCode=<%=cityCode %>" style="width: 100%;height: 100%;"></iframe>
            </td>
        </tr>
      </table></td>
  </tr>
</table>
</body>

</html>
