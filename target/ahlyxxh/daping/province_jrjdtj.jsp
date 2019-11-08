<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8"%>
<%
String searchTime= request.getParameter("cityCode");
%>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>省日概览游客接待统计</title>
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
	<script type='text/javascript' src='${home}/dwr/interface/JqykjdAction.js'></script>
	<script type='text/javascript' src='${home}/dwr/interface/CommonAction.js'></script>
	<script>
		DWREngine.setPreHook(null);
		DWREngine.setPostHook(null);
		var datafreshTime=60000;
		var refreshTime=30000;
		var newdata;
		var searchTime = 0;;//刷新循环0、1、2 
		var provinceJWYK=0;//省境外游客总数
		var provinceWSYK=0;//省外省游客总数
		var provinceSNYK=0;//省省内游客总数
		var jwyk1=0;
		var jwyk2=0;
		var jwyk3=0;
		var wsyk1=0;
		var wsyk2=0;
		var wsyk3=0;
		var snyk1=0;
		var snyk2=0;
		var snyk3=0;
		var ykzs1=0;
		var ykzs2=0;
		var ykzs3=0;
	
		var isLoad618Data=true;
		var isCityFirstOpen=true;//地市第一轮刷新
		var isProvinceFirstOpen=true;//省第一轮刷新
		var sxcs=0;//刷新次数
		var zsxcs=19;//总刷新次数
		//那么些个数字
		var cur_num1,cur_num2,cur_num3;
		//,all_num,all_num_cm,sms_count,ws_today_num,ws_all_num;
		
		DWREngine.setAsync(false);
		getRefreshTime();
	//	refreshDate();//页面打开第一次获取数据
		DWREngine.setAsync(true);
		
		//根据跳动次数数字页面跳转时间间隔
		function getRefreshTime(){
			refreshTime=datafreshTime/zsxcs;
		}
		
		function loadData(){
			searchTime=searchTime+1;//9地市循环展示
			//	alert(searchTime);
				if(searchTime>5){
					searchTime=0;
					isCityFirstOpen=false;//第一轮循环完成
				}
			refreshDate();
		}
		
	//	loadData();
	//	refresh();
	
	/*
	$('#ykzs'+i).html(data.ykzs+"");
			$('#wsyk'+i).html(data.wsykrs+"");
			$('#jwyk'+i).html(data.jwykrs+"");
			$('#snyk'+i).html(data.snmyrs+"");
			
			<input type="hidden" id="0ykzs"></input>
        	<input type="hidden" id="0wsyk"></input>
        	<input type="hidden" id="0jwyk"></input>
        	<input type="hidden" id="0snyk"></input>
	*/
	
		//后台数据查询
		function refreshDate(){
			var obj = {searchTime:searchTime};
			ProvinceReceiveTouristAction.getProviceReceiveTourist(obj,function(result){
				
				if(result.resultCode=="0"){
					newdata = result.returnList;
					for(var i=0;i<result.returnList.length;i++){
						if(result.returnList[i].cityid==340000){
							var ykzs=$('#'+result.returnList[i].cityid+'ykzs').val();
							if(isProvinceFirstOpen){
								$('#'+i+'ykzs').val(result.returnList[i].ykzs-200);
								$('#'+i+'wsyk').val(result.returnList[i].wsykrs-70);
								$('#'+i+'jwyk').val(result.returnList[i].jwykrs-30);
								$('#'+i+'snyk').val(result.returnList[i].snmyrs-100);
							}else{
								
							}
							//记录下每次查询的结果
							$('#'+result.returnList[i].cityid+'ykzs').val(result.returnList[i].ykzs);
							$('#'+result.returnList[i].cityid+'wsyk').val(result.returnList[i].wsykrs);
							$('#'+result.returnList[i].cityid+'jwyk').val(result.returnList[i].jwykrs);
							$('#'+result.returnList[i].cityid+'snyk').val(result.returnList[i].snmyrs);
							isProvinceFirstOpen=false;
						//	setClockDate(result.returnList[i]);
						}else{
							if(isCityFirstOpen){
								$('#'+i+'ykzs').val(result.returnList[i].ykzs-50);
								$('#'+i+'wsyk').val(result.returnList[i].wsykrs-20);
								$('#'+i+'jwyk').val(result.returnList[i].jwykrs-5);
								$('#'+i+'snyk').val(result.returnList[i].snmyrs-25);
							}else{
								$('#'+i+'ykzs').val($('#'+result.returnList[i].cityid+'ykzs').val());
								$('#'+i+'wsyk').val($('#'+result.returnList[i].cityid+'wsyk').val());
								$('#'+i+'jwyk').val($('#'+result.returnList[i].cityid+'jwyk').val());
								$('#'+i+'snyk').val($('#'+result.returnList[i].cityid+'snyk').val());
							}
							$('#jkjq'+i).html(result.returnList[i].jkjq+"");
							//记录下每次查询的结果
							$('#'+result.returnList[i].cityid+'ykzs').val(result.returnList[i].ykzs);
							$('#'+result.returnList[i].cityid+'wsyk').val(result.returnList[i].wsykrs);
							$('#'+result.returnList[i].cityid+'jwyk').val(result.returnList[i].jwykrs);
							$('#'+result.returnList[i].cityid+'snyk').val(result.returnList[i].snmyrs);
						//	setCityDate(result.returnList[i],i);
						}
					}
				}
				freshWebData();
			});
		}
	
		//页面数据刷新
		function freshWebData(){
			if(sxcs<zsxcs){
				for(var e=0;e<newdata.length;e++){
					if(newdata[e].cityid==340000){
						var sycs=zsxcs-sxcs;
						/* var ykzs590=getShuiJi(newdata[e].ykzs,$('#'+e+'ykzs').val(),sycs);//计算跳动随机数
						var wsyk590=getShuiJi(newdata[e].wsykrs,$('#'+e+'wsyk').val(),sycs);
						var jwyk590=getShuiJi(newdata[e].jwykrs,$('#'+e+'jwyk').val(),sycs);
						var snyk590=getShuiJi(newdata[e].snmyrs,$('#'+e+'snyk').val(),sycs); */
						var ykzs590=newdata[e].ykzs;//计算跳动随机数
						var wsyk590=newdata[e].wsykrs;
						var jwyk590=newdata[e].jwykrs;
						var snyk590=newdata[e].snmyrs;
						var provincedata = {
								ykzs:parseInt(ykzs590),
								wsykrs:parseInt(wsyk590),
								jwykrs:parseInt(jwyk590),
								snmyrs:parseInt(snyk590)
						};
						setClockDate(provincedata);//页面跳动
						$('#'+e+'ykzs').val(ykzs590);//赋值，用于下次计算
						$('#'+e+'wsyk').val(wsyk590);
						$('#'+e+'jwyk').val(jwyk590);
						$('#'+e+'snyk').val(snyk590);
					}else{
						/* var cityykzs=getShuiJi(newdata[e].ykzs,$('#'+e+'ykzs').val(),sycs);//计算跳动随机数
						var citywsyk=getShuiJi(newdata[e].wsykrs,$('#'+e+'wsyk').val(),sycs);
						var cityjwyk=getShuiJi(newdata[e].jwykrs,$('#'+e+'jwyk').val(),sycs);
						var citysnyk=getShuiJi(newdata[e].snmyrs,$('#'+e+'snyk').val(),sycs); */
						var cityykzs=newdata[e].ykzs;//计算跳动随机数
						var citywsyk=newdata[e].wsykrs;
						var cityjwyk=newdata[e].jwykrs;
						var citysnyk=newdata[e].snmyrs;
						var citydata = {
								cityid:parseInt(newdata[e].cityid),
								ykzs:parseInt(cityykzs),
								wsykrs:parseInt(citywsyk),
								jwykrs:parseInt(cityjwyk),
								snmyrs:parseInt(citysnyk)
						};
						setCityDate(citydata,e);
						$('#'+e+'ykzs').val(cityykzs);//赋值，用于下次计算
						$('#'+e+'wsyk').val(citywsyk);
						$('#'+e+'jwyk').val(cityjwyk);
						$('#'+e+'snyk').val(citysnyk);
					}
				}
				sxcs = sxcs+1;
			}else{//最后一次跳动
				sxcs=0;//重置刷新次数
				for(var e=0;e<newdata.length;e++){
					if(newdata[e].cityid==340000){
						var provincedata = {
								ykzs:parseInt(newdata[e].ykzs),
								wsykrs:parseInt(newdata[e].wsykrs),
								jwykrs:parseInt(newdata[e].jwykrs),
								snmyrs:parseInt(newdata[e].snmyrs)
						};
						setClockDate(provincedata);
						
					}else{
						var citydata = {
								cityid:parseInt(newdata[e].cityid),
								ykzs:parseInt(newdata[e].ykzs),
								wsykrs:parseInt(newdata[e].wsykrs),
								jwykrs:parseInt(newdata[e].jwykrs),
								snmyrs:parseInt(newdata[e].snmyrs)
						};
						setCityDate(citydata,e);
					}
				}
			}
		}
		
		
		
		$(document).ready(function() {	
			cur_num1 = new FlipClock($('.cur_num1'), 0, {
				clockFace: 'Counter',
				sizeLevel:2
			});
			cur_num2 = new FlipClock($('.cur_num2'), 0, {
				clockFace: 'Counter',
				sizeLevel:2
			});
			cur_num3 = new FlipClock($('.cur_num3'), 0, {
				clockFace: 'Counter',
				sizeLevel:2
			});
			
			DWREngine.setAsync(false);
			refreshDate();
			//freshWebData();
		//	if(isfirstopen){
		//		refreshDate();
		//	
				
		//		var data = {
		//				ykzs:parseInt(oldysyksl+oldjwyksl+oldbsmyyksl),
		//				wsykrs:parseInt(oldysyksl),
		//				jwykrs:parseInt(oldjwyksl),
		//				snmyrs:parseInt(oldbsmyyksl)
		//		}
		//		loadDsjrjdtjData(data);
		//	}
			DWREngine.setAsync(true);
			setInterval('refreshDate()', 30000);	
			//freshWebData();
		});
		
		
		
		function getInitNum(curNum){
			var numLength=(curNum+"").length;
			var result="";
			for(var i=0;i<numLength;i++){
				result+="8";
			}
			return parseInt(result);
		}
		
		//设置城市数据
		function setCityDate(data,i){
			var name = $('#'+data.cityid+'cityname').val();
			$('#cityid'+i).html(name+"");
			$('#ykzs'+i).html(data.ykzs+"");
			$('#wsyk'+i).html(data.wsykrs+"");
			$('#jwyk'+i).html(data.jwykrs+"");
			$('#snyk'+i).html(data.snmyrs+"");
		}
		
		
		function setClockDate(data){
			cur_num1 = new FlipClock($('.cur_num1'), getInitNum(data.wsykrs), {
				clockFace: 'Counter',
				sizeLevel:2
			});
			cur_num1.setValue(parseInt(data.wsykrs));
			cur_num2 = new FlipClock($('.cur_num2'), getInitNum(data.jwykrs), {
				clockFace: 'Counter',
				sizeLevel:2
			});
			cur_num2.setValue(parseInt(data.jwykrs));
			cur_num3 = new FlipClock($('.cur_num3'), getInitNum(data.snmyrs), {
				clockFace: 'Counter',
				sizeLevel:2
			});
			cur_num3.setValue(parseInt(data.snmyrs));
		}
		
		//计算随机数lastData最后值，nowData现在的值，times剩余次数
		function getShuiJi(lastData,nowData,times){
			var pj = parseInt((lastData-nowData)/times);
			var sj = parseInt(Math.random()*(pj*1.5-pj*0.5+1)+pj*0.5,10);
			var jg = parseInt(sj)+parseInt(nowData);
			return jg;
		}
		
	</script>
  </head>
  
<body class="bg">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layout">
		<tr>
          <td height="55%" colspan="2" valign="top" class="radius_box">
            <h2 class="title_public">今日接待</h2>
            <table width="100%" border="0" cellpadding="0">
              <tr valign="top">
                <td class="radius_box">
                  <h2 class="red_title">今日接待境外游客</h2>
                  <div class="space" style="margin: 0px;"><div class="cur_num2"></div></div>
                </td>
                <td class="radius_box">
                  <h2 class="green_title">今日接待外省游客</h2>
                  <div class="space" style="margin: 0px;"><div class="cur_num1"></div></div>
                </td>
                <td class="radius_box">
                  <h2 class="yellow_title">今日接待本省漫游用户</h2>
                  <div class="space" style="margin: 0px;"><div class="cur_num3"></div></div>
                </td>
              </tr>
            </table>
            <div class="list">
            	<input type="hidden" id="340000ykzs"></input>
            	<input type="hidden" id="340000wsyk"></input>
            	<input type="hidden" id="340000jwyk"></input>
            	<input type="hidden" id="340000snyk"></input>
            	
            	<input type="hidden" id="340100cityname" value="合肥"></input>
            	<input type="hidden" id="340100ykzs"></input>
            	<input type="hidden" id="340100wsyk"></input>
            	<input type="hidden" id="340100jwyk"></input>
            	<input type="hidden" id="340100snyk"></input>
            	
            	<input type="hidden" id="340200cityname" value="芜湖"></input>
            	<input type="hidden" id="340200ykzs"></input>
            	<input type="hidden" id="340200wsyk"></input>
            	<input type="hidden" id="340200jwyk"></input>
            	<input type="hidden" id="340200snyk"></input>
            	
            	<input type="hidden" id="340300cityname" value="蚌埠"></input>
            	<input type="hidden" id="340300ykzs"></input>
            	<input type="hidden" id="340300wsyk"></input>
            	<input type="hidden" id="340300jwyk"></input>
            	<input type="hidden" id="340300snyk"></input>
            	
            	<input type="hidden" id="340400cityname" value="淮南"></input>
            	<input type="hidden" id="340400ykzs"></input>
            	<input type="hidden" id="340400wsyk"></input>
            	<input type="hidden" id="340400jwyk"></input>
            	<input type="hidden" id="340400snyk"></input>
            	
            	<input type="hidden" id="340500cityname" value="马鞍山"></input>
            	<input type="hidden" id="340500ykzs"></input>
            	<input type="hidden" id="340500wsyk"></input>
            	<input type="hidden" id="340500jwyk"></input>
            	<input type="hidden" id="340500snyk"></input>
            	
            	<input type="hidden" id="340600cityname" value="淮北"></input>
            	<input type="hidden" id="340600ykzs"></input>
            	<input type="hidden" id="340600wsyk"></input>
            	<input type="hidden" id="340600jwyk"></input>
            	<input type="hidden" id="340600snyk"></input>
            	
            	<input type="hidden" id="340700cityname" value="铜陵"></input>
            	<input type="hidden" id="340700ykzs"></input>
            	<input type="hidden" id="340700wsyk"></input>
            	<input type="hidden" id="340700jwyk"></input>
            	<input type="hidden" id="340700snyk"></input>
            	
            	<input type="hidden" id="340800cityname" value="安庆"></input>
            	<input type="hidden" id="340800ykzs"></input>
            	<input type="hidden" id="340800wsyk"></input>
            	<input type="hidden" id="340800jwyk"></input>
            	<input type="hidden" id="340800snyk"></input>
            	
            	<input type="hidden" id="341000cityname" value="黄山"></input>
            	<input type="hidden" id="341000ykzs"></input>
            	<input type="hidden" id="341000wsyk"></input>
            	<input type="hidden" id="341000jwyk"></input>
            	<input type="hidden" id="341000snyk"></input>
            	
            	<input type="hidden" id="341100cityname" value="滁州"></input>
            	<input type="hidden" id="341100ykzs"></input>
            	<input type="hidden" id="341100wsyk"></input>
            	<input type="hidden" id="341100jwyk"></input>
            	<input type="hidden" id="341100snyk"></input>
            	
            	<input type="hidden" id="341200cityname" value="阜阳"></input>
            	<input type="hidden" id="341200ykzs"></input>
            	<input type="hidden" id="341200wsyk"></input>
            	<input type="hidden" id="341200jwyk"></input>
            	<input type="hidden" id="341200snyk"></input>
            	
            	<input type="hidden" id="341300cityname" value="宿州"></input>
            	<input type="hidden" id="341300ykzs"></input>
            	<input type="hidden" id="341300wsyk"></input>
            	<input type="hidden" id="341300jwyk"></input>
            	<input type="hidden" id="341300snyk"></input>
            	
            	<input type="hidden" id="341500cityname" value="六安"></input>
            	<input type="hidden" id="341500ykzs"></input>
            	<input type="hidden" id="341500wsyk"></input>
            	<input type="hidden" id="341500jwyk"></input>
            	<input type="hidden" id="341500snyk"></input>
            	
            	<input type="hidden" id="341600cityname" value="亳州"></input>
            	<input type="hidden" id="341600ykzs"></input>
            	<input type="hidden" id="341600wsyk"></input>
            	<input type="hidden" id="341600jwyk"></input>
            	<input type="hidden" id="341600snyk"></input>
            	
            	<input type="hidden" id="341700cityname" value="池州"></input>
            	<input type="hidden" id="341700ykzs"></input>
            	<input type="hidden" id="341700wsyk"></input>
            	<input type="hidden" id="341700jwyk"></input>
            	<input type="hidden" id="341700snyk"></input>
            	
            	<input type="hidden" id="341800cityname" value="宣城"></input>
            	<input type="hidden" id="341800ykzs"></input>
            	<input type="hidden" id="341800wsyk"></input>
            	<input type="hidden" id="341800jwyk"></input>
            	<input type="hidden" id="341800snyk"></input>
            	
            	<input type="hidden" id="0ykzs"></input>
            	<input type="hidden" id="0wsyk"></input>
            	<input type="hidden" id="0jwyk"></input>
            	<input type="hidden" id="0snyk"></input>
            	
            	<input type="hidden" id="1ykzs"></input>
            	<input type="hidden" id="1wsyk"></input>
            	<input type="hidden" id="1jwyk"></input>
            	<input type="hidden" id="1snyk"></input>
            	
            	<input type="hidden" id="2ykzs"></input>
            	<input type="hidden" id="2wsyk"></input>
            	<input type="hidden" id="2jwyk"></input>
            	<input type="hidden" id="2snyk"></input>
            	
            	<input type="hidden" id="3ykzs"></input>
            	<input type="hidden" id="3wsyk"></input>
            	<input type="hidden" id="3jwyk"></input>
            	<input type="hidden" id="3snyk"></input>
              <p class="list_icon"><span id="cityid1"></span>今日接待游客：<span id="ykzs1" class="green">0</span>人次</p>
              <p>其中境外游客数量：<span id="jwyk2" class="green">0</span>人次&nbsp;&nbsp;&nbsp;外省游客数量：<span id="wsyk1" class="green">0</span>人次&nbsp;&nbsp;&nbsp; 本省漫游游客数量：<span id="snyk1" class="green">0</span>人次&nbsp;&nbsp;&nbsp;监控景区数量：<span id="jkjq1" class="green">0</span>个</p>
              <p class="list_icon"><span id="cityid2"></span>今日接待游客：<span id="ykzs2" class="green">0</span>人次</p>
              <p>其中境外游客数量：<span id="jwyk2" class="green">0</span>人次&nbsp;&nbsp;&nbsp;外省游客数量：<span id="wsyk2" class="green">0</span>人次&nbsp;&nbsp;&nbsp;  本省漫游游客数量：<span id="snyk2" class="green">0</span>人次&nbsp;&nbsp;&nbsp;监控景区数量：<span id="jkjq2" class="green">0</span>个</p>
              <p class="list_icon"><span id="cityid3"></span>今日接待游客：<span id="ykzs3" class="green">0</span>人次</p>
              <p>其中境外游客数量：<span id="jwyk3" class="green">0</span>人次&nbsp;&nbsp;&nbsp;外省游客数量：<span id="wsyk3" class="green">0</span>人次&nbsp;&nbsp;&nbsp;  本省漫游游客数量：<span id="snyk3" class="green">0</span>人次&nbsp;&nbsp;&nbsp;监控景区数量：<span id="jkjq3" class="green">0</span>个</p>
            </div>
          </td>
        </tr>
	</table>
  
</body>
</html>
