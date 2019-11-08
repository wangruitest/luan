<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.funo.utils.Constants"%>
<%@page import="com.funo.system.model.SysOperator"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/dwr/engine.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/dwr/util.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery/jquery-1.8.1.min.js"></script>
	<link href="<%=request.getContextPath() %>/css/daping/style.css" rel="stylesheet" type="text/css" />
	<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/JqykjdAction.js'></script>
<script type="text/javascript">

$(function(){
	 loadData();
});

function loadData(){


	JqykjdAction.getProDayRealForCities(function(result){
			if(result.resultCode=="0"){
				var data = result.returnObject;	
				//	$('.nanping').html("南平市<br />("+data.np+")");
				//	$('.ningde').html("宁德市<br />("+data.nd+")");
					
				//	$('.sanming').html("三明市<br />("+data.sm+")");
				//	$('.fuzhou').html("福州市<br />("+data.fz+")");
				//	$('.putian').html("("+data.pt+")<br />莆田市");
				//	$('.longyan').html("("+data.ly+")龙岩市");
				//	$('.quanzhou').html("("+data.qz+")<br />泉州市");
				//	$('.zhangzhou').html("("+data.zz+")<br />漳州市");
				//	$('.xiamen').html("厦门市<br />("+data.xm+")");
					$('.hfroam').html("合肥市<br />("+data.hfroam+")");
					$('.whroam').html("芜湖市<br />("+data.whroam+")");
					$('.bbroam').html("蚌埠市<br />("+data.bbroam+")");
					$('.hnroam').html("淮南市<br />("+data.hnroam+")");
					$('.masroam').html("马鞍山市<br />("+data.masroam+")");
					$('.hbroam').html("淮北市<br />("+data.hbroam+")");
					$('.tlroam').html("铜陵市<br />("+data.tlroam+")");
					$('.aqroam').html("安庆市<br />("+data.aqroam+")");
					$('.hsroam').html("黄山市<br />("+data.hsroam+")");
					$('.chuzroam').html("滁州市<br />("+data.chuzroam+")");
					$('.fyroam').html("阜阳市<br />("+data.fyroam+")");
					$('.szroam').html("宿州市<br />("+data.szroam+")");
					$('.laroam').html("六安市<br />("+data.laroam+")");
					$('.hzroam').html("亳州市<br />("+data.hzroam+")");
					$('.chizroam').html("池州市<br />("+data.chizroam+")");
					$('.xcroam').html("宣城市<br />("+data.xcroam+")");
					
			}		
		});

}
</script>
<title>省日游客接待总数</title>
</head>
<body style="background-color:white;">
   <table width="100%" border="0" cellpadding="0">
    <tr valign="top">
    
     <td valign="top" height="100%">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" height="100%">
        <tr>
          <td width="100%" rowspan="2" align="center" valign="middle" >
            <div class="map">
              <img src="<%=request.getContextPath() %>/images/daping/province_map.png" style="width: 100%;height: 100%;margin-top: 25px;"  />              
                <div class="hfroam"></div>
				<div class="whroam"></div>
				<div class="bbroam"></div>
				<div class="hnroam"></div>
				<div class="masroam"></div>
				<div class="hbroam"></div>
				<div class="tlroam"></div>
				<div class="aqroam"></div>
				<div class="hsroam"></div>
				<div class="chuzroam"></div>
				<div class="fyroam"></div>
				<div class="szroam"></div>
				<div class="laroam"></div>
				<div class="hzroam"></div>
				<div class="chizroam"></div>
				<div class="xcroam"></div>
            </div>
          </td>
                        
    </tr>
   
   </table>
   </td>
   </tr>
   </table>
  </body>
</html>
