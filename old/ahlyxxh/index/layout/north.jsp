<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<link href="../css/login.css" rel="stylesheet" type="text/css" />
<script>
	$('#userNameShow').text(userName);
</script>
<script type="text/javascript">
var curCitys={};
$(function(){
	initloginerCityList();
	$('#passwordEditLog').dialog({
		closed:true
	});
});

function initloginerCityList(){
	dwr.engine.setAsync(false);
	UtilsAction.getMyOrgs(function(data){
		for (var i=0;i<data.returnList.length;i++) {
			var code=data.returnList[i].code;
			var name=data.returnList[i].name;
			if(code==curCityCode || (curCityCode=="" && i==0)){
				$("#city_change").append("<div data-options=\"iconCls:'exicon-arrow_right'\" onclick='changeToCity(\""+code+"\")'>"+name+"</div>");
				$('#cityid').text(name);
				changeToCityCall(code);
			}else{
				$("#city_change").append("<div onclick='changeToCity("+code+")'>"+name+"</div>");
			}
			curCitys[code]=name;
		}
		if(data.returnList.length==1){
			$("#city_change").hide();
			$("#btn-edit").hide();
		}
	});
	dwr.engine.setAsync(true);
}
function changeToCity(code){
	if(code==curCityCode){
		return;
	}
	confirmMsg("切换城市后，当前整个页面将会被刷新，是否继续？<br/>目标城市：[<b>"+curCitys[code]+"</b>]",function(flag){
		if(flag){
			changeToCityCall(code,true);
		}
	});
}
function changeToCityCall(code,reload){
	UtilsAction.changeToCity(code,function(result){
		if(result.resultCode=="0"){
			if(reload){
				window.location.reload(true);
			}
		}else{
			showMsg("切换城市成功时出错，可能原因为：\n"+result.resultMessage);
		}
	});
}
function passwordEdit(){
	$("#oldpassword").val('');
	$("#newpasswordone").val('');
	$("#newpasswordtwo").val('');

	$('#passwordEditLog').dialog({
		title:'修改密码',
		modal:true,
		buttons:[{
			text:'确定',
			iconCls:'icon-ok',
			handler:pwEdit
		},{
			text:'取消',
			handler:function(){
				$('#passwordEditLog').dialog('close');
			}
		}],
		closed:false
	});
}
function pwEdit(){
	var oldpassword = document.getElementById("oldpassword").value;
	var newpasswordone = document.getElementById("newpasswordone").value;
	var newpasswordtwo = document.getElementById("newpasswordtwo").value;
	if(oldpassword.length<=0){
		alert("原密码不能为空!");
		return;
	}
	if(newpasswordone != newpasswordtwo){
		alert("两次新密码输入不一样!");
		return;
	}
	
	UtilsAction.loginEditPassword(oldpassword,newpasswordone,function(msg){
   		if(msg=="true"){
   			alert("修改成功!");
   			$('#passwordEditLog').dialog('close');
   		}else{
   			alert(msg);
   			}
   		});	
}
</script>
  <div class="topbg" style="background: url();" id="sessionInfoDiv">
    <div class="top_logo"><img id="top_logo" src=""  style="height: 62px;"/></div>
    <!-- 
    <a id="btn-edit" href="#" class="easyui-menubutton" data-options="menu:'#city_change',iconCls:'exicon-lightning_go'" style="margin-top: 30px;">当前位置：<strong id="cityid"></strong></a>
    <div id="city_change" style="width:150px;">
	</div>
     -->
    <div class="top_info"><p><strong id="userNameShow"></strong>，欢迎您！<a href="javascript:void(0)" class="top_editpw" onclick="passwordEdit()">修改密码&nbsp&nbsp</a>
    <a href="javascript:void(0)" class="top_exit" onclick="loginOut()">注销</a></p>
    <p class="cloth">
    <!-- 
    <a href="../desktop"><img src="../images/newLogin/top_16.jpg"/></a>
     -->
    </p>
    </div>
  </div>
  <div id="passwordEditLog" style="padding:0px;width:350px;height:180px;">
		<table id="passwordEditForm" class="form_table" style="height:100%;">
			<tr>
				<th><font color="red">*</font>原密码：</th>
				<td>
					<input type="password" id="oldpassword" validation="require;maxlen(256)" style="width:160px;"></input>
				</td>
			</tr>
			<tr>
				<th><font color="red">*</font>新密码：</th>
				<td>
					<input type="password" id="newpasswordone" validation="require;maxlen(256)" style="width:160px;"></input>
				</td>
			</tr>
			<tr>
				<th><font color="red">*</font>确认密码：</th>
				<td>
					<input type="password" id="newpasswordtwo" validation="require;maxlen(256)" style="width:160px;"></input>
				</td>
			</tr>
		</table>
	</div>
