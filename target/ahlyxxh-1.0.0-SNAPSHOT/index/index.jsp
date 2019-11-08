<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@page import="com.funo.utils.Constants"%>
<%@page import="java.util.List"%>
<%@page import="com.funo.system.model.SysOperator"%>
<%@page import="com.funo.system.model.SysRole"%>
<%
	request.setAttribute("home", request.getContextPath());
	SysOperator user = null;
    if(request.getSession() != null && request.getSession().getAttribute(Constants.Session_Attribute_UserEnv) != null){
    	user = (SysOperator)request.getSession().getAttribute(Constants.Session_Attribute_UserEnv);
    }
    String userName=user.getName();
    String userLoginName=user.getLoginName();
    if(null==userName)userName=user.getLoginName();
    String curCityCode=(String)user.getOtherParams().get(Constants.CUR_CHOOSE_CITY);
    if(null==curCityCode)curCityCode="";
    
    if(curCityCode==""){
    	if(null==user.getChildOrgs() || user.getChildOrgs().size()==0){
    		curCityCode=user.getOrg().getCode();
    	}else{
    		curCityCode=user.getChildOrgs().get(0).getCode();
    	}
    }
    
    List<SysRole> roles=user.getRoles();
    String homepage="";
    if(null!=roles && roles.size()>0){
    	for(int i=0;i<roles.size();i++){
    		if(null==homepage || homepage.equals("")){
    			homepage=roles.get(i).getHomepage();
    		}
    	}
    }
    if(null!=homepage)homepage=homepage.replaceAll("\\\\", "/");
 %>
<!DOCTYPE HTML>
<html>
<head>
<title >
 </title>
<!-- 
 省旅游局旅客采样分析平台
 -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<jsp:include page="../jsp/common/inc.jsp"></jsp:include>
<jsp:include page="../jsp/common/portal_inc.jsp"></jsp:include>
<script type='text/javascript' src='${home}/dwr/interface/SysMenuAction.js'></script>
<script type='text/javascript' src='${home}/dwr/interface/LoginAction.js'></script>
<script type='text/javascript' src='${home}/dwr/interface/RegionCoordsAction.js'></script>
<script type='text/javascript' src='${home}/dwr/interface/UtilsAction.js'></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/WebLogoCfgAction.js'></script>

 <!-- 
<script type="text/javascript" src="http://218.207.183.222:8080/maps?v=1.1&key=bf4be0a72f8f4bc8bdfee8c306ab38df"></script>
 -->
	<script>
		var mapcitycode = "<%=curCityCode%>";
		var roleHomepageUrl="<%=homepage%>";
	</script>
	 <!-- 
	<script src="${home}/js/map/map.js" type="text/javascript"></script>
	<script src="${home}/js/map/rb.js" type="text/javascript"></script> 
	 -->
	  <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=vsemGPTjudgYoDhNs0kwE8mk"></script>
     <script src="${home}/js/map/baidurb.js" type="text/javascript"></script>
<script>

$(function(){
	//图片logo设置
    WebLogoCfgAction.getWebLogoCfg(function(data){
    	if(data.returnList == null || data.returnList.length<=0){
    		//默认logo设置为安徽旅游局
    		$("#top_logo").attr("src","../images/newLogin/top_05.jpg");	
             return ;
    	} 
    	var logoCfg =data.returnList[0];
    	var logoImg = "../images/newLogin/top_05_";
    	if('1'==logoCfg.active){
    		logoImg +=logoCfg.logoCfgFlag+".jpg";
    	}
    	if(data.returnList[0].ext2=="341500"){
    		$(document).attr("title","六安市旅游产业大数据分析平台");
    	}else if(data.returnList[0].ext3=="341722"){
    		$(document).attr("title","石台县旅游产业大数据分析平台");
    	}else{
    		$(document).attr("title","安徽游客流量监测和服务系统");
    	}
    	$("#top_logo").attr("src",logoImg);
    });
	
});

	var userName="<%=userName%>";
	var userLoginName="<%=userLoginName%>";
	var curCityCode="<%=curCityCode%>";
	var browser = getOs();

	function loginOut(){
		LoginAction.recordLoginOutLog(userLoginName,browser);
		LoginAction.logout(function(msg){
			if(null!=msg && msg=="true"){
				WebLogoCfgAction.getWebLogoCfg(function(data){
	       			  if(data.returnList[0].ext2=="341500"){
	       	        		top.window.location.href="../luanLogin.jsp";
	       	        	}else{
	       	        		top.window.location.href="../normalLogin.jsp";
	       	        	}
					
	        	});
			}
		});
	}
	
	function getOs()  
    {  
  	  var brow=$.browser;
        var bInfo="";
        if(brow.msie){bInfo="MicrosoftInternetExplorer"+brow.version;}
        if(brow.mozilla){bInfo="MozillaFirefox"+brow.version;}
        if(brow.safari){bInfo="AppleSafari"+brow.version;}
        if(navigator.userAgent.toLowerCase().match(/chrome/) != null){bInfo="Chrome";}
        if(brow.opera){bInfo="Opera"+brow.version;}
        return bInfo;
    }
</script>

</head>
<body class="easyui-layout" >
	<div data-options="region:'north',href:'layout/north.jsp'" style="height: 80px;overflow: hidden;" class="logo">
	</div>
	

	<div data-options="region:'west',split:true,title:'功能导航',href:'layout/west.jsp'" style="width: 230px;overflow: hidden;">
	</div>
	<div data-options="region:'center',href:'layout/center.jsp'" style="overflow: hidden;"></div>
	<div data-options="region:'south',href:'layout/south.jsp'" style="height: 27px;overflow: hidden;"></div>
</body>
</html>