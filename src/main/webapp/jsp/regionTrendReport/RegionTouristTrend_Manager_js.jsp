<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<script type="text/javascript">
	var queryFormCach=null;
	var treeSelectCach=null;
	$(function(){

		//初始化表单元素
		initForm();
		$("#tabs").tabs({
			border:false,
			height:getViewportHeight()-50,
			onSelect:function(){
				query();
			}
		});
		
	});//结束初始化函数

//--------------------初始化和公用方法 start ------------------------
	function initForm(){
		$("#btn_query").click(query);
		$("#btn_exp").click(downloadExcel);
		regionList();
		query();
	}

	//查询
	function query(){
		var queryObj = {
				regionid:$("#RegionTouristTrendQueryForm\\:regionid").val(),
				codeGenerator:'codeGenerator'
					};
		treeSelectCach=null;
		queryFormCach=queryObj;
		
		reLoadGridData(queryObj);
	}
	
	//加载表格数据
	function loadData(data){
		$('#RegionTouristTrendList').datagrid('unselectAll');
		if(data!=null && data.length>0){
			$('#RegionTouristTrendList').datagrid('loadData', {total:data.length,rows:data});
		}else{
			$('#RegionTouristTrendList').datagrid('loadData',{total:0,rows:[]});
		}
	}

	

	function getFormObj(){
		var obj = $("#RegionTouristTrendForm").getJSON().RegionTouristTrendForm;
		return obj;
	}

	function reLoadGridData(queryObj){
		hiddenDiv("RegionTouristTrendListCHART");
		hiddenDiv("RegionTouristTrendListLine");
		createSubDiv("RegionTouristTrendListCHART",0);
		createSubDiv("RegionTouristTrendListLine",0);
		RegionTouristTrendAction.getEchartJsonStr(function(result){
				var height = document.documentElement.clientHeight-108;
				try{
					var barOption = eval("(" + result[0] + ")");
					var barDiv = document.getElementById("RegionTouristTrendListCHART0");
					barDiv.style.height=height+"px";
					var barChart = echarts.init(barDiv);
					barChart.clear();
					barChart.setOption(barOption)
				}catch(e){}
				try{
					var lineOption = eval("(" + result[1] + ")");
					var lineDiv = document.getElementById("RegionTouristTrendListLine0");
					lineDiv.style.height=height+"px";
					var lineChart = echarts.init(lineDiv);
					lineChart.clear();
					lineChart.setOption(lineOption);
				}catch(e){}
			});
	}


	//安徽演示
		function downloadExcel(){
				RegionTouristTrendAction.expExcel(queryFormCach,function(result){
					if(result.resultCode=="0"){
						var fileName=result.returnObject[1]+".xls";
						fileDownload(fileName);
					}else{
						showMsg("导出Excel时出错，可能原因为：\n"+result.resultMessage);
					}
				});
			}
			
//--------------------初始化和公用方法 start ------------------------
//--------------------界面操作 start ------------------------
	
	function regionList11111111(){
		var regionid = document.getElementById("RegionTouristTrendQueryForm:regionid");
		removeAllOptions();//删除已有的option
		dwr.engine.setAsync(false);
		UtilsAction.getMyRegionCfgByOrgCode(591,null,function(data){
			if(null==data || null==data.returnList)return;
			for (var i=0;i<data.returnList.length;i++) {
				var varItem = new Option(data.returnList[i]['regionName'],data.returnList[i]['id']);
				regionid.options.add(varItem);
			}
		});
		dwr.engine.setAsync(true);
	}
	
	function regionList(){
		var regionid = document.getElementById("RegionTouristTrendQueryForm:regionid");
		removeAllOptions();//删除已有的option
		var varItem1 = new Option("黄山景区(5A)","190001");
		regionid.options.add(varItem1);

	}
	
	/*删除select控件中所有的options*/
	function removeAllOptions(){
		var region = document.getElementById("RegionTouristTrendQueryForm:regionid");
		var length = region.options.length;
		if(length>0){
			for(var i=0;i<length;i++){
				region.removeChild(region.options[region.options.length-1]);
			}
		}
	}
	/** 隐藏显示柱状图的显示的画板 */
	function hiddenDiv(divId){
		 var allDiv = document.getElementById(divId);
		 while(allDiv.firstChild){
			  var oldNode =allDiv.removeChild(allDiv.firstChild);
			  oldNode = null;
		 }
	}
	/**创建子div*/
	function createSubDiv(divId, ind) {
		var allDiv = document.getElementById(divId);
		var divobj = document.createElement("div");
		divobj.id = divId + ind;
		divobj.style.display = "block";
		allDiv.appendChild(divobj);
	}
	
//--------------------界面操作 end ------------------------

</script>