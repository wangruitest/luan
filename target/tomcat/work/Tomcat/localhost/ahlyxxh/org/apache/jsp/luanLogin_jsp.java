/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.37
 * Generated at: 2019-11-05 07:30:00 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.funo.utils.Constants;
import com.funo.utils.CyptoUtils;
import com.funo.system.model.SysOperator;

public final class luanLogin_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

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

      out.write("\r\n");
      out.write("<!DOCTYPE HTML>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("\t<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n");
      out.write("\t<title>六安市旅游产业大数据分析平台</title>\r\n");
      out.write("    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "jsp/common/incluan.jsp", out, true);
      out.write("\r\n");
      out.write("    <script type=\"text/ecmascript\" src=\"");
      out.print(request.getContextPath());
      out.write("/js/common/des.js\"></script>\r\n");
      out.write("    <script type='text/javascript' src='");
      out.print(request.getContextPath());
      out.write("/dwr/interface/LoginAction.js'></script>\r\n");
      out.write("    <script type='text/javascript' src='");
      out.print(request.getContextPath());
      out.write("/dwr/interface/WebLogoCfgAction.js'></script>\r\n");
      out.write("    <script type=\"text/javascript\" src=\"");
      out.print(request.getContextPath());
      out.write("/js/jquery/jquery.cookie.js\"></script>\r\n");
      out.write("\t<link rel=\"stylesheet\" href=\"css/cssluan/style.css\">\r\n");
      out.write("\t<script type=\"text/javascript\">  \r\n");
      out.write("      var isLogin = ");
      out.print(isLogin);
      out.write(";\r\n");
      out.write("      var isLogining=false;\r\n");
      out.write("      var portalPage=\"");
      out.print(request.getContextPath());
      out.write("/index/index.jsp\";      \r\n");
      out.write("\r\n");
      out.write("      // -----------------------------------------------------------------------------------\r\n");
      out.write("\t\t//  本函数用于对sString字符串进行前空格截除\r\n");
      out.write("\t\t// -----------------------------------------------------------------------------------\r\n");
      out.write("\t\tfunction JLTrim(sString) {\r\n");
      out.write("\t\t\tvar sStr, i, iStart, sResult = \"\";\r\n");
      out.write("\t\t\tsStr = sString.split(\"\");\r\n");
      out.write("\t\t\tiStart = -1;\r\n");
      out.write("\t\t\tfor (i = 0; i < sStr.length; i++) {\r\n");
      out.write("\t\t\t\tif (sStr[i] != \" \") {\r\n");
      out.write("\t\t\t\t\tiStart = i;\r\n");
      out.write("\t\t\t\t\tbreak;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tif (iStart == -1) {\r\n");
      out.write("\t\t\t\treturn \"\";\r\n");
      out.write("\t\t\t} // 表示sString中的所有字符均是空格,则返回空串\r\n");
      out.write("\t\t\telse {\r\n");
      out.write("\t\t\t\treturn sString.substring(iStart);\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t// -----------------------------------------------------------------------------------\r\n");
      out.write("\t\t// 4.2 本函数用于对sString字符串进行后空格截除\r\n");
      out.write("\t\t// -----------------------------------------------------------------------------------\r\n");
      out.write("\t\tfunction JRTrim(sString) {\r\n");
      out.write("\t\t\tvar sStr, i, sResult = \"\", sTemp = \"\";\r\n");
      out.write("\t\t\t// if (sString.length == 0) { return \"\" ;} // 参数sString是空串\r\n");
      out.write("\t\t\tsStr = sString.split(\"\");\r\n");
      out.write("\t\t\tfor (i = sStr.length - 1; i >= 0; i--) // 将字符串进行倒序\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\tsResult = sResult + sStr[i];\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tsTemp = JLTrim(sResult); // 进行字符串前空格截除\r\n");
      out.write("\t\t\tif (sTemp == \"\") {\r\n");
      out.write("\t\t\t\treturn \"\";\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tsStr = sTemp.split(\"\");\r\n");
      out.write("\t\t\tsResult = \"\";\r\n");
      out.write("\t\t\tfor (i = sStr.length - 1; i >= 0; i--) // 将经处理后的字符串再进行倒序\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\tsResult = sResult + sStr[i];\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\treturn sResult;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t// ------------------------------------------------------------\r\n");
      out.write("\t\t// 本函数用于对sString字符串进行前后空格截除\r\n");
      out.write("\t\t// ------------------------------------------------------------\r\n");
      out.write("\t\tfunction JTrim(sString) {\r\n");
      out.write("\t\t\tvar strTmp;\r\n");
      out.write("\t\t\tstrTmp = JRTrim(JLTrim(sString));\r\n");
      out.write("\t\t\treturn strTmp;\r\n");
      out.write("\t\t}\r\n");
      out.write("\r\n");
      out.write("      function login(){\r\n");
      out.write("    \t //if(isLogining){\r\n");
      out.write("    \t//\t alert(\"正在登录中，请稍候...\");\r\n");
      out.write("    \t//\t return;\r\n");
      out.write("    \t// }\r\n");
      out.write("         var userName = document.getElementById(\"userName\");\r\n");
      out.write("         var password = document.getElementById(\"password\");\r\n");
      out.write("  \r\n");
      out.write("         var validateCode = document.getElementById(\"validateCode\");\r\n");
      out.write("         if(userName.value == \"\"){\r\n");
      out.write("            alert(\"请填写用户名！\");\r\n");
      out.write("            imgClick();\r\n");
      out.write("            userName.focus();\r\n");
      out.write("            return;\r\n");
      out.write("         }\r\n");
      out.write("\r\n");
      out.write("         if(password.value == \"\" ){\r\n");
      out.write("            alert(\"请填写密码！\");\r\n");
      out.write("            imgClick();\r\n");
      out.write("            password.focus();\r\n");
      out.write("            return;\r\n");
      out.write("         }\r\n");
      out.write("         \r\n");
      out.write("         if(validateCode.value == \"\" ){\r\n");
      out.write("           alert(\"请填验证码！\");\r\n");
      out.write("           imgClick();\r\n");
      out.write("           validateCode.focus();\r\n");
      out.write("           return;\r\n");
      out.write("        }\r\n");
      out.write(" var names = JTrim(userName.value);\r\n");
      out.write(" var  name = strEnc(names,\"1\",\"2\",\"3\");\r\n");
      out.write(" var pwds = JTrim(password.value);\r\n");
      out.write(" var pwd=strEnc(pwds,\"1\",\"2\",\"3\");\r\n");
      out.write("         var browser = getOs();\r\n");
      out.write("         isLogining=true;\r\n");
      out.write("         LoginAction.login(name,pwd,validateCode.value,function(result){\r\n");
      out.write("        \t var msg=\"true\";\r\n");
      out.write("        \t if(result.resultCode!=0){\r\n");
      out.write("        \t\t msg=result.resultMessage;\r\n");
      out.write("        \t }\r\n");
      out.write("        \t LoginAction.recordLoginLog(name,msg,browser);\r\n");
      out.write("                              if(msg==\"true\"){\r\n");
      out.write("                            \t  window.location.href=portalPage;\r\n");
      out.write("                              }else{\r\n");
      out.write("                            \t  if(result.resultCode==706 || result.resultCode==707){\r\n");
      out.write("                        \t\t\t  showMsg(\"登录失败：密码已过期或密码过于简单！<br/><br/>请点此<a href='\"+result.resultMessage+\"'>修改密码</a>\");\r\n");
      out.write("                        \t\t  }else{\r\n");
      out.write("                            \t\t  showMsg(msg);\r\n");
      out.write("                            \t  }\r\n");
      out.write("                            \t  imgClick();\r\n");
      out.write("                              }\r\n");
      out.write("                           \t  isLogining=false;\r\n");
      out.write("                           });\r\n");
      out.write("      }\r\n");
      out.write("\r\n");
      out.write("      function init(){\r\n");
      out.write("    \t  if(isLogin){\r\n");
      out.write("\t\t\t\twindow.location.href=portalPage;\r\n");
      out.write("    \t\t}\r\n");
      out.write("      }\r\n");
      out.write("\r\n");
      out.write("      function imgClick(){\r\n");
      out.write("    \t // login();\r\n");
      out.write("         var img_code = document.getElementById(\"img_code\");\r\n");
      out.write("         img_code.src=\"");
      out.print(request.getContextPath());
      out.write("/validateCode.jsp?dumy=\" + Math.random();\r\n");
      out.write("      }\r\n");
      out.write("\r\n");
      out.write("      \r\n");
      out.write("      function onLoad(){\r\n");
      out.write("    \tif($.cookie('userType')==\"lvyou\"){\r\n");
      out.write("    \t\twindow.location.href=\"mainLogin.jsp\";\r\n");
      out.write("    \t}else if($.cookie('userType')==\"jiaotong\"){\r\n");
      out.write("    \t\twindow.location.href=\"jtLogin.jsp\";\r\n");
      out.write("    \t}\r\n");
      out.write("      \tinit();\r\n");
      out.write("        var userName = document.getElementById(\"userName\");\r\n");
      out.write("        userName.focus();\r\n");
      out.write("        \r\n");
      out.write("        \r\n");
      out.write("      }\r\n");
      out.write("      function on_return(){\r\n");
      out.write("\t if(window.event.keyCode == 13){\r\n");
      out.write("\t  login();\r\n");
      out.write("\t }\r\n");
      out.write("    }  \r\n");
      out.write("      function getOs()  \r\n");
      out.write("      {  \r\n");
      out.write("    \t  var brow=$.browser;\r\n");
      out.write("          var bInfo=\"\";\r\n");
      out.write("          if(brow.msie){bInfo=\"MicrosoftInternetExplorer\"+brow.version;}\r\n");
      out.write("          if(brow.mozilla){bInfo=\"MozillaFirefox\"+brow.version;}\r\n");
      out.write("          if(brow.safari){bInfo=\"AppleSafari\"+brow.version;}\r\n");
      out.write("          if(navigator.userAgent.toLowerCase().match(/chrome/) != null){bInfo=\"Chrome\";}\r\n");
      out.write("          if(brow.opera){bInfo=\"Opera\"+brow.version;}\r\n");
      out.write("          return bInfo;\r\n");
      out.write("      }\r\n");
      out.write("    //初始化页面函数\r\n");
      out.write("  \t$(document).ready(function() {\r\n");
      out.write("  \t\tif(isLogin == true){\r\n");
      out.write("  \t\t\twindow.location.href = \"");
      out.print(request.getContextPath());
      out.write("/index/index.jsp\";\r\n");
      out.write("  \t\t\treturn;\r\n");
      out.write("  \t\t}\r\n");
      out.write("  \t});\r\n");
      out.write("    </script>\r\n");
      out.write("</head>\r\n");
      out.write("<body  onload=\"onLoad()\" onkeydown=\"on_return()\">\r\n");
      out.write("\t<div class=\"header_bg\">\r\n");
      out.write("\t\t<div class=\"header\"><img src=\"images/imgluan/title.png\" alt=\"\"></div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<div class=\"cont_bg\">\r\n");
      out.write("\t\t<div class=\"cont\">\r\n");
      out.write("\t\t\t<div class=\"dlk\">\r\n");
      out.write("\t\t\t\t<p>用户登录</p>\r\n");
      out.write("\t\t\t\t<input  id=\"userName\" type=\"text\" class=\"yhm\" placeholder=\"用户名\">\r\n");
      out.write("\t\t\t\t<input  id='password' type=\"password\" class=\"yhm mm\" placeholder=\"密码\">\r\n");
      out.write("\t\t\t\t<input  id=\"validateCode\" type=\"text\" class=\"yhm yzm\" placeholder=\"验证码\">\r\n");
      out.write("\t\t\t\t<img id=\"img_code\" style=\"width: 70px\" onclick=\"imgClick()\" class=\"yzm_2\" src=\"");
      out.print(request.getContextPath());
      out.write("/validateCode.jsp\"></img>\r\n");
      out.write("\t\t\t\t<div class=\"clear\"></div>\r\n");
      out.write("\t\t\t\t<a href=\"javascript:void(0)\"  onclick=\"login()\" class=\"dl\">登录</a>\r\n");
      out.write("\t\t\t\t<a href=\"javascript:void(0)\"  onclick=\"window.close()\" class=\"dl qx\">取消</a>\r\n");
      out.write("\t\t\t\t<div class=\"clear\"></div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<div class=\"footer\">皖ICP备10001445号  安徽中移通信技术工程有限公司版权所有  </div>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
