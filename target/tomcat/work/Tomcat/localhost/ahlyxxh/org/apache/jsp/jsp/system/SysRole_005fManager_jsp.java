/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.37
 * Generated at: 2019-10-31 03:01:24 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.jsp.system;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class SysRole_005fManager_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("    <title>管理页</title>\r\n");
      out.write("\t<meta http-equiv=\"pragma\" content=\"no-cache\">\r\n");
      out.write("\t<meta http-equiv=\"cache-control\" content=\"no-cache\">\r\n");
      out.write("\t<meta http-equiv=\"expires\" content=\"0\">    \r\n");
      out.write("\t");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../common/inc.jsp", out, true);
      out.write("\r\n");
      out.write("    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../common/commonSelect.jsp", out, true);
      out.write("\r\n");
      out.write("\t<script type='text/javascript' src='");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${home}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/dwr/interface/SysRoleAction.js'></script>\r\n");
      out.write("\t<script type='text/javascript' src='");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${home}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/dwr/interface/SysMenuAction.js'></script>\r\n");
      out.write("\t<script type='text/javascript' src='");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${home}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/dwr/interface/RegionCfgAction.js'></script>\r\n");
      out.write("\t<script type='text/javascript' src='");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${home}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/dwr/interface/RoleRegionCfgAction.js'></script>\r\n");
      out.write("\t<script type=\"text/javascript\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${home}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/js/jquery/jquery-form-plugin.js\"></script>\r\n");
      out.write("\t<script type=\"text/javascript\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${home}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/js/jquery/jquery-validator-plugin.js\"></script>\r\n");
      out.write("\t");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "SysRole_Manager_js.jsp", out, true);
      out.write("\r\n");
      out.write("\t<style type=\"text/css\">\r\n");
      out.write("\t\ttable tr th{width:100px;}\r\n");
      out.write("\t</style>\r\n");
      out.write("  </head>\r\n");
      out.write("  \r\n");
      out.write("  <body style=\"margin: 0px;padding: 0px;\">\r\n");
      out.write("\t\t<table id=\"SysRoleQueryForm\" class=\"form_query\" style=\"height: 50px\">\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t&#160;&#160;角色名称：<input type=\"text\" id=\"SysRoleQueryForm:name\" style=\"width:200px;\"></input>\t\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t&#160;状态：<select id=\"SysRoleQueryForm:status\" style=\"width:150px;\"><option value=\"0\">启用</option><option value=\"1\">禁用</option></select>\r\n");
      out.write("\t\t\t\t\t&#160;备注：<input type=\"text\" id=\"SysRoleQueryForm:remark\" style=\"width:200px;\"></input>\t\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<a href=\"javascript:void(0);\" class=\"easyui-linkbutton\" icon=\"icon-search\" id=\"btn_query\">查询</a> \r\n");
      out.write("\t\t\t\t\t<a href=\"javascript:void(0);\" class=\"easyui-linkbutton\" id=\"btn_reset\">重置</a>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t\t<table id=\"SysRoleList\"></table>\r\n");
      out.write("\r\n");
      out.write("\t<div id=\"SysRoleDialog\" style=\"padding: 0px; width: 520px; height: 330px;margin:0px;\">\r\n");
      out.write("\t\t<table id=\"SysRoleForm\" class=\"form_table\">\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th><font color=\"red\">*</font>&#160; 角色名称：</th>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t<input type=\"hidden\" id=\"SysRoleForm:unid\"></input>\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" id=\"SysRoleForm:name\" validation=\"require;maxlen(50)\"></input>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t<th><font color=\"red\">*</font>&#160; 状态：</th>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t<select id=\"SysRoleForm:status\" ><option value=\"0\">启用</option><option value=\"1\">禁用</option></select>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th><font color=\"red\">*</font>&#160;角色成员：</th>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\"><textarea id=\"SysRoleForm:sysOperators\" readonly=\"readonly\" \r\n");
      out.write("\t\t\t\t\tvalidation=\"require('请选择角色成员！');\" rows=\"5\" style=\"width: 380px;background-color: #cad0cd\"></textarea>\r\n");
      out.write("\t\t\t\t\t<a href=\"javascript:void(0);\" class=\"easyui-linkbutton\" id=\"btn_select_users\">选择</a>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th>&#160;首页地址：</th>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\"><input type=\"text\" id=\"SysRoleForm:homepage\" validation=\"maxlen(256)\" style=\"width: 380px;\"></input></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th>&#160;备注：</th>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\"><textarea id=\"SysRoleForm:remark\"\r\n");
      out.write("\t\t\t\t\tvalidation=\"maxlen(512)\" rows=\"3\" style=\"width: 380px;\"></textarea></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<div id=\"roleMenuDialog\" style=\"padding:0px;width:300px;height:400px;\">\r\n");
      out.write("\t\t<div id=\"menu_tree\"></div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<div id=\"regionRoleDialog\" style=\"padding:0px;width:300px;height:400px;\">\r\n");
      out.write("\t\t<div id=\"region_tree\"></div>\r\n");
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
