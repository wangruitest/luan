<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<script type="text/javascript">
	var queryFormCach=null;
	var treeSelectCach=null;
	$(function(){

		//创建列表
				$("#NoticeCfgList").datagrid({
			title:'公告表管理',
			idField:'id',
			singleSelect : false,
            pagination : true,
            height : getViewportHeight()-50,
            fitColumns : true,
			frozenColumns:[[
			                {field:'ck',checkbox:true}
						]],
			columns:[[
//	{field:'id',title:'id',width:100},
	{field:'newsTitle',title:'公告标题',width:130},	
	{field:'newsContent',title:'公告内容',width:130},
	{field:'newsTime',title:'公告发布时间',width:50,formatter:function(date){
		return date==null?'':date.pattern("yyyy-MM-dd HH:mm:ss");
	}},
	{field:'codeGenerator',title:'codeGenerator',width:0,hidden:true}
			]],
			toolbar:[{
				text:'添加',
				iconCls:'icon-add',
				handler:NoticeCfgAdd
			},{
				text:'修改',
				iconCls:'icon-edit',
				handler:NoticeCfgEdit
			},{
				text:'删除',
				iconCls:'icon-remove',
				handler:NoticeCfgDel
			}],
			onDblClickRow:NoticeCfgEdit
		});
					
		//创建编辑对话框
		$('#NoticeCfgDialog').dialog({
			title:'新增公告表',
			modal:true,
			buttons:[{
				text:'确定',
				iconCls:'icon-ok',
				handler:function(){
					
				}
			},{
				text:'取消',
				handler:function(){
					$('#NoticeCfgDialog').dialog('close');
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
		$('#NoticeCfgList').datagrid('unselectAll');
		var queryObj = {
	id:$("#NoticeCfgQueryForm\\:id").val(),
	newsTitle:$("#NoticeCfgQueryForm\\:newsTitle").val(),
	newsTime:$("#NoticeCfgQueryForm\\:newsTime").val(),
	newsContent:$("#NoticeCfgQueryForm\\:newsContent").val(),
	edituser:$("#NoticeCfgQueryForm\\:edituser").val(),
	userid:$("#NoticeCfgQueryForm\\:userid").val(),
	updatetime:$("#NoticeCfgQueryForm\\:updatetime").val(),
				codeGenerator:'codeGenerator'
					};
		treeSelectCach=null;
		queryFormCach=queryObj;
		
		reLoadGridData(queryObj);
	}

	function reset(){
		$("#NoticeCfgQueryForm\\:id").val('');
		$("#NoticeCfgQueryForm\\:newsTitle").val('');
		$("#NoticeCfgQueryForm\\:newsTime").val('');
		$("#NoticeCfgQueryForm\\:newsContent").val('');
		$("#NoticeCfgQueryForm\\:edituser").val('');
		$("#NoticeCfgQueryForm\\:userid").val('');
		$("#NoticeCfgQueryForm\\:updatetime").val('');
	}
	
	//加载表格数据
	function loadData(data){
		$('#NoticeCfgList').datagrid('unselectAll');
		if(data!=null && data.length>0){
			$('#NoticeCfgList').datagrid({loadFilter:pagerFilter}).datagrid('loadData', {total:data.length,rows:data}).datagrid('getPager').pagination('select',1);
		}else{
			$('#NoticeCfgList').datagrid({loadFilter:pagerFilter}).datagrid('loadData',{total:0,rows:[]});
		}
	}

	

	function getFormObj(){
		var obj = $("#NoticeCfgForm").getJSON().NoticeCfgForm;
		return obj;
	}

	function reLoadGridData(queryObj){
		NoticeCfgAction.getNoticeCfgList(queryObj,function(result){
				if(result.resultCode=="0"){
					loadData(result.returnList);
				}else{
					showMsg("加载公告表列表数据时出错，可能原因为：\n"+result.resultMessage);
				}
			});
	}

	
//--------------------初始化和公用方法 start ------------------------
//--------------------界面操作 start ------------------------
	
	function NoticeCfgAdd(){
		$('#NoticeCfgForm').clear();

		$('#NoticeCfgDialog').dialog({
			title:'新增公告表',
			modal:true,
			buttons:[{
				text:'确定',
				iconCls:'icon-ok',
				handler:NoticeCfgCreate
			},{
				text:'取消',
				handler:function(){
					$('#NoticeCfgDialog').dialog('close');
				}
			}],
			closed:false
		});
	}
	
	function NoticeCfgCreate(){
		var obj=getFormObj();
		if(!jQuery.form("#NoticeCfgForm").validate())return;
		
		NoticeCfgAction.createNoticeCfg(obj,function(result){
			if(result.resultCode=="0"){
				query();
//				obj.id=result.returnObject.id;
//				$('#NoticeCfgList').datagrid('appendRow',obj);
				$('#NoticeCfgDialog').dialog('close');
			}else{
				showMsg("创建公告表时出错，可能原因为：\n"+result.resultMessage);
			}
		});
	}
	
	function NoticeCfgEdit(index,rowData){
		var rows = new Array();
		if(null!=rowData){
			rows.push(rowData);
		}else{
			rows=$('#NoticeCfgList').datagrid('getSelections');
		}
		if (rows.length<=0) {
			showMsg("请先选择需要修改的公告表!");
			return;
		}
		if (rows.length>1) {
			showMsg("不能同时修改多个公告表!");
			return;
		}
		//初始化数据
		$("#NoticeCfgForm").setJSON({NoticeCfgForm:rows[0]});
		
		$('#NoticeCfgDialog').dialog({
			title:'修改公告表',
			modal:true,
			buttons:[{
				text:'确定',
				iconCls:'icon-ok',
				handler:NoticeCfgUpdate
			},{
				text:'取消',
				handler:function(){
					$('#NoticeCfgDialog').dialog('close');
				}
			}],
			closed:false
		});
	}
	
	function NoticeCfgUpdate(){
		var obj=getFormObj();
		if(!jQuery.form("#NoticeCfgForm").validate())return;
		
		NoticeCfgAction.updateNoticeCfg(obj,function(result){
			if(result.resultCode=="0"){
				$('#NoticeCfgDialog').dialog('close');
				var queryObj=treeSelectCach==null?queryFormCach:treeSelectCach;
				reLoadGridData(queryObj);
			}else{
				showMsg("更新公告表时出错，可能原因为：\n"+result.resultMessage);
			}
		});
	}
	
	function NoticeCfgDel(){
		var rows = $('#NoticeCfgList').datagrid('getSelections');
		if (rows.length<=0) {
			showMsg("请先选择需要删除的公告表!");
			return;
		}
		confirmMsg('确认需要删除这些公告表吗?', function(isdel){
			if(isdel){
				var objs=new Array();
				for(var i=0;i<rows.length;i++){
					objs.push({id:rows[i].id});
				}
				NoticeCfgAction.batchDeleteNoticeCfg(objs,function(result){
					if(result.resultCode=="0"){
						var queryObj=treeSelectCach==null?queryFormCach:treeSelectCach;
						reLoadGridData(queryObj);
					}else{
						showMsg("删除公告表时出错，可能原因为：\n"+result.resultMessage);
					}
				});
			}			
		});
	}
	
//--------------------界面操作 end ------------------------

</script>