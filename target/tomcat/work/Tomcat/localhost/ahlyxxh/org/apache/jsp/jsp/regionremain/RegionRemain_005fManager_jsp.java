/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.37
 * Generated at: 2017-09-11 02:21:42 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.jsp.regionremain;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Date;
import com.funo.report.*;

public final class RegionRemain_005fManager_jsp extends org.apache.jasper.runtime.HttpJspBase
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
	String today = DateUtil.format(new Date(), "yyyy");

      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("    <title>景区游客驻留时间分析</title>\r\n");
      out.write("    <meta http-equiv=\"pragma\" content=\"no-cache\">\r\n");
      out.write("    <meta http-equiv=\"cache-control\" content=\"no-cache\">\r\n");
      out.write("    <meta http-equiv=\"expires\" content=\"0\">\r\n");
      out.write("    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../common/inc.jsp", out, true);
      out.write("\r\n");
      out.write("    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../common/echarts_inc.jsp", out, true);
      out.write("\r\n");
      out.write("    <script type=\"text/javascript\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${home}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/dwr/interface/UtilsAction.js\"></script>\r\n");
      out.write("    <script type='text/javascript' src='");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${home}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/dwr/interface/RegionRemainAction.js'></script>\r\n");
      out.write("    <script type=\"text/javascript\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${home}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/dwr/interface/RegionCfgAction.js\"></script>\r\n");
      out.write("    <script type=\"text/javascript\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${home}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/js/jquery/jquery-form-plugin.js\"></script>\r\n");
      out.write("    <script type=\"text/javascript\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${home}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/js/jquery/jquery-validator-plugin.js\"></script>\r\n");
      out.write("    <script type=\"text/javascript\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${home}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/js/date/WdatePicker.js\"></script>\r\n");
      out.write("    <script type=\"text/javascript\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${home}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/js/jquery/date-functions.js\"></script>\r\n");
      out.write("    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "RegionRemain_Manager_js.jsp", out, true);
      out.write("\r\n");
      out.write("    <style type=\"text/css\">\r\n");
      out.write("        #RegionRemainQueryForm{\r\n");
      out.write("            background-color: #E3EFFF;\r\n");
      out.write("            width:100%;\r\n");
      out.write("            padding: 3px 0px 5px 0px;\r\n");
      out.write("            line-height: 24px;\r\n");
      out.write("            font-size :12px;\r\n");
      out.write("        }\r\n");
      out.write("        #RegionRemainQueryForm div{\r\n");
      out.write("            padding: 2px;\r\n");
      out.write("            height: 24px;\r\n");
      out.write("        }\r\n");
      out.write("        #RegionRemainQueryForm label{\r\n");
      out.write("            margin: 2px;\r\n");
      out.write("        }\r\n");
      out.write("        #RegionRemainQueryForm input[type=text]{\r\n");
      out.write("            width: 100px;\r\n");
      out.write("            height: 20px;\r\n");
      out.write("        }\r\n");
      out.write("        #RegionRemainQueryForm select{\r\n");
      out.write("            width: 104px;\r\n");
      out.write("            height: 22px;\r\n");
      out.write("        }\r\n");
      out.write("        input, textarea, keygen, select, button {\r\n");
      out.write("\t\t    text-rendering: auto;\r\n");
      out.write("\t\t    color: initial;\r\n");
      out.write("\t\t    letter-spacing: normal;\r\n");
      out.write("\t\t    word-spacing: normal;\r\n");
      out.write("\t\t    text-transform: none;\r\n");
      out.write("\t\t    text-indent: 0px;\r\n");
      out.write("\t\t    text-shadow: none;\r\n");
      out.write("\t\t    display: inline-block;\r\n");
      out.write("\t\t    text-align: start;\r\n");
      out.write("\t\t    margin: 0em 0em 0em 0em;\r\n");
      out.write("\t\t    font: 13.3333px Arial;\r\n");
      out.write("\t\t    line-height:20px\r\n");
      out.write("\t\t}\r\n");
      out.write("    </style>\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body style=\"margin: 0px;\">\r\n");
      out.write("<div id=\"RegionRemainQueryForm\" class=\"form_query\" >\r\n");
      out.write("    <div>\r\n");
      out.write("        <label>游客来源:</label>\r\n");
      out.write("        <select id=\"RegionRemainQueryForm:areaCode\" >\r\n");
      out.write("            <option value=\"0\">全部游客</option>\r\n");
      out.write("            <option value=\"1\">本省游客</option>\r\n");
      out.write("            <option value=\"2\">外省游客</option>\r\n");
      out.write("        </select>\r\n");
      out.write("        <label>所属地市:</label>\r\n");
      out.write("        <select id=\"RegionRemainQueryForm:cityCode\" name=\"RegionRemainQueryForm:cityCode\" onchange=\"initCountyList();\" style=\"width:100px;\"></select>\r\n");
      out.write("        <label>所属区县:</label>\r\n");
      out.write("        <select id=\"countyid\" name=\"countyid\" onchange=\"levelChange1();\" style=\"width:100px;\"></select>\r\n");
      out.write("        <label>景区评级:</label>\r\n");
      out.write("        <select id=\"RegionRemainQueryForm:aLevel\" onchange=\"levelChange1();\" >\r\n");
      out.write("            <option value=\"0\">--请选择--</option>\r\n");
      out.write("            <option value=\"1\">A级</option>\r\n");
      out.write("            <option value=\"2\">AA级</option>\r\n");
      out.write("            <option value=\"3\">AAA级</option>\r\n");
      out.write("            <option value=\"4\">AAAA级</option>\r\n");
      out.write("            <option value=\"5\">AAAAA级</option>\r\n");
      out.write("        </select>\r\n");
      out.write("        <label>景区:</label>\r\n");
      out.write("        <select id=\"RegionRemainQueryForm:regionId\" ></select>\r\n");
      out.write("        <a class=\"easyui-linkbutton\" icon=\"icon-search\" id=\"btn_query\" onclick=\"searchValidate();\">查询</a>\r\n");
      out.write("        <!--<a href=\"javascript:void(0);\" class=\"easyui-linkbutton\" id=\"btn_reset\">重置</a>-->\r\n");
      out.write("\r\n");
      out.write("    </div>\r\n");
      out.write("    <div>\r\n");
      out.write("        <label>查询方式:</label>\r\n");
      out.write("        <select id=\"RegionRemainQueryForm:searchtype\" onchange=\"toSearchTypeChange();\">\r\n");
      out.write("            <option value=\"y\">按年份查询</option>\r\n");
      out.write("            <option value=\"q\">按季度查询</option>\r\n");
      out.write("            <option value=\"m\"  selected=\"selected\">按月份查询</option>\r\n");
      out.write("        </select>\r\n");
      out.write("        <span style=\"display: none;\" id=\"ySearch\">\r\n");
      out.write("            <label>开始时间:</label>\r\n");
      out.write("            <input type=\"text\" style=\"width:100px;\" id=\"RegionRemainQueryForm:ybegintime\" name=\"RegionRemainQueryForm:ybegintime\" class=\"Wdate\" value=\"");
      out.print(today);
      out.write("\"\r\n");
      out.write("                                    onfocus=\"WdatePicker({errDealMode:0,dateFmt:'yyyy',minDate:'#F{$dp.$D(\\'RegionRemainQueryForm:yendtime\\',{y:-10})}',maxDate:'#F{$dp.$D(\\'RegionRemainQueryForm:yendtime\\')||\\'%y\\'}'});\"/>\r\n");
      out.write("            <label>结束时间:</label><input type=\"text\" style=\"width:100px;\" id=\"RegionRemainQueryForm:yendtime\" name=\"RegionRemainQueryForm:yendtime\" class=\"Wdate\" value=\"");
      out.print(today);
      out.write("\"\r\n");
      out.write("                        onfocus=\"WdatePicker({dateFmt:'yyyy',maxDate:'#F{$dp.$D(\\'RegionRemainQueryForm:ybegintime\\',{y:10})}',minDate:'#F{$dp.$D(\\'RegionRemainQueryForm:ybegintime\\')}'});\"/>\r\n");
      out.write("        </span>\r\n");
      out.write("        <span style=\"display: none;\" id=\"qSearch\">\r\n");
      out.write("            <label>开始时间:</label><input type=\"text\" style=\"width:100px;\" id=\"RegionRemainQueryForm:qbegintime\" name=\"RegionRemainQueryForm:qbegintime\" class=\"Wdate\" value=\"");
      out.print(today);
      out.write("\"\r\n");
      out.write("                                    onfocus=\"WdatePicker({errDealMode:0,dateFmt:'yyyy',minDate:'#F{$dp.$D(\\'RegionRemainQueryForm:qendtime\\',{y:-1})}',maxDate:'#F{$dp.$D(\\'RegionRemainQueryForm:qendtime\\')||\\'%y\\'}'});\"/>\r\n");
      out.write("            <select id=\"RegionRemainQueryForm:qquarterbegin\" name=\"RegionRemainQueryForm:qquarterbegin\">\r\n");
      out.write("                <option selected=\"selected\" value=\"1\">第一季度</option>\r\n");
      out.write("                <option value=\"2\">第二季度</option>\r\n");
      out.write("                <option value=\"3\">第三季度</option>\r\n");
      out.write("                <option value=\"4\">第四季度</option>\r\n");
      out.write("            </select>\r\n");
      out.write("            <label>结束时间:</label>\r\n");
      out.write("            <input type=\"text\" style=\"width:100px;\" id=\"RegionRemainQueryForm:qendtime\" name=\"RegionRemainQueryForm:qendtime\" class=\"Wdate\" value=\"");
      out.print(today);
      out.write("\"\r\n");
      out.write("                        onfocus=\"WdatePicker({dateFmt:'yyyy',maxDate:'#F{($dp.$D(\\'RegionRemainQueryForm:qbegintime\\',{y:1}))}',minDate:'#F{$dp.$D(\\'RegionRemainQueryForm:qbegintime\\')}'});\"/>\r\n");
      out.write("            <select id=\"RegionRemainQueryForm:qquarterend\" name=\"RegionRemainQueryForm:qquarterend\">\r\n");
      out.write("                <option selected=\"selected\" value=\"1\">第一季度</option>\r\n");
      out.write("                <option value=\"2\">第二季度</option>\r\n");
      out.write("                <option value=\"3\">第三季度</option>\r\n");
      out.write("                <option value=\"4\">第四季度</option>\r\n");
      out.write("            </select>\r\n");
      out.write("        </span>\r\n");
      out.write("        <span style=\"display: none;\" id=\"mSearch\">\r\n");
      out.write("            <label>开始时间:</label>\r\n");
      out.write("            <input type=\"text\" style=\"width:100px;\" id=\"RegionRemainQueryForm:mbegintime\" name=\"RegionRemainQueryForm:mbegintime\" class=\"Wdate\" \r\n");
      out.write("                                    onfocus=\"WdatePicker({dateFmt:'yyyy-MM',minDate:'#F{$dp.$D(\\'RegionRemainQueryForm:mendtime\\',{M:-10})}',maxDate:'#F{$dp.$D(\\'RegionRemainQueryForm:mendtime\\')||\\'%y-%M\\'}'});\"/>\r\n");
      out.write("            <label>结束时间:</label>\r\n");
      out.write("            <input type=\"text\" style=\"width:100px;\" id=\"RegionRemainQueryForm:mendtime\" name=\"RegionRemainQueryForm:mendtime\" class=\"Wdate\"\r\n");
      out.write("                        onfocus=\"WdatePicker({dateFmt:'yyyy-MM',maxDate:'#F{($dp.$D(\\'RegionRemainQueryForm:mbegintime\\',{M:10}))}',minDate:'#F{$dp.$D(\\'RegionRemainQueryForm:mbegintime\\')||\\'%y-%M\\'}'});\"/>\r\n");
      out.write("        </span>\r\n");
      out.write("\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<div class=\"easyui-tabs\" id=\"tabs\">\r\n");
      out.write("    <div title=\"柱状图\" id=\"RegionRemainListCHART\">\r\n");
      out.write("        <div id=\"RegionRemainListCHART0\"></div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div title=\"数据列表\">\r\n");
      out.write("        <table id=\"RegionRemainList\"></table>\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
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
