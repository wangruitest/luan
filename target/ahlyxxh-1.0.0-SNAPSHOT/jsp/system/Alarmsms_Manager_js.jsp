<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<script type="text/javascript">
	var queryFormCach=null;
	var treeSelectCach=null;
	$(function(){

		//创建列表
				$("#AlarmsmsList").datagrid({
			title:'告警信息管理',
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
	{field:'id',title:'ID',width:100,hidden:true},
	{field:'phoneNum',title:'电话号码',width:75},
	{field:'smstype',title:'短信类型',width:60,formatter:function(result){
		if (result==1) return '系统告警';
		if (result==2) return '业务告警'; 
		if (result==3) return '测试短信'; 
	}},
	{field:'smscontent',title:'短信内容',width:345,formatter:function(result){
		return "<div style='word-wrap:break-word'>"+result+"</div>";
	}},
	{field:'updatetime',title:'数据插入时间',width:80,formatter:function(date){
		return date==null?'':date.pattern("yyyy-MM-dd HH:mm:ss");
	}},
	{field:'firstsmsdate',title:'最早发送短信时间',width:100,formatter:function(date){
		return date==null?'':date.pattern("yyyy-MM-dd HH:mm:ss");
	}},
	{field:'lastsmsdate',title:'最后发送短信时间',width:100,formatter:function(date){
		return date==null?'':date.pattern("yyyy-MM-dd HH:mm:ss");
	}},
	{field:'smscount',title:'发送短信次数',width:80},
	{field:'smsresultcode',title:'短信发送结果',width:80,formatter:function(result){
		if (result=="-1") return "取消发送";
		if (result=="0") return "发送中";
		if (result=="1") return "发送成功";
		if (result=="2") return "等待发送";
		return "发送失败";
	}},
	{field:'remark',title:' 备注',width:80},
	{field:'codeGenerator',title:'fqwork',width:0,hidden:true}
			]],
			toolbar:[{
				text:'新增短信',
				iconCls:'icon-add',
				handler:AlarmsmsAdd
			},{
				text:'批量取消',
				iconCls:'icon-remove',
				handler:AlarmsmsSelectCancel
			},{
				text:'全部取消',
				iconCls:'icon-remove',
				handler:AlarmsmsAllCancel
			},{
				text:'导出excel',
				iconCls:'icon-print',
				handler:btn_import_excel
			}],
			onDblClickRow: function(rowIndex, rowData){
				return;
				//初始化数据
				$("#AlarmsmsForm").setJSON({AlarmsmsForm:rowData});
				
				$('#AlarmsmsDialog').dialog({
					title:'修改',
					modal:true,
					buttons:[{
						text:'确定',
						iconCls:'icon-ok',
						handler:AlarmsmsUpdate
					},{
						text:'取消',
						handler:function(){
							$('#AlarmsmsDialog').dialog('close');
						}
					}],
					closed:false
				});
			}
		});
					
		//创建编辑对话框
		$('#AlarmsmsDialog').dialog({
			title:'新增',
			modal:true,
			buttons:[{
				text:'确定',
				iconCls:'icon-ok',
				handler:function(){
					
				}
			},{
				text:'取消',
				handler:function(){
					$('#AlarmsmsDialog').dialog('close');
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
		$('#AlarmsmsList').datagrid('unselectAll');
		var queryObj = {
	id:$("#AlarmsmsQueryForm\\:id").val(),
	phoneNum:$("#AlarmsmsQueryForm\\:phoneNum").val(),
	areaCode:$("#AlarmsmsQueryForm\\:areaCode").val(),
	updatetime:$("#AlarmsmsQueryForm\\:updatetime").val(),
	smstype:$("#AlarmsmsQueryForm\\:smstype").val(),
	smscontent:$("#AlarmsmsQueryForm\\:smscontent").val(),
	firstsmsdate:$("#AlarmsmsQueryForm\\:firstsmsdate").val(),
	lastsmsdate:$("#AlarmsmsQueryForm\\:lastsmsdate").val(),
	smscount:$("#AlarmsmsQueryForm\\:smscount").val(),
	smsresultcode:$("#AlarmsmsQueryForm\\:smsresultcode").val(),
	remark:$("#AlarmsmsQueryForm\\:remark").val(),
				codeGenerator:'fqwork'
					};
		treeSelectCach=null;
		queryFormCach=queryObj;
		
		reLoadGridData(queryObj);
	}

	function reset(){
		$("#AlarmsmsQueryForm\\:id").val('');
		$("#AlarmsmsQueryForm\\:phoneNum").val('');
		$("#AlarmsmsQueryForm\\:areaCode").val('');
		$("#AlarmsmsQueryForm\\:updatetime").val('');
		$("#AlarmsmsQueryForm\\:smstype").val('');
		$("#AlarmsmsQueryForm\\:smscontent").val('');
		$("#AlarmsmsQueryForm\\:firstsmsdate").val('');
		$("#AlarmsmsQueryForm\\:lastsmsdate").val('');
		$("#AlarmsmsQueryForm\\:smscount").val('');
		$("#AlarmsmsQueryForm\\:smsresultcode").val('');
		$("#AlarmsmsQueryForm\\:remark").val('');
	}
	
	//加载表格数据
	function loadData(data){
		$('#AlarmsmsList').datagrid('unselectAll');
		if(data!=null && data.length>0){
			$('#AlarmsmsList').datagrid({loadFilter:pagerFilter}).datagrid('loadData', {total:data.length,rows:data});
		}else{
			$('#AlarmsmsList').datagrid({loadFilter:pagerFilter}).datagrid('loadData',{total:0,rows:[]});
		}
	}

	

	function getFormObj(){
		var obj = $("#AlarmsmsForm").getJSON().AlarmsmsForm;
		return obj;
	}

	function reLoadGridData(queryObj){
		AlarmsmsAction.getAlarmsmsList(queryObj,function(result){
				if(result.resultCode=="0"){
					loadData(result.returnList);
				}else{
					showMsg("加载列表数据时出错，可能原因为：\n"+result.resultMessage);
				}
			});
	}

	
//--------------------初始化和公用方法 start ------------------------
//--------------------界面操作 start ------------------------
	
	function AlarmsmsAdd(){
		$('#AlarmsmsForm').clear();
		$('#AlarmsmsForm\\:smstype').val(3);
		$('#AlarmsmsForm\\:smscount').val(0);
		$('#AlarmsmsForm\\:smsresultcode').val(2);
		$('#AlarmsmsDialog').dialog({
			title:'新增',
			modal:true,
			buttons:[{
				text:'确定',
				iconCls:'icon-ok',
				handler:AlarmsmsCreate
			},{
				text:'取消',
				handler:function(){
					$('#AlarmsmsDialog').dialog('close');
				}
			}],
			closed:false
		});
	}
	
	function AlarmsmsCreate(){
		var obj=getFormObj();
		if(!jQuery.form("#AlarmsmsForm").validate())return;
		
		AlarmsmsAction.createAlarmsms(obj,function(result){
			if(result.resultCode=="0"){
				//$('#AlarmsmsList').datagrid('appendRow',result.returnObject);
				query();
				$('#AlarmsmsDialog').dialog('close');
			}else{
				showMsg("创建时出错，可能原因为：\n"+result.resultMessage);
			}
		});
	}
	
	function AlarmsmsEdit(){
		var rows = $('#AlarmsmsList').datagrid('getSelections');
		if (rows.length<=0) {
			showMsg("请先选择需要修改的!");
			return;
		}
		if (rows.length>1) {
			showMsg("不能同时修改多个!");
			return;
		}
		//初始化数据
		$("#AlarmsmsForm").setJSON({AlarmsmsForm:rows[0]});
		
		$('#AlarmsmsDialog').dialog({
			title:'修改',
			modal:true,
			buttons:[{
				text:'确定',
				iconCls:'icon-ok',
				handler:AlarmsmsUpdate
			},{
				text:'取消',
				handler:function(){
					$('#AlarmsmsDialog').dialog('close');
				}
			}],
			closed:false
		});
	}
	
	function AlarmsmsUpdate(){
		var obj=getFormObj();
		if(!jQuery.form("#AlarmsmsForm").validate())return;
		
		AlarmsmsAction.updateAlarmsms(obj,function(result){
			if(result.resultCode=="0"){
				$('#AlarmsmsDialog').dialog('close');
				var queryObj=treeSelectCach==null?queryFormCach:treeSelectCach;
				reLoadGridData(queryObj);
			}else{
				showMsg("更新时出错，可能原因为：\n"+result.resultMessage);
			}
		});
	}
	
	function AlarmsmsSelectCancel(){
		var rows = $('#AlarmsmsList').datagrid('getSelections');
		if (rows.length<=0) {
			showMsg("请先选择需要取消的短信!");
			return;
		}
		confirmMsg('确认需要取消这些短信吗?', function(isdel){
			if(isdel){
				var objs=new Array();
				for(var i=0;i<rows.length;i++){
					objs.push({id:rows[i].id});
				}
				AlarmsmsAction.updateAlarmsms(objs,function(result){
					if(result.resultCode=="0"){
						query();
					}else{
						showMsg("删除时出错，可能原因为：\n"+result.resultMessage);
					}
				});
			}			
		});
	}
	function AlarmsmsAllCancel(){
		confirmMsg('确认需要取消全部短信吗?', function(isdel){
			if(isdel){
				AlarmsmsAction.updateAlarmsms(new Array(),function(result){
					if(result.resultCode=="0"){
						query();
					}else{
						showMsg("删除时出错，可能原因为：\n"+result.resultMessage);
					}
				});
			}			
		});
	}
	// 导出excel
	function btn_import_excel(){
		 var headerStr = ["电话号码","短信类型","短信内容","数据插入时间","最早发送短信时间","最后发送短信时间","发送短信次数","短信发送结果","备注"];
		 var title = "告警信息统计";
		 var queryObj = {
					phoneNum:$("#AlarmsmsQueryForm\\:phoneNum").val(),
					smscontent:$("#AlarmsmsQueryForm\\:smscontent").val(),
					smstype:$("#AlarmsmsQueryForm\\:smstype").val()
									};
		 showExport(queryObj,headerStr,title);
	}
	function showExport(pObject,headerStr,title){
		
		AlarmsmsAction.reportExport(pObject,headerStr,title,{
			callback:function(data){
				if(data.resultCode=="0"){
					if(data == null){
						alert("查询结果为空，无数据导出！");
						return;
					}
					var fileName=data.returnObject[1]+".xls";
					fileDownload(fileName);
				}else{
					showMsg("导出Excel时出错，可能原因为：\n"+result.resultMessage);
				}
			}});
	}
//--------------------界面操作 end ------------------------

</script>