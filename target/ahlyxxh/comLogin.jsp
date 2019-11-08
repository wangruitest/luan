<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.funo.utils.Constants"%>
<%@page import="com.funo.system.model.SysOperator"%>
<%
	SysOperator user = null;
	if (request.getSession() != null
			&& request.getSession().getAttribute(
					Constants.Session_Attribute_UserEnv) != null) {
		user = (SysOperator) request.getSession().getAttribute(
				Constants.Session_Attribute_UserEnv);
	}
	Boolean isLogin = false;
	if (user != null) {
		isLogin = true;
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<html>
  <head>
    <title>登录--安徽重点景区游客流量监测和服务系统</title>
    <!-- 
 省旅游局旅客采样分析平台
 -->
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <!-- 
    <script type="text/javascript" src="<%=request.getContextPath()%>/dwr/engine.js"></script>
    <script type="text/javascript" src='<%=request.getContextPath()%>/dwr/util.js'></script>
     -->
     <jsp:include flush='true' page='jsp/common/inc.jsp'></jsp:include>
    <script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/LoginAction.js'></script>
    <link href="<%=request.getContextPath()%>/css/login_com.css" rel="stylesheet" type="text/css">
    <!--  <style type="text/css">
	    body{
			background: url(images/newLogin/login_bg.jpg) #d6dee0 no-repeat center top;
		}
    </style>-->
    <script type="text/javascript">
      var isLogin = <%=isLogin%>;
      var isLogining=false;
      var portalPage="<%=request.getContextPath()%>/index/index.jsp";      

      // -----------------------------------------------------------------------------------
		//  本函数用于对sString字符串进行前空格截除
		// -----------------------------------------------------------------------------------
		function JLTrim(sString) {
			var sStr, i, iStart, sResult = "";
			sStr = sString.split("");
			iStart = -1;
			for (i = 0; i < sStr.length; i++) {
				if (sStr[i] != " ") {
					iStart = i;
					break;
				}
			}
			if (iStart == -1) {
				return "";
			} // 表示sString中的所有字符均是空格,则返回空串
			else {
				return sString.substring(iStart);
			}
		}
		// -----------------------------------------------------------------------------------
		// 4.2 本函数用于对sString字符串进行后空格截除
		// -----------------------------------------------------------------------------------
		function JRTrim(sString) {
			var sStr, i, sResult = "", sTemp = "";
			// if (sString.length == 0) { return "" ;} // 参数sString是空串
			sStr = sString.split("");
			for (i = sStr.length - 1; i >= 0; i--) // 将字符串进行倒序
			{
				sResult = sResult + sStr[i];
			}
			sTemp = JLTrim(sResult); // 进行字符串前空格截除
			if (sTemp == "") {
				return "";
			}
			sStr = sTemp.split("");
			sResult = "";
			for (i = sStr.length - 1; i >= 0; i--) // 将经处理后的字符串再进行倒序
			{
				sResult = sResult + sStr[i];
			}
			return sResult;
		}
		// ------------------------------------------------------------
		// 本函数用于对sString字符串进行前后空格截除
		// ------------------------------------------------------------
		function JTrim(sString) {
			var strTmp;
			strTmp = JRTrim(JLTrim(sString));
			return strTmp;
		}

      function login(){
    	 if(isLogining){
    		 alert("正在登录中，请稍候...");
    		 return;
    	 }
         var userName = document.getElementById("userName");
         var password = document.getElementById("password");
         var validateCode = document.getElementById("validateCode");
         if(userName.value == ""){
            alert("请填写用户名！");
            userName.focus();
            return;
         }

         if(password.value == "" ){
            alert("请填写密码！");
            password.focus();
            return;
         }

         if(validateCode.value == "" ){
            alert("请填验证码！");
            validateCode.focus();
            return;
         }

         var name = JTrim(userName.value);
         var pwd = JTrim(password.value);
         var browser = getOs();
         isLogining=true;
         LoginAction.login(name,pwd,validateCode.value,function(result){
        	 var msg="true";
        	 if(result.resultCode!=0){
        		 msg=result.resultMessage;
        	 }
        	 LoginAction.recordLoginLog(name,msg,browser);
                              if(msg=="true"){
                            	  window.location.href=portalPage;
                              }else{
                            	  if(result.resultCode==706 || result.resultCode==707){
                        			  showMsg("登录失败：密码已过期或密码过于简单！<br/><br/>请点此<a href='"+result.resultMessage+"'>修改密码</a>");
                        		  }else{
                            		  showMsg(msg);
                            	  }
                            	  
                              }
                           	  isLogining=false;
                           });
      }

      function init(){
    	  if(isLogin){
				window.location.href=portalPage;
    		}
      }

      function imgClick(){
         var img_code = document.getElementById("img_code");
         img_code.src="<%=request.getContextPath()%>/validateCode.jsp?dumy=" + Math.random();
      }

      
      function onLoad(){
      	init();
        var userName = document.getElementById("userName");
        userName.focus();
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

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" scroll=no onload="onLoad()">

<div class="loginbg">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="login">
  <tr> 	
    <td width="43" align="right" style="width: 60px">用户名</td>
    <td colspan="2"><input type="text" id="userName" class="text_input" style="width: 200px"/></td>
    </tr>
  <tr>
    <td align="right" style="width: 60px">密码</td>
    <td colspan="2"><input type="password" id='password' class="text_input" style="width: 200px" value=""/></td>
    </tr>
  <tr>
    <td align="right">验证码</td>
    <td width="130"><input type="text" id="validateCode"  maxlength="4" class="code" style="width: 90px"/></td>
    <td align="left"><img height="23" id="img_code"
							onclick="imgClick()" style="width: 70px"
							src="<%=request.getContextPath()%>/validateCode.jsp"/></td>
    </tr>
    <tr>
						<td colspan="3" align="center" valign="middle">
						<table id="login_btn" width="60%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td align="center" valign="middle"><input type="image"
										name="imageField"
										src="<%=request.getContextPath()%>/images/newLogin/login_submit.jpg"
										class="btn_submit" onclick="login()"/></td>
									<td align="center" valign="middle"><input type="image"
										name="imageField2"
										src="<%=request.getContextPath()%>/images/newLogin/login_cancel.jpg"
										class="btn_cancel" onclick="window.close()";/></td>
								</tr>
							</table>
						</td>
					</tr>
  <tr>

    <td colspan="3" class="copyright1">版权所有© 安徽移动通信</td>


  </tr>
    </table>
  </div>
</body>
</html>
