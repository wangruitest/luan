<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="com.funo.report.charts.ReportConstants"%>
 <%@page import="com.funo.report.*"%>
<%@page import="com.funo.utils.Constants"%>
<%@page import="com.funo.report.charts.ReportConstants"%>
<%@page import="com.funo.system.model.SysOperator" %>
<% 
SysOperator user = null;
    if (request.getSession() != null && request.getSession().getAttribute(Constants.Session_Attribute_UserEnv) != null) {
        user = (SysOperator) request.getSession().getAttribute(Constants.Session_Attribute_UserEnv);
    }
    String curCountyCode = "";
    if (null != user.getCountyCode()) {
    	curCountyCode = user.getCountyCode();
    }
%>
<script type="text/javascript">
    var queryFormCach = null;
    var treeSelectCach = null;
    $(function () {
    	 //创建列表
        $("#gridbox").datagrid({
            title:'节假日景区游客来源地统计',
            idField: 'id',
            singleSelect: false,
            pagination: true,
            rownumbers:true,
            height:getViewportHeight()-80,
            pageSize: 30,
            border:false,
            fitColumns: true,
            columns: [[
                {field: 'REGION_NAME', title: '景区名称', width: 60},
                {field: 'HOLIDAY_NAME', title: '节假日名称', width: 100},
                {field: 'VISITCOUNT', title: '游客数量（人数）', width: 50},
                {field: 'FROMNAME',title :'游客来源地',width :100}
            ]]
        });

        initForm();
        
        $("#tabs").tabs({
			fit:true,
			border:false,
			onSelect:function(title){
				if(title=='柱状图'|| title=='饼状图' || title=='曲线图'){
					 searcReceiverTourist();
				}
			}
		});   
    });//结束初始化函数

    //--------------------初始化和公用方法 start ------------------------
    function initForm() {
      initCityList();  //加载城市列表
       
      initSearchHolidyList();//加载节假日列表
      searcReceiverTourist(); //加载图表数据
      initPageEvent(); //初始化界面事件 
      initCountyList();
      initRegionList();//加载景区列表
    }
    
    /**
    * 初始化界面事件
    */
    function initPageEvent(){
     $("#btn_query").click(function(){
    	 searchValidate();
    	 searcReceiverTourist();
     });
    }
    //验证搜索条件
    function searchValidate() {
 		        var beginTime = document.getElementById("ReceiverToursitFromQueryForm:searchYear").value;
 		        
 		        if (beginTime == "") {
 		            alert("请选择年份！");
 		            return;
 		        }
 		        if (document.getElementById("ReceiverToursitFromQueryForm:searchHolidy").value == "") {
 		            alert("请选择节日！");
 		            return;
 		        }
 		        //mygrid.sendQuery();
 		    }
    
    /**
    *  初始化节假日列表
    **/
    function initSearchHolidyList(){
    	 var cityList = document.getElementById("ReceiverToursitFromQueryForm:searchHolidy");    
    	 var beloneYear =  document.getElementById("ReceiverToursitFromQueryForm:searchYear").value;
    	 var queryObj = new Object();
    	 queryObj.beloneYear = beloneYear;
    	 cityList.innerHTML="";
    	 cleanSelect("ReceiverToursitFromQueryForm:searchHolidy");
    	 dwr.engine.setAsync(false);
    	 HolidayAction.getHolidayList(queryObj,function (data) {
    		 if (null == data || null == data.returnList)return;
             for (var i = 0; i < data.returnList.length; i++) {
              var lastDate = typeof(data.returnList[i]['lastDay']) !='undefined' ?
            		  		data.returnList[i]['lastDay'] : '';
           	  lastDate=lastDate.substring(0,'2016-03-12'.length);
              var optionItem = new Option(data.returnList[i]['holidayName'],lastDate);
              cityList.options.add(optionItem);
             }
         });
         dwr.engine.setAsync(true);	
    }

    /***
    * 初始化 城市列表
    **/
    function initCityList(){
    	 var cityList = document.getElementById("ReceiverToursitFromQueryForm:cityCode");    
    	 dwr.engine.setAsync(false);
         UtilsAction.getMyCitycode(function (data) {
             if (null == data || null == data.returnList)return;
             for (var i = 0; i < data.returnList.length; i++) {
              //页面不需要省级排除
                 if (data.returnList[i]['cityid'] != '340000') {
                     var varItem = new Option(data.returnList[i]['name'], data.returnList[i]['cityid']);
                     cityList.options.add(varItem);
                 } 
             }
         });
         dwr.engine.setAsync(true);
    }
    
    //初始化区县列表
   function  initCountyList(){
	var cityid=$("#ReceiverToursitFromQueryForm\\:cityCode").val();
   	var countyid=$("#ReceiverToursitFromQueryForm\\:countyCode");
   	var countyCode='<%=curCountyCode%>';
   	if(countyCode==null||countyCode==""||countyCode==0){
   	dwr.engine.setAsync(false);
   	RegionCfgAction.getAreasList(cityid,function(data){
   		countyid.empty();
   		if(null==data || null==data.returnList)return;
   		countyid.prepend("<option value='0'>全部</option>");
   		for (var i=0;i<data.returnList.length;i++) {
   	    countyid.append("<option value='"+ data.returnList[i]['areaid']+"'>"+ data.returnList[i]['areas'] +"</option>");
   		}
   	});
   	dwr.engine.setAsync(true);
   	}else{
   		dwr.engine.setAsync(false);
    	RegionCfgAction.getArea(countyCode,function(data){
    		countyid.empty();
    		if(null==data || null==data.returnList)return;
            for (var i=0;i<data.returnList.length;i++) {
    	    countyid.append("<option value='"+ data.returnList[i]['areaid']+"'>"+ data.returnList[i]['areas'] +"</option>");
    		}
    	});
    	dwr.engine.setAsync(true);
    	initRegionList();
   	}
   }
    
    /**
    * 查询结果
    */
    function searcReceiverTourist(){
    	var regionValue =document.getElementById("ReceiverToursitFromQueryForm:regionId").value;
    	var holidayDate =document.getElementById("ReceiverToursitFromQueryForm:searchHolidy").value;   	  
    	//alert("景区ID"+regionValue+"节假日期"+holidayDate);
    	var pObject = new Object();
    	  pObject.holidaylastdate = holidayDate;
    	  pObject.sceniccode = regionValue;   	  
		 var chars= showEChart(pObject,[],getStaticObject());
		 //reTryChart(chars); 
		  var pObject2 = new Object();
		 pObject2.holidaylastdate = holidayDate;
   	  	 pObject2.sceniccode = regionValue;  
		 pObject2.IS_NOT_FETCH = "true";		
		 showDataListTable(getStaticObject(),pObject2,[]); 
		 
    }
    /**表头参数的定义*/
	function getStaticObject(){
		var tObject = new Object();
		var caption='';
		if($("#ReceiverToursitFromQueryForm\\:searchYear").val()!=''){
			caption = $("#ReceiverToursitFromQueryForm\\:searchYear").val()+'年 ';
		}

		if($("#ReceiverToursitFromQueryForm\\:searchHolidy option:selected").text()!=""){
			caption += $("#ReceiverToursitFromQueryForm\\:searchHolidy option:selected").text();
		}
		if($("#ReceiverToursitFromQueryForm\\:regionId option:selected").text()!=""){
			caption += $("#ReceiverToursitFromQueryForm\\:regionId option:selected").text();
		}
		caption += '景区游客来源地统计';
		 tObject.xname="单位（省）";
		 tObject.yname="单位（人数）";
		 tObject.caption= caption;
	 	 tObject.subTitle="统计全市各个景区节假日游客来源地";
		 tObject.procedureName = "<%=ReportConstants.HOLIDAY_RECEIVE_FROM_PROCEDURE%>";
		 tObject.PROC_PARAMS = "<%=ReportConstants.HOLIDAY_RECEIVE_FROM_PROCEDURE_PARAMS%>";
	     tObject.chartTypes = "<%=ReportConstants.COLUMN3D_CHART%>,<%=ReportConstants.PIE3D_CHART%>,<%=ReportConstants.LINE2D_CHART %>";
	     tObject.noSplit = "NO";
		 return tObject;
	}
    
	 function initRegionList(){
		 var countyid = document.getElementById("ReceiverToursitFromQueryForm:countyCode").value;
         var regionId = $("#ReceiverToursitFromQueryForm\\:regionId");
         dwr.engine.setAsync(false);
        	RegionCfgAction.getRegionCfgListByCountyid(countyid,function(data){
        		regionId.empty();
        		if(null==data || null==data.returnList)return;
        		for (var i=0;i<data.returnList.length;i++) {
        			regionId.append("<option value='"+ data.returnList[i]['id']+"'>"+ data.returnList[i]['regionName'] +"</option>");
        		}
        	});
        	dwr.engine.setAsync(true);
	 }
    /**
    * 初始化 景区列表
    
    function initRegionList(){
    	   var cityid = document.getElementById("ReceiverToursitFromQueryForm:cityCode").value;
           var regionId = document.getElementById("ReceiverToursitFromQueryForm:regionId");
           if (cityid == '') {
               return;
           }
           cleanSelect("ReceiverToursitFromQueryForm:regionId");
           dwr.engine.setAsync(false);
           UtilsAction.getMyRegionCfgByOrgCode(cityid, null, function (data) {
               if (null == data || null == data.returnList)return;
               for (var i = 0; i < data.returnList.length; i++) {
                       var varItem = new Option(data.returnList[i]['regionName'], data.returnList[i]['id']);
                       regionId.options.add(varItem);
                   }
           });
           dwr.engine.setAsync(true);
    }
    **/
    /**
    * 清除下拉框
    **/
    function cleanSelect(dom){
    	 var region = document.getElementById(dom);
         var length = region.options.length;
         if (length > 0) {
             for (var i = 0; i < length; i++) {
                 region.removeChild(region.options[region.options.length - 1]);
             }
         }	
    }
	function reTryChart(chars){
		for(var i=0;i<chars.length;i++){
			if(chars[i].name!='<%=ReportConstants.PIE3D_CHART%>')
			 chars[i].chart.setOption({
				 xAxis : [
				          {
				        	 // axisLabel :{
				        	//	  interval :0,
				        	//	  formatter: function (value, index) {
				        	//		  return value.split('').join('\n');
				        	//		}
				        	//  }
				          }
				          ]				
			}); 
			
		}
	}
	 /*
	    * excel 导出
	    */
	    
	    function exportJc()
		 {
			
	    	var title='';
	    	var number='2';
	    	if($("#ReceiverToursitFromQueryForm\\:searchYear").val()!=''){
	    		title = $("#ReceiverToursitFromQueryForm\\:searchYear").val()+'年 ';
			}

			if($("#ReceiverToursitFromQueryForm\\:searchHolidy option:selected").text()!=""){
				title += $("#ReceiverToursitFromQueryForm\\:searchHolidy option:selected").text();
			}
			if($("#ReceiverToursitFromQueryForm\\:regionId option:selected").text()!=""){
				title += $("#ReceiverToursitFromQueryForm\\:regionId option:selected").text();
			}
			
			title += '景区游客来源地统计';
			var headerStr = ["景区名称","节日名称","人数","来源地名称"];
		    var pObject = new Object();
		    pObject.sceniccode= document.getElementById("ReceiverToursitFromQueryForm:regionId").value;
		    pObject.holidaylastdate =document.getElementById("ReceiverToursitFromQueryForm:searchHolidy").value;   	  
			showExport(pObject,"",getStaticObject(),headerStr,title,number);
			 	  
		 }
	
</script>
