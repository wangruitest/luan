<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<script type="text/javascript">
	var queryFormCach=null;
	var treeSelectCach=null;
	$(function(){

		//创建列表
				$("#AlarmstarffList").datagrid({
			title:'告警人员管理',
			idField:'id',
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
	{field:'id',title:'id',width:20,hidden:true},
	{field:'name',title:'姓名',width:50},
	{field:'phoneNum',title:'手机号码',width:60},	
	{field:'systemAlarmtype',title:'系统告警短信',width:50,formatter:function(val){
		return val==0?'关闭':'开启';
	}},
	{field:'businessAlarmtype',title:'业务告警短信',width:50,formatter:function(val){
		return val==0?'关闭':'开启';
	}},
	{field:'smstestAlarmtype',title:'通道测试短信',width:50,formatter:function(val){
		return val==0?'关闭':'开启';
	}},
	{field:'updatetime',title:'修改时间：',width:80,formatter:function(date){
		return date==null?'':date.pattern("yyyy-MM-dd HH:mm:ss");
	}},
	{field:'remark',title:'备注',width:90},
	{field:'codeGenerator',title:'fqwork',width:0,hidden:true}
			]],
			toolbar:[{
				text:'添加',
				iconCls:'icon-add',
				handler:AlarmstarffAdd
			},{
				text:'修改',
				iconCls:'icon-edit',
				handler:AlarmstarffEdit
			},{
				text:'删除',
				iconCls:'icon-remove',
				handler:AlarmstarffDel
			}],
			onDblClickRow: function(rowIndex, rowData){
				//初始化数据
				$("#AlarmstarffForm").setJSON({AlarmstarffForm:rowData});
				
				$('#AlarmstarffDialog').dialog({
					title:'告警人员',
					modal:true,
					buttons:[{
						text:'确定',
						iconCls:'icon-ok',
						handler:AlarmstarffUpdate
					},{
						text:'取消',
						handler:function(){
							$('#AlarmstarffDialog').dialog('close');
						}
					}],
					closed:false
				});
			}
		});
					
		//创建编辑对话框
		$('#AlarmstarffDialog').dialog({
			title:'新增告警人员',
			modal:true,
			buttons:[{
				text:'确定',
				iconCls:'icon-ok',
				handler:function(){
					
				}
			},{
				text:'取消',
				handler:function(){
					$('#AlarmstarffDialog').dialog('close');
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
		$('#AlarmstarffList').datagrid('unselectAll');
		var queryObj = {
	name:$("#AlarmstarffQueryForm\\:name").val(),
	phoneNum:$("#AlarmstarffQueryForm\\:phoneNum").val(),
	remark:$("#AlarmstarffQueryForm\\:remark").val(),
	systemAlarmtype:$("#AlarmstarffQueryForm\\:systemAlarmtype").val(),
	businessAlarmtype:$("#AlarmstarffQueryForm\\:businessAlarmtype").val(),
	smstestAlarmtype:$("#AlarmstarffQueryForm\\:smstestAlarmtype").val(),
	updatetime:$("#AlarmstarffQueryForm\\:updatetime").val(),
	id:$("#AlarmstarffQueryForm\\:id").val(),
				codeGenerator:'fqwork'
					};
		treeSelectCach=null;
		queryFormCach=queryObj;
		
		reLoadGridData(queryObj);
	}

	function reset(){
		$("#AlarmstarffQueryForm\\:name").val('');
		$("#AlarmstarffQueryForm\\:phoneNum").val('');
		$("#AlarmstarffQueryForm\\:remark").val('');
		$("#AlarmstarffQueryForm\\:systemAlarmtype").val('');
		$("#AlarmstarffQueryForm\\:businessAlarmtype").val('');
		$("#AlarmstarffQueryForm\\:smstestAlarmtype").val('');
		$("#AlarmstarffQueryForm\\:updatetime").val('');
		$("#AlarmstarffQueryForm\\:id").val('');
	}
	
	//加载表格数据
	function loadData(data){
		$('#AlarmstarffList').datagrid('unselectAll');
		if(data!=null && data.length>0){
			$('#AlarmstarffList').datagrid({loadFilter:pagerFilter}).datagrid('loadData', {total:data.length,rows:data});
		}else{
			$('#AlarmstarffList').datagrid({loadFilter:pagerFilter}).datagrid('loadData',{total:0,rows:[]});
		}
	}

	

	function getFormObj(){
		var obj = $("#AlarmstarffForm").getJSON().AlarmstarffForm;
		return obj;
	}

	function reLoadGridData(queryObj){
		AlarmstarffAction.getAlarmstarffList(queryObj,function(result){
				if(result.resultCode=="0"){
					loadData(result.returnList);
				}else{
					showMsg("加载告警人员列表数据时出错，可能原因为：\n"+result.resultMessage);
				}
			});
	}

	
//--------------------初始化和公用方法 start ------------------------
//--------------------界面操作 start ------------------------
	
	function AlarmstarffAdd(){
		$('#AlarmstarffForm').clear();

		$('#AlarmstarffDialog').dialog({
			title:'新增告警人员',
			modal:true,
			buttons:[{
				text:'确定',
				iconCls:'icon-ok',
				handler:AlarmstarffCreate
			},{
				text:'取消',
				handler:function(){
					$('#AlarmstarffDialog').dialog('close');
				}
			}],
			closed:false
		});
	}
	
	function AlarmstarffCreate(){
		var obj=getFormObj();
		if(!jQuery.form("#AlarmstarffForm").validate())return;
		
		AlarmstarffAction.isPhomeNumExistence(obj,function(result){
			if(result==false){
				showMsg("该手机号码已存在!");
				return;
			}else{
				AlarmstarffAction.createAlarmstarff(obj,function(result){
					if(result.resultCode=="0"){
						//obj=result.returnObject;
						//$('#AlarmstarffList').datagrid('appendRow',obj);
						query();
						$('#AlarmstarffDialog').dialog('close');
					}else{
						showMsg("创建告警人员时出错，可能原因为：\n"+result.resultMessage);
					}
				});
			}
		});	
	}
	
	function AlarmstarffEdit(){
		var rows = $('#AlarmstarffList').datagrid('getSelections');
		if (rows.length<=0) {
			showMsg("请先选择需要修改的告警人员!");
			return;
		}
		if (rows.length>1) {
			showMsg("不能同时修改多个告警人员!");
			return;
		}
		//初始化数据
		$("#AlarmstarffForm").setJSON({AlarmstarffForm:rows[0]});
		
		$('#AlarmstarffDialog').dialog({
			title:'修改告警人员',
			modal:true,
			buttons:[{
				text:'确定',
				iconCls:'icon-ok',
				handler:AlarmstarffUpdate
			},{
				text:'取消',
				handler:function(){
					$('#AlarmstarffDialog').dialog('close');
				}
			}],
			closed:false
		});
	}
	
	function AlarmstarffUpdate(){
		var obj=getFormObj();
		if(!jQuery.form("#AlarmstarffForm").validate())return;
		
		AlarmstarffAction.isPhomeNumExistenceForEdit(obj,function(result){
			if(result==false){
				showMsg("该手机号码已存在!");
				return;
			}else{
				AlarmstarffAction.updateAlarmstarff(obj,function(result){
					if(result.resultCode=="0"){
						$('#AlarmstarffDialog').dialog('close');
						var queryObj=treeSelectCach==null?queryFormCach:treeSelectCach;
						reLoadGridData(queryObj);
					}else{
						showMsg("更新告警人员时出错，可能原因为：\n"+result.resultMessage);
					}
				});
			}
		});		
	}
	
	function AlarmstarffDel(){
		var rows = $('#AlarmstarffList').datagrid('getSelections');
		if (rows.length<=0) {
			showMsg("请先选择需要删除的告警人员!");
			return;
		}
		confirmMsg('确认需要删除这些告警人员吗?', function(isdel){
			if(isdel){
				var objs=new Array();
				for(var i=0;i<rows.length;i++){
					objs.push({id:rows[i].id});
				}
				AlarmstarffAction.batchDeleteAlarmstarff(objs,function(result){
					if(result.resultCode=="0"){
						var queryObj=treeSelectCach==null?queryFormCach:treeSelectCach;
						reLoadGridData(queryObj);
					}else{
						showMsg("删除告警人员时出错，可能原因为：\n"+result.resultMessage);
					}
				});
			}			
		});
	}
	
//--------------------界面操作 end ------------------------

</script>