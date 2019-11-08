<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.funo.system.model.SysOperator"%>
<%@page import="com.funo.utils.Constants"%>
<%
	request.setAttribute("home", request.getContextPath());
	SysOperator user = null;
	if(request.getSession() != null && request.getSession().getAttribute(Constants.Session_Attribute_UserEnv) != null){
		user = (SysOperator)request.getSession().getAttribute(Constants.Session_Attribute_UserEnv);
	}
%>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<script type="text/javascript" src="<%=request.getContextPath()%>/dwr/engine.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/dwr/util.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery/jquery-1.8.1.min.js"></script>

<script type="text/javascript">
var refreshTime=300000;
</script>