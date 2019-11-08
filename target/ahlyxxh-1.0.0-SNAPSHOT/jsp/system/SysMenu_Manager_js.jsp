<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<script type="text/javascript">
	var queryFormCach=null;
	var treeSelectCach=null;
	$(function(){
		//创建左边树形
		$('#type_tree').tree({
			animate:true,
			onClick:function(node){
				$('#SysMenuList').datagrid('unselectAll');
				var queryObj={
							status:$("#SysMenuQueryForm\\:status").val(),
							punid:node.id
						};
				treeSelectCach=queryObj;
				queryFormCach=null;
				reLoadGridData(queryObj);
			}
			
		});
		
		//创建列表
		$("#SysMenuList").datagrid({
			title:'菜单管理',
			idField:'unid',
			singleSelect: false,
			pagination: true,
			height:getViewportHeight()-52,
			//width:'auto',
			//fit:true,
			fitColumns: true,
			collapsible:true,
			frozenColumns:[[
			                {field:'ck',checkbox:true}
						]],
			columns:[[
				{field:'menuid',title:'菜单标识',width:100},
				{field:'name',title:'名称',width:100},
				{field:'displayName',title:'显示名称',width:100},
				{field:'url',title:'地址',width:100},
				{field:'sortNum',title:'排序号',width:100},
				{field:'status',title:'状态',width:100,formatter:function(val){
					return val==0?'启用':'禁用';
				}}
			]],
			toolbar:[{
				text:'添加',
				iconCls:'icon-add',
				handler:SysMenuAdd
			},{
				text:'修改',
				iconCls:'icon-edit',
				handler:SysMenuEdit
			},{
				text:'删除',
				iconCls:'icon-remove',
				handler:SysMenuDel
			},{
				text:'复制',
				iconCls:'exicon-page_copy',
				handler:SysMenuCopy
			}],
			onDblClickRow: function(rowIndex, rowData){
				//初始化数据
				$("#SysMenuForm").setJSON({SysMenuForm:rowData});
				var snode = $('#type_tree').tree('getSelected');
				$('#SysMenuForm\\:punid').combotree('setValue',snode==null?'':snode.id);
				$('#SysMenuDialog').dialog({
					title:'修改菜单',
					modal:true,
					buttons:[{
						text:'确定',
						iconCls:'icon-ok',
						handler:SysMenuUpdate
					},{
						text:'取消',
						handler:function(){
							$('#SysMenuDialog').dialog('close');
						}
					}],
					closed:false
				});
			}
		});
					
		//创建编辑对话框
		$('#SysMenuDialog').dialog({
			title:'新增菜单',
			modal:true,
			buttons:[{
				text:'确定',
				iconCls:'icon-ok',
				handler:function(){
					
				}
			},{
				text:'取消',
				handler:function(){
					$('#SysMenuDialog').dialog('close');
				}
			}],
			closed:true
		});

		//初始化表单元素
		initForm();
		
		//初始化树形
		initTypeTree();
	});//结束初始化函数

//--------------------初始化和公用方法 start ------------------------
	function initForm(){
		$("#btn_query").click(query);
		$("#btn_reset").click(reset);
		query();
	}

	//查询
	function query(){
		$('#SysMenuList').datagrid('unselectAll');
		var queryObj = {
			unid:$("#SysMenuQueryForm\\:unid").val(),
			menuid:$("#SysMenuQueryForm\\:menuid").val(),
			name:$("#SysMenuQueryForm\\:name").val(),
			url:$("#SysMenuQueryForm\\:url").val(),
			menuIcon:$("#SysMenuQueryForm\\:menuIcon").val(),
			desktopIcon:$("#SysMenuQueryForm\\:desktopIcon").val(),
			sortNum:$("#SysMenuQueryForm\\:sortNum").val(),
			status:$("#SysMenuQueryForm\\:status").val(),
				codeGenerator:'codeGenerator'
					};
		treeSelectCach=null;
		queryFormCach=queryObj;
		
		reLoadGridData(queryObj);
	}

	function reset(){
		$("#SysMenuQueryForm\\:unid").val('');
		$("#SysMenuQueryForm\\:menuid").val('');
		$("#SysMenuQueryForm\\:name").val('');
		$("#SysMenuQueryForm\\:url").val('');
		$("#SysMenuQueryForm\\:menuIcon").val('');
		$("#SysMenuQueryForm\\:desktopIcon").val('');
		$("#SysMenuQueryForm\\:sortNum").val('');
		$("#SysMenuQueryForm\\:status").val('');
	}
	
	//加载表格数据
	function loadData(data){
		$('#SysMenuList').datagrid('unselectAll');
		if(data!=null && data.length>0){
			$('#SysMenuList').datagrid({loadFilter:pagerFilter}).datagrid('loadData', {total:data.length,rows:data}).datagrid('getPager').pagination('select',1);
		}else{
			$('#SysMenuList').datagrid({loadFilter:pagerFilter}).datagrid('loadData',{total:0,rows:[]});
		}
	}

	

	function getFormObj(){
		var obj = $("#SysMenuForm").getJSON().SysMenuForm;
		var selectNode=$('#SysMenuForm\\:punid').combotree('tree').tree('getSelected');
		if(null!=selectNode){
			obj.punid=selectNode.id;
			obj.typeName=selectNode.text;
		}
		return obj;
	}

	function reLoadGridData(queryObj){
		SysMenuAction.getSysMenuList(queryObj,function(result){
				if(result.resultCode=="0"){
					loadData(result.returnList);
				}else{
					showMsg("加载菜单列表数据时出错，可能原因为：\n"+result.resultMessage);
				}
			});
	}

	
//--------------------初始化和公用方法 start ------------------------
//--------------------界面操作 start ------------------------
	
	function SysMenuAdd(){
		var snode = $('#type_tree').tree('getSelected');
		
		$('#SysMenuForm\\:punid').combotree('setValue',snode==null?'':snode.id);
		$('#SysMenuForm').clear();

		$('#SysMenuDialog').dialog({
			title:'新增菜单',
			modal:true,
			buttons:[{
				text:'确定',
				iconCls:'icon-ok',
				handler:SysMenuCreate
			},{
				text:'取消',
				handler:function(){
					$('#SysMenuDialog').dialog('close');
				}
			}],
			closed:false
		});
	}
	
	function SysMenuCreate(){
		var obj=getFormObj();
		if(!jQuery.form("#SysMenuForm").validate())return;
		
		 var reges=/[`~!@#\$%\^\&\*\(\)_\+“”《》！@#￥%<>\?:"\{\},\.\\\/;'\[\]]/im; 
		 
        
        if(reges.test(obj.name)) {
            showMsg("名称不能包含非法字符！");
            return;
        }
		if(reges.test(obj.displayName)) {
            showMsg("显示名称不能包含非法字符！");
            return;
        }
		
		
		SysMenuAction.createSysMenu(obj,function(result){
			if(result.resultCode=="0"){
				$('#SysMenuDialog').dialog('close');
				var queryObj=treeSelectCach==null?queryFormCach:treeSelectCach;
				initTypeTree(obj.punid);
				reLoadGridData(queryObj);
			}else{
				showMsg("创建菜单时出错，可能原因为：\n"+result.resultMessage);
			}
		});
	}
	function SysMenuCopy(){
		var rows = $('#SysMenuList').datagrid('getSelections');
		if (rows.length<=0) {
			showMsg("请先选择需要复制的菜单!");
			return;
		}
		if (rows.length>1) {
			showMsg("不能同时复制多个菜单!");
			return;
		}
		
		SysMenuAction.copySysMenu(rows[0],function(result){
			if(result.resultCode=="0"){
				$('#SysMenuList').datagrid('appendRow',result.returnObject);
			}else{
				showMsg("复制菜单时出错，可能原因为：\n"+result.resultMessage);
			}
		});
	}
	
	function SysMenuEdit(){
		var rows = $('#SysMenuList').datagrid('getSelections');
		if (rows.length<=0) {
			showMsg("请先选择需要修改的菜单!");
			return;
		}
		if (rows.length>1) {
			showMsg("不能同时修改多个菜单!");
			return;
		}
		
		//初始化数据
		$("#SysMenuForm").setJSON({SysMenuForm:rows[0]});
		var snode = $('#type_tree').tree('getSelected');
		$('#SysMenuForm\\:punid').combotree('setValue',snode==null?'':snode.id);
		
		$('#SysMenuDialog').dialog({
			title:'修改菜单',
			modal:true,
			buttons:[{
				text:'确定',
				iconCls:'icon-ok',
				handler:SysMenuUpdate
			},{
				text:'取消',
				handler:function(){
					$('#SysMenuDialog').dialog('close');
				}
			}],
			closed:false
		});
	}
	
	function SysMenuUpdate(){
		var obj=getFormObj();
		if(!jQuery.form("#SysMenuForm").validate())return;
		
		SysMenuAction.updateSysMenu(obj,function(result){
			if(result.resultCode=="0"){
				$('#SysMenuDialog').dialog('close');
				var queryObj=treeSelectCach==null?queryFormCach:treeSelectCach;
				initTypeTree(obj.punid);
				reLoadGridData(queryObj);
			}else{
				showMsg("更新菜单时出错，可能原因为：\n"+result.resultMessage);
			}
		});
	}
	
	function SysMenuDel(){
		var rows = $('#SysMenuList').datagrid('getSelections');
		if (rows.length<=0) {
			showMsg("请先选择需要删除的菜单!");
			return;
		}
		confirmMsg('确认需要删除这些菜单吗?', function(isdel){
			if(isdel){
				var punid=rows[0].punid;
				var objs=new Array();
				for(var i=0;i<rows.length;i++){
					objs.push({unid:rows[i].unid});
				}
				SysMenuAction.batchDeleteSysMenu(objs,function(result){
					if(result.resultCode=="0"){
						var queryObj=treeSelectCach==null?queryFormCach:treeSelectCach;
						reLoadGridData(queryObj);
						initTypeTree(punid);
					}else{
						showMsg("删除菜单时出错，可能原因为：\n"+result.resultMessage);
					}
				});
			}			
		});
	}
	
//--------------------界面操作 end ------------------------

function initTypeTree(defId){
		$('#type_tree').tree('reload');
		$('#SysMenuForm\\:punid').combotree('tree').tree('reload');
		$('#SysMenuForm\\:punid').combotree('tree').tree('append',{
			parent:null,
			data:[{id:'',text:'系统',selected:true}]
		});
		$('#type_tree').tree('append',{
			parent:null,
			data:[{id:'',text:'系统',selected:true}]
		});
		SysMenuAction.getAllSysMenu(function(result){
			//alert(showObj(result));
			if(result.resultCode=="0"){
				var typeDatas=result.returnList;
				for(var i=0;i<typeDatas.length;i++){
					if(typeDatas[i].punid==null || typeDatas[i].punid==""){
						var newNode={
									id:typeDatas[i].unid,
									text:typeDatas[i].name
								};
						nodeAppend(null,newNode);
						dataToTree(newNode,typeDatas);
					}
				}
				//选中默认节点：
				if(defId!=null && defId!="null" && defId!=""){
					var defNode=$('#type_tree').tree('find',defId);
					if(defNode!=null){
						$('#type_tree').tree('select',defNode.target);
						//重新加载数据
						$('#SysMenuList').datagrid('unselectAll');
						var queryObj={
									status:$("#SysMenuQueryForm\\:status").val(),
									punid:defId
								};
						treeSelectCach=queryObj;
						queryFormCach=null;
						reLoadGridData(queryObj);
					}
				}
			}else{
				showMsg("初始化树形时出错，可能原因为：\n"+result.resultMessage);
			}
		});
	}

	function dataToTree(root,result){
		for(var i=0;i<result.length;i++){
			if(result[i].punid==root.id){
				var newNode={
						id:result[i].unid,
						text:result[i].name
					};
				nodeAppend(root,newNode);
				dataToTree(newNode,result);
			}
		}
	}
	
	function nodeAppend(pnode,cnode){
		pnode=(pnode==null?null:$('#type_tree').tree('find',pnode.id));
		$('#type_tree').tree('append',{
			parent:pnode==null?null:pnode.target,
			data:[cnode]
		});
		
		var comboTreeNode=null;
		if(pnode!=null){
			comboTreeNode=$('#SysMenuForm\\:punid').combotree('tree').tree('find',pnode.id);
		}
		$('#SysMenuForm\\:punid').combotree('tree').tree('append',{
			parent:comboTreeNode==null?null:comboTreeNode.target,
			data:[cnode]
		});
		
	}
	
</script>