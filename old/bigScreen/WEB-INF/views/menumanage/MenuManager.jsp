<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setAttribute("home", request.getContextPath());
String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
  <head>
    <title>菜单管理页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0"> 
	<link href="${home}/css/bootstrap/bootstrap.min.css" rel="stylesheet">   
	<link href="${home}/css/tour/css/caidan.css" rel="stylesheet">   
	<link href="${home}/css/tour/css/kuangjia.css" rel="stylesheet">   
	<link href="${home}/css/bootstrap/bootstrap-treeview.css" rel="stylesheet">   
	<link rel="stylesheet" type="text/css" href="${home}/css/libs/dataTables.tableTools.css">	
	<script src="${home}/js/jquery.js"></script>
	<script src="${home}/js/bootstrap.js"></script> 
	<script src="${home}/js/bootstrap-treeview.js"></script> 
	<script src="${home}/js/jquery.nanoscroller.min.js"></script>
	<script src="${home}/js/demo-skin-changer.js"></script>
	<script src="${home}/js/demo.js"></script>
	<script src="${home}/js/modernizr.custom.js"></script>
	<script src="${home}/js/classie.js"></script>
	<script src="${home}/js/modalEffects.js"></script>
	<script src="${home}/js/scripts.js"></script>
	<script src="${home}/js/pace.min.js"></script>	
	<script src="${home}/css/tour/js/kuangjia.js"></script>	
	<script src="${home}/js/jquery.dataTables.js"></script>
	<script src="${home}/js/dataTables.fixedHeader.js"></script>
	<script src="${home}/js/dataTables.tableTools.js"></script>
	<script src="${home}/js/jquery.dataTables.bootstrap.js"></script>
	
  </head> 
	<style type="text/css">
		.ttable tr th p{font-size: 1rem;color:#333;}
		.ttable tr th span{font-size: 0.8rem;}
		.ttable tr td {font-size: 1rem;}
	</style>
<body  class="easyui-layout">
	<!--左侧菜单树显示div  -->
 	<div  style="width: 15%;float:left;" >
 		<div class="conListHead">
			<div class="conListHeadText fl">主菜单</div>
			<div class="conListHeadImg fr"><img src="img/caidanlistright.jpg"/></div>
		</div>
		<div id="tree"></div>
	</div>
	
	<!--右侧div  -->
	<div style="background-color:white; width:84%; float:left;margin-left:1%;">
		<!--查询菜单及添加按钮区域  -->
		<div class="row"  style="margin-top: 5px;">
			<div class="col-md-1 col-xs-1" style="text-align: left;color: #333;padding: 0;">
				<select class="form-control">
					<option>全部</option>
					<option>启用</option>
					<option>停用</option>
				</select>
			</div>
			<div class="col-md-11 " style="text-align: right;">
				<button class="addButton " type="submit" ><img src="img/addButton.png" />添加</button>
			</div>
		</div>
		<!--菜单表格显示  -->
		<div class="main-box-body clearfix" style="margin-top: 5px;">
				<div id="table-example_wrapper"
					class="dataTables_wrapper form-inline dt-bootstrap no-footer">
					<div class="clearfix"></div>
					<table id="table-sonmenu"
						class="table table-hover dataTable no-footer" role="grid">
						<thead style="background-color:#87CEFA;">
							<tr role="row">
								<th class="sorting_asc" tabindex="0"
									aria-controls="table-example" rowspan="1" colspan="1"
									aria-sort="ascending"
									aria-label="Name: activate to sort column ascending"
									style="width: 240px;">菜单名称</th>
								<th class="sorting" tabindex="0" aria-controls="table-example"
									rowspan="1" colspan="1"
									aria-label="Position: activate to sort column ascending"
									style="width: 350px;">地址</th>
								<th class="sorting" tabindex="0" aria-controls="table-example"
									rowspan="1" colspan="1"
									aria-label="Office: activate to sort column ascending"
									style="width: 211px;">排序号</th>
								<th class="sorting" tabindex="0" aria-controls="table-example"
									rowspan="1" colspan="1"
									aria-label="Age: activate to sort column ascending"
									style="width: 234px;">状态</th>
								<th class="sorting" tabindex="0" aria-controls="table-example"
									rowspan="1" colspan="1"
									aria-label="Salary: activate to sort column ascending"
									style="width: 150px;">操作</th>																										
							</tr>
						</thead>
						<thead id="dataspace"></thead>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>
		<!--新增菜单div  -->
		<div class="modal fade" id="showAddMenu" tabindex="-1" role="dialog"
			aria-labelledby="showAddMenuLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">编辑</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="SysMenuForm" role="form" >
						<input type="hidden" value="" id="unid"></input>
						<input type="hidden" value="" id="status"></input>
						<div class="form-group">
							
      						<label for="name" class="col-sm-2 control-label"><font color="red">*</font>名称</label>
	      					<div class="col-sm-10">
	         					<input type="text" class="form-control" id="name" maxlength="13" size="14" placeholder="请输入菜单名称">
	     					</div>
   						</div>
						<div class="form-group">
      						<label for="url" class="col-sm-2 control-label"><font color="red">*</font>url地址</label>
	      					<div class="col-sm-10">
	         					<input type="text" class="form-control" id="url" maxlength="50" size="50" placeholder="请输入地址">
	     					</div>
   						</div>
						<div class="form-group">
      						<label for="sort_num" class="col-sm-2 control-label"><font color="red">*</font>排序号</label>
	      					<div class="col-sm-10">
	         					<input type="text" class="form-control" id="sortNum"  onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')" maxlength="5" size="14" placeholder="请输入地址">
	     					</div>
   						</div>
						<div class="form-group">
							<label for="punid" class="col-sm-2 control-label"><font color="red">*</font>所属菜单</label>
							<div class="col-sm-10">
	      						<select class="form-control" id="punid" >
	      							<option value='0'>系统</option>
	      						</select>
      						</div>
  						 </div>
  						 <div class="form-group">
      						<label for="icon" class="col-sm-2 control-label">菜单图标</label>
	      					<div class="col-sm-10">
	         					<input type="text" class="form-control" id="icon" maxlength="5" size="14"  placeholder="请输入地址">
	     					</div>
   						 </div>
					</form>
				</div>
				<div class="modal-footer">
					
					<button type="button" class="btn btn-default"  id="canclebutton" style="margin-top: 10px;"  data-dismiss="modal" onclick="paramRemove();" >取消</button>		
					<button type="button" class="btn btn-default" style="margin-top: 10px;"  onclick="SysMenuCreateOrUpdate()">保存</button>		
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="showStatusChange" tabindex="-1" role="dialog" aria-labelledby="showAddMenuLabel" aria-hidden="true" >	
		<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">请选择需要的操作</h4>
					</div>
					<div class="modal-footer">
						<input type="hidden" value="" id="unidOfchangeStatus"></input>
						<input type="hidden" value="" id="statusOfchangeStatus"></input>
						<button type="button" id="choseFobidden" class="btn btn-default" style="margin-top: 10px;"  data-dismiss="modal" onclick="updateStatus(1)">禁用</button>
						<button type="button" id="choseStartuse" class="btn btn-default" style="margin-top: 10px;"  data-dismiss="modal" onclick="updateStatus(0)">启用</button>
						<button type="button" id="choseDelete" class="btn btn-default" style="margin-top: 10px;"  data-dismiss="modal" onclick="updateStatus(2)">删除</button>
						<button type="button"  class="btn btn-default" style="margin-top: 10px;"  data-dismiss="modal" >取消</button>
					</div>
				</div>
		</div>
	</div>
		  
</body>
<script type="text/javascript">
	var punidSave="1";
	function paramValidate(){
		var name=$("#name").val();
		var url=$("#url").val();
		var sortNum=$("#sortNum").val();
		var punid=$("#punid").val();
		var icon=$("#icon").val();
		if(name==null||name==""){
			alert("菜单名不能为空");
			return false;
		}else if(url==null||url==""){
			alert("地址不能为空");
			return false;
		}else if(sortNum==null||sortNum==""){
			alert("排序号不能为空");
			return false;
		}else if(icon==null||icon==""){
			alert("菜单图标不能为空");
			return false;
		}
		return true;
	}
	function SysMenuCreateOrUpdate(){
		var unid=$("#unid").val();
		var status=$("#status").val();
		var name=$("#name").val();
		var url=$("#url").val();
		var sortNum=$("#sortNum").val();
		var punid=$("#punid").val();
		var icon=$("#icon").val();
		//alert("icon="+obj.icon+"...punid="+obj.punid+"...sortnum="+obj.sortNum);
		if(!paramValidate())return;
		//if(!jQuery.form("#SysMenuForm").validate())return;
		var reges=/[`~!@#\$%\^\&\*\(\)_\+“”《》！@#￥%<>\?:"\{\},\.\\\/;'\[\]]/im; 
        if(reges.test(name)) {
            showMsg("名称不能包含非法字符！");
            return;
        }
   		//$('#SysMenuForm').submit();
   		//alert($("#SysMenuForm").serialize());
        //$.post("${home}/menumanage/addMenu.html",$("#SysMenuForm").serialize(),function(data){alert(data)});
    	$.ajax({
			type:"post",
			dataType:"text",
			url:"${home}/menumanage/addOrUpdateMenu.html",
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
					alert("操作成功");
				}else{
					alert("对不起，添加失败");
				}
				
				$("#canclebutton").click();
				refreshTable(punidSave);
				refreshTree();
				
			}})
     	}
   function refreshTree(){
	   $("#tree").treeview({data: getTree()}); 
	   		$("#tree").treeview('collapseAll', { silent: false })
	   		$("#punid").empty();
	   		$("#punid").append("<option value='1'>系统</option>");
			$.ajax({
				type:"post",
				dataType:"json",
				url:"${home}/menumanage/getFatherMenuList.html",
				async: true,
				success:function(data){
					for(var i=0;i<data.rows.length;i++){
						$("#punid").append("<option class='fatherSelecter' value='"+data.rows[i].unid+"'>"+data.rows[i].name+"</option>");
					}
				}
			})
			$('#tree').on('nodeSelected', function(event, data) {
					//判断是否是父节点
					//alert(data.level);
					if(data.level=="1"){
						refreshTable(data.nodeCode);
					}	
			});
  	 }
   $(function(){
   		refreshTable("1");
   		refreshTree() 
  	 })
  	 function getTree() {
  	 var tree;
    	$.ajax({
			type:"post",
			dataType:"json",
			url:"${home}/menumanage/getTreeData.html",
			async:false,
			success:function(data){
				tree=data;	
			}
		})
   		 return tree;
	 }
	function refreshTable(punid){
		$("#dataspace").empty();
		var statusParam=$("#statusParam").val();
		punidSave=punid;
		$.ajax({
			type:"post",
			dataType:"json",
			url:"${home}/menumanage/getSonMenuList.html?punid="+punidSave+"&status="+statusParam,
			async:false,
			success:function(data){	
				
				for(var i=0;i<data.data.length;i++){
					var unid=data.data[i].unid;
					//alert(statusParam+"..."+data.data[i].status);
					if(statusParam==data.data[i].status||statusParam=='全部'){
						$("#dataspace").append(
							"<tr role='row'>"+
								"<th class='sorting_asc' tabindex='0'"+
									"aria-controls='table-example' rowspan='1' colspan='1'"+
									"aria-sort='ascending'"+
									"aria-label='Name: activate to sort column ascending'"+
									"style='width: 240px;'>"+data.data[i].name+"</th>"+
								"<th class='sorting_asc' tabindex='0'"+
									"aria-controls='table-example' rowspan='1' colspan='1'"+
									"aria-sort='ascending'"+
									"aria-label='Name: activate to sort column ascending'"+
									"style='width: 350px;'>"+data.data[i].url+"</th>"+
								"<th class='sorting_asc' tabindex='0'"+
									"aria-controls='table-example' rowspan='1' colspan='1'"+
									"aria-sort='ascending'"+
									"aria-label='Name: activate to sort column ascending'"+
									"style='width: 240px;'>"+data.data[i].sortNum+"</th>"+
								"<th class='sorting_asc' tabindex='0'"+
									"aria-controls='table-example' rowspan='1' colspan='1'"+
									"aria-sort='ascending'"+
									"aria-label='Name: activate to sort column ascending'"+
									"style='width: 240px;'>"+data.data[i].status+"</th>"+
								"<th class='sorting_asc' tabindex='0'"+
									"aria-controls='table-example' rowspan='1' colspan='1'"+
									"aria-sort='ascending'"+
									"aria-label='Name: activate to sort column ascending'"+
									"style='width: 150px;'>"+
									
									
									"<a  data-toggle='modal' href='#showAddMenu'>"+
										"<button type='button' class='btn btn-default btn-xs' onclick='updateMenu(\""+unid+"\");'> "+
  											"<span class='glyphicon glyphicon-pencil' aria-hidden='true' ></span>"+
										"</button> "+
									"</a>"+
									"<a  data-toggle='modal' href='#showStatusChange'>"+
										"<button type='button' class='btn btn-default btn-xs' onclick='changeStatus(\""+unid+"\");'> "+
  											"<span class='glyphicon glyphicon-remove' aria-hidden='true' ></span>"+
										"</button> "+
									"</a>"+
									
								"</th>"+			
							"</tr>")
							
					}	
				}	
			}
		})
	}
	function statusChange(){
		refreshTable(punidSave);
	}
	function updateMenu(value){
		//获得原来表单的数据
		var menu;
		$.ajax({
			type:"post",
			dataType:"json",
			url:"${home}/menumanage/getMenuById.html?unid="+value,
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
		$("#punid").val(menu.punid);
		$("#icon").val(menu.icon);
		$(".fatherSelecter").find("option[value='"+menu.punid+"']").attr("selected",true);
	}
	function paramRemove(){
		$("#unid").val("");
		$("#name").val("");
		$("#status").val("");
		$("#url").val("");
		$("#sortNum").val("");
		$("#punid").val("");
		$("#icon").val("");
	}
	function changeStatus(unid){		
		$("#unidOfchangeStatus").val(unid);
		$.ajax({
			type:"post",
			dataType:"json",
			url:"${home}/menumanage/getMenuById.html?unid="+unid,
			async:false,
			success:function(data){
				menu=data;	
			}
		})
	}
	function updateStatus(status){
		var unid=$("#unidOfchangeStatus").val();
		var menu;
		$.ajax({
			type:"post",
			dataType:"json",
			url:"${home}/menumanage/getMenuById.html?unid="+unid,
			async:false,
			success:function(data){
				menu=data;	
			}
		})
		menu.status=status;
		$.ajax({
			type:"post",
			dataType:"text",
			url:"${home}/menumanage/addOrUpdateMenu.html",
			async: false,
			data:menu,
			success:function(data){
				if(data=='1'){
					alert("操作成功");
				}else{
					alert("对不起，操作失败");
				}				
				$("#canclebutton").click();
				refreshTable(punidSave);
				refreshTree();
			}})
	}
</script>
</html>
