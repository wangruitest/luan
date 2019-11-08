<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8"%>
<%
String curCityCode= request.getParameter("cityCode");
%>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>地市今日接待游客</title>
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
	<script type='text/javascript' src='${home}/dwr/interface/RegionRealtimeSumAction.js'></script>
	<script type='text/javascript' src='${home}/dwr/interface/ProvinceReceiveTouristAction.js'></script>
	<script type='text/javascript' src='${home}/dwr/interface/CommonAction.js'></script>
	<script>
		var mapcitycode = <%=curCityCode%>;
		DWREngine.setPreHook(null);
		DWREngine.setPostHook(null);
		var datafreshTime=600000;
		//var refreshTime=300000;
		var isLoad618Data=true;
		var isfirstopen=true;
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
		
		var dqykzs=0;//当前跳动的游客总数
		var dqysyksl=0;//当前跳动的外省游客数量
		var dqjwyksl=0;//当前跳动的境外游客数量
		var dqbsmyyksl=0;//当前跳动的本省漫游游客数量
		
		var tdykzs=0;//下次跳动的游客总数
		var tdysyksl=0;//下次跳动的外省游客数量
		var tdjwyksl=0;//下次跳动的境外游客数量
		var tdbsmyyksl=0;//下次跳动的本省漫游游客数量
		
		var sxcs=0;//刷新次数
		var zsxcs=19;//总刷新次数
		var dqsxcs=0;//当前刷新次数
		var dbfb = [0.049,0.095,0.153,0.2,0.255,0.289,0.352,0.4,0.446,0.489,0.541,0.6,0.653,0.7,0.755,0.8,0.852,0.9,0.946,1];//10分钟每30秒刷新一次，每次显示比例		
		var cur_num;
		
		DWREngine.setAsync(false);
		getRefreshTime();
		loadData();//页面打开第一次获取数据
		DWREngine.setAsync(true);
		
		//refresh();
		function loadData(){
			var obj={cityid:mapcitycode};
			RegionRealtimeSumAction.getCityRealTimeListForDaPing(mapcitycode,function(result){
				if(result.resultCode=="0"){
					sxcs=0;//刷新次数
					dqsxcs=0;//当前刷新次数
					var data=result.returnObject;
					newykzs=data.allSum;//查询到的游客总数
					newysyksl=data.outProSum;//查询到的外省游客数量
					newjwyksl=data.outCouSum;//查询到的境外游客数量
					newbsmyyksl=data.inProSum;//查询到的本省漫游游客数量
					/* if(isfirstopen){
						firstOpenWeb(data);
					}
					getecc(); */
					var data = {
							ykzs:parseInt(newykzs),
							wsykrs:parseInt(newysyksl),
							jwykrs:parseInt(newjwyksl),
							snmyrs:parseInt(newbsmyyksl)
					};
					reloadDate(data);
				}
				
				//refresh();//刷新
			});
		}
		//没10分钟刷新一次后台数据
		function refresh(){
			setTimeout('loadData()',refreshTime);//定时刷新
		}
				
		//网页第一次打开假设第一个10分钟进入100人
		function firstOpenWeb(data){
			oldykzs=data.allSum-0;//上次查询数据库记录的游客总数
			oldysyksl=data.outProSum-0;//上次查询数据库记录的外省游客数量
			oldjwyksl=data.outCouSum-0;//上次查询数据库记录的境外游客数量
			oldbsmyyksl=data.inProSum-0;//上次查询数据库记录的本省漫游游客数量
			
			dqykzs=oldykzs;//当前跳动的游客总数
			dqysyksl=oldysyksl;//当前跳动的外省游客数量
			dqjwyksl=oldjwyksl;//当前跳动的境外游客数量
			dqbsmyyksl=oldbsmyyksl;//当前跳动的本省漫游游客数量
			
			tdykzs=oldykzs;//下次跳动的游客总数
			tdysyksl=oldysyksl;//下次跳动的外省游客数量
			tdjwyksl=oldjwyksl;//下次跳动的境外游客数量
			tdbsmyyksl=oldbsmyyksl;//下次跳动的本省漫游游客数量
			
			isfirstopen = false;
		}
		
		//计算获取下次跳动的值
		function getTddata(){
			var sycs = zsxcs-dqsxcs;//剩余刷新次数
			
			
		}
		
		//cs次数、zs总数
		function sjData(){
			
			/* if(dqsxcs<zsxcs){
				var sycs = zsxcs - dqsxcs;
				var pjysyksl = parseInt((newysyksl-dqysyksl)/sycs);//计算剩余人数平均值
				var pjwyksl = parseInt((newjwyksl-dqjwyksl)/sycs);
				var pjbsmyyksl = parseInt((newbsmyyksl-dqbsmyyksl)/sycs);
				
				var sjysyksl = parseInt(Math.random()*(pjysyksl*1.5-pjysyksl*0.5+1)+pjysyksl*0.5,10);
				var sjjwyksl = parseInt(Math.random()*(pjwyksl*1.5-pjwyksl*0.5+1)+pjwyksl*0.5,10);
				var sjbsmyyksl = parseInt(Math.random()*(pjbsmyyksl*1.5-pjbsmyyksl*0.5+1)+pjbsmyyksl*0.5,10);
				
				tdysyksl=dqysyksl + sjysyksl;
				tdjwyksl=dqjwyksl + sjjwyksl;
				tdbsmyyksl=dqbsmyyksl +sjbsmyyksl;
				//tdykzs = tdysyksl + tdjwyksl + tdbsmyyksl;
				tdykzs=dqykzs;
				var data1 = {
						ykzs:parseInt(tdykzs),
						wsykrs:parseInt(tdysyksl),
						jwykrs:parseInt(tdjwyksl),
						snmyrs:parseInt(tdbsmyyksl)
				};
				loadDsjrjdtjData(data1);
			}else{//最后一次刷新
				tdysyksl=newysyksl;
				tdjwyksl=newjwyksl;
				tdbsmyyksl=newbsmyyksl;
				tdykzs = newykzs;
				
				oldykzs=newykzs;
				oldysyksl=newysyksl;
				oldjwyksl=newjwyksl;
				oldbsmyyksl=newbsmyyksl; */
				
				var data = {
						ykzs:parseInt(tdykzs),
						wsykrs:parseInt(tdysyksl),
						jwykrs:parseInt(tdjwyksl),
						snmyrs:parseInt(tdbsmyyksl)
				};
				loadDsjrjdtjData(data);
			//}
		}
		
		//获取两次查询之间的数量差
		function getecc(){
			eccykzs=newykzs-oldykzs;//两次查询到的游客总数差
			eccysyksl=newysyksl-oldysyksl;//两次查询到的外省游客数量差
			eccjwyksl=newjwyksl-oldjwyksl;//两次查询到的境外游客数量差
			eccbsmyyksl=newbsmyyksl-oldbsmyyksl;//两次查询到的本省漫游游客数量差
		}
		
		//根据跳动次数数字页面跳转时间间隔
		function getRefreshTime(){
			refreshTime=datafreshTime/zsxcs;
		}
		
		$(document).ready(function() {		
			cur_num = new FlipClock($('.cur_num'), 0, {
				clockFace: 'Counter',
				sizeLevel:2
			});			
			
			DWREngine.setAsync(false);
			/* var data = {
						ykzs:parseInt(tdykzs),
						wsykrs:parseInt(tdysyksl),
						jwykrs:parseInt(tdjwyksl),
						snmyrs:parseInt(tdbsmyyksl)
				};
			loadDsjrjdtjData(data); */
			DWREngine.setAsync(true);
			loadData();
			setInterval('loadData()', refreshTime);
			//cur_num.setValue(564564654);
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
			dqsxcs = dqsxcs+1;
			dqykzs=tdykzs;
			dqysyksl=tdysyksl;
			dqjwyksl=tdjwyksl;
			dqbsmyyksl=tdbsmyyksl;
		//	sjData();
		}

		function getInitNum(curNum){
			var numLength=(curNum+"").length;
			var result="";
			for(var i=0;i<numLength;i++){
				result+="8";
			}
			return parseInt(result);
		}	
		
		//------------------------以下是简化的数据跳动函数
		function reloadDate(data){
			
			//alert("数据更新了："+data.ykzs);
			cur_num = new FlipClock($('.cur_num'), getInitNum(data.ykzs), {
				clockFace: 'Counter',
				sizeLevel:2
			});
			cur_num.setValue(parseInt(data.ykzs));
			$("#wsyksl").html(data.wsykrs+"");//外省游客数量
			$("#jwyksl").html(data.jwykrs+"");//境外游客数量
			$("#bsmyyksl").html(data.snmyrs+"");//本省漫游游客数量
		}
		
	</script>
  </head>
  
<body class="bg">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layout">
		<tr>
          <td width="25%" valign="top" class="radius_box"><h2 class="green_title">今日接待游客</h2>
      <!--     <div class="space"> <img src="images/date05.png" width="231" height="62" /> -->  
	           <div class="cur_num" style="margin:12px;"></div>
               <div class="space">
               <p class="space2"></p>
              <p class="space2" style="font:14px/1.4 '微软雅黑';">境外游客数量：<span class="green" id="jwyksl">0</span></p>
               <p class="space2"></p>
               <p class="space2" style="font:14px/1.4 '微软雅黑';">外省游客数量：<span class="green" id="wsyksl">0</span></p>
               
               <p class="space2"></p>
              <p class="space2" style="font:14px/1.4 '微软雅黑';">本省漫游游客数量：<span class="green" id="bsmyyksl">0</span> </p>
      			</div>
           </td>
        </tr>
	</table>
  
</body>
</html>
