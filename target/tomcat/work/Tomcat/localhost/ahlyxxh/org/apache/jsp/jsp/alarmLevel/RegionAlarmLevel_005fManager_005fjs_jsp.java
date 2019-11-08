/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.37
 * Generated at: 2017-06-09 02:59:15 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.jsp.alarmLevel;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class RegionAlarmLevel_005fManager_005fjs_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\tFunction.prototype.method = function(name, func) {\r\n");
      out.write("\t  this.prototype[name] = func;\r\n");
      out.write("\t  return this;\r\n");
      out.write("\t};\r\n");
      out.write("\tif(!String.prototype.trim){ //判断下浏览器是否自带有trim()方法\r\n");
      out.write("\tString.method('trim', function() {\r\n");
      out.write("\treturn this.replace(/^\\s+|\\s+$/g, '');\r\n");
      out.write("\t});\r\n");
      out.write("\tString.method('ltrim', function() {\r\n");
      out.write("\treturn this.replace(/^\\s+/g, '');\r\n");
      out.write("\t});\r\n");
      out.write("\tString.method('rtrim', function() {\r\n");
      out.write("\treturn this.replace(/\\s+$/g, '');\r\n");
      out.write("\t});\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    var queryFormCach = null;\r\n");
      out.write("    var treeSelectCach = null;\r\n");
      out.write("    $(function () {\r\n");
      out.write("\r\n");
      out.write("        //创建列表\r\n");
      out.write("        $(\"#RegionAlarmLevelList\").datagrid({\r\n");
      out.write("            title: '景区预警阀值管理',\r\n");
      out.write("            idField: 'id',\r\n");
      out.write("            rownumbers:true,\r\n");
      out.write("            singleSelect : false,\r\n");
      out.write("            pagination : true,\r\n");
      out.write("            height : getViewportHeight()-50,\r\n");
      out.write("            pageSize: 20,\r\n");
      out.write("            fitColumns : true,\r\n");
      out.write("            frozenColumns: [[\r\n");
      out.write("                {field: 'ck', checkbox: true}\r\n");
      out.write("            ]],\r\n");
      out.write("            columns: [[\r\n");
      out.write("                {field: 'id', title:'编号', hidden:true},\r\n");
      out.write("                {field: 'regionName', title: '景区名称', width: 100},\r\n");
      out.write("                {field: 'level1Num', title: '红色预警(人数)', width: 100},\r\n");
      out.write("                {field: 'level2Num', title: '橙色预警(人数)', width: 100},\r\n");
      out.write("                {field: 'level3Num', title: '黄色预警(人数)', width: 100},\r\n");
      out.write("                {field: 'level4Num', title: '蓝色预警(人数)', width: 100},\r\n");
      out.write("                {field: 'editTime', title: '更新时间', width: 100,formatter:function(date){\r\n");
      out.write("                    return date==null?'':date.pattern(\"yyyy-MM-dd HH:mm:ss\");\r\n");
      out.write("                }},\r\n");
      out.write("                {field: 'currentLevelName', title: '当前预警级别',align:'center', width: 100,styler:function(value,row,index){\r\n");
      out.write("                    if (value == '红色预警'){\r\n");
      out.write("                        return 'background-color:red;color:#fff;';\r\n");
      out.write("                    }else if(value =='橙色预警'){\r\n");
      out.write("                        return 'background-color:#FF9900;color:#fff;';\r\n");
      out.write("                    }else if(value =='黄色预警'){\r\n");
      out.write("                        return 'background-color:#FFFF77;color:#222222;';\r\n");
      out.write("                    }else if(value =='蓝色预警'){\r\n");
      out.write("                        return 'background-color:#0099FF;color:#fff;';\r\n");
      out.write("                    }}},\r\n");
      out.write("                {field: 'currentLevel', title: '预警级别',hidden:true},\r\n");
      out.write("                {field: 'codeGenerator', title: 'codeGenerator', width: 0, hidden: true}\r\n");
      out.write("            ]],\r\n");
      out.write("            toolbar: [{\r\n");
      out.write("                text: '添加',\r\n");
      out.write("                iconCls: 'icon-add',\r\n");
      out.write("                handler: RegionAlarmLevelAdd\r\n");
      out.write("            }, {\r\n");
      out.write("                text: '修改',\r\n");
      out.write("                iconCls: 'icon-edit',\r\n");
      out.write("                handler: RegionAlarmLevelEdit\r\n");
      out.write("            }, {\r\n");
      out.write("                text: '删除',\r\n");
      out.write("                iconCls: 'icon-remove',\r\n");
      out.write("                handler: RegionAlarmLevelDel\r\n");
      out.write("            }],\r\n");
      out.write("            onDblClickRow: RegionAlarmLevelEdit\r\n");
      out.write("        });\r\n");
      out.write("\r\n");
      out.write("        //创建编辑对话框\r\n");
      out.write("        $('#RegionAlarmLevelDialog').dialog({\r\n");
      out.write("            title: '新增景区预警信息',\r\n");
      out.write("            modal: true,\r\n");
      out.write("            buttons: [{\r\n");
      out.write("                text: '确定',\r\n");
      out.write("                iconCls: 'icon-ok',\r\n");
      out.write("                handler: function () {\r\n");
      out.write("\r\n");
      out.write("                }\r\n");
      out.write("            }, {\r\n");
      out.write("                text: '取消',\r\n");
      out.write("                handler: function () {\r\n");
      out.write("                    $('#RegionAlarmLevelDialog').dialog('close');\r\n");
      out.write("                }\r\n");
      out.write("            }],\r\n");
      out.write("            closed: true\r\n");
      out.write("        });\r\n");
      out.write("\r\n");
      out.write("        //初始化表单元素\r\n");
      out.write("        initForm();\r\n");
      out.write("\r\n");
      out.write("    });//结束初始化函数\r\n");
      out.write("\r\n");
      out.write("    //--------------------初始化和公用方法 start ------------------------\r\n");
      out.write("    function initForm() {\r\n");
      out.write("        $(\"#btn_query\").click(query);\r\n");
      out.write("        $(\"#btn_reset\").click(reset);\r\n");
      out.write("        query();\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    //查询\r\n");
      out.write("    function query() {\r\n");
      out.write("        $('#RegionAlarmLevelList').datagrid('unselectAll');\r\n");
      out.write("        var queryObj = {\r\n");
      out.write("            regionName: $(\"#RegionAlarmLevelQueryForm\\\\:regionName\").val(),\r\n");
      out.write("            currentLevel: $(\"#RegionAlarmLevelQueryForm\\\\:currentLevel\").val(),\r\n");
      out.write("            codeGenerator: 'codeGenerator'\r\n");
      out.write("        };\r\n");
      out.write("        treeSelectCach = null;\r\n");
      out.write("        queryFormCach = queryObj;\r\n");
      out.write("\r\n");
      out.write("        reLoadGridData(queryObj);\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    function reset() {\r\n");
      out.write("        $(\"#RegionAlarmLevelQueryForm\\\\:regionName\").val('');\r\n");
      out.write("        $(\"#RegionAlarmLevelQueryForm\\\\:currentLevel\").val('');\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    //加载表格数据\r\n");
      out.write("    function loadData(data) {\r\n");
      out.write("        $('#RegionAlarmLevelList').datagrid('unselectAll');\r\n");
      out.write("        if (data != null && data.length > 0) {\r\n");
      out.write("            $('#RegionAlarmLevelList').datagrid({loadFilter:pagerFilter}).datagrid('loadData', {total:data.length,rows:data}).datagrid('getPager').pagination('select',1);\r\n");
      out.write("\r\n");
      out.write("            //$('#RegionAlarmLevelList').datagrid('loadData', {total: data.length, rows: data});\r\n");
      out.write("        } else {\r\n");
      out.write("            $('#RegionAlarmLevelList').datagrid('loadData', {total: 0, rows: []});\r\n");
      out.write("        }\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    function getFormObj() {\r\n");
      out.write("        var obj = $(\"#RegionAlarmLevelForm\").getJSON().RegionAlarmLevelForm;\r\n");
      out.write("        return obj;\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    function reLoadGridData(queryObj) {\r\n");
      out.write("        RegionAlarmLevelAction.getRegionAlarmLevelList(queryObj, function (result) {\r\n");
      out.write("            if (result.resultCode == \"0\") {\r\n");
      out.write("                loadData(result.returnList);\r\n");
      out.write("            } else {\r\n");
      out.write("                showMsg(\"加载景区预警列表数据时出错，可能原因为：\\n\" + result.resultMessage);\r\n");
      out.write("            }\r\n");
      out.write("        });\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    //--------------------初始化和公用方法 start ------------------------\r\n");
      out.write("    //--------------------界面操作 start ------------------------\r\n");
      out.write("\r\n");
      out.write("    function RegionAlarmLevelAdd() {\r\n");
      out.write("        $('#RegionAlarmLevelForm').clear();\r\n");
      out.write("\r\n");
      out.write("        $('#RegionAlarmLevelDialog').dialog({\r\n");
      out.write("            title: '新增景区预警阀值',\r\n");
      out.write("            modal: true,\r\n");
      out.write("            buttons: [{\r\n");
      out.write("                text: '确定',\r\n");
      out.write("                iconCls: 'icon-ok',\r\n");
      out.write("                handler: RegionAlarmLevelCreate\r\n");
      out.write("            }, {\r\n");
      out.write("                text: '取消',\r\n");
      out.write("                handler: function () {\r\n");
      out.write("                    $('#RegionAlarmLevelDialog').dialog('close');\r\n");
      out.write("                }\r\n");
      out.write("            }],\r\n");
      out.write("            closed: false\r\n");
      out.write("        });\r\n");
      out.write("        initRegionsSelect();\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    function validAlarmLevel(){\r\n");
      out.write("        var level1Num = $('#RegionAlarmLevelForm\\\\:level1Num').val();\r\n");
      out.write("        var level2Num = $('#RegionAlarmLevelForm\\\\:level2Num').val();\r\n");
      out.write("        var level3Num = $('#RegionAlarmLevelForm\\\\:level3Num').val();\r\n");
      out.write("        var level4Num = $('#RegionAlarmLevelForm\\\\:level4Num').val();\r\n");
      out.write("        if(parseInt(level1Num)<=parseInt(level2Num)){\r\n");
      out.write("            showMsg(\"红色预警人数必须大于橙色预警人数\");\r\n");
      out.write("            return false;\r\n");
      out.write("        }\r\n");
      out.write("        if(parseInt(level2Num)<=parseInt(level3Num)){\r\n");
      out.write("            showMsg(\"橙色预警人数必须大于黄色预警人数\");\r\n");
      out.write("            return false;\r\n");
      out.write("        }\r\n");
      out.write("        if(parseInt(level3Num)<=parseInt(level4Num)){\r\n");
      out.write("            showMsg(\"黄色预警人数必须大于蓝色预警人数\");\r\n");
      out.write("            return false;\r\n");
      out.write("        }\r\n");
      out.write("        return true;\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    function RegionAlarmLevelCreate() {\r\n");
      out.write("        var obj = getFormObj();\r\n");
      out.write("        if (!jQuery.form(\"#RegionAlarmLevelForm\").validate())return;\r\n");
      out.write("        if(!validAlarmLevel()) return;\r\n");
      out.write("        RegionAlarmLevelAction.createRegionAlarmLevel(obj, function (result) {\r\n");
      out.write("            if (result.resultCode == \"0\") {\r\n");
      out.write("                $('#RegionAlarmLevelDialog').dialog('close');\r\n");
      out.write("                var queryObj = treeSelectCach == null ? queryFormCach : treeSelectCach;\r\n");
      out.write("                reLoadGridData(queryObj);\r\n");
      out.write("            } else {\r\n");
      out.write("                showMsg(\"创建景区预警时出错，可能原因为：\\n\" + result.resultMessage);\r\n");
      out.write("            }\r\n");
      out.write("        });\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    function RegionAlarmLevelEdit(index, rowData) {\r\n");
      out.write("        var rows = new Array();\r\n");
      out.write("        if (null != rowData) {\r\n");
      out.write("            rows.push(rowData);\r\n");
      out.write("        } else {\r\n");
      out.write("            rows = $('#RegionAlarmLevelList').datagrid('getSelections');\r\n");
      out.write("        }\r\n");
      out.write("        if (rows.length <= 0) {\r\n");
      out.write("            showMsg(\"请先选择需要修改的景区!\");\r\n");
      out.write("            return;\r\n");
      out.write("        }\r\n");
      out.write("        if (rows.length > 1) {\r\n");
      out.write("            showMsg(\"不能同时修改多个景区!\");\r\n");
      out.write("            return;\r\n");
      out.write("        }\r\n");
      out.write("        initRegionsSelect();\r\n");
      out.write("        //初始化数据\r\n");
      out.write("        $(\"#RegionAlarmLevelForm\").setJSON({RegionAlarmLevelForm: rows[0]});\r\n");
      out.write("\r\n");
      out.write("        $('#RegionAlarmLevelDialog').dialog({\r\n");
      out.write("            title: '修改景区预警阀值',\r\n");
      out.write("            modal: true,\r\n");
      out.write("            buttons: [{\r\n");
      out.write("                text: '确定',\r\n");
      out.write("                iconCls: 'icon-ok',\r\n");
      out.write("                handler: RegionAlarmLevelUpdate\r\n");
      out.write("            }, {\r\n");
      out.write("                text: '取消',\r\n");
      out.write("                handler: function () {\r\n");
      out.write("                    $('#RegionAlarmLevelDialog').dialog('close');\r\n");
      out.write("                }\r\n");
      out.write("            }],\r\n");
      out.write("            closed: false\r\n");
      out.write("        });\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    function RegionAlarmLevelUpdate() {\r\n");
      out.write("        var obj = getFormObj();\r\n");
      out.write("        if (!jQuery.form(\"#RegionAlarmLevelForm\").validate())return;\r\n");
      out.write("        if(!validAlarmLevel()) return;\r\n");
      out.write("        RegionAlarmLevelAction.updateRegionAlarmLevel(obj, function (result) {\r\n");
      out.write("            if (result.resultCode == \"0\") {\r\n");
      out.write("                $('#RegionAlarmLevelDialog').dialog('close');\r\n");
      out.write("                var queryObj = treeSelectCach == null ? queryFormCach : treeSelectCach;\r\n");
      out.write("                reLoadGridData(queryObj);\r\n");
      out.write("            } else {\r\n");
      out.write("                showMsg(\"更新景区预警阀值时出错，可能原因为：\\n\" + result.resultMessage);\r\n");
      out.write("            }\r\n");
      out.write("        });\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    function initRegionsSelect(){\r\n");
      out.write("        DWREngine.setAsync(false);\r\n");
      out.write("        RegionAlarmLevelAction.queryRegions(function(result){\r\n");
      out.write("            if (result.resultCode == \"0\") {\r\n");
      out.write("                var data = result.returnList;\r\n");
      out.write("                var html = '';\r\n");
      out.write("                for(var i=0;i<data.length;i++){\r\n");
      out.write("                    html += '<option value='+data[i].regionId+'>'+data[i].regionName+'</option>';\r\n");
      out.write("                }\r\n");
      out.write("                $('#RegionAlarmLevelForm\\\\:regionId').html(html);\r\n");
      out.write("            } else {\r\n");
      out.write("                showMsg(\"加载景区列表时出错，可能原因为：\\n\" + result.resultMessage);\r\n");
      out.write("            }\r\n");
      out.write("        });\r\n");
      out.write("        DWREngine.setAsync(true);\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    function RegionAlarmLevelDel() {\r\n");
      out.write("        var rows = $('#RegionAlarmLevelList').datagrid('getSelections');\r\n");
      out.write("        if (rows.length <= 0) {\r\n");
      out.write("            showMsg(\"请先选择需要删除的景区!\");\r\n");
      out.write("            return;\r\n");
      out.write("        }\r\n");
      out.write("        confirmMsg('确认需要删除这些景区阀值吗?', function (isdel) {\r\n");
      out.write("            if (isdel) {\r\n");
      out.write("                var objs = new Array();\r\n");
      out.write("                for (var i = 0; i < rows.length; i++) {\r\n");
      out.write("                    objs.push({id: rows[i].id});\r\n");
      out.write("                }\r\n");
      out.write("                RegionAlarmLevelAction.batchDeleteRegionAlarmLevel(objs, function (result) {\r\n");
      out.write("                    if (result.resultCode == \"0\") {\r\n");
      out.write("                        var queryObj = treeSelectCach == null ? queryFormCach : treeSelectCach;\r\n");
      out.write("                        reLoadGridData(queryObj);\r\n");
      out.write("                    } else {\r\n");
      out.write("                        showMsg(\"删除景区预警阀值时出错，可能原因为：\\n\" + result.resultMessage);\r\n");
      out.write("                    }\r\n");
      out.write("                });\r\n");
      out.write("            }\r\n");
      out.write("        });\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    //--------------------界面操作 end ------------------------\r\n");
      out.write("\r\n");
      out.write("</script>");
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
