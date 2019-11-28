<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setAttribute("home", request.getContextPath());
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>单位用户管理</title>
<link rel="stylesheet" href="../css/select2.css" />
<link rel="stylesheet" type="text/css" href="${home}/css/compiled/theme_styles.css" />
<link rel="stylesheet" type="text/css" href="${home}/css/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="${home}/css/bootstrap/dataTables.bootstrap.css " />
<link rel="stylesheet" type="text/css" href="${home}/css/caidan.css " />
<link rel="stylesheet" type="text/css" href="${home}/css/kuangjia.css " />
<link rel="stylesheet" type="text/css"
	href="${home}/css/libs/nanoscroller.css" />
<link rel="stylesheet" type="text/css" href="${home}/css/toastr.css" />
<script src="../js/jquery.js"></script>
<script src="${home}/js/bootstrap.js"></script>
<script src="${home}/js/jquery.nanoscroller.min.js"></script>
<script src="${home}/js/demo.js"></script>
<script src="${home}/js/scripts.js"></script>
<script src="${home}/js/jquery.tips.js"></script>
<script type="text/javascript" src="${home}/js/toastr.min.js"></script>
<!-- 将这个属性值设置为不同的值就能让提示信息显示在不同的位置，
如toast-bottom-right表示下右，可以修改源文件改变样式-->
<script type="text/javascript">
	toastr.options = {
		"closeButton" : false,
		"debug" : false,
		"positionClass" : "toast-top-center",
		"onclick" : null,
		"showDuration" : "300",
		"hideDuration" : "1000",
		"timeOut" : "5000",
		"extendedTimeOut" : "1000",
		"showEasing" : "swing",
		"hideEasing" : "linear",
		"showMethod" : "fadeIn",
		"hideMethod" : "fadeOut"
	};
</script>
</head>
<style type="text/css">
.btn-default:active,fieldset[disabled] 
	.btn-default.active {
	background-color: #fff;
	border-color: #ccc
}

.btn-default .badge {
	color: #fff;
	background-color: #333
}

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

.inputBorder {
	width: 80%;
	height:26px;
	margin-left: 10%;
	margin-right: 10%;
	padding: 2px;
	color: #333333;
	font-size: 14px;
	font-family: "微软雅黑";
	border: 1px solid #d4d4d4;
	border-radius: 5px;
	white-space: nowrap;
	overflow: hidden;
	margin-top: 10px;
}

.addHead {
	background: #57a3f1;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
}

.modal-header {
	min-height: 10px;
	padding: 8px;
	border-bottom: 1px solid #e5e5e5;
}

.modal-header .close {
	margin-top: -2px;
}

.parButtonActive {
	color: #ffffff;
	background: #57A3F1;
}


html {
	overflow-x: hidden;
}

html {
	overflow-y: hidden;
}
</style>
<body>
	<div class="row" style="margin-top: 15px;">
		<div class="col-md-2 fl" style="padding-left: 0;width: 10%;">
			<select id="searchFlag" name="searchFlag" class="sel2" style="width:100%">
				<option class='citySelecter' value="2">全部</option>
				<option class='citySelecter' value="0">启用</option>
				<option class='citySelecter' value="1">停用</option>
			</select>
		</div>
		<div class="col-md-2 fl" style="padding-left: 0;width: 15%;">
			<select id="searchCity" name="searchCity" class="sel2" style="width:100%"
				onchange="searchCityChange()">
				<option class='citySelecter' value="340000">安徽省</option>
				<option class='citySelecter' value="340100">合肥市</option>
				<option class='citySelecter' value="340200">芜湖市</option>
				<option class='citySelecter' value="340300">蚌埠市</option>
				<option class='citySelecter' value="340400">淮南市</option>
				<option class='citySelecter' value="340500">马鞍山市</option>
				<option class='citySelecter' value="340600">淮北市</option>
				<option class='citySelecter' value="340700">铜陵市</option>
				<option class='citySelecter' value="340800">安庆市</option>
				<option class='citySelecter' value="341000">黄山市</option>
				<option class='citySelecter' value="341100">滁州市</option>
				<option class='citySelecter' value="341200">阜阳市</option>
				<option class='citySelecter' value="341300">宿州市</option>
				<option class='citySelecter' value="341500">六安市</option>
				<option class='citySelecter' value="341600">亳州市</option>
				<option class='citySelecter' value="341700">池州市</option>
				<option class='citySelecter' value="341800">宣城市</option>
			</select>
		</div>
		<div class="col-md-2 fl" style="padding-left: 0;width: 15%;">
			<select id="searchArea" name="searchArea" class="sel2" style="width:100%">
				<option class='citySelecter' value="0">区/县</option>
			</select>
		</div>
		<div class="col-md-2 fl" style="padding-left: 0;width: 15%;">
			<input id="searchUnitName" name="searchUnitName" type="text"
				class="form-control" id="name" placeholder="请输入单位名称" maxLength=32>
		</div>
		<div class="col-md-1 fl"
			style="padding-left: 0;width: 20%;white-space: nowrap;overflow: hidden;">
			<button type="button" class="btn btn-default headConfirm"
				onclick="searchUnit()">搜索</button>
		</div>
		<div class="col-md-3 fr"
			style="text-align: right;white-space: nowrap;overflow: hidden;width: 20%;">
			<button class="addButton " type="submit" data-toggle="modal"
				data-target="#showAddUnit" onclick="paramRemove();">
				<img src="${home}/img/addButton.png" />添加
			</button>
		</div>
	</div>
	<div class="main-box-body clearfix" style=" margin-top:10px;">
		<div id="table-example_wrapper"
			class="dataTables_wrapper form-inline dt-bootstrap no-footer">
			<table id="table-unit"
				class="table table-hover dataTable no-footer table-striped table-bordered"
				role="grid">
				<thead>
					<tr class="tableHead tableList">
						<th style="width: 20%;text-align:center;padding-top:15px;padding-bottom:15px;"><font size="2"
							color="white">单位名称</font></th>
						<th style="width: 10%;text-align:center;padding-top:15px;padding-bottom:15px;"><font size="2"
							color="white">登录名</font></th>
						<th style="width: 15%;text-align:center;padding-top:15px;padding-bottom:15px;"><font size="2"
							color="white">管理员手机</font></th>
						<th style="width: 10%;text-align:center;padding-top:15px;padding-bottom:15px;"><font size="2"
							color="white">省市</font></th>
						<th style="width: 10%x;text-align:center;padding-top:15px;padding-bottom:15px;"><font size="2"
							color="white">区县</font></th>
						<th style="width: 15%;text-align:center;padding-top:15px;padding-bottom:15px;"><font size="2"
							color="white">景区</font></th>
						<th style="width: 20%;text-align:center;padding-top:15px;padding-bottom:15px;"><font size="2"
							color="white">操作</font></th>
					</tr>
				</thead>
				<tbody align="center" style="color:#333">
				</tbody>
			</table>
		</div>
	</div>

	<!--添加修改单位弹出框-->
	<div class="modal fade" style="margin-top: -5%;" id="showAddUnit"
		tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true" data-backdrop="false">
		<div class="modal-dialog" style="margin-top:5%;width: 550px;">
			<div class="modal-content"   style="border-radius:5px;border:none;height: 440px;">
				<div class="modal-header addHead">
					<div type="button" class="fr closeButton" data-dismiss="modal"
						aria-hidden="true"
						style="width:15px;height: 15px; background: url(../img/close.jpg) no-repeat center center;">
					</div>
					<h4 id="title" class="modal-title" id="myModalLabel"
						style="background: url(../img/add.png) no-repeat left center;padding-left: 23px;font-size:16px;font-family:'微软雅黑';color:#ffffff;"">
						添加单位</h4>
				</div>
				<input id="unid" type="hidden" value=""></input>
				<div class="modal-body">
					<div class="inputHead">
						<div class="inputHeadText fl">单位信息</div>
						<div class="inputHeadLine fl"></div>
					</div>
					<div class="inputBorder" style="margin-top:1%;">
						<div class="inputLabel fl" id="unitnamediv">单位名称</div>
						<input id="unitname" name="unitname" type="text"
							class="inputMain fl" placeholder="请输入单位名称" maxLength=32 />
					</div>
					<div class="selectGroup">
						<div class="inputBorder fl" style="width:35%;height: 40px">
							<div class="inputLabel fl" style="width:26%;line-height:35px;">省 / 市</div>
							<select id="city" name="alevel" onchange="areaChange()"
								class="inputSelect fl sel2" style="width:73%;">
								<option class='citySelecter' value="0" selected="selected">安徽省</option>
								<option class='citySelecter' value="340100">合肥市</option>
								<option class='citySelecter' value="340200">芜湖市</option>
								<option class='citySelecter' value="340300">蚌埠市</option>
								<option class='citySelecter' value="340400">淮南市</option>
								<option class='citySelecter' value="340500">马鞍山市</option>
								<option class='citySelecter' value="340600">淮北市</option>
								<option class='citySelecter' value="340700">铜陵市</option>
								<option class='citySelecter' value="340800">安庆市</option>
								<option class='citySelecter' value="341000">黄山市</option>
								<option class='citySelecter' value="341100">滁州市</option>
								<option class='citySelecter' value="341200">阜阳市</option>
								<option class='citySelecter' value="341300">宿州市</option>
								<option class='citySelecter' value="341500">六安市</option>
								<option class='citySelecter' value="341600">亳州市</option>
								<option class='citySelecter' value="341700">池州市</option>
								<option class='citySelecter' value="341800">宣城市</option>
							</select>
						</div>
						<div class="inputBorder fl" style="width:35%;margin-left: 0;height: 40px">
							<div class="inputLabel fl" style="width:40%;line-height:35px;">区 / 县</div>
							<select id="area" name="area" onchange="scienceChange()"
								class="inputSelect fl sel2">
								<option value="0">全部</option>
							</select>
						</div>
					</div>
					<div class="inputBorder f1" style="width:35%;height:40px;float:left;margin-right:0;margin-bottom:2%;">
						<div class="inputLabel fl" style="width:26%;line-height:35px;">景 区</div>
						<select id="scence" name="scence" class="inputSelect fl sel2"
							style="width:73%;">
							<option value="0">全部</option>
						</select>
					</div>
					<div class="inputBorder f1" style="width:35%;height:40px;float:left;margin-right:0;margin-bottom:2%;">
					<div class="inputLabel fl" style="width:40%;line-height:35px;" id="leaderdiv">负责人</div>
						<input id="leader" name="leader" type="text" class="inputMain fl"
						style="width:60%;height: 35px;"	placeholder="请输入负责人姓名" maxLength=16 />
					</div>
					<div class="inputBorder">
						<div class="inputLabel fl" id="addressdiv">单位地址</div>
						<input id="address" name="address" type="text"
							class="inputMain fl" placeholder="请输入单位地址" maxLength=32 />
					</div>
					
					<div class="inputHead" style="margin-top:1%;">
						<div class="inputHeadText fl">管理员信息</div>
						<div class="inputHeadLine fl"></div>
					</div>
					<div >
					<div class="inputBorder" style="margin-bottom:2%;width:40%;float:left;margin-right:0">
						<div class="inputLabel fl" style="width: 90px" id="phonenumdiv">管理员手机号</div>
						<input onkeyup="this.value=this.value.replace(/\D/g,'')"
							onafterpaste="this.value=this.value.replace(/\D/g,'')"
							id="phonenum" name="countyid" type="text" class="inputMain fl"
							placeholder="请输入手机号" maxLength=16 style="width: 90px"/>
					</div>
					<div class="inputBorder" style="margin-bottom:2%;width:38% ;float:left;margin-right:0;margin-left:10px">
						<div class="inputLabel fl" style="width:90px" id="logincodediv">登录帐号</div>
						<input id="logincode" name="expediteValue" type="text" style="width:50%"
							class="inputMain fl" placeholder="请输入登录帐号" maxLength=32 />
					</div>
					</div>
					<div class="inputBorder">
						<div class="inputLabel fl" style="width:90px" id="password1div">登录密码</div>
						<input id="password1" name="jamValue" type="password" style="width:50%"
							class="inputMain fl" placeholder="请输入登录密码" maxLength=20 />
					</div>
					<div class="inputBorder">
						<div class="inputLabel fl" style="width:90px" id="password2div">确认密码</div>
						<input id="password2" name="jamValue" type="password" style="width:50%"
							class="inputMain fl" placeholder="请再次输入登录密码" maxLength=20 />
					</div>
				</div>
				<div class="buttonArea" style="margin-bottom:2%;margin-top:1%;">
					<button id="saveSubmit" onclick="addOrupdateUnit();" type="submit"
						class="buttonConfirm">保 存</button>
					<button id="saveDismiss" onclick=" paramRemove();" type="submit"
						class="buttonConfirm" style="background:#D5D5D5;"
						data-dismiss="modal" aria-hidden="true">返 回</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 结束添加修改单位弹出框 -->

	<!-- 菜单配置开始 -->
	<div class="modal fade" style="margin-top: -10%;" id="myMenu"
		tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true" data-backdrop="false">
		<div class="modal-dialog" style="margin-top:10%;width:40%;">
			<div class="modal-content">
				<div class="modal-header addHead">
					<div type="button" class="fr closeButton" data-dismiss="modal"
						aria-hidden="true"
						style="width:15px;height: 15px; background: url(../img/close.jpg) no-repeat center center;">
					</div>
					<h4 class="modal-title" id="myModalLabel"
						style="background: url(../img/allocation.png) no-repeat left center;padding-left: 23px;font-size:16px;font-family:'微软雅黑';color:#ffffff;"">
						菜单配置</h4>
				</div>
				<div class="modal-body" id="allocation">
					<div class="inputHead" style="margin-top:10px;">
						<div class="inputHeadText fl">菜单选项</div>
						<div class="inputHeadLine fl"></div>
					</div>

					<div class="chooseButtonGroup" id="getMenu"></div>
					<div id="getSubMenu"></div>
					<div class="buttonArea" style="clear: both;padding-top: 15px;">
						<input type="hidden" id="usermenuid" />
						<button type="submit" class="buttonConfirm" onclick="editMenu()"
							style="color:#fff">确定</button>
						<button type="submit" class="buttonConfirm"
							style="background:#D5D5D5;color:#fff;" data-dismiss="modal"
							aria-hidden="true">返 回</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 菜单配置结束 -->

	<!-- 操作信息提示框开始 -->
	<div class="modal fade" id="updateStatusConfirm" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
		data-backdrop="false">
		<div class="modal-dialog" style="margin-top:10%;width:30%;">
			<div class="modal-content">
				<div class="modal-header addHead">
					<input type="hidden" value="" id="unidOfchangeStatus"></input> <input
						type="hidden" value="" id="statusOfchangeStatus"></input>
					<div type="button" class="fr closeButton" data-dismiss="modal"
						aria-hidden="true"
						style="width:15px;height: 15px; background: url(../img/close.jpg) no-repeat center center;">
					</div>
					<h4 class="modal-title" id="myModalLabel"
						style="background:url(../img/huifuIco.png) no-repeat left center;padding-left: 23px;font-size:16px;font-family:'微软雅黑';color:#ffffff;"">
						提示</h4>
				</div>
				<div class="modal-body"
					style="color:#666666;text-align:center;font-size:16px;"
					id="comfirmMsg">
					<!--添加文区域-->
				</div>
				<div class="buttonArea">
					<button type="submit" class="buttonConfirm" onclick="deleteUnit();"
						data-dismiss="modal">确 定</button>
					<button type="submit" class="buttonConfirm"
						style="background:#D5D5D5;" data-dismiss="modal"
						aria-hidden="true">取 消</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 操作信息提示框结束 -->
<script type="text/javascript" src="../js/select2.min.js"></script>	
	<script src="${home}/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="${home}/js/dataTables.bootstrap.js"></script>
	<!-- 引用js函数的jsp页面 -->
	<jsp:include flush='true' page='unitInfor_js.jsp'></jsp:include>
</body>
<script type="text/javascript">
	var unitNameFlag = "";//记录单位名称，修改时若单位名称未改变则记录false，后台将不做判断单位名是否重复，否则将判断

	function paramRemove() {
		$("#unid").val("");
		$("#unitname").val("");
		$("#city").val("0");
		$("#area").val("0");
		$("#scence").val("0");
		$("#address").val("");
		$("#leader").val("");
		$("#phonenum").val("");
		$("#logincode").val("");
		$("#password1").val("");
		$("#password2").val("");
		$("#title").empty();
		$("#title").append("添加单位");
	}
	function paramValidate() {
		var unitname = $("#unitname").val();
		var city = $("#city").val();
		var area = $("#area").val();
		var scence = $("#scence").val();
		var address = $("#address").val();
		var leader = $("#leader").val();
		var phonenum = $("#phonenum").val();
		var logincode = $("#logincode").val();
		var password1 = $("#password1").val();
		var password2 = $("#password2").val();
		if (unitname == "" || unitname == null || unitname == "请输入单位名称") {
			$("#unitnamediv").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "请输入单位名称",
				bg : "red", //背景色，默认为红色
				time : 1
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#unitnamediv").focus();
			return false;
		} else if (city == "" || city == null) {
			$("#city").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "请选择省市",
				bg : "red", //背景色，默认为红色
				time : 1
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#city").focus();
			return false;
		} else if (area == "" || area == null) {
			$("#area").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "请选择区县",
				bg : "red", //背景色，默认为红色
				time : 1
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#area").focus();
			return false;
		} else if (scence == "" || scence == null) {
			$("#scence").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "请选择景区",
				bg : "red", //背景色，默认为红色
				time : 1
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#scence").focus();
			return false;
		} else if (address == "" || address == null || address == "请输入单位地址") {
			$("#addressdiv").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "请输入单位地址",
				bg : "red", //背景色，默认为红色
				time : 1
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#addressdiv").focus();
			return false;
		} else if (leader == "" || leader == null || leader == "请输入负责人姓名") {
			$("#leaderdiv").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "请输入负责人姓名",
				bg : "red", //背景色，默认为红色
				time : 1
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#leaderdiv").focus();
			return false;
		} else if (phonenum == "" || phonenum == null || phonenum == "请输入手机号") {
			$("#phonenumdiv").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "请输入管理员手机号",
				bg : "red", //背景色，默认为红色
				time : 1
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#phonenumdiv").focus();
			return false;
		} else if (!(phonenum && /^1[3|4|5|8]\d{9}$/.test(phonenum))) {
			$("#phonenumdiv").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "手机号格式有误，请重新输入",
				bg : "red", //背景色，默认为红色
				time : 1
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#phonenumdiv").focus();
			return false;
		} else if (logincode == "" || logincode == null || logincode == "请输入登录账号") {
			$("#logincodediv").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "请输入登录账号",
				bg : "red", //背景色，默认为红色
				time : 1
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#logincodediv").focus();
			return false;
		}else if (!(/^[\da-z]+$/i.test(logincode))) {
			$("#logincodediv").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "账号应由拼音和数字组成",
				bg : "red", //背景色，默认为红色
				time : 1
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#logincodediv").focus();
			return false;
		} else if (password1 == "" || password1 == null || password1 == "请输入登录密码") {
			$("#password1div").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "请输入登录密码",
				bg : "red", //背景色，默认为红色
				time : 1
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#password1div").focus();
			return false;
		} else if (password2 == "" || password2 == null || password2 == "请再次输入登录密码") {
			$("#password2div").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "请再次输入登录密码",
				bg : "red", //背景色，默认为红色
				time : 1
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#password2div").focus();
			return false;
		} else if (password2 != password1) {
			$("#password2div").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "两次输入密码不一致",
				bg : "red", //背景色，默认为红色
				time : 1
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#password2div").focus();
			return false;
		} else if((md5password1 != password1) || (md5password2 != password2)){
			if(!checkpassword1($("#password1").val())){
				return false;
			}else{
				return true;
			}
		} else{
			return true;
		}
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
	function scienceChange() {
		$("#scence").empty();
		$("#scence").append("<option value='0'>全部</option>");
		var areaid = $("#area").val();
		if (areaid == "0") {
			$("#scence").attr("disabled", "disabled");
		} else {
			$("#scence").attr("disabled", false);
		}
		$.ajax({
			type : "post",
			dataType : "json",
			url : "${home}/unit/getScenceByareaId.html?areaid=" + areaid,
			async : false,
			success : function(data) {
				for (var i = 0; i < data.length; i++) {
					$("#scence").append(
							"<option  class='scenceSelecter' value='"+data[i].scenicid+"'>"
									+ data[i].scenicName + "</option>");
				}
				$("#scence").select2("val", 0);
			}
		});
	}
	function addOrupdateUnit(unid) {
		var updateFlag = "0";//0表示单位名称有改变
		if (!paramValidate()) {
			return;
		}
		if (unitNameFlag == $("#unitname").val()) {
			updateFlag = "1";
		}
		var unid = $("#unid").val();
		var unitname = $("#unitname").val();
		var city = $("#city").val();
		var area = $("#area").val();
		var scence = $("#scence").val();
		var address = $("#address").val();
		var leader = $("#leader").val();
		var phonenum = $("#phonenum").val();
		var logincode = $("#logincode").val();
		var password1 = $("#password1").val();
		var password2 = $("#password2").val();
		$.ajax({
			type : "post",
			dataType : "text",
			url : "${home}/unit/addOrUpdateUnit.html",
			async : false,
			data : {
				updateFlag : updateFlag,
				unid : unid,
				unitname : unitname,
				city : city,
				area : area,
				scence : scence,
				address : address,
				leader : leader,
				phonenum : phonenum,
				logincode : logincode,
				password1 : password1,
				password2 : password2,
				md5password1 : md5password1,
				md5password2 : md5password2
			},
			success : function(data) {
				if (data == '2') {
					toastr.success("操作成功！");
					$("#saveDismiss").click();
					tableUnit.ajax.reload(null, false);
				} else {
					toastr.error(data);
				}
				//tableUnit.ajax.reload(null, false);
			}
		});
	}
	function sendUnid(unid, name,username) {
		unitNameFlag = name;
		$("#title").empty();
		$("#title").append("修改单位");
		$("#unid").val(unid);
		$.ajax({
			type : "post",
			dataType : "json",
			url : "${home}/unit/getUnitByUnid.html?unid=" + unid,
			async : false,
			success : function(data) {
				$("#unitname").val(data.name);
				//$("#city").val(data.cityid);
				$("#city").select2("val", data.cityid);
				areaChange();
				//$("#area").val(data.areaid);
				$("#area").select2("val", data.areaid);
				scienceChange();
				//$("#scence").val(data.scenicid);
				$("#scence").select2("val", data.scenicid);
				$("#address").val(data.address);
				$("#leader").val(data.leader);
				$(".citySelecter").find("option[value='" + data.cityid + "']")
						.attr("selected", true);
				$(".areaSelecter").find("option[value='" + data.areaid + "']")
						.attr("selected", true);
				$(".scenceSelecter").find(
						"option[value='" + data.scenicid + "']").attr(
						"selected", true);
			}
		});
		$.ajax({
			type : "post",
			dataType : "json",
			url : "${home}/unit/getUserByUsername.html?username=" + username,
			async : false,
			success : function(data) {
				$("#phonenum").val(data.phone);
				$("#logincode").val(data.username);
				$("#password1").val(data.password);
				$("#password2").val(data.password);
				md5password1 = data.password;
				md5password2 = data.password;
			}
		});
	}

	//密码验证，6-32位数字或字母组成
	function checkpassword1(password1) {
		var str = password1;
		if (str.match(/^[0-9A-Za-z]{6,20}$/)) {
			return true;
		} else {
			$("#password1div").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "密码格式有误，请输入6-20位数字或字母的密码！",
				bg : "red", //背景色，默认为红色
				time : 3
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#password1div").focus();
			return false;
		}
	}
</script>
</html>