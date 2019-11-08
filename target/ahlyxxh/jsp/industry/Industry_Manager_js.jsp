<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<script type="text/javascript">
	var queryFormCach=null;
	var treeSelectCach=null;
	$(function(){

		//创建列表
				$("#IndustryList").datagrid({
			title:'行业类型表管理',
			idField:'industryid',
			singleSelect: false,
			pagination: true,
			height:getViewportHeight()-67,
			//width:'auto',
			//fit:true,
			fitColumns: true,
			frozenColumns:[[
			                {field:'ck',checkbox:true}
						]],
			columns:[[
	{field:'industryid',title:'',width:100,hidden:true},
	{field:'typename',title:'行业类型名',width:100},
	{field:'codeGenerator',title:'codeGenerator',width:0,hidden:true}
			]],
			toolbar:[{
				text:'添加',
				iconCls:'icon-add',
				handler:IndustryAdd
			},{
				text:'修改',
				iconCls:'icon-edit',
				handler:IndustryEdit
			},{
				text:'删除',
				iconCls:'icon-remove',
				handler:IndustryDel
			}],
			onDblClickRow: function(rowIndex, rowData){
				//初始化数据
				$("#IndustryForm").setJSON({IndustryForm:rowData});
				
				$('#IndustryDialog').dialog({
					title:'修改行业类型表',
					modal:true,
					buttons:[{
						text:'确定',
						iconCls:'icon-ok',
						handler:IndustryUpdate
					},{
						text:'取消',
						handler:function(){
							$('#IndustryDialog').dialog('close');
						}
					}],
					closed:false
				});
			}
		});
					
		//创建编辑对话框
		$('#IndustryDialog').dialog({
			title:'新增行业类型表',
			modal:true,
			buttons:[{
				text:'确定',
				iconCls:'icon-ok',
				handler:function(){
					
				}
			},{
				text:'取消',
				handler:function(){
					$('#IndustryDialog').dialog('close');
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
		$('#IndustryList').datagrid('unselectAll');
		var queryObj = {
		industryid:$("#IndustryQueryForm\\:industryid").val(),
	typename:$("#IndustryQueryForm\\:typename").val(),
				codeGenerator:'codeGenerator'
					};
		treeSelectCach=null;
		queryFormCach=queryObj;
		
		reLoadGridData(queryObj);
	}

	function reset(){
		$("#IndustryQueryForm\\:industryid").val('');
		$("#IndustryQueryForm\\:typename").val('');
	}
	
	//加载表格数据
	function loadData(data){
		$('#IndustryList').datagrid('unselectAll');
		if(data!=null && data.length>0){
			$('#IndustryList').datagrid({loadFilter:pagerFilter}).datagrid('loadData', {total:data.length,rows:data});
		}else{
			$('#IndustryList').datagrid({loadFilter:pagerFilter}).datagrid('loadData',{total:0,rows:[]});
		}
	}

	

	function getFormObj(){
		var obj = $("#IndustryForm").getJSON().IndustryForm;
		return obj;
	}

	function reLoadGridData(queryObj){
		IndustryAction.getIndustryList(queryObj,function(result){
				if(result.resultCode=="0"){
					loadData(result.returnList);
				}else{
					showMsg("加载行业类型表列表数据时出错，可能原因为：\n"+result.resultMessage);
				}
			});
	}

	
//--------------------初始化和公用方法 start ------------------------
//--------------------界面操作 start ------------------------
	
	function IndustryAdd(){
		$('#IndustryForm').clear();

		$('#IndustryDialog').dialog({
			title:'新增行业类型表',
			modal:true,
			buttons:[{
				text:'确定',
				iconCls:'icon-ok',
				handler:IndustryCreate
			},{
				text:'取消',
				handler:function(){
					$('#IndustryDialog').dialog('close');
				}
			}],
			closed:false
		});
	}
	
	function IndustryCreate(){
		var obj=getFormObj();
		if(!jQuery.form("#IndustryForm").validate())return;
		//判断重名
		IndustryAction.queryByInsertIsExist(obj,function(result){
			if(result==false){
				showMsg("存在重复行业类型名称");
				return;
			}else{
				IndustryAction.createIndustry(obj,function(result){
					if(result.resultCode=="0"){
						//obj.industryid=result.returnObject.industryid;
						//$('#IndustryList').datagrid('appendRow',obj);
						query();
						$('#IndustryDialog').dialog('close');
					}else{
						showMsg("创建行业类型表时出错，可能原因为：\n"+result.resultMessage);
					}
				});
			}
		});
	}
	
	function IndustryEdit(){
		var rows = $('#IndustryList').datagrid('getSelections');
		if (rows.length<=0) {
			showMsg("请先选择需要修改的行业类型表!");
			return;
		}
		if (rows.length>1) {
			showMsg("不能同时修改多个行业类型表!");
			return;
		}
		//初始化数据
		$("#IndustryForm").setJSON({IndustryForm:rows[0]});
		
		$('#IndustryDialog').dialog({
			title:'修改行业类型表',
			modal:true,
			buttons:[{
				text:'确定',
				iconCls:'icon-ok',
				handler:IndustryUpdate
			},{
				text:'取消',
				handler:function(){
					$('#IndustryDialog').dialog('close');
				}
			}],
			closed:false
		});
	}
	
	function IndustryUpdate(){
		var obj=getFormObj();
		if(!jQuery.form("#IndustryForm").validate())return;
		//判断重名
		IndustryAction.queryByUpdateIsExist(obj,function(result){
			if(result==false){
				showMsg("存在重复行业类型名称");
				return;
			}else{
				IndustryAction.updateIndustry(obj,function(result){
					if(result.resultCode=="0"){
						$('#IndustryDialog').dialog('close');
						var queryObj=treeSelectCach==null?queryFormCach:treeSelectCach;
						reLoadGridData(queryObj);
					}else{
						showMsg("更新行业类型表时出错，可能原因为：\n"+result.resultMessage);
					}
				});
			}
		});
	}
	
	function IndustryDel(){
		var rows = $('#IndustryList').datagrid('getSelections');
		if (rows.length<=0) {
			showMsg("请先选择需要删除的行业类型表!");
			return;
		}
		confirmMsg('确认需要删除这些行业类型表吗?', function(isdel){
			if(isdel){
				var objs=new Array();
				for(var i=0;i<rows.length;i++){
					objs.push({industryid:rows[i].industryid});
				}
				IndustryAction.batchDeleteIndustry(objs,function(result){
					if(result.resultCode=="0"){
						var queryObj=treeSelectCach==null?queryFormCach:treeSelectCach;
						reLoadGridData(queryObj);
					}else{
						showMsg("删除行业类型表时出错，可能原因为：\n"+result.resultMessage);
					}
				});
			}			
		});
	}
	
//--------------------界面操作 end ------------------------

</script>