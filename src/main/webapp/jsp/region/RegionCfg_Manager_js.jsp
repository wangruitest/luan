<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<script type="text/javascript">

	Function.prototype.method = function(name, func) {
	  this.prototype[name] = func;
	  return this;
	};
	if(!String.prototype.trim){ //判断下浏览器是否自带有trim()方法
	String.method('trim', function() {
	return this.replace(/^\s+|\s+$/g, '');
	});
	String.method('ltrim', function() {
	return this.replace(/^\s+/g, '');
	});
	String.method('rtrim', function() {
	return this.replace(/\s+$/g, '');
	});
	}

	var queryFormCach=null;
	var treeSelectCach=null;
	$(function(){
		initCountyList();
		//创建列表
		$("#RegionCfgList").datagrid({
			title:'查询结果',
			idField:'id',
			singleSelect : false,
            pagination : true,
            height : getViewportHeight()-60,
            fitColumns : true, 
			frozenColumns:[[
			                {field:'ck',checkbox:true}
						]],
			columns:[[
				{field:'id',title:'景区编号',width:100},
				{field:'cityName',title:'城市',width:100},
				{field:'countyName',title:'区县',width:100},
				{field:'regionName',title:'景区名称',width:100},
				{field:'typename',title:'景区类型',width:100},
				{field:'iskey',title:'重点景区',width:100,formatter:function(date){
					if(date==0){
					return "否";
					}else if(date==1){
						return "是";
					}
				}},
				{field:'expediteValue',title:'畅通人数',width:100},
				{field:'jamValue',title:'拥挤人数',width:100},
				{field:'notes',title:'备注',width:100},
				{field:'updateuser',title:'更新人员',width:100},
				{field:'updatetime',title:'更新日期',width:100,formatter:function(date){
					return date==null?'':date.pattern("yyyy-MM-dd HH:mm:ss");
				}},
				{field:'codeGenerator',title:'fqwork',width:0,hidden:true},
				{field:'orderNumber',title:'序号',width:100},
			]],
			toolbar:[{
				text:'添加',
				iconCls:'icon-add',
				handler:RegionCfgAdd
			},{
				text:'修改',
				iconCls:'icon-edit',
				handler:RegionCfgEdit
			},{
				text:'删除',
				iconCls:'icon-remove',
				handler:RegionCfgDel
			}],
			onDblClickRow: function(rowIndex, rowData){
				$('#Select_CellcfgList').datagrid('loadData',{total:0,rows:[]});
				var cellrow1 = rowData.cellCfgList;
				for (var p in cellrow1) {
					$('#Select_CellcfgList').datagrid('appendRow',cellrow1[p]);
				}
				//初始化数据
			//	loadJingquSelect('RegionCfgForm');
			//	$("#RegionCfgForm\\:typeid").combobox("setValue",rowData['typeid']);
				$('#RegionCfgDialog').dialog({
					title:'修改景区配置',
					modal:true,
					buttons:[{
						text:'确定',
						iconCls:'icon-ok',
						handler:RegionCfgUpdate
					},{
						text:'取消',
						handler:function(){
							$('#RegionCfgDialog').dialog('close');
						}
					}],
					closed:false
				});
			}
		});
					
		//创建编辑对话框
		$('#RegionCfgDialog').dialog({
			title:'新增景区配置',
			modal:true,
			buttons:[{
				text:'确定',
				iconCls:'icon-ok',
				handler:function(){
					
				}
			},{
				text:'取消',
				handler:function(){
					$('#RegionCfgDialog').dialog('close');
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
	//	loadJingquSelect('RegionCfgQueryForm');
		query();
	}

	//查询
	function query(){
		$('#RegionCfgList').datagrid('unselectAll');
		var queryObj = {
	id:$("#RegionCfgQueryForm\\:id").val(),
	regionName:$("#RegionCfgQueryForm\\:regionName").val(),
	notes:$("#RegionCfgQueryForm\\:notes").val(),
	updateuser:$("#RegionCfgQueryForm\\:updateuser").val(),
	updatetime:$("#RegionCfgQueryForm\\:updatetime").val(),
	//typeid:$("#RegionCfgQueryForm\\:typeid").combobox("getValue"),
	isvalid:$("#RegionCfgQueryForm\\:isvalid").val(),
	iskey:$("#RegionCfgQueryForm\\:iskey").combobox("getValue"),
	lat:$("#RegionCfgQueryForm\\:lat").val(),
	lng:$("#RegionCfgQueryForm\\:lng").val(),
	aradius:$("#RegionCfgQueryForm\\:aradius").val(),
	expediteValue:$("#RegionCfgQueryForm\\:expediteValue").val(),
	jamValue:$("#RegionCfgQueryForm\\:jamValue").val(),
	imgurl:$("#RegionCfgQueryForm\\:imgurl").val(),
	orderNumber:$("#RegionCfgQueryForm\\:orderNumber").val(),
	minStaytime:$("#RegionCfgQueryForm\\:minStaytime").val(),
				codeGenerator:'fqwork'
					};
		treeSelectCach=null;
		queryFormCach=queryObj;
		
		reLoadGridData(queryObj);
	}

	function reset(){
		$("#RegionCfgQueryForm\\:id").val('');
		$("#RegionCfgQueryForm\\:regionName").val('');
		$("#RegionCfgQueryForm\\:notes").val('');
		$("#RegionCfgQueryForm\\:updateuser").val('');
		$("#RegionCfgQueryForm\\:updatetime").val('');
		$("#RegionCfgQueryForm\\:typeid").combobox('setValue','');
		$("#RegionCfgQueryForm\\:iskey").combobox('setValue','');
		$("#RegionCfgQueryForm\\:isvalid").val('');
		$("#RegionCfgQueryForm\\:lat").val('');
		$("#RegionCfgQueryForm\\:lng").val('');
		$("#RegionCfgQueryForm\\:aradius").val('');
		$("#RegionCfgQueryForm\\:expediteValue").val('');
		$("#RegionCfgQueryForm\\:jamValue").val('');
		$("#RegionCfgQueryForm\\:imgurl").val('');
		$("#RegionCfgQueryForm\\:minStaytime").val('');
	}
	
	//加载表格数据
	function loadData(data){
		$('#RegionCfgList').datagrid('unselectAll');
		if(data!=null && data.length>0){
			$('#RegionCfgList').datagrid({loadFilter:pagerFilter}).datagrid('loadData', {total:data.length,rows:data}).datagrid('getPager').pagination('select',1);
		}else{
			$('#RegionCfgList').datagrid({loadFilter:pagerFilter}).datagrid('loadData',{total:0,rows:[]});
		}
	}

	
	

	function getFormObj(){
		var obj = $("#RegionCfgForm").getJSON().RegionCfgForm;
//		obj.cellCfgList=$('#Select_CellcfgList').datagrid('getRows');
/*		for (var i=0;i<obj.cellCfgList.length;i++){
			for (var p in obj.cellCfgList[i]) {
				if (p=='updatetime'){
					obj.cellCfgList[i][p]="";
				}
			}
		}*/
		return obj;
	}

	function reLoadGridData(queryObj){
		RegionCfgAction.getRegionCfgList(queryObj,function(result){
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
	var cityid=$("#RegionCfgForm\\:cityCode").val();
	var countyid=$("#RegionCfgForm\\:countyCode");
	dwr.engine.setAsync(false);
	RegionCfgAction.getAreasList(cityid,function(data){
		countyid.empty();
		if(null==data || null==data.returnList)return;
		countyid.prepend("<option value='0'>全部</option>");
		for (var i=0;i<data.returnList.length;i++) {
	    countyid.append("<option value='"+ data.returnList[i]['areaid']+"'>"+ data.returnList[i]['areas'] +"</option>");
		}
	});
	dwr.engine.setAsync(true);
}
	
	function RegionCfgAdd(){
		$('#Select_CellcfgList').datagrid('loadData',{total:0,rows:[]});
		$('#RegionCfgForm').clear();
		//临时添加 add by cxf 2014-05-08 添加景区时默认
		$('#RegionCfgForm\\:expediteValue').val(5000);
		$('#RegionCfgForm\\:jamValue').val(20000);
	//	loadJingquSelect('RegionCfgForm',1);
		$('#RegionCfgDialog').dialog({
			title:'新增景区配置',
			modal:true,
			buttons:[{
				text:'确定',
				iconCls:'icon-ok',
				handler:RegionCfgCreate
			},{
				text:'取消',
				handler:function(){
					$('#RegionCfgDialog').dialog('close');
				}
			}],
			closed:false
		});
	}
	
	function RegionCfgCreate(){
		var obj=getFormObj();
		var reg = /[\u3002|\uff1f|\uff01|\uff0c|\u3001|\uff1b|\uff1a|\u201c|\u201d|\u2018|\u2019|\uff08|\uff09|\u300a|\u300b|\u3008|\u3009|\u3010|\u3011|\u300e|\u300f|\u300c|\u300d|\ufe43|\ufe44|\u3014|\u3015|\u2026|\u2014|\uff5e|\ufe4f|\uffe5]/;
	//	obj['typeid']=$("#RegionCfgForm\\:typeid").combobox("getValue");
		if(!jQuery.form("#RegionCfgForm").validate())return;
		
		if(reg.test(obj.regionName)) {
            showMsg("景区名称不能包含非法字符！");
            return;
        }
        var reges=/[`~!@#\$%\^\&\*\(\)_\+<>\?:"\{\},\.\\\/;'\[\]]/im; 
        if(reges.test(obj.notes)) {
            showMsg("备注不能包含非法字符！");
            return;
        }
		if(reg.test(obj.notes)) {
            showMsg("备注不能包含非法字符！");
            return;
        }
        var reges=/[`~!@#\$%\^\&\*\(\)_\+<>\?:"\{\},\.\\\/;'\[\]]/im; 
        if(reges.test(obj.regionName)) {
            showMsg("景区名称不能包含非法字符！");
            return;
        }
        
        var isJBE = validateFC(obj);
		if(!isJBE){
			alert("通畅人数不能大于拥挤人数！");
			return;
		}
		var isOrdernumber = verify(obj);
			if(!isOrdernumber){
			alert("序号只能为一位小数或整数！");
			return;
		}
        
		RegionCfgAction.createRegionCfg(obj,function(result){
			if(result.resultCode=="0"){
				query();
				$('#RegionCfgDialog').dialog('close');
			}else if (result.resultCode=="-2") {
				showMsg("景区编号重复!");
			}else{
				showMsg("创建景区时出错，可能原因为：\n"+result.resultMessage);
			}
		});
	}
	
	function RegionCfgEdit(){
		var rows = $('#RegionCfgList').datagrid('getSelections');
		if (rows.length<=0) {
			showMsg("请先选择需要修改的景区!");
			return;
		}
		if (rows.length>1) {
			showMsg("不能同时修改多个景区!");
			return;
		}
		//初始化数据
		$("#RegionCfgForm").setJSON({RegionCfgForm:rows[0]});
		var cityid=$("#RegionCfgForm\\:cityCode").val();
		var countyid=$("#RegionCfgForm\\:countyCode");
		dwr.engine.setAsync(false);
		RegionCfgAction.getAreasList(cityid,function(data){
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
		$('#RegionCfgDialog').dialog({
			title:'修改景区配置',
			modal:true,
			buttons:[{
				text:'确定',
				iconCls:'icon-ok',
				handler:RegionCfgUpdate
			},{
				text:'取消',
				handler:function(){
					$('#RegionCfgDialog').dialog('close');
				}
			}],
			closed:false
		});
	}
	
	function RegionCfgUpdate(){
		var obj=getFormObj();
		if(!jQuery.form("#RegionCfgForm").validate())return;
	//	obj['typeid']=$("#RegionCfgForm\\:typeid").combobox("getValue");
	//	if (obj['typeid']=='') {
	//		showMsg("景区类型必填!");
	//		return;
	//	}
	var reg = /[\u3002|\uff1f|\uff01|\uff0c|\u3001|\uff1b|\uff1a|\u201c|\u201d|\u2018|\u2019|\uff08|\uff09|\u300a|\u300b|\u3008|\u3009|\u3010|\u3011|\u300e|\u300f|\u300c|\u300d|\ufe43|\ufe44|\u3014|\u3015|\u2026|\u2014|\uff5e|\ufe4f|\uffe5]/;
		if(reg.test(obj.regionName)) {
            showMsg("景区名称不能包含非法字符！");
            return;
        }
        var reges=/[`~!@#\$%\^\&\*\(\)_\+<>\?:"\{\},\.\\\/;'\[\]]/im; 
        if(reges.test(obj.notes)) {
            showMsg("备注不能包含非法字符！");
            return;
        }
		if(reg.test(obj.notes)) {
            showMsg("备注不能包含非法字符！");
            return;
        }
        var reges=/[`~!@#\$%\^\&\*\(\)_\+<>\?:"\{\},\.\\\/;'\[\]]/im; 
        if(reges.test(obj.regionName)) {
            showMsg("景区名称不能包含非法字符！");
            return;
        }
        
        var isJBE = validateFC(obj);
		if(!isJBE){
			alert("通畅人数不能大于拥挤人数！");
			return;
		}
		
		var isOrdernumber = verify(obj);
			if(!isOrdernumber){
			alert("序号只能为一位小数或整数！");
			return;
		}
	
		RegionCfgAction.updateRegionCfg(obj,function(result){
			if(result.resultCode=="0"){
				$('#RegionCfgDialog').dialog('close');
				var queryObj=treeSelectCach==null?queryFormCach:treeSelectCach;
				reLoadGridData(queryObj);
			}else if (result.resultCode=="-2") {
				showMsg("景区编号重复!");
			}else{
				showMsg("更新时出错，可能原因为：\n"+result.resultMessage);
			}
		});
	}
	
	function RegionCfgDel(){
		var rows = $('#RegionCfgList').datagrid('getSelections');
		if (rows.length<=0) {
			showMsg("请先选择需要删除的景区!");
			return;
		}
		confirmMsg('确认需要删除这些景区吗?', function(isdel){
			if(isdel){
				var objs=new Array();
				for(var i=0;i<rows.length;i++){
					objs.push({id:rows[i].id});
				}
				RegionCfgAction.batchDeleteRegionCfg(objs,function(result){
					if(result.resultCode=="0"){
						var queryObj=treeSelectCach==null?queryFormCach:treeSelectCach;
						reLoadGridData(queryObj);
					}else{
						showMsg("删除景区时出错，可能原因为：\n"+result.resultMessage);
					}
				});
			}			
		});
	}
	function loadJingquSelect(form,param1){
		// 景区类型下拉框
		RegionTypeCfgAction.getAllRegionTypeCfg(function(result){
			if(result.resultCode=="0"){
				var options=new Array();
				for(var i=0;i<result.returnList.length;i++){
					var newOption={
							id:result.returnList[i].id,
							text:result.returnList[i].typename
							};
					options.push(newOption);
				}
	//			$('#'+form+'\\:typeid').combobox('loadData',options);
				if (param1==1){
		//			$('#'+form+'\\:typeid').combobox('select',options[0].id);
				} 
			}else{
				showMsg("加载景区类型数据时出错，可能原因为：\n"+result.resultMessage);
			}
		});
	}
	//页面上移除选择的小区数据SelectCfg
	function SelectCfgDel(){
		var rows = $('#Select_CellcfgList').datagrid('getSelections');
		if (rows.length<=0) {
			showMsg("请先选择需要删除的!");
			return;
		}
		for(var i =rows.length;i > 0;i--){
			var index = $('#Select_CellcfgList').datagrid('getRowIndex',rows[i-1]);
			$('#Select_CellcfgList').datagrid('deleteRow',index);
		}
	}
	
	//小区列表数据
	function CellCfgAppend(){
		chooseCellCfg(CellCfgAppendBack);
	}
	//小区列表数据
	function CellCfgAppendBack(oldRows){
		var rows=copyObjList(oldRows);
		//处理选择后的行
		var cellCfgList=$('#Select_CellcfgList').datagrid('getRows');
		var flag = "true";
		for (var i=0;i<rows.length;i++){
			for(var j = 0;j<cellCfgList.length;j++){
				if (cellCfgList[j]['cell']+(cellCfgList[j]['celltype']+"")==rows[i]['cell']+(rows[i]['celltype']+"")){
					flag = "false";
				}
			}
			if(flag == "true"){
				$('#Select_CellcfgList').datagrid('appendRow',rows[i]);
			}
			flag = "true";
		}
	}
	
	//对比通畅人数与拥挤人数
	function validateFC(obj){
		var expediteValue = obj.expediteValue;
		var jamValue = obj.jamValue;
		if(parseInt(expediteValue)<parseInt(jamValue)){
			return true;
		}else{
			return false;
		}
	}
	
	//判断新增或修改的序号是否符合数据库对应字段（只能输入一位小数或整数，且有效数字为12！）
	function verify(obj){
		var str = obj.orderNumber;
		if(str.match(/^(\d{1,12})(\.\d{1})?$/)){
			return true;
		}
		else {
			return false;
		}
	}
//--------------------界面操作 end ------------------------

</script>