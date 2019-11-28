<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript">
//$('.sel2').select2();
//确认更新景区弹出框显示
function showSaveOrUpdateHolidayModel(){
	$("#saveOrUpdateHolidayModel").modal("show");
}
//确认取消景区弹出框显示
function showBackHolidayModel(){
	$("#backHolidayModel").modal("show");
}

//根据所选年份重新加载节假日信息
function reloadHolidayInfor(){
	$("#holidayMonSel").select2("val", "0");
	$("#holidayDaySel").select2("val", "0");
	$("#holidayMonSelY").select2("val", "0");
	$("#holidayDaySelY").select2("val", "0");
	$("#holidayMonSelC").select2("val", "0");
	$("#holidayDaySelC").select2("val", "0");
	$("#holidayMonSelC1").select2("val", "0");
	$("#holidayDaySelC1").select2("val", "0");
	$("#holidayMonSelQ1").select2("val", "0");
	$("#holidayDaySelQ1").select2("val", "0");
	$("#holidayMonSelQ").select2("val", "0");
	$("#holidayDaySelQ").select2("val", "0");
	$("#holidayMonSelW1").select2("val", "0");
	$("#holidayDaySelW1").select2("val", "0");
	$("#holidayMonSelW").select2("val", "0");
	$("#holidayDaySelW").select2("val", "0");
	$("#holidayMonSelD1").select2("val", "0");
	$("#holidayDaySelD1").select2("val", "0");
	$("#holidayMonSelD").select2("val", "0");
	$("#holidayDaySelD").select2("val", "0");
	$("#holidayMonSelZ1").select2("val", "0");
	$("#holidayDaySelZ1").select2("val", "0");
	$("#holidayMonSelZ").select2("val", "0");
	$("#holidayDaySelZ").select2("val", "0");
	$("#holidayMonSelG1").select2("val", "0");
	$("#holidayDaySelG1").select2("val", "0");
	$("#holidayMonSelG").select2("val", "0");
	$("#holidayDaySelG").select2("val", "0");
	showHolidayManagementInfor();
}

//还原节假日信息
function backShowHolidayManagement(){
	reloadHolidayInfor();
	showHolidayManagementInfor();
	toastr.success("还原节假日信息成功！");
}

//显示节假日信息
function showHolidayManagementInfor(){
	$.ajax({
		url : "<%=path%>/holidaymanagement/showHolidayManagementInfor.html",
		dataType : "json",
		type : "POST",
		async : true,
		data : {
			holidayYear : $("#holidayYearSel").val()
		},
		success : function(data) {
			for(var holidayIndex in data){
				if(data[holidayIndex].holidayName == "元旦"){
						$("#holidayMonSel").val(data[holidayIndex].firstDay.substr(5, 2));
						$("#holidayMonSel").change(function () {  
					        $("#holidayMonSel  option:selected").text();  
					    });  
					    $("#holidayMonSel").trigger("change");
						$("#holidayDaySel").select2("val", data[holidayIndex].firstDay.substr(8, 2));
						$("#holidayMonSelY").val(data[holidayIndex].lastDay.substr(5, 2));
						$("#holidayMonSelY").change(function () {
					        $("#holidayMonSelY  option:selected").text();  
					    });
					    $("#holidayMonSelY").trigger("change");
						$("#holidayDaySelY").select2("val", data[holidayIndex].lastDay.substr(8, 2));
				}
				if(data[holidayIndex].holidayName == "春节"){
						$("#holidayMonSelC").val(data[holidayIndex].firstDay.substr(5, 2));
						$("#holidayMonSelC").change(function () {
					        $("#holidayMonSelC  option:selected").text();  
					    });  
					    $("#holidayMonSelC").trigger("change");
						$("#holidayDaySelC").select2("val", data[holidayIndex].firstDay.substr(8, 2));
						$("#holidayMonSelC1").val(data[holidayIndex].lastDay.substr(5, 2));
						$("#holidayMonSelC1").change(function () {
					        $("#holidayMonSelC1  option:selected").text();  
					    });
					    $("#holidayMonSelC1").trigger("change");
						$("#holidayDaySelC1").select2("val", data[holidayIndex].lastDay.substr(8, 2));
				}
				if(data[holidayIndex].holidayName == "清明"){
						$("#holidayMonSelQ1").val(data[holidayIndex].firstDay.substr(5, 2));
						$("#holidayMonSelQ1").change(function () {
					        $("#holidayMonSelQ1  option:selected").text();  
					    });
					    $("#holidayMonSelQ1").trigger("change");
						$("#holidayDaySelQ1").select2("val", data[holidayIndex].firstDay.substr(8, 2));
						$("#holidayMonSelQ").val(data[holidayIndex].lastDay.substr(5, 2));
						$("#holidayMonSelQ").change(function () {
					        $("#holidayMonSelQ  option:selected").text();  
					    });
					    $("#holidayMonSelQ").trigger("change");
						$("#holidayDaySelQ").select2("val", data[holidayIndex].lastDay.substr(8, 2));
				}
				if(data[holidayIndex].holidayName == "五一"){
						$("#holidayMonSelW1").val(data[holidayIndex].firstDay.substr(5, 2));
						$("#holidayMonSelW1").change(function () {
					        $(".holidayMonSelW1  option:selected").text();  
					    });
					    $("#holidayMonSelW1").trigger("change");
						$("#holidayDaySelW1").select2("val", data[holidayIndex].firstDay.substr(8, 2));
						$("#holidayMonSelW").val(data[holidayIndex].lastDay.substr(5, 2));
						$("#holidayMonSelW").change(function () {
					        $(".holidayMonSelW  option:selected").text();  
					    });
					    $("#holidayMonSelW").trigger("change");
						$("#holidayDaySelW").select2("val", data[holidayIndex].lastDay.substr(8, 2));
				}
				if(data[holidayIndex].holidayName == "端午"){
						$("#holidayMonSelD1").val(data[holidayIndex].firstDay.substr(5, 2));
						$("#holidayMonSelD1").change(function () {
					        $(".holidayMonSelD1  option:selected").text();  
					    });
					    $("#holidayMonSelD1").trigger("change");
						$("#holidayDaySelD1").select2("val", data[holidayIndex].firstDay.substr(8, 2));
						$("#holidayMonSelD").val(data[holidayIndex].lastDay.substr(5, 2));
						$("#holidayMonSelD").change(function () {
					        $(".holidayMonSelD  option:selected").text();  
					    });
					    $("#holidayMonSelD").trigger("change");
						$("#holidayDaySelD").select2("val", data[holidayIndex].lastDay.substr(8, 2));
				}
				if(data[holidayIndex].holidayName == "中秋"){
						$("#holidayMonSelZ1").val(data[holidayIndex].firstDay.substr(5, 2));
						$("#holidayMonSelZ1").change(function () {
					        $(".holidayMonSelZ1  option:selected").text();  
					    });
					    $("#holidayMonSelZ1").trigger("change");
						$("#holidayDaySelZ1").select2("val", data[holidayIndex].firstDay.substr(8, 2));
						$("#holidayMonSelZ").val(data[holidayIndex].lastDay.substr(5, 2));
						$("#holidayMonSelZ").change(function () {
					        $(".holidayMonSelZ  option:selected").text();  
					    });
					    $("#holidayMonSelZ").trigger("change");
						$("#holidayDaySelZ").select2("val", data[holidayIndex].lastDay.substr(8, 2));
				}
				if(data[holidayIndex].holidayName == "国庆"){
						$("#holidayMonSelG1").val(data[holidayIndex].firstDay.substr(5, 2));
						$("#holidayMonSelG1").change(function () {
					        $("#holidayMonSelG1  option:selected").text();  
					    });
					    $("#holidayMonSelG1").trigger("change");
						$("#holidayDaySelG1").select2("val", data[holidayIndex].firstDay.substr(8, 2));
						$("#holidayMonSelG").val(data[holidayIndex].lastDay.substr(5, 2));
						$("#holidayMonSelG").change(function () {
					        $("#holidayMonSelG  option:selected").text();  
					    });
					    $("#holidayMonSelG").trigger("change");
						$("#holidayDaySelG").select2("val", data[holidayIndex].lastDay.substr(8, 2));
				}
			}
		},
		error : function(data) {
			toastr.error("更新节假日信息失败，请重新尝试！");
		}
	});
}

//保存节假日信息
function saveOrUpdateHolidayManagement(){
	
	var holidayyear = $("#holidayYearSel").val();//假期年份
	
	var yuandanjie = $("#yuandanjie").html();
	var yuandanyuestart = $("#holidayMonSel").val();//元旦节月开始时间
	var yuandanristart = $("#holidayDaySel").val();//元旦节日开始时间
	var yuandanyueend = $("#holidayMonSelY").val();//元旦节月结束时间
	var yuandanriend = $("#holidayDaySelY").val();//元旦节日结束时间
	
	var chunjie = $("#chunjie").html();
	var chunjieyuestart = $("#holidayMonSelC").val();//春节月开始时间
	var chunjieristart = $("#holidayDaySelC").val();//春节日开始时间
	var chunjieyueend = $("#holidayMonSelC1").val();//春节月结束时间
	var chunjieriend = $("#holidayDaySelC1").val();//春节日结束时间
	
	var qingmingjie = $("#qingmingjie").html();
	var qingmingyuestart = $("#holidayMonSelQ1").val();//清明节月开始时间
	var qingmingristart = $("#holidayDaySelQ1").val();//清明节日开始时间
	var qingmingyueend = $("#holidayMonSelQ").val();//清明节月结束时间
	var qingmingriend = $("#holidayDaySelQ").val();//清明节日结束时间
	
	var wuyijie = $("#wuyijie").html();
	var wuyiyuestart = $("#holidayMonSelW1").val();//五一节月开始时间
	var wuyiristart = $("#holidayDaySelW1").val();//五一节日开始时间
	var wuyiyueend = $("#holidayMonSelW").val();//五一节月结束时间
	var wuyiriend = $("#holidayDaySelW").val();//五一节日结束时间
	
	var duanwujie = $("#duanwujie").html();
	var duanwuyuestart = $("#holidayMonSelD1").val();//端午节月开始时间
	var duanwuristart = $("#holidayDaySelD1").val();//端午节日开始时间
	var duanwuyueend = $("#holidayMonSelD").val();//端午节月结束时间
	var duanwuriend = $("#holidayDaySelD").val();//端午节日结束时间
	
	var zhongqiujie = $("#zhongqiujie").html();
	var zhongqiuyuestart = $("#holidayMonSelZ1").val();//中秋节开始时间
	var zhongqiuristart = $("#holidayDaySelZ1").val();//中秋节开始时间
	var zhongqiuyueend = $("#holidayMonSelZ").val();//中秋节结束时间
	var zhongqiuriend = $("#holidayDaySelZ").val();//中秋节结束时间
	
	var guoqingjie = $("#guoqingjie").html();
	var guoqingyuestart = $("#holidayMonSelG1").val();//国庆节月开始时间
	var guoqingristart = $("#holidayDaySelG1").val();//国庆节日开始时间
	var guoqingyuegend = $("#holidayMonSelG").val();//国庆节月结束时间
	var guoqingriend = $("#holidayDaySelG").val();//国庆节日结束时间
	
	if(!checkSaveOrUpdateHolidayManagement()){
		return false;
	}
	
	$.ajax({
		url : "<%=path%>/holidaymanagement/saveOrUpdateHolidayManagement.html",
		dataType : "json",
		type : "POST",
		async : true,
		data : {
			holidayyear : holidayyear,//假期年份
			
			yuandanjie : yuandanjie,
			yuandanyuestart : yuandanyuestart,//元旦节月开始时间
			yuandanristart : yuandanristart,//元旦节日开始时间
			yuandanyueend : yuandanyueend,//元旦节月结束时间
			yuandanriend : yuandanriend,//元旦节日结束时间
			
			chunjie : chunjie,
			chunjieyuestart : chunjieyuestart,//春节月开始时间
			chunjieristart : chunjieristart,//春节日开始时间
			chunjieyueend : chunjieyueend,//春节月结束时间
			chunjieriend : chunjieriend,//春节日结束时间
			
			qingmingjie : qingmingjie,
			qingmingyuestart : qingmingyuestart,//清明节月开始时间
			qingmingristart : qingmingristart,//清明节日开始时间
			qingmingyueend : qingmingyueend,//清明节月结束时间
			qingmingriend : qingmingriend,//清明节日结束时间
			
			wuyijie : wuyijie,
			wuyiyuestart : wuyiyuestart,//五一节月开始时间
			wuyiristart : wuyiristart,//五一节日开始时间
			wuyiyueend : wuyiyueend,//五一节月结束时间
			wuyiriend : wuyiriend,//五一节日结束时间
			
			duanwujie : duanwujie,
			duanwuyuestart : duanwuyuestart,//端午节月开始时间
			duanwuristart : duanwuristart,//端午节日开始时间
			duanwuyueend : duanwuyueend,//端午节月结束时间
			duanwuriend : duanwuriend,//端午节日结束时间
			
			zhongqiujie : zhongqiujie,
			zhongqiuyuestart : zhongqiuyuestart,//中秋节月开始时间
			zhongqiuristart : zhongqiuristart,//中秋节日开始时间
			zhongqiuyueend : zhongqiuyueend,//中秋节月结束时间
			zhongqiuriend : zhongqiuriend,//中秋节日结束时间
			
			guoqingjie : guoqingjie,
			guoqingyuestart : guoqingyuestart,//国庆节月开始时间
			guoqingristart : guoqingristart,//国庆节日开始时间
			guoqingyuegend : guoqingyuegend,//国庆节月结束时间
			guoqingriend : guoqingriend//国庆节日结束时间
		},
		success : function(data) {
			toastr.success("更新节假日信息成功！");
		},
		error : function(data) {
			toastr.error("更新节假日信息失败，请重新尝试！");
		}
	});
}

//保存更新假节日信息验证
function checkSaveOrUpdateHolidayManagement(){
	var flag = true;
	//元旦
	while(true){
		if($("#holidayMonSel").val() == "0" && $("#holidayDaySel").val() == "0" && $("#holidayMonSelY").val() == "0" && $("#holidayDaySelY").val() == "0"){
			flag = true;
			break;
		}else if($("#holidayMonSel").val() == "0" || $("#holidayDaySel").val() == "0" || $("#holidayMonSelY").val() == "0" || $("#holidayDaySelY").val() == "0"){
			$("#yuandanjie").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "元旦节起始时间未填写完整！",
				bg : "red", //背景色，默认为红色
				time : 1
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#yuandanjie").focus();
			flag = false;
			return flag;
		}else if($("#holidayMonSel").val() != "0" && $("#holidayDaySel").val() != "0" && $("#holidayMonSelY").val() != "0" && $("#holidayDaySelY").val() != "0"){
			if(!dateValid($("#holidayYearSel").val()+$("#holidayMonSel").val()+$("#holidayDaySel").val(),$("#holidayYearSel").val()+$("#holidayMonSelY").val()+$("#holidayDaySelY").val())){
				$("#yuandanjie").tips({
					side : 3, //1,2,3,4 分别代表 上右下左
					msg : "元旦节结束时间小于开始时间，请核实重新填写！",
					bg : "red", //背景色，默认为红色
					time : 1
				//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
				});
				$("#yuandanjie").focus();
				flag = false;
				return flag;
			}else{
				flag = true;
				break;
			}
		}else{
			flag = true;
			break;
		}
	}
	//春节
	while(true){
		if($("#holidayMonSelC").val() == "0" && $("#holidayDaySelC").val() == "0" && $("#holidayMonSelC1").val() == "0" && $("#holidayDaySelC1").val() == "0"){
			flag = true;
			break;
		}else if($("#holidayMonSelC").val() == "0" || $("#holidayDaySelC").val() == "0" || $("#holidayMonSelC1").val() == "0" || $("#holidayDaySelC1").val() == "0"){
			$("#chunjie").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "春节起始时间未填写完整！",
				bg : "red", //背景色，默认为红色
				time : 1
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#chunjie").focus();
			flag = false;
			return flag;
		}else if($("#holidayMonSelC").val() != "0" && $("#holidayDaySelC").val() != "0" && $("#holidayMonSelC1").val() != "0" && $("#holidayDaySelC1").val() != "0"){
			if(!dateValid($("#holidayYearSel").val()+$("#holidayMonSelC").val()+$("#holidayDaySelC").val(),$("#holidayYearSel").val()+$("#holidayMonSelC1").val()+$("#holidayDaySelC1").val())){
				$("#chunjie").tips({
					side : 3, //1,2,3,4 分别代表 上右下左
					msg : "春节结束时间小于开始时间，请核实重新填写！",
					bg : "red", //背景色，默认为红色
					time : 1
				//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
				});
				$("#chunjie").focus();
				flag = false;
				return flag;
			}else{
				flag = true;
				break;
			}
		}else{
			flag = true;
			break;
		}
	}
	while(true){
		//清明
		if($("#holidayMonSelQ").val() == "0" && $("#holidayDaySelQ").val() == "0" && $("#holidayMonSelQ1").val() == "0" && $("#holidayDaySelQ1").val() == "0"){
			flag = true;
			break;
		}else if($("#holidayMonSelQ").val() == "0" || $("#holidayDaySelQ").val() == "0" || $("#holidayMonSelQ1").val() == "0" || $("#holidayDaySelQ1").val() == "0"){
			$("#qingmingjie").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "清明节起始时间未填写完整！",
				bg : "red", //背景色，默认为红色
				time : 1
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#qingmingjie").focus();
			flag = false;
			return flag;
		}else if($("#holidayMonSelQ").val() != "0" && $("#holidayDaySelQ").val() != "0" && $("#holidayMonSelQ1").val() != "0" && $("#holidayDaySelQ1").val() != "0"){
			if(!dateValid($("#holidayYearSel").val()+$("#holidayMonSelQ1").val()+$("#holidayDaySelQ1").val(),$("#holidayYearSel").val()+$("#holidayMonSelQ").val()+$("#holidayDaySelQ").val())){
				$("#qingmingjie").tips({
					side : 3, //1,2,3,4 分别代表 上右下左
					msg : "清明节结束时间小于开始时间，请核实重新填写！",
					bg : "red", //背景色，默认为红色
					time : 1
				//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
				});
				$("#qingmingjie").focus();
				flag = false;
			}else{
				flag = true;
				break;
			}
			return flag;
		}else{
			flag = true;
			break;
		}
	}
	while(true){
		//五一
		if($("#holidayMonSelW").val() == "0" && $("#holidayDaySelW").val() == "0" && $("#holidayMonSelW1").val() == "0" && $("#holidayDaySelW1").val() == "0"){
			flag = true;
			break;
		}else if($("#holidayMonSelW").val() == "0" || $("#holidayDaySelW").val() == "0" || $("#holidayMonSelW1").val() == "0" || $("#holidayDaySelW1").val() == "0"){
			$("#wuyijie").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "五一节起始时间未填写完整！",
				bg : "red", //背景色，默认为红色
				time : 1
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#wuyijie").focus();
			flag = false;
			return flag;
		}else if($("#holidayMonSelW").val() != "0" && $("#holidayDaySelW").val() != "0" && $("#holidayMonSelW1").val() != "0" && $("#holidayDaySelW1").val() != "0"){
			if(!dateValid($("#holidayYearSel").val()+$("#holidayMonSelW1").val()+$("#holidayDaySelW1").val(),$("#holidayYearSel").val()+$("#holidayMonSelW").val()+$("#holidayDaySelW").val())){
				$("#wuyijie").tips({
					side : 3, //1,2,3,4 分别代表 上右下左
					msg : "五一节结束时间小于开始时间，请核实重新填写！",
					bg : "red", //背景色，默认为红色
					time : 1
				//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
				});
				$("#wuyijie").focus();
				flag = false;
			}else{
				flag = true;
				break;
			}
			return flag;
		}else{
			flag = true;
			break;
		}
	}
	while(true){
		//端午
		if($("#holidayMonSelD").val() == "0" && $("#holidayDaySelD").val() == "0" && $("#holidayMonSelD1").val() == "0" && $("#holidayDaySelD1").val() == "0"){
			flag = true;
			break;
		}else if($("#holidayMonSelD").val() == "0" || $("#holidayDaySelD").val() == "0" || $("#holidayMonSelD1").val() == "0" || $("#holidayDaySelD1").val() == "0"){
			$("#duanwujie").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "端午节起始时间未填写完整！",
				bg : "red", //背景色，默认为红色
				time : 1
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#duanwujie").focus();
			flag = false;
			return flag;
		}else if($("#holidayMonSelD").val() != "0" && $("#holidayDaySelD").val() != "0" && $("#holidayMonSelD1").val() != "0" && $("#holidayDaySelD1").val() != "0"){
			if(!dateValid($("#holidayYearSel").val()+$("#holidayMonSelD1").val()+$("#holidayDaySelD1").val(),$("#holidayYearSel").val()+$("#holidayMonSelD").val()+$("#holidayDaySelD").val())){
				$("#duanwujie").tips({
					side : 3, //1,2,3,4 分别代表 上右下左
					msg : "端午节结束时间小于开始时间，请核实重新填写！",
					bg : "red", //背景色，默认为红色
					time : 1
				//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
				});
				$("#duanwujie").focus();
				flag = false;
			}else{
				flag = true;
				break;
			}
			return flag;
		}else{
			flag = true;
			break;
		}
	}
	while(true){
		//中秋
		if($("#holidayMonSelZ").val() == "0" && $("#holidayDaySelZ").val() == "0" && $("#holidayMonSelZ1").val() == "0" && $("#holidayDaySelZ1").val() == "0"){
			flag = true;
			break;
		}else if($("#holidayMonSelZ").val() == "0" || $("#holidayDaySelZ").val() == "0" || $("#holidayMonSelZ1").val() == "0" || $("#holidayDaySelZ1").val() == "0"){
			$("#zhongqiujie").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "中秋节起始时间未填写完整！",
				bg : "red", //背景色，默认为红色
				time : 1
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#zhongqiujie").focus();
			flag = false;
			return flag;
		}else if($("#holidayMonSelZ").val() != "0" && $("#holidayDaySelZ").val() != "0" && $("#holidayMonSelZ1").val() != "0" && $("#holidayDaySelZ1").val() != "0"){
			if(!dateValid($("#holidayYearSel").val()+$("#holidayMonSelZ1").val()+$("#holidayDaySelZ1").val(),$("#holidayYearSel").val()+$("#holidayMonSelZ").val()+$("#holidayDaySelZ").val())){
				$("#zhongqiujie").tips({
					side : 3, //1,2,3,4 分别代表 上右下左
					msg : "中秋节结束时间小于开始时间，请核实重新填写！",
					bg : "red", //背景色，默认为红色
					time : 1
				//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
				});
				$("#zhongqiujie").focus();
				flag = false;
			}else{
				flag = true;
				break;
			}
			return flag;
		}else{
			flag = true;
			break;
		}
	}
	while(true){
		//国庆
		if($("#holidayMonSelG").val() == "0" && $("#holidayDaySelG").val() == "0" && $("#holidayMonSelG1").val() == "0" && $("#holidayDaySelG1").val() == "0"){
			flag = true;
			break;
		}else if($("#holidayMonSelG").val() == "0" || $("#holidayDaySelG").val() == "0" || $("#holidayMonSelG1").val() == "0" || $("#holidayDaySelG1").val() == "0"){
			$("#guoqingjie").tips({
				side : 3, //1,2,3,4 分别代表 上右下左
				msg : "国庆节起始时间未填写完整！",
				bg : "red", //背景色，默认为红色
				time : 1
			//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
			});
			$("#guoqingjie").focus();
			flag = false;
			return flag;
		}else if($("#holidayMonSelG").val() != "0" && $("#holidayDaySelG").val() != "0" && $("#holidayMonSelG1").val() != "0" && $("#holidayDaySelG1").val() != "0"){
			if(!dateValid($("#holidayYearSel").val()+$("#holidayMonSelG1").val()+$("#holidayDaySelG1").val(),$("#holidayYearSel").val()+$("#holidayMonSelG").val()+$("#holidayDaySelG").val())){
				//(parseFloat(($(".holidayMonSelG").val()+"."+$(".holidayDaySelG").val()))-parseFloat(($(".holidayMonSelG1").val()+"."+$(".holidayDaySelG1").val())))<0
				$("#guoqingjie").tips({
					side : 3, //1,2,3,4 分别代表 上右下左
					msg : "国庆节结束时间小于开始时间，请核实重新填写！",
					bg : "red", //背景色，默认为红色
					time : 1
				//默认为1 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
				});
				$("#guoqingjie").focus();
				flag = false;
			}else{
				flag = true;
				break;
			}
			return flag;
		}else{
			flag = true;
			break;
		}
	}
	return flag;
}

//时间校验（比较起始结束时间）
function dateValid(startDateStr,endDateStr){
    var beginDate =  new Date(startDateStr.replace(/^(\d{4})(\d{2})(\d{2})$/,"$1/$2/$3"));
    var endDate = new Date(endDateStr.replace(/^(\d{4})(\d{2})(\d{2})$/,"$1/$2/$3"));
    if(beginDate > endDate){
        return false;
    }else{
        return true;
    }
}

//当opation选中后字体变深
$(".holidayStyle").on("click", function(){
		$(this).css("color","#666");
});

//$(function () {
//	 $("#holidayYearSel option[index='0']").remove(); 
//$("#holidayYearSel option[value='1']").text("ddd");
//	var checkText=$("#holidayYearSel option[value='1']").text(); 
//var checkText=$("#holidayMonSel").val(0).text;
//$("#holidayYearSel option[value='0']").html("iieiei");
//	alert($("#holidayYearSel option[value='0']"));
//});
//元旦节
$(function () {
	$.ms_DatePicker({
            YearSelector: ".holidayYearSel",
            MonthSelector: ".holidayMonSel",
            DaySelector: ".holidayDaySel"
    });
	$.ms_DatePicker();
});
//春节节后
$(function () {
	$.ms_DatePicker({
            YearSelector: ".holidayYearSel",
            MonthSelector: ".holidayMonSelC",
            DaySelector: ".holidayDaySelC"
    });
	$.ms_DatePicker();
});
//春节节前
$(function () {
	$.ms_DatePicker({
            YearSelector: ".holidayYearSel",
            MonthSelector: "#holidayMonSelC",
            DaySelector: "#holidayDaySelC"
    });
	$.ms_DatePicker();
});
//清明节前
$(function () {
	$.ms_DatePicker({
            YearSelector: ".holidayYearSel",
            MonthSelector: ".holidayMonSelQ",
            DaySelector: ".holidayDaySelQ"
    });
	$.ms_DatePicker();
}); 
//清明节后
$(function () {
	$.ms_DatePicker({
            YearSelector: ".holidayYearSel",
            MonthSelector: ".holidayMonSelQ1",
            DaySelector: ".holidayDaySelQ1"
    });
	$.ms_DatePicker();
}); 
//五一前
$(function () {
	$.ms_DatePicker({
            YearSelector: ".holidayYearSel",
            MonthSelector: ".holidayMonSelW1",
            DaySelector: ".holidayDaySelW1"
    });
	$.ms_DatePicker();
}); 
//五一后
$(function () {
	$.ms_DatePicker({
            YearSelector: ".holidayYearSel",
            MonthSelector: ".holidayMonSelW",
            DaySelector: ".holidayDaySelW"
    });
	$.ms_DatePicker();
}); 
//端午前
$(function () {
	$.ms_DatePicker({
            YearSelector: ".holidayYearSel",
            MonthSelector: ".holidayMonSelD1",
            DaySelector: ".holidayDaySelD1"
    });
	$.ms_DatePicker();
}); 
//端午后
$(function () {
	$.ms_DatePicker({
            YearSelector: ".holidayYearSel",
            MonthSelector: ".holidayMonSelD",
            DaySelector: ".holidayDaySelD"
    });
	$.ms_DatePicker();
}); 
//中秋前
$(function () {
	$.ms_DatePicker({
            YearSelector: ".holidayYearSel",
            MonthSelector: ".holidayMonSelZ1",
            DaySelector: ".holidayDaySelZ1"
    });
	$.ms_DatePicker();
}); 
//中秋后
$(function () {
	$.ms_DatePicker({
            YearSelector: ".holidayYearSel",
            MonthSelector: ".holidayMonSelZ",
            DaySelector: ".holidayDaySelZ"
    });
	$.ms_DatePicker();
}); 
//国庆前
$(function () {
	$.ms_DatePicker({
            YearSelector: ".holidayYearSel",
            MonthSelector: ".holidayMonSelG1",
            DaySelector: ".holidayDaySelG1"
    });
	$.ms_DatePicker();
}); 
//国庆后
$(function () {
	$.ms_DatePicker({
            YearSelector: ".holidayYearSel",
            MonthSelector: ".holidayMonSelG",
            DaySelector: ".holidayDaySelG"
    });
	$.ms_DatePicker();
}); 

	var currentYear = new Date().getFullYear();
    var select = document.getElementById("holidayYearSel");
    for (var i = 0; i <= 4; i++) {
        var theOption = document.createElement("option");
        theOption.innerHTML = currentYear+i + " 年";
        theOption.value = currentYear+i;
        select.appendChild(theOption);
        //select.append("<option value='"+(currentYear+i)+"'>"+(currentYear+i) + " 年"+"</option>");
    }
    
//初始化函数
$(function($) {
	var mydate = new Date();
	var currentYear = mydate.getFullYear();//获取当前年份
	$("#holidayYearSel").val(currentYear);
	showHolidayManagementInfor();
	$('.sel2').select2();
});

$(".headList").on("click", function(){
			$(this).addClass("headListSelect");
			$(this).children().css("color","#57a3f1");
			$(this).siblings().removeClass("headListSelect");
			$(this).siblings().children().css("color","#333333");
		});
$(".headList a").on("click", function(){
			$(this).css("color","#57a3f1");
			$(this).parent().siblings().children().css("color","#333333");
		});
	function company(){
						var oDiv=document.getElementById("allocation");//包含全部内容外面的大div
					    var oP=oDiv.getElementsByClassName("parList");//标题  点击显示隐藏的内容的
					    var aDiv=oDiv.getElementsByClassName("childList");//显示隐藏的内容
					   
					    for(i=0;i<oP.length;i++)
					    {
					        oP[i].index=i;
					        oP[i].onclick=function()
					        {	 
					            for(j=0;j<aDiv.length;j++)
					            {
					                aDiv[j].style.display="none";
					                }
					            
					            aDiv[this.index].style.display="block";
					           
					        };
					    }
				
				}
</script>