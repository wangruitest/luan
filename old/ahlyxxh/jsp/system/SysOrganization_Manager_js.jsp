<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<script type="text/javascript">
	var queryFormCach=null;
	var treeSelectCach=null;
	$(function(){

		//创建列表
				$("#SysOrganizationList").datagrid({
			title:'组织管理',
			idField:'unid',
			singleSelect: false,
			pagination: false,
			height:'auto',
			//width:'auto',
			fit:true,
			fitColumns: true,
			frozenColumns:[[
			                {field:'ck',checkbox:true}
						]],
			columns:[[
	{field:'unid',title:'标识',width:100},
	{field:'code',title:'组织编号',width:100},
	{field:'name',title:'名称',width:100},
	{field:'parentUnid',title:'父级标识',width:100},
	{field:'codeGenerator',title:'codeGenerator',width:0,hidden:true}
			]],
			toolbar:[{
				text:'添加',
				iconCls:'icon-add',
				handler:SysOrganizationAdd
			},{
				text:'修改',
				iconCls:'icon-edit',
				handler:SysOrganizationEdit
			},{
				text:'删除',
				iconCls:'icon-remove',
				handler:SysOrganizationDel
			}],
			onDblClickRow:SysOrganizationEdit
		});
					
		//创建编辑对话框
		$('#SysOrganizationDialog').dialog({
			title:'新增组织',
			modal:true,
			buttons:[{
				text:'确定',
				iconCls:'icon-ok',
				handler:function(){
					
				}
			},{
				text:'取消',
				handler:function(){
					$('#SysOrganizationDialog').dialog('close');
				}
			}],
			closed:true
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
		$('#SysOrganizationList').datagrid('unselectAll');
		var queryObj = {
	unid:$("#SysOrganizationQueryForm\\:unid").val(),
	code:$("#SysOrganizationQueryForm\\:code").val(),
	name:$("#SysOrganizationQueryForm\\:name").val(),
	parentUnid:$("#SysOrganizationQueryForm\\:parentUnid").val(),
				codeGenerator:'codeGenerator'
					};
		treeSelectCach=null;
		queryFormCach=queryObj;
		
		reLoadGridData(queryObj);
	}

	function reset(){
		$("#SysOrganizationQueryForm\\:unid").val('');
		$("#SysOrganizationQueryForm\\:code").val('');
		$("#SysOrganizationQueryForm\\:name").val('');
		$("#SysOrganizationQueryForm\\:parentUnid").val('');
	}
	
	//加载表格数据
	function loadData(data){
		$('#SysOrganizationList').datagrid('unselectAll');
		if(data!=null && data.length>0){
			$('#SysOrganizationList').datagrid('loadData', {total:data.length,rows:data});
		}else{
			$('#SysOrganizationList').datagrid('loadData',{total:0,rows:[]});
		}
	}

	

	function getFormObj(){
		var obj = $("#SysOrganizationForm").getJSON().SysOrganizationForm;
		return obj;
	}

	function reLoadGridData(queryObj){
		SysOrganizationAction.getSysOrganizationList(queryObj,function(result){
				if(result.resultCode=="0"){
					loadData(result.returnList);
				}else{
					showMsg("加载组织列表数据时出错，可能原因为：\n"+result.resultMessage);
				}
			});
	}

	
//--------------------初始化和公用方法 start ------------------------
//--------------------界面操作 start ------------------------
	
	function SysOrganizationAdd(){
		$('#SysOrganizationForm').clear();

		$('#SysOrganizationDialog').dialog({
			title:'新增组织',
			modal:true,
			buttons:[{
				text:'确定',
				iconCls:'icon-ok',
				handler:SysOrganizationCreate
			},{
				text:'取消',
				handler:function(){
					$('#SysOrganizationDialog').dialog('close');
				}
			}],
			closed:false
		});
	}
	
	function SysOrganizationCreate(){
		var obj=getFormObj();
		if(!jQuery.form("#SysOrganizationForm").validate())return;
		
		SysOrganizationAction.createSysOrganization(obj,function(result){
			if(result.resultCode=="0"){
				$('#SysOrganizationDialog').dialog('close');
				var queryObj=treeSelectCach==null?queryFormCach:treeSelectCach;
				reLoadGridData(queryObj);
			}else{
				showMsg("创建组织时出错，可能原因为：\n"+result.resultMessage);
			}
		});
	}
	
	function SysOrganizationEdit(index,rowData){
		var rows = new Array();
		if(null!=rowData){
			rows.push(rowData);
		}else{
			rows=$('#SysOrganizationList').datagrid('getSelections');
		}
		if (rows.length<=0) {
			showMsg("请先选择需要修改的组织!");
			return;
		}
		if (rows.length>1) {
			showMsg("不能同时修改多个组织!");
			return;
		}
		//初始化数据
		$("#SysOrganizationForm").setJSON({SysOrganizationForm:rows[0]});
		
		$('#SysOrganizationDialog').dialog({
			title:'修改组织',
			modal:true,
			buttons:[{
				text:'确定',
				iconCls:'icon-ok',
				handler:SysOrganizationUpdate
			},{
				text:'取消',
				handler:function(){
					$('#SysOrganizationDialog').dialog('close');
				}
			}],
			closed:false
		});
	}
	
	function SysOrganizationUpdate(){
		var obj=getFormObj();
		if(!jQuery.form("#SysOrganizationForm").validate())return;
		
		SysOrganizationAction.updateSysOrganization(obj,function(result){
			if(result.resultCode=="0"){
				$('#SysOrganizationDialog').dialog('close');
				var queryObj=treeSelectCach==null?queryFormCach:treeSelectCach;
				reLoadGridData(queryObj);
			}else{
				showMsg("更新组织时出错，可能原因为：\n"+result.resultMessage);
			}
		});
	}
	
	function SysOrganizationDel(){
		var rows = $('#SysOrganizationList').datagrid('getSelections');
		if (rows.length<=0) {
			showMsg("请先选择需要删除的组织!");
			return;
		}
		confirmMsg('确认需要删除这些组织吗?', function(isdel){
			if(isdel){
				var objs=new Array();
				for(var i=0;i<rows.length;i++){
					objs.push({unid:rows[i].unid});
				}
				SysOrganizationAction.batchDeleteSysOrganization(objs,function(result){
					if(result.resultCode=="0"){
						var queryObj=treeSelectCach==null?queryFormCach:treeSelectCach;
						reLoadGridData(queryObj);
					}else{
						showMsg("删除组织时出错，可能原因为：\n"+result.resultMessage);
					}
				});
			}			
		});
	}
	
//--------------------界面操作 end ------------------------

</script>