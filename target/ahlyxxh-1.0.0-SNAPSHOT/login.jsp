<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.funo.utils.Constants"%>
<%@page import="com.funo.system.model.SysOperator"%>
<%
	SysOperator user = null;
    if(request.getSession() != null && request.getSession().getAttribute(Constants.Session_Attribute_UserEnv) != null){
    	user = (SysOperator)request.getSession().getAttribute(Constants.Session_Attribute_UserEnv);
    }
    Boolean isLogin = false;
    if(user != null){
    	isLogin = true;
    }

 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title></title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery/jquery-1.8.1.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/dwr/engine.js"></script>
    <script type="text/javascript" src='<%=request.getContextPath()%>/dwr/util.js'></script>
    <script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/LoginAction.js'></script>
     <script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/WebLogoCfgAction.js'></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery/jquery.cookie.js"></script>
    <script type="text/javascript">
    	var isLogin="<%=isLogin%>";
    	
    	function showLogin() {
			if(isLogin=="false" || isLogin==false ){
	    		if($.cookie('userType')=="lvyou"){
	        		window.location.href="mainLogin.jsp";
	        	}else if($.cookie('userType')=="jiaotong"){
	        		window.location.href="jtLogin.jsp";
	        	}else if($.cookie('userType')=="fzlvyou"){
	        		window.location.href="fzlyLogin.jsp";
	        	}else if($.cookie('userType')=="areaMonitor"){
	        		window.location.href="comLogin.jsp";
	        	}else{
	        		WebLogoCfgAction.getWebLogoCfg(function(data){
	       			  if(data.returnList[0].ext2=="341500"){
	       	        		top.window.location.href="../luanLogin.jsp";
	       	        	}else{
	       	        	
	       	        		top.window.location.href="../normalLogin.jsp";
	       	        	}
					
	        	});
			}
		}
    	}
    </script>
  </head>
  <body onload="showLogin()">
  </body>
</html>
