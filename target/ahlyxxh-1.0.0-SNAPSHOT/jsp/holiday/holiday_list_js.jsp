<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<script type="text/javascript">
//解决IE8不支持trim方法
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
		
		initHolidayList();

		//创建列表
    $("#HolidayList").datagrid({
			title:'节假日管理',
			idField:'id',
			singleSelect : false,
            pagination : true,
            height : getViewportHeight()-60,
            fitColumns : true,
			frozenColumns:[[
			                {field:'ck',checkbox:true}
						]],
			columns:[[
	{field:'holidayName',title:'假日名称',width:130},	
	{field:'firstDay',title:'开始日期',width:130,formatter: function(value,row){return  value.substr(0,10);}},
	{field:'lastDay',title:'结束日期',width:130,formatter: function(value,row){return  value.substr(0,10);}},
	{field:'holidayDays',title:'假期天数',width:130},
	{field:'beloneYear',title:'年份',width:130},
	{field:'codeGenerator',title:'codeGenerator',width:0,hidden:true}
			]],
			toolbar:[{
				text:'添加',
				iconCls:'icon-add',
				handler:HolidayAdd
			},{
				text:'修改',
				iconCls:'icon-edit',
				handler:HolidayEdit
			},{
				text:'删除',
				iconCls:'icon-remove',
				handler:HolidayDel
			}],
			onDblClickRow:HolidayEdit
		});
					
		//创建编辑对话框
		$('#HolidayDialog').dialog({
			title:'新增节假日',
			modal:true,
			buttons:[{
				text:'确定',
				iconCls:'icon-ok',
				handler:function(){
					
				}
			},{
				text:'取消',
				handler:function(){
					$('#HolidayDialog').dialog('close');
				}
			}],
			closed:true
		});

		//初始化表单元素
		initForm();
		
	});//结束初始化函数
	
	
	function initHolidayList(){
		var cityids = $("#HolidayQueryForm\\:holidayName");
		//var Obj=new Object();
		dwr.engine.setAsync(false);
		HolidayAction.getAll(function(data){
			if(null==data || null==data.returnList)return;
			cityids.prepend("<option value=''>请选择</option>");
			for (var i=0;i<data.returnList.length;i++) {
			cityids.append("<option value='"+ data.returnList[i]['holidayName']+"'>"+ data.returnList[i]['holidayName'] +"</option>");
			}
		});
		dwr.engine.setAsync(true);
	}

//--------------------初始化和公用方法 start ------------------------
	function initForm(){
		$("#btn_query").click(query);
		$("#btn_reset").click(reset);
		query();
	}

	//查询
	function query(){
		$('#HolidayList').datagrid('unselectAll');
		var queryObj = {
	id:$("#HolidayQueryForm\\:id").val(),
	holidayName:$("#HolidayQueryForm\\:holidayName").val(),//combobox('getValue')
	beloneYear:$("#HolidayQueryForm\\:beloneYear").val(),
	
    codeGenerator:'codeGenerator'
					};
		treeSelectCach=null;
		queryFormCach=queryObj;
		reLoadGridData(queryObj);
	}

	function reset(){
		$("#HolidayQueryForm\\:id").val('');
		$("#HolidayQueryForm\\:holidayName").val('');//combobox('setValue','')
		$("#HolidayQueryForm\\:beloneYear").val('');
		//reLoadGridData(null);
		
	}
	
	//加载表格数据
	function loadData(data){
		$('#HolidayList').datagrid('unselectAll');
		if(data!=null && data.length>0){
			$('#HolidayList').datagrid({loadFilter:pagerFilter}).datagrid('loadData', {total:data.length,rows:data}).datagrid('getPager').pagination('select',1);
		}else{
			$('#HolidayList').datagrid({loadFilter:pagerFilter}).datagrid('loadData',{total:0,rows:[]});
		}
	}

    function getFormObj(){
		//var obj = $("#HolidayForm").getJSON().HolidayForm;
		 var obj={
			 id:$("#HolidayForm\\:id").val(),		
			 holidayName: $("#HolidayForm\\:holidayName").combobox('getValue'),//combobox('getValue')
			 firstDay:$("#HolidayForm\\:firstDay").val(),
			 lastDay:$("#HolidayForm\\:lastDay").val(),
			 holidayDays:$("#HolidayForm\\:holidayDays").val()
	        }
		//alert(JSON.stringify(obj));
		return obj;
	}

	function reLoadGridData(queryObj){
		HolidayAction.getHolidayList(queryObj,function(result){
				if(result.resultCode=="0"){
					loadData(result.returnList);
				}else{
					showMsg("加载节假日表列表数据时出错，可能原因为：\n"+result.resultMessage);
				}
			});
	}

	
//--------------------初始化和公用方法 start ------------------------
//--------------------界面操作 start ------------------------
	
	function HolidayAdd(){
		$('#HolidayForm').clear();

		$('#HolidayDialog').dialog({
			title:'新增节假日',
			modal:true,
			buttons:[{
				text:'确定',
				iconCls:'icon-ok',
				handler:HolidayCreate
			},{
				text:'取消',
				iconCls:'icon-cancel',
				handler:function(){
					$('#HolidayDialog').dialog('close');
				}
			}],
			closed:false
		});
	}
	
	function HolidayCreate(){
	 var obj={
			 id:$("#HolidayForm\\:id").val(),		
			 holidayName: $("#HolidayForm\\:holidayName").combobox('getValue'),//combobox('getValue')
			 firstDay:$("#HolidayForm\\:firstDay").val(),
			 lastDay:$("#HolidayForm\\:lastDay").val(),
			 holidayDays:$("#HolidayForm\\:holidayDays").val()
	        }
	    var re = /^[\u4e00-\u9fa5a-z]+$/gi;
	   if(!re.test($("#HolidayForm\\:holidayName").combobox('getValue'))){
		   showMsg("假期名称不能包含特殊字符!");
		   return;
	   }
	    if( $("#HolidayForm\\:holidayName").combobox('getValue').length>6){
	    	 showMsg("假期名称不能超过6个汉字!");
			 return;
	    }
	    if(isNaN($("#HolidayForm\\:holidayDays").val())||$("#HolidayForm\\:holidayDays").val().length<=0){
	    	showMsg("假期天数必须是数字!");
			return;
		}
		if(!jQuery.form("#HolidayForm").validate())return;
		HolidayAction.getHolidayListByName(obj,function(result){
			if(result.returnList!=null&&result.returnList.length>0){
				showMsg("你添加的假日已存在！");
			}else{
				HolidayAction.createHoliday(obj,function(result){
					if(result.resultCode=="0"){
						query();
						$('#HolidayDialog').dialog('close');
						parent.$.messager.show({
								title : '成功',
								msg : '创建成功',
								timeout : 1000 * 2
							});
					}else{
						showMsg("创建节假日时出错，可能原因为：\n"+result.resultMessage);
					}
				});	
			}
		});
		
	}
	
	function HolidayEdit(index,rowData){
		var rows = new Array();
		if(null!=rowData){
			rows.push(rowData);
		}else{
			rows=$('#HolidayList').datagrid('getSelections');
		}
		if (rows.length<=0) {
			showMsg("请先选择需要修改的节假日!");
			return;
		}
		if (rows.length>1) {
			showMsg("不能同时修改多个节假日!");
			return;
		}
		//初始化数据
		//$("#HolidayForm").setJSON({HolidayForm:rows[0]});
		$("#HolidayForm\\:id").val(rows[0].id);
		$("#HolidayForm\\:holidayName").combobox('setValue',rows[0].holidayName);
		$("#HolidayForm\\:firstDay").val(rows[0].firstDay.substr(0,10));
		$("#HolidayForm\\:lastDay").val(rows[0].lastDay.substr(0,10));
		$("#HolidayForm\\:holidayDays").val(rows[0].holidayDays);
	    $('#HolidayDialog').dialog({
			title:'修改节假日',
			modal:true,
			buttons:[{
				text:'确定',
				iconCls:'icon-ok',
				handler:HolidayUpdate
			},{
				text:'取消',
				iconCls:'icon-cancel',
				handler:function(){
					$('#HolidayDialog').dialog('close');
				}
			}],
			closed:false
		});
	}
	
	function HolidayUpdate(){
		var obj=getFormObj();
		if(!jQuery.form("#HolidayForm").validate())return;
		HolidayAction.updateHoliday(obj,function(result){
			if(result.resultCode=="0"){
				$('#HolidayDialog').dialog('close');
				parent.$.messager.show({
					title : '成功',
					msg : '修改成功',
					timeout : 1000 * 2
				});
				var queryObj=treeSelectCach==null?queryFormCach:treeSelectCach;
				reLoadGridData(queryObj);
			}else{
				showMsg("更新节假日时出错，可能原因为：\n"+result.resultMessage);
			}
		});
	}
	
	function HolidayDel(){
		var rows = $('#HolidayList').datagrid('getSelections');
		if (rows.length<=0) {
			showMsg("请先选择需要删除的节假日!");
			return;
		}
		confirmMsg('确认需要删除这些节假日吗?', function(isdel){
			if(isdel){
				var objs=new Array();
				for(var i=0;i<rows.length;i++){
					objs.push({id:rows[i].id});
				}
				HolidayAction.batchDeleteHoliday(objs,function(result){
					if(result.resultCode=="0"){
						parent.$.messager.show({
							title : '成功',
							msg : '删除成功',
							timeout : 1000 * 2
						});
						var queryObj=treeSelectCach==null?queryFormCach:treeSelectCach;
						reLoadGridData(queryObj);
					}else{
						showMsg("删除节假日时出错，可能原因为：\n"+result.resultMessage);
					}
				});
			}			
		});
	}


  function getHolidayNum(){
	  
	var firstDay=$("#HolidayForm\\:firstDay").val();
	var	lastDay=$("#HolidayForm\\:lastDay").val();
	
	var holidayNum=DateDiff(firstDay,lastDay);
	
	$('#HolidayForm\\:holidayDays').numberbox('setValue', holidayNum);
	
	} 
  
  function DateDiff(sDate1, sDate2) {  //sDate1和sDate2是yyyy-MM-dd格式

	    //var aDate, oDate1, oDate2, iDays;
	    aDate = sDate1.split("-");
	    oDate1 = new Date(aDate[1] + '-' + aDate[2] + '-' + aDate[0]);  //转换为yyyy-MM-dd格式
	   
	    aDate = sDate2.split("-");
	    oDate2 = new Date(aDate[1] + '-' + aDate[2] + '-' + aDate[0]);
	    
	    iDays = parseInt(Math.abs(oDate1 - oDate2) / 1000 / 60 / 60 / 24)+1; //把相差的毫秒数转换为天数 
	   /*  var sDate=new Date(sDate1);
	    alert(sDate+"开始时间："+sDate.getTime());
	    var eDate=new Date(sDate2);
	    alert(sDate+"开始时间："+sDate.getTime());
	    var iDays =parseInt(Math.abs((eDate.getTime()-sDate.getTime()) / 1000 / 60 / 60 / 24))+1; */
	    return iDays;  //返回相差天数
	}

	
//--------------------界面操作 end ------------------------

</script>