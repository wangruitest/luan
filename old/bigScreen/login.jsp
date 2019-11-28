<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	Integer errorNum = session.getAttribute("false")==null?0:(Integer)session.getAttribute("false");
%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>皖美景区</title>

<link rel="stylesheet" type="text/css"
	href="<%=path %>/css/bootstrap/bootstrap.min.css" />

<script src="<%=path %>/js/demo-rtl.js"></script>


<link rel="stylesheet" type="text/css" href="<%=path %>/css/libs/font-awesome.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/css/libs/nanoscroller.css" />

<link rel="stylesheet" type="text/css"
	href="<%=path %>/css/compiled/theme_styles.css" />

<link type="image/x-icon" href="<%=path %>/favicon.png" rel="shortcut icon" />

</head>
<style>
		body{background: url(<%=path %>/img/dengluBg.png) no-repeat center top;margin: 0;padding: 0;position: relative;background-size: cover;}
		.formBg{width: 580px;
		        min-width: 365px;
				background: #ffffff;
				border-radius: 5px;
				margin: 20px auto; 
				margin-bottom: 20px; 
				overflow: hidden; }
		.logoImg{width: 173px;margin: 40px auto 0 auto;}
		.loginForm{width: 365px;margin: 30px auto 0 auto;}
		.loginInput{height: 35px;
					line-height: 35px;
					font-size: 14px;
					border: 1px solid #eeeeee;
					border-radius: 5px;
					width:98%;
					padding-left: 2%;
					font-family: "微软雅黑";}
		.nameBg{background: url(<%=path %>/img/person.png) no-repeat 95% center;
				}
		.paddwordBg{background: url(<%=path %>/img/password.png) no-repeat 95% center;
		        margin-top: 20px;}
		.loginButton{width: 100%;
		             background:#5caeef;
		             border-radius: 5px;
		             border: none;
		             height: 35px;
		             margin-left:0;
		             margin-top: 20px;
		             font-size: 15px;
		             color: #fff;
		             font-family: "微软雅黑";}
		.forgetPassword{text-align: right;
						margin-left:233px ;}
		a:hover{cursor:pointer;}
		.bottomText{    width: 580px;
						text-align: center;
						color:#333333;
						font-size: 12px;
						font-family: "微软雅黑";
						position:fixed;
						bottom: 10px;}
		.formBottom{width: 100%;margin-top:15px;color:#5caeef;
						font-size: 12px;
						font-family: "微软雅黑";}
		.jizhu{padding-top: 10px;}
		.yanzhengma{margin-top: 10px;
	                width: 48%;float: left;}
		.yzmImg{margin-left: 2%;/*添加*/
	            width: 47%;float:right;
	            height: 35px;
	            line-height: 35px;
	            text-align: center;
	            margin-top: 10px;
	            margin-right: 5px;
	            border-radius: 5px;
	            color: #fff;}
	      ::-webkit-input-placeholder {
				color:grey;
			}
		::-moz-input-placeholder {
				color:grey;
			}
		:-ms-input-placeholder {
			color:grey;
		}
	</style>
<body   onkeydown="on_return(event)">
	
<div class="formBg">
			<div class="logoImg"><img src="<%=path %>/img/logo.png"/></div>
			<div  class="loginForm">
				<input   id="agentCode"  name="agentCode"  type="text" class="loginInput nameBg" placeholder="请输入用户名"/>
				<input   id="agentPwd" name="agentPwd"   type="password" class="loginInput paddwordBg"  placeholder="请输入密码"/>
				<div class="yzm" id="yzm" style=" display:none;" >
					<input type="text" class="loginInput yanzhengma" id="validate" placeholder="请输入验证码"/>
					<div class="yzmImg" id="yzmImg" style="overflow:hidden"><img id="validImg" src="<%=path %>/getValidate.html"/></div>
				</div>
				<button type="submit" class="loginButton"  onclick="login();">登  录</button>
				<div class="formBottom">
					<input type="checkbox" class="jizhu" id="saveCookie" name="saveCookie" style="vertical-align:middle;margin-top:-3px;"/><span >记住我！</span>
					<a class="forgetPassword" >忘记密码？</a>
				</div>
				
			</div>
			<div align="center" style="margin-bottom: 20px;">
			<div id="loginFalseMsg" type="text" readonly  style="color: red; border: none" />
			</div>
		</div>
		<div class="bottomText">版权所有   2016© 安徽中移通信技术工程有限公司   皖ACP备10001445号</div>
	<script src="<%=path %>/js/demo-skin-changer.js"></script>
	<script src="<%=path %>/js/jquery.js"></script>
	<script src="<%=path %>/js/bootstrap.js"></script>
	<script src="<%=path %>/js/jquery.nanoscroller.min.js"></script>
	<script src="<%=path %>/js/demo.js"></script>
	<script type="text/javascript" src="<%=path %>/js/cookie/cookie.js"></script>
	<script type="text/javascript" src="<%=path %>/js/md5.js"></script>


	<script src="<%=path %>/js/scripts.js"></script>
	<script type="text/javascript">
	
	$( function(){
		if (<%=errorNum%>>0) {
			$("#yzm").show();
		}
		
		formMarginTop();
		//分析cookie值，显示上次的登陆信息
		var userCodeValue = getCookieValue("agentCode");
		$("#agentCode").val(userCodeValue);
		var passwordValue = getCookieValue("agentPwd");
		$("#agentPwd").val(passwordValue);   
		var isRememberValue = (getCookieValue("isRemember")=="")?false:getCookieValue("isRemember");
		$("#saveCookie").attr("checked", isRememberValue);
	});	
	
	
	
	function formMarginTop() { 
		  var windowHeight=$(window).height();
		  var windowWidth=$(window).width();
		  var textMargin=windowWidth/2-290;
		  var formMargin=windowHeight/2-240;
		 //  $(".bottomText").css("margin-left",textMargin);
		   $(".formBg").css("margin-top",formMargin);
		}
	
	function login(){
		var agentCode = $.trim($('#agentCode').val());
		var agentPwd = $('#agentPwd').val();
		var agentPwdMd5 = hex_md5(agentPwd);
		var validate = $("#validate").val();
		var isRemember = document.getElementById('saveCookie').checked;
		if(agentCode == ""|| agentCode == "请输入用户名"){
			//$.cookie('agentCode', '', {expires: -1}); // 删除 cookie
			$("#loginFalseMsg").html("用户名空，不可登录");
			return false;
		}
		if(agentPwd == ""|| agentPwd =="请输入密码"){
			///$.cookie('agentPwd', '', {expires: -1}); // 删除 cookie
			$("#loginFalseMsg").html("密码空，不可登录");
			return false;
		}
		if(!$("#yzm").is(":hidden") && (validate == ""|| validate =="请输入验证码")){
			///$.cookie('agentPwd', '', {expires: -1}); // 删除 cookie
			$("#loginFalseMsg").html("验证码空，不可登录");
			return false;
		}
		$.ajax({
            cache: true,
            type: "POST",
            dataType:"json",
            url:"<%=path %>/confirm.html",
            data:{
            	"agentCode":agentCode,
            	"agentPwd":agentPwdMd5,
            	"validate":validate
            },// 你的formid
            async: false,
            error: function(request) {
                alert("Connection error");
            },
            success: function(data) {
            	if("success" == data[0]){
            		//保存或清除cookies 
            		if(isRemember){
						setCookie("agentCode",agentCode,24,"/");
						setCookie("agentPwd",agentPwd,24,"/");
						setCookie("isRemember",isRemember,24,"/");
					}else{
						deleteCookie("agentCode","/");
						deleteCookie("agentPwd","/");
						deleteCookie("isRemember","/");
					}
					window.location.href = "<%=path %>/index.html";
            	}else if("failed" == data[0]){
            		$("#loginFalseMsg").html("用户名或密码错误！<br/>连续登陆错误"+data[1]+"次后，账户将被锁定");
            		document.getElementById('validImg').setAttribute('src','<%=path %>/getValidate.html?'+Math.random());
            		$("#yzm").show();
        			return false;
            	}else if("errorValidate" == data[0]){
            		$("#loginFalseMsg").html("验证码错误！");
					document.getElementById('validImg').setAttribute('src','<%=path %>/getValidate.html?'+Math.random());
					$("#yzm").show();
        			return false;
            	}else if("forbiddened" == data[0]){
            		$("#loginFalseMsg").html("该账号已被锁定！请稍后登陆");
					document.getElementById('validImg').setAttribute('src','<%=path %>/getValidate.html?'+Math.random());
					$("#yzm").show();
        			return false;
            	}else{
            		alert(data[0]);
            		$("#loginFalseMsg").html("系统出现错误！");
					document.getElementById('validImg').setAttribute('src','<%=path %>/getValidate.html?'+Math.random());
					$("#yzm").show();
        			return false;
            	}
            }
        });
	}
	
	
 	function CheckForm(){
		var flag = false;
		var agentCode = $.trim($('#agentCode').val());
		var agentPwd = $('#agentPwd').val();
		if(agentCode == ""||agentCode == "请输入用户名"){
			//$.cookie('agentCode', '', {expires: -1}); // 删除 cookie
			$("#loginFalseMsg").val("用户名空，不可登录");
			return false;
		}
		if(agentPwd == ""||agentPwd == "请输入密码"){
			///$.cookie('agentPwd', '', {expires: -1}); // 删除 cookie
			$("#loginFalseMsg").val("密码空，不可登录");
			return false;
		}
		var user = $.ajax({
			url:"<%=path %>/loginController.html?checkuser&agentCode="+agentCode+"&agentPwd="+agentPwd,
			dataType: "json",
			success: function(data, textStatus){
				$.each(data, function(i, n){
					flag = data.success;
				});
			},
			error: function(){
				flag = false;
			},
			async:false
		});
		if(flag == false){
			$("#loginFalseMsg").val("账号或密码不正确");
			//$.cookie('agentCode', '', {expires: -1}); // 删除 cookie
			//$.cookie('agentPwd', '', {expires: -1});
		}else{ //登录成功
			var flag = $("#remember").attr("checked");
			if(flag == "checked"){ //用户选择保存账号、密码
				//$.cookie('agentCode', agentCode, {expires: 7}); // 存储一个带7天期限的 cookie
				//$.cookie('agentPwd', agentPwd, {expires: 7});
				//$.cookie('remember', 'true', {expires: 7});
			}else{
				//$.cookie('agentCode', '', {expires: -1}); // 删除 cookie
			//	$.cookie('agentPwd', '', {expires: -1});
				//$.cookie('remember', '', {expires: -1});
			}
		}
	   	return flag;
	}
 	//按下回车键登录
 	function on_return(event){
 		var event = event || window.event;
 		 if(event.keyCode == 13){
 		  login();
 		 }
 	    }  
function isPlaceholder(){
    var input = document.createElement('input');
    return 'placeholder' in input;
}
if (!isPlaceholder()) {//不支持placeholder 用jquery来完成
    $(document).ready(function() {
        if(!isPlaceholder()){
            $("#agentCode").each(//把input绑定事件 排除password框
                    function(){
                        if($(this).val()=="" && $(this).attr("placeholder")!=""){
                            $(this).val($(this).attr("placeholder"));
                            $(this).css("color","grey");
                            $(this).focus(function(){
                                if($(this).val()==$(this).attr("placeholder")) $(this).val("");
                                 $(this).css("color","black");
                            });
                            $(this).blur(function(){
                                if($(this).val()=="") {
	                                $(this).val($(this).attr("placeholder"));
	                                $(this).css("color","grey");
                                }
                            });
                        }
                    });
            //对password框的特殊处理1.创建一个text框 2获取焦点和失去焦点的时候切换
            $("#agentPwd").each(
                    function() {
	                    var pwdField    = $(this);
                    	if(pwdField.val() =="" ||undefined || null){
	                        var pwdVal      = pwdField.attr('placeholder');
	                        pwdField.after('<input  style="color:grey" class="loginFalseMsg loginInput paddwordBg " type="text" value='+pwdVal+' autocomplete="off" />');
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
                    })
        }
    });
}
 </script>
</body>
</html>