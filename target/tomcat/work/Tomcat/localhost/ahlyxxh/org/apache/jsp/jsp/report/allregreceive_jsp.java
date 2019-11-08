/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.37
 * Generated at: 2019-10-31 02:57:40 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.jsp.report;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Date;
import com.funo.report.*;
import com.funo.report.charts.ReportConstants;
import com.funo.utils.Constants;
import com.funo.system.model.SysOperator;

public final class allregreceive_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/jsp/common/easyuicommon.jsp", Long.valueOf(1558535839223L));
  }

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

      out.write("﻿\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<title>所有景区接待统计</title>\r\n");

	Date date=new Date();
    String today = DateUtil.format(date, "yyyy");
	String month=DateUtil.format(date, "yyyy-MM");
	String day=DateUtil.format(DateUtil.getDateAfter(date, -1), "yyyy-MM-dd");
    SysOperator user = null;
    if (request.getSession() != null && request.getSession().getAttribute(Constants.Session_Attribute_UserEnv) != null) {
        user = (SysOperator) request.getSession().getAttribute(Constants.Session_Attribute_UserEnv);
    }
    String curCityCode = "";
    if (null != user && null != user.getOrg()) {
        curCityCode = user.getOrg().getCode();
    }

      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/>\r\n");
      out.write("    <script type=\"text/javascript\" src=\"../../dwr/interface/ChartReportCommonUtil.js\"></script>\r\n");
      out.write("    <script type=\"text/javascript\" src=\"../../dwr/interface/ReportExportExcel.js\"></script>\r\n");
      out.write("    <script type=\"text/javascript\" src=\"../../dwr/interface/UtilsAction.js\"></script>\r\n");
      out.write("    <script type=\"text/javascript\" src=\"../../dwr/interface/RegionCfgAction.js\"></script>\r\n");
      out.write("    ");
      out.write("<script type=\"text/javascript\" src=\"../../dwr/engine.js\"></script>\r\n");
      out.write("<script src='../../dwr/util.js'></script>\r\n");
      out.write("<script src=\"../../js/date/WdatePicker.js\"></script>\r\n");
      out.write("<script src =\"../../js/common/common.js\"></script>\r\n");
      out.write("<link rel=\"STYLESHEET\" type=\"text/css\" href=\"../../css/common/common.css\"> </link>\t\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.print(request.getContextPath());
      out.write("/js/jquery/jquery-1.8.1.min.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.print(request.getContextPath() );
      out.write("/js/jquery/jquery-easyui-1.3.2/jquery.easyui.min.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.print(request.getContextPath() );
      out.write("/js/jquery/jquery-easyui-1.3.2/locale/easyui-lang-zh_CN.js\"></script>\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"");
      out.print(request.getContextPath() );
      out.write("/js/jquery/jquery-easyui-1.3.2/themes/default/easyui.css\" title=\"default\">\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"");
      out.print(request.getContextPath() );
      out.write("/js/jquery/jquery-easyui-1.3.2/themes/icon.css\">\r\n");
      out.write("<script >\r\n");
      out.write("    var fater=getTop();\r\n");
      out.write("    function getTop(){\r\n");
      out.write("        var maxTop=window.top;\r\n");
      out.write("        if(window.parent){\r\n");
      out.write("            maxTop=window.parent.top;\r\n");
      out.write("        }\r\n");
      out.write("        return maxTop;\r\n");
      out.write("    }\r\n");
      out.write("    function getViewportHeight() {\r\n");
      out.write("        if (fater.location.href.indexOf(\"desktop\")>=0) return 407;\r\n");
      out.write("        if (window.innerHeight!=window.undefined) return window.innerHeight;\r\n");
      out.write("        if (document.compatMode=='CSS1Compat') return document.documentElement.clientHeight;\r\n");
      out.write("        if (document.body) return document.body.clientHeight;\r\n");
      out.write("        return window.undefined;\r\n");
      out.write("    }\r\n");
      out.write("    //åé¡µ\r\n");
      out.write("    function pagerFilter(data){\r\n");
      out.write("        if (typeof data.length == 'number' && typeof data.splice == 'function'){\t// is array\r\n");
      out.write("            data = {\r\n");
      out.write("                total: data.length,\r\n");
      out.write("                rows: data\r\n");
      out.write("            }\r\n");
      out.write("        }\r\n");
      out.write("        var dg = $(this);\r\n");
      out.write("        var opts = dg.datagrid('options');\r\n");
      out.write("        var pager = dg.datagrid('getPager');\r\n");
      out.write("        pager.pagination({\r\n");
      out.write("            showRefresh:false,\r\n");
      out.write("            onSelectPage:function(pageNum, pageSize){\r\n");
      out.write("                opts.pageNumber = pageNum;\r\n");
      out.write("                opts.pageSize = pageSize;\r\n");
      out.write("                pager.pagination('refresh',{\r\n");
      out.write("                    pageNumber:pageNum,\r\n");
      out.write("                    pageSize:pageSize\r\n");
      out.write("                });\r\n");
      out.write("                dg.datagrid('loadData',data);\r\n");
      out.write("            }\r\n");
      out.write("        });\r\n");
      out.write("        if (!data.originalRows){\r\n");
      out.write("            data.originalRows = (data.rows);\r\n");
      out.write("        }\r\n");
      out.write("        var start = (opts.pageNumber-1)*parseInt(opts.pageSize);\r\n");
      out.write("        var end = start + parseInt(opts.pageSize);\r\n");
      out.write("        data.rows = (data.originalRows.slice(start, end));\r\n");
      out.write("        return data;\r\n");
      out.write("    }\r\n");
      out.write("    DWREngine.setPreHook(showLoading);\r\n");
      out.write("    DWREngine.setPostHook(hideLoading);\r\n");
      out.write("    function showLoading() {\r\n");
      out.write("        var disabledImageZone = fater.document.getElementById('disabledImageZone');\r\n");
      out.write("        var disabledImageZone = fater.document.getElementById('disabledImageZone');\r\n");
      out.write("        if (!disabledImageZone) {\r\n");
      out.write("            disabledImageZone = fater.document.createElement('div');\r\n");
      out.write("            disabledImageZone.setAttribute('id', 'disabledImageZone');\r\n");
      out.write("            disabledImageZone.style.position = \"absolute\";\r\n");
      out.write("            disabledImageZone.style.zIndex = \"10000\";\r\n");
      out.write("            disabledImageZone.style.left = \"0px\";\r\n");
      out.write("            disabledImageZone.style.top = \"0px\";\r\n");
      out.write("            disabledImageZone.style.width = \"100%\";\r\n");
      out.write("            disabledImageZone.style.height = \"100%\";\r\n");
      out.write("\r\n");
      out.write("            var iframe = fater.document.createElement('iframe');\r\n");
      out.write("            disabledImageZone.appendChild(iframe);\r\n");
      out.write("            iframe.setAttribute('id','markIframe');\r\n");
      out.write("            iframe.setAttribute('allowTransparency','true');\r\n");
      out.write("            iframe.setAttribute('src',loading_iframe);\r\n");
      out.write("            iframe.style.position = \"absolute\";\r\n");
      out.write("\r\n");
      out.write("            var popHeight=0;\r\n");
      out.write("            var popWidth=0;\r\n");
      out.write("            var fullHeight = getViewportHeight();\r\n");
      out.write("            var fullWidth = getViewportWidth();\r\n");
      out.write("            var theBody = fater.document.getElementsByTagName(\"BODY\")[0];\r\n");
      out.write("            if (fullHeight > theBody.scrollHeight) {\r\n");
      out.write("                popHeight = fullHeight;\r\n");
      out.write("            } else {\r\n");
      out.write("                popHeight = theBody.scrollHeight;\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            if (fullWidth > theBody.scrollWidth) {\r\n");
      out.write("                popWidth = fullWidth;\r\n");
      out.write("            } else {\r\n");
      out.write("                popWidth = theBody.scrollWidth;\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            iframe.style.width = popWidth+\"px\";\r\n");
      out.write("            iframe.style.height = popHeight+\"px\";\r\n");
      out.write("            iframe.style.top = \"0px\";\r\n");
      out.write("            iframe.style.left = \"0px\";\r\n");
      out.write("\r\n");
      out.write("            fater.document.body.appendChild(disabledImageZone);\r\n");
      out.write("        }\r\n");
      out.write("        fater.document.getElementById('disabledImageZone').style.visibility = 'visible';\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    function hideLoading() {\r\n");
      out.write("        fater.document.getElementById('disabledImageZone').style.visibility = 'hidden';\r\n");
      out.write("    }\r\n");
      out.write("</script>");
      out.write("\r\n");
      out.write("    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../common/file_inc.jsp", out, true);
      out.write("\r\n");
      out.write("    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../common/echarts_inc.jsp", out, true);
      out.write("\r\n");
      out.write("    <script type=\"text/javascript\" src=\"../../js/date/specialDate.js\"></script>\r\n");
      out.write("    <style type=\"text/css\">\r\n");
      out.write("    \tinput, textarea, keygen, select, button {\r\n");
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
      out.write("\t\t    line-height:23px;\r\n");
      out.write("\t\t    height: 23px\r\n");
      out.write("\t\t}\r\n");
      out.write("    </style>\r\n");
      out.write("    <script>\r\n");
      out.write("        $(function () {\r\n");
      out.write("            initProvinceCityList(");
      out.print(curCityCode);
      out.write(");\r\n");
      out.write("            init();\r\n");
      out.write("            initCountyList();\r\n");
      out.write("            //创建列表\r\n");
      out.write("            $(\"#gridbox\").datagrid({\r\n");
      out.write("                title: '所有景区接待统计',\r\n");
      out.write("                singleSelect: true,\r\n");
      out.write("                pagination: true,\r\n");
      out.write("                rownumbers: true,\r\n");
      out.write("                border: false,\r\n");
      out.write("                height: getViewportHeight() - 93,\r\n");
      out.write("                pageSize: 20,\r\n");
      out.write("                fitColumns: true,\r\n");
      out.write("                frozenColumns: [[\r\n");
      out.write("                    {field: 'ck', checkbox: false}\r\n");
      out.write("                ]],\r\n");
      out.write("                columns: [[\r\n");
      out.write("                    {field: 'TITLE', title: '查询时间', width: 100},\r\n");
      out.write("                    {field: 'TOURISTTYPE', title: '游客类型', width: 100},\r\n");
      out.write("                    {field: 'TOURISTCOUNT', title: '游客总量（人次）', width: 100}\r\n");
      out.write("                ]]\r\n");
      out.write("            });\r\n");
      out.write("\r\n");
      out.write("            $(\"#tabs\").tabs({\r\n");
      out.write("                border: false,\r\n");
      out.write("                onSelect: function (title) {\r\n");
      out.write("                    var pObject = getSearchForm();\r\n");
      out.write("                    if(!valid(pObject)) return;\r\n");
      out.write("                    if (title == '柱状图' || title == '饼状图' || title == '曲线图') {\r\n");
      out.write("                        loadEcharts(pObject);\r\n");
      out.write("                    }\r\n");
      out.write("                    if (title == '数据列表') {\r\n");
      out.write("                        loadTableData(pObject);\r\n");
      out.write("                    }\r\n");
      out.write("                }\r\n");
      out.write("            });\r\n");
      out.write("            \r\n");
      out.write("            //alert($dp.$D('yBeginTime').y);\r\n");
      out.write("\r\n");
      out.write("        });\r\n");
      out.write("        function initCountyList(){\r\n");
      out.write("\t\t\tvar cityid=$(\"#cityid\").val();\r\n");
      out.write("\t\t\tvar countyid=$(\"#countyid\");\r\n");
      out.write("\t\t\tdwr.engine.setAsync(false);\r\n");
      out.write("\t\t\tRegionCfgAction.getAreasListByOperator\t(cityid,function(data){\r\n");
      out.write("\t\t\t\t$(\"#countyid option:selected\").text(\"\");\r\n");
      out.write("\t\t\t\tcountyid.empty();\r\n");
      out.write("\t\t\t\tif(null==data || null==data.returnList)return;\r\n");
      out.write("\t\t\t\tif(data.returnList.length>1)\r\n");
      out.write("\t\t\t\tcountyid.prepend(\"<option value='0'>全部</option>\");\r\n");
      out.write("\t\t\t\tfor (var i=0;i<data.returnList.length;i++) {\r\n");
      out.write("\t\t\t    countyid.append(\"<option value='\"+ data.returnList[i]['areaid']+\"'>\"+ data.returnList[i]['areas'] +\"</option>\");\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t\tdwr.engine.setAsync(true);\r\n");
      out.write("\t\t}\r\n");
      out.write("        function qTimeCheck(){\r\n");
      out.write("        \t//var bYear = $(\"#\" +  $('#searchtype').val() + \"BeginTime\").val();\r\n");
      out.write("            //var eYear = $(\"#\" +  $('#searchtype').val() + \"EndTime\").val();\r\n");
      out.write("        \tvar eValue=$(\"#qQuarterEnd\").val();\r\n");
      out.write("        \tvar bValue=$(\"#qQuarterBegin\").val();\r\n");
      out.write("        \tvar bYear= $(\"#qBeginTime\").val();\r\n");
      out.write("        \tvar eYear= $(\"#qEndTime\").val();\r\n");
      out.write("        \tif(bYear==eYear){\r\n");
      out.write("        \t\tif(eValue>=bValue){\r\n");
      out.write("        \t\t\treturn true;\r\n");
      out.write("        \t\t}else{\r\n");
      out.write("        \t\t\talert(\"开始时间不能大于结束时间！\");\r\n");
      out.write("        \t\t}\r\n");
      out.write("        \t}else if(bYear>eYear){\r\n");
      out.write("        \t\talert(\"开始时间不能大于结束时间！\");\r\n");
      out.write("        \t}\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        function toSearchTypeChange() {\r\n");
      out.write("            var prefix = [\"y\", \"q\", \"m\", \"d\"];\r\n");
      out.write("            searchTypeChange(prefix);\r\n");
      out.write("        }\r\n");
      out.write("        function getEndTime(){\r\n");
      out.write("        \tvar beginTime=$('#dBeginTime').val();\r\n");
      out.write("        \tvar d = new Date(beginTime);\r\n");
      out.write("        \td.setDate(d.getDate()+30); \r\n");
      out.write("        \tvar month=d.getMonth()+1; \r\n");
      out.write("        \tvar day = d.getDate(); \r\n");
      out.write("        \tif(month<10){ \r\n");
      out.write("        \tmonth = \"0\"+month; \r\n");
      out.write("        \t} \r\n");
      out.write("        \tif(day<10){ \r\n");
      out.write("        \tday = \"0\"+day; \r\n");
      out.write("        \t} \r\n");
      out.write("        \tvar time = d.getFullYear()+\"-\"+month+\"-\"+day; \r\n");
      out.write("        \t$('#dEndTime').val(time);\r\n");
      out.write("        }\r\n");
      out.write("        function searchJc() {\r\n");
      out.write("            var pObject = getSearchForm();\r\n");
      out.write("            if(!valid(pObject)) return;\r\n");
      out.write("           // if(!qTimeCheck()) return;\r\n");
      out.write("            var tab= $('.tabs-selected span:first').html()\r\n");
      out.write("            if(tab=='数据列表'){\r\n");
      out.write("                loadTableData(pObject);\r\n");
      out.write("            }else{\r\n");
      out.write("                loadEcharts(pObject);\r\n");
      out.write("            }\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        /**\r\n");
      out.write("         * 加载Echarts控件\r\n");
      out.write("         * */\r\n");
      out.write("        function loadEcharts(pObject) {\r\n");
      out.write("            var params = [pObject.endTime, pObject.beginTime];\r\n");
      out.write("            try {\r\n");
      out.write("                showEChart(pObject, params, getStaticObject());\r\n");
      out.write("            } catch (e) {}\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        /**加载数据列表*/\r\n");
      out.write("        function loadTableData(pObject) {\r\n");
      out.write("            try {\r\n");
      out.write("                pObject.IS_NOT_FETCH = \"true\";\r\n");
      out.write("                var params = [pObject.endTime, pObject.beginTime];\r\n");
      out.write("                showDataListTable(getStaticObject(), pObject, params);\r\n");
      out.write("            } catch (e) {}\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        /**excel导出*/\r\n");
      out.write("        function exportJc() {\r\n");
      out.write("            var headerStr = [\"查询日期\", \"游客类型\", \"游客总量（人次）\"];\r\n");
      out.write("            var title = \"所有景区接待统计\";\r\n");
      out.write("            var pObject = getSearchForm();\r\n");
      out.write("            var number=\"2\";\r\n");
      out.write("            if(!valid(pObject)) return;\r\n");
      out.write("            \r\n");
      out.write("            var searchtype = document.getElementById(\"searchtype\").value;\r\n");
      out.write("\tif(searchtype == \"\") {\r\n");
      out.write("\t\talert(\"请选择查询方式！\");\r\n");
      out.write("\t\treturn;\r\n");
      out.write("\t}\r\n");
      out.write("\tvar beginTime=null; \r\n");
      out.write("\tif(document.getElementById(searchtype+\"BeginTime\")!=null){\r\n");
      out.write("\t\tbeginTime= document.getElementById(searchtype+\"BeginTime\").value;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tvar endTime =null;   \r\n");
      out.write("\tif(document.getElementById(searchtype+\"EndTime\")!=null){\r\n");
      out.write("\t\tendTime=document.getElementById(searchtype+\"EndTime\").value;\r\n");
      out.write("\t}\r\n");
      out.write("\tif(beginTime==\"\" ) {\r\n");
      out.write("\t\talert(\"请选择开始时间！\");\r\n");
      out.write("\t\treturn;\r\n");
      out.write("\t}\r\n");
      out.write("\tif(endTime == \"\") {\r\n");
      out.write("\t\talert(\"请选择结束时间！\");\r\n");
      out.write("\t\treturn;\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tif(searchtype=='q'){\r\n");
      out.write("\t\t var qBegin = document.getElementById(\"qQuarterBegin\").value;\r\n");
      out.write("\t\t var qEnd = document.getElementById(\"qQuarterEnd\").value;\r\n");
      out.write("\t\tif(beginTime==endTime&&qBegin>qEnd){\r\n");
      out.write("\t\t\talert('开始时间不能大于结束时间');\r\n");
      out.write("\t\t\treturn;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("            var params = [pObject.endTime, pObject.beginTime];\r\n");
      out.write("            showExport(pObject, params, getStaticObject(), headerStr, title,number);\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        /**\r\n");
      out.write("         * 获取查询条件\r\n");
      out.write("         */\r\n");
      out.write("        function getSearchForm() {\r\n");
      out.write("            var pObject = {};\r\n");
      out.write("            pObject.searchType = $('#searchtype').val();\r\n");
      out.write("            pObject.touristType = $('#touristtype').val();\r\n");
      out.write("            pObject.cityid = $('#cityid').val();\r\n");
      out.write("            pObject.countyid = $('#countyid').val();\r\n");
      out.write("            pObject.aLevel = $('#aLevel').val();\r\n");
      out.write("            var beginTime = $(\"#\" + pObject.searchType + \"BeginTime\").val();\r\n");
      out.write("            var endTime = $(\"#\" + pObject.searchType + \"EndTime\").val();\r\n");
      out.write("            if (pObject.searchType == 'q') { //如果是季度的查询\r\n");
      out.write("                beginTime += \"-\" + $(\"#qQuarterBegin\").val();\r\n");
      out.write("                endTime += \"-\" + $(\"#qQuarterEnd\").val();\r\n");
      out.write("            }\r\n");
      out.write("            pObject.beginTime = beginTime;\r\n");
      out.write("            pObject.endTime = endTime;\r\n");
      out.write("            return pObject;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        /**表头参数的定义*/\r\n");
      out.write("        function getStaticObject() {\r\n");
      out.write("            var tObject = new Object();\r\n");
      out.write("            tObject.xname = \"单位（日期）\";\r\n");
      out.write("            tObject.yname = \"单位（人次）\";\r\n");
      out.write("            tObject.caption = \"所有景区接待统计\";\r\n");
      out.write("            tObject.subTitle= \"统计全市所有景区某时段内的游客数量，可按年、季度、月、天统计，游客可按全部游客、本地游客、外地游客分别统计.\";\r\n");
      out.write("            tObject.procedureName = \"");
      out.print(ReportConstants.ALL_REG_RECEIVE_PROCEDURE);
      out.write("\";\r\n");
      out.write("            tObject.PROC_PARAMS = \"");
      out.print(ReportConstants.ALL_REG_RECEIVE_PROCEDURE_PARAMS);
      out.write("\";\r\n");
      out.write("            tObject.chartTypes = \"");
      out.print(ReportConstants.COLUMN3D_CHART);
      out.write(',');
      out.print(ReportConstants.PIE3D_CHART);
      out.write(',');
      out.print(ReportConstants.LINE2D_CHART );
      out.write("\";\r\n");
      out.write("            tObject.noSplit = \"NO\";\r\n");
      out.write("            return tObject;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        /**查询条件默认初始化*/\r\n");
      out.write("        function init() {\r\n");
      out.write("            toSearchTypeChange();\r\n");
      out.write("            var searchType = $('#searchtype').val();\r\n");
      out.write("            var today = '");
      out.print(today);
      out.write("';\r\n");
      out.write("            var day = new Date();\r\n");
      out.write("            if (searchType == \"y\" && day.getMonth() == 0) {\r\n");
      out.write("                today = (day.getFullYear() - 1);\r\n");
      out.write("            }\r\n");
      out.write("            $(\"#\" + searchType + \"BeginTime\").val(today);\r\n");
      out.write("            $(\"#\" + searchType + \"EndTime\").val(today);\r\n");
      out.write("        }\r\n");
      out.write("    </script>\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body style=\"margin: 0px;\">\r\n");
      out.write("<input type=\"hidden\" id=\"procedureName\" name=\"procedureName\" value=\"");
      out.print(ReportConstants.ALL_REG_RECEIVE_PROCEDURE);
      out.write("\"/>\r\n");
      out.write("<input type=\"hidden\" id=\"PROC_PARAMS\" name=\"PROC_PARAMS\" value=\"");
      out.print(ReportConstants.ALL_REG_RECEIVE_PROCEDURE_PARAMS);
      out.write("\"/>\r\n");
      out.write("\r\n");
      out.write("<div id=\"parameter\">\r\n");
      out.write("    <div>\r\n");
      out.write("        <label>游客类型:</label>\r\n");
      out.write("        <select id=\"touristtype\" name=\"touristtype\">\r\n");
      out.write("            <option value=\"0\" selected=\"selected\"> 全部游客</option>\r\n");
      out.write("            <option value=\"1\"> 外地游客</option>\r\n");
      out.write("            <option value=\"2\">本地游客</option>\r\n");
      out.write("        </select>\r\n");
      out.write("        <label>城市列表:</label>\r\n");
      out.write("        <select id=\"cityid\" name=\"cityid\" style=\"width: 100px\" onchange=\"initCountyList()\"></select>\r\n");
      out.write("        <label>区县列表:</label>\r\n");
      out.write("        <select id=\"countyid\" name=\"countyid\" style=\"width: 100px\"></select>\r\n");
      out.write("        <label>景区评级:</label>\r\n");
      out.write("        <select id=\"aLevel\" name=\"aLevel\">\r\n");
      out.write("            <option value=\"\">--请选择--</option>\r\n");
      out.write("            <option value=\"1\">A级</option>\r\n");
      out.write("            <option value=\"2\">AA级</option>\r\n");
      out.write("            <option value=\"3\">AAA级</option>\r\n");
      out.write("            <option value=\"4\">AAAA级</option>\r\n");
      out.write("            <option value=\"5\">AAAAA级</option>\r\n");
      out.write("        </select>\r\n");
      out.write("        <label>查询方式:</label>\r\n");
      out.write("        <select id=\"searchtype\" name=\"searchtype\" onchange=\"toSearchTypeChange();\">\r\n");
      out.write("            <option value=\"y\">按年份统计</option>\r\n");
      out.write("            <option value=\"q\">按季度统计</option>\r\n");
      out.write("            <option value=\"m\">按月份统计</option>\r\n");
      out.write("            <option value=\"d\">按天数统计</option>\r\n");
      out.write("        </select>\r\n");
      out.write("        <!--<input type=\"checkbox\" id=\"isHolidayCk\" name=\"isHolidayCk\" onclick=\"isHolidayCheck(this)\" disabled/>是否节假日-->\r\n");
      out.write("        <input type=\"hidden\" value=\"0\" id=\"isHoliday\" name=\"isHoliday\"/>\r\n");
      out.write("\r\n");
      out.write("    </div>\r\n");
      out.write("    <div>\r\n");
      out.write("\t\t\t\t<span style=\"display: none;\" id=\"ySearch\">\r\n");
      out.write("\t\t\t\t\t<label>开始时间:</label>\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" id=\"yBeginTime\" name=\"yBeginTime\" class=\"Wdate\" value=\"");
      out.print(today);
      out.write("\"\r\n");
      out.write("                           onfocus=\"WdatePicker({dateFmt:'yyyy',minDate:'#F{$dp.$D(\\'yEndTime\\',{y:-10})}',maxDate:'#F{$dp.$D(\\'yEndTime\\')||\\'%y\\'}'});\"/>\r\n");
      out.write("\t\t\t\t\t<label>结束时间:</label>\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" id=\"yEndTime\" name=\"yEndTime\" class=\"Wdate\" value=\"");
      out.print(today);
      out.write("\"\r\n");
      out.write("                           onfocus=\"WdatePicker({dateFmt:'yyyy',maxDate:'#F{$dp.$D(\\'yBeginTime\\',{y:10})}',minDate:'#F{$dp.$D(\\'yBeginTime\\')}'});\"/>\r\n");
      out.write("\t\t\t\t</span>\r\n");
      out.write("\t\t\t\t<span style=\"display: none;\" id=\"qSearch\">\r\n");
      out.write("\t\t\t\t\t<label>开始时间:</label>\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" id=\"qBeginTime\" name=\"qBeginTime\" class=\"Wdate\" value=\"");
      out.print(today);
      out.write("\"\r\n");
      out.write("                           onfocus=\"WdatePicker({dateFmt:'yyyy',maxDate:'#F{$dp.$D(\\'qEndTime\\')||\\'%y\\'}'});\"/>\r\n");
      out.write("\t\t\t\t\t<select id=\"qQuarterBegin\" name=\"qQuarterBegin\">\r\n");
      out.write("                        <option selected=\"selected\" value=\"1\">第一季度</option>\r\n");
      out.write("                        <option value=\"2\">第二季度</option>\r\n");
      out.write("                        <option value=\"3\">第三季度</option>\r\n");
      out.write("                        <option value=\"4\">第四季度</option>\r\n");
      out.write("                    </select>\r\n");
      out.write("\t\t\t\t\t<label>结束时间:</label>\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" id=\"qEndTime\" name=\"qEndTime\" class=\"Wdate\" value=\"");
      out.print(today);
      out.write("\"\r\n");
      out.write("                           onfocus=\"WdatePicker({dateFmt:'yyyy',maxDate:'#F{($dp.$D(\\'qBeginTime\\',{y:1}))}'});\"/>\r\n");
      out.write("\t\t\t\t\t<select id=\"qQuarterEnd\" name=\"qQuarterEnd\">\r\n");
      out.write("                        <option selected=\"selected\" value=\"1\">第一季度</option>\r\n");
      out.write("                        <option value=\"2\">第二季度</option>\r\n");
      out.write("                        <option value=\"3\">第三季度</option>\r\n");
      out.write("                        <option value=\"4\">第四季度</option>\r\n");
      out.write("                    </select>\r\n");
      out.write("\t\t\t\t</span>\r\n");
      out.write("\t\t\t\t<span style=\"display: none;\" id=\"mSearch\">\r\n");
      out.write("\t\t\t\t\t<label>开始时间:</label>\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" id=\"mBeginTime\" name=\"mBeginTime\" class=\"Wdate\" value=\"");
      out.print(month);
      out.write("\"\r\n");
      out.write("                           onfocus=\"WdatePicker({dateFmt:'yyyy-MM',minDate:'#F{$dp.$D(\\'mEndTime\\',{M:-10})}',maxDate:'#F{$dp.$D(\\'mEndTime\\')||\\'%y-%M\\'}'});\"/>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t<label>结束时间:</label>\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" id=\"mEndTime\" name=\"mEndTime\" class=\"Wdate\" value=\"");
      out.print(month);
      out.write("\"\r\n");
      out.write("                           onfocus=\"WdatePicker({dateFmt:'yyyy-MM',maxDate:'#F{($dp.$D(\\'mBeginTime\\',{M:10}))}',minDate:'#F{$dp.$D(\\'mBeginTime\\')||\\'%y-%M\\'}'});\"/>\r\n");
      out.write("\t\t\t\t</span>\r\n");
      out.write("\t\t\t\t<span style=\"display: none;\" id=\"dSearch\">\r\n");
      out.write("\t\t\t\t\t <label>开始时间:</label>\r\n");
      out.write("            <input type=\"text\" id=\"dBeginTime\" name=\"dBeginTime\" class=\"Wdate\" value=\"");
      out.print(day );
      out.write("\"\r\n");
      out.write("                onclick=\"WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true,onpicked:getEndTime()})\"/>\r\n");
      out.write("            <label>结束时间:</label>\r\n");
      out.write("            <input type=\"text\" id=\"dEndTime\" name=\"dEndTime\" class=\"Wdate\" value=\"");
      out.print(day );
      out.write("\"\r\n");
      out.write("                   onclick=\"WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\\'dBeginTime\\',{d:30})}',minDate:'#F{$dp.$D(\\'dBeginTime\\')||\\'%y-%M-%d\\'}'});\"/>\r\n");
      out.write("        </span>\r\n");
      out.write("        <a class=\"easyui-linkbutton\" icon=\"icon-search\" name=\"searchbtn\" id=\"searchbtn\"\r\n");
      out.write("           onclick=\"searchValidate();\">查询</a>\r\n");
      out.write("        <a class=\"easyui-linkbutton\" name=\"searchbtn2\" id=\"searchbtn2\"\r\n");
      out.write("           onclick=\"exportJc();\">导出Excel</a>\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<div id=\"tabs\" class=\"easyui-tabs\">\r\n");
      out.write("    <div id=\"");
      out.print(ReportConstants.COLUMN3D_CHART );
      out.write("\" title=\"柱状图\">\r\n");
      out.write("\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <div id=\"");
      out.print(ReportConstants.PIE3D_CHART );
      out.write("\" title=\"饼状图\">\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <div id=\"");
      out.print(ReportConstants.LINE2D_CHART );
      out.write("\" title=\"曲线图\">\r\n");
      out.write("    </div>\r\n");
      out.write("    <div id=\"grid\" title=\"数据列表\">\r\n");
      out.write("        <div id=\"gridboxdiv\">\r\n");
      out.write("            <table id=\"gridbox\"></table>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("</div>\r\n");
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
