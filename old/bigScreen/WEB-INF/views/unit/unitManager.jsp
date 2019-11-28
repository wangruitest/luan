<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	request.setAttribute("home", request.getContextPath());
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>单位管理员</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	

	<link rel="stylesheet" href="${home}/css/bootstrap.css" />
	<link rel="stylesheet" href="${home}/css/caidan.css" />
	<link rel="stylesheet" href="${home}/css/kuangjia.css" />
	<link rel="stylesheet" type="text/css" href="${home}/css/toastr.css" />
	<script type="text/javascript" src="${home}/js/kuangjia.js" ></script>
	<script type="text/javascript" src="${home}/js/jquery.js" ></script>
	<script src="${home}/js/jquery.tips.js"></script>
	<script type="text/javascript" src="${home}/js/cookie/cookie.js"></script>
	<script type="text/javascript" src="${home}/js/toastr.min.js"></script>
	<!-- 将这个属性值设置为不同的值就能让提示信息显示在不同的位置，
如toast-bottom-right表示下右，可以修改源文件改变样式-->
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
  
  <body>
    <div class="container-fluid">
		<div class="commonUnit" >
			<div class="commonHeadText">基本资料</div>
			<div class="commonIco fl"><div style="margin-top:20%;"><img src="${home}/img/commonicoone.png"/></div></div>
			<div class="commonLine fl"><div style="margin-top:20%;"><img src="${home}/img/commonLine .png"/></div></div>
			<div class="commonText fl">
				<div class="commonTextList">
					<label>单位名称</label>
					<span>
						<input class="commonInput" type="text" style="border-style: solid; border-width: 0" id="unitname" readOnly/>
					</span>
				</div>		
				<div class="commonTextList">
					<label>单位地址</label>
					<span>
						<input class="commonInput" type="text" style="border-style: solid; border-width: 0" id="unitaddress" readOnly/>
					</span>
				</div>	
				<div class="commonTextList">
					<label>负责人</label>
					<span>
						<input class="commonInput" type="text" style="border-style: solid; border-width: 0" id="unitleader" readOnly/>
					</span>
				</div>
			</div>
			<div class="commonRightimgone fl"></div>
		</div>
		<div class="commonUnit" style="clear:both;">
			<div class="commonHeadText">帐号信息</div>
			<div class="commonIco fl"><div style="margin-top:20%;"><img src="${home}/img/commonicotwo.png"/></div></div>
			<div class="commonLine fl"><div style="margin-top:20%;"><img src="${home}/img/commonLine .png"/></div></div>
			<div class="commonText fl" style="margin:25px auto;">
				<div class="commonTextList">
					<label>权限信息</label>
					<span>
						<input class="commonInput" type="text" style="border-style: solid; border-width: 0" id="unitjurisdiction" readOnly/>
					</span>
				</div>		
				<div class="commonTextList">
					<label>登录帐号</label>
					<span>
						<input class="commonInput" type="text" style="border-style: solid; border-width: 0" id="username" readOnly/>
					</span>
				</div>	
				<div class="commonTextList">
					<label>登录密码</label>
					<input type="password" class="commonInput" style="border-style: solid; border-width: 0;width:45%" id="userpass" readOnly maxLength=32/>
					<button id="userpasssave" type="button"  class="conmmonBtnCon" style="display:none;" onclick="editUserpass()">确定修改</button>
					<button id="userpassedit" type="button"  class="conmmonBtnCon" onclick="showUserPass()">修改密码</button>
				</div>
				<div class="commonTextList">
					<label>管理员手机号</label>
					<input type="text" class="commonInput" style="border-style: solid; border-width: 0;width:45%" id="userphone" readOnly maxLength=32/>
					<button id="userphonesave" type="button"  class="conmmonBtnCon" style="display:none;" onclick="editUserphone()">确定修改</button>
					<button id="userphoneedit" type="button"  class="conmmonBtnCon" onclick="showUserPhone()">修改手机号</button>
				</div>
			</div>
			<div class="commonRightimgtwo fl"></div>
		</div>
	</div>
	
	<script type="text/javascript">
		var unitid = "";//定义unit表主键id,修改时可能用到的id
		var userid = "";//定义user表主键id,修改时可能用到的id
		var udateuserpass = "";//记录未修改前的密码

		$(function() {//初始化页面函数
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
			$.ajax({
				url : "<%=path%>/unit/selectUserAndUnit.html",//单位管理员查询单位用户信息
				type : "POST",
				async : true,
				dataType : "json",
				data : {
				},
				success : function(data) {
					$("#unitname").val(data.unitname);
					$("#unitaddress").val(data.unitaddress);
					$("#unitleader").val(data.unitleader);
					$("#unitjurisdiction").val(data.unitjurisdiction);
					$("#userphone").val(data.userphone);
					$("#username").val(data.username);
					$("#userpass").val(data.userpass);
					unitid = data.unitunid;
					userid = data.userunid;
					udateuserpass = data.userpass;
				},
				error : function(data) {
					toastr.error("加载数据出错");
				}
			});
		});

		//修改登录密码函数
		function editUserpass() {
			var userpass = $("#userpass").val();
			if(userpass == udateuserpass){
				$("#userpass").attr("readOnly", true);//设置input元素的readonly属性
				$("#userpass").attr("style",
						"border-width: 0;width:45%");//隐藏input边框，设置为默认值
				$("#userpassedit").attr("style", "");//显示修改标签，设置为默认值
				$("#userpasssave").attr("style", "display:none;");//隐藏确定标签
				toastr.success("修改成功：修改密码与原密码相同！");
				return false;
			}
			if (!checkUserpass(userpass)) {
				return false;
			}
			$.ajax({
				url : "<%=path%>/unit/editUserPass.html",//单位管理员查询单位用户信息
				type : "POST",
				async : true,
				dataType : "json",
				data : {
					unid : userid,
					userpass : $("#userpass").val()
				},
				success : function(data) {
					$("#userpass").attr("readOnly", true);//设置input元素的readonly属性
					$("#userpass").attr("style",
							"border-width: 0;width:45%");//隐藏input边框，设置为默认值
					$("#userpassedit").attr("style", "");//显示修改标签，设置为默认值
					$("#userpasssave").attr("style", "display:none;");//隐藏确定标签
					toastr.success(data.result);
					var loginUrl = "";
					$.ajax({
							url : "<%=path %>/loginOut.html",
							dataType : "text",
							type : "POST",
							async : false,
							success : function(data) {
								loginUrl=data;
							},
						});
					//alert(loginUrl);
					window.parent.location.href = "<%=path %>/"+loginUrl;
				},
				error : function(data) {
					toastr.error(data.result);
				}
			});
		}

		//修改管理员手机函数
		function editUserphone() {
			var userphone = $("#userphone").val();
			if (!checkMobile(userphone)) {
				return false;
			}
			$.ajax({
				url : "<%=path%>/unit/editUserPhone.html",//单位管理员查询单位用户信息
				type : "POST",
				async : true,
				dataType : "json",
				data : {
					unid : userid,
					userphone : userphone
				},
				success : function(data) {
					$("#userphone").attr("readOnly", true);//设置input元素的readonly属性
					$("#userphone").attr("style",
							"border-width: 0;width:45%");//隐藏input边框，设置为默认值
					$("#userphoneedit").attr("style", "");//显示修改标签，设置为默认值
					$("#userphonesave").attr("style", "display:none;");//隐藏确定标签
					toastr.success(data.result);
				},
				error : function(data) {
					toastr.error(data.result);
				}
			});
		}

		//点击显示、隐藏修改密码框、修改管理员手机框
		function showUserPass() {
			$("#userpass").attr("readOnly", false);//去除input元素的readonly属性
			$("#userpass")
					.attr("style", "border-width: 1;width:45%");//显示input边框
			$("#userpassedit").attr("style", "display:none;");//隐藏修改a标签
			$("#userpasssave").attr("style", "");//显示确定a标签，设置为默认值
		}
		function showUserPhone() {
			$("#userphone").attr("readOnly", false);//去除input元素的readonly属性
			$("#userphone").attr("style",
					"border-width: 1;width:45%");//显示input边框
			$("#userphoneedit").attr("style", "display:none;");//隐藏修改标签
			$("#userphonesave").attr("style", "");//显示确定标签，设置为默认值
		}

		//验证手机号，验证规则：11位数字，以1开头。
		function checkMobile(userphone) {
			var str = userphone;
			if (str.match(/^1[3|4|5|8]\d{9}$/)) {
				return true;
			} else {
				$("#userphone").tips({
					side : 3, //1,2,3,4 分别代表 上右下左
					msg : "手机号格式有误，请重新输入！",
					bg : "red", //背景色，默认为红色
					time : 3
				//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
				});
				$("#userphone").focus();
				return false;
			}
		}
		//密码验证，6-20位数字或字母组成
		function checkUserpass(userpass) {
			var str = userpass;
			if (str.match(/^[0-9A-Za-z]{6,20}$/)) {
				return true;
			} else {
				$("#userpass").tips({
					side : 3, //1,2,3,4 分别代表 上右下左
					msg : "密码格式有误，请输入6-20位数字或字母的密码！",
					bg : "red", //背景色，默认为红色
					time : 3
				//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
				});
				$("#userpass").focus();
				return false;
			}
		}
	</script>
  </body>
</html>
