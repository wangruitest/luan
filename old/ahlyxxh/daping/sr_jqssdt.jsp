<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.funo.utils.Constants"%>
<%@page import="com.funo.system.model.SysOperator"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%
String curCityCode= request.getParameter("cityCode");
%>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
	<jsp:include flush='true' page='./inc.jsp'></jsp:include>
	<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/JqykjdAction.js'></script>
	<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/RegionCoordsAction.js'></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery/jquery-form-plugin.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery/jquery-validator-plugin.js"></script>
      <script type="text/javascript" src="<%=request.getContextPath()%>/js/date/WdatePicker.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery/date-functions.js"></script>
		<style>
	table tr th{white-space:nowrap;  }
	table tr td{white-space:nowrap;  }
	</style>
<script type="text/javascript">

var mapcitycode = <%=curCityCode%>;
var page=1;
$(function(){
	reload();
	//setInterval('reload()', 30000);
	//reload();
});

function loadData(){
	reload();
}

function reload(){

var obj={cityCode:mapcitycode,type:1,page:page};
	/* JqykjdAction.getJqykjdList(obj,function(result){
			if(result.resultCode=="0"){
				var jq = result.returnObject;
				page = jq.page;
				
				var count="<tr><th align='left' class='space3 titlebg'>景区</th><th align='center'>温度</th><th align='center'>PM2.5</th><th align='center'>在园人数</th><th align='center'>拥堵情况</th></tr>";
				var data = result.returnList;
				if(data!=null && data.length>0){
					var row=0;
					for(var i=0;i<data.length;i++){
						if(row%2==0){
							count+="<tr class='graybg' style='line-height:14px;'>";
						}else{
							count+="<tr style='line-height:14px;'>";
						}
						var yd="";
						if(data[i].inNum <= data[i].jamValue){
							yd="舒适";
						}else if(data[i].inNum >= data[i].expediteValue){
							yd="拥堵";
						}else{
							yd="轻微拥堵";
						}
						count+="<td>"+data[i].regionName+"</td><td align='center'>"+data[i].wd+"</td><td align='center'>"+data[i].pm+"</td><td align='center'>"+data[i].inNum+"</td><td align='center'>"+yd+"</td></tr>";
						row++;
					}
					$('#data').html(count);
				}
			}else{
				showMsg("获取景区游客排行时出错，可能原因为：\n"+result.resultMessage);
			}
		}); */
		
	RegionCoordsAction.getTOP4RegionInfoByCityDayView(mapcitycode,function(result){
	if(result.resultCode=="0"){
		var count="<tr><th align='left' class='space3 titlebg'>景区</th><th align='center'>温度</th><th align='center'>PM2.5</th><th align='center'>在园人数</th><th align='center'>拥堵情况</th></tr>";
		var data = result.returnList;
		if(data!=null && data.length>0){
			var row=0;
			for(var i=0;i<data.length;i++){
				if(row%2==0){
					count+="<tr class='graybg' style='line-height:14px;'>";
				}else{
					count+="<tr style='line-height:14px;'>";
				}
				var yd=data[i].jam;
				/* if(data[i].inNum <= data[i].jamValue){
					yd="舒适";
				}else if(data[i].inNum >= data[i].expediteValue){
					yd="拥堵";
				}else{
					yd="轻微拥堵";
				} */
				count+="<td>"+data[i].regionName+"</td><td align='center'>"+data[i].wd+"</td><td align='center'>"+data[i].pm+"</td><td align='center'>"+data[i].inNum+"</td><td align='center'>"+yd+"</td></tr>";
				row++;
			}
			$('#data').html(count);
		}
	}else{
		showMsg("获取景区游客排行时出错，可能原因为：\n"+result.resultMessage);
	}
});
}

</script>
<title>景区游客排行</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/daping/style.css"/>
</head>
<body style="background:#ffffff;margin-top: -2px;">
   <table width="99%" border="0" cellpadding="0"  class="layout">
    <tr valign="top">
    
     <td width="35%" class="radius_box"><h2 class="title_public">景区实时动态  TOP4</h2>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_02" id="data">
                          <tr>
                            <th align="left" class="space3 titlebg">景区</th>
                            <th align="center">温度</th>
                            <th align="center">PM2.5</th>
                            <th align="center">在园人数</th>
                            <th align="center">拥堵情况</th>
                          </tr>
                          
                        </table></td>
    </tr>
   
   </table>
  </body>
</html>
