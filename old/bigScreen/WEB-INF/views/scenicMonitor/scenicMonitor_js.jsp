<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<script type="text/javascript">
var redState;
var orangeState;
var yellowState;
var selectTouristId="";
$( function(){
	loadMenus();
	areaHeight();  
	//autoHeight();
	getProvinceAndCity();
	getSelectDataListClik();
	getTouristNum();
	getTime();
	getDataTble();
	getCityState();
	loadMap();
	//getMap();//echarts获取地图方法
	mouse();
	mouseTrigger();
	setStyle();
	$(document).on("click",".pagination>li>a",function(){
   	 	 $(".pagination>.disabled>a").css("color","grey");
 	 });
	//window.setInterval("getTouristNum()",5*1000);
	//window.setInterval("getTime()",5*1000);
	//window.setInterval(function(){dataTable.ajax.reload();},5*1000);
	//window.setInterval("getCityState()",5*1000);
	//window.setInterval("getMap()",5*1000);
	//getScenicState();
});


//加载地图
function loadMap(){
	$("#mapinforarea").empty();
	var flag="";//判断加载地图是省市的还是区县的 0省1市2区县
	var countyid = selectTouristId;//区县id
	var mapclass = '';//地图类名（控制样式）
	var mapimg = '';//地图图片位置
	var mapname = '';//地图显示名称
	var coordname = '';//热点名
	var parentStyle='';
	var tonglingimg = '';//铜陵的图片取出来单独处理保证页面能够完整显示铜陵市不被遮挡
	var tonglingimgstyle = '';//铜陵的图片样式取出来单独处理保证页面能够完整显示铜陵市不被遮挡
	var mapsplitforappend = '';//将地图所需要的标签拼接成字符串一起append到div
	//获取当前地图（市）所需的元素（不需要循环地图对象的ajax即单个地图对象）
	$.ajax({
		url : "<%=path%>/scenicMonitor/getCurrentMap.html",
		dataType : "json",
		type : "POST",
		async : true,
		data : {
			currentid : countyid
		},
		success : function(data) {
			mapname = data.mapName;
			mapclass = data.mapClass;
			coordname = data.coordName;
			mapimg = data.img;
			parentStyle = data.mark1;
			flag=data.flag;
			$("#mapnamediv").html(mapname);
		},
		error : function(data) {
			alert("加载数据异常！");
		}
	});
	
	//加载子级地图所需的元素（需要循环地图对象的ajax）
	$.ajax({
		url : "<%=path%>/scenicMonitor/getChildrenMap.html",
		dataType : "json",
		type : "POST",
		async : true,
		data : {
			currentid : countyid,
		},
		success : function(data) {
			if(flag=='2'){//区县级地图
				mapsplitforappend = mapsplitforappend + "<div class='mapImg " + mapclass + "'>";
				mapsplitforappend = mapsplitforappend + "<img id='mapImg' src='"+mapimg+"'/>";
				mapsplitforappend = mapsplitforappend + "<ul>";	
				for(var i=0 ; i<data.length ; i++){
					mapsplitforappend = mapsplitforappend + "<li class='li'>"
		            	+"<span class='cityData' style='position: absolute; display: none;'>" + data[i].num + "</span>"
		            	+"<div class='area' onmousemove='demo2(this,event)'>"
		                	+"<div class='sceneryArea' style='background:"+ data[i].color + ";"+data[i].imgStyle+"'>"
								+"<img src='"+ data[i].img +"' class='sceneryIcon'/>"
							+"</div>"
							+"<div class='sceneryGreen' style='"+ data[i].nameStyle +"'>"+data[i].mark1+"</div>"
						+"</div>"
	            	+"</li>";
				}
				mapsplitforappend = mapsplitforappend + "</ul>";
				mapsplitforappend = mapsplitforappend + "</div>";
				$("#mapinforarea").append(mapsplitforappend);
				setStyle();
				setMapSize();
				
			}else{//省市级地图
				mapsplitforappend = "<ul class='mapImg " + mapclass +"' style='"+parentStyle+"'>";
				for(var i=0 ; i<data.length ; i++){
					if(data[i].img.indexOf("tongling") > 0 ){//铜陵的图片放在最后保证地图完整显示
						tonglingimg = data[i].img;
						tonglingimgstyle = data[i].imgStyle;
					}else{
						mapsplitforappend = mapsplitforappend + "<li><img src='" + data[i].img + "'style='" + data[i].imgStyle + "'/></li>";
					}
				};
				if(tonglingimg != '' || tonglingimgstyle != ''){//市地图铜陵不做判断
					mapsplitforappend = mapsplitforappend + "<li><img src='" + tonglingimg + "'style='" + tonglingimgstyle + "'/></li>";
				}
				mapsplitforappend = mapsplitforappend + "</ul>";
				mapsplitforappend = mapsplitforappend + "<ul  class='mapImg "+mapclass+"' style='"+parentStyle+"'>"
						+"<img src='"+mapimg+"' usemap='#"+coordname+"'style='opacity: 0;filter:Alpha(Opacity=0);'"+"/>"
	            		+"<map name='"+coordname+"'>";
				
				for(var i=0 ; i<data.length ; i++){
					mapsplitforappend = mapsplitforappend + "<li >"
	            	+"<area class='area' onmousemove='demo2(this,event)' shape='poly' coords='" + data[i].coords + "'href=javascript:void(0)>"
	            	+"<span class='cityData' style='position: absolute; display: none;'>"+data[i].num+"</span>"
	            	+"</li>";
				};
				mapsplitforappend = mapsplitforappend + "</map></ul>";
				$("#mapinforarea").append(mapsplitforappend);
				setStyle();
			}
		},
		error : function(data) {
			alert("加载数据异常！");
		}
	});
}
function setMapSize(){
	var mapWidth= $(".mapMain").width();
	var map = $("#mapImg").parent();
	var mapSrc = map.children("img").attr("src");
	if(mapWidth>550){
		$(".shitaiMap").css("width",540);
		$(".shitaiMap").css("height",620);
		$(".shitaiMap").children("img").attr("src","hefeimap/shitai.png");
	}if(mapWidth<=550){
		$(".shitaiMap").css("width",400);
		$(".shitaiMap").css("height",504);
		$(".shitaiMap").children("img").attr("src","hefeimap/shitaismall.png");
	}
}
//暂不适用
function loadHefeiMap(){
	$("#mapinforarea").empty();
	var cityid = selectTouristId;//城市或其所属省id
	var mapclass = '';//地图类名（控制样式）
	var mapimg = '';//地图图片位置
	var mapname = '';//地图显示名称
	var coordname = '';//热点名
	var parentStyle='';
	var tonglingimg = '';//铜陵的图片取出来单独处理保证页面能够完整显示铜陵市不被遮挡
	var tonglingimgstyle = '';//铜陵的图片样式取出来单独处理保证页面能够完整显示铜陵市不被遮挡
	var mapsplitforappend = '';//将地图所需要的标签拼接成字符串一起append到div
	
	//获取当前地图（安徽或市地图）所需的元素（不需要循环地图对象的ajax即单个地图对象）
	$.ajax({
		url : "<%=path%>/scenicMonitor/getCurrentMap.html",
		dataType : "json",
		type : "POST",
		async : true,
		data : {
			currentid : cityid
		},
		success : function(data) {
			mapname = data.mapName;
			mapclass = data.mapClass;
			coordname = data.coordName;
			mapimg = data.img;
			parentStyle = data.mark1;
			$("#mapnamediv").html(mapname);
		},
		error : function(data) {
			alert("加载数据异常！");
		}
	});
	
	//加载子级地图所需的元素（需要循环地图对象的ajax）
	$.ajax({
		url : "<%=path%>/scenicMonitor/getChildrenMap.html",
		dataType : "json",
		type : "POST",
		async : true,
		data : {
			currentid : cityid,
		},
		success : function(data) {
			mapsplitforappend = "<ul class='mapImg " + mapclass +"' style='"+parentStyle+"'>";
			for(var i=0 ; i<data.length ; i++){
				if(data[i].img.indexOf("tongling") > 0 ){//铜陵的图片定位单独处理保证地图完整显示
					tonglingimg = data[i].img;
					tonglingimgstyle = data[i].imgStyle;
				}else{
					mapsplitforappend = mapsplitforappend + "<li><img src='" + data[i].img + "'style='" + data[i].imgStyle + "'/></li>";
				}
			};
			if(tonglingimg != '' || tonglingimgstyle != ''){//市地图铜陵不做判断
				mapsplitforappend = mapsplitforappend + "<li><img src='" + tonglingimg + "'style='" + tonglingimgstyle + "'/></li>";
			}
			mapsplitforappend = mapsplitforappend + "</ul>";
			mapsplitforappend = mapsplitforappend + "<ul  class='mapImg "+mapclass+"' style='"+parentStyle+"'>"
					+"<img src='"+mapimg+"' usemap='#"+coordname+"'style='opacity: 0;filter:Alpha(Opacity=0);'"+"/>"
            		+"<map name='"+coordname+"'>";
			
			for(var i=0 ; i<data.length ; i++){
				mapsplitforappend = mapsplitforappend + "<li >"
            	+"<area class='area' onmousemove='demo2(this,event)' shape='poly' coords='" + data[i].coords + "'href=javascript:void(0)>"
            	+"<span class='cityData' style='" + data[i].dataStyle + "'>"+data[i].num+"</span>"
            	+"</li>";
			};
			mapsplitforappend = mapsplitforappend + "</map></ul>";
			$("#mapinforarea").append(mapsplitforappend);
			setStyle();
		},
		error : function(data) {
			alert("加载数据异常！");
		}
	});
}
function demo2(obj,event){
		var Jobj = $(obj);
		var event = event || window.event;
		var infor = Jobj.siblings("span");
 		var fY= (Jobj.parent())[0].getBoundingClientRect().top;
 		var fX= (Jobj.parent())[0].getBoundingClientRect().left;
	 	var intX = event.clientX-fX+10;
 		var intY = event.clientY-fY+445;
  		//infor.style.left = intX + "px";
 		//infor.style.top = intY + "px";
 		infor.css("right","auto");
 		infor.css("left",intX + "px");
 		infor.css("top",intY + "px");
		infor.show();
}
function setStyle(){
	/* $(".area").mousemove(function(){
		  	var infor = $(this).siblings("span");
	 		var fY= ($(this).parent())[0].getBoundingClientRect().top;
	 		var fX= ($(this).parent())[0].getBoundingClientRect().left;
		 	var intX = window.event.clientX-fX+10;
	 		var intY = window.event.clientY-fY+445;
	  		//infor.style.left = intX + "px";
	 		//infor.style.top = intY + "px";
	 		infor.css("right","auto");
	 		infor.css("left",intX + "px");
	 		infor.css("top",intY + "px");
			infor.show();
	} );*/
	
	$(".area").mouseout(function(){
		  $(this).siblings("span").hide();
	});
	$(".pagination>.disabled>a").css("color","grey");
}

function getSelectDataListClik(){
		//选择城市动态赋值
		$(".selectDataList").click(function(){
			selectTouristId = $(this).attr("id");//记录选择的城市id
			$(".selectText").html($(this).text());
			$(".sceneryText").html("");
			$("#sceneryData").find("li").remove();
			$("#selectList").hide();
			getTouristNum();
			getTime();
			//dataTable.ajax.data={citys:selectTouristId,time:new Date()},
			dataTable.ajax.url("<%=path%>/scenicMonitor/getScenicState.html?citys="+selectTouristId).load();
			getCityState();
			//getMap();
			loadMap();
			mouse();
			mouseTrigger();
			setStyle();
		});
	}
function test(obj,event){
			var Jobj = $(obj);
			var event = event || window.event;
			var infor = Jobj.siblings("span");
	 		var fY= (Jobj.parent())[0].getBoundingClientRect().top;
	 		var fX= (Jobj.parent())[0].getBoundingClientRect().left;
		 	var intX = event.clientX-fX;
	 		var intY = event.clientY-fY-35;
	  		//infor.style.left = intX + "px";
	 		//infor.style.top = intY + "px";
	 		infor.css("left",intX + "px");
	 		infor.css("top",intY + "px");
			infor.show();
}
function mouse(){
	/*  $(".sceneryImgTableBg").mousemove(function(){
	 		var infor = $(this).siblings("span");
	 		var fY= ($(this).parent())[0].getBoundingClientRect().top;
	 		var fX= ($(this).parent())[0].getBoundingClientRect().left;
		 	var intX = window.event.clientX-fX;
	 		var intY = window.event.clientY-fY-35;
	  		//infor.style.left = intX + "px";
	 		//infor.style.top = intY + "px";
	 		infor.css("left",intX + "px");
	 		infor.css("top",intY + "px");
			infor.show();
		}); */
		$(".sceneryImgTableBg").mouseout(function(){
		  $(this).siblings("span").hide();
		});
}
function getTouristNum(){
	$.ajax({
		url:"<%=path%>/scenicMonitor/getTouristNum.html",
		dataType:"json",
		async:false, 
		type:"POST",
		data:{
			citys:selectTouristId
		},
		success:function(json){
			for(var i=0;i<3;i++){
				if(json[i].timeType=="0"){
					$("#realTimeNum").html(json[i].num==null||json[i].num==""?"0":json[i].num);
				}else if(json[i].timeType=="1"){
					$("#dayNum").html(json[i].num==null||json[i].num==""?"0":json[i].num);
				}else{
					$("#waishengNum").html(json[i].num==null||json[i].num==""?"0":json[i].num);
				}
			}
			
		}
	});
}
function getScenicState(){
	$.ajax({
		url:"<%=path%>/scenicMonitor/getScenicState.html",
		dataType:"json",
		async:false, 
		type:"POST",
		data:{
			citys:selectTouristId
		},
		success:function(json){
		}
	});
}
//右侧获取当前时间
function getTime(){
	$.ajax({
		url:"scenicMonitor/getTime.html",
		async:false, 
		type:"POST",
		success:function(time){
			 $(".leftTimeNum").html(time);
		}
	});
}
function getCityState(){
	$.ajax({
		url:"<%=path%>/scenicMonitor/getCityState.html",
		async:false, 
		type:"POST",
		dataType:"json",
		data:{
			citys:selectTouristId
		},
		success:function(result){
			redState=result[0];
			orangeState=result[1];
			yellowState=result[2];
			//redState[2]["itemStyle"]={normal:{color:'green'}}
			/* orangeState[2]["itemStyle"]={normal:{color:'blue'}}
			yellowState[3]["itemStyle"]={normal:{color:'red'}} *///只受第一个数据里的属性影响
		}
			
	});
}
function getDataTble(){
	dataTable = $("#statusTable").DataTable({
			dom : 'lfT<"clearfix">tipr',//自定义显示项，用来控制datatables元素
			language : {
				"sProcessing" : "处理中...",
				"sLengthMenu" : "显示 _MENU_ 项记录",
				"sZeroRecords" : "没有匹配结果",
				"sInfo" : "",
				"sInfoEmpty" : "显示第 0 至 0 项结果，共 0 项",
				"sInfoFiltered" : "(由 _MAX_ 项结果过滤)",
				"sInfoPostFix" : "",
				"sSearch" : "搜索:",
				"sUrl" : "",
				"sEmptyTable" : "表中数据为空",
				"sLoadingRecords" : "载入中...",
				//"sInfoThousands" : ",",
				"oPaginate" : {
					"sFirst" : "首页",
					"sPrevious" : "上页",
					"sNext" : "下页",
					"sLast" : "末页"}
			},
			bLengthChange: false,   //去掉每页显示多少条数据方法
			pagingType : "full_numbers", //显示首页和末页
			bAutoWidth : false, //禁用自动调整列宽
			ordering : false, //全局启用排序
			bProcessing : true, //关闭加载提示
			bServerSide : false, //不启用服务器端分页
			searching : false, //隐藏原生默认搜索框
			paging : true, //开始表格分页
			deferRender : false, //延迟渲染
			//sPaginationType: "bootstrap",
			iDisplayLength : 5, //默认页面每页展示条数 (pageLength: 2 ,//每页显示数据条数--与这个属性相同)
			iDisplayStart : 0, //默认开始从第几条数据开始显示
			ajax : {
				//指定数据源
				async:false, 
				url : "<%=path%>/scenicMonitor/getScenicState.html?citys="+selectTouristId,
			},
			columns:[	
				{"data":"scenicName",
				 "render":function(data, type,full){
				 	var rgb=full.color;
				 	 if(full.color=='4'){
				 		rgb="#ed296b";
				 	}else if(full.color=='3'){
				 		rgb="#f1582c";
				 	}else if(full.color=='2'){
				 		rgb="#fec106";
				 	}else if(full.color=='1'){
				 		rgb="#2095f2";
				 	}else{
				 		rgb="#dddddd";
				 	} 
				 	var length="";
				 	if (parseFloat(full.yuZhi)>=100) {
						length = '100%';
					}else{
						length=full.yuZhi;
					} 
 					result = "<li class='sceneryStatus' style='list-style:none'> <div class='sceneryTitle' >"+full.scenicName+"</div>"+
 						"<div class='sceneryTableMain'> <div onmousemove='test(this,event)' class='sceneryImgTableBg fl'>"+
 						"<div class='sceneryImgTable' style='width: "+length+";background:"+rgb+";'></div> </div>"+
 						"<span id='cityData' class='cityData' style='position: absolute;'>当前人数："+full.touristNum+"人<br/>阈值人数："+full.max+"人</span>"+
 						"<div class='sceneryNum fr'>"+full.yuZhi+"</div> </div> </li>";
 					return result;
		 			}
				}
			],
 		});
 		
 		return dataTable;
}
function mouseTrigger(){
	$(".paginate_button").click(function(){//点击翻页后重新赋予景区状态条悬浮事件
			mouse();
			mouseTrigger();
		});
}
//安徽省地图（echarts地图）
	function getMap(){
	 var myChart = echarts.init(document.getElementById('mapinforarea'));
	 myChart.showLoading();
	 $.get('js/echarts/anhui.json', function (geoJson) {
	    myChart.hideLoading();
	    echarts.registerMap('安徽', geoJson);
	    myChart.setOption(option = {
	         tooltip: {
	            trigger: 'item',
	            formatter: function(params) {  
           	   		var res = params.name+'<br/>';  
            	 	var myseries = option.series;  
             		 for (var i = 0; i < myseries.length; i++) {  
             	 		res+= myseries[i].name;  
             			for(var j=0;j<myseries[i].data.length;j++){  
              				if(myseries[i].data[j].name==params.name){  
              					res+=' : '+myseries[i].data[j].value+'个</br>'; 
              					break; 
	              			}  
	              		}         
             		 }  
             	 return res;  
        		 }  
	       	 }, 
	         /*dataRange: {
       			x: 'left',
        		y: 'bottom',
        		show:false,  
        		//各市区域显示的颜色：
        		//红色：#e91d62         最高级别  超过100%
        		//橙色：#f1582c    在100%到75%之间
        		//黄色：#fdc006         在75%到50%之间
        		//蓝色：#2095f2         在50%到25%之间
        		//未报警：#2095f2    在25%以下
        		 splitList: [//data的值对应区域的颜色
	            {label: '六安市', color: 'green'},
	            {start: 2, end: 2, color: '#f1582c'},
	            {start: 3, end: 3, color: '#fdc006'},
	            {start: 4, end: 4, color: '#e91d62'},
	            {start: 5, end: 5, color: '#f1582c'},
	            {start: 6, end: 6, color: '#fdc006'},
	            {start: 7, end: 7, color: '#e91d62'},
	            {start: 8, end: 8, color: '#f1582c'},
	            {start: 9, end: 9, color: '#fdc006'},
	            {start: 10, end: 10,color:'#fcc103'},
	            {start: 11, end: 11,  color: '#2095f2'},
	            {start: 12, end: 12,color:'#eeeeee'},
	            {start: 13, end: 13,color:'#fcc103'},
	            {start: 14, end: 14,  color: '#2095f2'},
	            {start: 15, end: 15,color:'green'},
	            {start: 16, end: 100,color:'red	'},
	        	], 
	         },*/
	        series: [
	            {	
	                name: '红色警告',
	                type: 'map',
	                mapType: '安徽', // 自定义扩展图表类型
	                mapLocation:{x:'0',y:'10',width:'95%'},
	                 itemStyle:{
// 	                    normal:{label:{show:true,textStyle:{color:"#333",fontSize:10}}},
	                    emphasis:{areaColor:'#adadad'}
	                }, 
	                top:40,
	                label:{
	                	normal:{
	                		show:true,
	                		textStyle:{color:"#333"}
	                	},
	                	emphasis:{
	                		show:true,
	                		textStyle:{color:"#ffffff"}
	                		
	                	}
	                	
	                	},
	                data:redState,
	            },
	            {
	                name: '橙色警告',
	                type: 'map',
	                mapType: '安徽', // 自定义扩展图表类型
	                selectedMode : 'single',
	                mapLocation:{x:'0',y:'top',width:'100%'},
	                data:orangeState,
	            },
	            {
	                name: '黄色警告',
	                type: 'map',
	                mapType: '安徽', // 自定义扩展图表类型
	                selectedMode : 'single',
	                mapLocation:{x:'0',y:'top',width:'100%'},
	                data:yellowState,
	            }
	        ]
	    });
	});}

/* function autoHeight(){
	var blueHeight=document.getElementById("blueHeight").offsetHeight;//最上面蓝色导航栏高度
	var windowHeight=window.innerHeight;
	var contentHeight = windowHeight-blueHeight;
	document.getElementById("content-wrapper").style.height = contentHeight + "px";
} */

</script>