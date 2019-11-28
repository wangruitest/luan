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

</style>
<script src="${home}/js/jquery.js"></script>
<script src="${home}/js/bootstrap.js"></script>
<script src="${home}/js/jquery.nanoscroller.min.js"></script>
<script src="${home}/js/demo.js"></script>
<script src="${home}/js/scripts.js"></script>
<script src="${home}/js/jquery.tips.js"></script>
<script type="text/javascript" src="${home}/js/select2.min.js"></script>		
</head>
<body>			
<div class="row"  style="padding-left:0px;margin-left:5px;">
					<div class="col-md-2 fl" style="padding-left:0;width: 10%;margin-top: 10px;">
						<select class="sel2"   style="width:100%"  id="searchStatus">
							<option value="0">启用</option>
							<option value="1">停用</option>
						</select>
					</div>
					<div class="col-md-3 fl" style="padding-left: 0;width: 15%;margin-top: 10px;">
						<select class="sel2"  style="width:100%" id="searchUnitName">
						<option  value="">全部单位</option>
						</select>
					</div>
					<div class="col-md-2 fl" style="padding-left: 0;width:15%;">
						<input type="text" id="getUserName" class="form-control"  style="margin-top:10px;" placeholder="请输入姓名" maxLength=32> 
					</div>
					<div class="col-md-1 fl" style="padding-left: 0;width: 15%;white-space: nowrap;overflow: hidden;margin-top: 10px;">
						<button type="button" class="btn btn-default headConfirm" onclick="searchUser();">搜索</button>
					</div>
					
	</div>



		


<div class="main-box-body clearfix" style=" margin-top:10px;">
<table id="userInfo" class="table table-hover dataTable no-footer table-striped table-bordered" cellspacing="0" width="100%">
<thead>
<tr style="background:#57a3f1; color: #fff;font-size: small; ">
  <th style=" text-align: center;padding-top:15px;padding-bottom:15px;">序号</th>
  <th style=" text-align: center;padding-top:15px;padding-bottom:15px;">用户名</th>
  <th style=" text-align: center;padding-top:15px;padding-bottom:15px;">登录名</th>
  <th style=" text-align: center;padding-top:15px;padding-bottom:15px;">手机号</th>
  <th style=" text-align: center;padding-top:15px;padding-bottom:15px;">景区权限</th>
  <th style=" text-align: center;padding-top:15px;padding-bottom:15px;">单位</th>
</tr>
</thead>
<tbody  style="text-align:center;color:#000;font-size: 0.875em;">
</tbody>
</table>
</div>
<!--  <script src="http://cdn.gbtags.com/datatables/1.10.5/js/jquery.dataTables.min.js"></script> 
<script type="text/javascript" language="javascript" src="http://cdn.datatables.net/plug-ins/28e7751dbec/integration/bootstrap/3/dataTables.bootstrap.js"></script> -->
<script src="${home}/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" language="javascript"
		src="${home}/js/dataTables.bootstrap.js"></script>
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
	               "ordering": false, //排序功能
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
		    },
		    {
		    	"data":"unit",
		    	"orderable" : false
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
                	$("#searchUnitName").append("<option value='"+data[i].unid+"'>"+data[i].name+"</option>");
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
	getUserName = $("#getUserName").val()=='请输入姓名'?'':$("#getUserName").val();
	table.ajax.url("<%=path%>/userController/searchUser.html").load();//改变url重新获取数据源
}




</script>
</body>

</html>