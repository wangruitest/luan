/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.37
 * Generated at: 2019-10-31 02:57:58 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.jsp.system;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class SysOperator_005fManager_005fjs_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\tvar queryFormCach=null;\r\n");
      out.write("\tvar treeSelectCach=null;\r\n");
      out.write("\tvar selectedRoles=new Array();\r\n");
      out.write("\t$(function(){\r\n");
      out.write("\t\tinitCountyList();\r\n");
      out.write("\t\t//创建列表\r\n");
      out.write("\t\t$(\"#SysOperatorList\").datagrid({\r\n");
      out.write("\t\t\ttitle:'管理',\r\n");
      out.write("\t\t\tidField:'unid',\r\n");
      out.write("\t\t\tsingleSelect: false,\r\n");
      out.write("\t\t\tpagination: true,\r\n");
      out.write("\t\t\theight:getViewportHeight()-50,\r\n");
      out.write("\t\t\t//width:'auto',\r\n");
      out.write("\t\t\t//fit:true,\r\n");
      out.write("\t\t\tfitColumns: true,\r\n");
      out.write("\t\t\tfrozenColumns:[[\r\n");
      out.write("\t\t\t                {field:'ck',checkbox:true}\r\n");
      out.write("\t\t\t\t\t\t]],\r\n");
      out.write("\t\t\tcolumns:[[\r\n");
      out.write("\t\t\t\t{field:'name',title:'姓名',width:100},\r\n");
      out.write("\t\t\t\t{field:'loginName',title:'登录名',width:100},\r\n");
      out.write("\t\t\t\t{field:'status',title:'状态',width:100,formatter:function(val){\r\n");
      out.write("\t\t\t\t\treturn val==0?'启用':'禁用';\r\n");
      out.write("\t\t\t\t}},\r\n");
      out.write("\t\t\t\t{field:'remark',title:'备注',width:100},\r\n");
      out.write("\t\t\t\t{field:'sex',title:'性别',width:100,formatter:function(val){\r\n");
      out.write("\t\t\t\t\treturn val==0?'女':'男';\r\n");
      out.write("\t\t\t\t}},\r\n");
      out.write("\t\t\t\t{field:'mobileNumber',title:'手机号码',width:100},\r\n");
      out.write("\t\t\t\t{field:'telephoneNumber',title:'电话号码',width:100},\r\n");
      out.write("\t\t\t\t{field:'countyName',title:'所属区县',width:100},\r\n");
      out.write("\t\t\t\t{field:'mail',title:'邮箱地址',width:100}\r\n");
      out.write("\t\t\t]],\r\n");
      out.write("\t\t\ttoolbar:[{\r\n");
      out.write("\t\t\t\ttext:'添加',\r\n");
      out.write("\t\t\t\ticonCls:'icon-add',\r\n");
      out.write("\t\t\t\thandler:SysOperatorAdd\r\n");
      out.write("\t\t\t},{\r\n");
      out.write("\t\t\t\ttext:'修改',\r\n");
      out.write("\t\t\t\ticonCls:'icon-edit',\r\n");
      out.write("\t\t\t\thandler:SysOperatorEdit\r\n");
      out.write("\t\t\t},{\r\n");
      out.write("\t\t\t\ttext:'删除',\r\n");
      out.write("\t\t\t\ticonCls:'icon-remove',\r\n");
      out.write("\t\t\t\thandler:SysOperatorDel\r\n");
      out.write("\t\t\t}],\r\n");
      out.write("\t\t\tonDblClickRow: SysOperatorEdit\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t//创建编辑对话框\r\n");
      out.write("\t\t$('#SysOperatorDialog').dialog({\r\n");
      out.write("\t\t\ttitle:'新增',\r\n");
      out.write("\t\t\tmodal:true,\r\n");
      out.write("\t\t\tbuttons:[{\r\n");
      out.write("\t\t\t\ttext:'确定',\r\n");
      out.write("\t\t\t\ticonCls:'icon-ok',\r\n");
      out.write("\t\t\t\thandler:function(){\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t},{\r\n");
      out.write("\t\t\t\ttext:'取消',\r\n");
      out.write("\t\t\t\thandler:function(){\r\n");
      out.write("\t\t\t\t\t$('#SysOperatorDialog').dialog('close');\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}],\r\n");
      out.write("\t\t\tclosed:true\r\n");
      out.write("\t\t});\r\n");
      out.write("\r\n");
      out.write("\t\t//初始化表单元素\r\n");
      out.write("\t\tinitForm();\r\n");
      out.write("\t\t\r\n");
      out.write("\t});//结束初始化函数\r\n");
      out.write("\r\n");
      out.write("//--------------------初始化和公用方法 start ------------------------\r\n");
      out.write("\tfunction initForm(){\r\n");
      out.write("\t\t$(\"#btn_query\").click(query);\r\n");
      out.write("\t\t$(\"#btn_reset\").click(reset);\r\n");
      out.write("\t\t$(\"#btn_select_roles\").click(selectRoles);\r\n");
      out.write("\t\tquery();\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction selectRoles(){\r\n");
      out.write("\t\tvar option={\r\n");
      out.write("\t\t\ttype:'02',\r\n");
      out.write("\t\t    title:'选择包含的角色',\r\n");
      out.write("\t\t\tselectedData:selectedRoles\r\n");
      out.write("\t\t};\r\n");
      out.write("\t\tcommonSelect(option,selectRolesBack);\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction selectRolesBack(result){\r\n");
      out.write("\t\tselectedRoles=result;\r\n");
      out.write("\t\tloadSelectedRoles();\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\t//查询\r\n");
      out.write("\tfunction query(){\r\n");
      out.write("\t\t$('#SysOperatorList').datagrid('unselectAll');\r\n");
      out.write("\t\tvar queryObj = {\r\n");
      out.write("\tunid:$(\"#SysOperatorQueryForm\\\\:unid\").val(),\r\n");
      out.write("\tname:$(\"#SysOperatorQueryForm\\\\:name\").val(),\r\n");
      out.write("\tloginName:$(\"#SysOperatorQueryForm\\\\:loginName\").val(),\r\n");
      out.write("\tpassword:$(\"#SysOperatorQueryForm\\\\:password\").val(),\r\n");
      out.write("\tstatus:$(\"#SysOperatorQueryForm\\\\:status\").val(),\r\n");
      out.write("\tremark:$(\"#SysOperatorQueryForm\\\\:remark\").val(),\r\n");
      out.write("\torgUnid:$(\"#SysOperatorQueryForm\\\\:orgUnid\").val(),\r\n");
      out.write("\tcountyCode:$(\"#SysOperatorForm\\\\:countyCode\").val(),\r\n");
      out.write("\tsex:$(\"#SysOperatorQueryForm\\\\:sex\").val(),\r\n");
      out.write("\tidNumber:$(\"#SysOperatorQueryForm\\\\:idNumber\").val(),\r\n");
      out.write("\tmobileNumber:$(\"#SysOperatorQueryForm\\\\:mobileNumber\").val(),\r\n");
      out.write("\ttelephoneNumber:$(\"#SysOperatorQueryForm\\\\:telephoneNumber\").val(),\r\n");
      out.write("\tfax:$(\"#SysOperatorQueryForm\\\\:fax\").val(),\r\n");
      out.write("\tmail:$(\"#SysOperatorQueryForm\\\\:mail\").val(),\r\n");
      out.write("\tsysUnid:$(\"#SysOperatorQueryForm\\\\:sysUnid\").val(),\r\n");
      out.write("\t\t\t\tcodeGenerator:'codeGenerator'\r\n");
      out.write("\t\t\t\t\t};\r\n");
      out.write("\t\ttreeSelectCach=null;\r\n");
      out.write("\t\tqueryFormCach=queryObj;\r\n");
      out.write("\t\t\r\n");
      out.write("\t\treLoadGridData(queryObj);\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tfunction reset(){\r\n");
      out.write("\t\t$(\"#SysOperatorQueryForm\\\\:unid\").val('');\r\n");
      out.write("\t\t$(\"#SysOperatorQueryForm\\\\:name\").val('');\r\n");
      out.write("\t\t$(\"#SysOperatorQueryForm\\\\:loginName\").val('');\r\n");
      out.write("\t\t$(\"#SysOperatorQueryForm\\\\:password\").val('');\r\n");
      out.write("\t\t$(\"#SysOperatorQueryForm\\\\:status\").val('0');\r\n");
      out.write("\t\t$(\"#SysOperatorQueryForm\\\\:remark\").val('');\r\n");
      out.write("\t\t$(\"#SysOperatorQueryForm\\\\:orgUnid\").val('');\r\n");
      out.write("\t\t$(\"#SysOperatorQueryForm\\\\:sex\").val('');\r\n");
      out.write("\t\t$(\"#SysOperatorQueryForm\\\\:idNumber\").val('');\r\n");
      out.write("\t\t$(\"#SysOperatorQueryForm\\\\:mobileNumber\").val('');\r\n");
      out.write("\t\t$(\"#SysOperatorQueryForm\\\\:telephoneNumber\").val('');\r\n");
      out.write("\t\t$(\"#SysOperatorQueryForm\\\\:fax\").val('');\r\n");
      out.write("\t\t$(\"#SysOperatorQueryForm\\\\:mail\").val('');\r\n");
      out.write("\t\t$(\"#SysOperatorQueryForm\\\\:sysUnid\").val('');\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t//加载表格数据\r\n");
      out.write("\tfunction loadData(data){\r\n");
      out.write("\t\t$('#SysOperatorList').datagrid('unselectAll');\r\n");
      out.write("\t\tif(data!=null && data.length>0){\r\n");
      out.write("\t\t\t$('#SysOperatorList').datagrid({loadFilter:pagerFilter}).datagrid('loadData', {total:data.length,rows:data}).datagrid('getPager').pagination('select',1);\r\n");
      out.write("\t\t}else{\r\n");
      out.write("\t\t\t$('#SysOperatorList').datagrid({loadFilter:pagerFilter}).datagrid('loadData',{total:0,rows:[]});\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("\r\n");
      out.write("\tfunction getFormObj(){\r\n");
      out.write("\t\tvar obj = $(\"#SysOperatorForm\").getJSON().SysOperatorForm;\r\n");
      out.write("\t\treturn obj;\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tfunction reLoadGridData(queryObj){\r\n");
      out.write("\t\tSysOperatorAction.getSysOperatorList(queryObj,function(result){\r\n");
      out.write("\t\t\t\tif(result.resultCode==\"0\"){\r\n");
      out.write("\t\t\t\t\tloadData(result.returnList);\r\n");
      out.write("\t\t\t\t}else{\r\n");
      out.write("\t\t\t\t\tshowMsg(\"加载列表数据时出错，可能原因为：\\n\"+result.resultMessage);\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("//--------------------初始化和公用方法 start ------------------------\r\n");
      out.write("//--------------------界面操作 start ------------------------\r\n");
      out.write("\r\n");
      out.write("function initCountyList(){\r\n");
      out.write("\tvar cityName=$(\"#SysOperatorForm\\\\:orgUnid option:selected\").text();\r\n");
      out.write("\tvar countyid=$(\"#SysOperatorForm\\\\:countyCode\");\r\n");
      out.write("\tdwr.engine.setAsync(false);\r\n");
      out.write("\tRegionCfgAction.getAreasListByName(cityName,function(data){\r\n");
      out.write("\t\tcountyid.empty();\r\n");
      out.write("\t\tif(null==data || null==data.returnList)return;\r\n");
      out.write("\t\tcountyid.prepend(\"<option value='0'>全部</option>\");\r\n");
      out.write("\t\tfor (var i=0;i<data.returnList.length;i++) {\r\n");
      out.write("\t    countyid.append(\"<option value='\"+ data.returnList[i]['areaid']+\"'>\"+ data.returnList[i]['areas'] +\"</option>\");\r\n");
      out.write("\t\t}\r\n");
      out.write("\t});\r\n");
      out.write("\tdwr.engine.setAsync(true);\r\n");
      out.write("}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction SysOperatorAdd(){\r\n");
      out.write("\t\tselectedRoles=new Array();\r\n");
      out.write("\t\t$('#SysOperatorForm').clear();\r\n");
      out.write("\r\n");
      out.write("\t\t$('#SysOperatorDialog').dialog({\r\n");
      out.write("\t\t\ttitle:'新增',\r\n");
      out.write("\t\t\tmodal:true,\r\n");
      out.write("\t\t\tbuttons:[{\r\n");
      out.write("\t\t\t\ttext:'确定',\r\n");
      out.write("\t\t\t\ticonCls:'icon-ok',\r\n");
      out.write("\t\t\t\thandler:SysOperatorCreate\r\n");
      out.write("\t\t\t},{\r\n");
      out.write("\t\t\t\ttext:'取消',\r\n");
      out.write("\t\t\t\thandler:function(){\r\n");
      out.write("\t\t\t\t\t$('#SysOperatorDialog').dialog('close');\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}],\r\n");
      out.write("\t\t\tclosed:false\r\n");
      out.write("\t\t});\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction SysOperatorCreate(){\r\n");
      out.write("\t\tif(!jQuery.form(\"#SysOperatorForm\").validate())return;\r\n");
      out.write("\t\tvar obj=getFormObj();\r\n");
      out.write("\t\tobj.roles=selectedRoles;\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t var reges=/[`~!@#$%\\^\\&\\*\\(\\)_\\+“”《》！@#￥%<>\\?:\"\\{\\},\\.\\\\\\/;'\\[\\]]/im; \r\n");
      out.write("\t\t var space=/\\s+/g;//正则匹配空格\r\n");
      out.write("        \r\n");
      out.write("        if(reges.test(obj.name)||space.test(obj.name)) {\r\n");
      out.write("            showMsg(\"姓名不能包含非法字符！\");\r\n");
      out.write("            return;\r\n");
      out.write("        }\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tif(reges.test(obj.loginName)||space.test(obj.loginName)) {\r\n");
      out.write("            showMsg(\"登录名不能包含非法字符！\");\r\n");
      out.write("            return;\r\n");
      out.write("        }\r\n");
      out.write("\t\tif(reges.test(obj.password)||space.test(obj.password)) {\r\n");
      out.write("            showMsg(\"密码不能包含非法字符！\");\r\n");
      out.write("            return;\r\n");
      out.write("        }\r\n");
      out.write("        \r\n");
      out.write("\t\tif(reges.test(obj.remark)) {\r\n");
      out.write("            showMsg(\"备注不能包含非法字符！\");\r\n");
      out.write("            return;\r\n");
      out.write("        }\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tSysOperatorAction.isLoginNameExistence(obj,function(result){\r\n");
      out.write("\t\t\tif(result==false){\r\n");
      out.write("\t\t\t\tshowMsg(\"该登录名不可用!\");\r\n");
      out.write("\t\t\t\treturn;\r\n");
      out.write("\t\t\t}else{\r\n");
      out.write("\t\t\t\tSysOperatorAction.createSysOperator(obj,function(result){\r\n");
      out.write("\t\t\t\t\tif(result.resultCode==\"0\"){\r\n");
      out.write("\t\t\t\t\t\tquery();\r\n");
      out.write("\t\t\t\t//\t\tobj.unid=result.returnObject.unid;\r\n");
      out.write("\t\t\t\t//\t\t$('#SysOperatorList').datagrid('appendRow',obj);\r\n");
      out.write("\t\t\t\t\t\t$('#SysOperatorDialog').dialog('close');\r\n");
      out.write("\t\t\t\t\t}else{\r\n");
      out.write("\t\t\t\t\t\tshowMsg(\"创建时出错，可能原因为：\\n\"+result.resultMessage);\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\t\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction SysOperatorEdit(index,rowData){\r\n");
      out.write("\t\tvar rows = new Array();\r\n");
      out.write("\t\tif(null!=rowData){\r\n");
      out.write("\t\t\trows.push(rowData);\r\n");
      out.write("\t\t}else{\r\n");
      out.write("\t\t\trows=$('#SysOperatorList').datagrid('getSelections');\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tif (rows.length<=0) {\r\n");
      out.write("\t\t\tshowMsg(\"请先选择需要修改的!\");\r\n");
      out.write("\t\t\treturn;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tif (rows.length>1) {\r\n");
      out.write("\t\t\tshowMsg(\"不能同时修改多个!\");\r\n");
      out.write("\t\t\treturn;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t//初始化数据\r\n");
      out.write("\t\t$(\"#SysOperatorForm\").setJSON({SysOperatorForm:rows[0]});\r\n");
      out.write("\t\tvar cityName=$(\"#SysOperatorForm\\\\:orgUnid option:selected\").text();\r\n");
      out.write("\t\tvar countyid=$(\"#SysOperatorForm\\\\:countyCode\");\r\n");
      out.write("\t\tdwr.engine.setAsync(false);\r\n");
      out.write("\t\tRegionCfgAction.getAreasListByName(cityName,function(data){\r\n");
      out.write("\t\t\tcountyid.empty();\r\n");
      out.write("\t\t\tif(null==data || null==data.returnList)return;\r\n");
      out.write("\t\t\tcountyid.prepend(\"<option value='0'>全部</option>\");\r\n");
      out.write("\t\t\tfor (var i=0;i<data.returnList.length;i++) {\r\n");
      out.write("\t\t    countyid.append(\"<option value='\"+ data.returnList[i]['areaid']+\"'>\"+ data.returnList[i]['areas'] +\"</option>\");\r\n");
      out.write("\t\t    if(data.returnList[i]['areas']==rows[0].countyName){\r\n");
      out.write("\t\t\t\t countyid.get(0).options[i+1].selected=true;\r\n");
      out.write("\t\t\t }\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\tdwr.engine.setAsync(true);\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tselectedRoles=rows[0].roles;\r\n");
      out.write("\t\tloadSelectedRoles();\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t$('#SysOperatorDialog').dialog({\r\n");
      out.write("\t\t\ttitle:'修改',\r\n");
      out.write("\t\t\tmodal:true,\r\n");
      out.write("\t\t\tbuttons:[{\r\n");
      out.write("\t\t\t\ttext:'确定',\r\n");
      out.write("\t\t\t\ticonCls:'icon-ok',\r\n");
      out.write("\t\t\t\thandler:SysOperatorUpdate\r\n");
      out.write("\t\t\t},{\r\n");
      out.write("\t\t\t\ttext:'取消',\r\n");
      out.write("\t\t\t\thandler:function(){\r\n");
      out.write("\t\t\t\t\t$('#SysOperatorDialog').dialog('close');\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}],\r\n");
      out.write("\t\t\tclosed:false\r\n");
      out.write("\t\t});\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction loadSelectedRoles(){\r\n");
      out.write("\t\tvar roleNames=\"\",roleIds=\"\";\r\n");
      out.write("\t\t$(selectedRoles).each(function(index,obj){\r\n");
      out.write("\t\t\troleNames+=obj.name+\";\";\r\n");
      out.write("\t\t\troleIds+=obj.unid+\";\";\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\t$(\"#SysOperatorForm\\\\:sysRoles\").val(roleNames);\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction SysOperatorUpdate(){\r\n");
      out.write("\t\tvar obj=getFormObj();\r\n");
      out.write("\t\tif(!jQuery.form(\"#SysOperatorForm\").validate())return;\r\n");
      out.write("\t\tobj.roles=selectedRoles;\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t var reges=/[`~!@#$%\\^\\&\\*\\(\\)_\\+“”《》！@#￥%<>\\?:\"\\{\\},\\.\\\\\\/;'\\[\\]]/im; \r\n");
      out.write("\t\t var space= /\\s+/g;\r\n");
      out.write("        \r\n");
      out.write("        if(reges.test(obj.name)||space.test(obj.name)) {\r\n");
      out.write("            showMsg(\"姓名不能包含非法字符！\");\r\n");
      out.write("            return;\r\n");
      out.write("        }\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tif(reges.test(obj.loginName)||space.test(obj.loginName)) {\r\n");
      out.write("            showMsg(\"登录名不能包含非法字符！\");\r\n");
      out.write("            return;\r\n");
      out.write("        }\r\n");
      out.write("\t\tif(reges.test(obj.password)||space.test(obj.password)) {\r\n");
      out.write("            showMsg(\"密码不能包含非法字符！\");\r\n");
      out.write("            return;\r\n");
      out.write("        }\r\n");
      out.write("        \r\n");
      out.write("\t\tif(reges.test(obj.remark)) {\r\n");
      out.write("            showMsg(\"备注不能包含非法字符！\");\r\n");
      out.write("            return;\r\n");
      out.write("        }\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tSysOperatorAction.isLoginNameExistenceForUpd(obj,function(result){\r\n");
      out.write("\t\t\tif(result==false){\r\n");
      out.write("\t\t\t\tshowMsg(\"该登录名不可用!\");\r\n");
      out.write("\t\t\t\treturn;\r\n");
      out.write("\t\t\t}else{\r\n");
      out.write("\t\t\t\tSysOperatorAction.updateSysOperator(obj,function(result){\r\n");
      out.write("\t\t\t\t\tif(result.resultCode==\"0\"){\r\n");
      out.write("\t\t\t\t\t\t$('#SysOperatorDialog').dialog('close');\r\n");
      out.write("\t\t\t\t\t\tvar queryObj=treeSelectCach==null?queryFormCach:treeSelectCach;\r\n");
      out.write("\t\t\t\t\t\treLoadGridData(queryObj);\r\n");
      out.write("\t\t\t\t\t}else{\r\n");
      out.write("\t\t\t\t\t\tshowMsg(\"更新时出错，可能原因为：\\n\"+result.resultMessage);\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\t\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction SysOperatorDel(){\r\n");
      out.write("\t\tvar rows = $('#SysOperatorList').datagrid('getSelections');\r\n");
      out.write("\t\tif (rows.length<=0) {\r\n");
      out.write("\t\t\tshowMsg(\"请先选择需要删除的!\");\r\n");
      out.write("\t\t\treturn;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tconfirmMsg('确认需要删除这些吗?', function(isdel){\r\n");
      out.write("\t\t\tif(isdel){\r\n");
      out.write("\t\t\t\tvar objs=new Array();\r\n");
      out.write("\t\t\t\tfor(var i=0;i<rows.length;i++){\r\n");
      out.write("\t\t\t\t\tobjs.push({unid:rows[i].unid});\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\tSysOperatorAction.batchDeleteSysOperator(objs,function(result){\r\n");
      out.write("\t\t\t\t\tif(result.resultCode==\"0\"){\r\n");
      out.write("\t\t\t\t\t\tvar queryObj=treeSelectCach==null?queryFormCach:treeSelectCach;\r\n");
      out.write("\t\t\t\t\t\treLoadGridData(queryObj);\r\n");
      out.write("\t\t\t\t\t}else{\r\n");
      out.write("\t\t\t\t\t\tshowMsg(\"删除时出错，可能原因为：\\n\"+result.resultMessage);\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t}\t\t\t\r\n");
      out.write("\t\t});\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("//--------------------界面操作 end ------------------------\r\n");
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
