<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript">
	/******************************************************景区告警阈值信息配置函数**************************************************************/
	var tableScenic = "";//定义景区信息表
	var updateunid = "";//定义需要用到得主键id，方便修改等
	var deleteunid = "";//定义需要用到的主键id，方便删除逻辑的实现
	var serachScenicName = "";
	var searchCity = "";
	var updateScenicId = "";//修改景区记录未修改的景区id（景区编号）
	
	function defaultTip(){
		$.ajaxSetup({  
				    contentType : "application/x-www-form-urlencoded;charset=utf-8",  
				    complete : function(XMLHttpRequest, textStatus) {  
				        // 通过XMLHttpRequest取得响应头，sessionstatus  
				        var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");  
				        if (sessionstatus == "timeout") {
				        	parent.location.replace(XMLHttpRequest.getResponseHeader("redirectUrl"));
				        }  
				    }  
				});
			 
			 if (!isPlaceholder()) {//不支持placeholder 用jquery来完成
			        $(document).ready(function() {
			            if(!isPlaceholder()){
			                $("input").not("input[type='password']").each(//把input绑定事件 排除password框
			                        function(){
			                            if($(this).val()=="" && $(this).attr("placeholder")!=""){
			                                $(this).val($(this).attr("placeholder"));
			                                $(this).focus(function(){
			                                    if($(this).val()==$(this).attr("placeholder")) $(this).val("");
			                                });
			                                $(this).blur(function(){
			                                    if($(this).val()=="") $(this).val($(this).attr("placeholder"));
			                                });
			                            }
			                        });
			            }
			        });
	
			    }
			 
			$('.sel2').select2();
			initTable();
	}
	
	//初始化页面函数
	$(document).ready(function() {
		 defaultTip();
	});
	
	//判断浏览器是否支持 placeholder属性
    function isPlaceholder(){
        var input = document.createElement('input');
        return 'placeholder' in input;
    }
	
	//表格初始化
	function initTable() {
		tableScenic = $("#table-scenic")
				.DataTable(
						{
							"dom" : 'lfT<"clearfix">tipr',//自定义显示项，用来控制datatables元素
							//国际化配置
							language : {
								"sProcessing" : "处理中...",
								"sLengthMenu" : "显示 _MENU_ 项记录",
								"sZeroRecords" : "没有匹配结果",
								"sInfo" : "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
								"sInfoEmpty" : "显示第 0 至 0 项结果，共 0 项",
								"sInfoFiltered" : "(由 _MAX_ 项结果过滤)",
								"sInfoPostFix" : "",
								"sSearch" : "搜索:",
								"sUrl" : "",
								"sEmptyTable" : "表中数据为空",
								"sLoadingRecords" : "载入中...",
								//"sInfoThousands" : ",",
								"oPaginate" : {
									"sFirst" : "首页",
									"sPrevious" : "上页",
									"sNext" : "下页",
									"sLast" : "末页"
								},
								"oAria" : {
									"sSortAscending" : ": 以升序排列此列",
									"sSortDescending" : ": 以降序排列此列"
								}
							},
							bLengthChange: false,   //去掉每页显示多少条数据方法
							pagingType : "full_numbers", //显示首页和末页
							bAutoWidth : false, //禁用自动调整列宽
							//stripeClasses : ["odd", "even"],//为奇偶行加上样式，兼容不支持CSS伪类的场合
							ordering : false, //全局启用排序
							bProcessing : true, //关闭加载提示
							bServerSide : false, //不启用服务器端分页
							searching : false, //隐藏原生默认搜索框
							paging : true, //开始表格分页
							deferRender : false, //延迟渲染
							//bStateSave : true,	//操作数据后显示在当前页面
							aLengthMenu : [ [ 5, 10, 20, -1 ],
									[ 5, 10, 20, "所有" ] ], //定义每页的数据显示条数
							iDisplayLength : 5, //默认页面每页展示条数 (pageLength: 2 ,//每页显示数据条数--与这个属性相同)
							iDisplayStart : 0, //默认开始从第几条数据开始显示
							ajax : {
								//指定数据源
								type : "POST",
								"url" : "<%=path%>/scenic/getScenics.html",
								"data": function ( d ) {//向后台传递参数，需要时后台可以接收使用
							        d.serachScenicName = serachScenicName;
							        d.searchCity = searchCity;
							    }
							},
							order : [ [ 6, "asc" ] //对第七个字段即排序字段sortNum设置为默认升序排序
							],
							columns : [
									{
										"data" : "scenicid"
									//"orderable" : false		//对某一个字段禁止排序
									},
									{
										"data" : "cityname"
									},
									{
										"data" : "countyname"
									},
									{
										"data" : "scenicName"
									},
									{
										"data" : "key"
									},
									{
										"data" : "level1Num"
									},
									{
										"data" : "level2Num"
									},
									{
										"data" : "level3Num"
									},
									{
										"data" : "level4Num"
									},
									{
										"data" : "sortNum"
									},
									{
										"data" : "unid",
										"render" : function(data, type, full,
												meta) {

											data = "<a data-toggle="
													+ "'modal' " 
													+ "data-toggle='tooltip' "
													+ "data-placement='bottom' " 
													+ "title='修改景区' "
													+ "href="
													+ "'#showUpdateScence' "
													+ "class="
													+ "'table-link' "
													+ "onclick="
													+ "updateModify(\""
													+ full.unid
													+ "\")"//使用转译字符进行转译
													+ ">"
													+ "<img src="+"../img/xiugai.png" +">"+"</img>"
													+ "</a>"
													+ "	"
													+ "<a data-toggle="
													+ "'modal'"
													+ "data-toggle='tooltip' "
													+ "data-placement='bottom' " 
													+ "title='删除景区' "
													+ "href='#'"
													+ " class="
													+ "'table-link danger'"
													+ "onclick="
													+ "confirmDelete(\""
													+ full.unid
													+ "\")"
													+ ">"
													+ "<img src=" + "../img/shanchu.png" +">"+"</img>"
													+ "</a>";

											return data;

										}
									} ]
						});
		return tableScenic;
	}
	
	//模糊查询函数
	function searchScenic(){
		serachScenicName = $("#searchScenicName").val();
		if(serachScenicName=="请输入景区名称"){
			serachScenicName = "";
		}
		searchCity = $("#searchCity").val();
		tableScenic.ajax.url("<%=path%>/scenic/searchScenic.html").load();//改变url重新获取数据源
	}

	//添加
	$("#saveSubmit").click(
			function() {
				if (!beforeSave(true)) {
					return false;
				}
				$
						.ajax({
							url : "<%=path%>/scenic/saveScenic.html",
							dataType : "json",
							type : "POST",
							async : true,
							data : {
								sortNum : $("#sortNum").val(),
								scenicName : $("#scenicName").val(),
								scenicid : $("#scenicid").val(),
								alevel : $("#alevel").val(),
								cityid : $("#cityid").val(),
								countyid : $("#countyid").val(),
								level4_num : $("#level4_num").val(),
								level1_num : $("#level1_num").val(),//一级红色预警
								level2_num : $("#level2_num").val(),
								level3_num : $("#level3_num").val(),
								key : $("#keyScenic").val()
							},
							success : function(data) {
							if('keyError'==data.result){
								toastr.error("重点景区个数不能大于5！");
							}else{
								$("#sortNum").val("");
								$("#scenicName").val("");
								$("#scenicid").val("");
								$("#countyid").select2("val",-1);
								$("#level4_num").val("");
								$("#level2_num").val("");
								$("#level3_num").val("");
								$("#level1_num").val("");
								$("#cityid").select2("val",-1);
								$("#keyScenic").select2("val",-1);
								document.getElementById("keyScenic").value=-1;
								$("#countyid").empty();
								$("#countyid").append(
										"<option value='-1'>" + "请选择"
												+ "</option>");
								$("#showAddScence").modal("hide");
								defaultTip();
								tableScenic.ajax.reload(null, false);//括号里的两个参数配置：刷新表格数据，分页信息不会重置
								toastr.success(data.result);
								}
							},
							error : function(data) {
								toastr.error("添加景区信息失败，请重新尝试添加！");
							}
						});
			});

	//确认删除函数
	function confirmDelete(unid) {
		deleteunid = unid;
		$("#delcfmModel").modal("show");
	}
	//删除函数(点击删除按钮触发事件)
	function deleteScenic() {
		unid = deleteunid;
		$.ajax({
			url : "<%=path%>/scenic/pseudoDeleteScenic.html",//伪删除
			dataType : "json",
			type : "POST",
			async : true,
			data : {
				unid : unid
			},
			success : function(data) {
				$("#delcfmModel").modal("hide");
				tableScenic.ajax.reload(null, false);//括号里的两个参数配置：刷新表格数据，分页信息不会重置
				toastr.success(data.result);
			},
			error : function(data) {
				toastr.error(data.result);
			}
		});
	}

	//修改函数（点击修改按钮弹出修改框并查询需要修改的内容并显示）
	function updateModify(uid) {
		updateunid = uid;//记录修改数据的主键id
		$.ajax({
			url : "<%=path%>/scenic/getScenic.html",
			dataType : "json",
			type : "POST",
			async : true,
			data : {
				unid : uid
			},
			success : function(data) {
				var countiesList = data.counties;
				for (var i = 0; i < countiesList.length; i++) {
					$("#countyid2").append(
							"<option value='"+countiesList[i].areaid+"'>"
									+ countiesList[i].areas + "</option>");
				}
				//$("#countyid2").val(data.countyid);
				$("#countyid2").select2("val", data.countyid);
				$("#sortNum2").val(data.sortNum);
				$("#scenicName2").val(data.scenicName);
				$("#scenicid2").val(data.scenicid);
				//$("#alevel2").val(data.alevel);
				$("#alevel2").select2("val", data.alevel);
				//$("#cityid2").val(data.cityid);
				$("#cityid2").select2("val", data.cityid);
				$("#keyScenic2").select2("val", data.key);
				$("#level4_num2").val(data.level4_num);
				$("#level1_num2").val(data.level1_num);
				$("#level2_num2").val(data.level2_num);
				$("#level3_num2").val(data.level3_num);
				updateScenicId = $("#scenicid2").val();
			},
			error : function(data) {
				toastr.error("加载数据出错！");
			}
		});
	}
	//修改函数（点击确定修改按钮触发修改事件）
	$("#updateSubmit").click(function() {
		if (!beforeUpdate(true)) {
			return false;
		}
		$.ajax({
			url : "<%=path%>/scenic/updateScenic.html",
			dataType : "json",
			type : "POST",
			async : true,
			data : {
				unid : updateunid,
				sortNum : $("#sortNum2").val(),
				scenicName : $("#scenicName2").val(),
				scenicid : $("#scenicid2").val(),
				alevel : $("#alevel2").val(),
				cityid : $("#cityid2").val(),
				countyid : $("#countyid2").val(),
				level4_num : $("#level4_num2").val(),
				level1_num : $("#level1_num2").val(),
				level2_num : $("#level2_num2").val(),
				level3_num : $("#level3_num2").val(),
				key : $("#keyScenic2").val()

			},
			success : function(data) {
				if('keyError'==data.result){
					toastr.error("重点景区个数不能大于5！");
				}else{
					$("#updataDismiss").click();
					tableScenic.ajax.reload(null, false);//括号里的两个参数配置：刷新表格数据，分页信息不会重置
					toastr.success(data.result);
				}
			},
			error : function(data) {
				toastr.error("修改景区信息失败，请重新尝试修改！");
			}
		});
	});

	//新增级修改区域下拉框联动函数。根据市级下拉内容联动县级下拉内容.add:表示增加，updata：表示会修改
	function cityChange(flag) {
		var cityid = "";
		if (flag == "add") {
			cityid = $("#cityid").val();
			$("#countyid").empty();
		} else {
			cityid = $("#cityid2").val();
			$("#countyid2").empty();
		}
		$
				.ajax({
					url : "<%=path%>/scenic/getCounties.html",
					dataType : "json",
					type : "POST",
					async : true,
					data : {
						cityid : cityid
					},
					success : function(data) {
						if (flag == "add") {
							if (data == "") {
								$("#countyid").append(
										"<option value='-1'>" + "请选择"
												+ "</option>");
							} else {
								$("#countyid").append(
										"<option value='-1'>" + "请选择"
												+ "</option>");
								for (var i = 0; i < data.length; i++) {
									$("#countyid").append(
											"<option value='"+data[i].areaid+"'>"
													+ data[i].areas
													+ "</option>");
								}
							}
							$("#countyid").select2("val", -1);
						} else {
							if (data == "") {
								$("#countyid2").append(
										"<option value='-1'>" + "请选择"
												+ "</option>");
							} else {
								$("#countyid2").append(
										"<option value='-1'>" + "请选择"
												+ "</option>");
								for (var i = 0; i < data.length; i++) {
									$("#countyid2").append(
											"<option value='"+data[i].areaid+"'>"
													+ data[i].areas
													+ "</option>");
								}
							}
							$("#countyid2").select2("val", -1);
						}
					},
					error : function(data) {
						toastr.error("获取地市内容出错！");
					}
				});
	}

	//修改时点击取消按钮触发函数
	function updataDismiss() {
		$("#countyid2").empty();//将动态的区县清空，防止出现多次查询结果
	}
	//添加时点击取消按钮触发函数
	function addDismiss() {
		$("#sortNum").val("");
		$("#scenicName").val("");
		$("#scenicid").val("");
		$("#countyid").val("");
		$("#level4_num").val("");
		$("#level1_num").val("");
		$("#level2_num").val("");
		$("#level3_num").val("");
		$("#keyScenic").select2("val", -1);
		$("#cityid").select2("val", -1);
		$("#countyid").empty();
		$("#countyid").append("<option value='-1'>" + "请选择" + "</option>");
	}
	
	//判断新增或修改的序号是否符合数据库对应字段（只能输入非负整数！）
	function verify(sortnum) {
		var str = sortnum;
		if (str.match(/^\d+$/)) {
			return true;
		} else {
			return false;
		}
	}
	
	//新增时对比通畅人数与拥挤人数
	function validateFC(){
		var level4_num = $("#level4_num").val();
		var level1_num = $("#level1_num").val();
		var level2_num = $("#level2_num").val();
		var level3_num = $("#level3_num").val();
		if((parseInt(level4_num)<parseInt(level3_num)) && (parseInt(level3_num)<parseInt(level2_num)) && (parseInt(level2_num)<parseInt(level1_num))){
			return true;
		}else{
			return false;
		}
	}
	//修改时对比通畅人数与拥挤人数
	function validateFC2(){
		var level4_num = $("#level4_num2").val();
		var level3_num = $("#level3_num2").val();
		var level2_num = $("#level2_num2").val();
		var level1_num = $("#level1_num2").val();
		if((parseInt(level4_num)<parseInt(level3_num)) && (parseInt(level3_num)<parseInt(level2_num)) && (parseInt(level2_num)<parseInt(level1_num))){
			return true;
		}else{
			return false;
		}
	}
	
	//景区预警阈值添加时自动补全函数添加框
	function levelAddCompletion(obj){
		if(obj == '4' && $("#level3_num").val() == '' && $("#level2_num").val() == '' && $("#level1_num").val() == ''){
			var level4_num = $("#level4_num").val();
			if(level4_num != ''){
				$("#level3_num").val(parseInt(level4_num*2));
				$("#level2_num").val(parseInt(level4_num*3));
				$("#level1_num").val(parseInt(level4_num*4));
			}
		}
		if(obj == '3' && $("#level4_num").val() == '' && $("#level2_num").val() == '' && $("#level1_num").val() == ''){
			var level3_num = $("#level3_num").val();
			if(level3_num !=''){
				$("#level4_num").val(parseInt(level3_num/2));
				$("#level2_num").val(parseInt(level3_num*2));
				$("#level1_num").val(parseInt(level3_num*3));
			}
		}
		if(obj == '2' && $("#level4_num").val() == '' && $("#level3_num").val() == '' && $("#level1_num").val() == ''){
			var level2_num = $("#level2_num").val();
			if(level2_num != ''){
				$("#level4_num").val(parseInt(level2_num/3));
				$("#level3_num").val(parseInt(level2_num/2));
				$("#level1_num").val(parseInt(level2_num*2));
			}
		}
		if(obj == '1'){
			var level1_num = $("#level1_num").val();
			if(level1_num != ''){
				$("#level4_num").val(parseInt(level1_num/4));
				$("#level3_num").val(parseInt(level1_num/3));
				$("#level2_num").val(parseInt(level1_num/2));
			}else{
				$("#level4_num").val('');
				$("#level3_num").val('');
				$("#level2_num").val('');
			}
		}
		if($("#level4_num").val() == 'NaN'){
			$("#level4_num").val('');
		}
		if($("#level3_num").val() == 'NaN'){
			$("#level3_num").val('');
		}
		if($("#level2_num").val() == 'NaN'){
			$("#level2_num").val('');
		}
		if($("#level1_num").val() == 'NaN'){
			$("#level1_num").val('');
		}
	}
	
	//景区预警阈值修改时自动补全函数添加框
	function levelUpdateCompletion(obj){
		if(obj == '4' && $("#level3_num2").val() == '' && $("#level2_num2").val() == '' && $("#level1_num2").val() == ''){
			var level4_num = $("#level4_num2").val();
			if(level4_num != ''){
				$("#level3_num2").val(parseInt(level4_num*2));
				$("#level2_num2").val(parseInt(level4_num*3));
				$("#level1_num2").val(parseInt(level4_num*4));
			}
		}
		if(obj == '3' && $("#level4_num2").val() == '' && $("#level2_num2").val() == '' && $("#level1_num2").val() == ''){
			var level3_num = $("#level3_num").val();
			if(level3_num !=''){
				$("#level4_num2").val(parseInt(level3_num/2));
				$("#level2_num2").val(parseInt(level3_num*2));
				$("#level1_num2").val(parseInt(level3_num*3));
			}
		}
		if(obj == '2' && $("#level4_num2").val() == '' && $("#level3_num2").val() == '' && $("#level1_num2").val() == ''){
			var level2_num = $("#level2_num2").val();
			if(level2_num != ''){
				$("#level4_num2").val(parseInt(level2_num/3));
				$("#level3_num2").val(parseInt(level2_num/2));
				$("#level1_num2").val(parseInt(level2_num*2));
			}
		}
		if(obj == '1'){
			var level1_num = $("#level1_num2").val();
			if(level1_num != ''){
				$("#level4_num2").val(parseInt(level1_num/4));
				$("#level3_num2").val(parseInt(level1_num/3));
				$("#level2_num2").val(parseInt(level1_num/2));
			}else{
				$("#level4_num2").val('');
				$("#level3_num2").val('');
				$("#level2_num2").val('');
			}
		}
		if($("#level4_num2").val() == 'NaN'){
			$("#level4_num2").val('');
		}
		if($("#level3_num2").val() == 'NaN'){
			$("#level3_num2").val('');
		}
		if($("#level2_num2").val() == 'NaN'){
			$("#level2_num2").val('');
		}
		if($("#level1_num2").val() == 'NaN'){
			$("#level1_num2").val('');
		}
	}

	//添加前验证表单信息函数
	function beforeSave(flag) {
		var savaFlag = flag;
		var scenicid = $("#scenicid").val();
		if ($("#sortNum").val() == "" || $("#sortNum").val() == "请输入序号") {
			$("#sortNum").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "输入序号",
				bg : "red", //背景色，默认为红色
				time : 1
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#sortNum").focus();
			savaFlag = false;
			return savaFlag;
		} else if (verify($("#sortNum").val()) == false) {
			$("#sortNum").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "景区序号为非负整数",
				bg : "red", //背景色，默认为红色
				time : 1
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#sortNum").focus();
			savaFlag = false;
			return savaFlag;
		} else if ($("#scenicName").val() == "" || $("#scenicName").val() == "请输入景区名称") {
			$("#scenicName").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "输入景区名称",
				bg : "red", //背景色，默认为红色
				time : 1
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#scenicName").focus();
			savaFlag = false;
			return savaFlag;
		} else if ($("#scenicid").val() == "" || $("#scenicid").val() == "请输入景区编号") {
			$("#scenicid").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "输入景区编号",
				bg : "red", //背景色，默认为红色
				time : 1
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#scenicid").focus();
			savaFlag = false;
			return savaFlag;
		} else if ($("#alevel").val() == "") {
			$("#alevel").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "输入景区级别",
				bg : "red", //背景色，默认为红色
				time : 1
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#alevel").focus();
			savaFlag = false;
			return savaFlag;
		} else if ($("#keyScenic").val() == "-1") {
			$("#keyScenicDiv").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "选择是否为重点景区",
				bg : "red", //背景色，默认为红色
				time : 1
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#keyScenicDiv").focus();
			savaFlag = false;
			return savaFlag;
		} else if ($("#cityid").val() == "-1") {
			$("#cityiddiv").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "选择景区城市",
				bg : "red", //背景色，默认为红色
				time : 1
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#cityiddiv").focus();
			savaFlag = false;
			return savaFlag;
		}else if ($("#countyid").val() == "-1") {
			$("#countyiddiv").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "选择景区区县",
				bg : "red", //背景色，默认为红色
				time : 1
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#countyiddiv").focus();
			savaFlag = false;
			return savaFlag;
		} else if ($("#level4_num").val() == "" || $("#level4_num").val() == "请输入阈值") {
			$("#level4_num").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "输入蓝色预警阈值",
				bg : "red", //背景色，默认为红色
				time : 1
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#level4_num").focus();
			savaFlag = false;
			return savaFlag;
		} else if ($("#level1_num").val() == "" || $("#level1_num").val() == "请输入阈值") {
			$("#level1_num").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "输入红色预警阈值",
				bg : "red", //背景色，默认为红色
				time : 1
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#level1_num").focus();
			savaFlag = false;
			return savaFlag;
		}else if ($("#level2_num").val() == "" || $("#level2_num").val() == "请输入阈值") {
			$("#level2_num").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "输入橙色预警阈值",
				bg : "red", //背景色，默认为红色
				time : 1
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#level2_num").focus();
			savaFlag = false;
			return savaFlag;
		}else if ($("#level3_num").val() == "" || $("#level3_num").val() == "请输入阈值") {
			$("#level3_num").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "输入黄色预警阈值",
				bg : "red", //背景色，默认为红色
				time : 1
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#level3_num").focus();
			savaFlag = false;
			return savaFlag;
		} else if(!validateFC()){
			$("#level4_num").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "请输入正确阈值范围：红色阈值>橙色阈值>黄色阈值>蓝色阈值",
				bg : "red", //背景色，默认为红色
				time : 1
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#level4_num").focus();
			savaFlag = false;
			return savaFlag;
		} else if(!beforeSaveSceicId(scenicid)){
			$("#scenicid").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "只能有唯一的景区编号",
				bg : "red", //背景色，默认为红色
				time : 1
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#scenicid").focus();
			savaFlag = false;
			return savaFlag;
		} else{
			return true;
		}
	}
	
	//修改前验证表单信息函数
	function beforeUpdate(flag) {
		var savaFlag = flag;
		var scenicid = $("#scenicid2").val();
		if ($("#sortNum2").val() == "" || $("#sortNum2").val() == "请输入序号") {
			$("#sortNum2").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "输入序号",
				bg : "red", //背景色，默认为红色
				time : 1
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#sortNum2").focus();
			savaFlag = false;
			return savaFlag;
		} else if (verify($("#sortNum2").val()) == false) {
			$("#sortNum2").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "景区序号为非负整数",
				bg : "red", //背景色，默认为红色
				time : 1
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#sortNum2").focus();
			savaFlag = false;
			return savaFlag;
		} else if ($("#scenicName2").val() == "" || $("#scenicName2").val() == "请输入景区名称") {
			$("#scenicName2").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "输入景区名称",
				bg : "red", //背景色，默认为红色
				time : 1
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#scenicName2").focus();
			savaFlag = false;
			return savaFlag;
		} else if ($("#scenicid2").val() == "" || $("#scenicid2").val() == "请输入景区编号") {
			$("#scenicid2").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "输入景区编号",
				bg : "red", //背景色，默认为红色
				time : 1
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#scenicid2").focus();
			savaFlag = false;
			return savaFlag;
		} else if ($("#alevel2").val() == "") {
			$("#alevel2").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "输入景区级别",
				bg : "red", //背景色，默认为红色
				time : 1
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#alevel2").focus();
			savaFlag = false;
			return savaFlag;
		}else if ($("#keyScenic2").val() == "-1") {
			$("#keyScenicDiv2").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "选择是否为重点景区",
				bg : "red", //背景色，默认为红色
				time : 1
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#keyScenicDiv2").focus();
			savaFlag = false;
			return savaFlag;
		} else if ($("#cityid2").val() == "-1") {
			$("#cityid2div").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "选择景区城市",
				bg : "red", //背景色，默认为红色
				time : 1
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#cityid2div").focus();
			savaFlag = false;
			return savaFlag;
		} else if ($("#countyid2").val() == "-1") {
			$("#countyid2div").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "选择景区区县",
				bg : "red", //背景色，默认为红色
				time : 1
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#countyid2div").focus();
			savaFlag = false;
			return savaFlag;
		} else if ($("#level4_num2").val() == "" || $("#level4_num2").val() == "请输入阈值") {
			$("#level4_num2").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "输入蓝色预警阈值",
				bg : "red", //背景色，默认为红色
				time : 1
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#level4_num2").focus();
			savaFlag = false;
			return savaFlag;
		} else if ($("#level1_num2").val() == "" || $("#level1_num2").val() == "请输入阈值") {
			$("#level1_num2").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "输入红色预警阈值",
				bg : "red", //背景色，默认为红色
				time : 1
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#level1_num2").focus();
			savaFlag = false;
			return savaFlag;
		}else if ($("#level2_num2").val() == "" || $("#level2_num2").val() == "请输入阈值") {
			$("#level2_num2").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "输入橙色预警阈值",
				bg : "red", //背景色，默认为红色
				time : 1
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#level2_num2").focus();
			savaFlag = false;
			return savaFlag;
		}else if ($("#level3_num2").val() == "" || $("#level3_num2").val() == "请输入阈值") {
			$("#level3_num2").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "输入黄色预警阈值",
				bg : "red", //背景色，默认为红色
				time : 1
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#level3_num2").focus();
			savaFlag = false;
			return savaFlag;
		} else if(validateFC2() == false){
			$("#level4_num2").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "请输入正确阈值范围：红色阈值>橙色阈值>黄色阈值>蓝色阈值",
				bg : "red", //背景色，默认为红色
				time : 1
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#level4_num2").focus();
			savaFlag = false;
			return savaFlag;
		} else if(updateScenicId != $("#scenicid2").val()){//修改时判断景区编号是否唯一，景区编号未修改时保证正常保存
			if(!beforeSaveSceicId(scenicid)){
				$("#scenicid2").tips({
					side : 3, //1,2,3,4 分别代表 上右下左
					msg : "只能有唯一的景区编号",
					bg : "red", //背景色，默认为红色
					time : 1
				//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
				});
				$("#scenicid2").focus();
				savaFlag = false;
				return savaFlag;
			}
		} else {
			return true;
		}
	}
	//验证scenicid是否已经存在
	function beforeSaveSceicId(scenicid){
		var flag = true;
		$.ajax({
			url : "<%=path%>/scenic/beforeSaveSceicId.html",
			type : "POST",
			async : false,
			data : {
				scenicId : scenicid
			},
			success : function(data) {
				if(data == "success"){
					flag = true;
				}else{
					flag = false;
				}
			},
			error : function(data) {
				toastr.error("加载数据出错！");
				flag = false;
			}
		});
		return flag;
	}
</script>