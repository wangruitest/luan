<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<script type="text/javascript">
	var queryFormCach=null;
	var treeSelectCach=null;
	var selectedUsers=new Array();
	var regionTree=null;
	$(function(){
		$('#regionBusinessDialog').dialog({closed:true});
		//创建列表
		$("#BusinessList").datagrid({
			title:'商户信息管理',
            idField: 'businessid',
            singleSelect : false,
            pagination : true,
            height : getViewportHeight()-50,
            fitColumns : true,        
			frozenColumns:[[
			                {field:'ck',checkbox:true}
						]],
			columns:[[
	{field:'businessname',title:'商户名称',width:100},
	{field:'isgroup',title:'是否集团用户',width:100,formatter:function(result){
		return result==1?'是':'否';}
	},
//	{field:'status',title:'状态',width:100,formatter:function(result){
//		return result==1?'禁用':'启用';}
//	},
	{field:'businesscode',title:'商户集团编号',width:100},
	{field:'linkman',title:'联系人',width:100},
	{field:'edituser',title:'更新人员',width:80},
	{field:'edittime',title:'更新时间',width:120,formatter:function(date){
		return date==null?'':date.pattern("yyyy-MM-dd HH:mm:ss");
	}},
	{field:'codeGenerator',title:'codeGenerator',width:0,hidden:true}
			]],
			toolbar:[{
				text:'添加',
				iconCls:'icon-add',
				handler:BusinessAdd
			},{
				text:'修改',
				iconCls:'icon-edit',
				handler:BusinessBeforeEdit
			},{
				text:'删除',
				iconCls:'icon-remove',
				handler:BusinessDel
			},{
				text:'景区授权',
				iconCls:'icon-redo',
				handler:RegionRoleRight
			}],
			onDblClickRow:BusinessBeforeEdit
		});
					
		//创建编辑对话框
		$('#BusinessDialog').dialog({
			title:'新增商户信息',
			modal:true,
			buttons:[{
				text:'确定',
				iconCls:'icon-ok',
				handler:function(){
					
				}
			},{
				text:'取消',
				handler:function(){
					$('#BusinessDialog').dialog('close');
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
		$("#select_users_business").click(selectUsers);
	//	loadindustytypeSelect("BusinessForm");
		query();
		if(isHideToolBar!="false" && isHideToolBar!=false){
			hideGridToolBar();
		}
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
		$('#BusinessList').datagrid('unselectAll');
		var queryObj = {
	id:$("#BusinessQueryForm\\:businessid").val(),
	industryid:$("#BusinessQueryForm\\:industryid").val(),
	isgroup:$("#BusinessQueryForm\\:isgroup").val(),
	status:$("#BusinessQueryForm\\:status").val(),
	businessname:$("#BusinessQueryForm\\:businessname").val(),
	address:$("#BusinessQueryForm\\:address").val(),
	linkman:$("#BusinessQueryForm\\:linkman").val(),
	phone:$("#BusinessQueryForm\\:phone").val(),
	businesscode:$("#BusinessQueryForm\\:businesscode").val(),
	depositAmount:$("#BusinessQueryForm\\:depositAmount").val(),
	usedAmount:$("#BusinessQueryForm\\:usedAmount").val(),
	lockedAmount:$("#BusinessQueryForm\\:lockedAmount").val(),
	edittime:$("#BusinessQueryForm\\:edittime").val(),
	edituser:$("#BusinessQueryForm\\:edituser").val(),
	createtime:$("#BusinessQueryForm\\:createtime").val(),
	createuser:$("#BusinessQueryForm\\:createuser").val(),
				codeGenerator:'codeGenerator'
					};
		treeSelectCach=null;
		queryFormCach=queryObj;
		
		reLoadGridData(queryObj);
	}

	function reset(){
		$("#BusinessQueryForm\\:businessid").val('');
		$("#BusinessQueryForm\\:industryid").val('');
		$("#BusinessQueryForm\\:isgroup").val('');
		$("#BusinessQueryForm\\:status").val('');
		$("#BusinessQueryForm\\:businessname").val('');
		$("#BusinessQueryForm\\:address").val('');
		$("#BusinessQueryForm\\:linkman").val('');
		$("#BusinessQueryForm\\:phone").val('');
		$("#BusinessQueryForm\\:businesscode").val('');
		$("#BusinessQueryForm\\:depositAmount").val('');
		$("#BusinessQueryForm\\:usedAmount").val('');
		$("#BusinessQueryForm\\:lockedAmount").val('');
		$("#BusinessQueryForm\\:edittime").val('');
		$("#BusinessQueryForm\\:edituser").val('');
		$("#BusinessQueryForm\\:createtime").val('');
		$("#BusinessQueryForm\\:createuser").val('');
	}
	
	//加载表格数据
	function loadData(data){
		$('#BusinessList').datagrid('unselectAll');
		if(data!=null && data.length>0){
			$('#BusinessList').datagrid({loadFilter:pagerFilter}).datagrid('loadData', {total:data.length,rows:data});
		}else{
			$('#BusinessList').datagrid({loadFilter:pagerFilter}).datagrid('loadData',{total:0,rows:[]});
		}
	}

	

	function getFormObj(){
		var obj = $("#BusinessForm").getJSON().BusinessForm;
	//	obj.businessSendareasList=$('#SendareaCfgBusinessList').datagrid('getRows');
	//	obj.businessMasList=$('#MasBusinessList').datagrid('getRows');
		return obj;
	}

	function reLoadGridData(queryObj){
		BusinessAction.getBusinessList(queryObj,function(result){
				if(result.resultCode=="0"){
					loadData(result.returnList);
				}else{
					showMsg("加载商户信息列表数据时出错，可能原因为：\n"+result.resultMessage);
				}
			});
	}

	
//--------------------初始化和公用方法 start ------------------------
//--------------------界面操作 start ------------------------
	function loadSelectedUsers(){
		var userNames="",userIds="";
		$(selectedUsers).each(function(index,obj){
			userNames+=obj.operatorname+";";
			userIds+=obj.userId+";";
		});
		$("#BusinessForm\\:userBusinessCfgList").val(userNames);
	}
    function formCheck(){
    	var industryid=$("#BusinessForm\\:industryid").combobox('getValue');
    	if(null==industryid || industryid==""){
			showMsg("请先选择行业类型！");
			return false;
		}
    	return true;
}
	//关联的短信网关列表数据
	
	function BusinessMasAppend(){
		chooseMas(BusinessMasAppendBack);
	}
	function BusinessMasAppendBack(oldRows){
		var rows=copyObjList(oldRows);
		var masList = $('#MasBusinessList').datagrid('getRows');
		var flag = "true";
		for(var i=0;i<rows.length;i++){
			for(var j = 0;j<masList.length;j++){
				if (masList[j]['name']+(masList[j]['mastype']+"")==rows[i]['name']+(rows[i]['mastype']+"")){
					flag = "false";
				}
			}
			if(flag == "true"){
				$('#MasBusinessList').datagrid('appendRow',rows[i]);
			}
			flag = "true";
		}
	}
	function BusinessMasDel(){
		var rows = $('#MasBusinessList').datagrid('getSelections');
		if (rows.length<=0) {
			showMsg("请先选择需要去除的短信端口配置!");
			return;
		}
		confirmMsg('确认需要去除这些短信端口配置吗?', function(isdel){
			if(isdel){
				var rowIndexs=new Array();
				for(var i=0;i<rows.length;i++){
					var rowIndex = $('#MasBusinessList').datagrid('getRowIndex',rows[i].id);
					rowIndexs.push(rowIndex);
				}
				//反向排序
				rowIndexs=intArrayReverseSort(rowIndexs);
				for(var i=0;i<rowIndexs.length;i++){
					$('#MasBusinessList').datagrid('deleteRow',rowIndexs[i]);
				}
			}			
		});
	}
	//关联的常用区域列表数据
	function BusinessSendareaCfgAppend(){
		chooseBusinessSendareaCfg(BusinessSendareaCfgAppendBack);
	}
	function BusinessSendareaCfgAppendBack(oldRows){
		var rows=copyObjList(oldRows);
//		var sendareaList=$('#SendareaCfgBusinessList').datagrid('getRows');
		var flag = "true";
		for(var i=0;i<rows.length;i++){
			rows[i].updatetime=null;
//			rows[i].cellCfgList=null;
			for(var j = 0;j<sendareaList.length;j++){
				if (sendareaList[j]['sendareaid']==rows[i]['id']){
					flag = "false";
				}
			}
			if(flag == "true"){
				rows[i]['sendareaid']=rows[i]['id'];
				$('#SendareaCfgBusinessList').datagrid('appendRow',rows[i]);
			}
			flag = "true";
		}
	}
	function BusinessSendareaCfgDel(){
		var rows = $('#SendareaCfgBusinessList').datagrid('getSelections');
		if (rows.length<=0) {
			showMsg("请先选择需要去除的常用区域!");
			return;
		}
		confirmMsg('确认需要去除这些常用区域吗?', function(isdel){
			if(isdel){
				var rowIndexs=new Array();
				for(var i=0;i<rows.length;i++){
					var rowIndex = $('#SendareaCfgBusinessList').datagrid('getRowIndex',rows[i].id);
					rowIndexs.push(rowIndex);
				}
				//反向排序
				rowIndexs=intArrayReverseSort(rowIndexs);
				for(var i=0;i<rowIndexs.length;i++){
					$('#SendareaCfgBusinessList').datagrid('deleteRow',rowIndexs[i]);
				}
			}			
		});
	}
	function BusinessAdd(){
//		$('#SendareaCfgBusinessList').datagrid('loadData',{total:0,rows:[]});
//		$('#MasBusinessList').datagrid('loadData',{total:0,rows:[]});
		selectedUsers=new Array();
		$('#BusinessForm').clear();
	//	loadindustytypeSelect("BusinessForm",1);
		$('#BusinessDialog').dialog({
			title:'新增商户信息',
			modal:true,
			buttons:[{
				text:'确定',
				iconCls:'icon-ok',
				handler:BusinessCreate
			},{
				text:'取消',
				handler:function(){
					$('#BusinessDialog').dialog('close');
				}
			}],
			closed:false
		});
	}
	
	function BusinessCreate(){
//		if(!formCheck())return;
		var obj=getFormObj();
//		obj['industryid']=$("#BusinessForm\\:industryid").combobox("getValue");
//		obj['industryname']=$("#BusinessForm\\:industryid").combobox("getText");
		if(!jQuery.form("#BusinessForm").validate())return;
//		for (var p in selectedUsers[0]) {
//			alert(p);
//			alert(selectedUsers[0][p]);
//		}

		var pattern = new RegExp("[`~!@#$^&*()=|{}':;',\\[\\].<>/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？]");
        if(pattern.test(obj.businessname)) {
            showMsg("商户名称不能包含非法字符！");
            return;
        }

		obj.userBusinessCfgList=selectedUsers;
		BusinessAction.createBusiness(obj,function(result){
			if(result.resultCode=="0"){
				query();
				$('#BusinessDialog').dialog('close');
			}else if (result.resultCode=="-2") {
				showMsg("集团编号重复!");
			}else{
				showMsg("创建商户信息时出错，可能原因为：\n"+result.resultMessage);
			}
		});
	}
	function BusinessBeforeEdit(rowIndex, rowData){
		var datas=new Array();
		if(null!=rowData){
			datas.push(rowData);
		}else{
			var rows = $('#BusinessList').datagrid('getSelections');
			if (rows.length<=0) {
				showMsg("请先选择需要修改的!");
				return;
			}
			if (rows.length>1) {
				showMsg("不能同时修改多个!");
				return;
			}
			datas=rows;
		}
//		$('#SendareaCfgBusinessList').datagrid('loadData',{total:0,rows:[]});
//		$('#MasBusinessList').datagrid('loadData',{total:0,rows:[]});
		BusinessEdit(datas);
	}
	function BusinessEdit(rows){
		//初始化数据 
//		var sendareaCfgrow = rows[0].businessSendareasList;
//		var businessMasrow = rows[0].businessMasList;
//		for (var p in sendareaCfgrow) {
//			$('#SendareaCfgBusinessList').datagrid('appendRow',sendareaCfgrow[p]);
//		}
//		for (var q in businessMasrow) {
//			$('#MasBusinessList').datagrid('appendRow',businessMasrow[q]);
//		}
		$("#BusinessForm").setJSON({BusinessForm:rows[0]});
		selectedUsers=rows[0].userBusinessCfgList;
		loadSelectedUsers();
//		$("#BusinessForm\\:industryid").combobox("setValue",rows[0]['industryid']);
		$('#BusinessDialog').dialog({
			title:'修改商户信息',
			modal:true,
			buttons:[{
				text:'确定',
				iconCls:'icon-ok',
				handler:BusinessUpdate
			},{
				text:'取消',
				handler:function(){
					$('#BusinessDialog').dialog('close');
				}
			}],
			closed:false
		});
	}
	
	function BusinessUpdate(){
//		if(!formCheck())return;
		var obj=getFormObj();
//		obj['industryid']=$("#BusinessForm\\:industryid").combobox("getValue");
		if(!jQuery.form("#BusinessForm").validate())return;
		
		var pattern = new RegExp("[`~!@#$^&*()=|{}':;',\\[\\].<>/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？]");
        if(pattern.test(obj.businessname)) {
            showMsg("商户名称不能包含非法字符！");
            return;
        }
		
		obj.userBusinessCfgList=selectedUsers;
		BusinessAction.updateBusiness(obj,function(result){	
			if(result.resultCode=="0"){
				$('#BusinessDialog').dialog('close');
				var queryObj=treeSelectCach==null?queryFormCach:treeSelectCach;
				reLoadGridData(queryObj);
			}else if (result.resultCode=="-2") {
				showMsg("集团编号重复!");
			}else{
				showMsg("更新商户信息时出错，可能原因为：\n"+result.resultMessage);
			}
		});
	}
	
	function BusinessDel(){
		var rows = $('#BusinessList').datagrid('getSelections');
		if (rows.length<=0) {
			showMsg("请先选择需要删除的商户信息!");
			return;
		}
		confirmMsg('确认需要删除这些商户信息吗?', function(isdel){
			if(isdel){
				var objs=new Array();
				for(var i=0;i<rows.length;i++){
					objs.push({businessid:rows[i].businessid,businessname:rows[i].businessname});
				}
				BusinessAction.deleteForIsExist(objs,function(result){
				if(result.split("-")[0]=="false"){
					showMsg(result.split("-")[1]+"商户正在工单中使用,无法进行删除!");
					return;
				}else{
					BusinessAction.batchDeleteBusiness(objs,function(result){
						if(result.resultCode=="0"){
							var queryObj=treeSelectCach==null?queryFormCach:treeSelectCach;
							reLoadGridData(queryObj);
						}else{
							showMsg("删除商户信息时出错，可能原因为：\n"+result.resultMessage);
						}
					});
				}
				});
			}			
		});
	}
	function loadindustytypeSelect(form,param1){
		// 行业类型下拉框
		IndustryAction.getAllIndustry(function(result){
			if(result.resultCode=="0"){
				var options=new Array();
				for(var i=0;i<result.returnList.length;i++){
					var newOption={
							id:result.returnList[i].industryid,
							text:result.returnList[i].typename
							};
					options.push(newOption);
				}
				$('#'+form+'\\:industryid').combobox('loadData',options);
				if (param1==1){
					$('#'+form+'\\:industryid').combobox('select',options[0].id);
				} 
			}else{
				showMsg("加载景区类型数据时出错，可能原因为：\n"+result.resultMessage);
			}
		});
	}
	
	function hideGridToolBar(){
		$('#BusinessList').datagrid({toolbar:null,onDblClickRow:null});
		var SendareaCfgPager = $("#BusinessList").datagrid("getPager");
		 if(SendareaCfgPager)
		 {
		    $(SendareaCfgPager).pagination({
		        onSelectPage:function(pageNumber,pageSize){
		        	reLoadGridData(queryFormCach,pageSize,pageNumber);
		        }
		    });
		 }
	}
	function getSelectedRows(){
		var rows = $('#BusinessList').datagrid('getSelections');
		return rows;
	}
	// 景区查看权限分配给角色
	function RegionRoleRight(){
		DWREngine.setAsync(false);
		var rows = $('#BusinessList').datagrid('getSelections');
		if (rows.length<=0) {
			showMsg("请先选择需要授权的商户!");
			return;
		}
		var businessIds="";
		$(rows).each(function(index,obj){
			businessIds+=obj.businessid+",";
		});
		if(businessIds!="")businessIds=businessIds.substring(0,businessIds.length-1);	
		if(null==regionTree){
			//创建树形
			regionTree=$('#region_tree').tree({
				animate:true,
				checkbox:true,
				onCheck: function(node,checked) {
					if(node.id=='3400000'){
						if(checked){
							RegionCfgAction.getAllRegionCfgFromProvince(function(result){
								if(result.resultCode=="0"){
									var typeDatas=result.returnList;									
									for(var i=0;i<typeDatas.length;i++){
										var idstrs = typeDatas[i].cityCode + typeDatas[i].id;
										var citynode={
												id:idstrs,
												text:typeDatas[i].regionName
											};
										var node = $('#region_tree').tree('find', citynode.id);
										$('#region_tree').tree('check', node.target);
									}								
								}else{
									showMsg("初始化树形时出错，可能原因为：\n"+result.resultMessage);
								}
							});
						}else{
							var checkedNodes=$('#region_tree').tree("getChecked");
							for(var i=0;i<checkedNodes.length;i++){
								$("#region_tree").tree("uncheck",checkedNodes[i].target);
							}
							
						}//end if(checked)
					}//end if(node.id=='3400000')
				}
			});
		}
		$('#region_tree').tree("reload");
		//加载景区数据
		var cityjson = {};
		RegionCfgAction.getAllRegionCfgFromProvince(function(result){
			resultparam=result;
			if(result.resultCode=="0"){
				var typeDatas=result.returnList;
				var citynodes={
							id:3400000,
							text:'安徽省'
					};
					$('#region_tree').tree('append',{
						parent:null,
						data:[citynodes]
						
					});
					
				for(var i=0;i<typeDatas.length;i++){
					var idstr = typeDatas[i].cityCode + typeDatas[i].id;
					var newNode={
							id:idstr,
							text:typeDatas[i].regionName
						};
					// 如果这个数据的city_code没有添加到根部，则添加。
					if (cityjson[typeDatas[i].cityCode]==null) {
						var citynode={
							id:typeDatas[i].cityCode,
							text:typeDatas[i].cityName
						};
						cityjson[typeDatas[i].cityCode]=citynode;
						$('#region_tree').tree('append',{
							parent:null,
							data:[citynode]
						});
					}
					// 把此节点添加到相应的城市下。
					$('#region_tree').tree('append',{
						parent:$('#region_tree').tree('find',typeDatas[i].cityCode).target,
						data:[newNode]
					});
				}
				
			}else{
				showMsg("初始化树形时出错，可能原因为：\n"+result.resultMessage);
			}
		});
		
		if(rows.length==1){
			BusinessRegionCfgAction.getBusinessRegionCfgList({businessid:rows[0].businessid},function(result){
				$(result.returnList).each(function(index,obj){
					var regionCfgIdStr = obj.cityid + obj.regionCfgId;
					if(regionCfgIdStr!="3400000"){
						var node = $('#region_tree').tree('find', regionCfgIdStr);
						if(null!=node){
							if($('#region_tree').tree('isLeaf', node.target)){
								$('#region_tree').tree('check', node.target);
							}
						}
					}
				});
			});
		}
		DWREngine.setAsync(true);
		$('#regionBusinessDialog').dialog({
			title:'景区授权',
			modal:true,
			buttons:[{
				text:'确定',
				iconCls:'icon-ok',
				handler:function(){
					var nodes = $('#region_tree').tree('getChecked');
					var regionIds="";
					$(nodes).each(function(index,obj){
						if(obj.id=='3400000'){
							regionIds = "3400000,";
						}
						var parent=$('#region_tree').tree('getParent', obj.target);
						if(null!=parent) {
							regionIds+=obj.id+",";
						}

					});
					if(regionIds!="")regionIds=regionIds.substring(0,regionIds.length-1);
					if(rows.length>1){
						confirmMsg('您选择了多个商户同时授权，系统将以当前选择的景区对所选角色进行授权或覆盖，是否继续?', function(flag){
							if(flag)businessRegionRight(businessIds,regionIds);
						});
					}else{
						businessRegionRight(businessIds,regionIds);
					}
				}
			},{
				text:'取消',
				handler:function(){
					$('#regionBusinessDialog').dialog('close');
				}
			}],
			closed:false
		});
	}
	
	function businessRegionRight(businessIds,regionIds){
		BusinessRegionCfgAction.createBusinessRegionCfgBatch(businessIds,regionIds,function(result){
			if(result.resultCode=="0"){
				showMsg("授权成功！");
				var queryObj=treeSelectCach==null?queryFormCach:treeSelectCach;
				reLoadGridData(queryObj);
				$('#regionBusinessDialog').dialog('close');
			}else{
				showMsg("为商户授权景区权限时出错，可能原因为：\n"+result.resultMessage);
			}
		});
	}
	
	function fileUploadBack(result){
		$("#BusinessForm\\:logoSrc").val(result.relativeFileName);
 	 }
//--------------------界面操作 end ------------------------

</script>