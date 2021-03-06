/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.37
 * Generated at: 2019-10-31 02:57:17 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.jsp.regionrealtimesumadd;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class RegionRealtimeSumAdd_005fManager_005fjs_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("    var queryFormCach = null;\r\n");
      out.write("    var treeSelectCach = null;\r\n");
      out.write("    $(function () {\r\n");
      out.write("        //创建列表\r\n");
      out.write("        $(\"#RegionRealtimeSumAddList\").datagrid({\r\n");
      out.write("            title:'景区新增游客统计',\r\n");
      out.write("            idField: 'unid',\r\n");
      out.write("            singleSelect: false,\r\n");
      out.write("            pagination: true,\r\n");
      out.write("            rownumbers:true,\r\n");
      out.write("            height:getViewportHeight()-95,\r\n");
      out.write("            pageSize: 30,\r\n");
      out.write("            border:false,\r\n");
      out.write("            fitColumns: true,\r\n");
      out.write("            columns: [[\r\n");
      out.write("                {field: 'regionname', title: '景区名称', width: 100},\r\n");
      out.write("                {field: 'touristtype', title: '游客类型', width: 100},\r\n");
      out.write("                {field: 'searchdate', title: '查询日期', width: 100},\r\n");
      out.write("                {field: 'rqtime', title: '时间点', width: 100},\r\n");
      out.write("                {field: 'dates', title: '新增游客总量（人次）', width: 100},\r\n");
      out.write("                {field: 'codeGenerator', title: 'codeGenerator', width: 0, hidden: true}\r\n");
      out.write("            ]]\r\n");
      out.write("        });\r\n");
      out.write("        //初始化表单元素\r\n");
      out.write("        initForm();\r\n");
      out.write("\r\n");
      out.write("        $(\"#tabs\").tabs({border:false,\r\n");
      out.write("            height:getViewportHeight()-65,\r\n");
      out.write("            onSelect:function(){\r\n");
      out.write("                query();\r\n");
      out.write("            }\r\n");
      out.write("        });\r\n");
      out.write("\r\n");
      out.write("    });//结束初始化函数\r\n");
      out.write("\r\n");
      out.write("    //--------------------初始化和公用方法 start ------------------------\r\n");
      out.write("    function initForm() {\r\n");
      out.write("        $(\"#btn_query\").click(query);\r\n");
      out.write("        $(\"#btn_exp\").click(downloadExcel);\r\n");
      out.write("        $(\"#showTb\").click(query);\r\n");
      out.write("        initloginerCityList();\r\n");
      out.write("        //provinceCityChange();\r\n");
      out.write("        initCountyList();\r\n");
      out.write("        levelChange1();\r\n");
      out.write("        \r\n");
      out.write("        var date = $(\"#RegionRealtimeSumAddQueryForm\\\\:begindate\").val();\r\n");
      out.write("        var currentdate = new Date().pattern(\"yyyy-MM-dd\");\r\n");
      out.write("        if (\"\" == date) {\r\n");
      out.write("            date = currentdate;\r\n");
      out.write("            $(\"#RegionRealtimeSumAddQueryForm\\\\:begindate\").val(date);\r\n");
      out.write("        }\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    //查询\r\n");
      out.write("    function query() {\r\n");
      out.write("        $('#RegionRealtimeSumAddList').datagrid('unselectAll');\r\n");
      out.write("        var region = $(\"#RegionRealtimeSumAddQueryForm\\\\:regionId\").val();\r\n");
      out.write("        var time = $(\"#RegionRealtimeSumAddQueryForm\\\\:begindate\").val();\r\n");
      out.write("        /* if(region==null||region.length==0||region=='0'){\r\n");
      out.write("            showMsg(\"请选择要查询的景区\");\r\n");
      out.write("            return ;\r\n");
      out.write("        } */\r\n");
      out.write("        if(time==null||time.length==0){\r\n");
      out.write("            showMsg(\"请选择要查询的日期\");\r\n");
      out.write("            return ;\r\n");
      out.write("        }\r\n");
      out.write("        var queryObj = {\r\n");
      out.write("            areacode: $(\"#RegionRealtimeSumAddQueryForm\\\\:areacode\").val(),\r\n");
      out.write("            cityCode: $(\"#RegionRealtimeSumAddQueryForm\\\\:cityCode\").val(),\r\n");
      out.write("            regionId: $(\"#RegionRealtimeSumAddQueryForm\\\\:regionId\").val(),\r\n");
      out.write("            begindate: $(\"#RegionRealtimeSumAddQueryForm\\\\:begindate\").val(),\r\n");
      out.write("            holiday: $(\"#RegionRealtimeSumAddQueryForm\\\\:holiday\").attr(\"checked\") ? 'yes' : null,//有值则代表条件生效\r\n");
      out.write("            showTb:$('#showTb').attr(\"checked\") ? 'yes' : null,\r\n");
      out.write("            codeGenerator: 'codeGenerator'\r\n");
      out.write("        };\r\n");
      out.write("        treeSelectCach = null;\r\n");
      out.write("        queryFormCach = queryObj;\r\n");
      out.write("\r\n");
      out.write("        reLoadGridData(queryObj);\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    function downloadExcel() {\r\n");
      out.write("        var number=\"4\";\r\n");
      out.write("        var queryObj = {\r\n");
      out.write("            areacode: $(\"#RegionRealtimeSumAddQueryForm\\\\:areacode\").val(),\r\n");
      out.write("            cityCode: $(\"#RegionRealtimeSumAddQueryForm\\\\:cityCode\").val(),\r\n");
      out.write("            regionId: $(\"#RegionRealtimeSumAddQueryForm\\\\:regionId\").val(),\r\n");
      out.write("            begindate: $(\"#RegionRealtimeSumAddQueryForm\\\\:begindate\").val(),\r\n");
      out.write("            holiday: $(\"#RegionRealtimeSumAddQueryForm\\\\:holiday\").attr(\"checked\") ? 'yes' : null,//有值则代表条件生效\r\n");
      out.write("            showTb:$('#showTb').attr(\"checked\") ? 'yes' : null,\r\n");
      out.write("            codeGenerator: 'codeGenerator'\r\n");
      out.write("        };\r\n");
      out.write("        RegionRealtimeSumAddAction.expExcel(queryObj, number,function (result) {\r\n");
      out.write("            if (result.resultCode == \"0\") {\r\n");
      out.write("                var fileName = result.returnObject[1] + \".xls\";\r\n");
      out.write("                fileDownload(fileName);\r\n");
      out.write("            } else {\r\n");
      out.write("                showMsg(\"导出Excel时出错，可能原因为：\\n\" + result.resultMessage);\r\n");
      out.write("            }\r\n");
      out.write("        });\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    function reset() {\r\n");
      out.write("        $(\"#RegionRealtimeSumAddQueryForm\\\\:areacode\").val('');\r\n");
      out.write("        $(\"#RegionRealtimeSumAddQueryForm\\\\:cityCode\").val('');\r\n");
      out.write("        $(\"#RegionRealtimeSumAddQueryForm\\\\:regionId\").val('');\r\n");
      out.write("        $(\"#RegionRealtimeSumAddQueryForm\\\\:begindate\").val('');\r\n");
      out.write("        $(\"#RegionRealtimeSumAddQueryForm\\\\:holiday\").attr(\"checked\", false);\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    //加载表格数据\r\n");
      out.write("    function loadData(data) {\r\n");
      out.write("        $('#RegionRealtimeSumAddList').datagrid('unselectAll');\r\n");
      out.write("        if (data != null && data.length > 0) {\r\n");
      out.write("            $('#RegionRealtimeSumAddList').datagrid({loadFilter:pagerFilter}).datagrid('loadData', {total:data.length,rows:data}).datagrid('getPager').pagination('select',1);\r\n");
      out.write("        } else {\r\n");
      out.write("            $('#RegionRealtimeSumAddList').datagrid('loadData', {total: 0, rows: []});\r\n");
      out.write("        }\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    function getFormObj() {\r\n");
      out.write("        var obj = $(\"#RegionRealtimeSumAddForm\").getJSON().RegionRealtimeSumAddForm;\r\n");
      out.write("        return obj;\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    function reLoadGridData(queryObj) {\r\n");
      out.write("        hiddenDiv(\"RegionRealtimeSumAddListCHART\");\r\n");
      out.write("        var tbshow = document.getElementById(\"showTb\").checked;\r\n");
      out.write("        createSubDiv(\"RegionRealtimeSumAddListCHART\", 0);\r\n");
      out.write("        RegionRealtimeSumAddAction.getRegionRealtimeSumAddList(queryObj, function (result) {\r\n");
      out.write("            if (result.resultCode == \"0\") {\r\n");
      out.write("                var tab= $('.tabs-selected span:first').html()\r\n");
      out.write("                if(tab=='数据列表'){\r\n");
      out.write("                    loadData(result.returnList);\r\n");
      out.write("                }else {\r\n");
      out.write("                    try {\r\n");
      out.write("                        var obj = result.returnObject;\r\n");
      out.write("                        var option = eval(\"(\" + obj + \")\");\r\n");
      out.write("                        var div = document.getElementById(\"RegionRealtimeSumAddListCHART0\");\r\n");
      out.write("                        var height = document.documentElement.clientHeight - 108;\r\n");
      out.write("                        div.style.height = height + \"px\";\r\n");
      out.write("                        var myChart = echarts.init(div);\r\n");
      out.write("                        myChart.clear();\r\n");
      out.write("                        myChart.setOption(option);\r\n");
      out.write("                    } catch (e) {\r\n");
      out.write("                    }\r\n");
      out.write("                }\r\n");
      out.write("            } else {\r\n");
      out.write("                showMsg(\"加载景区新增游客统计列表数据时出错，可能原因为：\\n\" + result.resultMessage);\r\n");
      out.write("            }\r\n");
      out.write("        });\r\n");
      out.write("        if (tbshow) {\r\n");
      out.write("            var queryObj1 = new Object();\r\n");
      out.write("            queryObj1 = queryObj;\r\n");
      out.write("            var searchtime = queryObj.begindate;\r\n");
      out.write("            var dayArr = searchtime.split(\"-\");\r\n");
      out.write("            var tdsearchtime = (parseInt(dayArr[0]) - 1).toString() + \"-\" + dayArr[1] + \"-\" + dayArr[2];\r\n");
      out.write("            queryObj1.begindate = tdsearchtime;\r\n");
      out.write("            createSubDiv(\"RegionRealtimeSumAddListCHART\", 1);\r\n");
      out.write("            RegionRealtimeSumAddAction.getRegionRealtimeSumAddList(queryObj1, function (result1) {\r\n");
      out.write("                if (result1.resultCode == \"0\") {\r\n");
      out.write("                    try{\r\n");
      out.write("                        var obj = result1.returnObject;\r\n");
      out.write("                        var option = eval(\"(\" + obj + \")\");\r\n");
      out.write("                        var div = document.getElementById(\"RegionRealtimeSumAddListCHART1\");\r\n");
      out.write("                        var height = document.documentElement.clientHeight-108;\r\n");
      out.write("                        div.style.height=height+\"px\";\r\n");
      out.write("                        var myChart = echarts.init(div);\r\n");
      out.write("                        myChart.clear();\r\n");
      out.write("                        myChart.setOption(option);\r\n");
      out.write("                    }catch(e){}\r\n");
      out.write("                } else {\r\n");
      out.write("                    showMsg(\"景区时时流量统计数据时出错，可能原因为：\\n\" + result.resultMessage);\r\n");
      out.write("                }\r\n");
      out.write("            });\r\n");
      out.write("        }\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    //--------------------初始化和公用方法 start ------------------------\r\n");
      out.write("    //--------------------界面操作 start ------------------------\r\n");
      out.write("\r\n");
      out.write("    /** 隐藏显示柱状图的显示的画板 */\r\n");
      out.write("    function hiddenDiv(divId) {\r\n");
      out.write("        var allDiv = document.getElementById(divId);\r\n");
      out.write("        while (allDiv.firstChild) {\r\n");
      out.write("            var oldNode = allDiv.removeChild(allDiv.firstChild);\r\n");
      out.write("            oldNode = null;\r\n");
      out.write("        }\r\n");
      out.write("    }\r\n");
      out.write("    /**创建子div*/\r\n");
      out.write("    function createSubDiv(divId, ind) {\r\n");
      out.write("        var allDiv = document.getElementById(divId);\r\n");
      out.write("        var divobj = document.createElement(\"div\");\r\n");
      out.write("        divobj.id = divId + ind;\r\n");
      out.write("        divobj.style.display = \"block\";\r\n");
      out.write("        allDiv.appendChild(divobj);\r\n");
      out.write("    }\r\n");
      out.write("    function provinceCityChange() {\r\n");
      out.write("        var cityid = document.getElementById(\"RegionRealtimeSumAddQueryForm:cityCode\").value;\r\n");
      out.write("        var aLevel = document.getElementById(\"RegionRealtimeSumAddQueryForm:aLevel\").value;\r\n");
      out.write("        var regionId = document.getElementById(\"RegionRealtimeSumAddQueryForm:regionId\");\r\n");
      out.write("        var areacode = document.getElementById(\"RegionRealtimeSumAddQueryForm:areacode\");\r\n");
      out.write("        removeAllOptions();//删除已有的option\r\n");
      out.write("        removeAreaCodeOptions();\r\n");
      out.write("        if (cityid == '') {\r\n");
      out.write("            return;\r\n");
      out.write("        }\r\n");
      out.write("        dwr.engine.setAsync(false);\r\n");
      out.write("        if (cityid == '340000') {\r\n");
      out.write("            regionId.options.add(new Option(\"所有景区\", \"99999999\"));\r\n");
      out.write("            areacode.options.add(new Option(\"全部游客\", \"0\"));\r\n");
      out.write("            areacode.options.add(new Option(\"省外游客\", \"1\"));\r\n");
      out.write("            areacode.options.add(new Option(\"省内游客\", \"2\"));\r\n");
      out.write("            document.getElementById(\"RegionRealtimeSumAddQueryForm:aLevel\").disabled = true;\r\n");
      out.write("            document.getElementById(\"RegionRealtimeSumAddQueryForm:regionId\").disabled = true;\r\n");
      out.write("        } else {\r\n");
      out.write("            areacode.options.add(new Option(\"全部游客\", \"0\"));\r\n");
      out.write("            areacode.options.add(new Option(\"外地游客\", \"1\"));\r\n");
      out.write("            areacode.options.add(new Option(\"本地游客\", \"2\"));\r\n");
      out.write("            document.getElementById(\"RegionRealtimeSumAddQueryForm:aLevel\").disabled = false;\r\n");
      out.write("            document.getElementById(\"RegionRealtimeSumAddQueryForm:regionId\").disabled = false;\r\n");
      out.write("        }\r\n");
      out.write("        UtilsAction.getMyRegionCfgByOrgCode(cityid, null, function (data) {\r\n");
      out.write("            if (null == data || null == data.returnList)return;\r\n");
      out.write("            for (var i = 0; i < data.returnList.length; i++) {\r\n");
      out.write("                if(aLevel==''){\r\n");
      out.write("                    var varItem = new Option(data.returnList[i]['regionName'], data.returnList[i]['id']);\r\n");
      out.write("                    regionId.options.add(varItem);\r\n");
      out.write("                }else if(data.returnList[i]['aLevel']==aLevel){\r\n");
      out.write("                    var varItem = new Option(data.returnList[i]['regionName'], data.returnList[i]['id']);\r\n");
      out.write("                    regionId.options.add(varItem);\r\n");
      out.write("                }\r\n");
      out.write("            }\r\n");
      out.write("        });\r\n");
      out.write("        dwr.engine.setAsync(true);\r\n");
      out.write("    }\r\n");
      out.write("    \r\n");
      out.write("    function initCountyList(){\r\n");
      out.write("\t\t\t\t\tvar cityid = document.getElementById(\"RegionRealtimeSumAddQueryForm:cityCode\").value;\r\n");
      out.write("\t\t\t\t\tvar countyid=$(\"#countyid\");\r\n");
      out.write("\t\t\t\t\tdwr.engine.setAsync(false); \r\n");
      out.write("\t\t\t\t\t$(\"#countyid option:selected\").text(\"\");\r\n");
      out.write("\t\t\t\t\tcountyid.empty();\r\n");
      out.write("\t\t\t\t\tRegionCfgAction.getAreasListByOperator(cityid,function(data){\r\n");
      out.write("\t\t\t\t\t\tif(null==data || null==data.returnList)return;\r\n");
      out.write("\t\t\t\t\t\tfor (var i=0;i<data.returnList.length;i++) {\r\n");
      out.write("\t\t\t\t\t    countyid.append(\"<option value='\"+ data.returnList[i]['areaid']+\"'>\"+ data.returnList[i]['areas'] +\"</option>\");\r\n");
      out.write("\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t});\r\n");
      out.write("\t\t\t\t\tdwr.engine.setAsync(true);\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("    function cityChange() {\r\n");
      out.write("        var cityid = document.getElementById(\"RegionRealtimeSumAddQueryForm:cityCode\").value;\r\n");
      out.write("        var aLevel = document.getElementById(\"RegionRealtimeSumAddQueryForm:aLevel\").value;\r\n");
      out.write("        var regionId = document.getElementById(\"RegionRealtimeSumAddQueryForm:regionId\");\r\n");
      out.write("        removeAllOptions();//删除已有的option\r\n");
      out.write("        if (cityid == '') {\r\n");
      out.write("            return;\r\n");
      out.write("        }\r\n");
      out.write("        dwr.engine.setAsync(false);\r\n");
      out.write("        UtilsAction.getMyRegionCfgByOrgCode(cityid, null, function (data) {\r\n");
      out.write("            if (null == data || null == data.returnList)return;\r\n");
      out.write("            for (var i = 0; i < data.returnList.length; i++) {\r\n");
      out.write("                if(aLevel==''){\r\n");
      out.write("                    var varItem = new Option(data.returnList[i]['regionName'], data.returnList[i]['id']);\r\n");
      out.write("                    regionId.options.add(varItem);\r\n");
      out.write("                }else if(data.returnList[i]['aLevel']==aLevel){\r\n");
      out.write("                    var varItem = new Option(data.returnList[i]['regionName'], data.returnList[i]['id']);\r\n");
      out.write("                    regionId.options.add(varItem);\r\n");
      out.write("                }\r\n");
      out.write("            }\r\n");
      out.write("        });\r\n");
      out.write("        dwr.engine.setAsync(true);\r\n");
      out.write("    }\r\n");
      out.write("    function levelChange(){\r\n");
      out.write("        var cityid = document.getElementById(\"RegionRealtimeSumAddQueryForm:cityCode\").value;\r\n");
      out.write("        var aLevel = document.getElementById(\"RegionRealtimeSumAddQueryForm:aLevel\").value;\r\n");
      out.write("        var regionId = document.getElementById(\"RegionRealtimeSumAddQueryForm:regionId\");\r\n");
      out.write("        removeAllOptions();//删除已有的option\r\n");
      out.write("        if (cityid=='') {\r\n");
      out.write("            return;\r\n");
      out.write("        }\r\n");
      out.write("        if(aLevel==''){\r\n");
      out.write("            cityChange();\r\n");
      out.write("            return;\r\n");
      out.write("        }\r\n");
      out.write("        dwr.engine.setAsync(false);\r\n");
      out.write("        UtilsAction.getMyRegionCfgByOrgCode(cityid,null,function(data){\r\n");
      out.write("            if(null==data || null==data.returnList)return;\r\n");
      out.write("            for (var i=0;i<data.returnList.length;i++) {\r\n");
      out.write("                if(data.returnList[i]['aLevel']==aLevel){\r\n");
      out.write("                    var varItem = new Option(data.returnList[i]['regionName'],data.returnList[i]['id']);\r\n");
      out.write("                    regionId.options.add(varItem);\r\n");
      out.write("                }\r\n");
      out.write("            }\r\n");
      out.write("        });\r\n");
      out.write("        dwr.engine.setAsync(true);\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("\t function levelChange1(){\r\n");
      out.write("        var cityid = document.getElementById(\"RegionRealtimeSumAddQueryForm:cityCode\").value;\r\n");
      out.write("        var countyid = document.getElementById(\"countyid\").value;\r\n");
      out.write("        var aLevel = document.getElementById(\"RegionRealtimeSumAddQueryForm:aLevel\").value;\r\n");
      out.write("        var regionId = document.getElementById(\"RegionRealtimeSumAddQueryForm:regionId\");\r\n");
      out.write("        //removeAllOptions();//删除已有的option\r\n");
      out.write("        $('#RegionRealtimeSumAddQueryForm\\\\:regionId option:selected').text(\"\");\r\n");
      out.write("        $(\"#RegionRealtimeSumAddQueryForm\\\\:regionId\").empty();\r\n");
      out.write("        if (cityid=='') {\r\n");
      out.write("            return;\r\n");
      out.write("        }\r\n");
      out.write("        if(aLevel==''){\r\n");
      out.write("            //cityChange();\r\n");
      out.write("            return;\r\n");
      out.write("        }\r\n");
      out.write("        dwr.engine.setAsync(false);\r\n");
      out.write("        /* UtilsAction.getMyRegionCfgByOrgCode(cityid,null,function(data){\r\n");
      out.write("            if(null==data || null==data.returnList)return;\r\n");
      out.write("            for (var i=0;i<data.returnList.length;i++) {\r\n");
      out.write("                if(data.returnList[i]['aLevel']==aLevel){\r\n");
      out.write("                    var varItem = new Option(data.returnList[i]['regionName'],data.returnList[i]['id']);\r\n");
      out.write("                    regionId.options.add(varItem);\r\n");
      out.write("                }\r\n");
      out.write("            }\r\n");
      out.write("        }); */\r\n");
      out.write("        \r\n");
      out.write("        UtilsAction.getMyRegionCfgByCounty(countyid,aLevel,function(data){\r\n");
      out.write("\t\t\t\tif(null==data || null==data.returnList)return;\r\n");
      out.write("\t\t\t\tif(aLevel=='0'){\r\n");
      out.write("\t\t\t\t   var quanbu  = new Option('全部','');\r\n");
      out.write("\t\t\t\t   regionId.options.add(quanbu);\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\tfor (var i=0;i<data.returnList.length;i++) {\r\n");
      out.write("\t\t\t\t\tif(aLevel=='0'){\r\n");
      out.write("\t\t\t\t\t\tvar varItem = new Option(data.returnList[i]['regionName'],data.returnList[i]['id']);\r\n");
      out.write("\t\t\t\t\t\tregionId.options.add(varItem);\r\n");
      out.write("\t\t\t\t\t}else if(data.returnList[i]['aLevel']==aLevel){\r\n");
      out.write("\t\t\t\t\t\tvar varItem = new Option(data.returnList[i]['regionName'],data.returnList[i]['id']);\r\n");
      out.write("\t\t\t\t\t\tregionId.options.add(varItem);\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t});\r\n");
      out.write("        dwr.engine.setAsync(true);\r\n");
      out.write("    }\r\n");
      out.write("\t\r\n");
      out.write("\r\n");
      out.write("    function initloginerCityList() {\r\n");
      out.write("        var cityid = document.getElementById(\"RegionRealtimeSumAddQueryForm:cityCode\");\r\n");
      out.write("         var areacode = document.getElementById(\"RegionRealtimeSumAddQueryForm:areacode\");\r\n");
      out.write("         areacode.options.add(new Option(\"全部游客\", \"0\"));\r\n");
      out.write("         areacode.options.add(new Option(\"外地游客\", \"1\"));\r\n");
      out.write("         areacode.options.add(new Option(\"本地游客\", \"2\"));\r\n");
      out.write("        dwr.engine.setAsync(false);\r\n");
      out.write("        UtilsAction.getMyCitycode(function (data) {\r\n");
      out.write("            if (null == data || null == data.returnList)return;\r\n");
      out.write("            for (var i = 0; i < data.returnList.length; i++) {\r\n");
      out.write("                //if(data.returnList[i]['cityid'] != '340000'){\r\n");
      out.write("                var varItem = new Option(data.returnList[i]['name'], data.returnList[i]['cityid']);\r\n");
      out.write("                cityid.options.add(varItem);\r\n");
      out.write("                //}\r\n");
      out.write("            }\r\n");
      out.write("        });\r\n");
      out.write("        dwr.engine.setAsync(true);\r\n");
      out.write("    }\r\n");
      out.write("    /*删除select控件中所有的options*/\r\n");
      out.write("    function removeAllOptions() {\r\n");
      out.write("        var region = document.getElementById(\"RegionRealtimeSumAddQueryForm:regionId\");\r\n");
      out.write("        var length = region.options.length;\r\n");
      out.write("        if (length > 0) {\r\n");
      out.write("            for (var i = 0; i < length; i++) {\r\n");
      out.write("                region.removeChild(region.options[region.options.length - 1]);\r\n");
      out.write("            }\r\n");
      out.write("        }\r\n");
      out.write("    }\r\n");
      out.write("    /*删除select控件中所有的options*/\r\n");
      out.write("    function removeAreaCodeOptions() {\r\n");
      out.write("        var region = document.getElementById(\"RegionRealtimeSumAddQueryForm:areacode\");\r\n");
      out.write("        var length = region.options.length;\r\n");
      out.write("        if (length > 0) {\r\n");
      out.write("            for (var i = 0; i < length; i++) {\r\n");
      out.write("                region.removeChild(region.options[region.options.length - 1]);\r\n");
      out.write("            }\r\n");
      out.write("        }\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    //--------------------界面操作 end ------------------------\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
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
