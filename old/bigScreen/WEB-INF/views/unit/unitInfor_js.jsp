<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript">
	/******************************************************单位管理信息配置函数**************************************************************/
	var tableUnit = "";//定义单位信息表

	var updateunid = "";//定义需要用到得主键id，方便修改等

	var deleteunid = "";//定义需要用到的主键id，方便删除逻辑的实现
	
	var flagStatus = "";//定义需要用到的启用禁用状态
	
	var searchCity = "";
	
	var searchArea = "";
	
	var searchUnitName = "";
	
	var searchFlag = "";
	
	var unid ="";
	
	var md5password1 = "";//修改时记录查询出来的数据库md5的密码
	
	var md5password2 = "";//修改时记录查询出来的数据库md5的确认密码

	
	//判断浏览器是否支持 placeholder属性
	function isPlaceholder(){
	    var input = document.createElement('input');
	    return 'placeholder' in input;
	}
	//初始化页面函数
	$(document).ready(function() {
		if(!isPlaceholder()){
			$("#searchUnitName").each(//把input绑定事件 排除password框
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
            $("input").not("input[type='hidden']").each(
                        function() {
    	                    var pwdField    = $(this);
                        	if(pwdField.val() =="" ||undefined || null){
    	                        var pwdVal      = pwdField.attr('placeholder');
    	                        pwdField.after('<input  style="color:grey;width:50%" class="inputMain fl loginFalseMsg loginInput paddwordBg" type="text" value='+pwdVal+' autocomplete="off" />');
    	                        var pwdPlaceholder = $(this).siblings('.loginFalseMsg');
    	                        pwdPlaceholder.show();
    	                        pwdField.hide();
    	
    	                        pwdPlaceholder.focus(function(){
    	                            pwdPlaceholder.hide();
    	                            pwdField.show();
    	                            pwdField.focus();
    	                        });
    	
    	                        pwdField.blur(function(){
    	                            if(pwdField.val() == '') {
    	                                pwdPlaceholder.show();
    	                                pwdField.hide();
    	                            }
    	                        });
                            }
                        });
        }
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
		$('.sel2').select2();
		initTable();
		$('[data-toggle="tooltip"]').tooltip();
	});
	
	function initTable() {
		tableUnit = $("#table-unit")
				.DataTable(
						{
							"dom" : 'lfT<"clearfix">tipr',//自定义显示项
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
								"sInfoThousands" : ",",
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
							searching : false, //原生默认搜索框
							paging : true, //开始表格分页
							deferRender : false, //延迟渲染
							//bStateSave : true,	//操作数据后显示在当前页面
							aLengthMenu : [ [ 5, 10, 20, -1 ],
									[ 5, 10, 20, "所有" ] ], //定义每页的数据显示条数
							iDisplayLength : 5, //默认页面每页展示条数 (pageLength: 2 ,//每页显示数据条数--与这个属性相同)
							iDisplayStart : 0, //默认开始从第几条数据开始显示

							ajax : {
								//指定数据源
								url : "<%=path%>/unit/getUnits.html",
								"data": function ( d ) {//向后台传递参数，需要时后台可以接收使用
								 	d.searchFlag = searchFlag;
								 	d.searchCity = searchCity;
								 	d.searchArea = searchArea;
								 	d.searchUnitName = searchUnitName;
								 }
							},
							columns : [
									{
										"data" : "name"
									},
									{
										"data" : "username"
									},
									{
										"data" : "phone"
									},
									{
										"data" : "cityname"
									},
									{
										"data" : "areaname"
									},
									{
										"data" : "scenicname"
									},
									{
										"data" : "unid",
										"render" : function(data, type, full,
												meta) {
											if(full.delflag == "启用"){
												data ="<div class="+"'listThreeButton'" + ">"
													+ "<div class="+"fl" +">"
													+ "<a data-toggle="
													+ "'modal' " 
													+ "data-toggle='tooltip' "
													+ "data-placement='bottom' " 
													+ "title='修改单位' "
													+ "href="
													+ "'#showAddUnit' "
													+ "id=\""
													+ full.unid
													+ "\" "
													+ "class="
													+ "'table-link' "
													+ "onclick="
													+ "sendUnid(\""
													+ full.unid
													+ "\","+"\""
													+ full.name
													+ "\","
													+ "\""
													+ full.username
													+ "\")"//使用转译字符进行转译
													+ ">"
													+ "<img src=" + "../img/xiugai.png" +">"+"</img>"
													+ "</a>"
													+ "</div>"
													+ "<div class="+"fl" +">"
													+ "<a data-toggle="
													+ "'modal'"
													+ "data-toggle='tooltip' "
													+ "data-placement='bottom' " 
													+ "title='菜单配置' "
													+ "href='#myMenu'"
													+ " class="
													+ "'table-link'"
													+ "onclick="
													+ "_editMenu(\""
													+ full.unid
													+ "\")"
													+ ">"
													+ "<img src=" + "../img/peizhi.png" +">"+"</img>"
													+ "</a>"
													+ "</div>"
													+ "<div class="+"fl" +">"
													+ "<a data-toggle="
													+ "'modal'"
													+ "data-toggle='tooltip' "
													+ "data-placement='bottom' " 
													+ "title='停用该单位用户' "
													+ "href='#updateStatusConfirm'"
													+ " class="
													+ "'table-link danger'"
													+ "onclick="
													+ "changeStatus(\""
													+ full.unid
													+ "\","
													+ "\""
													+ full.delflag
													+ "\")"
													+ ">"
													+ "<img src=" + "../img/jinyong.png" +">"+"</img>"
													+ "</a>"
													+ "</div>"
													+ "</div>";
											;
											return data;
											}else if(full.delflag == "停用"){
												data = "<div class="+"listThreeButton" +">"
													+ "<div class="+"fl" +">"
													+ "<a data-toggle="
													+ "'modal' " 
													+ "data-toggle='tooltip' "
													+ "data-placement='bottom' " 
													+ "title='停用的单位用户不可修改' "
													+ "href="
													+ "'#' "
													+ "class="
													+ "'table-link' "
													+ ">"
													+ "<img src=" + "../img/xiugaihui.png" +">"+"</img>"
													+ "</a>"
													+ "</div>"
													+ "<div class="+"fl" +">"
													+ "<a data-toggle="
													+ "'modal'"
													+ "data-toggle='tooltip' "
													+ "data-placement='bottom' " 
													+ "title='停用的单位用户不可配置菜单' "
													+ "href='#'"
													+ " class="
													+ "'table-link'"
													+ "style="+"'cursor:default'"
													+ ">"
													+ "<img src=" + "../img/peizhihui.png" +">"+"</img>"
													+ "</a>"
													+ "</div>"
													+ "<div class="+"fl" +">"
													+ "<a data-toggle="
													+ "'modal'"
													+ + "style="+"'cursor:default'"
													+ "data-toggle='tooltip' "
													+ "data-placement='bottom' " 
													+ "title='启用该单位用户' "
													+ "href='#updateStatusConfirm'"
													+ " class="
													+ "'table-link danger'"
													+ "onclick="
													+ "changeStatus(\""
													+ full.unid
													+ "\","
													+ "\""
													+ full.delflag
													+ "\")"
													+ ">"
													+ "<img src=" + "../img/qiyong.png" +">"+"</img>"
													+ "</a>"
													+ "</div>"
													+ "</div>";
											;
											return data;
											}
										}
									} ]
						});
		return tableUnit;
	}

	//改变单位状态函数
	function changeStatus(unid,delflag) {
		$("#comfirmMsg").empty();
		if(delflag=="启用"){
			$("#comfirmMsg").html("停用该单位用户");
		}else if(delflag=="停用"){
			$("#comfirmMsg").html("启用该单位用户");
		}
		deleteunid = unid;
		flagStatus = delflag;
	}

	//执行改变单位状态函数（相当于伪删除）
	function deleteUnit() {
		unid = deleteunid;
		delflag = flagStatus;
		$.ajax({
			url : "<%=path%>/unit/pseudoDeleteUnit.html",//伪删除
			type : "POST",
			dataType : "json",
			async : true,
			data : {
				unid : unid,
				delflag : delflag
			},
			success : function(data) {
				tableUnit.ajax.reload(null, false);//括号里的两个参数配置：刷新表格数据，分页信息不会重置
				toastr.success(data.result);
			},
			error : function(data) {
				toastr.error(data.result);
			}
		});
	}
	
	function areaChange() {
		$("#area").empty();
		$("#area").append("<option value='0'>全部</option>");
		var cityId = $("#city").val();
		if (cityId == "340000") {
			$("#area").attr("disabled", "disabled");
			$("#scence").attr("disabled", "disabled");
		} else {
			$("#area").attr("disabled", false);
			$("#scence").attr("disabled", false);
		}
		$.ajax({
			type : "post",
			dataType : "json",
			url : "${home}/unit/getAreaBycityId.html?cityid=" + cityId,
			async : false,
			success : function(data) {
				for (var i = 0; i < data.length; i++) {
					$("#area").append(
							"<option  class='areaSelecter' value='"+data[i].areaid+"'>"
									+ data[i].areas + "</option>");
				}
				$("#area").select2("val", 0);
			}
		});
		scienceChange();
	}
	
	//模糊查询
	function searchUnit(){
		searchFlag = $("#searchFlag").val();
		searchCity = $("#searchCity").val();
		searchArea = $("#searchArea").val();
		searchUnitName = $("#searchUnitName").val();
		if(searchUnitName == "请输入单位名称"){
			searchUnitName = "";
		}
		//salert(searchCity+searchArea+searchUnitName+searchFlag);
		tableUnit.ajax.url("<%=path%>/unit/searchUnit.html").load();//改变url重新获取数据源
	}
	
	//搜索区域省市区县级联函数
	function searchCityChange(){
		$("#searchArea").empty();
		$("#searchArea").append("<option value='0'>区/县</option>");
		var cityId = $("#searchCity").val();
		$.ajax({
			type : "post",
			dataType : "json",
			url : "${home}/unit/getAreaBycityId.html?cityid=" + cityId,
			async : false,
			success : function(data) {
				for (var i = 0; i < data.length; i++) {
					$("#searchArea").append(
							"<option  class='areaSelecter' value='"+data[i].areaid+"'>"
									+ data[i].areas + "</option>");
				}
				$("#searchArea").select2("val", 0);
			}
		});
	}
	
//##############################################菜单配置控制函数开始#########################################
	/*
	 * 根据父id获取子菜单
	 */
	function getSubMenu(punid){
		$.ajax({
			url:"<%=path%>/unit/getSubMenu.html",
			type: "post",
			dataType: "json",
			data:{"punid":punid},
		    success: function (data){
		    	$.each(data, function(index,values){
	                $.each(values,function(index2,value){   //"<button class='btn btn-default' value='"+value.unid+"'>"+value.name+"</button>"
	                    //$("#menu"+punid).append("<button class='btn btn-default' name='buttonMenu'  onclick='this.blur();' value='"+value.unid+"'>"+value.name+"</button>"); 
	                $("#submenu"+punid).append("<div class='chooseButton fl'><button class='parButton parButtonActive' id='"+value.unid+"' onclick='getCheckMenu("+value.unid+","+punid+")'  name='buttonMenu' value='"+value.unid+"'>"+value.name+"</button></div>");
	                });  
	            });  
		    }
	});
	}

	/**
	 * 点击子菜单确认选中
	 */
	function getCheckMenu(id,punid){
		if(!$("#"+id).hasClass("parButtonActive")){
			$("#"+id).addClass("parButtonActive");
			}else{
			$("#"+id).removeClass("parButtonActive");
			}
		
		if($("#"+id).parent().siblings().find("button").hasClass("parButtonActive")||$("#"+id).hasClass("parButtonActive")){
			if(!$("#menu"+punid).hasClass("parButtonActive")){
			 $("#menu"+punid).addClass("parButtonActive"); 
			}
		}else{
			$("#menu"+punid).removeClass("parButtonActive"); 
		}
	}

	/**
	 * 获取旧的菜单id
	 */
	function getOldMenu(){
	var userid=	$("#usermenuid").val();
	var menuids=document.getElementsByName("buttonMenu");
		$.ajax({
			url:"<%=path%>/unit/getoldMenu.html",
			type: "post",
			dataType: "json",
			data:{"userid":userid},
		    success: function (data){
		    	
		    	for(var i = 0; i < menuids.length; i++){
		    		menuids[i].setAttribute("class","parButton");
		    	}
		    	
		    	$.each(data, function(index,values){  
	                $.each(values,function(index2,value){
	                for(var i = 0; i < menuids.length; i++){
	                	if(menuids[i].value==value.menuid){
	                	menuids[i].setAttribute("class","parButton parButtonActive");  
	                	}
	                }
	                });  
	            }); 
		    }
	});
	}
	/**
	 * 设置菜单
	 */
	function _editMenu(id){
		$("#usermenuid").val(id);//
		$("#getMenu").empty();
		$("#getSubMenu").empty();
		$.ajax({
			url:"<%=path%>/unit/getParentMenu.html",
			type: "post",
			dataType: "json",
		    success: function (data){
		    	$.each(data, function(index,values){   // 解析出data对应的Object数组  
	                $.each(values,function(index2,value){   // 遍历Object数组 ，每个对象的值存放在value ，index2表示为第几个对象  
	                  //  $("#getMenu").append("<div class='btn-group' id='menu"+value.unid+"' data-toggle='buttons-checkbox'><button class='btn btn-default'  name='buttonMenu'  onclick='this.blur();'  value='"+value.unid+"'>"+value.name+"</button></div></br>"); 
	                	$("#getMenu").append("<div class='chooseButton fl parList'><button class='parButton parButtonActive' id='menu"+value.unid+"'  name='buttonMenu' value='"+value.unid+"' onclick='chosenOpenOrCheck(\""+value.unid+"\");'>"+value.name+"</button></div>");
	                	$("#getSubMenu").append("<div id='submenu"+value.unid+"' class='system childList'></div>");
	                  getSubMenu(value.unid);
	                    
	                });  
	            }); 
		    	setTimeout(function(){ 
		    		getOldMenu();
		    		},500); 
		    	
		    	}, error: function (error) {
		        console.log(error);
		    }
			
		});
		//$("#myMenu").modal("show");

	} 
	
	
	/**
	 * 根据父菜单是否有子菜单来判断展开还是选中
	 */
	 function chosenOpenOrCheck(parentid){
	   if($('#submenu'+parentid).html() == "") { 
		 if(!$("#menu"+parentid).hasClass("parButtonActive")){
			 $("#menu"+parentid).addClass("parButtonActive"); 
		 }else{
			 $("#menu"+parentid).removeClass("parButtonActive"); 
		 } 
		}else{
		openSubMenu(parentid);	
		}
	}
	/**
	 * 点击父菜单展现子菜单
	 */
	function openSubMenu(parentid){
	         			if(!$("#menu"+parentid).hasClass("parButtonLink")){
	         				$("#menu"+parentid).addClass("parButtonLink");
	         				$('#submenu'+parentid).removeClass("childList");
	         				$('#submenu'+parentid).addClass("systemLink");
	         				$('#submenu'+parentid).siblings().addClass("childList");
	         				$('#submenu'+parentid).siblings().removeClass("systemLink");
	         				$("#menu"+parentid).parent().siblings().find("button").removeClass("parButtonLink");
	         			}else{
	         				$("#menu"+parentid).addClass("parButtonActive");
	         				$("#menu"+parentid).removeClass("parButtonLink");
	         				$('#submenu'+parentid).removeClass("systemLink");
	         				$('#submenu'+parentid).addClass("childList");
	         			}	
	}

	/**
	 * 保存菜单配置
	 */
	function editMenu(){
		var usermenuid=$("#usermenuid").val();
		var menuid=document.getElementsByName("buttonMenu");
		var menuvalues =new Array();
		for ( var i = 0; i < menuid.length; i++) {
			var menuClass=menuid[i].getAttribute("class").indexOf("parButtonActive");
			if (menuClass>0){
				menuvalues.push(menuid[i].value);
			}
			}
		$.getJSON('saveMenuUnit.html', {
			menuvalue : menuvalues.join(','),
			userid:usermenuid
		}, function(result) {
			if (result.success) {
				$("#myMenu").modal("hide");
				toastr.success("操作成功");
				tableUnit.ajax.reload(null,false);
			}
		});
	}
//##############################################菜单配置控制函数结束#########################################
</script>