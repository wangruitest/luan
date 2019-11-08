<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<script type="text/javascript">
    var titleArr=[];
	var queryFormCach = null;
	var treeSelectCach = null;
	$(function() {
		titleArr=cityListInit();
		titleArr.unshift({field:'cityname',title:'所属省/市',width:10},	{field:'sumroam',title:'总数',width:10});
		//创建列表
		$("#TouristRoamingInList").datagrid({
			title : '本省漫游用户在皖统计',
			idField : 'unid',
			singleSelect : false,
			height : getViewportHeight() - 125,
			fitColumns : true,
			columns : [ /*[ {
				field : 'areaname',
				title : '所属市',
				width : 10,
				hidden : false
			}, {
				field : 'sumroam',
				title : '漫游总数',
				width : 10,
				hidden : false
			}, {
				field : 'hfroam',
				title : '漫游合肥',
				width : 10,
				hidden : false
			}, {
				field : 'whroam',
				title : '漫游芜湖',
				width : 10,
				hidden : false
			}, {
				field : 'bbroam',
				title : '漫游蚌埠',
				width : 10,
				hidden : false
			}, {
				field : 'hnroam',
				title : '漫游淮南',
				width : 10,
				hidden : false
			}, {
				field : 'masroam',
				title : '漫游马鞍山',
				width : 10,
				hidden : false
			}, {
				field : 'hbroam',
				title : '漫游淮北',
				width : 10,
				hidden : false
			}, {
				field : 'tlroam',
				title : '漫游铜陵',
				width : 10,
				hidden : false
			}, {
				field : 'aqroam',
				title : '漫游安庆',
				width : 10,
				hidden : false
			}, {
				field : 'hsroam',
				title : '漫游黄山',
				width : 10,
				hidden : false
			}, {
				field : 'chuzroam',
				title : '漫游滁州',
				width : 10,
				hidden : false
			}, {
				field : 'fyroam',
				title : '漫游阜阳',
				width : 10,
				hidden : false
			}, {
				field : 'szroam',
				title : '漫游宿州',
				width : 10,
				hidden : false
			}, {
				field : 'laroam',
				title : '漫游六安',
				width : 10,
				hidden : false
			}, {
				field : 'hzroam',
				title : '漫游亳州',
				width : 10,
				hidden : false
			}, {
				field : 'chizroam',
				title : '漫游池州',
				width : 10,
				hidden : false
			}, {
				field : 'xcroam',
				title : '漫游宣城',
				width : 10,
				hidden : false
			}, {
				field : 'codeGenerator',
				title : 'codeGenerator',
				width : 0,
				hidden : true
			} ]*/
			 titleArr
			 ]
		});
		//初始化表单元素
		initForm();

	});//结束初始化函数

	//--------------------初始化和公用方法 start ------------------------
	function initForm() {
		$("#btn_query").click(query);
		$("#btn_reset").click(reset);
		$("#btn_exp").click(downloadExcel);
		selectProvinces();
		query();
	}

	function resetCitys() {
		for (var j = 0; j < 16; j++) {
			$('input[type="checkbox"][name="citys"]').get(j).checked = false;
		}
	}

	function selectProvinces() {
		for (var j = 0; j < 16; j++) {
			$('input[type="checkbox"][name="provinces"]').get(j).checked = true;
		}
	}

	function setTitle() {
		var hfshow = true;
		var whshow = true;
		var bbshow = true;
		var hnshow = true;
		var masshow = true;
		var hbshow = true;
		var tlshow = true;
		var aqshow = true;
		var hsshow = true;
		var chuzshow = true;
		var fyshow = true;
		var szshow = true;
		var lashow = true;
		var hzshow = true;
		var chizshow = true;
		var xcshow = true;
		for (var index = 0; index < $("#mdd_bar_2 input").length; index++) {
			var checkFlag = $("#mdd_bar_2 input").get(index).checked;
			if (checkFlag) {
				switch (index) {
				case 0:
					lashow = false;
					break;
				case 1:
					whshow = false;
					break;
				case 2:
					bbshow = false;
					break;
				case 3:
					hnshow = false;
					break;
				case 4:
					masshow = false;
					break;
				case 5:
					hbshow = false;
					break;
				case 6:
					tlshow = false;
					break;
				case 7:
					aqshow = false;
					break;
				case 8:
					hsshow = false;
					break;
				case 9:
					chuzshow = false;
					break;
				case 10:
					fyshow = false;
					break;
				case 11:
					szshow = false;
					break;
				case 12:
					hfshow = false;
					break;
				case 13:
					hzshow = false;
					break;
				case 14:
					chizshow = false;
					break;
				case 14:
					xcshow = false;
					break;
				}
			}
		}
	
$("#TouristRoamingInList").datagrid({
			title : '本省漫游用户在皖统计',
			idField : 'unid',
			singleSelect : false,
			height : getViewportHeight() - 125,
			fitColumns : true,
			columns : [ /*[ {
				field : 'areaname',
				title : '所属省/市',
				width : 10,
				hidden : false
			}, {
				field : 'sumroam',
				title : '到皖总数',
				width : 10,
				hidden : false
			}, {
				field : 'laroam',
				title : '漫游六安',
				width : 10,
				hidden : lashow
			}, {
				field : 'whroam',
				title : '漫游芜湖',
				width : 10,
				hidden : whshow
			}, {
				field : 'bbroam',
				title : '漫游蚌埠',
				width : 10,
				hidden : bbshow
			}, {
				field : 'hnroam',
				title : '漫游淮南',
				width : 10,
				hidden : hnshow
			}, {
				field : 'masroam',
				title : '漫游马鞍山',
				width : 10,
				hidden : masshow
			}, {
				field : 'hbroam',
				title : '漫游淮北',
				width : 10,
				hidden : hbshow
			}, {
				field : 'tlroam',
				title : '漫游铜陵',
				width : 10,
				hidden : tlshow
			}, {
				field : 'aqroam',
				title : '漫游安庆',
				width : 10,
				hidden : aqshow
			}, {
				field : 'hsroam',
				title : '漫游黄山',
				width : 10,
				hidden : hsshow
			}, {
				field : 'chuzroam',
				title : '漫游滁州',
				width : 10,
				hidden : chuzshow
			}, {
				field : 'fyroam',
				title : '漫游阜阳',
				width : 10,
				hidden : fyshow
			}, {
				field : 'szroam',
				title : '漫游宿州',
				width : 10,
				hidden : szshow
			}, {
				field : 'hfroam',
				title : '漫游合肥',
				width : 10,
				hidden : hfshow
			}, {
				field : 'hzroam',
				title : '漫游亳州',
				width : 10,
				hidden : hzshow
			}, {
				field : 'chizroam',
				title : '漫游池州',
				width : 10,
				hidden : chizshow
			}, {
				field : 'xcroam',
				title : '漫游宣城',
				width : 10,
				hidden : xcshow
			}, {
				field : 'codeGenerator',
				title : 'codeGenerator',
				width : 0,
				hidden : true
			} ] */
			
		 titleArr  ]
		});

	}

	//查询
	function query() {
		$('#TouristRoamingInList').datagrid('unselectAll');
		var date = $("#TouristRoamingInQueryForm\\:statMonth").val();
		var currentdate = new Date();
		currentdate.setMonth(currentdate.getMonth());//调整月份为当前月份前一个月
		var month = currentdate.getMonth() + 1;
		if ("" == date) {
			var datestr = currentdate.getFullYear().toString() + "-"
					+ (month < 10 ? (0 + "" + month) : month).toString();
			date = datestr;
			$("#TouristRoamingInQueryForm\\:statMonth").val(date);
		}

		//获取来源地选项
		var province = "-3,";//-3没有意义，防止来源地都没选时查询语句出错
		$('input[type="checkbox"][name="provinces"]:checked').each(function() {
			province += $(this).val() + ",";
		});
		
		
		 var destination="-1,"
		        titleArr=[{field:'cityname',title:'所属省/市',width:10},{field:'sumroam',title:'总数',width:10}];
				$('input[type="checkbox"][name="ctiys"]:checked').each(
		                function() {
		                	destination+=$(this).val()+","; 
		                	var titleName = $(this).parent().text();
		                	var title = {field:$(this).val(),title:'到达'+titleName,width:10}
		                	titleArr.push(title);
		                }
		            );
		province = province.substring(0, province.length - 1);
		destination=destination.substring(0,destination.length-1);
		var queryObj = {
			searchCity:province,
			searchDestination:destination,
			statmonth:date,
			codeGenerator : 'codeGenerator'
		};
		treeSelectCach = null;
		queryFormCach = queryObj;
		reLoadGridData(queryObj);
	}

	function reset() {
		selectProvinces();
		//resetCitys();
		cityListInit();
		var currentdate = new Date();
		currentdate.setMonth(currentdate.getMonth());//调整月份为当前月份前一个月
		var month = currentdate.getMonth() + 1;
		var datestr = currentdate.getFullYear().toString() + "-"
				+ (month < 10 ? (0 + "" + month) : month).toString();
		$("#TouristRoamingInQueryForm\\:statMonth").val(datestr);
	}

	//加载表格数据
	function loadData(data) {
		$('#TouristRoamingInList').datagrid('unselectAll');
		if (data != null && data.length > 0) {
			$('#TouristRoamingInList').datagrid('loadData', {
				total : data.length,
				rows : data
			});
		} else {
			$('#TouristRoamingInList').datagrid('loadData', {
				total : 0,
				rows : []
			});
		}
	}

	function getFormObj() {
		var obj = $("#TouristRoamingInForm").getJSON().TouristRoamingInForm;
		return obj;
	}

	function reLoadGridData(queryObj) {
		var type=1;
		WebLogoCfgAction.getWebLogoCfg(function(data){
		    	if(data.returnList == null || data.returnList.length <=0){
		    		alert("系统出现错误，请尝试重新登陆！");
		    		return false;
		    	}
	    		if(1==data.returnList[0].ext2||"1"==data.returnList[0].ext2){
	    			type=0;
	    		}else{
	    			type=4;
	    		}
	    	});
		setTitle();
		if (type=0) {
			TouristRoamingOutAction.getTouristRoamingInList(queryObj,function(result){
					if(result.resultCode=="0"){
						loadData(result.returnList);
					}else if(result.resultCode=="2"){
						loadData(result.returnList);
						alert("该月份未查询到统计数据！");
					}else{
						showMsg("加载外省手机用户漫游入闽情况列表数据时出错，可能原因为：\n"+result.resultMessage);
					}
				});
		}else{
		TouristRoamingInAction.getTouristRoamingInList2(queryObj,
				function(result1) {
			       result = eval('(' + result1 + ')'); 
					if (result.resultCode == "0") {
						loadData(result.returnList);
					} else if (result.resultCode == "2") {
						loadData(result.returnList);
						alert("该月份未查询到统计数据！");
					} else {
						showMsg("加载本省手机用户漫游在闽情况列表数据时出错，可能原因为：\n"
								+ result.resultMessage);
					}
				});
	}
	}
	function downloadExcel() {
		TouristRoamingInAction.expExcel2(queryFormCach, function(result) {
			if (result.resultCode == "0") {
				var fileName = result.returnObject[1] + ".xls";
				fileDownload(fileName);
			} else if (result.resultCode == "2") {
				alert("输入的统计月份没有查询到统计数据，无数据导出！");
			} else {
				showMsg("导出Excel时出错，可能原因为：\n" + result.resultMessage);
			}
		});
	}

	//--------------------初始化和公用方法 start ------------------------
	//--------------------界面操作 start ------------------------

	//--------------------界面操作 end ------------------------
</script>