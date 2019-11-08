<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<script type="text/javascript">
	var queryFormCach=null;
	var treeSelectCach=null;
	$(function(){

		//创建列表
				$("#TouristResourceList").datagrid({
			title:'旅游资源管理',
			idField:'id',
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
	{field:'id',title:'ID',hidden:true},
	{field:'region',title:'景区',width:100},
	{field:'fiveRegion',title:'5A景区',width:100},
	{field:'fourRegion',title:'4A景区',width:100},
	{field:'threeRegion',title:'3A景区',width:100},
	{field:'grogshop',title:'酒店',width:100},
	{field:'fiveGrogshop',title:'5星酒店',width:100},
	{field:'fourGrogshop',title:'4星酒店',width:100},
	{field:'threeGrogshop',title:'3星酒店',width:100},
	{field:'travelAgency',title:'旅行社',width:100},
	{field:'guide',title:'导游',width:100},
	{field:'provinceName',title:'省份',width:100},
	{field:'createTime',title:'创建时间',width:100,formatter:function(date){
		return date==null?'':date.pattern("yyyy-MM-dd HH:mm:ss");
	}},
	{field:'updateTime',title:'修改时间',width:100,formatter:function(date){
		return date==null?'':date.pattern("yyyy-MM-dd HH:mm:ss");
	}},
	{field:'updateUser',title:'修改用户',width:100},
	{field:'remark',title:'备注',width:100},
	{field:'codeGenerator',title:'codeGenerator',width:0,hidden:true}
			]],
			toolbar:[{
				text:'添加',
				iconCls:'icon-add',
				handler:TouristResourceAdd
			},{
				text:'修改',
				iconCls:'icon-edit',
				handler:TouristResourceEdit
			},{
				text:'查看',
				iconCls:'icon-search',
				handler:TouristResourceView
			},{
				text:'删除',
				iconCls:'icon-remove',
				handler:TouristResourceDel
			}],
			onDblClickRow:TouristResourceEdit
		});
					
		//创建编辑对话框
		$('#TouristResourceDialog').dialog({
			title:'新增旅游资源',
			modal:true,
			buttons:[{
				text:'确定',
				iconCls:'icon-ok',
				handler:function(){
					
				}
			},{
				text:'取消',
				handler:function(){
					$('#TouristResourceDialog').dialog('close');
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
		$('#TouristResourceList').datagrid('unselectAll');
		var queryObj = {
	provinceName:$("#TouristResourceQueryForm\\:provinceName").val(),
	updateUser:$("#TouristResourceQueryForm\\:updateUser").val(),
	remark:$("#TouristResourceQueryForm\\:remark").val(),
				codeGenerator:'codeGenerator'
					};
		treeSelectCach=null;
		queryFormCach=queryObj;
		
		reLoadGridData(queryObj);
	}

	function reset(){
		$("#TouristResourceQueryForm\\:id").val('');
		$("#TouristResourceQueryForm\\:region").val('');
		$("#TouristResourceQueryForm\\:fiveRegion").val('');
		$("#TouristResourceQueryForm\\:fourRegion").val('');
		$("#TouristResourceQueryForm\\:threeRegion").val('');
		$("#TouristResourceQueryForm\\:grogshop").val('');
		$("#TouristResourceQueryForm\\:fiveGrogshop").val('');
		$("#TouristResourceQueryForm\\:fourGrogshop").val('');
		$("#TouristResourceQueryForm\\:threeGrogshop").val('');
		$("#TouristResourceQueryForm\\:travelAgency").val('');
		$("#TouristResourceQueryForm\\:guide").val('');
		$("#TouristResourceQueryForm\\:provinceName").val('');
		$("#TouristResourceQueryForm\\:createTime").val('');
		$("#TouristResourceQueryForm\\:updateTime").val('');
		$("#TouristResourceQueryForm\\:updateUser").val('');
		$("#TouristResourceQueryForm\\:remark").val('');
	}
	
	//加载表格数据
	function loadData(data){
		$('#TouristResourceList').datagrid('unselectAll');
		if(data!=null && data.length>0){
			$('#TouristResourceList').datagrid('loadData', {total:data.length,rows:data});
		}else{
			$('#TouristResourceList').datagrid('loadData',{total:0,rows:[]});
		}
	}

	

	function getFormObj(){
		var obj = $("#TouristResourceForm").getJSON().TouristResourceForm;
		return obj;
	}

	function reLoadGridData(queryObj){
		TouristResourceAction.getTouristResourceList(queryObj,function(result){
				if(result.resultCode=="0"){
					loadData(result.returnList);
				}else{
					showMsg("加载旅游资源列表数据时出错，可能原因为：\n"+result.resultMessage);
				}
			});
	}

	
//--------------------初始化和公用方法 start ------------------------
//--------------------界面操作 start ------------------------
	
	function TouristResourceAdd(){
		$('#TouristResourceForm').clear();

		$('#TouristResourceDialog').dialog({
			title:'新增旅游资源',
			modal:true,
			buttons:[{
				text:'确定',
				iconCls:'icon-ok',
				handler:TouristResourceCreate
			},{
				text:'取消',
				handler:function(){
					$('#TouristResourceDialog').dialog('close');
				}
			}],
			closed:false
		});
	}
	
	function TouristResourceCreate(){
		var obj=getFormObj();
		if(!jQuery.form("#TouristResourceForm").validate())return;
		
		TouristResourceAction.createTouristResource(obj,function(result){
			if(result.resultCode=="0"){
				$('#TouristResourceDialog').dialog('close');
				var queryObj=treeSelectCach==null?queryFormCach:treeSelectCach;
				reLoadGridData(queryObj);
			}else{
				showMsg("创建旅游资源时出错，可能原因为：\n"+result.resultMessage);
			}
		});
	}
	
	function TouristResourceEdit(index,rowData){
		var rows = new Array();
		if(null!=rowData){
			rows.push(rowData);
		}else{
			rows=$('#TouristResourceList').datagrid('getSelections');
		}
		if (rows.length<=0) {
			showMsg("请先选择需要修改的旅游资源!");
			return;
		}
		if (rows.length>1) {
			showMsg("不能同时修改多个旅游资源!");
			return;
		}
		//初始化数据
		$("#TouristResourceForm").setJSON({TouristResourceForm:rows[0]});
		
		$('#TouristResourceDialog').dialog({
			title:'修改旅游资源',
			modal:true,
			buttons:[{
				text:'确定',
				iconCls:'icon-ok',
				handler:TouristResourceUpdate
			},{
				text:'取消',
				handler:function(){
					$('#TouristResourceDialog').dialog('close');
				}
			}],
			closed:false
		});
	}
	
	function TouristResourceUpdate(){
		var obj=getFormObj();
		if(!jQuery.form("#TouristResourceForm").validate())return;
		
		TouristResourceAction.updateTouristResource(obj,function(result){
			if(result.resultCode=="0"){
				$('#TouristResourceDialog').dialog('close');
				var queryObj=treeSelectCach==null?queryFormCach:treeSelectCach;
				reLoadGridData(queryObj);
			}else{
				showMsg("更新旅游资源时出错，可能原因为：\n"+result.resultMessage);
			}
		});
	}
	
	function TouristResourceDel(){
		var rows = $('#TouristResourceList').datagrid('getSelections');
		if (rows.length<=0) {
			showMsg("请先选择需要删除的旅游资源!");
			return;
		}
		confirmMsg('确认需要删除这些旅游资源吗?', function(isdel){
			if(isdel){
				var objs=new Array();
				for(var i=0;i<rows.length;i++){
					objs.push({id:rows[i].id});
				}
				TouristResourceAction.batchDeleteTouristResource(objs,function(result){
					if(result.resultCode=="0"){
						var queryObj=treeSelectCach==null?queryFormCach:treeSelectCach;
						reLoadGridData(queryObj);
					}else{
						showMsg("删除旅游资源时出错，可能原因为：\n"+result.resultMessage);
					}
				});
			}			
		});
	}
	
	
	function TouristResourceView(index,rowData){
		$('#TouristResourceViewForm').clear();
		var rows = new Array();
		if(null!=rowData){
			rows.push(rowData);
		}else{
			rows=$('#TouristResourceList').datagrid('getSelections');
		}
		if (rows.length<=0) {
			showMsg("请先选择需要查看的旅游资源!");
			return;
		}
		if (rows.length>1) {
			showMsg("不能同时查看多个旅游资源!");
			return;
		}
		//初始化数据
		$("#TouristResourceViewForm").setJSON({TouristResourceViewForm:rows[0]});
		
		$('#TouristResourceViewDialog').dialog({
			title:'查看旅游资源',
			modal:true,
			buttons:[{
				text:'关闭',
				handler:function(){
					$('#TouristResourceViewDialog').dialog('close');
				}
			}],
			closed:false
		});
	}
	
//--------------------界面操作 end ------------------------

</script>