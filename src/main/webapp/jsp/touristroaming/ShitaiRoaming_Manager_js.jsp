<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<script type="text/javascript">
	var queryFormCach=null;
	var treeSelectCach=null;
	$(function(){

		//创建列表
				$("#ShitaiRoamingList").datagrid({
			title:'石台漫游数据统计',
			idField:'unid',
			singleSelect : false,
            height : getViewportHeight()-55,
            fitColumns : true, 
			columns:[[
	{field:'provinceName',title:'所属省/市',width:100},
	{field:'passengerCount',title:'漫游旅客（人次）',width:100},
	{field:'touristsCount',title:'漫游游客（人次）',width:100},
	{field:'overnightCount',title:'漫游过夜（人次）',width:100},
	{field:'touristsRate',title:'游客转化率',width:100},
	{field:'overnightRate',title:'过夜转化率',width:100}
			]]
		});
					
		//初始化表单元素
		initForm();
		
	});//结束初始化函数

//--------------------初始化和公用方法 start ------------------------
	function initForm(){
		$("#btn_query").click(query);
		$("#btn_reset").click(reset);
		//$("#btn_exp").click(downloadExcel);
		query();
	}
	

	//查询
	function query(){
		$('#ShitaiRoamingList').datagrid('unselectAll');
		var date = $("#ShitaiRoamingQueryForm\\:statMonth").val();
		var currentdate = new Date();
		currentdate.setMonth(currentdate.getMonth());//调整月份为当前月份前一个月
		var month=currentdate.getMonth()+1;
		if (""==date) {
			var datestr = currentdate.getFullYear().toString()+"-"
			  +(month<10?(0+""+month):month).toString();
			date = datestr;
			$("#ShitaiRoamingQueryForm\\:statMonth").val(date);
		}
		var touristtype=$("#ShitaiRoamingQueryForm\\:touristtype").val();
		var queryObj = {
				statmonth:date,
				touristtype:touristtype,
				codeGenerator:'codeGenerator'
					};
		treeSelectCach=null;
		queryFormCach=queryObj;
		
		reLoadGridData(queryObj);
	}

	function reset(){
		$("#ShitaiRoamingQueryForm\\:statMonth").val('');
		var currentdate = new Date();
		currentdate.setMonth(currentdate.getMonth());//调整月份为当前月份前一个月
		var month=currentdate.getMonth()+1;
		var datestr = currentdate.getFullYear().toString()+"-"
		  +(month<10?(0+""+month):month).toString();
		$("#ShitaiRoamingQueryForm\\:statMonth").val(datestr);
		$("#ShitaiRoamingQueryForm\\:touristtype").val(0);
	}
	
	//加载表格数据
	function loadData(data){
		$('#ShitaiRoamingList').datagrid('unselectAll');
		if(data!=null && data.length>0){
			$('#ShitaiRoamingList').datagrid('loadData', {total:data.length,rows:data});
		}else{
			$('#ShitaiRoamingList').datagrid('loadData',{total:0,rows:[]});
		}
	}
	
	function getFormObj(){
		var obj = $("#ShitaiRoamingForm").getJSON().ShitaiRoamingForm;
		return obj;
	}

	function reLoadGridData(queryObj){
		TouristRoamingAction.getShitaiRoamingList(queryObj,function(result){
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
	    var number ="1,2,3";
		var tempObject=queryFormCach;
		TouristRoamingAction.expExcelShiTai(queryFormCach,number,function(result){
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
