/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.37
 * Generated at: 2017-06-09 01:59:52 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.jsp.region;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.funo.utils.Constants;
import com.funo.system.model.SysOperator;

public final class RegionCfg_005fManager_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\r\n");
      out.write("\r\n");

	request.setAttribute("home", request.getContextPath());
	SysOperator user = null;
    if(request.getSession() != null && request.getSession().getAttribute(Constants.Session_Attribute_UserEnv) != null){
    	user = (SysOperator)request.getSession().getAttribute(Constants.Session_Attribute_UserEnv);
    }
    String userUnid=user.getUnid();

      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("  <head>\r\n");
      out.write("    <title>景区信息配置</title>\r\n");
      out.write("\t<meta http-equiv=\"pragma\" content=\"no-cache\">\r\n");
      out.write("\t<meta http-equiv=\"cache-control\" content=\"no-cache\">\r\n");
      out.write("\t<meta http-equiv=\"expires\" content=\"0\">    \r\n");
      out.write("\t");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../common/inc.jsp", out, true);
      out.write("\r\n");
      out.write("\t<script type='text/javascript' src='");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${home}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/dwr/interface/RegionCfgAction.js'></script>\r\n");
      out.write("\t<script type='text/javascript' src='");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${home}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/dwr/interface/RegionTypeCfgAction.js'></script>\r\n");
      out.write("\t<script type=\"text/javascript\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${home}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/js/jquery/jquery-form-plugin.js\"></script>\r\n");
      out.write("\t<script type=\"text/javascript\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${home}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/js/jquery/jquery-validator-plugin.js\"></script>\r\n");
      out.write("    <script type=\"text/javascript\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${home}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/js/date/WdatePicker.js\"></script>\r\n");
      out.write("\t<script type=\"text/javascript\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${home}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/js/jquery/date-functions.js\"></script>\r\n");
      out.write("\t");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "RegionCfg_Manager_js.jsp", out, true);
      out.write("\r\n");
      out.write("\t<script type=\"text/javascript\">\r\n");
      out.write("\t$(function(){\r\n");
      out.write("\t   var userUnidFlag = \"");
      out.print(userUnid);
      out.write("\";\r\n");
      out.write("\t\tif(userUnidFlag==\"99999\"){\r\n");
      out.write("\t\t     $(\"#RegionCfgForm\\\\:id\").removeAttr('disabled');\r\n");
      out.write("\t\t}else{\r\n");
      out.write("\t\t     $(\"#RegionCfgForm\\\\:id\").addAttr('disabled','disabled');\r\n");
      out.write("\t\t}\r\n");
      out.write("\t});\r\n");
      out.write("\t</script>\r\n");
      out.write("  </head>\r\n");
      out.write("  \r\n");
      out.write("  <body style=\"margin:0px\">\t\r\n");
      out.write("\t\t<table id=\"RegionCfgQueryForm\" class=\"form_query\" style=\"height: 50px\">\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t景区名称：<input type=\"text\" id=\"RegionCfgQueryForm:regionName\" style=\"width:100px;\"></input>\t\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t更新人员：<input type=\"text\" id=\"RegionCfgQueryForm:updateuser\" style=\"width:100px;\"></input>\r\n");
      out.write("\t\t\t\t\t重点景区：<select  id=\"RegionCfgQueryForm:iskey\" name=\"RegionCfgQueryForm:iskey\" class=\"easyui-combobox\" style=\"width:150px;\">\r\n");
      out.write("\t\t\t        <option value=\"\">请选择</option>\r\n");
      out.write("\t\t\t        <option value=\"0\">否</option>\r\n");
      out.write("\t\t\t        <option value=\"1\">是</option>\r\n");
      out.write("\t\t\t        </select>\t\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<a href=\"javascript:void(0);\" class=\"easyui-linkbutton\" icon=\"icon-search\" id=\"btn_query\">查询</a> \r\n");
      out.write("\t\t\t\t\t<a href=\"javascript:void(0);\"class=\"easyui-linkbutton\" id=\"btn_reset\">重置</a>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t\t<table id=\"RegionCfgList\"></table>\r\n");
      out.write("\r\n");
      out.write("\t\t<div id=\"RegionCfgDialog\" style=\"padding:0px;width:800px;height:250px;\">\r\n");
      out.write("\t\t<table id=\"RegionCfgForm\" class=\"form_table1\">\r\n");
      out.write("\t\t<input type=\"hidden\" id=\"RegionCfgForm:unid\"></input>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t\t<th></th>\r\n");
      out.write("\t\t\t\t<td></td>\r\n");
      out.write("\t\t\t\t<th></th>\r\n");
      out.write("\t\t\t\t<td></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th style=\"width:100px;\"><font color=\"red\">*</font>&#160;景区名称：</th>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" id=\"RegionCfgForm:regionName\" validation=\"require;maxlen(30)\" style=\"width: 99%\"></input>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t<th style=\"width:100px;\"><font color=\"red\">*</font>&#160;序号：</th>\r\n");
      out.write("\t\t\t\t<td> \r\n");
      out.write("\t\t\t\t\t<input type=\"text\" id=\"RegionCfgForm:orderNumber\" validation=\"require;maxlen(30)\" style=\"width: 99%\"></input>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th style=\"width:100px;\"><font color=\"red\">*</font>&#160;景区编号：</th>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" id=\"RegionCfgForm:id\" disabled='disabled' validation=\"require;number;maxlen(15,'长度不超过15位的数字')\" style=\"width: 99%\"></input>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t<th style=\"width:100px;\"><font color=\"red\">*</font>&#160;景区级别：</th>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t<select id=\"RegionCfgForm:aLevel\" style=\"width:100px;\">\r\n");
      out.write("\t\t\t\t\t<option value=\"5\">AAAAA级</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"4\">AAAA级</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"3\">AAA级</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"2\">AA级</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"1\">A级</option>\r\n");
      out.write("\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th><font color=\"red\">*</font>&#160;景区类型：</th>\r\n");
      out.write("\t\t\t\t<td >\r\n");
      out.write("\t\t\t\t\t<select id=\"RegionCfgForm:typeid\" style=\"width:100px;\">\r\n");
      out.write("\t\t\t\t\t<option value=\"4\">景点</option>\r\n");
      out.write("\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t<th><font color=\"red\">*</font>&#160;景区城市：</th>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t<select id=\"RegionCfgForm:cityCode\" style=\"width:100px;\" onchange=\"initCountyList()\">\r\n");
      out.write("\t\t\t\t\t<option value=\"340100\">合肥市</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"340200\">芜湖市</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"340300\">蚌埠市</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"340400\">淮南市</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"340500\">马鞍山市</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"340600\">淮北市</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"340700\">铜陵市</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"340800\">安庆市</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"341000\">黄山市</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"341100\">滁州市</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"341200\">阜阳市</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"341300\">宿州市</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"341500\">六安市</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"341600\">亳州市</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"341700\">池州市</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"341800\">宣城市</option>\r\n");
      out.write("\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t <select id=\"RegionCfgForm:countyCode\" name=\"countyCode\" style=\"width: 100px\"></select>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th><font color=\"red\">*</font>&#160;重点景区：</th>\r\n");
      out.write("\t\t\t\t<td >\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t<select id=\"RegionCfgForm:iskey\" style=\"width:100px;\">\r\n");
      out.write("\t\t\t\t\t<option value=\"0\">否</option>\r\n");
      out.write("\t\t\t\t\t<option value=\"1\">是</option>\r\n");
      out.write("\t\t\t\t</select>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th><font color=\"red\">*</font>&#160;畅通人数：</th>\r\n");
      out.write("\t\t\t\t<td >\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" id=\"RegionCfgForm:expediteValue\"  validation=\"require;maxlen(10);integer;min(0)\" style=\"width: 99%\"></input>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t<th><font color=\"red\">*</font>&#160;拥挤人数：</th>\r\n");
      out.write("\t\t\t\t<td >\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" id=\"RegionCfgForm:jamValue\" validation=\"require;maxlen(10);integer;min(0)\" style=\"width: 99%\"></input>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<!-- \r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th style=\"width:100px;\">包含小区：</th>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t<td colspan=\"3\">\r\n");
      out.write("\t\t\t\t\t<table id=\"Select_CellcfgList\" style=\"width: 99%\"></table>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr> -->\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th>备注：</th>\r\n");
      out.write("\t\t\t\t<td colspan=\"3\">\r\n");
      out.write("\t\t\t\t\t<textarea id=\"RegionCfgForm:notes\" rows=\"2\" validation=\"maxlen(30)\" style=\"width: 99%\"></textarea>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t</table>\r\n");
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
