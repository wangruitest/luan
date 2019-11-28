<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="<%=path%>/css/select2.css" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/compiled/theme_styles.css" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/bootstrap/dataTables.bootstrap.css " />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/libs/font-awesome.css" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/libs/nanoscroller.css" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/toastr.css" />
<link href="../js/jquery-easyui-1.3.6/themes/bootstrap/easyui.css" rel="stylesheet">   
<link href="../js/jquery-easyui-1.3.6/themes/icon.css" rel="stylesheet">   
<link href="../js/jquery-easyui-1.3.6/demo/demo.css" rel="stylesheet">   
<link href="<%=path%>/css/caidan.css" rel="stylesheet">   
<link href="<%=path%>/css/kuangjia.css" rel="stylesheet">   
<link href="<%=path%>/css/bootstrap/bootstrap-treeview.css" rel="stylesheet"> 
<script src="<%=path%>/js/jquery.js"></script>
<script src="<%=path%>/js/jquery-easyui-1.3.6/jquery.easyui.min.js"></script>
<script src="<%=path%>/js/bootstrap.js"></script>
<script src="<%=path%>/js/bootstrap-treeview.js"></script> 
<script src="<%=path%>/js/jquery.nanoscroller.min.js"></script>
<script src="<%=path%>/js/demo.js"></script>
<script src="<%=path%>/js/scripts.js"></script>
<script src="<%=path%>/js/jquery.tips.js"></script>
<script src="<%=path%>/js/toastr.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/select2.min.js"></script>
</head>
<style type="text/css">
	.btn-default:active,fieldset[disabled] 
	.btn-default.active{background-color:#fff;border-color:#ccc}
	.btn-default .badge{color:#fff;background-color:#333}
	html { overflow-x:hidden; }
    .listThreeButton div {width:45%}
</style>
<body>
	<!--左侧菜单树显示div  -->
 	<div  style="width: 22%;float:left;" >
 		<div class="conListHead">
			<div class="conListHeadText fl">主菜单</div>
			<div class="conListHeadImg fr"></div>
		</div>
		<div id="tree" style="color:#666666;"></div>
	</div>
	
	<!--右侧div  -->
	<div style="background-color:white; width:78%; float:left;">
		<!--查询菜单及添加按钮区域  -->
		<div class="main-box-body clearfix" style="margin-left: 30px">
		<div id="table-example_wrapper"
			class="dataTables_wrapper form-inline dt-bootstrap no-footer">
			<table id="table-unit"
				class="table table-hover dataTable no-footer table-striped table-bordered"
				role="grid">
				<thead>
					<tr class="tableHead tableList">
								<th rowspan="1" colspan="1" style="width: 25%; text-align:center;color:#ffffff;padding-top:15px;padding-bottom:15px;">菜单名称</th>
								<th rowspan="1" colspan="1" style="width: 20%;text-align:center;color:white;padding-top:15px;padding-bottom:15px;">地址</th>
								<th rowspan="1" colspan="1" style="width: 20%;text-align:center;color:#ffffff;padding-top:15px;padding-bottom:15px;">排序号</th>
								<th rowspan="1" colspan="1" style="width: 15%;text-align:center;color:#ffffff;padding-top:15px;padding-bottom:15px;">状态</th>
								<th rowspan="1" colspan="1" style="width: 20%;text-align:center;color:#ffffff;padding-top:15px;padding-bottom:15px;">操作</th>
							</tr>
						</thead>
						<tbody style="color: #000;font-size:2000px;text-align:center;">
						</tbody>
					</table>
				</div>
		</div>
		
	</div>
		<div class="modal fade" id="updateStatusConfirm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="false">
		<div class="modal-dialog" style="margin-top:10%;width:30%;">
			<div class="modal-content" style="border-radius:5px;border:none;">
				<div class="modal-header addHead">
					<input type="hidden" value="" id="unidOfchangeStatus"></input>
					<input type="hidden" value="" id="statusOfchangeStatus"></input>
					<div type="button" class="fr closeButton" data-dismiss="modal" aria-hidden="true" style="width:15px;height: 15px; background: url(img/close.jpg) no-repeat center center;">
					</div>
					<h4 class="modal-title" id="myModalLabel"  style="background:url(../img/tishi.png) no-repeat left center;padding-left: 26px;font-size:18px;font-family:'微软雅黑'">
						提示
					</h4>
				</div>
				<div style="background:#ffffff;">
					<div class="modal-body"  style="color:#666666;font-size:16px;text-align:center;" id="comfirmMsg"><!--添加文区域-->
					</div>
					<div  class="buttonArea">
						<button type="submit" class="buttonConfirm" onclick="updateStatus();" data-dismiss="modal">确 定</button>
						<button type="submit" class="buttonConfirm"  style="background:#D5D5D5;" data-dismiss="modal" aria-hidden="true">取 消</button>
					</div>
				</div>
			</div>
		</div>
	</div>	
	<!--添加菜单弹出框-->
	<div class="modal fade" style="margin-top: -10%" id="showAddMenu" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="false" style="color:#666666;z-index:10;">
		<input type="hidden" value="" id="unid"></input>
		<input type="hidden" value="" id="status"></input>
		<div class="modal-dialog" style="margin-top:10%;width:50%">
			<div  class="modal-content"  style="border-radius:5px;border:none;">
				<div class="modal-header addHead">
					<div type="button" class="fr closeButton" data-dismiss="modal" aria-hidden="true" onclick="paramRemove();" style="width:15px;height: 15px; background: url(../img/close.jpg) no-repeat center center;">
					</div>
					<h4 class="modal-title" id="title"  style="background: url(../img/add.png) no-repeat left center;padding-left: 23px;font-size:16px;font-family:'微软雅黑';color:#ffffff;">
						添加菜单
					</h4>
				</div>
				<div class="modal-body" style="background:#ffffff;">
					<div class="inputBorder" style="padding-top:7px;padding-bottom:7px">
						<div class="inputLabel fl" style="font-size:14px;"> 名  称  </div>
						<input type="text" id="name" maxlength="13" class="inputMain fl" placeholder="请输入名称"/>
					</div>
					<div class="inputBorder" style="padding-top:7px;padding-bottom:7px">
						<div class="inputLabel fl" style="font-size:14px;">URL地址</div>
						<input type="text" class="inputMain fl" id="url" maxlength="60" size="50" placeholder="请输入URL地址"/>
					</div>
					<div class="inputBorder" style="padding-top:7px;padding-bottom:7px">
						<div class="inputLabel fl" style="font-size:14px;">排序号</div>
						<input type="text" id="sortNum"  onkeyup="this.value=this.value.replace(/[^\d.]/g, '').replace(/^\./g, '').replace(/\.{2,}/g, '.')"  onafterpaste="this.value=this.value.replace(/[^\d.]/g, '').replace(/^\./g, '').replace(/\.{2,}/g, '.')" maxlength="11" class="inputMain fl" placeholder="请输入排序号"/>
					</div>
					<div class="inputBorder"  >
						<div class="inputLabel fl" style="font-size:14px;margin-top:5px">所属菜单</div>
						<select class="easyui-combotree"  id="punid" url="../menumanage/getTreeDataForeasyui.html" style="width:200%;height:30px;" >
							<option value='1' selected = "selected">系统</option>
						</select>
					</div>
					<div class="inputBorder" style="padding-top:7px;padding-bottom:7px">
						<div class="inputLabel fl" style="font-size:14px;">菜单图标</div>
						<input type="text"  id="icon" maxlength="30" class="inputMain fl" placeholder="请输入菜单图标"/>
					</div>
				</div>
				<div  class="buttonArea">
					<button type="submit" class="buttonConfirm"  onclick="SysMenuCreateOrUpdate()">保存</button>
					<button type="submit" class="buttonConfirm" id="canclebutton" style="background:#D5D5D5;" data-dismiss="modal" aria-hidden="true" data-dismiss="modal" onclick="paramRemove();">返 回</button>
				</div>
			</div>
		</div>
	</div>
	<script src="<%=path%>/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" language="javascript" src="<%=path%>/js/dataTables.bootstrap.js"></script>	
</body>

<script type="text/javascript">
	var punidSave="1";//定义的父菜单id,初始化为1，表示是系统。
	var tableUnit = "";//定义表格单元
	//修改或添加前的参数验证
	function paramValidate(){
		var name=$("#name").val();
		var url=$("#url").val();
		var sortNum=$("#sortNum").val();
		var punid=$("#punid").combotree("getValue");
		var icon=$("#icon").val();
		var re1 = /^[\u4e00-\u9fa5a-z]+$/gi;
		var strRegex=/[\u4e00-\u9fa5]+/;
		var re = new RegExp(strRegex);				
		if(name==null||name==""||name=="请输入名称"){
			$("#name").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "请输入菜单名称",
				bg : "red", //背景色，默认为红色
				time : 1
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#name").focus();

			return false;
		}else if(!re1.test(name)){
			$("#name").tips({
				side:3,
	            msg:'不能为特殊字符！',
	            bg:'red',
	            time:1
	        });
			
			$("#name").focus();
			return false;
		}else if(url==null||url==""||url=="请输入URL地址"){
			$("#url").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "请输入请求地址",
				bg : "red", //背景色，默认为红色
				time : 1
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#url").focus();
			return false;
		}else if(re.test(url)){
			$("#url").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "格式错误，请从新输入！",
				bg : "red", //背景色，默认为红色
				time : 1
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#url").focus();
			return false;
		}else if(sortNum==null||sortNum==""||sortNum=="请输入排序号"){
			$("#sortNum").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "请输入排序号",
				bg : "red", //背景色，默认为红色
				time : 1
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#sortNum").focus();
			return false;
		}else if(parseFloat(sortNum)<0||parseFloat(sortNum)>999999.9949){
			$("#sortNum").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "输入超限，无法保存！",
				bg : "red", //背景色，默认为红色
				time : 1
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#sortNum").focus();
			return false;
		}else if(icon==null||icon==""||icon=="请输入菜单图标"){
			$("#icon").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "请输入图标！",
				bg : "red", //背景色，默认为红色
				time : 1
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#icon").focus();
			return false;
		}
		return true;
	}
	//修改和添加菜单。如果unid为空表示是新增，不为空表示是编辑
	function SysMenuCreateOrUpdate(){
		$("#savebutton").attr("disabled",true);//防止保存按钮被点多次
		var unid=$("#unid").val();
		var status=$("#status").val();
		var name=$("#name").val();
		var url=$("#url").val();
		var sortNum=$("#sortNum").val();
		var punid=$("#punid").combotree("getValue");
		var icon=$("#icon").val();
		if(!paramValidate()){
		$("#savebutton").attr("disabled",false);
		return;
		};
		//验证名称是否包含非法字符
		var reges=/[`~!@#\$%\^\&\*\(\)_\+“”《》！@#￥%<>\?"\{\},\.\\\/;'\[\]]/im; 
        if(reges.test(name)) {
            $("#name").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "名称不能包含非法字符",
				bg : "red", //背景色，默认为红色
				time : 1
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#name").focus();
			//重新激活保存按钮
			$("#savebutton").attr("disabled",false);//重新激活保存按钮
            return;
        }
    	$.ajax({
			type:"post",
			dataType:"text",
			url:"<%=path%>/menumanage/addOrUpdateMenu.html",
			async: false,
			data:{
				unid:unid,
				status:status,
				name:name,
				  url:url,
				  sortNum:sortNum,
				  punid:punid,
				  icon:icon,
			},
			success:function(data){
				if(data=='1'){
					toastr.success("操作成功");
					$("#punid").combotree("reload");
				}else{
					toastr.error("操作失败");
				}
				
				$("#canclebutton").click();
				tableUnit.ajax.reload(null, false);
				refreshTree();
				
			}})
			$("#savebutton").attr("disabled",false);//重新激活保存按钮
     	}
     	//刷新左侧菜单树
   function refreshTree(){
	        $("#tree").treeview({
	        	data: getTree(),
	        	emptyIcon: '',
	        	}); 
	        $('#tree').on('nodeSelected', function(event, data) {
					refreshTable(data.nodeCode);
					//tableUnit.ajax.reload(null, false);
			});
	        
			
  	 }
   $(function(){
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
	   if($("#statusParam").val()==null){
			statusParam="";
		}else{
			statusParam= $("#statusParam").val();
		}
  	 	initTable();
   		refreshTree(); 
   		
   		$('.sel2').select2();
   });
 //判断浏览器是否支持 placeholder属性
   function isPlaceholder(){
       var input = document.createElement('input');
       return 'placeholder' in input;
   }
   //获得右侧菜单树的数据
  	 function getTree() {
  	 var tree;
    	$.ajax({
			type:"post",
			dataType:"json",
			url:"<%=path%>/menumanage/getTreeData.html",
			async:false,
			success:function(data){
				tree=data;	
			}
		})
   		 return tree;
	 }
	//查询条件启动或不启用或全部之间变动后加载。
	function statusChange(){
		if($("#statusParam").val()==null){
			statusParam="";
		}else{
			statusParam= $("#statusParam").val();
		}
		//tableUnit.ajax.reload(null, false);
		tableUnit.ajax.url("<%=path%>/menumanage/getSonMenuList.html").load();
	}
	//该方法为点击修改图标时相关参数传递
	function updateMenu(value){
		$("#title").empty();
		$("#title").append("修改菜单");
		//获得原来表单的数据
		var menu;
		$.ajax({
			type:"post",
			dataType:"json",
			url:"<%=path%>/menumanage/getMenuById.html?unid="+value,
			async:false,
			success:function(data){
				menu=data;	
			}
		})
		
		$("#unid").val(value);
		$("#name").val(menu.name);
		$("#status").val(menu.status);
		$("#url").val(menu.url);
		$("#sortNum").val(menu.sortNum);
		$("#punid").combotree("setValue",menu.punid);
		$("#icon").val(menu.icon);
		
	}
	//移除表单里的各项内容
	function paramRemove(){
		$("#unid").val("");
		$("#name").val("");
		$("#status").val("");
		$("#url").val("");
		$("#sortNum").val("");
		//$("#punid").combotree("setValue","1");
		$("#icon").val("");
		$("#title").empty();
		$("#title").append("添加菜单");
	}
	//该方法为点击改变状态按钮后参数传递，已经确认弹出框内容相关相应
	function changeStatus(unid,statusbyname){//statusbyname传过来的是"启用"或"停用"并非0或1
		
		$("#comfirmMsg").empty();
		if(statusbyname=="启用"){
			$("#comfirmMsg").html("是否停用？");
		}else if(statusbyname=="停用"){
			$("#comfirmMsg").html("是否启用？");
		}
		$("#unidOfchangeStatus").val(unid);
	}
	function updateStatus(){
		var unid=$("#unidOfchangeStatus").val();
		var menu;
		var sonMenus;
		//先根据该菜单的id获得该菜单
		$.ajax({
			type:"post",
			dataType:"json",
			url:"<%=path%>/menumanage/getMenuById.html?unid="+unid,
			async:false,
			success:function(data){
				menu=data;	
			}
		});
		if(menu.name=='菜单管理' || menu.name=='单位管理'){			
			toastr.error("此菜单不能被禁用！");
			return;
		}
		//改变菜单的状态，若原来是0则变成1,若原来是1则变成0,0：启用，1：停用
		if(menu.status=="0"){
				menu.status="1";//父菜单为系统的话，状态直接改为0
		}else{
				menu.status="0";//父菜单为系统的话，状态直接改为0	
		}
		//更新修改后的菜单		
		$.ajax({
			type:"post",
			dataType:"text",
			url:"<%=path%>/menumanage/addOrUpdateMenu.html",
			async: false,
			data:menu,
			success:function(data){
				if(data=='1'){
					toastr.success("操作成功");
				}else{
					toastr.error("对不起，操作失败");
				}	
				$("#punid").combotree("reload");			
				tableUnit.ajax.reload(null, false);
				refreshTree();
			}})
			$("#punid").combotree("reload");	
			//reUseFatherMenu();
			synchronousFatherMenuToReuse(unid);
			synchronousFatherMenuTofobid(unid);
			//checkMenuIfALLSonfobid();//如果该菜单的父菜单的所有子菜单都是被禁用的话，父菜单也被禁用。
			
	}
	//点击添加时弹框
	function formShow(){
		$("#showAddMenu").modal("show");
	}
	
	var statusParam;//查询条件初始化(启用，停用，全部)
	function initTable() {				
		tableUnit = $("#table-unit").DataTable(
						{
							"dom": '<"toolbar">frtip',//自定义显示项
							//国际化配置
							language : {
								"sProcessing" : "处理中...",
								"sLengthMenu" : "显示 _MENU_ 项记录",
								"sZeroRecords" : "没有匹配结果",
								"sInfo" : "当前显示 _START_ 到 _END_ 条，共 _TOTAL_ 条记录。",
								"sInfoEmpty" : "当前显示0到0条，共0条记录",
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
							dom: '<"toolbar">frtip',
							pagingType : "full_numbers", //显示首页和末页
							bAutoWidth : false, //禁用自动调整列宽
							//stripeClasses : ["odd", "even"],//为奇偶行加上样式，兼容不支持CSS伪类的场合
							ordering : false, //全局启用排序
							bProcessing : false, //关闭加载提示
							bServerSide : false, //不启用服务器端分页
							serviceSide:false,
							searching : false, //原生默认搜索框
							paging : true, //开始表格分页
							deferRender : false, //延迟渲染
							bLengthChange : false,
							bStateSave : false,	//操作数据后显示在当前页面
							"iDisplayLength" : 5, //默认页面每页展示条数 (pageLength: 2 ,//每页显示数据条数--与这个属性相同)
							sServerMethod:"POST",
							ajax : {
								//指定数据源
								url : "<%=path%>/menumanage/getSonMenuList.html",
								"data": function ( d ) {//向后台传递参数，需要时后台可以接收使用
															d.punid=punidSave;
															d.status=statusParam;
														}
								
								
									},
							aoColumns : [
									{
										"data" : "name",
										//"orderable" : false
									//对某一个字段禁止排序
									},
									{
										"data" : "url"
									},
									{
										"data" : "sortNum"
									},
									{
										"data" : "status"
									},
									{
										"data" : "unid",
										"render" : function(data, type, full,
												meta) {
												var data;
												var sonMenus;
												$.ajax({
														type:"post",
														dataType:"json",
														url:"<%=path%>/menumanage/getSonMenuList.html?punid="+full.unid+"&status=",
														async:false,
														success:function(data){
															sonMenus=data;	
														}
													})
												var data1="<div class="+"'listThreeButton'" + ">"
												         + "<div class="+"fl" +">"
													     +"<a data-toggle="//编辑可用
														//修改按钮
														+ "'modal' " + "href="
														+ "'#showAddMenu' "
														+ "class="
														+ "'table-link' "
														+"title='编辑菜单'"
														+ "onclick="
														+ "updateMenu(\""
														+ full.unid
														+ "\")"//使用转译字符进行转译
														+ ">"
														+"<img src='../img/xiugai.png' />"
														+ "</a>"
														+ "</div>";
												var data2= "<div class="+"fl" +">"
													    +"<a data-toggle="//修改状态可用，由启用变禁用。
														+ "'modal'"
														+ "href='#updateStatusConfirm'"
														+ " class="
														+ "'table-link danger'"
														+"title='点击禁用'"
														+ "onclick="
														+ "changeStatus(\""
														+ full.unid
														+"\","
														+"\""
														+full.status
														+ "\")"
														+ ">"
														+ "<img src='../img/jinyong.png' />"
														+ "</a>"
														+ "</div>"
														+ "</div>";
												var data3="<div class="+"'listThreeButton'" + ">" 
													    +"<div class="+"fl" +">"
													    +"<a data-toggle="//编辑不可用
														+ "'modal' " 
														+ "class="
														+ "'table-link' "
														+ ">"
														+"<img src='../img/xiugaihui.png' />"
														+ "</a>"
														+ "</div>";
												var data4=
													 "<div class="+"fl" +">"
													+   "<a data-toggle=" //修改状态可用，由禁用变启用
														+ "'modal' "
														+ "href='#updateStatusConfirm'"
														+ " class="
														+ "'table-link danger'"
														+"title='点击启用'"
														+ "onclick="
														+ "changeStatus(\""
														+ full.unid
														+"\","
														+"\""
														+full.status
														+ "\")"
														+ ">"
														+"<img src='../img/qiyong.png' />"
														+  "</a>"
														+ "</div>"
														+ "</div>";
												var data5=
													    "<div class="+"fl" +">"
													    + "<a data-toggle=" //修改状态不可用（由启用变禁用）
														+ "'modal' " 
														+ " class="
														+ "'table-link danger'"
														+ "title='有子菜单，不可禁用'"
														+ ">"
														+"<img src='../img/jinyong.png' />"
														+  "</a>"
														+ "</div>";
												var data6="<div class="+"fl" +">"
													    +"<a data-toggle=" //修改状态不可用（由禁用变启用）
														+ "'modal' " 
														+ " class="
														+ "'table-link danger'"
														+ ">"
														+"<img src='../img/qiyong.png' />"
														+  "</a>"
														+ "</div>"
													;
														
												if(sonMenus.data.length>0){
													if(full.status=="启用"){
														data=data1+data5;
													}else{
														data=data3+data6;
													}
												}else{
													if(full.status=="启用"){
														data=data1+data2;
													}else{
														data=data3+data4;
													}
												}	
													return data;
											
										}
									} ]
						});
		$("div.toolbar").html(
		"<div class='row'  style='margin-top: 0px;padding-top:0;'>"+
			"<div class='col-md-2 fl' style='text-align: left;color: #333;padding: 0;margin-left:0px;'>"+
				"<select class='sel2' id='statusParam' style='margin-left:10px;width:80px;margin-top:0' onchange='statusChange()';>"+
					"<option value='0'>启用</option>"+
					"<option value='1'>停用</option>"+
					"<option value=''  selected='selected'>全部</option>"+
				"</select>"+
			"</div>"+
			"<div  style='text-align: right;'>"+
				"<button class='addButton ' style='margin-top:0;margin-right: 30px' type='submit' onclick='formShow();'><img src='../img/addButton.png' />添加</button>"+
			"</div>"+
		"</div>"
		);
		return tableUnit;
		
	}
	//刷新表格
	function refreshTable(punid){
		//$("#table-unit").empty();
		
		paramRemove();
		punidSave=punid;
		$("#punid").combotree("reload");
		tableUnit.ajax.reload(null, true);// 刷新表格数据，分页信息会重置(当为false时分页信息不会重置)
	}
	//提示框相关参数设置
	toastr.options = {
		  "closeButton": false,
		  "debug": false,
		  "positionClass": "toast-top-center",
		  "onclick": null,
		  "showDuration": "300",
		  "hideDuration": "1000",
		  "timeOut": "4000",
		  "extendedTimeOut": "1000",
		  "showEasing": "swing",
		  "hideEasing": "linear",
		  "showMethod": "fadeIn",
		  "hideMethod": "fadeOut"
		};
	//查询该菜单的子菜单是否全部为禁用，如果是，则该菜单被禁用。
	function checkMenuIfALLSonfobid(){
		if(punidSave!="1"){
			$.ajax({
				type:"post",
				dataType:"json",
				url:"<%=path%>/menumanage/getSonMenuList.html?punid="+punidSave+"&status=",
				async:false,
				success:function(data){
					sonMenus=data;	
				}
			})
			for(var i=0;i<sonMenus.data.length;i++){
				if(sonMenus.data[i].status=="启用"){
				return;//如果有一个为启用则该方法结束
				}	
			}
			var fmenu;
			$.ajax({
			type:"post",
			dataType:"json",
			url:"<%=path%>/menumanage/getMenuById.html?unid="+punidSave,
			async:false,
			success:function(data){
				fmenu=data;	
				}
			})
			fmenu.status="1";
			//更新修改后的菜单		
			$.ajax({
				type:"post",
				dataType:"text",
				url:"<%=path%>/menumanage/addOrUpdateMenu.html",
				async: false,
				data:fmenu,
				success:function(data){
					if(data=='1'){
						toastr.success("父菜单同步禁用操作成功");
					}else{
						toastr.error("对不起，操作失败");
					}	
				}})
		}
	}
	//启用某菜单的时候，检查该菜单的父菜单是否为启用，如果不则启用。
	function reUseFatherMenu(){
		var fmenu;
		if(punidSave!="1"){
			$.ajax({
			type:"post",
			dataType:"json",
			url:"<%=path%>/menumanage/getMenuById.html?unid="+punidSave,
			async:false,
			success:function(data){
				fmenu=data;	
				}
			})
			if (fmenu.status=="1"){
				fmenu.status="0";
				$.ajax({
				type:"post",
				dataType:"text",
				url:"<%=path%>/menumanage/addOrUpdateMenu.html",
				async: false,
				data:fmenu,
				success:function(data){
					if(data=='1'){
						toastr.success("父菜单同步启用操作成功");
					}else{
						toastr.error("对不起，操作失败");
					}	
				}})
			}		
		}
	}
	//同步所有父级，父父级菜单至禁用
	function synchronousFatherMenuTofobid(menuid){
		var sonmenu;
		$.ajax({
			type:"post",
			dataType:"json",
			url:"<%=path%>/menumanage/getMenuById.html?unid="+menuid,
			async:false,
			success:function(data){
				sonmenu=data;	
				}
			})
		if(sonmenu.punid!="1"){
			$.ajax({
			type:"post",
			dataType:"json",
			url:"<%=path%>/menumanage/getSonMenuList.html?punid="+sonmenu.punid+"&status=",
			async:false,
			success:function(data){
					for(var i=0;i<data.data.length;i++){
						if(data.data[i].status=="启用"){
						return;
						}
					}
					var fatherMenu;
					$.ajax({
						type:"post",
						dataType:"json",
						url:"<%=path%>/menumanage/getMenuById.html?unid="+sonmenu.punid,
						async:false,
						success:function(data){
							fatherMenu=data;	
							}
						})
					fatherMenu.status="1";
					$.ajax({
						type:"post",
						dataType:"text",
						url:"<%=path%>/menumanage/addOrUpdateMenu.html",
						async: false,
						data:fatherMenu,
						success:function(data){
							if(data=='1'){
								toastr.success("父菜单同步禁用操作成功");
							}else{
								toastr.error("对不起，操作失败");
							}	
						}})
							
						
					
				}
			})
			synchronousFatherMenuTofobid(sonmenu.punid);	
		}
	}
	//同步所有父级，父父级菜单至启用
	function synchronousFatherMenuToReuse(menuid){
		var sonmenu;
		$.ajax({
			type:"post",
			dataType:"json",
			url:"<%=path%>/menumanage/getMenuById.html?unid="+menuid,
			async:false,
			success:function(data){
				sonmenu=data;	
				}
			})
		if(sonmenu.punid!="1"){
			var fatherMenu;
			var sonMenuList;
			$.ajax({
			type:"post",
			dataType:"json",
			url:"<%=path%>/menumanage/getSonMenuList.html?punid="+sonmenu.punid+"&status=",
			async:false,
			success:function(data){
				sonMenuList=data;
			}})
			for(var i=0;i<sonMenuList.data.length;i++){
				if(sonMenuList.data[i].status=="启用"){
					$.ajax({
						type:"post",
						dataType:"json",
						url:"<%=path%>/menumanage/getMenuById.html?unid="+sonmenu.punid,
						async:false,
						success:function(data){
						fatherMenu=data;
							if(fatherMenu.status=="1"){
								fatherMenu.status="0";
								$.ajax({
									type:"post",
									dataType:"text",
									url:"<%=path%>/menumanage/addOrUpdateMenu.html",
									async: false,
									data:fatherMenu,
									success:function(data){
										if(data=='1'){
											toastr.success("父菜单同步启用操作成功");
										}else{
											toastr.error("对不起，操作失败");
										}	
								}})
								synchronousFatherMenuToReuse(sonmenu.punid);
								return;
							}	
						}
					})
				}
			}
			
				
		}
	
	}
</script>
</html>