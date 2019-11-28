<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	request.setAttribute("home", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="${home}/css/select2.css" />
<link rel="stylesheet" type="text/css" href="${home}/css/compiled/theme_styles.css" />
<link rel="stylesheet" type="text/css" href="${home}/css/bootstrap.css"/>
<link rel="stylesheet" type="text/css" href="${home}/css/bootstrap/dataTables.bootstrap.css" /> 
<link rel="stylesheet" type="text/css" href="${home}/css/libs/font-awesome.css"/>
<link rel="stylesheet" type="text/css" href="${home}/css/libs/nanoscroller.css"/>
<link rel="stylesheet" type="text/css" href="${home}/css/caidan.css"/>
<link rel="stylesheet" type="text/css" href="${home}/css/kuangjia.css"/>
<link rel="stylesheet" type="text/css" href="${home}/css/toastr.css" />

<style>
html { overflow-x:hidden; }
.addButton{width: 100px;
           height: 32px;
		   text-align: center;
           background: #fdc006 ;
           border: none;
           border-radius: 5px;
           color:#fff}
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
.form-group {
    margin-right: -15px;
    margin-left: -15px;
    margin-top: 5px;
    margin-bottom: 8px;
}
.modal-header {
    min-height: 10px;
    padding: 8px;
    border-bottom: 1px solid #e5e5e5;
}
label{color:#666666;font-weight: normal;}
.parButtonActive{color: #ffffff;background:#57A3F1 ;}     
</style>
<script src="../js/jquery.js"></script>
<script src="../js/bootstrap.js"></script>
<script src="../js/jquery.nanoscroller.min.js"></script>
<script src="../js/demo.js"></script>
<script src="../js/scripts.js"></script>
<script src="../js/jquery.tips.js"></script>
<script type="text/javascript" src="${home}/js/toastr.min.js"></script>
</head>
<body>
<div class="row"  style="padding-left:10px;">
					<div class="col-md-2 fl" style="padding-left:5px;width: 10%;margin-top: 10px;">
						<select class="sel2" style="width:100%"  id="searchStatus">
							<option value="0">启用</option>
							<option value="1">停用</option>
						</select>
					</div>
					<div class="col-md-3 fl" style="padding-left: 0;width: 15%;margin-top: 10px;">
						<select class="sel2" style="width:100%" id="searchUnitName">
						<option  value="">全部单位</option>
						</select>
					</div>
					<div class="col-md-2 fl" style="padding-left: 0;width:15%;">
						<input type="text" id="getUserName" class="form-control"  style="margin-top:10px;" placeholder="请输入姓名"> 
					</div>
					<div class="col-md-1 fl" style="padding-left: 0;width: 15%;white-space: nowrap;overflow: hidden;margin-top: 10px;">
						<button type="button" class="btn btn-default headConfirm" onclick="searchUser();">搜索</button>
					</div>
					<div class="col-md-4  fr" style="text-align: right;width:20%;white-space: nowrap;overflow: hidden;margin-top: 10px;">
						<button class="addButton " type="submit" data-toggle="modal" data-target="#myModal"><img src="../img/addButton.png" />添加</button>
					</div>
				</div>

<div class="modal fade" style="margin-top: -5%" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="false">
<div class="modal-dialog" style="margin-top:5%;width:620px;">
			<div class="modal-content" >
				<div class="modal-header addHead">
					<div type="button" class="fr closeButton" data-dismiss="modal" aria-hidden="true" style="width:15px;height: 15px; background: url(../img/close.jpg) no-repeat center center;"  onclick="clearUser();">
					</div>
					<h4 class="modal-title"   style="background: url(../img/add.png) no-repeat left center;padding-left: 23px;color:#fff;">
						添加用户
					</h4>
				</div>
<div class="modal-body">
<form class="form-horizontal" role="form">
<div class="form-group">
 <label for="firstname" class="col-sm-2 control-label" >用户名：</label>
 <div class="col-sm-10">
<input type="text" class="form-control" id="name" placeholder="用户名" maxLength=32>
</div>
</div>
<div class="form-group">
 <label for="firstname" class="col-sm-2 control-label">登录名：</label>
 <div class="col-sm-10">
<input type="text" class="form-control" id="username" placeholder="登录名" maxLength=32>
</div>
</div>
<div class="form-group">
 <label for="firstname" class="col-sm-2 control-label">手机号：</label>
 <div class="col-sm-10">
<input type="text" class="form-control" id="phone" placeholder="手机号" maxLength=32>
</div>
</div>
<div id="pwd" class="form-group">
 <label for="firstname" class="col-sm-2 control-label">登录密码：</label>
 <div class="col-sm-10" id="passworddiv">
<input type="password" class="form-control" id="password" placeholder="登录密码" maxLength=32>
</div>
</div>
<div id="pwd2" class="form-group">
 <label for="firstname"  class="col-sm-2 control-label" >确认密码：</label>
 <div class="col-sm-10" id="conpassworddiv">
<input type="password" class="form-control" id="conpassword" placeholder="确认密码" maxLength=32>
</div>
</div>
<div class="inputHead" style="margin-top: 5px;margin-bottom: 5px;">
						<div class="inputHeadText fl" style="width: 11%;">管理景区</div>
						<div class="inputHeadLine fl"></div>
					</div>
<div class="form-group">
<label for="firstname" class="col-sm-2 control-label">管理景区：</label>
 <div class="col-sm-7">
<input type="hidden" id="allscenicid"/> 
<input type="text" class="form-control" id="scenicName" readonly="true" placeholder="请选择景区"/>
</div>
<div class="col-sm-3">
<button type="button"  class="btn btn-primary" data-toggle="modal" data-target="#myScenic" onclick="setjingqu();" style="margin-top:0px;background: #57a3f1;">选择景区</button>
</div>
</div>		
</form>
</div>
<div  class="buttonArea" style="clear: both;padding-top: 0px;">
					<button type="submit" class="buttonConfirm" id="btnSave" onclick="addUser();" style="color:#fff">添加</button>
					<button type="submit" class="buttonConfirm" style="background:#D5D5D5;color:#fff;" data-dismiss="modal" aria-hidden="true"  onclick="clearUser();" >返 回</button>
</div>
</div> 
</div> 
</div> 
<div class="modal fade" style="margin-top: -5%" id="myModalEdit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="false">
<div class="modal-dialog" style="margin-top:5%;width:620px;">
			<div class="modal-content" >
				<div class="modal-header addHead">
					<div type="button" class="fr closeButton" data-dismiss="modal" aria-hidden="true" style="width:15px;height: 15px; background: url(../img/close.jpg) no-repeat center center;">
					</div>
					<h4 class="modal-title"   style="background: url(../img/modify.png) no-repeat left center;padding-left: 23px;color:#fff;">
						修改用户
					</h4>
				</div>
<div class="modal-body">
<form class="form-horizontal" role="form">
<input id="id" type="hidden">
<div class="form-group">
 <label for="firstname" class="col-sm-2 control-label">用户名：</label>
 <div class="col-sm-10">
<input type="text" class="form-control" id="name2" placeholder="用户名" maxLength=32>
</div>
</div>
<div class="form-group">
 <label for="firstname" class="col-sm-2 control-label">登录名：</label>
 <div class="col-sm-10">
<input type="text" class="form-control" id="username2" placeholder="登录名" maxLength=32>
</div>
</div>
<div class="form-group">
 <label for="firstname" class="col-sm-2 control-label">手机号：</label>
 <div class="col-sm-10">
<input type="text" class="form-control" id="phone2" placeholder="手机号" maxLength=32>
</div>
</div>
<div id="pwd" class="form-group">
 <label for="firstname" class="col-sm-2 control-label">登录密码：</label>
 <div class="col-sm-10" id="password2div">
<input type="password" class="form-control" id="password2" placeholder="登录密码" maxLength=32>
</div>
</div>
<div id="pwd2" class="form-group">
 <label for="firstname" class="col-sm-2 control-label">确认密码：</label>
 <div class="col-sm-10" id="password2div">
<input type="password" class="form-control" id="conpassword2" placeholder="确认密码" maxLength=32>
</div>
</div>
<div class="inputHead" style="margin-top: 5px;margin-bottom: 5px;">
						<div class="inputHeadText fl" style="width: 11%;">管理景区</div>
						<div class="inputHeadLine fl"></div>
					</div>
<div class="form-group">
<label for="firstname" class="col-sm-2 control-label">管理景区：</label>
 <div class="col-sm-7">
<input type="hidden" id="userid2"/> 
<input type="hidden" id="allscenicid2"/> 
<input type="text" class="form-control"  readonly="true" id="scenicName2" placeholder="请选择景区"/>
</div>
<div class="col-sm-3">
<button type="button"  class="btn btn-primary" data-toggle="modal" data-target="#myScenic2" style="margin-top:0px; background: #57a3f1;">选择景区</button><!-- setjingqu2() -->
</div>
</div>
</form>
</div>
<div  class="buttonArea" style="clear: both;margin-top: 0px;">
					<button type="submit" class="buttonConfirm" id="btnEdit" onclick="editUser();" style="color:#fff">确定</button>
					<button type="submit" class="buttonConfirm" style="background:#D5D5D5;color:#fff;" data-dismiss="modal" aria-hidden="true" >返 回</button>
</div>
</div> 
</div> 
</div>
<!-- 菜单配置 -->
<div class="modal fade" style="margin-top: -10%" id="myMenu" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="false">
			<div class="modal-dialog" style="margin-top:10%;width:600px;">
			<div class="modal-content" >
				<div class="modal-header addHead">
					<div type="button" class="fr closeButton" data-dismiss="modal" aria-hidden="true" style="width:15px;height: 15px; background: url(../img/close.jpg) no-repeat center center;">
					</div>
					<h4 class="modal-title" id="myModalLabel"  style="background: url(../img/allocation.png) no-repeat left center;padding-left: 23px; color:#fff">
						菜单配置
					</h4>
				</div>
				<div class="modal-body"  id="allocation">
					<div class="inputHead" style="margin-top:10px;">
						<div class="inputHeadText fl">菜单选项</div>
						<div class="inputHeadLine fl"></div>
					</div>
					
				 <div class="chooseButtonGroup" id="getMenu">
				 </div>
				 <div id="getSubMenu"></div>
				<div  class="buttonArea" style="clear: both;padding-top: 15px;">
				    <input type="hidden" id="usermenuid"/> 
					<button type="submit" class="buttonConfirm"  onclick="editMenu()" style="color:#fff">确定</button>
					<button type="submit" class="buttonConfirm" style="background:#D5D5D5;color:#fff;" data-dismiss="modal" aria-hidden="true" >返 回</button>
				</div>
			</div>
		</div>
	</div>
	
		</div> 
		
		<!-- 景区配置 -->
<div class="modal fade" id="myScenic" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true"  data-backdrop="false">
			<div class="modal-dialog">
			<div class="modal-content" >
				<div class="modal-header addHead">
					<div type="button" class="fr closeButton" data-dismiss="modal" aria-hidden="true" style="width:15px;height: 15px; background: url(../img/close.jpg) no-repeat center center;">
					</div>
					<h4 class="modal-title" id="myModalLabel"  style="background: url(../img/choose.png) no-repeat left center;padding-left: 23px;color:#fff">
						选择景区
					</h4>
				</div>
				<div class="modal-body">
					<div class="headButton">
						<button type="button"  id="setScenic" onclick="selectScenic()">全选</button>
					</div>	
					<div class="inputHeadLine" style="width: 100%;"></div>
					<div id="getScenic2">
				
					</div>
					<div  class="buttonArea" style="margin-top:25px ;">
						<button type="submit" class="buttonConfirm"  onclick="saveScenicId();" style="color:#fff">确 定</button>
						<button type="submit" class="buttonConfirm" style="background:#D5D5D5;color:#fff" data-dismiss="modal" aria-hidden="true">返 回</button>
					</div>
				</div>
		</div>
	</div>
		</div> 
		
		<div class="modal fade" id="myScenic2" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="false">
			<div class="modal-dialog">
			<div class="modal-content" >
				<div class="modal-header addHead">
					<div type="button" class="fr closeButton" data-dismiss="modal" aria-hidden="true" style="width:15px;height: 15px; background: url(../img/close.jpg) no-repeat center center;">
					</div>
					<h4 class="modal-title" id="myModalLabel"  style="background: url(../img/choose.png) no-repeat left center;padding-left: 23px;color:#fff">
						选择景区
					</h4>
				</div>
				<div class="modal-body">
					<div class="headButton">
						<button type="button"  id="setScenic" onclick="selectScenic()">全选</button>
					</div>	
					<div class="inputHeadLine" style="width: 100%;"></div>
					<div id="getScenic1">
				
					</div>
					<div  class="buttonArea" style="margin-top:25px ;">
						<button type="submit" class="buttonConfirm"  onclick="saveScenicId2();">确 定</button>
						<button type="submit" class="buttonConfirm" style="background:#D5D5D5;" data-dismiss="modal" aria-hidden="true">返 回</button>
					</div>
				</div>
		</div>
	</div>
		</div> 
<!-- 操作信息提示框开始-->
	<div class="modal fade" id="delcfmModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="false">
		<div class="modal-dialog" style="margin-top:10%;width:30%;">
			<div class="modal-content" style="border-radius:5px;border:none;height:145px;">
				<div class="modal-header addHead">
					<input type="hidden" value="" id="unidOfchangeStatus"></input>
					<input type="hidden" value="" id="statusOfchangeStatus"></input>
					<div type="button" class="fr closeButton" data-dismiss="modal" aria-hidden="true" style="width:15px;height: 15px; background: url(../img/close.jpg) no-repeat center center;">
					</div>
					<h4 class="modal-title" id="myModalLabel"  style="background:url(../img/tishi.png) no-repeat left center;padding-left: 26px;font-size:18px;font-family:'微软雅黑'">
						提示
					</h4>
				</div>
				<div class="modal-body"  style="color:#666666;text-align:center;font-size:16px;">
				停用该用户
				</div>
				<div  class="buttonArea">
				    <input type="hidden" id="userid"/> 
					<button type="submit" class="buttonConfirm" onclick="delSubmit();" data-dismiss="modal">确 定</button>
					<button type="submit" class="buttonConfirm"  style="background:#D5D5D5;" data-dismiss="modal" aria-hidden="true">取 消</button>
				</div>
			</div>
		</div>
	</div> 
	 
	<div class="modal fade" id="changeStatusModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="false">
		<div class="modal-dialog" style="margin-top:10%;width:300px;">
			<div class="modal-content">
				<div class="modal-header addHead">
					<input type="hidden" value="" id="unidOfchangeStatus"></input>
					<input type="hidden" value="" id="statusOfchangeStatus"></input>
					<div type="button" class="fr closeButton" data-dismiss="modal" aria-hidden="true" style="width:15px;height: 15px; background: url(../img/close.jpg) no-repeat center center;">
					</div>
					<h4 class="modal-title" id="myModalLabel"  style="background:url(../img/huifuIco.png) no-repeat left center;padding-left: 23px;">
						提示
					</h4>
				</div>
				<div class="modal-body"  style="color:#666666;text-align:center;font-size:16px;" id="comfirmMsg">
				启用该用户
				</div>
				<div  class="buttonArea">
				    <input type="hidden" id="userids"/> 
					<button type="submit" class="buttonConfirm" onclick="changeStatus();" data-dismiss="modal">确 定</button>
					<button type="submit" class="buttonConfirm"  style="background:#D5D5D5;" data-dismiss="modal" aria-hidden="true">取 消</button>
				</div>
			</div>
		</div>
	</div> 
<div class="main-box-body clearfix" style=" margin-top:10px;margin-left: 5px">
		<div id="table-example_wrapper"
			class="dataTables_wrapper form-inline dt-bootstrap no-footer">
<table id="userInfo" class="table table-hover dataTable no-footer table-striped table-bordered" cellspacing="0" width="100%" role="grid">
<thead>
<tr style="background:#57a3f1; color: #fff;font-size: small; ">
  <th style=" text-align: center;padding-top:15px;padding-bottom:15px;">序号</th>
  <th style=" text-align: center;padding-top:15px;padding-bottom:15px;">用户名</th>
  <th style=" text-align: center;padding-top:15px;padding-bottom:15px;">登录名</th>
  <th style=" text-align: center;padding-top:15px;padding-bottom:15px;">手机号</th>
  <th style=" text-align: center;padding-top:15px;padding-bottom:15px;">景区权限</th>
  <th style=" text-align: center;padding-top:15px;padding-bottom:15px;">单位</th>
  <th style=" text-align: center; width:100px;padding-top:15px;padding-bottom:12px;">操作</th>
</tr>
</thead>
<tbody  style="text-align:center;color:#666666;font-size: 0.875em;">
</tbody>
</table>
</div>
</div>
<script type="text/javascript" src="${home}/js/select2.min.js"></script>		
<script src="${home}/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" language="javascript"  src="${home}/js/dataTables.bootstrap.js"></script>
<script>
var mouseStartPoint = {"left":0,"top":  0};  
var mouseEndPoint = {"left":0,"top":  0};  
var mouseDragDown = false;  
var oldP = {"left":0,"top":  0};  
var moveTartet ;  
var table;
var deleteFlag=false;
var searchStatus;
var searchUnitName;
var getUserName;

//判断浏览器是否支持 placeholder属性
function isPlaceholder(){
    var input = document.createElement('input');
    return 'placeholder' in input;
}
$(document).ready(function() {
	if (!isPlaceholder()) {//不支持placeholder 用jquery来完成
        $(document).ready(function() {
            if(!isPlaceholder()){
                $("input").not("input[type='password']").each(//把input绑定事件 排除password框
                        function(){
                            if($(this).val()=="" && $(this).attr("placeholder")!=""){
                                $(this).val($(this).attr("placeholder"));
                                $(this).css("color","grey");
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
      //对password框的特殊处理1.创建一个text框 2获取焦点和失去焦点的时候切换
        $("input[type='password']").each(
                    function() {
	                    var pwdField    = $(this);
                    	if(pwdField.val() =="" ||undefined || null){
	                        var pwdVal      = pwdField.attr('placeholder');
	                        pwdField.after('<input  style="color:grey" class="form-control loginFalseMsg loginInput paddwordBg" type="text" value='+pwdVal+' autocomplete="off" />');
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
	//拖拽弹出框
	$(document).on("mousedown",".modal-header",function(e){  
        if($(e.target).hasClass("close"))//点关闭按钮不能移动对话框  
            return;  
        mouseDragDown = true;  
        moveTartet = $(this).parent();  
        mouseStartPoint = {"left":e.clientX,"top":  e.clientY};  
        oldP = moveTartet.offset();  
    });  
    $(document).on("mouseup",function(e){  
        mouseDragDown = false;  
        moveTartet = undefined;  
        mouseStartPoint = {"left":0,"top":  0};  
        oldP = {"left":0,"top":  0};  
    });  
    $(document).on("mousemove",function(e){  
        if(!mouseDragDown || moveTartet == undefined)return;  
        var mousX = e.clientX;  
        var mousY = e.clientY;  
        if(mousX < 0)mousX = 0;  
        if(mousY < 0)mousY = 25;  
        mouseEndPoint = {"left":mousX,"top": mousY};  
        var width = moveTartet.width();  
        var height = moveTartet.height();  
        mouseEndPoint.left = mouseEndPoint.left - (mouseStartPoint.left - oldP.left);//移动修正，更平滑  
        mouseEndPoint.top = mouseEndPoint.top - (mouseStartPoint.top - oldP.top);  
        moveTartet.offset(mouseEndPoint);  
    }); 
    
    
    //
    $(".userScenery").click(function(){
  	  $(".userScenerySpreadBg").toggle();
  	  $(this).toggleClass("userSceneryBg");
    	$(this).siblings().removeClass("userSceneryBg");
  	  });
	//加载表格
	 table = $('#userInfo').DataTable({
		"dom": 'tipr',//自定义显示项
		"lengthMenu": [
	                   [5, 8, 10, -1],
	                   [5, 8, 10, "所有"]
	               ],//每页显示条数设置
	               "lengthChange": true,//是否允许用户自定义显示数量
	               "bPaginate": true, //翻页功能
	               "pagingType":"full_numbers",//分页显示的格式 （默认simple_numbers）
	               "bFilter": false, //列筛序功能
	               "searching": true,//本地搜索
	               "ordering": true, //排序功能
	               "Info": true,//页脚信息
	               "autoWidth": true,//自动宽度
	               "oLanguage": {//国际语言转化
	                   "oAria": {
	                       "sSortAscending": " - click/return to sort ascending",
	                       "sSortDescending": " - click/return to sort descending"
	                   },
	                   "sLengthMenu": "显示 _MENU_ 记录",
	                   "sZeroRecords": "对不起，查询不到任何相关数据",
	                   "sEmptyTable": "未有相关数据",
	                   "sLoadingRecords": "正在加载数据-请等待...",
	                   "sInfo": "当前显示 _START_ 到 _END_ 条，共 _TOTAL_ 条记录。",
	                   "sInfoEmpty": "当前显示0到0条，共0条记录",
	                   "sInfoFiltered": "（数据库中共为 _MAX_ 条记录）",
	                   "sProcessing": "正在加载数据...",
	                   "sSearch": "模糊查询：",
	                   "sUrl": "",
	                   //多语言配置文件，可将oLanguage的设置放在一个txt文件中，例：Javascript/datatable/dtCH.txt
	                   "oPaginate": {
	                       "sFirst": "首页",
	                       "sPrevious": " 上一页 ",
	                       "sNext": " 下一页 ",
	                       "sLast": " 尾页 "
	                   }
	               },
		 ajax: {
		        //指定数据源
		        url: "<%=path%>/userController/userData.html",
		        type : "POST",
		        "data": function ( d ) {//向后台传递参数，需要时后台可以接收使用
		        	d.searchStatus=searchStatus;
			        d.searchUnitName = searchUnitName;
			        d.searchUserName = getUserName;
			    }
              },
		    "iDisplayLength":5 , 
		    //每页显示8条数据
		   // pageLength: 8,
		    bStateSave : false,
		    columns: [{
		        "data": null, //此列不绑定数据源，用来显示序号
		        "orderable" : false
		    },
		    {
		        "data": "name",
		        "orderable" : false
		    },
		    {
		        "data": "userName",
		        "orderable" : false
		    },
		    {
		        "data": "phone",
		        "orderable" : false
		    },
		    {
		        "data": "scenic",
		        "orderable" : false,
		      //  "render":	function ( data, type, full, meta ) {
		     //   if(data==0){return "超级管理员";}
		      //  else if(data==1){return "单位管理员";}
		      //  else if(data==2){return "普通员工";}
		     //   }
		    },
		    {
		    	"data":"unit",
		    	"orderable" : false
		    },
		    {
	            "data": "id",
	            "orderable" : false,
	            "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
	            	if(oData.delflag==0){
	                $(nTd).html("").append("<div style='float:left;margin-left:15px'><img src='../img/xiugai.png'    onclick='_editFun(\"" + oData.id + "\",\"" + oData.name + "\",\"" + oData.userName  + "\",\""+ oData.phone + "\",\"" + oData.password + "\")'/></div>")
	               .append("<div style='float:left;margin-left:15px'><img src='../img/peizhi.png'   onclick='_editMenu(\"" + sData + "\")' /></div>")
	               .append("<div style='float:left;margin-left:15px'><img src='../img/jinyong.png'   onclick='_deleteFun(\"" + sData + "\")' data-toggle='modal' data-target='#delcfmModel'/></div>")
	            	}else{
	            		$(nTd).html("").append("<div style='float:left;margin-left:15px'><a data-toggle='modal' data-toggle='tooltip' data-placement='bottom' title='停用的用户不可修改'> <img src='../img/xiugaihui.png' /></a></div>")
	 	               .append("<div style='float:left;margin-left:15px'><a data-toggle='modal' data-toggle='tooltip' data-placement='bottom' title='停用的用户不可配置菜单'> <img src='../img/peizhihui.png' /></a></div>")	
	 	               .append("<div style='float:left;margin-left:15px'><img src='../img/qiyong.png'   onclick='_changeStatus(\"" + sData + "\")' data-toggle='modal' data-target='#changeStatusModel'/></div>")
	            	}
	                
	            }
	        }
		    ],
		    //columnDefs 这个里面配置的作用是，禁用第一列的搜索和排序。为什么？因为第一列是行号排序还搜索已经没有意义了
		    "columnDefs": [{
		    	"searchable": false,
                "orderable": false,
                "targets": 0
		    }]
		});
	  //设置行号
	  //on 为 jQuery 里监听事件的方法，给元素绑定监听事件，这里监听了 order.dt 、search.dt 两个事件，意思是当排序和搜索后，重新生成行号
	  //t.column(0,{selector}).nodes() 这个的作用是获取第一列的 DOM 元素，接着用 each 方法遍历，把行号设置进去。
	  //draw 最后一个重绘方法，生成序号后，重新绘制。DT 的每个操作，包括排序、过滤、翻页还是自己使用API操作这些操作或者是设置了数据都要再调用 draw 方法才行
	  table.on('order.dt search.dt',
		function() {
		  table.column(0, {
		        "search": 'applied',
		        "order": 'applied'
		    }).nodes().each(function(cell, i) {
		        cell.innerHTML = i + 1;
		    });
		}).draw();
	  
getUnit();//加载单位 
});
function getUnit(){
$.ajax({
	    type: 'POST',
	    url: '<%=path%>/userController/getUnit.html',
	    dataType: "json",
	    success: function (data) {
	    	for(var i=0;i<data.length;i++){
                	$("#searchUnitName").append("<option value='"+data[i].unid+"'  selected='selected'>"+data[i].name+"</option>");
           }
	     }
	});
}	

/**
 * 查询
 */
function searchUser(){
	searchStatus = $("#searchStatus").val();
	searchUnitName = $("#searchUnitName").val();
	getUserName = $("#getUserName").val();
	if(getUserName == "请输入姓名"){
		getUserName = "";
	}
	table.ajax.url("<%=path%>/userController/searchUser.html").load();//改变url重新获取数据源
}


/**
 * 清空
 */
function clearUser(){
	var name=$("#name").val("");
	var username=$("#username").val("");
	var phone=$("#phone").val("");
	var password=$("#password").val("");
	var conpassword=$("#conpassword").val("");
	var allscenicid=$("#allscenicid").val("");
	var scenicName=$("#scenicName").val("");
}

function Trim(str)
{ 
    return str.replace(/(^\s*)|(\s*$)/g, ""); 
}


function paramValidate() {
	var name=Trim($("#name").val());
	var username=Trim($("#username").val());
	var phone=Trim($("#phone").val());
	var password=Trim($("#password").val());
	var conpassword=$("#conpassword").val();
	var allscenicid=$("#allscenicid").val();
	var scenicName=$("#scenicName").val();
	var re = /^[\u4e00-\u9fa5a-z]+$/gi;    //去除特殊字符
	var myreg =/^0?1[3|4|5|8][0-9]\d{8}$/; //去除特殊电话
	if(name==null||name==""||name.length==0||name=="用户名"){
		$("#name").tips({
			side:3,               //1,2,3,4 分别代表 上右下左
            msg:'输入用户名',
            bg:'red',         //背景色，默认为红色
            time:2               //默认为2 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
        });
		
		$("#name").focus();
		return false;
	}else if(!re.test(name)){
		$("#name").tips({
			side:3,
            msg:'不能为特殊字符！',
            bg:'red',
            time:2
        });
		
		$("#name").focus();
		return false;
	}
	if(username=="" || username.length==0 || username=="登录名"){
		$("#username").tips({
			side:3,
            msg:'输入登录名',
            bg:'red',
            time:2
        });
		
		$("#username").focus();
		return false;
	}
	
	if(phone=="" ||phone==null || phone=="手机号"){
		$("#phone").tips({
			side:3,
            msg:'输入电话号码',
            bg:'red',
            time:2
        });
		return false;
	}else if(phone.length != 11 || !myreg.test(phone)){
		$("#phone").tips({
			side:3,
            msg:'手机号格式不正确',
            bg:'red',
            time:2
        });
		$("#PHONE").focus();
		return false;
	}
	if(password=="" || password=="登录密码"){
		$("#passworddiv").tips({
			side:3,
            msg:'输入密码',
            bg:'red',
            time:2
        });
		
		$("#passworddiv").focus();
		return false;
	}
	if(conpassword=="" || conpassword=="确认密码"){
		$("#conpassworddiv").tips({
			side:3,
            msg:'不能为空',
            bg:'red',
            time:2
        });
		
		$("#conpassworddiv").focus();
		return false;
	}
	if(!checkpassword1(password)){
		return false;
	}
	if(password!=conpassword){
		
		$("#conpassworddiv").tips({
			side:3,
            msg:'两次密码不相同',
            bg:'red',
            time:2
        });
		
		$("#conpassworddiv").focus();
		return false;
	}
	if(scenicName=="" || scenicName.length==0){
		$("#scenicName").tips({
			side:3,               //1,2,3,4 分别代表 上右下左
            msg:'请选择景区',
            bg:'red',         //背景色，默认为红色
            time:2               //默认为2 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
        });
		return false;
	}
	return true;
}
//密码验证，6-20位数字或字母组成
	function checkpassword1(password1) {
		var str = password1;
		if (str.match(/^[0-9A-Za-z]{6,20}$/)) {
			return true;
		} else {
			$("#password").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "密码格式有误，请输入6-20位数字或字母的密码！",
				bg : "red", //背景色，默认为红色
				time : 3
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#password").focus();
			return false;
		}
	}
	function checkpassword2(password1) {
		var str = password1;
		if (str.match(/^[0-9A-Za-z]{6,20}$/)) {
			return true;
		} else {
			$("#password2").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "密码格式有误，请输入6-20位数字或字母的密码！",
				bg : "red", //背景色，默认为红色
				time : 3
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#password2").focus();
			return false;
		}
	}

/**
 * 根据用户名和电话号码判断用户是否存在
 */
function checkUserByPhone(){
	$.ajax({
	    type: 'POST',
	    url: '<%=path%>/userController/add.html',
	    data: {
	    	"usernames":username,
	    	"phone":phone
	    },
	    success: function (data) {
	        if (data) {
	           toastr.success("添加成功");
	        } 
	    }
	});
}
/**
 * 新增用户
 */
function addUser(){
	var name=Trim($("#name").val());
	var username=Trim($("#username").val());
	var phone=Trim($("#phone").val());
	var password=Trim($("#password").val());
	var allscenicid=$("#allscenicid").val();
	//验证
	if (!paramValidate()){
		return;
	}
	$.ajax({
	    type: 'POST',
	    url: '<%=path%>/userController/add.html',
	    data: {
	    	"name":name,
	    	"usernames":username,
	    	"phone":phone,
	    	"password":password,
	    	"allscenicid":allscenicid
	    },
	    success: function (json) {
	        if (json=="1") {
	            $("#myModal").modal("hide");
	            table.ajax.reload(null,false);
	            toastr.success("添加成功");
	            clearUser();
	        } else {
	        	toastr.error(json);
	        }
	    },
	    error :function (error) {
	    	toastr.error("添加失败");
	    }
	});
	
}


/**
* 编辑数据带出值
* 
*/

function _editFun(id, name, userName, phone,password) {
$("#name2").val(name);
$("#username2").val(userName);
$("#phone2").val(phone);
$("#id").val(id);
$("#password2").val(password);
$("#conpassword2").val(password);
$("#userid2").val(id);
//$("#scenicName2").val("");
//$("#allscenicid2").val("");
setjingqu2();
$("#myModalEdit").modal("show");
}

/**
 * 修改保存数据
 */
function editUser(){
var name=$("#name2").val();
var username=$("#username2").val();
var phone=$("#phone2").val();
var password=$("#password2").val();
var conpassword=$("#conpassword2").val();
var allscenicid2=$("#allscenicid2").val();
var scenicName=$("#scenicName2").val();
var re = /^[\u4e00-\u9fa5a-z]+$/gi;    //去除特殊字符
var myreg =/^0?1[3|4|5|8][0-9]\d{8}$/; //去除特殊电话
var id=$("#id").val();
if(name==null||name==""||name.length==0||name=="用户名"){
		$("#name2").tips({
			side:3,               //1,2,3,4 分别代表 上右下左
            msg:'输入用户名',
            bg:'red',         //背景色，默认为红色
            time:2               //默认为2 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
        });
		
		$("#name2").focus();
		return false;
	}else if(!re.test(name)){
		$("#name2").tips({
			side:3,
            msg:'不能为特殊字符！',
            bg:'red',
            time:2
        });
		
		$("#name2").focus();
		return false;
	}
	if(username=="" || username.length==0 || username=="登录名"){
		$("#username2").tips({
			side:3,
            msg:'输入登录名',
            bg:'red',
            time:2
        });
		
		$("#username2").focus();
		return false;
	}
	
	if(phone=="" ||phone==null || phone=="手机号"){
		$("#phone2").tips({
			side:3,
            msg:'输入电话号码',
            bg:'red',
            time:2
        });
		return false;
	}else if(phone.length != 11 || !myreg.test(phone)){
		$("#phone2").tips({
			side:3,
            msg:'手机号格式不正确',
            bg:'red',
            time:2
        });
		$("#phone2").focus();
		return false;
	}
	if(password=="" || password=="登录密码"){
		$("#password2div").tips({
			side:3,
            msg:'输入密码',
            bg:'red',
            time:2
        });
		
		$("#password2div").focus();
		return false;
	}
	if(!checkpassword2(password)){
		return false;
	}
	if(password!=conpassword){
		
		$("#conpassword2div").tips({
			side:3,
            msg:'两次密码不相同',
            bg:'red',
            time:2
        });
		
		$("#conpassword2div").focus();
		return false;
	}
	if(scenicName=="" || scenicName.length==0){
		$("#scenicName2").tips({
			side:3,               //1,2,3,4 分别代表 上右下左
            msg:'请选择景区',
            bg:'red',         //背景色，默认为红色
            time:2               //默认为2 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
        });
		return false;
	}
var jsonData = {
	    "id": id,
	    "name": name,
	    "username": username,
	    "phone": phone,
	    "password":password,
	    "allscenicid" : allscenicid2
	};
$.ajax({
    type: 'POST',
    url: '<%=path%>/userController/edit.html',
    data: jsonData,
    success: function (json) {
        if (json) {
            $("#myModalEdit").modal("hide");
            table.ajax.reload(null,false);
            toastr.success("修改成功");
        } else {
        	 toastr.error("修改失败");
        }
    }
});
}

/**
* 禁用
* @param id
* @private
*/

function _deleteFun(id) {
$("#userid").val(id);//把值赋给隐藏的userid
}

function _changeStatus(id){
$("#userids").val(id);	
}

function changeStatus(){
	var id=$("#userids").val();
	$.ajax({
	    url: "<%=path%>/userController/qiyong.html",
	    data: {"id": id},
	    type: "post",
	    dataType:"json",
	    success: function (data) {
	        if (data) {
	        	$("#changeStatusModel").modal("hide");
	        	table.ajax.reload(null,false);
	        	if (data.success=="启用成功") {
					toastr.success(data.success);
				}else{
	        		toastr.error(data.success);
				}
	        } else{
	        	toastr.error("启用失败");
	        }
	    }, error: function (error) {
	    	toastr.error("启用失败");
	    }
	});
}

function delSubmit(){
	var id=$("#userid").val();
	$.ajax({
	    url: "<%=path%>/userController/jinyong.html",
	    data: {"id": id},
	    type: "post",
	    dataType:"json",
	    success: function (backdata) {
	        if (backdata) {
	        	$("#delcfmModel").modal("hide");
	        	table.ajax.reload(null,false);
	        	if (backdata.success=="禁用成功") {
					toastr.success(backdata.success);
				}else{
	        		toastr.error(backdata.success);
				}
	        } else {
	        	toastr.error("禁用失败");
	        }
	    }, error: function (error) {
	    	toastr.error("禁用失败");
	    }
	});
}



/*
 * 根据父id获取子菜单
 */
function getSubMenu(punid){
	$.ajax({
		url:"<%=path%>/userController/getSubMenu.html",
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
		url:"<%=path%>/userController/getoldMenu.html",
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
	$("#usermenuid").val(id);//用户unid
	$("#getMenu").empty();
	$("#getSubMenu").empty();
	$.ajax({
		url:"<%=path%>/userController/getParentMenu.html",
		type: "post",
		dataType: "json",
	    success: function (data){
	    	$.each(data, function(index,values){   // 解析出data对应的Object数组  
                $.each(values,function(index2,value){   // 遍历Object数组 ，每个对象的值存放在value ，index2表示为第几个对象  
                  //  $("#getMenu").append("<div class='btn-group' id='menu"+value.unid+"' data-toggle='buttons-checkbox'><button class='btn btn-default'  name='buttonMenu'  onclick='this.blur();'  value='"+value.unid+"'>"+value.name+"</button></div></br>"); 
                	$("#getMenu").append("<div class='chooseButton fl parList'><button class='parButton parButtonActive' id='menu"+value.unid+"'  name='buttonMenu' value='"+value.unid+"' onclick='chosenOpenOrCheck("+value.unid+");'>"+value.name+"</button></div>");
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
	$("#myMenu").modal("show");

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
	$.getJSON('saveUserMenu.html', {
		menuvalue : menuvalues.join(','),
		userid:usermenuid
	}, function(result) {
		if (result.success) {
			$("#myMenu").modal("hide");
            table.ajax.reload(null,false);
            toastr.success("菜单保存成功");
		}else{
			toastr.error("菜单保存失败");
		}
	});
}

	

	function selectScenic() {
		if ($("#setScenic").text() == "全选") {
			$(".userCheckbox").addClass('userCheckboxActive');
			$(".sceneryButton").addClass('sceneryButtonActive');
			$("#setScenic").html("全不选");
		} else {
			$(".userCheckbox").removeClass('userCheckboxActive');
			$(".sceneryButton").removeClass('sceneryButtonActive');
			$("#setScenic").html("全选");
		}
	}

	/**
	 * 景区设置
	 
	 */
	
	function getOldScenic2() {
		var userid = $("#userid2").val();
		var scentexts = new Array();
		var scenicids = document.getElementsByName("buttonScen");
		$.ajax({
			url : "<%=path%>/userController/getoldScenic.html",
			type : "post",
			dataType : "json",
			data : {
				"userid" : userid
			},
			success : function(data) {
				$.each(data, function(index, values) {
					$.each(values, function(index2, value) {
						for (var i = 0; i < scenicids.length; i++) {
							if (scenicids[i].value == value.scenicid) {
								scenicids[i].setAttribute("class","sceneryButton sceneryButtonActive");
								scentexts.push(scenicids[i].innerHTML);
							}
						}
					});
				});
				$("#scenicName2").val(scentexts);
			}
		});

	}

	function setjingqu() {
		$("#getScenic2").empty();
		$.ajax({
					url : "<%=path%>/userController/getCityList.html",
					type : "post",
					dataType : "json",
					success : function(data) {
						$.each(data,function(index, values) { // 解析出data对应的Object数组  
							$.each(values,function(index2,value) { // 遍历Object数组 ，每个对象的值存放在value ，index2表示为第几个对象  <li class="userScenerySpreadBg">
		$("#getScenic2").append("<ul id='userSceneryGroup'><li class='userScenery'><div class='userBox fl'><div class='userCheckbox' id='city"+value.cityid+"' onclick='selectCity("+ value.cityid+ ");'></div></div><div class='fl userSceneryText' id='os"+value.cityid+"' onclick='openScenic("+ value.cityid+ ");'>"+ value.name+ "</div></li><li class='userScenerySpreadBg sceneryHidden'><div class='userScenerySpread'  id='scen"+value.cityid+"'></div></li></ul>");
			getScenicById2(value.cityid);
		});
		});
		},
					error : function(error) {
						console.log(error);
					}

				});
	}

	function setjingqu2() {
		$("#getScenic1").empty();
		$.ajax({    url : "<%=path%>/userController/getCityList.html",
					type : "post",
					dataType : "json",
					success : function(data) {
						$.each(data,function(index, values) { // 解析出data对应的Object数组  
				$.each(values,function(index2,value) { // 遍历Object数组 ，每个对象的值存放在value ，index2表示为第几个对象  <li class="userScenerySpreadBg">
		  $("#getScenic1").append("<ul id='userSceneryGroup'><li class='userScenery'><div class='userBox fl'><div class='userCheckbox' id='city"+value.cityid+"' onclick='selectCity("+value.cityid+");'></div></div><div class='fl userSceneryText' id='os"+value.cityid+"' onclick='openScenic("+ value.cityid+ ");'>"+ value.name+ "</div></li><li class='userScenerySpreadBg sceneryHidden'><div class='userScenerySpread'  id='scen"+value.cityid+"'></div></li></ul>");
		  getScenicById2(value.cityid);
			
	});
		});
						//设置原来景区
						setTimeout(function() {
							getOldScenic2();
						}, 200);
					},
					error : function(error) {
						console.log(error);
					}

				});

	}

	function getScenicById2(cityid) {
		$.ajax({
			        url : "<%=path%>/userController/getScenic.html",
					type : "post",
					dataType : "json",
					data : {
						"cityid" : cityid
					},
					success : function(data) {
						$.each(data,function(index, values) {
						$.each(values,function(index2,value) {
	$("#scen"+ cityid).append("<button class='sceneryButton' name='buttonScen' id='scen"+ value.unid+ "'  type='button'  onclick='getCheckButton("+ value.unid+ ");'  value='"+ value.unid+ "'>"+ value.name+ "</button>");
			});
										});

					}
				});
	}

	function selectCity(id) {
		if (!$("#city" + id).hasClass("userCheckboxActive")) {
			$("#city" + id).addClass("userCheckboxActive");
			$("#scen" + id + " button").addClass("sceneryButtonActive");
		} else {
			$("#city" + id).removeClass("userCheckboxActive");
			$("#scen" + id + " button").removeClass("sceneryButtonActive");
		}
	}
	
	
	function openScenic(cityid){
		if($("#os"+cityid).parent().siblings().hasClass("sceneryHidden")){
		 $("#os"+cityid).parent().siblings().removeClass("sceneryHidden");
		 $("#os"+cityid).css("background","url(../img/down.png) no-repeat right center");
		}else{
			$("#os"+cityid).parent().siblings().addClass("sceneryHidden");
			$("#os"+cityid).css("background","url(../img/right.png) no-repeat right center");
		}
		
	}

	function getCheckButton(id) {
		if (!$("#scen" + id).hasClass("sceneryButtonActive")) {
			$("#scen" + id).addClass("sceneryButtonActive");
		} else {
			$("#scen" + id).removeClass("sceneryButtonActive");
		}
     if($("#scen" + id).parent().find("button").hasClass("sceneryButtonActive")){
    	 $("#scen" + id).parent().parent().siblings().children("div").children("div").addClass("userCheckboxActive");	
		}else{
		$("#scen" + id).parent().parent().siblings().children("div").children("div").removeClass("userCheckboxActive");	
		}
	}
	
	
	
	

	/**
	 * 保存到添加菜单中
	 */
	function saveScenicId() {
		var scenid = document.getElementsByName("buttonScen");
		var scenvalues = new Array();
		var scentexts = new Array();
		for (var i = 0; i < scenid.length; i++) {
			var scenClass = scenid[i].getAttribute("class").indexOf(
					"sceneryButtonActive");
			if (scenClass > 0) {
				scenvalues.push(scenid[i].value);
				scentexts.push(scenid[i].innerHTML);
			}
		}
		$("#allscenicid").val(scenvalues);
		$("#scenicName").val(scentexts);
		$("#myScenic").modal("hide");
	}

	function saveScenicId2() {
		var scenid = document.getElementsByName("buttonScen");
		var scenvalues = new Array();
		var scentexts = new Array();
		for (var i = 0; i < scenid.length; i++) {
			var scenClass = scenid[i].getAttribute("class").indexOf(
					"sceneryButtonActive");
			if (scenClass > 0) {
				scenvalues.push(scenid[i].value);
				scentexts.push(scenid[i].innerHTML);
			}
		}
		$("#allscenicid2").val(scenvalues);
		$("#scenicName2").val(scentexts);
		$("#myScenic2").modal("hide");
	}
</script>
</body>

</html>