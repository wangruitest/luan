<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<script type="text/javascript">
	var queryFormCach=null;
	var treeSelectCach=null;
	$(function(){

		//创建列表
				$("#TouristRoamingList").datagrid({
			title:'境外入皖漫游用户统计',
			idField:'unid',
			singleSelect : false,
            height : getViewportHeight()-55,
            fitColumns : true, 
			frozenColumns:[[
			                {field:'ck',checkbox:false}
						]],
			columns:[[
	{field:'provinceName',title:'省份',width:100},
	{field:'totalCount',title:'漫游用户数（人次）',width:100},
	{field:'areaName',title:'各市',width:100},
	{field:'areaCount',title:'漫游用户数（人次）',width:100}
			]]
		});
					
		//初始化表单元素
		initForm();
		
	});//结束初始化函数

//--------------------初始化和公用方法 start ------------------------
	function initForm(){
		$("#btn_query").click(query);
		$("#btn_reset").click(reset);
		$("#btn_exp").click(downloadExcel);
		query();
	}

	//查询
	function query(){
		$('#TouristRoamingList').datagrid('unselectAll');
		var date = $("#TouristRoamingQueryForm\\:statMonth").val();
		var currentdate = new Date();
		currentdate.setMonth(currentdate.getMonth());//调整月份为当前月份前一个月
		var month=currentdate.getMonth()+1;
		if (""==date) {
			var datestr = currentdate.getFullYear().toString()+"-"
			  +(month<10?(0+""+month):month).toString();
			date = datestr;
			$("#TouristRoamingQueryForm\\:statMonth").val(date);
		}
		var queryObj = {
				statMonth:date,
				codeGenerator:'codeGenerator'
					};
		treeSelectCach=null;
		queryFormCach=queryObj;
		
		reLoadGridData(queryObj);
	}

	function reset(){
		$("#TouristRoamingQueryForm\\:statMonth").val('');
		var currentdate = new Date();
		currentdate.setMonth(currentdate.getMonth());//调整月份为当前月份前一个月
		var month=currentdate.getMonth()+1;
		var datestr = currentdate.getFullYear().toString()+"-"
		  +(month<10?(0+""+month):month).toString();
		$("#TouristRoamingQueryForm\\:statMonth").val(datestr);
	}
	
	//加载表格数据
	function loadData(data){
		$('#TouristRoamingList').datagrid('unselectAll');
		if(data!=null && data.length>0){
			$('#TouristRoamingList').datagrid('loadData', {total:data.length,rows:data});
		}else{
			$('#TouristRoamingList').datagrid('loadData',{total:0,rows:[]});
		}
	}
	
	function getFormObj(){
		var obj = $("#TouristRoamingForm").getJSON().TouristRoamingForm;
		return obj;
	}

	function reLoadGridData(queryObj){
		TouristRoamingAction.getTouristRoamingList(queryObj,function(result){
				if(result.resultCode=="0"){
					loadData(result.returnList);
				}else if(result.resultCode=="2"){
					loadData(result.returnList);
					alert("该月份未查询到统计数据！");
				}else{
					showMsg("加载国际手机用户漫游入闽情况列表数据时出错，可能原因为：\n"+result.resultMessage);
				}
			});
	}
	
	function downloadExcel(){
		var tempObject=queryFormCach;
		TouristRoamingAction.expExcel(queryFormCach,function(result){
			if(result.resultCode=="0"){
				var fileName=result.returnObject[1]+".xls";
				fileDownload(fileName);
			}else if(result.resultCode=="2"){
				alert("输入的统计月份没有查询到统计数据，无数据导出！");
			}else{
				showMsg("导出Excel时出错，可能原因为：\n"+result.resultMessage);
			}
		});
	}
</script>