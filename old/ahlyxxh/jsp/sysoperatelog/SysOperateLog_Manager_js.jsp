<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<script type="text/javascript">
	var queryFormCach=null;
	var treeSelectCach=null;
	$(function(){

		//创建列表
				$("#SysOperateLogList").datagrid({
			title:'操作日志管理',
			idField:'unid',
			singleSelect: false,
			pagination: true,
			height:getViewportHeight()-67,
			//width:'auto',
			//fit:true,
			fitColumns: true,
			frozenColumns:[[
			                {field:'ck',checkbox:false}
						]],
			columns:[[
	{field:'operateTarget',title:'操作对象',width:100},
	{field:'operateTargetValue',title:'操作对象名称',width:100},
	{field:'operateAction',title:'操作动作',width:100},
	{field:'operateContent',title:'操作内容',width:100},
	{field:'operateTime',title:'操作时间',width:100,formatter:function(date){
		return date==null?'':date.pattern("yyyy-MM-dd hh:mm:ss:S");
	}},
	{field:'operateName',title:'操作用户名',width:100},
	{field:'operateLoginName',title:'操作用户登录名',width:100},
	{field:'operateCityName',title:'操作城市',width:100},
	{field:'codeGenerator',title:'codeGenerator',width:0,hidden:true}
			]]
		});
					
	 var cellCfgPager = $("#SysOperateLogList").datagrid("getPager");
	 if(cellCfgPager)
	 {
	    $(cellCfgPager).pagination({
	        onSelectPage:function(pageNumber,pageSize){
	        	reLoadGridData(queryFormCach,pageSize,pageNumber);
	        }
	    });
	 }
		
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
		$('#SysOperateLogList').datagrid('unselectAll');
		var queryObj = {
	operateAction:$("#SysOperateLogQueryForm\\:operateAction").val(),
	startTime:$("#SysOperateLogQueryForm\\:startTime").val(),
	endTime:$("#SysOperateLogQueryForm\\:endTime").val(),
	operateLoginName:$("#SysOperateLogQueryForm\\:operateLoginName").val(),
	operateCityCode:$("#SysOperateLogQueryForm\\:operateCityCode").val(),
				codeGenerator:'codeGenerator'
					};
		treeSelectCach=null;
		queryFormCach=queryObj;
		
		reLoadGridData(queryObj,10,1);
	}

	function reset(){
		$("#SysOperateLogQueryForm\\:operateAction").val('');
		$("#SysOperateLogQueryForm\\:startTime").val('');
		$("#SysOperateLogQueryForm\\:endTime").val('');
		$("#SysOperateLogQueryForm\\:operateLoginName").val('');
		$("#SysOperateLogQueryForm\\:operateCityCode").val('');
	}
	
	//加载表格数据
	function loadData(data){
		$('#SysOperateLogList').datagrid('unselectAll');
		if(data!=null && data.length>0){
			$('#SysOperateLogList').datagrid('loadData', data);
		}else{
			$('#SysOperateLogList').datagrid('loadData',{total:0,rows:[]});
		}
	}

	function getFormObj(){
		var obj = $("#SysOperateLogForm").getJSON().SysOperateLogForm;
		return obj;
	}

	function reLoadGridData(queryObj,pageSize,currentPage){
		queryObj.page = {pageSize:pageSize,currentPage:currentPage};
		SysOperateLogAction.pageQuerySysOperateLog(queryObj,function(result){
				if(result.resultCode=="0"){
					var data=result.returnObject;
					var content={total:data.page.totalItems, rows:data.content};
					$('#SysOperateLogList').datagrid('loadData', content);
				}else{
					showMsg("加载列表数据时出错，可能原因为：\n"+result.resultMessage);
				}
			});
	}
	
</script>