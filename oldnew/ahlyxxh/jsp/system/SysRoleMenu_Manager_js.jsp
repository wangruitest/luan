<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<script type="text/javascript">
	var queryFormCach=null;
	var treeSelectCach=null;
	$(function(){

		//创建列表
				$("#SysRoleMenuList").datagrid({
			title:'角色菜单管理',
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
	{field:'roleUnid',title:'角色标识',width:100},
	{field:'menuUnid',title:'菜单标识',width:100},
	{field:'codeGenerator',title:'codeGenerator',width:0,hidden:true}
			]],
			toolbar:[{
				text:'添加',
				iconCls:'icon-add',
				handler:SysRoleMenuAdd
			},{
				text:'修改',
				iconCls:'icon-edit',
				handler:SysRoleMenuEdit
			},{
				text:'删除',
				iconCls:'icon-remove',
				handler:SysRoleMenuDel
			}],
			onDblClickRow: function(rowIndex, rowData){
				//初始化数据
				$("#SysRoleMenuForm").setJSON({SysRoleMenuForm:rowData});
				
				$('#SysRoleMenuDialog').dialog({
					title:'修改角色菜单',
					modal:true,
					buttons:[{
						text:'确定',
						iconCls:'icon-ok',
						handler:SysRoleMenuUpdate
					},{
						text:'取消',
						handler:function(){
							$('#SysRoleMenuDialog').dialog('close');
						}
					}],
					closed:false
				});
			}
		});
					
		//创建编辑对话框
		$('#SysRoleMenuDialog').dialog({
			title:'新增角色菜单',
			modal:true,
			buttons:[{
				text:'确定',
				iconCls:'icon-ok',
				handler:function(){
					
				}
			},{
				text:'取消',
				handler:function(){
					$('#SysRoleMenuDialog').dialog('close');
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
		$('#SysRoleMenuList').datagrid('unselectAll');
		var queryObj = {
	unid:$("#SysRoleMenuQueryForm\\:unid").val(),
	roleUnid:$("#SysRoleMenuQueryForm\\:roleUnid").val(),
	menuUnid:$("#SysRoleMenuQueryForm\\:menuUnid").val(),
				codeGenerator:'codeGenerator'
					};
		treeSelectCach=null;
		queryFormCach=queryObj;
		
		reLoadGridData(queryObj);
	}

	function reset(){
		$("#SysRoleMenuQueryForm\\:unid").val('');
		$("#SysRoleMenuQueryForm\\:roleUnid").val('');
		$("#SysRoleMenuQueryForm\\:menuUnid").val('');
	}
	
	//加载表格数据
	function loadData(data){
		$('#SysRoleMenuList').datagrid('unselectAll');
		if(data!=null && data.length>0){
			$('#SysRoleMenuList').datagrid('loadData', {total:data.length,rows:data});
		}else{
			$('#SysRoleMenuList').datagrid('loadData',{total:0,rows:[]});
		}
	}

	

	function getFormObj(){
		var obj = $("#SysRoleMenuForm").getJSON().SysRoleMenuForm;
		return obj;
	}

	function reLoadGridData(queryObj){
		SysRoleMenuAction.getSysRoleMenuList(queryObj,function(result){
				if(result.resultCode=="0"){
					loadData(result.returnList);
				}else{
					showMsg("加载角色菜单列表数据时出错，可能原因为：\n"+result.resultMessage);
				}
			});
	}

	
//--------------------初始化和公用方法 start ------------------------
//--------------------界面操作 start ------------------------
	
	function SysRoleMenuAdd(){
		$('#SysRoleMenuForm').clear();

		$('#SysRoleMenuDialog').dialog({
			title:'新增角色菜单',
			modal:true,
			buttons:[{
				text:'确定',
				iconCls:'icon-ok',
				handler:SysRoleMenuCreate
			},{
				text:'取消',
				handler:function(){
					$('#SysRoleMenuDialog').dialog('close');
				}
			}],
			closed:false
		});
	}
	
	function SysRoleMenuCreate(){
		var obj=getFormObj();
		if(!jQuery.form("#SysRoleMenuForm").validate())return;
		
		SysRoleMenuAction.createSysRoleMenu(obj,function(result){
			if(result.resultCode=="0"){
				$('#SysRoleMenuDialog').dialog('close');
				var queryObj=treeSelectCach==null?queryFormCach:treeSelectCach;
				reLoadGridData(queryObj);
			}else{
				showMsg("创建角色菜单时出错，可能原因为：\n"+result.resultMessage);
			}
		});
	}
	
	function SysRoleMenuEdit(){
		var rows = $('#SysRoleMenuList').datagrid('getSelections');
		if (rows.length<=0) {
			showMsg("请先选择需要修改的角色菜单!");
			return;
		}
		if (rows.length>1) {
			showMsg("不能同时修改多个角色菜单!");
			return;
		}
		//初始化数据
		$("#SysRoleMenuForm").setJSON({SysRoleMenuForm:rows[0]});
		
		$('#SysRoleMenuDialog').dialog({
			title:'修改角色菜单',
			modal:true,
			buttons:[{
				text:'确定',
				iconCls:'icon-ok',
				handler:SysRoleMenuUpdate
			},{
				text:'取消',
				handler:function(){
					$('#SysRoleMenuDialog').dialog('close');
				}
			}],
			closed:false
		});
	}
	
	function SysRoleMenuUpdate(){
		var obj=getFormObj();
		if(!jQuery.form("#SysRoleMenuForm").validate())return;
		
		SysRoleMenuAction.updateSysRoleMenu(obj,function(result){
			if(result.resultCode=="0"){
				$('#SysRoleMenuDialog').dialog('close');
				var queryObj=treeSelectCach==null?queryFormCach:treeSelectCach;
				reLoadGridData(queryObj);
			}else{
				showMsg("更新角色菜单时出错，可能原因为：\n"+result.resultMessage);
			}
		});
	}
	
	function SysRoleMenuDel(){
		var rows = $('#SysRoleMenuList').datagrid('getSelections');
		if (rows.length<=0) {
			showMsg("请先选择需要删除的角色菜单!");
			return;
		}
		confirmMsg('确认需要删除这些角色菜单吗?', function(isdel){
			if(isdel){
				var objs=new Array();
				for(var i=0;i<rows.length;i++){
					objs.push({unid:rows[i].unid});
				}
				SysRoleMenuAction.batchDeleteSysRoleMenu(objs,function(result){
					if(result.resultCode=="0"){
						var queryObj=treeSelectCach==null?queryFormCach:treeSelectCach;
						reLoadGridData(queryObj);
					}else{
						showMsg("删除角色菜单时出错，可能原因为：\n"+result.resultMessage);
					}
				});
			}			
		});
	}
	
//--------------------界面操作 end ------------------------

</script>