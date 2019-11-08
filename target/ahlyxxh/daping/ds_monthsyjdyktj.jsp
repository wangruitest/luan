<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8"%>
<%
String curCityCode= request.getParameter("cityCode");
%>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>月度接待统计</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<jsp:include flush='true' page='./inc.jsp'></jsp:include>
	<link href="<%=request.getContextPath() %>/css/daping/style.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="<%=request.getContextPath() %>/js/jquery/FlipClock/flipclock.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/js/jquery/FlipClock/flipclock_size1.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/js/jquery/FlipClock/flipclock_size2.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/js/jquery/FlipClock/flipclock_size3.css">
	<style type="text/css">
	.flipParentDiv {
         height:78px;
         overflow-y:hidden;
         overflow:hidden;
    }
	</style>
	<script src="<%=request.getContextPath() %>/js/jquery/FlipClock/flipclock.js"></script>
	<script type='text/javascript' src='${home}/dwr/interface/ProvinceReceiveTouristAction.js'></script>
	<script type='text/javascript' src='${home}/dwr/interface/CommonAction.js'></script>
	<script>
		DWREngine.setPreHook(null);
		DWREngine.setPostHook(null);
		var mapcitycode = <%=curCityCode%>;
		var datafreshTime=60000;
		var isLoad618Data=true;
		var isfirstopen=true;
		
		var sydatestr;
		
		var oldykzs=0;//上次查询数据库记录的游客总数
		var oldysyksl=0;//上次查询数据库记录的外省游客数量
		var oldjwyksl=0;//上次查询数据库记录的境外游客数量
		var oldbsmyyksl=0;//上次查询数据库记录的本省漫游游客数量
		var newykzs=0;//查询到的游客总数
		var newysyksl=0;//查询到的外省游客数量
		var newjwyksl=0;//查询到的境外游客数量
		var newbsmyyksl=0;//查询到的本省漫游游客数量
		var eccykzs=0;//两次查询到的游客总数差
		var eccysyksl=0;//两次查询到的外省游客数量差
		var eccjwyksl=0;//两次查询到的境外游客数量差
		var eccbsmyyksl=0;//两次查询到的本省漫游游客数量差
		var jkjqs=0;
		var sxcs=0;//刷新次数
		//那么些个数字
		var cur_num;
		
		DWREngine.setAsync(false);
		loadData();//页面打开第一次获取数据
		DWREngine.setAsync(true);
		
		function loadData(){
			var obj={cityid:mapcitycode};
			ProvinceReceiveTouristAction.getLastCityMonthTourist(obj,function(result){
				if(result.resultCode=="0"){
					
					var data=result.returnObject;
					newykzs=data.ykzs;//查询到的游客总数
					newysyksl=data.wsykrs;//查询到的外省游客数量
					newjwyksl=data.jwykrs;//查询到的境外游客数量
					newbsmyyksl=data.snmyrs;//查询到的本省漫游游客数量
					sydatestr=data.statMonth;
					jkjqs=data.jkjq;
//					$('#jkjq').html(data.jkjq+"");
				}
				
			});
		}
		
		$(document).ready(function() {		
			cur_num = new FlipClock($('.cur_num'), 0, {
				clockFace: 'HourlyCounter',
				sizeLevel:2
			});			
			
			DWREngine.setAsync(false);
			var data = {
						ykzs:parseInt(newykzs),
						wsykrs:isNaN(parseInt(newysyksl))? 0:parseInt(newysyksl),
						jwykrs:isNaN(parseInt(newjwyksl))? 0:parseInt(newjwyksl),
						snmyrs:isNaN(parseInt(newbsmyyksl))? 0:parseInt(newbsmyyksl)
				};
			loadDsjrjdtjData(data);
			DWREngine.setAsync(true);
			
		//	setInterval('loadData()', refreshTime);
			
		});  
		
		//页面数字跳动
		function loadDsjrjdtjData(data){			
			var oldValue=cur_num.getTime()+"";
			if(data.ykzs.length!=oldValue.length){
				//
				cur_num = new FlipClock($('.cur_num'), getInitNum(data.ykzs), {
					clockFace: 'Counter',
					sizeLevel:2
				});
			}
			
			cur_num.setValue(parseInt(data.ykzs));
			$("#wsyksl").html(data.wsykrs+"");//外省游客数量
			$("#jwyksl").html(data.jwykrs+"");//境外游客数量
			$("#bsmyyksl").html(data.snmyrs+"");//本省漫游游客数量
			$("#sydate").html(sydatestr+"");
			$('#jkjq').html(jkjqs+"");
		}
		
		function getInitNum(curNum){
			var numLength=(curNum+"").length;
			var result="";
			for(var i=0;i<numLength;i++){
				result+="8";
			}
			return parseInt(result);
		}	
		
		
		
	</script>
  </head>
  
<body class="bg">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layout">
		<tr>
          <td width="25%" valign="top" class="radius_box"><h2 class="red_title">上月接待统计（<span id="sydate">0</span>）</h2>
      <!--     <div class="space"> <img src="images/date05.png" width="231" height="62" /> -->  
            <div class="cur_num" style="margin:12px;"></div>
            <div class="space">
              <p class="space2" style="font-size: 15px;">境外游客数量：<span class="green" id="jwyksl">0</span>人次</p>
              <p class="space2" style="font-size: 15px;">外省游客数量：<span class="green" id="wsyksl">0</span>人次</p>
              <p class="space2" style="font-size: 15px;">本省漫游游客数量：<span class="green" id="bsmyyksl">0</span>人次</p>
           	  <p class="space2" style="font-size: 15px;">监控景区数量：<span class="green" id="jkjq">0</span>个</p>
           	  </div>
           </td>
        </tr>
	</table>
  
</body>
</html>
