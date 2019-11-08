<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<script type="text/javascript">
	var queryFormCach=null;
	var treeSelectCach=null;
	var selectedUsers=new Array();
	var menuTree=null;
	var regionTree=null;
	var resultparam=null;
	$(function(){
		$('#roleMenuDialog').dialog({closed:true});
		$('#regionRoleDialog').dialog({closed:true});
		//创建列表
		$("#SysRoleList").datagrid({
			title:'角色管理',
			idField:'unid',
			singleSelect: false,
			pagination: true,
			height:getViewportHeight()-50,
			//width:'auto',
			//fit:true,
			fitColumns: true,
			frozenColumns:[[
			                {field:'ck',checkbox:true}
						]],
			columns:[[
				{field:'name',title:'角色名称',width:200},
				{field:'status',title:'状态',width:100,formatter:function(val){
					return val==0?'启用':'禁用';
				}},
				{field:'remark',title:'备注',width:300}
			]],
			toolbar:[{
				text:'添加',
				iconCls:'icon-add',
				handler:SysRoleAdd
			},{
				text:'修改',
				iconCls:'icon-edit',
				handler:SysRoleEdit
			},{
				text:'删除',
				iconCls:'icon-remove',
				handler:SysRoleDel
			},{
				text:'菜单授权',
				iconCls:'icon-redo',
				handler:SysRoleRight
			}
/**			,{
				text:'景区授权',
				iconCls:'icon-redo',
				handler:RegionRoleRight
			} */
			],
			onDblClickRow: SysRoleEdit
		});
					
		//创建编辑对话框
		$('#SysRoleDialog').dialog({
			title:'新增角色',
			modal:true,
			buttons:[{
				text:'确定',
				iconCls:'icon-ok',
				handler:function(){
					
				}
			},{
				text:'取消',
				handler:function(){
					$('#SysRoleDialog').dialog('close');
				}
			}],
			closed:true
		});
		
		//创建授权对话框
		$('#roleMenuDialog').dialog({
			title:'角色授权',
			modal:true,
			buttons:[{
				text:'确定',
				iconCls:'icon-ok',
				handler:function(){
					
				}
			},{
				text:'取消',
				handler:function(){
					$('#SysRoleDialog').dialog('close');
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
		$("#btn_select_users").click(selectUsers);
		query();
	}
	
	function selectUsers(){
		var option={
			type:'01',
		    title:'选择包含的用户',
			selectedData:selectedUsers
		};
		commonSelect(option,selectUsersBack);
	}
	
	function selectUsersBack(result){
		selectedUsers=result;
		loadSelectedUsers();
	}

	//查询
	function query(){
		$('#SysRoleList').datagrid('unselectAll');
		var queryObj = {
	unid:$("#SysRoleQueryForm\\:unid").val(),
	name:$("#SysRoleQueryForm\\:name").val(),
	sysUnid:$("#SysRoleQueryForm\\:sysUnid").val(),
	status:$("#SysRoleQueryForm\\:status").val(),
	remark:$("#SysRoleQueryForm\\:remark").val(),
	orgUnid:$("#SysRoleQueryForm\\:orgUnid").val(),
				codeGenerator:'codeGenerator'
					};
		treeSelectCach=null;
		queryFormCach=queryObj;
		
		reLoadGridData(queryObj);
	}

	function reset(){
		$("#SysRoleQueryForm\\:name").val('');
		//document.getElementById("SysRoleQueryForm:status").value="";
		$("#SysRoleQueryForm\\:status").val('0');
		$("#SysRoleQueryForm\\:remark").val('');
	}
	
	//加载表格数据
	function loadData(data){
		$('#SysRoleList').datagrid('unselectAll');
		if(data!=null && data.length>0){
			$('#SysRoleList').datagrid({loadFilter:pagerFilter}).datagrid('loadData', {total:data.length,rows:data}).datagrid('getPager').pagination('select',1);
		}else{
			$('#SysRoleList').datagrid({loadFilter:pagerFilter}).datagrid('loadData',{total:0,rows:[]});
		}
	}

	

	function getFormObj(){
		var obj = $("#SysRoleForm").getJSON().SysRoleForm;
		return obj;
	}

	function reLoadGridData(queryObj){
		SysRoleAction.getSysRoleList(queryObj,function(result){
				if(result.resultCode=="0"){
					loadData(result.returnList);
				}else{
					showMsg("加载角色列表数据时出错，可能原因为：\n"+result.resultMessage);
				}
			});
	}

	
//--------------------初始化和公用方法 start ------------------------
//--------------------界面操作 start ------------------------
	
	function SysRoleAdd(){
		selectedUsers=new Array();
		$('#SysRoleForm').clear();

		$('#SysRoleDialog').dialog({
			title:'新增角色',
			modal:true,
			buttons:[{
				text:'确定',
				iconCls:'icon-ok',
				handler:SysRoleCreate
			},{
				text:'取消',
				handler:function(){
					$('#SysRoleDialog').dialog('close');
				}
			}],
			closed:false
		});
	}
	
	function SysRoleCreate(){
		if(!jQuery.form("#SysRoleForm").validate())return;
		var obj=getFormObj();
		
		var pattern = new RegExp("[`~!@#$^&*()=|{}':;',\\[\\].<>/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？]");
        if(pattern.test(obj.name)) {
            showMsg("角色名称不能包含非法字符！");
            return;
        }
		
		
		obj.sysOperators=selectedUsers;
		SysRoleAction.createSysRole(obj,function(result){
			if(result.resultCode=="0"){
				//obj.unid=result.returnObject.unid;
				//$('#SysRoleList').datagrid('appendRow',obj);
				//$('#SysRoleDialog').dialog('close');
				$('#SysRoleDialog').dialog('close');
				var queryObj=treeSelectCach==null?queryFormCach:treeSelectCach;
				reLoadGridData(queryObj);
			}else{
				showMsg("创建角色时出错，可能原因为：\n"+result.resultMessage);
			}
		});
	}
	
	function SysRoleEdit(index,rowData){
		var rows = new Array();
		if(null!=rowData){
			rows.push(rowData);
		}else{
			rows=$('#SysRoleList').datagrid('getSelections');
		}
		if (rows.length<=0) {
			showMsg("请先选择需要修改的角色!");
			return;
		}
		if (rows.length>1) {
			showMsg("不能同时修改多个角色!");
			return;
		}
		//初始化数据
		$("#SysRoleForm").setJSON({SysRoleForm:rows[0]});
		selectedUsers=rows[0].sysOperators;
		loadSelectedUsers();
		$('#SysRoleDialog').dialog({
			title:'修改角色',
			modal:true,
			buttons:[{
				text:'确定',
				iconCls:'icon-ok',
				handler:SysRoleUpdate
			},{
				text:'取消',
				handler:function(){
					$('#SysRoleDialog').dialog('close');
				}
			}],
			closed:false
		});
	}
	
	function loadSelectedUsers(){
		var userNames="",userIds="";
		$(selectedUsers).each(function(index,obj){
			userNames+=obj.name+";";
			userIds+=obj.unid+";";
		});
		$("#SysRoleForm\\:sysOperators").val(userNames);
	}
	
	function SysRoleUpdate(){
		if(!jQuery.form("#SysRoleForm").validate())return;
		var obj=getFormObj();
		
		var pattern = new RegExp("[`~!@#$^&*()=|{}':;',\\[\\].<>/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？]");
        if(pattern.test(obj.name)) {
            showMsg("角色名称不能包含非法字符！");
            return;
        }
		
		obj.sysOperators=selectedUsers;
		SysRoleAction.updateSysRole(obj,function(result){
			if(result.resultCode=="0"){
				$('#SysRoleDialog').dialog('close');
				var queryObj=treeSelectCach==null?queryFormCach:treeSelectCach;
				reLoadGridData(queryObj);
			}else{
				showMsg("更新角色时出错，可能原因为：\n"+result.resultMessage);
			}
		});
	}
	
	function SysRoleDel(){
		var rows = $('#SysRoleList').datagrid('getSelections');
		if (rows.length<=0) {
			showMsg("请先选择需要删除的角色!");
			return;
		}
		confirmMsg('确认需要删除这些角色吗?', function(isdel){
			if(isdel){
				var objs=new Array();
				for(var i=0;i<rows.length;i++){
					objs.push({unid:rows[i].unid});
				}
				SysRoleAction.batchDeleteSysRole(objs,function(result){
					if(result.resultCode=="0"){
						var queryObj=treeSelectCach==null?queryFormCach:treeSelectCach;
						reLoadGridData(queryObj);
					}else{
						showMsg("删除角色时出错，可能原因为：\n"+result.resultMessage);
					}
				});
			}			
		});
	}
	
	function SysRoleRight(){
		DWREngine.setAsync(false);
		var rows = $('#SysRoleList').datagrid('getSelections');
		if (rows.length<=0) {
			showMsg("请先选择需要授权的角色!");
			return;
		}
		var selectedMenuUnids="";
		if(rows.length==1){
			var menus=rows[0].sysMenus;
			$(menus).each(function(index,obj){
				selectedMenuUnids+=obj.unid+";";
			});
		}
		var roleIds="";
		$(rows).each(function(index,obj){
			roleIds+=obj.unid+",";
		});
		if(roleIds!="")roleIds=roleIds.substring(0,roleIds.length-1);
		
		if(null==menuTree){
			//创建树形
			menuTree=$('#menu_tree').tree({
				animate:true,
				checkbox:true
			});
		}
		$('#menu_tree').tree("reload");
		//加载菜单数据
		SysMenuAction.getAllSysMenu(function(result){
			if(result.resultCode=="0"){
				var typeDatas=result.returnList;
				for(var i=0;i<typeDatas.length;i++){
					if(typeDatas[i].punid==null){
						var newNode={
									id:typeDatas[i].unid,
									text:typeDatas[i].name
								};
						nodeAppend(null,newNode);
						dataToTree(newNode,typeDatas);
					}
				}
				
			}else{
				showMsg("初始化树形时出错，可能原因为：\n"+result.resultMessage);
			}
		});
		
		if(rows.length==1){
			var menus=rows[0].sysMenus;
			$(menus).each(function(index,obj){
				var node = $('#menu_tree').tree('find', obj.unid);
				if(null!=node){
					if($('#menu_tree').tree('isLeaf', node.target)){
						$('#menu_tree').tree('check', node.target);
					}
				}
			});
		}
		DWREngine.setAsync(true);
		$('#roleMenuDialog').dialog({
			title:'角色授权',
			modal:true,
			buttons:[{
				text:'确定',
				iconCls:'icon-ok',
				handler:function(){
					var nodes = $('#menu_tree').tree('getChecked');
					var menuIds="";
					$(nodes).each(function(index,obj){
						var parent=$('#menu_tree').tree('getParent', obj.target);
						if(null!=parent)menuIds+=parent.id+",";
						menuIds+=obj.id+",";

					});
					if(menuIds!="")menuIds=menuIds.substring(0,menuIds.length-1);
					if(rows.length>1){
						confirmMsg('您选择了多个角色同时授权，系统将以当前选择的菜单对所选角色进行授权或覆盖，是否继续?', function(flag){
							if(flag)roleMenuRight(roleIds,menuIds);
						});
					}else{
						roleMenuRight(roleIds,menuIds);
					}
				}
			},{
				text:'取消',
				handler:function(){
					$('#roleMenuDialog').dialog('close');
				}
			}],
			closed:false
		});
	}
	
	function roleMenuRight(roleIds,menuIds){
		SysRoleAction.roleMenuRight(roleIds,menuIds,function(result){
			if(result.resultCode=="0"){
				showMsg("授权成功！");
				var queryObj=treeSelectCach;
				reLoadGridData(queryObj);
				$('#roleMenuDialog').dialog('close');
			}else{
				showMsg("为角色授权时出错，可能原因为：\n"+result.resultMessage);
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
		pnode=(pnode==null?null:$('#menu_tree').tree('find',pnode.id));
		$('#menu_tree').tree('append',{
			parent:pnode==null?null:pnode.target,
			data:[cnode]
		});
	}
	
//--------------------界面操作 end ------------------------

</script>