/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.37
 * Generated at: 2019-10-31 02:58:04 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.jsp.system;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class SysMenu_005fManager_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("<!DOCTYPE html>\r\n");
      out.write("\r\n");

request.setAttribute("home", request.getContextPath());

      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("  <head>\r\n");
      out.write("    <title>菜单管理页</title>\r\n");
      out.write("\t<meta http-equiv=\"pragma\" content=\"no-cache\">\r\n");
      out.write("\t<meta http-equiv=\"cache-control\" content=\"no-cache\">\r\n");
      out.write("\t<meta http-equiv=\"expires\" content=\"0\">    \r\n");
      out.write("\t");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../common/inc.jsp", out, true);
      out.write("\r\n");
      out.write("\t<script type='text/javascript' src='");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${home}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/dwr/interface/SysMenuAction.js'></script>\r\n");
      out.write("\t<script type=\"text/javascript\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${home}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/js/jquery/jquery-form-plugin.js\"></script>\r\n");
      out.write("\t<script type=\"text/javascript\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${home}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/js/jquery/jquery-validator-plugin.js\"></script>\r\n");
      out.write("                \t");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "SysMenu_Manager_js.jsp", out, true);
      out.write("\r\n");
      out.write("\r\n");
      out.write("  </head>\r\n");
      out.write("  \r\n");
      out.write("<body class=\"easyui-layout\" >\r\n");
      out.write("\t<div data-options=\"region:'west',split:true,title:'父菜单'\" style=\"width: 200px;\">\r\n");
      out.write("\t\t<div id=\"type_tree\"></div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<div data-options=\"region:'center'\">\r\n");
      out.write("\t\t<table id=\"SysMenuQueryForm\" class=\"form_query\" style=\"height: 50px\">\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t&#160;&#160;菜单标识：<input type=\"text\" id=\"SysMenuQueryForm:menuid\" style=\"width:100px;\"></input>\r\n");
      out.write("\t\t\t\t\t&#160;名称：<input type=\"text\" id=\"SysMenuQueryForm:name\" style=\"width:100px;\"></input>\r\n");
      out.write("\t\t\t\t\t&#160;地址：<input type=\"text\" id=\"SysMenuQueryForm:url\" style=\"width:100px;\"></input>\r\n");
      out.write("\t\t\t\t\t&#160;状态：<select id=\"SysMenuQueryForm:status\" style=\"width:80px;\"><option value=\"0\">启用</option><option value=\"1\">禁用</option></select>\r\n");
      out.write("\t\t\t\t\t<a href=\"javascript:void(0);\" class=\"easyui-linkbutton\" icon=\"icon-search\" id=\"btn_query\">查询</a> \r\n");
      out.write("\t\t\t\t\t<a href=\"javascript:void(0);\"class=\"easyui-linkbutton\" id=\"btn_reset\">重置</a>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t\t<table id=\"SysMenuList\"></table>\r\n");
      out.write("\t\r\n");
      out.write("\t\t<div id=\"SysMenuDialog\" style=\"padding: 0px; width: 650px; height: 250px;margin:0px;\">\r\n");
      out.write("\t\t\t<table id=\"SysMenuForm\" class=\"form_table\" >\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<th><font color=\"red\">*</font>&#160; 名称：</th>\r\n");
      out.write("\t\t\t\t\t<td><input type=\"text\" id=\"SysMenuForm:name\"\r\n");
      out.write("\t\t\t\t\t\tvalidation=\"require;maxlen(256)\"></input></td>\r\n");
      out.write("\t\t\t\t\t<th>&#160; 显示名称：</th>\r\n");
      out.write("\t\t\t\t\t<td><input type=\"text\" id=\"SysMenuForm:displayName\"\r\n");
      out.write("\t\t\t\t\t\tvalidation=\"maxlen(256)\"></input></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<th><font color=\"red\">*</font>&#160; 数据源类型：</th>\r\n");
      out.write("\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t<select id=\"SysMenuForm:dsTypes\"\r\n");
      out.write("\t\t\t\t\t\t\tvalidation=\"require;maxlen(256)\">\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"0\" selected=\"selected\">景区短彩信</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"1\">游客采样</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"2\">双重数据</option>\r\n");
      out.write("\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<th><font color=\"red\">*</font>&#160; 状态：</th>\r\n");
      out.write("\t\t\t\t\t<td><select id=\"SysMenuForm:status\" style=\"width:100px;\"><option value=\"0\">启用</option><option value=\"1\">禁用</option></select></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<th><font color=\"red\">*</font>&#160; 菜单标识：</th>\r\n");
      out.write("\t\t\t\t\t<td><input type=\"text\" id=\"SysMenuForm:menuid\"\r\n");
      out.write("\t\t\t\t\t\tvalidation=\"require;maxlen(128)\"></input>\r\n");
      out.write("\t\t\t\t\t\t<input type=\"hidden\" id=\"SysMenuForm:unid\"\r\n");
      out.write("\t\t\t\t\t\t></input>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<th>菜单图标：</th>\r\n");
      out.write("\t\t\t\t\t<td><input type=\"text\" id=\"SysMenuForm:menuIcon\"\r\n");
      out.write("\t\t\t\t\t\tvalidation=\"maxlen(256)\" style=\"width:93%\"></input></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<th><font color=\"red\">*</font>&#160; URL地址：</th>\r\n");
      out.write("\t\t\t\t\t<td colspan=\"3\"><input type=\"text\" id=\"SysMenuForm:url\"\r\n");
      out.write("\t\t\t\t\t\tvalidation=\"require;maxlen(1024)\"></input></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<th>桌面图标：</th>\r\n");
      out.write("\t\t\t\t\t<td><input type=\"text\" id=\"SysMenuForm:desktopIcon\"\r\n");
      out.write("\t\t\t\t\t\tvalidation=\"maxlen(256)\"></input></td>\r\n");
      out.write("\t\t\t\t\t<th>排序号：</th>\r\n");
      out.write("\t\t\t\t\t<td><input type=\"text\" id=\"SysMenuForm:sortNum\"\r\n");
      out.write("\t\t\t\t\t\tvalidation=\"maxlen(22)\" style=\"width:93%\"></input></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<th>&#160; 所属菜单：</th>\r\n");
      out.write("\t\t\t\t\t<td><select id=\"SysMenuForm:punid\" class=\"easyui-combotree\"\r\n");
      out.write("\t\t\t\t\tstyle=\"width: 210px;\" maxlength=\"32\"></select></td>\r\n");
      out.write("\t\t\t\t\t<th></th>\r\n");
      out.write("\t\t\t\t\t<td></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
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
