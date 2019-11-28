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
<div class="row"  style="padding-left:12px;">
					<div class="col-md-2 fl" style="padding-left:8px;width:15%;">
						<input type="text" id="searchTitle" class="form-control"  style="margin-top:10px;" placeholder="请输入公告标题"> 
					</div>
					<div class="col-md-1 fl" style="padding-left: 0;width: 15%;white-space: nowrap;overflow: hidden;margin-top: 10px;">
						<button type="button" class="btn btn-default headConfirm" onclick="searchNotice();">搜索</button>
					</div>
					<div class="col-md-4  fr" style="text-align: right;width:20%;white-space: nowrap;overflow: hidden;margin-top: 10px;">
						<button class="addButton " type="submit" data-toggle="modal" data-target="#myModal"><img src="../img/addButton.png" />添加</button>
					</div>
				</div>

<div class="modal fade" style="margin-top: -5%" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="false">
<div class="modal-dialog" style="margin-top:5%;width:620px;">
			<div class="modal-content" >
				<div class="modal-header addHead">
					<div type="button" class="fr closeButton" data-dismiss="modal" aria-hidden="true" style="width:15px;height: 15px; background: url(../img/close.jpg) no-repeat center center;" onclick="clearNotice();"">
					</div>
					<h4 class="modal-title"   style="background: url(../img/add.png) no-repeat left center;padding-left: 23px;color:#fff;">
						添加公告
					</h4>
				</div>
<div class="modal-body">
<form class="form-horizontal" role="form">
<div class="inputBorder">
<input type="text" class="inputMain fl" id="newsTitle" placeholder="请输入公告标题"/>
</div>
<div class="inputBorder">
<textarea class="inputTextarea" id="newsContent" placeholder="请输入公告内容"></textarea>
</div>
</form>
</div>
<div  class="buttonArea" style="clear: both;padding-top: 0px;">
					<button type="submit" class="buttonConfirm" id="btnSave" onclick="addNotice();" style="color:#fff">添加</button>
					<button type="submit" class="buttonConfirm" style="background:#D5D5D5;color:#fff;" data-dismiss="modal" aria-hidden="true" onclick="clearNotice();">返 回</button>
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
						修改公告
					</h4>
				</div>
<div class="modal-body">
<form class="form-horizontal" role="form">
<input id="id" type="hidden">
<div class="inputBorder">
<input type="text" class="inputMain fl"  id="newsTitle2"  placeholder="请输入公告标题"/>
</div>
<div class="inputBorder">
<textarea class="inputTextarea" placeholder="请输入公告内容"  id="newsContent2"></textarea>
</div>
</form>
</div>
<div  class="buttonArea" style="clear: both;margin-top: 0px;">
					<button type="submit" class="buttonConfirm" id="btnEdit" onclick="editNotice();" style="color:#fff">确定</button>
					<button type="submit" class="buttonConfirm" style="background:#D5D5D5;color:#fff;" data-dismiss="modal" aria-hidden="true" >返 回</button>
</div>
</div> 
</div> 
</div>

		

		

<!-- 操作信息提示框开始 
	<div class="modal fade" id="delcfmModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="false">
		<div class="modal-dialog" style="margin-top:10%;width:30%;">
			<div class="modal-content" style="border-radius:5px;border:none;">
				<div class="modal-header addHead">
					<input type="hidden" value="" id="unidOfchangeStatus"></input>
					<input type="hidden" value="" id="statusOfchangeStatus"></input>
					<div type="button" class="fr closeButton" data-dismiss="modal" aria-hidden="true" style="width:15px;height: 15px; background: url(../img/close.jpg) no-repeat center center;">
					</div>
					<h4 class="modal-title" id="myModalLabel"  style="background:url(../img/tishi.png) no-repeat left center;padding-left: 26px;font-size:18px;font-family:'微软雅黑'">
						提示
					</h4>
				</div>
				<div class="modal-body"  style="color:#666666;text-align:center;font-size:16px;" id="comfirmMsg">
				确定删除？
				</div>
				<div  class="buttonArea">
				    <input type="hidden" id="noticeid"/> 
					<button type="submit" class="buttonConfirm" onclick="delSubmit();" data-dismiss="modal">确 定</button>
					<button type="submit" class="buttonConfirm"  style="background:#D5D5D5;" data-dismiss="modal" aria-hidden="true">取 消</button>
				</div>
			</div>
		</div>
	</div> 
	-->
	<!-- 操作信息提示框开始 -->
	<div class="modal fade" id="delcfmModel" tabindex="-1"
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
					确定删除？
				</div>
				<div class="buttonArea">
				  <input type="hidden" id="noticeid"/> 
					<button type="submit" class="buttonConfirm" onclick="delSubmit();"
						data-dismiss="modal">确 定</button>
					<button type="submit" class="buttonConfirm"
						style="background:#D5D5D5;" data-dismiss="modal"
						aria-hidden="true">取 消</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 操作信息提示框结束 -->
	
	
<div class="main-box-body clearfix" style=" margin-top:10px;margin-left: 5px">
		<div id="table-example_wrapper"
			class="dataTables_wrapper form-inline dt-bootstrap no-footer">
<table id="userInfo" class="table table-hover dataTable no-footer table-striped table-bordered" cellspacing="0" width="100%" role="grid">
<thead>
<tr style="background:#57a3f1; color: #fff;font-size: small; ">
  <th style=" text-align: center;padding-top:15px;padding-bottom:15px;">公告标题</th>
  <th style=" text-align: center;padding-top:15px;padding-bottom:15px;">公告内容</th>
  <th style=" text-align: center;padding-top:15px;padding-bottom:15px;">发布时间</th>
  <th style=" text-align: center; width:100px;padding-top:15px;padding-bottom:12px;">操作</th>
</tr>
</thead>
<tbody  style="color:#666666;font-size: 0.875em;">
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
var searchNoticeName;


//判断浏览器是否支持 placeholder属性
function isPlaceholder(){
    var input = document.createElement('input');
    return 'placeholder' in input;
}
function isPlaceholder2(){
	var textarea = document.createElement('textarea');
    return 'placeholder' in textarea;
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
                $("textarea").each(
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
	               "Info": true,//页脚信息
	               "autoWidth": true,//自动宽度
	               "oLanguage": {//国际语言转化
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
	               ordering : false, //全局启用排序
		 ajax: {
		        //指定数据源
		        url: "<%=path%>/noticeCfgController/noticeData.html",
		        type : "POST",
		        "data": function ( d ) {//向后台传递参数，需要时后台可以接收使用
		          d.searchNoticeName = searchNoticeName;
			    }
              },
		    "iDisplayLength":5 , 
		    bStateSave : false,
		    columns: [
		    {
		        "data": "newsTitle",
		        "orderable": false
		    },
		    {
		        "data": "newsContent",
		        "orderable": false,
		        "render" : function(data, type, full,meta) {
		        	if(data.length>20){
		        		return data.substring(0,20)+"......";
		        	}else{
		        		return data;
		        	}
		        }
		    },
		    {
		        "data": "newsTime",
		        "orderable": false,
		        "render" : function(data, type, full,meta) {
		        	if(data.length>10){
		        	return data.substring(0,10);
		        	}else{
		        		return data;
		        	}
		        	
		        }
		    },
		    {
	            "data": "id",
	            "orderable": false,
	            "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
	                $(nTd).html("").append("<div style='float:left;margin-left:25px'><img src='../img/xiugai.png'    onclick='_editFun(\"" + oData.id + "\")'/></div>")
	               .append("<div style='float:left;margin-left:30px'><img src='../img/delectActive.png'   onclick='_deleteFun(\"" + sData + "\")' data-toggle='modal' data-target='#delcfmModel'/></div>")
	            }
	        }
		    ]
		    //columnDefs 这个里面配置的作用是，禁用第一列的搜索和排序。为什么？因为第一列是行号排序还搜索已经没有意义了
		   
		});
	  //设置行号
	  //on 为 jQuery 里监听事件的方法，给元素绑定监听事件，这里监听了 order.dt 、search.dt 两个事件，意思是当排序和搜索后，重新生成行号
	  //t.column(0,{selector}).nodes() 这个的作用是获取第一列的 DOM 元素，接着用 each 方法遍历，把行号设置进去。
	  //draw 最后一个重绘方法，生成序号后，重新绘制。DT 的每个操作，包括排序、过滤、翻页还是自己使用API操作这些操作或者是设置了数据都要再调用 draw 方法才行
	//  table.on('order.dt search.dt',
	//	function() {
	//	  table.column(0, {
	//	        "search": 'applied',
	//	        "order": 'applied'
	//	    }).nodes().each(function(cell, i) {
	//	        cell.innerHTML = i + 1;
	//	    });
	//	}).draw();
	  
});

/**
 * 查询
 */
function searchNotice(){
	searchNoticeName = $("#searchTitle").val()=='请输入公告标题'?'':$("#searchTitle").val();
	table.ajax.url("<%=path%>/noticeCfgController/searchNotice.html").load();
}


/**
 * 清空
 */
function clearNotice(){
	var name=$("#newsTitle").val("");
	var username=$("#newsContent").val("");
}



function paramValidate() {
	var newsTitle=$("#newsTitle").val();
	var newsContent=$("#newsContent").val();
	if(newsTitle==null||newsTitle==""||newsTitle.length==0){
		$("#newsTitle").tips({
			side:3,               //1,2,3,4 分别代表 上右下左
            msg:'输入公告标题',
            bg:'red',         //背景色，默认为红色
            time:2               //默认为2 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
        });
		
		$("#newsTitle").focus();
		return false;
	}
	if(newsContent=="" ||newsContent==null){
		$("#newsContent").tips({
			side:3,
            msg:'公告内容不能为空！',
            bg:'red',
            time:2
        });
		$("#newsContent").focus();
		return false;
	}
	
	if(newsContent.length>2000){
		$("#newsContent").tips({
			side:3,
            msg:'公告内容不能超过二千字！',
            bg:'red',
            time:2
        });
		$("#newsContent").focus();
		return false;
	}
	return true;
}


/**
 * 新增公告
 */
function addNotice(){
	var newsTitle=$("#newsTitle").val();
	var newsContent=$("#newsContent").val();
	if (!paramValidate()){
		return;
	}
	$.ajax({
	    type: 'POST',
	    url: '<%=path%>/noticeCfgController/add.html',
	    data: {
	    	"newsTitle":newsTitle,
	    	"newsContent":newsContent
	    },
	    success: function (json) {
	        if (json=="1") {
	            $("#myModal").modal("hide");
	            table.ajax.reload(null,false);
	            toastr.success("添加成功");
	            clearNotice();
	        } else {
	        	toastr.error("添加失败");
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

function _editFun(id) {
	$.ajax({
	    type: 'POST',
	    dataType : "json",
	    url: '<%=path%>/noticeCfgController/getNoticeById.html',
	    data: {"id":id},
	    success : function(data) {
	      $("#newsTitle2").val(data.newsTitle);
	      $("#newsContent2").val(data.newsContent);
	      $("#id").val(id);
	      $("#myModalEdit").modal("show");
	   
	    }
	});	

}

/**
 * 修改保存数据
 */
function editNotice(){
var newsTitle=$("#newsTitle2").val();
var newsContent=$("#newsContent2").val();
var id=$("#id").val();
if(newsTitle==null||newsTitle==""||newsTitle.length==0){
		$("#newsTitle2").tips({
			side:3,               //1,2,3,4 分别代表 上右下左
            msg:'公告标题不能为空',
            bg:'red',         //背景色，默认为红色
            time:2               //默认为2 自动关闭时间 单位为秒 0为不关闭 （点击提示也可以关闭）
        });
		
		$("#newsTitle2").focus();
		return false;
	}
	if(newsContent=="" || newsContent.length==0 ){
		$("#newsContent2").tips({
			side:3,
            msg:'公告内容不能为空',
            bg:'red',
            time:2
        });
		
		$("#newsContent2").focus();
		return false;
	}
var jsonData = {
	    "id": id,
	    "newsTitle": newsTitle,
	    "newsContent": newsContent
	};
$.ajax({
    type: 'POST',
    url: '<%=path%>/noticeCfgController/edit.html',
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
$("#noticeid").val(id);//把值赋给隐藏的userid
}





function delSubmit(){
	var id=$("#noticeid").val();
	$.ajax({
	    url: "<%=path%>/noticeCfgController/deleteNotice.html",
	    data: {"id": id},
	    type: "post",
	    dataType:"json",
	    success: function (backdata) {
	        if (backdata) {
	        	$("#delcfmModel").modal("hide");
	        	table.ajax.reload(null,false);
	        	toastr.success("删除成功");
			} else {
	        	toastr.error("删除失败");
	        }
	    }, error: function (error) {
	    	toastr.error("删除失败");
	    }
	});
}
</script>
</body>

</html>