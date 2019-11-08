<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<script type="text/javascript">
	var queryFormCach=null;
	var treeSelectCach=null;
	$(function(){

		//创建列表
				$("#SysLoginLogList").datagrid({
			title:'登录日志表管理',
			idField:'unid',
			singleSelect: false,
			pagination: true,
			height:getViewportHeight()-67,
			//width:'auto',
			//fit:true,
			fitColumns: true,
			columns:[[
	{field:'unid',title:'unid',width:100,hidden:true},
	{field:'userUnid',title:'登录用户unid',width:90,hidden:true},
	{field:'loginName',title:'登录名',width:90},
	{field:'name',title:'显示名称',width:90},
	{field:'operatorType',title:'用户类型',width:60,formatter:function(result){
		if (result==1){return 'ADC用户';}else{return '本地用户';}
	}},
	{field:'ipAddress',title:'登录/注销用户IP',width:80},
	{field:'browserInfo',title:'浏览器信息',width:150},
	{field:'loginTime',title:'登录/注销时间',width:150},
	{field:'loginType',title:'操作类型',width:60,formatter:function(result){
		if (result==0) return '登录';
		if (result==1) return '注销'; 
	}},
	{field:'failText',title:'登录失败原因',width:150},
	{field:'sucOrFail',title:'登录结果',width:60,formatter:function(result){
		if (result==0) return '成功';
		if (result==1) return '失败'; 
	}},
	{field:'codeGenerator',title:'codeGenerator',width:0,hidden:true}
			]]
		});

		//初始化表单元素
		initForm();
		
	});//结束初始化函数

//--------------------初始化和公用方法 start ------------------------
	function initForm(){
		$("#btn_query").click(query);
		$("#btn_reset").click(reset);
		query();
	}

	//查询
	function query(){
		$('#SysLoginLogList').datagrid('unselectAll');
		var queryObj = {
	loginName:$("#SysLoginLogQueryForm\\:loginName").val(),
	name:$("#SysLoginLogQueryForm\\:name").val(),
	operatorType:$("#SysLoginLogQueryForm\\:operatorType").val(),
	loginType:$("#SysLoginLogQueryForm\\:loginType").val(),
	failText:$("#SysLoginLogQueryForm\\:failText").val(),
	sucOrFail:$("#SysLoginLogQueryForm\\:sucOrFail").val(),
	starttime:$("#SysLoginLogQueryForm\\:starttime").val(),
	endtime:$("#SysLoginLogQueryForm\\:endtime").val(),
				codeGenerator:'codeGenerator'
					};
		treeSelectCach=null;
		queryFormCach=queryObj;
		
		reLoadGridData(queryObj);
	}

	function reset(){
		$("#SysLoginLogQueryForm\\:unid").val('');
		$("#SysLoginLogQueryForm\\:userUnid").val('');
		$("#SysLoginLogQueryForm\\:loginName").val('');
		$("#SysLoginLogQueryForm\\:name").val('');
		$("#SysLoginLogQueryForm\\:operatorType").val('');
		$("#SysLoginLogQueryForm\\:ipAddress").val('');
		$("#SysLoginLogQueryForm\\:browserInfo").val('');
		$("#SysLoginLogQueryForm\\:loginTime").val('');
		$("#SysLoginLogQueryForm\\:loginType").val('');
		$("#SysLoginLogQueryForm\\:loginText").val('');
		$("#SysLoginLogQueryForm\\:failText").val('');
		$("#SysLoginLogQueryForm\\:sucOrFail").val('');
		$("#SysLoginLogQueryForm\\:starttime").val('');
		$("#SysLoginLogQueryForm\\:endtime").val('');
	}
	
	//加载表格数据
	function loadData(data){
		$('#SysLoginLogList').datagrid('unselectAll');
		if(data!=null && data.length>0){
			$('#SysLoginLogList').datagrid({loadFilter:pagerFilter}).datagrid('loadData', {total:data.length,rows:data});
		}else{
			$('#SysLoginLogList').datagrid({loadFilter:pagerFilter}).datagrid('loadData',{total:0,rows:[]});
		}
	}

	

	function getFormObj(){
		var obj = $("#SysLoginLogForm").getJSON().SysLoginLogForm;
		return obj;
	}

	function reLoadGridData(queryObj){
		SysLoginLogAction.getSysLoginLogList(queryObj,function(result){
				if(result.resultCode=="0"){
					loadData(result.returnList);
				}else{
					showMsg("加载登录日志表列表数据时出错，可能原因为：\n"+result.resultMessage);
				}
			});
	}

	
//--------------------初始化和公用方法 start ------------------------
//--------------------界面操作 start ------------------------
	
	
	
//--------------------界面操作 end ------------------------

</script>