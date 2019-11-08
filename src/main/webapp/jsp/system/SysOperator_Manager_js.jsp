<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<script type="text/javascript">
	var queryFormCach=null;
	var treeSelectCach=null;
	var selectedRoles=new Array();
	$(function(){
		initCountyList();
		//创建列表
		$("#SysOperatorList").datagrid({
			title:'管理',
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
				{field:'name',title:'姓名',width:100},
				{field:'loginName',title:'登录名',width:100},
				{field:'status',title:'状态',width:100,formatter:function(val){
					return val==0?'启用':'禁用';
				}},
				{field:'remark',title:'备注',width:100},
				{field:'sex',title:'性别',width:100,formatter:function(val){
					return val==0?'女':'男';
				}},
				{field:'mobileNumber',title:'手机号码',width:100},
				{field:'telephoneNumber',title:'电话号码',width:100},
				{field:'countyName',title:'所属区县',width:100},
				{field:'mail',title:'邮箱地址',width:100}
			]],
			toolbar:[{
				text:'添加',
				iconCls:'icon-add',
				handler:SysOperatorAdd
			},{
				text:'修改',
				iconCls:'icon-edit',
				handler:SysOperatorEdit
			},{
				text:'删除',
				iconCls:'icon-remove',
				handler:SysOperatorDel
			}],
			onDblClickRow: SysOperatorEdit
		});
					
		//创建编辑对话框
		$('#SysOperatorDialog').dialog({
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
					$('#SysOperatorDialog').dialog('close');
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
		$("#btn_select_roles").click(selectRoles);
		query();
	}
	
	function selectRoles(){
		var option={
			type:'02',
		    title:'选择包含的角色',
			selectedData:selectedRoles
		};
		commonSelect(option,selectRolesBack);
	}
	
	function selectRolesBack(result){
		selectedRoles=result;
		loadSelectedRoles();
	}

	//查询
	function query(){
		$('#SysOperatorList').datagrid('unselectAll');
		var queryObj = {
	unid:$("#SysOperatorQueryForm\\:unid").val(),
	name:$("#SysOperatorQueryForm\\:name").val(),
	loginName:$("#SysOperatorQueryForm\\:loginName").val(),
	password:$("#SysOperatorQueryForm\\:password").val(),
	status:$("#SysOperatorQueryForm\\:status").val(),
	remark:$("#SysOperatorQueryForm\\:remark").val(),
	orgUnid:$("#SysOperatorQueryForm\\:orgUnid").val(),
	countyCode:$("#SysOperatorForm\\:countyCode").val(),
	sex:$("#SysOperatorQueryForm\\:sex").val(),
	idNumber:$("#SysOperatorQueryForm\\:idNumber").val(),
	mobileNumber:$("#SysOperatorQueryForm\\:mobileNumber").val(),
	telephoneNumber:$("#SysOperatorQueryForm\\:telephoneNumber").val(),
	fax:$("#SysOperatorQueryForm\\:fax").val(),
	mail:$("#SysOperatorQueryForm\\:mail").val(),
	sysUnid:$("#SysOperatorQueryForm\\:sysUnid").val(),
				codeGenerator:'codeGenerator'
					};
		treeSelectCach=null;
		queryFormCach=queryObj;
		
		reLoadGridData(queryObj);
	}

	function reset(){
		$("#SysOperatorQueryForm\\:unid").val('');
		$("#SysOperatorQueryForm\\:name").val('');
		$("#SysOperatorQueryForm\\:loginName").val('');
		$("#SysOperatorQueryForm\\:password").val('');
		$("#SysOperatorQueryForm\\:status").val('0');
		$("#SysOperatorQueryForm\\:remark").val('');
		$("#SysOperatorQueryForm\\:orgUnid").val('');
		$("#SysOperatorQueryForm\\:sex").val('');
		$("#SysOperatorQueryForm\\:idNumber").val('');
		$("#SysOperatorQueryForm\\:mobileNumber").val('');
		$("#SysOperatorQueryForm\\:telephoneNumber").val('');
		$("#SysOperatorQueryForm\\:fax").val('');
		$("#SysOperatorQueryForm\\:mail").val('');
		$("#SysOperatorQueryForm\\:sysUnid").val('');
	}
	
	//加载表格数据
	function loadData(data){
		$('#SysOperatorList').datagrid('unselectAll');
		if(data!=null && data.length>0){
			$('#SysOperatorList').datagrid({loadFilter:pagerFilter}).datagrid('loadData', {total:data.length,rows:data}).datagrid('getPager').pagination('select',1);
		}else{
			$('#SysOperatorList').datagrid({loadFilter:pagerFilter}).datagrid('loadData',{total:0,rows:[]});
		}
	}

	

	function getFormObj(){
		var obj = $("#SysOperatorForm").getJSON().SysOperatorForm;
		return obj;
	}

	function reLoadGridData(queryObj){
		SysOperatorAction.getSysOperatorList(queryObj,function(result){
				if(result.resultCode=="0"){
					loadData(result.returnList);
				}else{
					showMsg("加载列表数据时出错，可能原因为：\n"+result.resultMessage);
				}
			});
	}

	
//--------------------初始化和公用方法 start ------------------------
//--------------------界面操作 start ------------------------

function initCountyList(){
	var cityName=$("#SysOperatorForm\\:orgUnid option:selected").text();
	var countyid=$("#SysOperatorForm\\:countyCode");
	dwr.engine.setAsync(false);
	RegionCfgAction.getAreasListByName(cityName,function(data){
		countyid.empty();
		if(null==data || null==data.returnList)return;
		countyid.prepend("<option value='0'>全部</option>");
		for (var i=0;i<data.returnList.length;i++) {
	    countyid.append("<option value='"+ data.returnList[i]['areaid']+"'>"+ data.returnList[i]['areas'] +"</option>");
		}
	});
	dwr.engine.setAsync(true);
}
	
	function SysOperatorAdd(){
		selectedRoles=new Array();
		$('#SysOperatorForm').clear();

		$('#SysOperatorDialog').dialog({
			title:'新增',
			modal:true,
			buttons:[{
				text:'确定',
				iconCls:'icon-ok',
				handler:SysOperatorCreate
			},{
				text:'取消',
				handler:function(){
					$('#SysOperatorDialog').dialog('close');
				}
			}],
			closed:false
		});
	}
	
	function SysOperatorCreate(){
		if(!jQuery.form("#SysOperatorForm").validate())return;
		var obj=getFormObj();
		obj.roles=selectedRoles;
		
		 var reges=/[`~!@#\$%\^\&\*\(\)_\+“”《》！@#￥%<>\?:"\{\},\.\\\/;'\[\]]/im; 
		 var space=/\s+/g;//正则匹配空格
        
        if(reges.test(obj.name)||space.test(obj.name)) {
            showMsg("姓名不能包含非法字符！");
            return;
        }
		
		if(reges.test(obj.loginName)||space.test(obj.loginName)) {
            showMsg("登录名不能包含非法字符！");
            return;
        }
		if(reges.test(obj.password)||space.test(obj.password)) {
            showMsg("密码不能包含非法字符！");
            return;
        }
        
		if(reges.test(obj.remark)) {
            showMsg("备注不能包含非法字符！");
            return;
        }
		
		SysOperatorAction.isLoginNameExistence(obj,function(result){
			if(result==false){
				showMsg("该登录名不可用!");
				return;
			}else{
				SysOperatorAction.createSysOperator(obj,function(result){
					if(result.resultCode=="0"){
						query();
				//		obj.unid=result.returnObject.unid;
				//		$('#SysOperatorList').datagrid('appendRow',obj);
						$('#SysOperatorDialog').dialog('close');
					}else{
						showMsg("创建时出错，可能原因为：\n"+result.resultMessage);
					}
				});
			}
		});
		
	}
	
	function SysOperatorEdit(index,rowData){
		var rows = new Array();
		if(null!=rowData){
			rows.push(rowData);
		}else{
			rows=$('#SysOperatorList').datagrid('getSelections');
		}
		if (rows.length<=0) {
			showMsg("请先选择需要修改的!");
			return;
		}
		if (rows.length>1) {
			showMsg("不能同时修改多个!");
			return;
		}
		//初始化数据
		$("#SysOperatorForm").setJSON({SysOperatorForm:rows[0]});
		var cityName=$("#SysOperatorForm\\:orgUnid option:selected").text();
		var countyid=$("#SysOperatorForm\\:countyCode");
		dwr.engine.setAsync(false);
		RegionCfgAction.getAreasListByName(cityName,function(data){
			countyid.empty();
			if(null==data || null==data.returnList)return;
			countyid.prepend("<option value='0'>全部</option>");
			for (var i=0;i<data.returnList.length;i++) {
		    countyid.append("<option value='"+ data.returnList[i]['areaid']+"'>"+ data.returnList[i]['areas'] +"</option>");
		    if(data.returnList[i]['areas']==rows[0].countyName){
				 countyid.get(0).options[i+1].selected=true;
			 }
			}
		});
		dwr.engine.setAsync(true);
		
		selectedRoles=rows[0].roles;
		loadSelectedRoles();
		
		$('#SysOperatorDialog').dialog({
			title:'修改',
			modal:true,
			buttons:[{
				text:'确定',
				iconCls:'icon-ok',
				handler:SysOperatorUpdate
			},{
				text:'取消',
				handler:function(){
					$('#SysOperatorDialog').dialog('close');
				}
			}],
			closed:false
		});
	}
	
	function loadSelectedRoles(){
		var roleNames="",roleIds="";
		$(selectedRoles).each(function(index,obj){
			roleNames+=obj.name+";";
			roleIds+=obj.unid+";";
		});
		$("#SysOperatorForm\\:sysRoles").val(roleNames);
	}
	
	function SysOperatorUpdate(){
		var obj=getFormObj();
		if(!jQuery.form("#SysOperatorForm").validate())return;
		obj.roles=selectedRoles;
		
		 var reges=/[`~!@#\$%\^\&\*\(\)_\+“”《》！@#￥%<>\?:"\{\},\.\\\/;'\[\]]/im; 
		 var space= /\s+/g;
        
        if(reges.test(obj.name)||space.test(obj.name)) {
            showMsg("姓名不能包含非法字符！");
            return;
        }
		
		if(reges.test(obj.loginName)||space.test(obj.loginName)) {
            showMsg("登录名不能包含非法字符！");
            return;
        }
		if(reges.test(obj.password)||space.test(obj.password)) {
            showMsg("密码不能包含非法字符！");
            return;
        }
        
		if(reges.test(obj.remark)) {
            showMsg("备注不能包含非法字符！");
            return;
        }
		
		SysOperatorAction.isLoginNameExistenceForUpd(obj,function(result){
			if(result==false){
				showMsg("该登录名不可用!");
				return;
			}else{
				SysOperatorAction.updateSysOperator(obj,function(result){
					if(result.resultCode=="0"){
						$('#SysOperatorDialog').dialog('close');
						var queryObj=treeSelectCach==null?queryFormCach:treeSelectCach;
						reLoadGridData(queryObj);
					}else{
						showMsg("更新时出错，可能原因为：\n"+result.resultMessage);
					}
				});
			}
		});
		
	}
	
	function SysOperatorDel(){
		var rows = $('#SysOperatorList').datagrid('getSelections');
		if (rows.length<=0) {
			showMsg("请先选择需要删除的!");
			return;
		}
		confirmMsg('确认需要删除这些吗?', function(isdel){
			if(isdel){
				var objs=new Array();
				for(var i=0;i<rows.length;i++){
					objs.push({unid:rows[i].unid});
				}
				SysOperatorAction.batchDeleteSysOperator(objs,function(result){
					if(result.resultCode=="0"){
						var queryObj=treeSelectCach==null?queryFormCach:treeSelectCach;
						reLoadGridData(queryObj);
					}else{
						showMsg("删除时出错，可能原因为：\n"+result.resultMessage);
					}
				});
			}			
		});
	}
	
//--------------------界面操作 end ------------------------

</script>