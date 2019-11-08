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
	String title="六安市旅游产业大数据分析平台";
%>
<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>六安市旅游产业大数据分析平台</title>
    <jsp:include flush='true' page='jsp/common/incluan.jsp'></jsp:include>
    <script type="text/ecmascript" src="<%=request.getContextPath()%>/js/common/des.js"></script>
    <script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/LoginAction.js'></script>
    <script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/WebLogoCfgAction.js'></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery/jquery.cookie.js"></script>
	<link rel="stylesheet" href="css/cssluan/style.css">
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
    <style type="text/css">
    body {
    background-image:url('images/imgluan/u2.jpg');
    background-repeat: no-repeat;
    background-size:cover;
    }
    html{
    background:none;
    }
    .header-title{
    text-align: center;
    height: 67px;
    font-family: 'Arial-BoldMT', 'Arial Bold', 'Arial';
    font-weight: 700;
    font-style: normal;
    font-size: 48px;
    color: #FFFFFF;
    }
    .dlk{
    position: absolute;
    left: 10%;
    top: ;
    width: 1026px;
    height: 404px;
    background: inherit;
   /* background-color: rgba(255, 255, 255, 1);*/
    border: none;
    border-radius: 18px;
    -moz-box-shadow: 5px 5px 10px rgba(255, 255, 255, 0.349019607843137), 0px 5px 60px 0px rgba(255, 255, 255, 0.349019607843137) inset;
    -webkit-box-shadow: 5px 5px 10px rgba(255, 255, 255, 0.349019607843137), 0px 5px 60px 0px rgba(255, 255, 255, 0.349019607843137) inset;
    box-shadow: 5px 5px 10px rgba(255, 255, 255, 0.349019607843137), 0px 5px 60px 0px rgba(255, 255, 255, 0.349019607843137) inset;
    }
    .yhdl{
    font-family: 'Arial-BoldMT', 'Arial Bold', 'Arial';
    font-weight: 700;
    font-style: normal;
    font-size: 28px;
    color: #FFFFFF;
    }
    .dlk-title{
    font-family: '55--Regular', '字魂55号-龙吟手书';
    font-weight: 400;
    font-style: normal;
    font-size: 180px;
    color: #FFFFFF;
    }
    .yhm{
    background:#fff;
    width: 383px;
    height: 30px;
    }
    .yhm q{
    position: absolute;
    left: 0px;
    top: 0px;
    width: 383px;
    height: 40px;
    background: inherit;
    background-color: rgba(22, 155, 213, 1);
    border: none;
    border-radius: 5px;
    -moz-box-shadow: none;
    -webkit-box-shadow: none;
    box-shadow: none;
    font-size: 18px;
    }
    .dll{
    background:#169bd5;
    width: 383px;
    height: 30px;
    }
    .img1{
    margin-top: 20%;
    width: 68%;
    }
    .yzm_2{
    width:20%;
    }
    .yhm .yzm{

    }
    .header-title {
   
    }
    </style>
</head>
<body>
	<div class="header_bg">
		<div class="header-title">智慧旅游综合管理平台</div>
	</div>
	<div class="cont_bg">
		<div class="cont">
			<div class="dlk">
		        <div style="width:50%;float: left ">
		        <img class="img1" src="images/imgluan/images@2x.png"/>
		        </div>
		        <div  class ="" style="width:50%;float: right ">
				<p class="yhdl">用户登录</p>
				<div><input  id="userName" type="text" class="yhm" placeholder="用户名"></div>
				<div><input  id='password' type="password" class="yhm mm" placeholder="密码"></div>
				<input  id="validateCode" style="width:261px" type="text" class="yhm yzm" placeholder="验证码">
				<img class="yzm_2" src="images/imgluan/yzm_p.jpg"></img>
				<div class="clear"></div>
				<div onclick="login()" class ="yhm q" style="
				text-align: center;
				left: 0px;
			    top: 0px;
			    width: 383px;
			    height: 40px;
			    background: inherit;
			    background-color: rgba(22, 155, 213, 1);
			    border: none;
			    border-radius: 5px;
			    -moz-box-shadow: none;
			    -webkit-box-shadow: none;
			    box-shadow: none;
    font-size: 18px;"><a href="javascript:void(0)" style="color:#fff"  onclick="login()">登录</a></div>
<!-- 				<a href="javascript:void(0)"  onclick="window.close()" class="dl qx">取消</a>
 -->				<div class="clear"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- <div class="footer">皖ICP备10001445号  安徽中移通信技术工程有限公司版权所有  </div> -->

</body>
</html>