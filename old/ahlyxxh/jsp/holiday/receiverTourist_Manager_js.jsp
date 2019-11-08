<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="com.funo.report.charts.ReportConstants"%>
 
<script type="text/javascript">
    var queryFormCach = null;
    var treeSelectCach = null;
    $(function () {
    	 //创建列表
        $("#gridbox").datagrid({
            title:'节假日景区游客接待统计',
            idField: 'id',
            singleSelect: false,
            pagination: true,
            rownumbers:true,
            height:getViewportHeight()-80,
            pageSize: 30,
            border:false,
            fitColumns: true,
            columns: [[
                {field: 'REGIONNAME', title: '景区名称', width: 100},
                {field: 'SUMVISTOTAL', title: '游客接待总量', width: 60},
                {field: 'HOLIDAYNAME', title: '假日名称', width: 50},
                {field: 'FIRSTDAY',title :'开始日期',width :100},
                {field: 'HOLIDAYLASTDATE',title :'结束日期',width :100}
            ]]
        });

        initForm();
        
        $("#tabs").tabs({
			fit:true,
			border:false,
			onSelect:function(title){
				if(title=='柱状图' || title=='曲线图'){
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
    function searchValidate() {
 		        var beginTime = document.getElementById("ReceiverToursitQueryForm:searchYear").value;
 		        
 		        if (beginTime == "") {
 		            alert("请选择年份！");
 		            return;
 		        }
 		        if (document.getElementById("ReceiverToursitQueryForm:searchHolidy").value == "") {
 		            alert("请选择节日！");
 		            return;
 		        }
 		        //mygrid.sendQuery();
 		    }
    /**
    *  初始化节假日列表
    **/
    function initSearchHolidyList(){
    	 var cityList = document.getElementById("ReceiverToursitQueryForm:searchHolidy");    
    	 var beloneYear =  document.getElementById("ReceiverToursitQueryForm:searchYear").value;
    	 var queryObj = new Object();
    	 queryObj.beloneYear = beloneYear;
    	 cleanRegionSelect();
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
    	 var cityList = document.getElementById("ReceiverToursitQueryForm:cityCode");    
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
    
    /**
    * 查询结果
    */
    function searcReceiverTourist(){
    	var cityCode =document.getElementById("ReceiverToursitQueryForm:cityCode").value;
    	var holidayDate =document.getElementById("ReceiverToursitQueryForm:searchHolidy").value;   	  
    	var pObject = new Object();
    	  pObject.cityCode = cityCode;
    	  pObject.holidayDate = holidayDate;   	  
		 var echars=showEChart(pObject,[],getStaticObject());
		  reTryChart(echars);  
		 var pObject2 = new Object();
		 pObject2.cityCode = cityCode;
   	  	 pObject2.holidayDate = holidayDate;  
		 pObject2.IS_NOT_FETCH = "true";		
		 showDataListTable(getStaticObject(),pObject2,[]);
		 
    }
    /**表头参数的定义*/
	function getStaticObject(){
		var tObject = new Object();
		var caption='';
		if($("#ReceiverToursitQueryForm\\:searchYear").val()!=''){
			caption = $("#ReceiverToursitQueryForm\\:searchYear").val()+'年 ';
		}
		if($("#ReceiverToursitQueryForm\\:cityCode option:selected").text()!=""){
			caption += $("#ReceiverToursitQueryForm\\:cityCode option:selected").text();
		}
		if($("#ReceiverToursitQueryForm\\:searchHolidy option:selected").text()!=""){
			caption += $("#ReceiverToursitQueryForm\\:searchHolidy option:selected").text();
		}
		
		caption += '景区游客接待统计';
		 tObject.caption= caption;
	 	 tObject.subTitle="统计全市所有景区节假日游客数量";
		 tObject.procedureName = "<%=ReportConstants.HOLIDAY_RECEIVE_PROCEDURE%>";
		 tObject.PROC_PARAMS = "<%=ReportConstants.HOLIDAY_RECEIVE_PROCEDURE_PARAMS%>";
	     tObject.chartTypes = "<%=ReportConstants.COLUMN3D_CHART%>,<%=ReportConstants.PIE3D_CHART%>,<%=ReportConstants.LINE2D_CHART %>";
		 tObject.noSplit = "NO";
		 return tObject;
	}
    /**
    * 清除下拉框
    **/
    function cleanRegionSelect(){
    	 var region = document.getElementById("ReceiverToursitQueryForm:searchHolidy");
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
				        	  axisLabel :{
				        		  interval :0,
				        		  formatter: function (value, index) {
				        			  return value.split('').join('\n');
				        			}
				        	  }
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
		if($("#ReceiverToursitQueryForm\\:searchYear").val()!=''){
			title = $("#ReceiverToursitQueryForm\\:searchYear").val()+'年 ';
		}
		if($("#ReceiverToursitQueryForm\\:cityCode option:selected").text()!=""){
			title += $("#ReceiverToursitQueryForm\\:cityCode option:selected").text();
		}
		if($("#ReceiverToursitQueryForm\\:searchHolidy option:selected").text()!=""){
			title += $("#ReceiverToursitQueryForm\\:searchHolidy option:selected").text();
		}
		
		title += '景区游客接待统计';
		var headerStr = ["景区","人数","开始日期","结束日期","假日名称"];
	    var pObject = new Object();
	    	 pObject.cityCode = document.getElementById("ReceiverToursitQueryForm:cityCode").value;
	    	 pObject.holidayDate = document.getElementById("ReceiverToursitQueryForm:searchHolidy").value;   	     	  			
		 showExport(pObject,"",getStaticObject(),headerStr,title);
		 
	 }
	
</script>