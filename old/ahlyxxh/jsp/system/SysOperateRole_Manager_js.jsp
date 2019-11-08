<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<script type="text/javascript">
	var queryFormCach=null;
	var treeSelectCach=null;
	$(function(){

		//创建列表
				$("#SysOperateRoleList").datagrid({
			title:'用户角色管理',
			idField:'unid',
			singleSelect: false,
			pagination: false,
			height:getViewportHeight()-50,
			fitColumns: true,
			frozenColumns:[[
			                {field:'ck',checkbox:true}
						]],
			columns:[[
	{field:'unid',title:'标识',width:100},
	{field:'operateUnid',title:'用户标识',width:100},
	{field:'roleUnid',title:'角色标识',width:100},
	{field:'codeGenerator',title:'codeGenerator',width:0,hidden:true}
			]],
			toolbar:[{
				text:'添加',
				iconCls:'icon-add',
				handler:SysOperateRoleAdd
			},{
				text:'修改',
				iconCls:'icon-edit',
				handler:SysOperateRoleEdit
			},{
				text:'删除',
				iconCls:'icon-remove',
				handler:SysOperateRoleDel
			}],
			onDblClickRow: function(rowIndex, rowData){
				//初始化数据
				$("#SysOperateRoleForm").setJSON({SysOperateRoleForm:rowData});
				
				$('#SysOperateRoleDialog').dialog({
					title:'修改用户角色',
					modal:true,
					buttons:[{
						text:'确定',
						iconCls:'icon-ok',
						handler:SysOperateRoleUpdate
					},{
						text:'取消',
						handler:function(){
							$('#SysOperateRoleDialog').dialog('close');
						}
					}],
					closed:false
				});
			}
		});
					
		//创建编辑对话框
		$('#SysOperateRoleDialog').dialog({
			title:'新增用户角色',
			modal:true,
			buttons:[{
				text:'确定',
				iconCls:'icon-ok',
				handler:function(){
					
				}
			},{
				text:'取消',
				handler:function(){
					$('#SysOperateRoleDialog').dialog('close');
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
		$('#SysOperateRoleList').datagrid('unselectAll');
		var queryObj = {
	unid:$("#SysOperateRoleQueryForm\\:unid").val(),
	operateUnid:$("#SysOperateRoleQueryForm\\:operateUnid").val(),
	roleUnid:$("#SysOperateRoleQueryForm\\:roleUnid").val(),
				codeGenerator:'codeGenerator'
					};
		treeSelectCach=null;
		queryFormCach=queryObj;
		
		reLoadGridData(queryObj);
	}

	function reset(){
		$("#SysOperateRoleQueryForm\\:unid").val('');
		$("#SysOperateRoleQueryForm\\:operateUnid").val('');
		$("#SysOperateRoleQueryForm\\:roleUnid").val('');
	}
	
	//加载表格数据
	function loadData(data){
		$('#SysOperateRoleList').datagrid('unselectAll');
		if(data!=null && data.length>0){
			$('#SysOperateRoleList').datagrid('loadData', {total:data.length,rows:data});
		}else{
			$('#SysOperateRoleList').datagrid('loadData',{total:0,rows:[]});
		}
	}

	

	function getFormObj(){
		var obj = $("#SysOperateRoleForm").getJSON().SysOperateRoleForm;
		return obj;
	}

	function reLoadGridData(queryObj){
		SysOperateRoleAction.getSysOperateRoleList(queryObj,function(result){
				if(result.resultCode=="0"){
					loadData(result.returnList);
				}else{
					showMsg("加载用户角色列表数据时出错，可能原因为：\n"+result.resultMessage);
				}
			});
	}

	
//--------------------初始化和公用方法 start ------------------------
//--------------------界面操作 start ------------------------
	
	function SysOperateRoleAdd(){
		$('#SysOperateRoleForm').clear();

		$('#SysOperateRoleDialog').dialog({
			title:'新增用户角色',
			modal:true,
			buttons:[{
				text:'确定',
				iconCls:'icon-ok',
				handler:SysOperateRoleCreate
			},{
				text:'取消',
				handler:function(){
					$('#SysOperateRoleDialog').dialog('close');
				}
			}],
			closed:false
		});
	}
	
	function SysOperateRoleCreate(){
		var obj=getFormObj();
		if(!jQuery.form("#SysOperateRoleForm").validate())return;
		
		SysOperateRoleAction.createSysOperateRole(obj,function(result){
			if(result.resultCode=="0"){
				query();
				//obj.unid=result.returnObject.unid;
				//$('#SysOperateRoleList').datagrid('appendRow',obj);
				$('#SysOperateRoleDialog').dialog('close');
			}else{
				showMsg("创建用户角色时出错，可能原因为：\n"+result.resultMessage);
			}
		});
	}
	
	function SysOperateRoleEdit(){
		var rows = $('#SysOperateRoleList').datagrid('getSelections');
		if (rows.length<=0) {
			showMsg("请先选择需要修改的用户角色!");
			return;
		}
		if (rows.length>1) {
			showMsg("不能同时修改多个用户角色!");
			return;
		}
		//初始化数据
		$("#SysOperateRoleForm").setJSON({SysOperateRoleForm:rows[0]});
		
		$('#SysOperateRoleDialog').dialog({
			title:'修改用户角色',
			modal:true,
			buttons:[{
				text:'确定',
				iconCls:'icon-ok',
				handler:SysOperateRoleUpdate
			},{
				text:'取消',
				handler:function(){
					$('#SysOperateRoleDialog').dialog('close');
				}
			}],
			closed:false
		});
	}
	
	function SysOperateRoleUpdate(){
		var obj=getFormObj();
		if(!jQuery.form("#SysOperateRoleForm").validate())return;
		
		SysOperateRoleAction.updateSysOperateRole(obj,function(result){
			if(result.resultCode=="0"){
				$('#SysOperateRoleDialog').dialog('close');
				var queryObj=treeSelectCach==null?queryFormCach:treeSelectCach;
				reLoadGridData(queryObj);
			}else{
				showMsg("更新用户角色时出错，可能原因为：\n"+result.resultMessage);
			}
		});
	}
	
	function SysOperateRoleDel(){
		var rows = $('#SysOperateRoleList').datagrid('getSelections');
		if (rows.length<=0) {
			showMsg("请先选择需要删除的用户角色!");
			return;
		}
		confirmMsg('确认需要删除这些用户角色吗?', function(isdel){
			if(isdel){
				var objs=new Array();
				for(var i=0;i<rows.length;i++){
					objs.push({unid:rows[i].unid});
				}
				SysOperateRoleAction.batchDeleteSysOperateRole(objs,function(result){
					if(result.resultCode=="0"){
						var queryObj=treeSelectCach==null?queryFormCach:treeSelectCach;
						reLoadGridData(queryObj);
					}else{
						showMsg("删除用户角色时出错，可能原因为：\n"+result.resultMessage);
					}
				});
			}			
		});
	}
	
//--------------------界面操作 end ------------------------

</script>