<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" %>
<script type="text/javascript">
    var queryFormCach = null;
    var treeSelectCach = null;
    $(function () {

        //创建列表
        $("#RegionRealtimeSumList").datagrid({
            title:'景区实时流量统计',
            idField: 'unid',
            singleSelect: false,
            pagination: true,
            rownumbers:true,
            height:getViewportHeight()-80,
            pageSize: 30,
            border:false,
            fitColumns: true,
            columns: [[
                {field: 'regionname', title: '景区名称', width: 100},
                {field: 'searchdate', title: '查询日期', width: 100},
                {field: 'rqtime', title: '时间点', width: 100},
                {field: 'localstourists', title: '本地游客', width: 100},
                {field: 'instourists', title: '省内游客', width: 100},
                {field: 'outstourists', title: '省外游客', width: 100},
                {field: 'stourists', title: '游客总量（人次）', width: 100},
                {field: 'codeGenerator', title: 'codeGenerator', width: 0, hidden: true}
            ]]
        });

        //初始化表单元素
        initForm();

        $("#tabs").tabs({
            border:false,
            height:getViewportHeight()-50,
            onSelect:function(){
                query();
            }
        });

    });//结束初始化函数

    //--------------------初始化和公用方法 start ------------------------
    function initForm() {
        $("#btn_query").click(query);
        $("#btn_exp").click(downloadExcel);
        $("#showTb").click(query);
        initloginerCityList();
        //provinceCityChange();
        initCountyList();
        levelChange1();
        var date = $("#RegionRealtimeSumQueryForm\\:begindate").val();
        var currentdate = new Date().pattern("yyyy-MM-dd");
        if ("" == date) {
            date = currentdate;
            $("#RegionRealtimeSumQueryForm\\:begindate").val(date);
        }
    }

		function initCountyList(){
					var cityid = document.getElementById("RegionRealtimeSumQueryForm:cityCode").value;
					var countyid=$("#countyid");
					dwr.engine.setAsync(false); 
					$("#countyid option:selected").text("");
					countyid.empty();
					RegionCfgAction.getAreasListByOperator(cityid,function(data){
						if(null==data || null==data.returnList)return;
						for (var i=0;i<data.returnList.length;i++) {
					    countyid.append("<option value='"+ data.returnList[i]['areaid']+"'>"+ data.returnList[i]['areas'] +"</option>");
						}
					});
					dwr.engine.setAsync(true);
		}
    //查询
    function query() {

        $('#RegionRealtimeSumList').datagrid('unselectAll');
        var region = $("#RegionRealtimeSumQueryForm\\:regionId").val();
        var time = $("#RegionRealtimeSumQueryForm\\:begindate").val();
        /* if(region==null||region.length==0||region=='0'){
            showMsg("请选择要查询的景区");
            return ;
        } */
        if(time==null||time.length==0){
            showMsg("请选择要查询的日期");
            return ;
        }
        var queryObj = {
            regionId: $("#RegionRealtimeSumQueryForm\\:regionId").val(),
            begindate: $("#RegionRealtimeSumQueryForm\\:begindate").val(),
            cityCode: $("#RegionRealtimeSumQueryForm\\:cityCode").val(),
            type: $("#RegionRealtimeSumQueryForm\\:type").val(),
            holiday: $("#RegionRealtimeSumQueryForm\\:holiday").attr("checked") ? 'yes' : null,//有值则代表条件生效
            showTb:$('#showTb').attr("checked") ? 'yes' : null,
            codeGenerator: 'codeGenerator'
        };
        treeSelectCach = null;
        queryFormCach = queryObj;

        reLoadGridData(queryObj);
    }

    function reset() {
        $("#RegionRealtimeSumQueryForm\\:id").val('');
        $("#RegionRealtimeSumQueryForm\\:regionId").val('');
        $("#RegionRealtimeSumQueryForm\\:stayTourists").val('');
        $("#RegionRealtimeSumQueryForm\\:inTourists").val('');
        $("#RegionRealtimeSumQueryForm\\:outTourists").val('');
        $("#RegionRealtimeSumQueryForm\\:statHour").val('');
        $("#RegionRealtimeSumQueryForm\\:updatetime").val('');
        $("#RegionRealtimeSumQueryForm\\:cityCode").val('');
        $("#RegionRealtimeSumQueryForm\\:submitTime").val('');
        $("#RegionRealtimeSumQueryForm\\:type").val('');
        $("#RegionRealtimeSumQueryForm\\:holiday").attr("checked", false);
    }

    //加载表格数据
    function loadData(data) {
        $('#RegionRealtimeSumList').datagrid('unselectAll');
        if (data != null && data.length > 0){
            $('#RegionRealtimeSumList').datagrid({loadFilter:pagerFilter}).datagrid('loadData', {total:data.length,rows:data}).datagrid('getPager').pagination('select',1);
        } else {
            $('#RegionRealtimeSumList').datagrid('loadData', {total: 0, rows: []});
        }
    }

    function downloadExcel() {
        var number="3,4,5,6";
        var queryObj = {
            regionId: $("#RegionRealtimeSumQueryForm\\:regionId").val(),
            begindate: $("#RegionRealtimeSumQueryForm\\:begindate").val(),
            cityCode: $("#RegionRealtimeSumQueryForm\\:cityCode").val(),
            type: $("#RegionRealtimeSumQueryForm\\:type").val(),
            holiday: $("#RegionRealtimeSumQueryForm\\:holiday").attr("checked") ? 'yes' : null,//有值则代表条件生效
            showTb:$('#showTb').attr("checked") ? 'yes' : null,
            codeGenerator: 'codeGenerator'
        };
        RegionRealtimeSumAction.expExcel(queryObj,number, function (result) {
            if (result.resultCode == "0") {
                var fileName = result.returnObject[1] + ".xls";
                fileDownload(fileName);
            } else {
                showMsg("导出Excel时出错，可能原因为：\n" + result.resultMessage);
            }
        });
    }


    function getFormObj() {
        var obj = $("#RegionRealtimeSumForm").getJSON().RegionRealtimeSumForm;
        return obj;
    }

    function reLoadGridData(queryObj) {
        hiddenDiv("RegionRealtimeSumListCHART");
        hiddenDiv("RegionRealtimeSumListLine");
        var tbshow = document.getElementById("showTb").checked;
        var textval = "统计显示各个景区在整点时间的实时在园游客数量，可选择景点和日期查询，可同比显示去年同期的统计。";
        createSubDiv("RegionRealtimeSumListCHART", 0);
        createSubDiv("RegionRealtimeSumListLine", 0);
        RegionRealtimeSumAction.getRegionRealtimeSumList(queryObj, function (result) {
            if (result.resultCode == "0") {
                var tab= $('.tabs-selected span:first').html()
                if(tab=='数据列表'){
                    loadData(result.returnList);
                }else {
                    var obj = result.returnObject;
                    var height = document.documentElement.clientHeight - 108;
                    try {
                        var barOption = eval("(" + obj[0] + ")");
                        var barDiv = document.getElementById("RegionRealtimeSumListCHART0");
                        barDiv.style.height = height + "px";
                        var barChart = echarts.init(barDiv);
                        barChart.clear();
                        barChart.setOption(barOption);
                    } catch (e) {
                    }
                    try {
                        var lineOption = eval("(" + obj[1] + ")");
                        var lineDiv = document.getElementById("RegionRealtimeSumListLine0");
                        lineDiv.style.height = height + "px";
                        var lineChart = echarts.init(lineDiv);
                        lineChart.clear();
                        lineChart.setOption(lineOption);
                    } catch (e) {
                    }
                }
            } else {
                showMsg("景区时时流量统计数据时出错，可能原因为：\n" + result.resultMessage);
            }
        });

        if (tbshow) {
            var queryObj1 = new Object();
            queryObj1 = queryObj;
            var searchtime = queryObj.begindate;
            var dayArr = searchtime.split("-");
            var tdsearchtime = (parseInt(dayArr[0]) - 1).toString() + "-" + dayArr[1] + "-" + dayArr[2];
            queryObj1.begindate = tdsearchtime;
            createSubDiv("RegionRealtimeSumListCHART", 1);
            createSubDiv("RegionRealtimeSumListLine", 1);
            RegionRealtimeSumAction.getRegionRealtimeSumList(queryObj1, function (result1) {
                if (result1.resultCode == "0") {
                    var height = document.documentElement.clientHeight-108;
                    try{
                        var obj = result1.returnObject;
                        var barOption = eval("(" + obj[0] + ")");
                        var barDiv = document.getElementById("RegionRealtimeSumListCHART1");
                        barDiv.style.height=height+"px";
                        var barChart = echarts.init(barDiv);
                        barChart.clear();
                        barChart.setOption(barOption);
                    }catch(e){}
                    try{
                        var lineOption = eval("(" + obj[1] + ")");
                        var lineDiv = document.getElementById("RegionRealtimeSumListLine1");
                        lineDiv.style.height=height+"px";
                        var lineChart = echarts.init(lineDiv);
                        lineChart.clear();
                        lineChart.setOption(lineOption);
                    }catch(e){}

                } else {
                    showMsg("景区时时流量统计数据时出错，可能原因为：\n" + result.resultMessage);
                }
            });
        }
    }


    //--------------------初始化和公用方法 start ------------------------
    //--------------------界面操作 start ------------------------
    /** 隐藏显示柱状图的显示的画板 */
    function hiddenDiv(divId) {
        var allDiv = document.getElementById(divId);
        while (allDiv.firstChild) {
            var oldNode = allDiv.removeChild(allDiv.firstChild);
            oldNode = null;
        }
    }
    /**创建子div*/
    function createSubDiv(divId, ind) {
        var allDiv = document.getElementById(divId);
        var divobj = document.createElement("div");
        divobj.id = divId + ind;
        divobj.style.display = "block";
        allDiv.appendChild(divobj);
    }
    function provinceCityChange() {
        var cityid = document.getElementById("RegionRealtimeSumQueryForm:cityCode").value;
        var aLevel = document.getElementById("RegionRealtimeSumQueryForm:aLevel").value;
        var regionId = document.getElementById("RegionRealtimeSumQueryForm:regionId");
        removeAllOptions();//删除已有的option
        if (cityid == '') {
            return;
        }
        dwr.engine.setAsync(false);
        if (cityid == '340000') {
            regionId.options.add(new Option("所有景区", "99999999"));
           // document.getElementById("RegionRealtimeSumQueryForm:regionId").disabled = true;
           // document.getElementById("RegionRealtimeSumQueryForm:aLevel").disabled = true;
        } else {
            document.getElementById("RegionRealtimeSumQueryForm:regionId").disabled = false;
            document.getElementById("RegionRealtimeSumQueryForm:aLevel").disabled = false;
        }
        UtilsAction.getMyRegionCfgByOrgCode(cityid, null, function (data) {
            if (null == data || null == data.returnList)return;
            for (var i = 0; i < data.returnList.length; i++) {
                if(aLevel==''){
                    var varItem = new Option(data.returnList[i]['regionName'], data.returnList[i]['id']);
                    regionId.options.add(varItem);
                }else if(data.returnList[i]['aLevel']==aLevel){
                    var varItem = new Option(data.returnList[i]['regionName'], data.returnList[i]['id']);
                    regionId.options.add(varItem);
                }
            }
        });
        dwr.engine.setAsync(true);
    }
    function cityChange() {
        var cityid = document.getElementById("RegionRealtimeSumQueryForm:cityCode").value;
        var regionId = document.getElementById("RegionRealtimeSumQueryForm:regionId");
        removeAllOptions();//删除已有的option
        if (cityid == '') {
            return;
        }
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

    function levelChange(){
        var cityid = document.getElementById("RegionRealtimeSumQueryForm:cityCode").value;
        var aLevel = document.getElementById("RegionRealtimeSumQueryForm:aLevel").value;
        var regionId = document.getElementById("RegionRealtimeSumQueryForm:regionId");
        removeAllOptions();//删除已有的option
        if (cityid=='') {
            return;
        }
        if(aLevel==''){
            cityChange();
            return;
        }
        dwr.engine.setAsync(false);
        UtilsAction.getMyRegionCfgByOrgCode(cityid,null,function(data){
            if(null==data || null==data.returnList)return;
            for (var i=0;i<data.returnList.length;i++) {
                if(data.returnList[i]['aLevel']==aLevel){
                    var varItem = new Option(data.returnList[i]['regionName'],data.returnList[i]['id']);
                    regionId.options.add(varItem);
                }
            }
        });
        dwr.engine.setAsync(true);
    }
    
     function levelChange1(){
        var cityid = document.getElementById("RegionRealtimeSumQueryForm:cityCode").value;
        var countyid = document.getElementById("countyid").value;
        var aLevel = document.getElementById("RegionRealtimeSumQueryForm:aLevel").value;
        var regionId = document.getElementById("RegionRealtimeSumQueryForm:regionId");
        //removeAllOptions();//删除已有的option
        $('#RegionRealtimeSumQueryForm\\:regionId option:selected').text("");
        $("#RegionRealtimeSumQueryForm\\:regionId").empty();
        if (cityid=='') {
            return;
        }
        if(aLevel==''){
            //cityChange();
            return;
        }
        dwr.engine.setAsync(false);
        /* UtilsAction.getMyRegionCfgByOrgCode(cityid,null,function(data){
            if(null==data || null==data.returnList)return;
            for (var i=0;i<data.returnList.length;i++) {
                if(data.returnList[i]['aLevel']==aLevel){
                    var varItem = new Option(data.returnList[i]['regionName'],data.returnList[i]['id']);
                    regionId.options.add(varItem);
                }
            }
        }); */
       
        UtilsAction.getMyRegionCfgByCounty(countyid,aLevel,function(data){
				if(null==data || null==data.returnList)return;
				if(aLevel=='0'){
				   var quanbu  = new Option('全部','');
				   regionId.options.add(quanbu);
				}
				for (var i=0;i<data.returnList.length;i++) {
					if(aLevel=='0'){
						var varItem = new Option(data.returnList[i]['regionName'],data.returnList[i]['id']);
						regionId.options.add(varItem);
					}else if(data.returnList[i]['aLevel']==aLevel){
						var varItem = new Option(data.returnList[i]['regionName'],data.returnList[i]['id']);
						regionId.options.add(varItem);
					}
				}
			});
        dwr.engine.setAsync(true);
    }

    function initloginerCityList() {
        var cityid = document.getElementById("RegionRealtimeSumQueryForm:cityCode");
        dwr.engine.setAsync(false);
        UtilsAction.getMyCitycode(function (data) {
            if (null == data || null == data.returnList)return;
            for (var i = 0; i < data.returnList.length; i++) {
                //if(data.returnList[i]['cityid'] != '340000'){
                var varItem = new Option(data.returnList[i]['name'], data.returnList[i]['cityid']);
                cityid.options.add(varItem);
                //}
            }
        });
        dwr.engine.setAsync(true);
    }
    /*删除select控件中所有的options*/
    function removeAllOptions() {
        var region = document.getElementById("RegionRealtimeSumQueryForm:regionId");
        var length = region.options.length;
        if (length > 0) {
            for (var i = 0; i < length; i++) {
                region.removeChild(region.options[region.options.length - 1]);
            }
        }
    }

    //--------------------界面操作 end ------------------------

</script>
