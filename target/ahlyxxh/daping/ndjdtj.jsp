<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.funo.utils.Constants"%>
<%@page import="com.funo.system.model.SysOperator"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%
String curCityCode= request.getParameter("cityCode");
//页面访问标志  1：市级总览 2：年度总览
String flag = request.getParameter("flag") ;
request.setAttribute("flag", flag);
%>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
	<jsp:include flush='true' page='./inc.jsp'></jsp:include>
	<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/JqykjdAction.js'></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery/jquery-form-plugin.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery/jquery-validator-plugin.js"></script>
      <script type="text/javascript" src="<%=request.getContextPath()%>/js/date/WdatePicker.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery/date-functions.js"></script>
<script type="text/javascript">
var cityId = <%=curCityCode%>;
var flag =<%=flag%>;
$(function(){
	 loadData();
});

function loadData(){
	var obj={};
   if(1 == flag){
	   obj.cityId = cityId;
   }else{
	   obj.cityFlag = '34'; //安徽省 市 前置标志
   }
	JqykjdAction.getNdjdtj(obj,function(result){
			if(result.resultCode=="0"){
				var data = result.returnObject;
					if(data.status == '0'){
						$('#wszb').html(data.wszb);
						$('#wstb').html("<span class='"+data.wsImg+"'>"+data.wstb+"</span>");
						$('#jwzb').html(data.jwzb);
						$('#jwtb').html("<span class='"+data.jwImg+"'>"+data.jwtb+"</span>");
						$('#bszb').html(data.bszb);
						$('#bstb').html("<span class='"+data.bsImg+"'>"+data.bstb+"</span>");
					}else if(data.status=="1"){
						$('#wszb').html(data.wszb);
						$('#jwzb').html(data.jwzb);
						$('#bszb').html(data.bszb);
					}
			}		
		});

}
</script>
<title>年度接待统计</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/daping/style.css"/>
</head>
<body>
   <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
    
     <td width="100%"  class="radius_box"><h2 class="blue_title">数据分析</h2>
                       <table width="100%" border="0" cellspacing="0" cellpadding="0" class="proportion">
                          <tr class="font_bold">
                            <th><img src="<%=request.getContextPath() %>/images/daping/titlebg.png" width="17" height="52" /></th>
                            <th width="22%">占比</th>
                            <th width="22%">同比</th>
                          </tr>
                          
                          
                          <tr class="graybg">
                            <td class="space_left" height="30px">外省游客</td>
                            <td id="wszb"></td>
                            <td id="wstb"></td>
                          </tr>
                          <tr>
                            <td class="space_left" height="30px">境外游客</td>
                            <td id="jwzb"></td>
                            <td id="jwtb"></td>
                          </tr>
                          <tr class="graybg">
                            <td class="space_left" height="30px">本省漫游游客</td>
                            <td id="bszb"></td>
                            <td id="bstb"></td>
                          </tr>
                        </table>
                        
                        </td>
    </tr>
   
   </table>
  </body>
</html>
