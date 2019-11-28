<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>皖美景区</title>

<link rel="stylesheet" type="text/css"
	href="<%=path %>/css/bootstrap/bootstrap.min.css" />

<script src="<%=path %>/js/demo-rtl.js"></script>


<link rel="stylesheet" type="text/css" href="<%=path %>/css/libs/font-awesome.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/css/libs/nanoscroller.css" />

<link rel="stylesheet" type="text/css"
	href="<%=path %>/css/compiled/theme_styles.css" />

<link type="image/x-icon" href="<%=path %>/favicon.png" rel="shortcut icon" />

</head>
<body >
	<script src="<%=path %>/js/demo-skin-changer.js"></script>
	<script src="<%=path %>/js/jquery.js"></script>
	<script src="<%=path %>/js/bootstrap.js"></script>
	<script src="<%=path %>/js/jquery.nanoscroller.min.js"></script>
	<script src="<%=path %>/js/demo.js"></script>
	<script type="text/javascript" src="<%=path %>/js/cookie/cookie.js"></script>
	<script type="text/javascript" src="<%=path %>/js/md5.js"></script>
	<script src="<%=path %>/js/scripts.js"></script>
	
	<script type="text/javascript">
		window.location.href = "<%=path %>/login.jsp";
 	</script>
</body>
</html>