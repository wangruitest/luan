<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
	request.setAttribute("home", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>景区告警阈值信息</title>
<link rel="stylesheet" href="../css/select2.css" />
<link rel="stylesheet" type="text/css" href="${home}/css/compiled/theme_styles.css" />
<link rel="stylesheet" type="text/css" href="${home}/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="${home}/css/bootstrap/dataTables.bootstrap.css " />
<link rel="stylesheet" type="text/css" href="${home}/css/caidan.css " />
<link rel="stylesheet" type="text/css" href="${home}/css/kuangjia.css " />
<link rel="stylesheet" type="text/css" href="${home}/css/libs/nanoscroller.css" />
<link rel="stylesheet" type="text/css" href="${home}/css/compiled/theme_styles.css" />
<link rel="stylesheet" type="text/css" href="${home}/css/toastr.css" />
<script src="../js/jquery.js"></script>
<script src="${home}/js/bootstrap.js"></script>
<script src="${home}/js/jquery.nanoscroller.min.js"></script>
<script src="${home}/js/demo.js"></script>
<script src="${home}/js/scripts.js"></script>
<script src="${home}/js/jquery.tips.js"></script>
<script type="text/javascript" src="${home}/js/toastr.min.js"></script>
<script type="text/javascript" src="../js/select2.min.js"></script>	
<script type="text/javascript">
toastr.options = {
		  "closeButton": false,
		  "debug": false,
		  "positionClass": "toast-top-center",
		  "onclick": null,
		  "showDuration": "300",
		  "hideDuration": "1000",
		  "timeOut": "5000",
		  "extendedTimeOut": "1000",
		  "showEasing": "swing",
		  "hideEasing": "linear",
		  "showMethod": "fadeIn",
		  "hideMethod": "fadeOut"
		};
</script>
</head>
<style>
a {
	text-decoration: none;
	color: #ffffff;
}

a:hover {
	cursor: pointer;
	color: #ffffff;
	text-decoration: none;
}

button {
	color: #ffffff;
}

.btn {
	display: inline-block;
	padding: 6px 12px;
	margin-bottom: 0;
	font-size: 14px;
	font-weight: normal;
	line-height: 1.428571429;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	cursor: pointer;
	background-image: none;
	border: 1px solid transparent;
	border-radius: 4px;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	-o-user-select: none;
	user-select: none
}

.row {
	padding: 0;
	margin: 0;
}

.container-fluid {
	padding: 0;
	margin: 0;
}
ul {font-family: "微软雅黑";}
html { overflow-x:hidden; }
html { overflow-y:hidden; }
</style>
<body>
	<div class="row" style="white-space: nowrap;overflow: hidden;">
		<div class="col-md-2 fl"
			style="text-align: left;color: #333;width: 17%;">
			<select id="searchCity" class="sel2" style="margin-left: 0;margin-top: 10px;width:100%">
				<option value="340000">安徽省</option>
				<option value="340100">合肥市</option>
				<option value="340200">芜湖市</option>
				<option value="340300">蚌埠市</option>
				<option value="340400">淮南市</option>
				<option value="340500">马鞍山市</option>
				<option value="340600">淮北市</option>
				<option value="340700">铜陵市</option>
				<option value="340800">安庆市</option>
				<option value="341000">黄山市</option>
				<option value="341100">滁州市</option>
				<option value="341200">阜阳市</option>
				<option value="341300">宿州市</option>
				<option value="341500">六安市</option>
				<option value="341600">亳州市</option>
				<option value="341700">池州市</option>
				<option value="341800">宣城市</option>
			</select>
		</div>
		<div class="col-md-2 fl"
			style="text-align: left;color: #333;width: 20%;padding-left: 0;margin-top: 10px;">
			<input id="searchScenicName" type="text" class="form-control" style="font-size:14px;font-family: '微软雅黑';" placeholder="请输入景区名称" maxLength=32/>
		</div>
		<div class="col-md-1 fl"
			style="padding-left: 0;width: 30%;white-space: nowrap;overflow: hidden;">
			<button type="button" class="btn btn-default headConfirm"
				style="margin-top: 10px" onclick="searchScenic()">搜索</button>
		</div>
		<div class="col-md-4 fr"
			style="text-align: right;padding-right: 0;width: 30%;white-space: nowrap;overflow: hidden;">
			<button data-toggle="modal" href="#showAddScence" class="addButton "
				type="submit" style="margin-top: 10px;">
				<img src="${home}/img/addButton.png" /> 添加
			</button>
		</div>
	</div>
	<div class="main-box-body clearfix" style=" margin-top:10px;margin-left: 5px">
		<div id="table-example_wrapper"
			class="dataTables_wrapper form-inline dt-bootstrap no-footer">
			<table id="table-scenic"
				class="table table-hover dataTable no-footer table-striped table-bordered"
				role="grid">
				<thead>
					<tr class="tableHead tableList"  style="background:#57a3f1; color: #fff;">
						<th style="width: 150px;font-size:12px;padding-top:15px;padding-bottom:12px;text-align:center;">
						景区编号</th>
						<th style="width: 150px;font-size:12px;text-align:center;padding-top:12px;padding-bottom:15px;">
						城市</th>
						<th style="width: 150px;font-size:12px;text-align:center;padding-top:12px;padding-bottom:15px;">
						区县</th>
						<th style="width: 200px;font-size:12px;text-align:center;padding-top:12px;padding-bottom:15px;">
						景区名称</th>
						<th style="width: 200px;font-size:12px;text-align:center;padding-top:12px;padding-bottom:15px;">
						重点景区</th>
						<th style="width: 234px;font-size:12px;text-align:center;padding-top:12px;padding-bottom:15px;">
						红色预警阀值</th>
						<th style="width: 234px;font-size:12px;text-align:center;padding-top:12px;padding-bottom:15px;">
						橙色预警阀值</th>
						<th style="width: 234px;font-size:12px;text-align:center;padding-top:12px;padding-bottom:15px;">
						黄色预警阀值</th>
						<th style="width: 234px;font-size:12px;text-align:center;padding-top:12px;padding-bottom:15px;">
						蓝色预警阈值</th>
						<th style="width: 150px;font-size:12px;text-align:center;padding-top:12px;padding-bottom:15px;">
						序号</th>
						<th style="width: 200px;font-size:12px;text-align:center;padding-top:12px;padding-bottom:15px;">
						操作</th>
					</tr>
				</thead>
				<tbody align="center">
				</tbody>
			</table>
		</div>
	</div>
	
	<!--添加景区弹出框-->
	<div class="modal fade" style="margin-top: -10%;" id="showAddScence" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="false">
		<div class="modal-dialog" style="margin-top:10%;width: 550px">
			<div class="modal-content"  style="border-radius:5px;">
				<div class="modal-header addHead">
					<div type="button" class="fr closeButton" data-dismiss="modal" aria-hidden="true" style="width:15px;height: 15px; background: url(../img/close.jpg) no-repeat center center;">
					</div>
					<h4 class="modal-title" id="myModalLabel"  style="background: url(${home}/img/add.png) no-repeat left center;padding-left: 23px;font-size:16px;font-family:'微软雅黑';color:#ffffff;">
						添加景区
					</h4>
				</div>
				<div class="modal-body" >
					<div >
						<div class="inputBorder" style="margin-bottom:2%;width:40%;float:left;margin-right:0">
							<div class="inputLabel fl" style="width: 35%;"> 序 号  </div>
							<input id="sortNum" name="sortNum" type="text" class="inputMain fl" style="width: 100px;margin-left: 10px;" placeholder="请输入序号" maxLength=8/>
						</div>
						<div class="inputBorder" style="margin-bottom:2%;width:38% ;float:left;margin-right:0;margin-left:10px">
							<div class="inputLabel fl" style="width: 35%;">景区编号</div>
							<input onkeyup="this.value=this.value.replace(/\D/g,'')" id="scenicid" name="scenicid" type="text" class="inputMain fl" style="width: 100px;margin-left: 10px;" placeholder="请输入景区编号" maxLength=16/>
						</div>
						
					</div>
					<div class="inputBorder" style="margin-bottom:2%;float:left;margin-top: 2px">
						<div class="inputLabel fl">景区名称</div>
						<input id="scenicName" name="scenicName" type="text" class="inputMain fl" placeholder="请输入景区名称" maxLength=32/>
					</div>
					<div>
						<div class="inputBorder" style="margin-bottom:2%;width:40%;float:left;margin-right:0;margin-top: 2px">
							<div class="inputLabel fl" id="keyScenicDiv" style="width: 35%;line-height:35px;">重点景区</div>
							<select id="keyScenic" name="keyScenic" class="inputSelect fl sel2" style="width: 60%;">
									<option value="-1">请选择</option>
									<option value="1">是</option>
									<option value="0">否</option>
							</select>
						</div>
						<div class="inputBorder" style="margin-bottom:2%;width:38% ;float:left;margin-right:0;margin-left:10px;margin-top: 2px">
							<div class="inputLabel fl" style="width: 35%;line-height:35px;">景区级别</div>
								<select id="alevel" name="alevel" class="inputSelect fl sel2" style="width: 60%;">
									<option value="5">AAAAA级</option>
									<option value="4">AAAA级</option>
									<option value="3">AAA级</option>
									<option value="2">AA级</option>
									<option value="1">A级</option>
								</select>
						</div>
					</div>
					<div style="float:left;width: 100%">
						<div class="inputBorder f1" style="margin-bottom:2%;width:40%;float:left;margin-right:0;margin-top: 2px">
							<div id="cityiddiv" class="inputLabel fl" style="width:35%;line-height:35px;"> 城  市</div>
							<select id="cityid" name="cityid" onchange="cityChange('add')" class="inputSelect fl sel2" style="width: 60%;">
								<option value="-1" selected="selected">请选择</option>
								<option value="340100">合肥市</option>
								<option value="340200">芜湖市</option>
								<option value="340300">蚌埠市</option>
								<option value="340400">淮南市</option>
								<option value="340500">马鞍山市</option>
								<option value="340600">淮北市</option>
								<option value="340700">铜陵市</option>
								<option value="340800">安庆市</option>
								<option value="341000">黄山市</option>
								<option value="341100">滁州市</option>
								<option value="341200">阜阳市</option>
								<option value="341300">宿州市</option>
								<option value="341500">六安市</option>
								<option value="341600">亳州市</option>
								<option value="341700">池州市</option>
								<option value="341800">宣城市</option>
							</select>
						</div>
						<div class="inputBorder f1" style="margin-bottom:2%;width:38% ;float:left;margin-right:0;margin-left:10px;margin-top: 2px">
							<div id="countyiddiv" class="inputLabel fl" style="width:35%;line-height: 35px">区 / 县</div>
							<select id="countyid" name="countyid" class="inputSelect fl sel2" style="width: 60%">
								<option value="-1" selected="selected">请选择</option>
							</select>
						</div>
					</div>
					<div style="height: 50px">
						<div class="inputBorder" style="margin-bottom:2%;width:40%;float:left;margin-right:0;margin-top: 2px">
							<div class="inputLabel fl" style="width: 100px">红色预警阈值</div>
							<input onkeyup="this.value=this.value.replace(/\D/g,'')" oninput="levelAddCompletion(1)" id="level1_num" name="level1_num" type="text" class="inputMain fl" style="width:80px" placeholder="请输入阈值" maxLength=10/>
						</div>
						<div class="inputBorder" style="margin-bottom:2%;width:38% ;float:left;margin-right:0;margin-left:10px;margin-top: 2px">
							<div class="inputLabel fl" style="width: 100px">橙色预警阈值</div>
							<input onkeyup="this.value=this.value.replace(/\D/g,'')" id="level2_num" name="level2_num" type="text" class="inputMain fl" style="width:80px" placeholder="请输入阈值" maxLength=10/>
						</div>
					</div>
					<div>
						<div class="inputBorder" style="margin-bottom:2%;width:40%;float:left;margin-right:0;margin-top: 2px">
							<div class="inputLabel fl" style="width: 100px">黄色预警阈值</div>
							<input onkeyup="this.value=this.value.replace(/\D/g,'')" id="level3_num" name="level3_num" type="text" class="inputMain fl" style="width: 80px" placeholder="请输入阈值" maxLength=10/>
						</div>
						<div class="inputBorder" style="margin-bottom:2%;width:38% ;float:left;margin-right:0;margin-left:10px;margin-top: 2px">
							<div class="inputLabel fl" style="width: 100px">蓝色预警阈值</div>
							<input onkeyup="this.value=this.value.replace(/\D/g,'')" id="level4_num" name="level4_num" type="text" class="inputMain fl" style="width: 80px" placeholder="请输入阈值" maxLength=10/>
						</div>
					</div>
				</div>
				<div  class="buttonArea">
					<button type="submit" class="buttonConfirm" id="saveSubmit">保 存</button>
					<button type="submit" class="buttonConfirm" style="background:#D5D5D5;" data-dismiss="modal" aria-hidden="true" onclick="addDismiss()">返 回</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 添加景区弹出框结束 -->
	
	<!--修改景区弹出框-->
	<div class="modal fade" style="margin-top: -10%;" id="showUpdateScence" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="false">
		<div class="modal-dialog" style="margin-top:10%;width: 550px">
			<div class="modal-content" style="border-radius:5px;">
				<div class="modal-header addHead">
					<div type="button" class="fr closeButton" data-dismiss="modal" aria-hidden="true" style="width:15px;height: 15px; background: url(${home}/img/close.jpg) no-repeat center center;">
					</div>
					<h4 class="modal-title" id="myModalLabel"  style="background: url(${home}/img/add.png) no-repeat left center;padding-left: 23px;font-size:16px;font-family:'微软雅黑';color:#ffffff;">
						修改景区
					</h4>
				</div>
				<div class="modal-body" >
					<div>
						<div class="inputBorder" style="margin-bottom:2%;width:40%;float:left;margin-right:0">
							<div class="inputLabel fl" style="width: 35%;"> 序 号  </div>
							<input id="sortNum2" name="sortNum" type="text" class="inputMain fl" style="width: 100px;margin-left: 10px;" placeholder="请输入序号" maxLength=8/>
						</div>
						<div class="inputBorder" style="margin-bottom:2%;width:38% ;float:left;margin-right:0;margin-left:10px">
							<div class="inputLabel fl" style="width: 35%;">景区编号</div>
							<input onkeyup="this.value=this.value.replace(/\D/g,'')" id="scenicid2" name="scenicid" type="text" class="inputMain fl" style="width: 100px;margin-left: 10px;" placeholder="请输入景区编号" maxLength=16/>
						</div>
					</div>
					<div class="inputBorder" style="margin-bottom:2%;float:left;margin-top: 2px">
						<div class="inputLabel fl">景区名称</div>
						<input id="scenicName2" name="scenicName" type="text" class="inputMain fl" placeholder="请输入景区名称" maxLength=32/>
					</div>
					<div>
						<div class="inputBorder" style="margin-bottom:2%;width:40%;float:left;margin-right:0;margin-top: 2px">
							<div class="inputLabel fl" id="keyScenicDiv2" style="width: 35%;line-height:35px;">重点景区</div>
							<select id="keyScenic2" name="keyScenic" class="inputSelect fl sel2" style="width: 60%;">
									<option value="-1">请选择</option>
									<option value="1">是</option>
									<option value="0">否</option>
							</select>
						</div>
						<div class="inputBorder" style="margin-bottom:2%;width:38% ;float:left;margin-right:0;margin-left:10px;margin-top: 2px">
							<div class="inputLabel fl" style="width: 38%;line-height:35px;">景区级别</div>
							<select id="alevel2" name="alevel" class="inputSelect fl sel2" >
								<option value="5">AAAAA级</option>
								<option value="4">AAAA级</option>
								<option value="3">AAA级</option>
								<option value="2">AA级</option>
								<option value="1">A级</option>
							</select>
						</div>
					</div>
					<div style="float:left;width: 100%">
						<div class="inputBorder f1" style="margin-bottom:2%;width:40%;float:left;margin-right:0;margin-top: 2px">
							<div id="cityid2div" class="inputLabel fl" style="width:35%;line-height:35px;">城 市</div>
							<select id="cityid2" name="cityid" onchange="cityChange('update')" class="inputSelect fl sel2" style="width: 60%;">
								<option value="-1" selected="selected">请选择</option>
								<option value="340100">合肥市</option>
								<option value="340200">芜湖市</option>
								<option value="340300">蚌埠市</option>
								<option value="340400">淮南市</option>
								<option value="340500">马鞍山市</option>
								<option value="340600">淮北市</option>
								<option value="340700">铜陵市</option>
								<option value="340800">安庆市</option>
								<option value="341000">黄山市</option>
								<option value="341100">滁州市</option>
								<option value="341200">阜阳市</option>
								<option value="341300">宿州市</option>
								<option value="341500">六安市</option>
								<option value="341600">亳州市</option>
								<option value="341700">池州市</option>
								<option value="341800">宣城市</option>
							</select>
						</div>
						<div class="inputBorder f1" style="margin-bottom:2%;width:38% ;float:left;margin-right:0;margin-left:10px;margin-top: 2px">
							<div id="countyid2div" class="inputLabel fl" style="width:38%;line-height:35px;">区 / 县</div>
							<select id="countyid2" name="countyid" class="inputSelect fl sel2">
								<option value="-1" selected="selected">请选择</option>
							</select>
						</div>
					</div>
					<div style="height: 50px">
					<div class="inputBorder" style="margin-bottom:2%;width:40%;float:left;margin-right:0;margin-top: 2px">
						<div class="inputLabel fl" style="width: 100px">红色预警阈值</div>
						<input onkeyup="this.value=this.value.replace(/\D/g,'')" oninput="levelUpdateCompletion(1)" id="level1_num2" name="level1_num" type="text" class="inputMain fl" style="width:80px" placeholder="请输入阈值" maxLength=10/>
					</div>
					<div class="inputBorder" style="margin-bottom:2%;width:38% ;float:left;margin-right:0;margin-left:10px;margin-top: 2px">
						<div class="inputLabel fl" style="width: 100px">橙色预警阈值</div>
						<input onkeyup="this.value=this.value.replace(/\D/g,'')" id="level2_num2" name="level2_num" type="text" class="inputMain fl" style="width:80px" placeholder="请输入阈值" maxLength=10/>
					</div>
					</div>
					<div>
					<div class="inputBorder" style="margin-bottom:2%;width:40%;float:left;margin-right:0;margin-top: 2px">
						<div class="inputLabel fl" style="width: 100px">黄色预警阈值</div>
						<input onkeyup="this.value=this.value.replace(/\D/g,'')"  id="level3_num2" name="level3_num" type="text" class="inputMain fl" style="width: 80px" placeholder="请输入阈值" maxLength=10/>
					</div>
					<div class="inputBorder" style="margin-bottom:2%;width:38% ;float:left;margin-right:0;margin-left:10px;margin-top: 2px">
						<div class="inputLabel fl" style="width: 100px">蓝色预警阈值</div>
						<input onkeyup="this.value=this.value.replace(/\D/g,'')" id="level4_num2" name="level4_num" type="text" class="inputMain fl" style="width: 80px" placeholder="请输入阈值" maxLength=10/>
					</div>
					</div>
				</div>
				<div  class="buttonArea">
					<button type="submit" class="buttonConfirm" id="updateSubmit">保 存</button>
					<button type="submit" class="buttonConfirm" id="updataDismiss" style="background:#D5D5D5;" data-dismiss="modal" aria-hidden="true" onclick="updataDismiss()">返 回</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 修改景区弹出框结束 -->
	
	<!-- 信息删除确认弹出框开始 -->
	<div class="modal fade" id="delcfmModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="false">
		<div class="modal-dialog" style="margin-top:10%;width:30%;">
			<div class="modal-content">
				<div class="modal-header addHead">
					<input type="hidden" value="" id="unidOfchangeStatus"></input>
					<input type="hidden" value="" id="statusOfchangeStatus"></input>
					<div type="button" class="fr closeButton" data-dismiss="modal" aria-hidden="true" style="width:15px;height: 15px; background: url(../img/close.jpg) no-repeat center center;">
					</div>
					<h4 class="modal-title" id="myModalLabel"  style="background:url(../img/huifuIco.png) no-repeat left center;padding-left: 23px;font-size:16px;font-family:'微软雅黑';color:#ffffff;"">
						提示
					</h4>
				</div>
				<div class="modal-body"  style="color:#666666;text-align:center;font-size:16px;" id="comfirmMsg"><!--添加文区域-->
					您确认要删除吗？
				</div>
				<div  class="buttonArea">
					<button type="submit" class="buttonConfirm" onclick="deleteScenic();" data-dismiss="modal">确 定</button>
					<button type="submit" class="buttonConfirm"  style="background:#D5D5D5;" data-dismiss="modal" aria-hidden="true">取 消</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 信息删除确认弹出框结束 -->

	<script src="${home}/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" language="javascript" src="${home}/js/dataTables.bootstrap.js"></script>
	<!-- 引用js函数的jsp页面 -->
	<jsp:include flush='true' page='Scenic_js.jsp'></jsp:include>
</body>
</html>