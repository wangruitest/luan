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
<title>节假日管理</title>
<link rel="stylesheet" href="${home}/css/select2.css" />
<link rel="stylesheet" type="text/css" href="${home}/css/compiled/theme_styles.css" />
<link rel="stylesheet" type="text/css" href="${home}/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="${home}/css/caidan.css " />
<link rel="stylesheet" type="text/css" href="${home}/css/kuangjia.css " />
<link rel="stylesheet" type="text/css" href="${home}/css/toastr.css" />
<script src="${home}/js/jquery.js"></script>
<script src="${home}/js/demo.js"></script>
<script src="${home}/js/jquery.tips.js"></script>
<script type="text/javascript" src="${home}/js/bootstrap.min.js" ></script>
<script type="text/javascript" src="${home}/js/toastr.min.js"></script>
<script type="text/javascript" src="${home}/js/select2.min.js"></script>
<script type="text/javascript" src="${home}/js/birthday.js"></script>
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
.headList a{text-decoration:none;color: #333;}
.holidayArea{height: auto;}
.select2-chosen{color: #bbb;}
html { overflow-x:hidden; }
html { overflow-y:hidden; }
.mt17{margin-top: 17px;}
</style>
<body>
				<div class="commonUnit holidayArea" >
					<div class="commonHeadText">节假日管理</div>
					<div class="holidayMain">
						<div class="holidayYear">
							<select  id="holidayYearSel" class="holidayStyle holidayYearSel sel2" onchange="reloadHolidayInfor()" style="width: 120px">
								
							</select>
						</div>
						<div class="holidayList clearfix">
							<div class="holidayText fl" id = "yuandanjie">元旦</div>
							<div class="holidayDate fl">
								<select class="holidayStyle fl sel2" id="holidayMonSel" style="margin-top: 10px;width: 80px"></select>
								<div class="titleText fl">&nbsp&nbsp月</div>
							</div>
							<div class="holidayDate fl">
								<select class="holidayStyle mt17 fl sel2" id="holidayDaySel" style="margin-top: 10px;width: 80px"></select>
								<div class="titleText fl">&nbsp&nbsp日</div>
							</div>
							<div class=" fl titleText fenge">
								至
							</div>
							<div class="holidayDate fl">
								<select class="holidayStyle mt17 fl holidayMonSel sel2" id="holidayMonSelY"  style="margin-top: 11px;width: 80px"></select>
								<div class="titleText fl">&nbsp&nbsp月</div>
							</div>
							<div class="holidayDate fl">
								<select class="holidayStyle mt17 fl holidayDaySel sel2" id="holidayDaySelY"  style="margin-top: 11px;width: 80px"></select>
								<div class="titleText fl">&nbsp&nbsp日</div>
							</div>
						</div>
						<div class="holidayList clearfix">
							<div class="holidayText fl" id = "chunjie">春节</div>
							<div class="holidayDate fl">
								<select class="holidayStyle mt17 fl sel2" id="holidayMonSelC"  style="margin-top: 11px;width: 80px"></select>
								<div class="titleText fl">&nbsp&nbsp月</div>
							</div>
							<div class="holidayDate fl">
								<select class="holidayStyle mt17 fl sel2" id="holidayDaySelC"  style="margin-top: 11px;width: 80px"></select>
								<div class="titleText fl">&nbsp&nbsp日</div>
							</div>
							<div class=" fl titleText fenge">
								至
							</div>
							<div class="holidayDate fl">
								<select class="holidayStyle mt17 fl holidayMonSelC sel2" id="holidayMonSelC1"  style="margin-top: 11px;width: 80px"></select>
								<div class="titleText fl">&nbsp&nbsp月</div>
							</div>
							<div class="holidayDate fl">
								<select class="holidayStyle mt17 fl holidayDaySelC sel2" id="holidayDaySelC1"  style="margin-top: 11px;width: 80px"></select>
								<div class="titleText fl">&nbsp&nbsp日</div>
							</div>
						</div>
						<div class="holidayList clearfix">
							<div class="holidayText fl" id = "qingmingjie">清明</div>
							<div class="holidayDate fl">
								<select class="holidayStyle mt17 fl holidayMonSelQ1 sel2" id="holidayMonSelQ1"  style="margin-top: 11px;width:80px;"></select>
								<div class="titleText fl">&nbsp&nbsp月</div>
							</div>
							<div class="holidayDate fl">
								<select class="holidayStyle mt17 fl holidayDaySelQ1 sel2" id="holidayDaySelQ1"  style="margin-top: 11px;width: 80px"></select>
								<div class="titleText fl">&nbsp&nbsp日</div>
							</div>
							<div class=" fl titleText fenge">
								至
							</div>
							<div class="holidayDate fl">
								<select class="holidayStyle mt17 fl holidayMonSelQ sel2" id="holidayMonSelQ" style="margin-top: 11px;width: 80px"></select>
								<div class="titleText fl">&nbsp&nbsp月</div>
							</div>
							<div class="holidayDate fl">
								<select class="holidayStyle mt17 fl holidayDaySelQ sel2" id="holidayDaySelQ" style="margin-top: 11px;width: 80px"></select>
								<div class="titleText fl">&nbsp&nbsp日</div>
							</div>
						</div>
						<div class="holidayList clearfix">
							<div class="holidayText fl" id = "wuyijie">五一</div>
							<div class="holidayDate fl">
								<select class="holidayStyle mt17 fl holidayMonSelW1 sel2" id="holidayMonSelW1" style="margin-top: 11px;width: 80px"></select>
								<div class="titleText fl">&nbsp&nbsp月</div>
							</div>
							<div class="holidayDate fl">
								<select class="holidayStyle mt17 holidayDaySelW1 fl sel2" id="holidayDaySelW1" style="margin-top: 11px;width: 80px"></select>
								<div class="titleText fl">&nbsp&nbsp日</div>
							</div>
							<div class=" fl titleText fenge">
								至
							</div>
							<div class="holidayDate fl">
								<select class="holidayStyle mt17 fl holidayMonSelW sel2" id="holidayMonSelW" style="margin-top: 11px;width: 80px"></select>
								<div class="titleText fl">&nbsp&nbsp月</div>
							</div>
							<div class="holidayDate fl">
								<select class="holidayStyle mt17 fl holidayDaySelW sel2" id="holidayDaySelW" style="margin-top: 11px;width: 80px"></select>
								<div class="titleText fl">&nbsp&nbsp日</div>
							</div>
						</div>
						<div class="holidayList clearfix">
							<div class="holidayText fl" id = "duanwujie">端午</div>
							<div class="holidayDate fl">
								<select class="holidayStyle mt17 fl holidayMonSelD1 sel2" id="holidayMonSelD1" style="margin-top: 11px;width: 80px"></select>
								<div class="titleText fl">&nbsp&nbsp月</div>
							</div>
							<div class="holidayDate fl">
								<select class="holidayStyle mt17 holidayDaySelD1 fl sel2" id="holidayDaySelD1" style="margin-top: 11px;width: 80px"></select>
								<div class="titleText fl">&nbsp&nbsp日</div>
							</div>
							<div class=" fl titleText fenge">
								至
							</div>
							<div class="holidayDate fl">
								<select class="holidayStyle mt17 fl holidayMonSelD sel2" id="holidayMonSelD" style="margin-top: 11px;width: 80px"></select>
								<div class="titleText fl">&nbsp&nbsp月</div>
							</div>
							<div class="holidayDate fl">
								<select class="holidayStyle mt17 fl holidayDaySelD sel2" id="holidayDaySelD" style="margin-top: 11px;width: 80px"></select>
								<div class="titleText fl">&nbsp&nbsp日</div>
							</div>
						</div>
						<div class="holidayList clearfix">
							<div class="holidayText fl" id = "zhongqiujie">中秋</div>
							<div class="holidayDate fl">
								<select class="holidayStyle mt17 fl holidayMonSelZ1 sel2" id="holidayMonSelZ1" style="margin-top: 11px;width: 80px"></select>
								<div class="titleText fl">&nbsp&nbsp月</div>
							</div>
							<div class="holidayDate fl">
								<select class="holidayStyle mt17 holidayDaySelZ1 fl sel2" id="holidayDaySelZ1" style="margin-top: 11px;width: 80px"></select>
								<div class="titleText fl">&nbsp&nbsp日</div>
							</div>
							<div class=" fl titleText fenge">
								至
							</div>
							<div class="holidayDate fl">
								<select class="holidayStyle mt17 fl holidayMonSelZ sel2" id="holidayMonSelZ" style="margin-top: 11px;width: 80px"></select>
								<div class="titleText fl">&nbsp&nbsp月</div>
							</div>
							<div class="holidayDate fl">
								<select class="holidayStyle mt17 fl holidayDaySelZ sel2" id="holidayDaySelZ" style="margin-top: 11px;width: 80px"></select>
								<div class="titleText fl">&nbsp&nbsp日</div>
							</div>
						</div>
						<div class="holidayList clearfix">
							<div class="holidayText fl" id = "guoqingjie">国庆</div>
							<div class="holidayDate fl">
								<select class="holidayStyle mt17 fl holidayMonSelG1 sel2" id="holidayMonSelG1" style="margin-top: 11px;width: 80px"></select>
								<div class="titleText fl">&nbsp&nbsp月</div>
							</div>
							<div class="holidayDate fl">
								<select class="holidayStyle mt17 holidayDaySelG1 fl sel2" id="holidayDaySelG1" style="margin-top: 11px;width: 80px"></select>
								<div class="titleText fl">&nbsp&nbsp日</div>
							</div>
							<div class=" fl titleText fenge">
								至
							</div>
							<div class="holidayDate fl">
								<select class="holidayStyle mt17 fl holidayMonSelG sel2" id="holidayMonSelG" style="margin-top: 11px;width: 80px"></select>
								<div class="titleText fl">&nbsp&nbsp月</div>
							</div>
							<div class="holidayDate fl">
								<select class="holidayStyle mt17 fl holidayDaySelG sel2" id="holidayDaySelG" style="margin-top: 11px;width: 80px"></select>
								<div class="titleText fl">&nbsp&nbsp日</div>
							</div>
						</div>
						<div class="holidayList clearfix" style="border:none;">
							<div class="holidayButtonArea" style="margin-left: 20%;">
								<button class="holidayButton button1" type="submit" onclick="showSaveOrUpdateHolidayModel()">保 存</button>
							</div>
							<div class="holidayButtonArea">
								<button class="holidayButton button2" type="button" onclick="showBackHolidayModel()">取 消</button>
							</div>
						</div>
					</div>
				</div>
				
	<!-- 信息保存确认弹出框开始 -->
	<div class="modal fade" id="saveOrUpdateHolidayModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="false">
		<div class="modal-dialog" style="margin-top:10%;width:30%;">
			<div class="modal-content">
				<div class="modal-header addHead">
					<div type="button" class="fr closeButton" data-dismiss="modal" aria-hidden="true" style="width:15px;height: 15px; background: url(../img/close.jpg) no-repeat center center;">
					</div>
					<h4 class="modal-title" id="myModalLabel"  style="background:url(${home}/img/add.png) no-repeat left center;padding-left: 23px;font-size:16px;font-family:'微软雅黑';color:#ffffff;"">
						提示
					</h4>
				</div>
				<div class="modal-body"  style="color:#666666;text-align:center;font-size:16px;" id="comfirmMsg"><!--添加文区域-->
					您确认更新吗？
				</div>
				<div  class="buttonArea">
					<button type="submit" class="buttonConfirm" onclick="saveOrUpdateHolidayManagement();" data-dismiss="modal">确 定</button>
					<button type="submit" class="buttonConfirm"  style="background:#D5D5D5;" data-dismiss="modal" aria-hidden="true">取 消</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 信息保存确认弹出框结束 -->
	
	<!-- 信息取消确认弹出框开始 -->
	<div class="modal fade" id="backHolidayModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="false">
		<div class="modal-dialog" style="margin-top:10%;width:30%;">
			<div class="modal-content">
				<div class="modal-header addHead">
					<div type="button" class="fr closeButton" data-dismiss="modal" aria-hidden="true" style="width:15px;height: 15px; background: url(../img/close.jpg) no-repeat center center;">
					</div>
					<h4 class="modal-title" id="myModalLabel"  style="background:url(../img/huifuIco.png) no-repeat left center;padding-left: 23px;font-size:16px;font-family:'微软雅黑';color:#ffffff;"">
						提示
					</h4>
				</div>
				<div class="modal-body"  style="color:#666666;text-align:center;font-size:16px;" id="comfirmMsg"><!--添加文区域-->
					您确认还原至最后更新的记录吗？
				</div>
				<div  class="buttonArea">
					<button type="submit" class="buttonConfirm" onclick="backShowHolidayManagement();" data-dismiss="modal">确 定</button>
					<button type="submit" class="buttonConfirm"  style="background:#D5D5D5;" data-dismiss="modal" aria-hidden="true">取 消</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 信息取消确认弹出框结束 -->
	
	<!-- 引用js函数的jsp页面 -->
	<jsp:include flush='true' page='HolidayManagement_js.jsp'></jsp:include>
</body>
</html>