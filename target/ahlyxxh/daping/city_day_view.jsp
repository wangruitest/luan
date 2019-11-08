<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setAttribute("home", request.getContextPath());
String cityCode=request.getParameter("cityCode");
%>
<html>
<!--  -->
  <head>
    <title>地市-日概览</title>
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
  //var refreshTime=300000;
  $(function(){
	  $("#cityName").text(cityName[cityCode]);
	  $(document.body).css({
		    "overflow-x":"hidden",
		    "overflow-y":"hidden"
		  });
	  UtilsAction.getCurDate(function(result){
		  $("#curTime").text(result);
	  });
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
    <td class="top"><h3><span id="cityName"></span>今日景区游客接待概览</h3>
      <h4>【<span id="curTime"></span>&#160;更新】</h4></td>
  </tr>
  <tr>
    <td valign="top" height="100%">
     <table border="0" cellspacing="20" cellpadding="0" height="100%" width="100%">
        <tr style="height: 300px;">
          <td colspan="2" valign="top" class="radius_box">
          <iframe frameborder="0" scrolling="no"  src="./ds_diturlt.jsp?cityCode=<%=cityCode %>" style="width: 100%;height: 100%;"></iframe>
          
          </td>
          <td width="25%" valign="top">
          <iframe frameborder="0" scrolling="no" src="./dpqslyzy.jsp?type=1&cityCode=<%=cityCode %>" style="width: 100%;height: 100%;"></iframe>
          
          </td>
        </tr>
        <tr>
          <td colspan="2" valign="top" class="radius_box"><h2 class="title_public">今日接待</h2>
            <table border="0" cellspacing="0" cellpadding="0" style="height:100%;width: 100%;">
              <tr>
                <td valign="top"><table width="100%" cellpadding="0" height="85%" cellspacing="10">
                    <tr valign="top">
                      <td width="25%">
						<iframe frameborder="0" scrolling="no" src="./ds_jrjdtj.jsp?cityCode=<%=cityCode %>" style="width: 100%;height: 100%;"></iframe>
						</td>
                      <td  width="35%">
						<iframe frameborder="0" scrolling="no" src="./ds_rykly.jsp?cityCode=<%=cityCode %>" style="width: 100%;height: 100%;"></iframe>
                      </td>
                      <td  width="40%">
						<iframe frameborder="0" scrolling="no" src="./jqykjdph.jsp?cityCode=<%=cityCode %>" style="width: 100%;height: 100%;"></iframe>
                      </td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
          <td width="25%" valign="top" class="radius_box">
			<iframe frameborder="0" scrolling="no" src="./ds_dayydrs.jsp?cityCode=<%=cityCode %>" style="width: 100%;height: 100%;"></iframe>
          </td>
        </tr> 
      </table> 
      </td>
  </tr>
</table>
</body>

</html>
