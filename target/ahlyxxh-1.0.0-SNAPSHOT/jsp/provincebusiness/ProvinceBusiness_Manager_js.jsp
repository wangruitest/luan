<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<script type="text/javascript">
	var queryFormCach=null;
	var treeSelectCach=null;
	var oftareaListData = new Array();
	var gwListData = new Array();
	$(function(){

		//创建列表
				$("#ProvinceBusinessList").datagrid({
			title:'商户信息管理',
			idField:'businessid',
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
	{field:'businessname',title:'商户名字',width:100},
	{field:'cityCode',title:'归属地市',width:100, formatter : function(val,row){return getCityByCode(val);}},
	{field:'codeGenerator',title:'codeGenerator',width:0,hidden:true}
			]],
			toolbar:[{
				/* text:'添加',
				iconCls:'icon-add',
				handler:ProvinceBusinessAdd
			},{ */
				text:'修改',
				iconCls:'icon-edit',
				handler:ProvinceBusinessBeforeEdit
			},{
				text:'删除',
				iconCls:'icon-remove',
				handler:ProvinceBusinessDel
			}],
			onDblClickRow:ProvinceBusinessBeforeEdit
		});
		
				$("#OftenUsedAreaCfgList").datagrid({
					idField:'oftenUsedAreaId',
					singleSelect: false,
					pagination: true,
					fit:true,
					fitColumns: true,
					frozenColumns:[[
					                {field:'ck',checkbox:true}
								]],
					columns:[[
						{field:'oftenUsedAreaId',title:'ID',width:100,hidden:true},
						{field:'oftenUsedAreaName',title:'常用区域名称',width:100},
						{field:'areaCode',title:'归属地市',width:100, formatter : function(val, row){return getCityByCode(val);}},
						{field:'remark',title:'备注',width:100}, 
				{field:'codeGenerator',title:'codeGenerator',width:0,hidden:true}
				]],
					toolbar:[{
						text:'选择',
						iconCls:'icon-add',
						handler:openOftarea
					
					},{
						text:'删除',
						iconCls:'icon-remove',
						handler:delOftarea
						
					}]
			});
				
				
				$("#PrGwCfgList").datagrid({
					idField:'gwId',
					singleSelect: false,
					pagination: true,
					fit:true,
					fitColumns: true,
					frozenColumns:[[
					                {field:'ck',checkbox:true}
								]],
					columns:[[
						{field:'gwId',title:'网关ID',width:100,hidden:true},
						{field:'gwName',title:'网关名称',width:100},
						{field:'gwSingname',title:'网关签名',width:100},
						{field:'remark',title:'备注',width:100},
					{field:'codeGenerator',title:'codeGenerator',width:0,hidden:true}
				]],
					toolbar:[{
						text:'选择',
						iconCls:'icon-add',
						handler:openGw
					
					},{
						text:'删除',
						iconCls:'icon-remove',
						handler:delGw
						
					}]
			});
					
		//创建编辑对话框
		$('#ProvinceBusinessDialog').dialog({
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
					$('#ProvinceBusinessDialog').dialog('close');
				}
			}],
			closed:true
		});
		
		$('#ProvinceBusinessShowDialog').dialog({
			title:'查看商户信息',
			modal:true,
			buttons:[{
				text:'关闭',
				handler:function(){
					$('#ProvinceBusinessShowDialog').dialog('close');
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
		$('#ProvinceBusinessList').datagrid('unselectAll');
		var queryObj = {
	businessid:$("#ProvinceBusinessQueryForm\\:businessid").val(),
	industryid:$("#ProvinceBusinessQueryForm\\:industryid").val(),
	isgroup:$("#ProvinceBusinessQueryForm\\:isgroup").val(),
	businessname:$("#ProvinceBusinessQueryForm\\:businessname").val(),
	address:$("#ProvinceBusinessQueryForm\\:address").val(),
	linkman:$("#ProvinceBusinessQueryForm\\:linkman").val(),
	phone:$("#ProvinceBusinessQueryForm\\:phone").val(),
	businesscode:$("#ProvinceBusinessQueryForm\\:businesscode").val(),
	depositAmount:$("#ProvinceBusinessQueryForm\\:depositAmount").val(),
	usedAmount:$("#ProvinceBusinessQueryForm\\:usedAmount").val(),
	lockedAmount:$("#ProvinceBusinessQueryForm\\:lockedAmount").val(),
	edittime:$("#ProvinceBusinessQueryForm\\:edittime").val(),
	edituser:$("#ProvinceBusinessQueryForm\\:edituser").val(),
	createtime:$("#ProvinceBusinessQueryForm\\:createtime").val(),
	createuser:$("#ProvinceBusinessQueryForm\\:createuser").val(),
	loginlogopath:$("#ProvinceBusinessQueryForm\\:loginlogopath").val(),
	framelogopath:$("#ProvinceBusinessQueryForm\\:framelogopath").val(),
	isspecial:$("#ProvinceBusinessQueryForm\\:isspecial").val(),
	cityCode:$("#ProvinceBusinessQueryForm\\:cityCode").val(),
				codeGenerator:'codeGenerator'
					};
		treeSelectCach=null;
		queryFormCach=queryObj;
		
		reLoadGridData(queryObj);
	}

	function reset(){
		$("#ProvinceBusinessQueryForm\\:businessname").val('');
		$("#ProvinceBusinessQueryForm\\:address").val('');
		$("#ProvinceBusinessQueryForm\\:linkman").val('');
		$("#ProvinceBusinessQueryForm\\:phone").val('');
		$("#ProvinceBusinessQueryForm\\:businesscode").val('');
		$("#ProvinceBusinessQueryForm\\:depositAmount").val('');
		$("#ProvinceBusinessQueryForm\\:usedAmount").val('');
		$("#ProvinceBusinessQueryForm\\:lockedAmount").val('');
		$("#ProvinceBusinessQueryForm\\:edittime").val('');
		$("#ProvinceBusinessQueryForm\\:edituser").val('');
		$("#ProvinceBusinessQueryForm\\:createtime").val('');
		$("#ProvinceBusinessQueryForm\\:createuser").val('');
		$("#ProvinceBusinessQueryForm\\:loginlogopath").val('');
		$("#ProvinceBusinessQueryForm\\:framelogopath").val('');
		$("#ProvinceBusinessQueryForm\\:isspecial").val('');
		$("#ProvinceBusinessQueryForm\\:cityCode").val('');
	}
	
	//加载表格数据
	function loadData(data){
		$('#ProvinceBusinessList').datagrid('unselectAll');
		if(data!=null && data.length>0){
			$('#ProvinceBusinessList').datagrid({loadFilter:pagerFilter}).datagrid('loadData', {total:data.length,rows:data});
		}else{
			$('#ProvinceBusinessList').datagrid({loadFilter:pagerFilter}).datagrid('loadData',{total:0,rows:[]});
		}
	}

	function getCityByCode(code) { 
		switch(parseInt(code)) {
			case 591 : return "福州";
			case 592 : return "厦门";
			case 593 : return "宁德";
			case 594 : return "莆田";
			case 595 : return "泉州";
			case 596 : return "漳州";
			case 597 : return "龙岩";
			case 598 : return "三明";
			case 599 : return "南平";
			default : return "匹配错误";
		}
	}

	function getFormObj(){
		var obj = $("#ProvinceBusinessForm").getJSON().ProvinceBusinessForm;
		obj.oftenUsedAreaList = oftareaListData;
		obj.gwCfgList = gwListData;
		return obj;
	}
	
	function reLoadGridData(queryObj){
		ProvinceBusinessAction.getProvinceBusinessList(queryObj,function(result){
				if(result.resultCode=="0"){
					loadData(result.returnList);
				}else{
					showMsg("加载商户信息列表数据时出错，可能原因为：\n"+result.resultMessage);
				}
			});
	}
	
	function initPager() {
		$("#OftenUsedAreaCfgList").datagrid("getPager").pagination({
			showPageList : false,
			onSelectPage:function(pageNumber,pageSize){
				loadDataByTableId('OftenUsedAreaCfgList', oftareaListData ,pageSize,pageNumber);
			}
		});
		$("#PrGwCfgList").datagrid("getPager").pagination({
			showPageList : false,
			onSelectPage:function(pageNumber,pageSize){
				loadDataByTableId('PrGwCfgList', gwListData ,pageSize,pageNumber);
			}
		});
	}
	function loadDataByTableId(tableId, data, pageSize, currentPage) { //根据表格名称加载对应的表格数据
		$('#' + tableId).datagrid('unselectAll');
		if(data!=null && data.length>0){
			currentPage = (currentPage-1)*pageSize>data.length ? 
					(data.length%pageSize==0 ? data.length/pageSize : data.length/pageSize+1) : currentPage;
			var tempdata = data.slice( (currentPage-1)*pageSize, pageSize*currentPage>data.length?data.length:pageSize*currentPage);
			$('#' + tableId).datagrid('loadData', {total:data.length,rows:tempdata});
		}else{
			$('#' + tableId).datagrid('loadData',{total:0,rows:[]});
		}
	}
	
	
//--------------------初始化和公用方法 start ------------------------
//--------------------界面操作 start ------------------------
		
	function ProvinceBusinessAdd(){
		$('#OftenUsedAreaCfgList').datagrid('loadData',{total:0,rows:[]});
		$('#PrGwCfgList').datagrid('loadData',{total:0,rows:[]});
		$('#ProvinceBusinessForm').clear();
		$('#ProvinceBusinessDialog').dialog({
			title:'新增商户信息',
			modal:true,
			buttons:[{
				text:'确定',
				iconCls:'icon-ok',
				handler:ProvinceBusinessCreate
			},{
				text:'取消',
				handler:function(){
					$('#ProvinceBusinessDialog').dialog('close');
				}
			}],
			closed:false
		});
	}
	
	function ProvinceBusinessCreate(){
		var obj=getFormObj();
		if(!jQuery.form("#ProvinceBusinessForm").validate())return;
		for(var i=0;i<obj.oftenUsedAreaList.length;i++){
			obj.oftenUsedAreaList[i].oftenCellList=null;
		}
		ProvinceBusinessAction.createProvinceBusiness(obj,function(result){
			if(result.resultCode=="0"){
				query();
				$('#ProvinceBusinessDialog').dialog('close');
			}else{
				showMsg("创建商户信息时出错，可能原因为：\n"+result.resultMessage);
			}
		});
	}
	
	function ProvinceBusinessBeforeEdit(index,rowData){
		var datas = new Array();

		if(null!=rowData){
			datas.push(rowData);
		}else{
			var rows = $('#ProvinceBusinessList').datagrid('getSelections');
			if (rows.length<=0) {
				showMsg("请先选择需要修改的商户信息!");
				return;
			}
			if (rows.length>1) {
				showMsg("不能同时修改多个商户信息!");
				return;
			}
			datas=rows;
		}
		
		$('#OftenUsedAreaCfgList').datagrid('loadData',{total:0,rows:[]});
		$('#PrGwCfgList').datagrid('loadData',{total:0,rows:[]});
		ProvinceBusinessEdit(datas);
	}
	function ProvinceBusinessEdit(rows){
		//初始化数据
		oftareaListData = rows[0].oftenUsedAreaList;
		gwListData = rows[0].gwCfgList;
		
		loadDataByTableId('OftenUsedAreaCfgList', oftareaListData, 10, 1);
		loadDataByTableId('PrGwCfgList', gwListData, 10, 1);
		initPager();
		
		$("#ProvinceBusinessForm").setJSON({ProvinceBusinessForm:rows[0]});
		$('#ProvinceBusinessDialog').dialog({
			title:'修改商户信息',
			modal:true,
			buttons:[{
				text:'确定',
				iconCls:'icon-ok',
				handler:ProvinceBusinessUpdate
			},{
				text:'取消',
				handler:function(){
					$('#ProvinceBusinessDialog').dialog('close');
				}
			}],
			closed:false
		});
	}
	
	function ProvinceBusinessUpdate(){
		var obj=getFormObj();
		if(!jQuery.form("#ProvinceBusinessForm").validate())return;
		
		for(var i=0;i<obj.oftenUsedAreaList.length;i++){
			obj.oftenUsedAreaList[i].oftenCellList=null;
		}
		ProvinceBusinessAction.updateProvinceBusiness(obj,function(result){
			if(result.resultCode=="0"){
				$('#ProvinceBusinessDialog').dialog('close');
				var queryObj=treeSelectCach==null?queryFormCach:treeSelectCach;
				reLoadGridData(queryObj);
				oftareaListData.length = 0;
				gwListData.length = 0;
				showMsg("修改商户信息成功");
			}else{
				showMsg("更新商户信息时出错，可能原因为：\n"+result.resultMessage);
			}
		});
	}
	
	function ProvinceBusinessDel(){
		var rows = $('#ProvinceBusinessList').datagrid('getSelections');
		if (rows.length<=0) {
			showMsg("请先选择需要删除的商户信息!");
			return;
		}
		confirmMsg('确认需要删除这些商户信息吗?', function(isdel){
			if(isdel){
				var objs=new Array();
				for(var i=0;i<rows.length;i++){
					objs.push({businessid:rows[i].businessid});
				}
				ProvinceBusinessAction.batchDeleteProvinceBusiness(objs,function(result){
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
//--------------------界面操作 end ------------------------

	/***********************常用区域配置模块  start*****************************/
	
	//打开
	function openOftarea() {
		$('#chooseOftareaDialog').dialog('open');
		chooseOftarea.reset();
		chooseOftarea.query();
	}
	
	//新增
	function addOftarea() {
		var rows = $('#totalOftenUsedAreaCfgList').datagrid('getSelections');
		if (rows.length<=0) {
			showMsg("未选中常用区域!");
			return;
		}
		for(var i in rows) {
			var bol = true;
			for(var j in oftareaListData) {
				if(oftareaListData[j].oftenUsedAreaId == rows[i].oftenUsedAreaId) {
					bol = false;
					break;
				}
			}
			if(bol) oftareaListData.push(rows[i]);
		}
		loadDataByTableId('OftenUsedAreaCfgList', oftareaListData, 10, $('#OftenUsedAreaCfgList').datagrid('getPager').data('pagination').options.pageNumber);
		$('#chooseOftareaDialog').dialog('close');
	}
	
	//批量删除
	function delOftarea() {
		var rows = $('#OftenUsedAreaCfgList').datagrid('getSelections');
		if (rows.length<=0) {
			showMsg("未选中常用区域!");
			return;
		}
		confirmMsg('确认删除选择的常用区域?', function(isdel){
			if(isdel) {
				for(var i in rows) {
					var index = -1;
					for(var j in oftareaListData) {
						if(rows[i].oftenUsedAreaId == oftareaListData[j].oftenUsedAreaId) {
							index = j;
							break;
						}
					}
					oftareaListData.splice(index, 1);
				}
				loadDataByTableId('OftenUsedAreaCfgList', oftareaListData, 10, $('#OftenUsedAreaCfgList').datagrid('getPager').data('pagination').options.pageNumber);
			}
		});
	}
	
	//删除所有
	function delAllOftarea() {
		if(oftareaListData.length == 0) {
			showMsg('没有任何行政区县');
			return;
		}
		confirmMsg('确认删除所有的常用区域?', function(isdel){
			if(isdel) {
				oftareaListData.length = 0;
				loadDataByTableId('OftenUsedAreaCfgList', oftareaListData, 10, 1);
			}
		});
	}
	
	/***********************常用区域配置模块  end*****************************/
	/****************************短信端口列表操作   start******************************************/
	
	//打开
	function openGw() {
		if(gwListData.length > 0) {
			showMsg('仅允许选择一个短信端口，请删除后再添加');
			return;
		}
		$('#chooseGwDialog').dialog('open');
		chooseGw.reset();
		chooseGw.query();
	}
	
	//新增
	function addGw() {
		var rows = $('#totalGwList').datagrid('getSelections');
		if (rows.length<=0) {
			showMsg("未选中短信端口!");
			return;
		}
		gwListData.length = 0;
		for(var i in rows) {
			var bol = true;
			for(var j in gwListData) {
				if(gwListData[j].gwId == rows[i].gwId) {
					bol = false;
					break;
				}
			}
			if(bol) {
				gwListData.push(rows[i]);
			}
		}
		loadDataByTableId('PrGwCfgList', gwListData, 10, $('#PrGwCfgList').datagrid('getPager').data('pagination').options.pageNumber);
		$('#chooseGwDialog').dialog('close');
	}
	
	//批量删除
	function delGw() {
		var rows = $('#PrGwCfgList').datagrid('getSelections');
		if (rows.length<=0) {
			showMsg("未选中短信端口!");
			return;
		}
		confirmMsg('确认删除选择的短信端口?', function(isdel){
			if(isdel) {
				gwListData.length = 0;
				loadDataByTableId('PrGwCfgList', gwListData, 10, 1);
			}
		});
	}
	
	//删除所有
	function delAllGw() {
		if(gwListData.length == 0) {
			showMsg("没有任何短信端口");
			return;
		}
		confirmMsg('确认删除所有的短信端口?', function(isdel){
			if(isdel) {
				gwListData.length = 0;
				loadDataByTableId('PrGwCfgList', gwListData, 10, 1);
			}
		});
	}
	
	/****************************短信端口列表操作   end******************************************/
	

</script>