<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<script type="text/javascript">
	var queryFormCach=null;
	var treeSelectCach=null;
	$(function(){

		//创建列表
				$("#MonitorList").datagrid({
			title:'系统日志管理',
			idField:'id',
			singleSelect: false,
			pagination: true,
			height:getViewportHeight()-67,
			//width:'auto',
			//fit:true,
			fitColumns: true,
			columns:[[
	{field:'hostip',title:'主机IP',width:50},
	{field:'hostname',title:'主机名',width:50},
	{field:'cpuidle',title:'CPU空闲率(%)',width:75},
	{field:'memtotal',title:'内存总量(K)',width:70},
	{field:'memfree',title:'可用内存(K)',width:70},
	{field:'alldiskinfo',title:'所有的磁盘信息',width:230,formatter:function(value){
		return "<div style='white-space:normal'>"+value+"</div>";
	}},
	{field:'maxuseddisk',title:'存储率最大硬盘信息(K)',width:230,formatter:function(value){
		return "<div style='white-space:normal'>"+value+"</div>";
	}},
	{field:'allioinfo',title:'所有硬盘IO信息',width:90,formatter:function(value){
		return "<div style='white-space:normal'>"+value+"</div>";
	}},
	{field:'maxusedio',title:'IO率最大硬盘信息',width:90,formatter:function(value){
		return "<div style='white-space:normal'>"+value+"</div>";
	}},
	{field:'updatetime',title:'数据获取时间',width:80}
			]]
		});
					
		//创建编辑对话框
		$('#MonitorDialog').dialog({
			title:'新增系统日志',
			modal:true,
			buttons:[{
				text:'确定',
				iconCls:'icon-ok',
				handler:function(){
					
				}
			},{
				text:'取消',
				handler:function(){
					$('#MonitorDialog').dialog('close');
				}
			}],
			closed:true
		});

		 var monitorPager = $("#MonitorList").datagrid("getPager");
		 if(monitorPager)
		 {
		    $(monitorPager).pagination({
		        onSelectPage:function(pageNumber,pageSize){
		        	reLoadGridData(queryFormCach,pageSize,pageNumber);
		        }
		    });
		 }
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
		$('#MonitorList').datagrid('unselectAll');
		var queryObj = {
	hostip:$("#MonitorQueryForm\\:hostip").val(),
	hostname:$("#MonitorQueryForm\\:hostname").val(),
	updatetimeFrom:$("#MonitorQueryForm\\:updatetimeFrom").val(),
	updatetimeEnd:$("#MonitorQueryForm\\:updatetimeEnd").val()
					};
		treeSelectCach=null;
		queryFormCach=queryObj;
		
		reLoadGridData(queryObj,10,1);
	}

	function reset(){
		$("#MonitorQueryForm\\:id").val('');
		$("#MonitorQueryForm\\:hostip").val('');
		$("#MonitorQueryForm\\:hostname").val('');
		$("#MonitorQueryForm\\:cpuidle").val('');
		$("#MonitorQueryForm\\:memtotal").val('');
		$("#MonitorQueryForm\\:memfree").val('');
		$("#MonitorQueryForm\\:alldiskinfo").val('');
		$("#MonitorQueryForm\\:maxuseddisk").val('');
		$("#MonitorQueryForm\\:allioinfo").val('');
		$("#MonitorQueryForm\\:maxusedio").val('');
		$("#MonitorQueryForm\\:updatetime").val('');
		$("#MonitorQueryForm\\:netkb").val('');
	}
	
	//加载表格数据
	function loadData(data){
		$('#MonitorList').datagrid('unselectAll');
		if(data!=null && data.length>0){
			$('#MonitorList').datagrid({loadFilter:pagerFilter}).datagrid('loadData', {total:data.length,rows:data});
		}else{
			$('#MonitorList').datagrid({loadFilter:pagerFilter}).datagrid('loadData',{total:0,rows:[]});
		}
	}

	

	function getFormObj(){
		var obj = $("#MonitorForm").getJSON().MonitorForm;
		return obj;
	}

	/* function reLoadGridData(queryObj){
		MonitorAction.getMonitorList(queryObj,function(result){
				if(result.resultCode=="0"){
					loadData(result.returnList);
				}else{
					showMsg("加载系统日志列表数据时出错，可能原因为：\n"+result.resultMessage);
				}
			});
	} */
	function reLoadGridData(queryObj,pageSize,currentPage){
		queryObj.page = {pageSize:pageSize,currentPage:currentPage};
		MonitorAction.pageQueryMonitor(queryObj,function(result){
				if(result.resultCode=="0"){
					var data=result.returnObject;
					var content={total:data.page.totalItems, rows:data.content};
					$('#MonitorList').datagrid('loadData', content);
				}else{
					showMsg("加载系统日志列表数据时出错，可能原因为：\n"+result.resultMessage);
				}
			});
	}
	
//--------------------初始化和公用方法 start ------------------------
//--------------------界面操作 start ------------------------
	
	function MonitorAdd(){
		$('#MonitorForm').clear();

		$('#MonitorDialog').dialog({
			title:'新增系统日志',
			modal:true,
			buttons:[{
				text:'确定',
				iconCls:'icon-ok',
				handler:MonitorCreate
			},{
				text:'取消',
				handler:function(){
					$('#MonitorDialog').dialog('close');
				}
			}],
			closed:false
		});
	}
	
	function MonitorCreate(){
		var obj=getFormObj();
		if(!jQuery.form("#MonitorForm").validate())return;
		
		MonitorAction.createMonitor(obj,function(result){
			if(result.resultCode=="0"){
				$('#MonitorDialog').dialog('close');
				var queryObj=treeSelectCach==null?queryFormCach:treeSelectCach;
				reLoadGridData(queryObj,10,1);
			}else{
				showMsg("创建系统日志时出错，可能原因为：\n"+result.resultMessage);
			}
		});
	}
	
	function MonitorEdit(index,rowData){
		var rows = new Array();
		if(null!=rowData){
			rows.push(rowData);
		}else{
			rows=$('#MonitorList').datagrid('getSelections');
		}
		if (rows.length<=0) {
			showMsg("请先选择需要修改的系统日志!");
			return;
		}
		if (rows.length>1) {
			showMsg("不能同时修改多个系统日志!");
			return;
		}
		//初始化数据
		$("#MonitorForm").setJSON({MonitorForm:rows[0]});
		
		$('#MonitorDialog').dialog({
			title:'修改系统日志',
			modal:true,
			buttons:[{
				text:'确定',
				iconCls:'icon-ok',
				handler:MonitorUpdate
			},{
				text:'取消',
				handler:function(){
					$('#MonitorDialog').dialog('close');
				}
			}],
			closed:false
		});
	}
	
	function MonitorUpdate(){
		var obj=getFormObj();
		if(!jQuery.form("#MonitorForm").validate())return;
		
		MonitorAction.updateMonitor(obj,function(result){
			if(result.resultCode=="0"){
				$('#MonitorDialog').dialog('close');
				var queryObj=treeSelectCach==null?queryFormCach:treeSelectCach;
				reLoadGridData(queryObj,10,1);
			}else{
				showMsg("更新系统日志时出错，可能原因为：\n"+result.resultMessage);
			}
		});
	}
	
	function MonitorDel(){
		var rows = $('#MonitorList').datagrid('getSelections');
		if (rows.length<=0) {
			showMsg("请先选择需要删除的系统日志!");
			return;
		}
		confirmMsg('确认需要删除这些系统日志吗?', function(isdel){
			if(isdel){
				var objs=new Array();
				for(var i=0;i<rows.length;i++){
					objs.push({id:rows[i].id});
				}
				MonitorAction.batchDeleteMonitor(objs,function(result){
					if(result.resultCode=="0"){
						var queryObj=treeSelectCach==null?queryFormCach:treeSelectCach;
						reLoadGridData(queryObj,10,1);
					}else{
						showMsg("删除系统日志时出错，可能原因为：\n"+result.resultMessage);
					}
				});
			}			
		});
	}
	
//--------------------界面操作 end ------------------------

</script>