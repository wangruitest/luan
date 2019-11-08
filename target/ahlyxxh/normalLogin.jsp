<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.funo.utils.Constants"%>
<%@page import="com.funo.utils.CyptoUtils"%>
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
	String title="安徽游客流量监测和服务系统";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<html>
  <head>
    <title>登录--<%=title %></title>
    <!-- 
 省旅游局旅客采样分析平台
 -->
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <!-- 
    <script type="text/javascript" src="<%=request.getContextPath()%>/dwr/engine.js"></script>
    <script type="text/javascript" src='<%=request.getContextPath()%>/dwr/util.js'></script>
     -->
     <jsp:include flush='true' page='jsp/common/inc.jsp'></jsp:include>
    <script type="text/ecmascript" src="<%=request.getContextPath()%>/js/common/des.js"></script>
    <script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/LoginAction.js'></script>
    <script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/WebLogoCfgAction.js'></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery/jquery.cookie.js"></script>
    <link href="<%=request.getContextPath()%>/css/login.css" rel="stylesheet" type="text/css">
    <!--  <style type="text/css">
	    body{
			background: url(images/newLogin/login_bg.jpg) #d6dee0 no-repeat center top;
		}
    </style>-->
    <script type="text/javascript">  
    $(function(){
    	//图片logo设置
        WebLogoCfgAction.getWebLogoCfg(function(data){
        	if(data.returnList == null || data.returnList.length<=0){
        		//默认logo设置为安徽旅游局
        		$(".loginbg").css({
            		'background':'url(images/newLogin/loginmainbg.jpg) no-repeat center'
            	});
        		return ;
        	}
        	var logoCfg =data.returnList[0];
        	var backgroundImg = "images/newLogin/loginmainbg"+"_";
        	if('1'==logoCfg.active){
        		backgroundImg +=logoCfg.logoCfgFlag+".jpg";
        	}
        	$(".loginbg").css({
        		'background':'url('+backgroundImg+') no-repeat center'
        	});
        });
    	
    });
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
            imgClick();
            userName.focus();
            return;
         }

         if(password.value == "" ){
            alert("请填写密码！");
            imgClick();
            password.focus();
            return;
         }

//         if(validateCode.value == "" ){
//            alert("请填验证码！");
//            imgClick();
//            validateCode.focus();
//            return;
//         }
//		dwr.engine.setAsync(false);//dwr非同步 
//         var name = JTrim(userName.value);
//         LoginAction.encode(name,function(result){
//         	if(result.resultCode==0){
 //       		 name=result.returnObject;
 //       	 }
//         });
         
//         var pwd = JTrim(password.value);
//         LoginAction.encode(pwd,function(result){
//         	if(result.resultCode==0){
//        		 pwd=result.returnObject;
//        	 }
//         });
 var names = JTrim(userName.value);
 var  name = strEnc(names,"1","2","3");
 var pwds = JTrim(password.value);
 var pwd=strEnc(pwds,"1","2","3");
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
                            	  imgClick();
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
    	if($.cookie('userType')=="lvyou"){
    		window.location.href="mainLogin.jsp";
    	}else if($.cookie('userType')=="jiaotong"){
    		window.location.href="jtLogin.jsp";
    	}
      	init();
        var userName = document.getElementById("userName");
        userName.focus();
        
        
      }
      
    function on_return(){ 
      var brow=$.browser;
      if(brow.msie){
    	  return ;
      }
	 if(window.event.keyCode == 13){
	  login();
	 }
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

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" scroll=no onload="onLoad()" onkeydown="on_return()" >

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
										class="btn_cancel" onclick="window.close();"/></td>
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
