<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setAttribute("home", request.getContextPath());
String cityCode=request.getParameter("cityCode");
%>
<html>
<!--  -->
  <head>
    <title>地市-年概览</title>
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

  var myDate = new Date();
  var nows = myDate.getFullYear();
  $(function(){
	  $("#cityName").text(cityName[cityCode]);
	  $("#curTime").text(nows);
	  $("#cityName1").text(cityName[cityCode]);
	  $("#curTime1").text(nows);
	  $("#month").text(myDate.getMonth()+1+"月份游客分析");
	  $(document.body).css({
		    "overflow-x":"hidden",
		    "overflow-y":"scroll"
		  });
  });
  
  //配置刷新时间
  var refreshTime={
  		  runDay: 1,//每月1号
		  runHour : 10, //10点
		  runMinute :0, //0分
		  runSecond : 0,  //0秒		  
 };
  
  function callUpdatePage(){
	  try{

		  var timeNow = new Date();  
		  //alert(timeNow.getDate()+"..."+refreshTime.runDay);
    	    if((timeNow.getSeconds() - refreshTime.runSecond == 0)
    	          &&(timeNow.getMinutes() - refreshTime.runMinute == 0)
    	    	  &&(timeNow.getHours() - refreshTime.runHour == 0)
    	    	  &&(timeNow.getDate() - refreshTime.runDay == 0)){
 
    	    	 var frames=document.getElementsByName("iframe1");
    			  for(var i=0;i<frames.length;i++){
    				  try{ 
    				  frames[i].contentWindow.loadData();
    				   //alert(frames.length+"...."+i+"....."+frames[i]);
    				  }catch(e){
    					 // alert(e.message);
    				 }
    			  }
    	    }
	  }catch(e){console.log(e);}
  }

  setInterval('callUpdatePage()', 100);	//100毫秒递归一次

  </script>
  
  </head>
<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layout">
  <tr>
    <td class="top"><h2><span id="curTime"></span>年度<span id="cityName"></span>旅游局年终盘点报表</h2></td>
  </tr>
  <tr>
    <td valign="top" height="100%"><table width="100%" border="0" cellspacing="20" cellpadding="0" height="100%">
        <tr>
          <td height="55%" colspan="2" valign="top" class="radius_box"><table width="100%" border="0" cellspacing="0" cellpadding="0" height="100%">
              <tr>
                <td class="title_public"><span id="curTime1"></span>年度<span id="cityName1"></span>景区游客接待统计</td>
              </tr>
              <tr>
                <td><table width="100%" height="100%" border="0" cellpadding="0" cellspacing="15">
                    <tr valign="top">
                      <td class="radius_box w_25" valign="top">
                      <iframe frameborder="0"  name="iframe1" scrolling="no" src="./ds_yearndykjdzs.jsp?flag=1&cityCode=<%=cityCode %>" style="width: 100%;height: 100%;"></iframe>
                      </td>
                      <td class="radius_box w_25" valign="top">
                      <iframe frameborder="0"  name="iframe1"   scrolling="no" src="./ds_yearjqykjdTop.jsp?flag=1&cityCode=<%=cityCode %>" style="width: 100%;height: 100%;"></iframe>
                      </td>
                      <td class="radius_box w_25" valign="top">
                      <iframe frameborder="0" name="iframe1" scrolling="no" src="./ndtjbt2.jsp?flag=1&cityCode=<%=cityCode %>" style="width: 100%;height: 100%;"></iframe>
                      </td>
                      <td width="100%;" valign="top" class="radius_box w_25" height="100%;">
                      <iframe frameborder="0" name="iframe1"  scrolling="no" src="./ndjdtj.jsp?flag=1&cityCode=<%=cityCode %>" style="width: 100%;height: 100%;"></iframe>
                      </td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td width="28%" height="45%" valign="top" class="radius_box">
          <iframe frameborder="0"  name="iframe1" scrolling="no" src="./dpqslyzy.jsp?flag=1&cityCode=<%=cityCode %>" style="width: 100%;height: 100%;"></iframe>
          </td>
          <td width="72%" valign="top" class="radius_box">
          <iframe frameborder="0" name="iframe1"  scrolling="no" src="./ndtjxt.jsp?flag=1&cityCode=<%=cityCode %>" style="width: 100%;height: 100%;"></iframe>
          </td>
        </tr>
      </table></td>
  </tr>
</table>
</body>

</html>
