<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.funo.system.model.SysOperator"%>
<%@page import="com.funo.utils.Constants"%>
<%
	request.setAttribute("home", request.getContextPath());
	SysOperator user = null;
	if(request.getSession() != null && request.getSession().getAttribute(Constants.Session_Attribute_UserEnv) != null){
		user = (SysOperator)request.getSession().getAttribute(Constants.Session_Attribute_UserEnv);
	}
%>
<jsp:include flush='true' page='../../jsp/common/echarts_inc.jsp'></jsp:include>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<script type="text/javascript" src="<%=request.getContextPath()%>/dwr/engine.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/dwr/util.js"></script>
<script type='text/javascript'
	src='<%=request.getContextPath()%>/dwr/interface/RegionRealtimeSumAction.js'></script>	
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery/jquery-1.8.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery/jquery-easyui-1.3.2/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery/jquery-easyui-1.3.2/locale/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/js/jquery/jquery-easyui-1.3.2/themes/default/easyui.css" title="default">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/js/jquery/jquery-easyui-1.3.2/themes/icon.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/form.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/content.css">
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=vsemGPTjudgYoDhNs0kwE8mk"></script> 

<link href="<%=request.getContextPath() %>/css/map/reset.css" rel="stylesheet" type="text/css" />

<%-- <script type="text/javascript"
	src="<%=request.getContextPath() %>/js/common/jquery.pagination.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath() %>/js/common/pagination.js"></script> --%>
<script type="text/javascript">
    var ROOT_URL="<%=request.getContextPath()%>";
    var loading_iframe = '<%=request.getContextPath()%>/loading.html';
    var fater=getTop();
    function getTop(){
	   	var maxTop=window.top;
	   	if(window.parent){
	   		maxTop=window.parent.top;
	   	}
	   	return maxTop;
    }
    
    DWREngine.setPreHook(showLoading);
	DWREngine.setPostHook(hideLoading);
		 

		 dwr.engine.setErrorHandler( function(mes,e) {
	        if(mes.indexOf('failed to read input')>=0){
				return true;
	        }
			alert(mes);
		});

		function showLoading() {
		    var disabledImageZone = fater.document.getElementById('disabledImageZone');
		     var disabledImageZone = fater.document.getElementById('disabledImageZone');
		    if (!disabledImageZone) {
		      disabledImageZone = fater.document.createElement('div');
		      disabledImageZone.setAttribute('id', 'disabledImageZone');
		      disabledImageZone.style.position = "absolute";
		      disabledImageZone.style.zIndex = "10000";
		      disabledImageZone.style.left = "0px";
		      disabledImageZone.style.top = "0px";
		      disabledImageZone.style.width = "100%";
		      disabledImageZone.style.height = "100%";

		      var iframe = fater.document.createElement('iframe');
		      disabledImageZone.appendChild(iframe);
		      iframe.setAttribute('id','markIframe');
		      iframe.setAttribute('allowTransparency','true');
		      iframe.setAttribute('src',loading_iframe);
		      iframe.style.position = "absolute";

		      var popHeight=0;
		      var popWidth=0;
		      var fullHeight = getViewportHeight();
			  var fullWidth = getViewportWidth();
			  var theBody = fater.document.getElementsByTagName("BODY")[0];
			  if (fullHeight > theBody.scrollHeight) {
				popHeight = fullHeight;
			  } else {
				popHeight = theBody.scrollHeight;
			  }

			  if (fullWidth > theBody.scrollWidth) {
					popWidth = fullWidth;
			  } else {
				popWidth = theBody.scrollWidth;
			  }

		      iframe.style.width = popWidth+"px";
		      iframe.style.height = popHeight+"px";
		      iframe.style.top = "0px";
		      iframe.style.left = "0px";

		      fater.document.body.appendChild(disabledImageZone);
		    }
		    fater.document.getElementById('disabledImageZone').style.visibility = 'visible';
		}
		
		function hideLoading() {
			 fater.document.getElementById('disabledImageZone').style.visibility = 'hidden';
		  }
		 
document.onkeydown = function() 
	{
	    if(event.keyCode == 8)
	    {
	        if(event.srcElement.tagName.toLowerCase() == "input"
	           || event.srcElement.tagName.toLowerCase() == "textarea"){
	           if(event.srcElement.readOnly == true){
	           		event.keyCode=0;
		            event.returnvalue=false;
	  				return false;
	           }
	        }
	    }
	}

function getViewportHeight() {
	if (fater.location.href.indexOf("desktop")>=0) return 407;
	if (window.innerHeight!=window.undefined) return window.innerHeight;
	if (document.compatMode=='CSS1Compat') return document.documentElement.clientHeight;
	if (document.body) return document.body.clientHeight;
	return window.undefined;
}
function getViewportWidth() {
	if (window.innerWidth!=window.undefined) return window.innerWidth;
	if (document.compatMode=='CSS1Compat') return document.documentElement.clientWidth;
	if (document.body) return document.body.clientWidth;
	return window.undefined;
}

function async(){
	DWREngine.setAsync(true);
}
function sync(){
	DWREngine.setAsync(false);
}

function showObj(obj){
	var objStr="";
	for(items in obj){

		var str="objStr+=items+'='+obj."+items+"+'\\n';";

		eval(str);
	}
	return objStr;
}

function clone(obj){
	var objClone;
	if (obj.constructor == Object){
		objClone = new obj.constructor();
	}else{
		objClone = new obj.constructor(obj.valueOf());
	}
	for(var key in obj){
		if ( objClone[key] != obj[key] ){
			if ( typeof(obj[key]) == 'object' ){
				objClone[key] = clone(obj[key]);
			}else{
				objClone[key] = obj[key];
			}
		}
	}
	objClone.toString = obj.toString;
	objClone.valueOf = obj.valueOf;
	return objClone;
}

function copyObjList(objList){
	var newObjList=new Array();
	for(var i=0;i<objList.length;i++){
		newObjList.push(copyObj(objList[i]));
		//newObjList.push(clone(objList[i]));
	}
	
	return newObjList;
}

function copyObj(obj){
	var newObj={};
	for(items in obj){
		newObj[items]=""+(obj[items]==null?"":obj[items])+"";
	}
	return newObj;
}

function intArraySort(array){
	array.sort(function(a, b){
		var index1 = parseInt(a);
	    var index2 = parseInt(b);
	    if(index1 < index2){
	        return -1;
	    }else if(index1 > index2){
	        return 1;
	    }else{
	        return 0;
	    }
	}); 
	return array;
}
function intArrayReverseSort(array){
	array.sort(function(a, b){
		var index1 = parseInt(a);
	    var index2 = parseInt(b);
	    if(index1 < index2){
	        return 1;
	    }else if(index1 > index2){
	        return -1;
	    }else{
	        return 0;
	    }
	}); 
	return array;
}
function arraySort(array){
	array.sort(function(a, b){
		return a-b;
	}); 
	return array;
}
function arrayReverseSort(array){
	array.sort(function(a, b){
		return b-a;
	}); 
	return array;
}

function showMsg(msg){
	//alert(msg);
	msg="<div style='width:97%;height:100%'>"+msg+"</div>";
	$.messager.alert('操作提示',msg,'info');
}

function confirmMsg(msg,callBack){
	//if(window.confirm(msg)){
		//callBack(true);
	//}else{
		//callBack(false);
	//}
	$.messager.confirm('请选择',msg,callBack);
}
function JsonToStr(o) {
	var r = [];
	if (typeof o == "string" || o == null) {
		return o;
	}
	if (typeof o == "object") {
		if (!o.sort) {
			r[0] = "{"
			for ( var i in o) {
				r[r.length] = i;
				r[r.length] = ":";
				r[r.length] = JsonToStr(o[i]);
				r[r.length] = ",";
			}
			r[r.length - 1] = "}"
		} else {
			r[0] = "["
			for ( var i = 0; i < o.length; i++) {
				r[r.length] = JsonToStr(o[i]);
				r[r.length] = ",";
			}
			r[r.length - 1] = "]"
		}
		return r.join("");
	}
	return o.toString();
}
Date.prototype.pattern=function(fmt) {           
    var o = {           
    "M+" : this.getMonth()+1, //月份           
    "d+" : this.getDate(), //日           
    "h+" : this.getHours()%12 == 0 ? 12 : this.getHours()%12, //小时           
    "H+" : this.getHours(), //小时           
    "m+" : this.getMinutes(), //分           
    "s+" : this.getSeconds(), //秒           
    "q+" : Math.floor((this.getMonth()+3)/3), //季度           
    "S" : this.getMilliseconds() //毫秒           
    };           
    var week = {           
    "0" : "/u65e5",           
    "1" : "/u4e00",           
    "2" : "/u4e8c",           
    "3" : "/u4e09",           
    "4" : "/u56db",           
    "5" : "/u4e94",           
    "6" : "/u516d"          
    };           
    if(/(y+)/.test(fmt)){           
        fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));           
    }           
    if(/(E+)/.test(fmt)){           
        fmt=fmt.replace(RegExp.$1, ((RegExp.$1.length>1) ? (RegExp.$1.length>2 ? "/u661f/u671f" : "/u5468") : "")+week[this.getDay()+""]);           
    }           
    for(var k in o){           
        if(new RegExp("("+ k +")").test(fmt)){           
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));           
        }           
    }           
    return fmt;           
}  
//分页
function pagerFilter(data){
	if (typeof data.length == 'number' && typeof data.splice == 'function'){	// is array
		data = {
			total: data.length,
			rows: data
		}
	}
	var dg = $(this);
	var opts = dg.datagrid('options');
	var pager = dg.datagrid('getPager');
	pager.pagination({
		showRefresh: false,
		onSelectPage:function(pageNum, pageSize){
			opts.pageNumber = pageNum;
			opts.pageSize = pageSize;
			pager.pagination('refresh',{
				pageNumber:pageNum,
				pageSize:pageSize
			});
			dg.datagrid('loadData',data);
		}
	});
	if (!data.originalRows){
		data.originalRows = (data.rows);
	}
	var start = (opts.pageNumber-1)*parseInt(opts.pageSize);
	var end = start + parseInt(opts.pageSize);
	data.rows = (data.originalRows.slice(start, end));
	return data;
}

String.prototype.replaceAll = function(reallyDo, replaceWith, ignoreCase) {  
    if (!RegExp.prototype.isPrototypeOf(reallyDo)) {  
        return this.replace(new RegExp(reallyDo, (ignoreCase ? "gi": "g")), replaceWith);  
    } else {  
        return this.replace(reallyDo, replaceWith);  
    }  
} 
</script>