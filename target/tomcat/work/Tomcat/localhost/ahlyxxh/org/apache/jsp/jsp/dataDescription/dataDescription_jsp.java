/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.37
 * Generated at: 2017-06-09 03:10:11 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.jsp.dataDescription;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class dataDescription_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("    <title>景区监控数据说明</title>\r\n");
      out.write("\t<meta http-equiv=\"pragma\" content=\"no-cache\">\r\n");
      out.write("\t<meta http-equiv=\"cache-control\" content=\"no-cache\">\r\n");
      out.write("\t<meta http-equiv=\"expires\" content=\"0\">    \r\n");
      out.write("  </head>\r\n");
      out.write("  <style>\r\n");
      out.write("\t\tul{margin: 0;}\r\n");
      out.write("\t\t.listAreaLi{list-style:decimal;font-family: \"微软雅黑\";font-size: 14px;margin:7px 0;}\r\n");
      out.write("\t\t.text{\r\n");
      out.write("\t\t\tcolor: #666;\r\n");
      out.write("\t\t\tmargin-top: 5px;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t.title{color: #1f1f1f;font-weight: bold;}\r\n");
      out.write("\t\t.textList{list-style:circle;}\r\n");
      out.write("\t</style>\r\n");
      out.write("\t<body>\r\n");
      out.write("\t\t<ul class=\"listArea\">\r\n");
      out.write("\t\t\t<li class=\"listAreaLi \">\r\n");
      out.write("\t\t\t\t<div class=\"title\">名词解释:</div>\r\n");
      out.write("\t\t\t\t<ul class=\"text\">\r\n");
      out.write("\t\t\t\t\t<li class=\"textList\">昨日城市游客：在对应地市驻留时间在6小时以上的人。</li>\r\n");
      out.write("\t\t\t\t\t<li class=\"textList\">昨日城市客流：在对应地市出现过的人。</li>\r\n");
      out.write("\t\t\t\t\t<li class=\"textList\">游客转化率：昨日城市游客/昨日城市客流。</li>\r\n");
      out.write("\t\t\t\t\t<li class=\"textList\">昨日外省游客：在对应地市驻留时间在6小时以上且游客归属地为外省的人。</li>\r\n");
      out.write("\t\t\t\t\t<li class=\"textList\">一日游过夜客：在对应地市驻留时间在6小时以上且晚上9点到第二天早上7点有通信行为的人。</li>\r\n");
      out.write("\t\t\t\t</ul>\r\n");
      out.write("\t\t\t</li>\r\n");
      out.write("\t\t\t<li class=\"listAreaLi \">\r\n");
      out.write("\t\t\t\t<div class=\"title\">所有景区接待统计:</div>\r\n");
      out.write("\t\t\t\t<div class=\"text\">统计城市所有景区的接待统计数据，并按天进行去重，分级查询：全省、地市，同时能够按照游客来源地查询（全部游客、外地游客、本地游客），更新周期：每天一次。</div>\r\n");
      out.write("\t\t\t</li>\r\n");
      out.write("\t\t\t<li  class=\"listAreaLi\">\r\n");
      out.write("\t\t\t\t<div class=\"title\">景区接待游客统计:</div>\r\n");
      out.write("\t\t\t\t<div class=\"text\">从单个景区的维度统计该景区各季度、月份、日接待人数情况，与历史年份对应的季度、月、日比较。每人每天仅计算1人次。</div>\r\n");
      out.write("\t\t\t</li>\r\n");
      out.write("\t\t\t<li  class=\"listAreaLi\">\r\n");
      out.write("\t\t\t\t<div class=\"title\">景区实时新增游客统计:</div>\r\n");
      out.write("\t\t\t\t<div class=\"text\">通过实时数据采集、实时分析技术，实时统计分析各个旅游景点每小时内新增的游客数量，通过该数据可以观察该景区的游客入园规律，方便景区做好接待准备。</div>\r\n");
      out.write("\t\t\t</li>\r\n");
      out.write("\t\t\t<li  class=\"listAreaLi\">\r\n");
      out.write("\t\t\t\t<div class=\"title\">景区游客实时流量统计:</div>\r\n");
      out.write("\t\t\t\t<ul class=\"text\">\r\n");
      out.write("\t\t\t\t\t<li class=\"textList\">实时统计分析各个旅游景点当前在园总数，可以通过设计采集时间间隔，反映景区当前的在园人数。系统每个整点更新一次数据。</li>\r\n");
      out.write("\t\t\t\t\t<li class=\"textList\">通过归属省份的分析，分析旅游用户的来源地特征，实时显示游客来源地比例，可同比显示去年同期的数据。</li>\r\n");
      out.write("\t\t\t\t</ul>\r\n");
      out.write("\t\t\t</li>\r\n");
      out.write("\t\t\t<li  class=\"listAreaLi\">\r\n");
      out.write("\t\t\t\t<div class=\"title\">景区游客归属地统计:</div>\r\n");
      out.write("\t\t\t\t<div class=\"text\">针对各个景点：按国内游客、海外游客、港澳台游客，或按各省市，统计市全年游客总数，统计各月份、各季度游客人数和比例，与历史年份比较，统计同比增长比例。省、市管理员，可选择管辖区域范围内景区，了解景区的游客归属地。</div>\r\n");
      out.write("\t\t\t</li>\r\n");
      out.write("\t\t\t<li  class=\"listAreaLi\">\r\n");
      out.write("\t\t\t\t<div class=\"title\">景区驻留分析统计:</div>\r\n");
      out.write("\t\t\t\t<div class=\"text\">针对单个景区的游客逗留时间区间的游客人数统计。对统计日期向前多天（固定值）的移动用户（非常驻）在统计目标区域内连续的停留时间按0-1小时、1-2小时、2-6小时等几个时间段进行的统计分析，得到满足条件的游客数量。</div>\r\n");
      out.write("\t\t\t</li>\r\n");
      out.write("\t\t\t<li  class=\"listAreaLi\">\r\n");
      out.write("\t\t\t\t<div class=\"title\">景区驻留时间统计:</div>\r\n");
      out.write("\t\t\t\t<div class=\"text\">统计所辖范围内所有景点平均逗留时间，按年、季度、月统计，现实同比数据，通过该数据客户了解景区当前的旅游资源开发程度。</div>\r\n");
      out.write("\t\t\t</li>\r\n");
      out.write("\t\t\t<li  class=\"listAreaLi\">\r\n");
      out.write("\t\t\t\t<div class=\"title\">景区游客旅游天数统计:</div>\r\n");
      out.write("\t\t\t\t<div class=\"text\">统计一日游全年游客总数，统计各月份、各季度一日游游客人数和比例；统计旅游时间超过一天的全年游客总数，统计各月份、各季度旅游时间超过一天的游客人数和比例，以饼图和报表形式展示一日游和多日游所占比例，计算多日游与历史值同比增长比例。计算全年平均旅游时间，与历史平均值比较，计算同比增长比例。</div>\r\n");
      out.write("\t\t\t</li>\r\n");
      out.write("\t\t\t<li  class=\"listAreaLi\">\r\n");
      out.write("\t\t\t\t<div class=\"title\">境外入皖漫游用户数:</div>\r\n");
      out.write("\t\t\t\t<div class=\"text\">实现按照月份统计，统计查询月份内进入安徽省的境外漫游用户数量。</div>\r\n");
      out.write("\t\t\t</li>\r\n");
      out.write("\t\t\t<li  class=\"listAreaLi\">\r\n");
      out.write("\t\t\t\t<div class=\"title\">本（外）省漫游用户数:</div>\r\n");
      out.write("\t\t\t\t<div class=\"text\">实现按照用户来源地、去往目的地、统计月份的查询统计，统计符合查询条件的省内（外）漫游用户数量。</div>\r\n");
      out.write("\t\t\t</li>\r\n");
      out.write("\t\t\t<li  class=\"listAreaLi\">\r\n");
      out.write("\t\t\t\t<div class=\"title\">本（外）省漫游用户过夜统计:</div>\r\n");
      out.write("\t\t\t\t<div class=\"text\">实现按照用户来源地、去往目的地、统计月份的查询统计，统计符合查询条件的本（外）省漫游过夜用户数量。</div>\r\n");
      out.write("\t\t\t</li>\r\n");
      out.write("\t\t</ul>\r\n");
      out.write("\t</body>\r\n");
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
