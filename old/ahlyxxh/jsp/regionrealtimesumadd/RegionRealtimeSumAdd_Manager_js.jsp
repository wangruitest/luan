<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" %>
<script type="text/javascript">
    var queryFormCach = null;
    var treeSelectCach = null;
    $(function () {
        //创建列表
        $("#RegionRealtimeSumAddList").datagrid({
            title:'景区新增游客统计',
            idField: 'unid',
            singleSelect: false,
            pagination: true,
            rownumbers:true,
            height:getViewportHeight()-95,
            pageSize: 30,
            border:false,
            fitColumns: true,
            columns: [[
                {field: 'regionname', title: '景区名称', width: 100},
                {field: 'touristtype', title: '游客类型', width: 100},
                {field: 'searchdate', title: '查询日期', width: 100},
                {field: 'rqtime', title: '时间点', width: 100},
                {field: 'dates', title: '新增游客总量', width: 100},
                {field: 'codeGenerator', title: 'codeGenerator', width: 0, hidden: true}
            ]]
        });
        //初始化表单元素
        initForm();

        $("#tabs").tabs({border:false,
            height:getViewportHeight()-65,
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
        provinceCityChange();
        var date = $("#RegionRealtimeSumAddQueryForm\\:begindate").val();
        var currentdate = new Date().pattern("yyyy-MM-dd");
        if ("" == date) {
            date = currentdate;
            $("#RegionRealtimeSumAddQueryForm\\:begindate").val(date);
        }
    }

    //查询
    function query() {
        $('#RegionRealtimeSumAddList').datagrid('unselectAll');
        var region = $("#RegionRealtimeSumAddQueryForm\\:regionId").val();
        var time = $("#RegionRealtimeSumAddQueryForm\\:begindate").val();
        if(region==null||region.length==0){
            showMsg("请选择要查询的景区");
            return ;
        }
        if(time==null||time.length==0){
            showMsg("请选择要查询的日期");
            return ;
        }
        var queryObj = {
            areacode: $("#RegionRealtimeSumAddQueryForm\\:areacode").val(),
            cityCode: $("#RegionRealtimeSumAddQueryForm\\:cityCode").val(),
            regionId: $("#RegionRealtimeSumAddQueryForm\\:regionId").val(),
            begindate: $("#RegionRealtimeSumAddQueryForm\\:begindate").val(),
            holiday: $("#RegionRealtimeSumAddQueryForm\\:holiday").attr("checked") ? 'yes' : null,//有值则代表条件生效
            showTb:$('#showTb').attr("checked") ? 'yes' : null,
            codeGenerator: 'codeGenerator'
        };
        treeSelectCach = null;
        queryFormCach = queryObj;

        reLoadGridData(queryObj);
    }

    function downloadExcel() {
        var queryObj = {
            areacode: $("#RegionRealtimeSumAddQueryForm\\:areacode").val(),
            cityCode: $("#RegionRealtimeSumAddQueryForm\\:cityCode").val(),
            regionId: $("#RegionRealtimeSumAddQueryForm\\:regionId").val(),
            begindate: $("#RegionRealtimeSumAddQueryForm\\:begindate").val(),
            holiday: $("#RegionRealtimeSumAddQueryForm\\:holiday").attr("checked") ? 'yes' : null,//有值则代表条件生效
            showTb:$('#showTb').attr("checked") ? 'yes' : null,
            codeGenerator: 'codeGenerator'
        };
        RegionRealtimeSumAddAction.expExcel(queryObj, function (result) {
            if (result.resultCode == "0") {
                var fileName = result.returnObject[1] + ".xls";
                fileDownload(fileName);
            } else {
                showMsg("导出Excel时出错，可能原因为：\n" + result.resultMessage);
            }
        });
    }

    function reset() {
        $("#RegionRealtimeSumAddQueryForm\\:areacode").val('');
        $("#RegionRealtimeSumAddQueryForm\\:cityCode").val('');
        $("#RegionRealtimeSumAddQueryForm\\:regionId").val('');
        $("#RegionRealtimeSumAddQueryForm\\:begindate").val('');
        $("#RegionRealtimeSumAddQueryForm\\:holiday").attr("checked", false);
    }

    //加载表格数据
    function loadData(data) {
        $('#RegionRealtimeSumAddList').datagrid('unselectAll');
        if (data != null && data.length > 0) {
            $('#RegionRealtimeSumAddList').datagrid({loadFilter:pagerFilter}).datagrid('loadData', {total:data.length,rows:data});
        } else {
            $('#RegionRealtimeSumAddList').datagrid('loadData', {total: 0, rows: []});
        }
    }


    function getFormObj() {
        var obj = $("#RegionRealtimeSumAddForm").getJSON().RegionRealtimeSumAddForm;
        return obj;
    }

    function reLoadGridData(queryObj) {
        hiddenDiv("RegionRealtimeSumAddListCHART");
        var tbshow = document.getElementById("showTb").checked;
        createSubDiv("RegionRealtimeSumAddListCHART", 0);
        RegionRealtimeSumAddAction.getRegionRealtimeSumAddList(queryObj, function (result) {
            if (result.resultCode == "0") {
                var tab= $('.tabs-selected span:first').html()
                if(tab=='数据列表'){
                    loadData(result.returnList);
                }else {
                    try {
                        var obj = result.returnObject;
                        var option = eval("(" + obj + ")");
                        var div = document.getElementById("RegionRealtimeSumAddListCHART0");
                        var height = document.documentElement.clientHeight - 108;
                        div.style.height = height + "px";
                        var myChart = echarts.init(div);
                        myChart.clear();
                        myChart.setOption(option);
                    } catch (e) {
                    }
                }
            } else {
                showMsg("加载景区新增游客统计列表数据时出错，可能原因为：\n" + result.resultMessage);
            }
        });
        if (tbshow) {
            var queryObj1 = new Object();
            queryObj1 = queryObj;
            var searchtime = queryObj.begindate;
            var dayArr = searchtime.split("-");
            var tdsearchtime = (parseInt(dayArr[0]) - 1).toString() + "-" + dayArr[1] + "-" + dayArr[2];
            queryObj1.begindate = tdsearchtime;
            createSubDiv("RegionRealtimeSumAddListCHART", 1);
            RegionRealtimeSumAddAction.getRegionRealtimeSumAddList(queryObj1, function (result1) {
                if (result1.resultCode == "0") {
                    try{
                        var obj = result1.returnObject;
                        var option = eval("(" + obj + ")");
                        var div = document.getElementById("RegionRealtimeSumAddListCHART1");
                        var height = document.documentElement.clientHeight-108;
                        div.style.height=height+"px";
                        var myChart = echarts.init(div);
                        myChart.clear();
                        myChart.setOption(option);
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
        var cityid = document.getElementById("RegionRealtimeSumAddQueryForm:cityCode").value;
        var aLevel = document.getElementById("RegionRealtimeSumAddQueryForm:aLevel").value;
        var regionId = document.getElementById("RegionRealtimeSumAddQueryForm:regionId");
        var areacode = document.getElementById("RegionRealtimeSumAddQueryForm:areacode");
        removeAllOptions();//删除已有的option
        removeAreaCodeOptions();
        if (cityid == '') {
            return;
        }
        dwr.engine.setAsync(false);
        if (cityid == '340000') {
            regionId.options.add(new Option("所有景区", "99999999"));
            areacode.options.add(new Option("全部游客", "0"));
            areacode.options.add(new Option("省外游客", "1"));
            areacode.options.add(new Option("省内游客", "2"));
            document.getElementById("RegionRealtimeSumAddQueryForm:aLevel").disabled = true;
            document.getElementById("RegionRealtimeSumAddQueryForm:regionId").disabled = true;
        } else {
            areacode.options.add(new Option("全部游客", "0"));
            areacode.options.add(new Option("外地游客", "1"));
            areacode.options.add(new Option("本地游客", "2"));
            document.getElementById("RegionRealtimeSumAddQueryForm:aLevel").disabled = false;
            document.getElementById("RegionRealtimeSumAddQueryForm:regionId").disabled = false;
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
        var cityid = document.getElementById("RegionRealtimeSumAddQueryForm:cityCode").value;
        var aLevel = document.getElementById("RegionRealtimeSumAddQueryForm:aLevel").value;
        var regionId = document.getElementById("RegionRealtimeSumAddQueryForm:regionId");
        removeAllOptions();//删除已有的option
        if (cityid == '') {
            return;
        }
        dwr.engine.setAsync(false);
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
    function levelChange(){
        var cityid = document.getElementById("RegionRealtimeSumAddQueryForm:cityCode").value;
        var aLevel = document.getElementById("RegionRealtimeSumAddQueryForm:aLevel").value;
        var regionId = document.getElementById("RegionRealtimeSumAddQueryForm:regionId");
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



    function initloginerCityList() {
        var cityid = document.getElementById("RegionRealtimeSumAddQueryForm:cityCode");
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
        var region = document.getElementById("RegionRealtimeSumAddQueryForm:regionId");
        var length = region.options.length;
        if (length > 0) {
            for (var i = 0; i < length; i++) {
                region.removeChild(region.options[region.options.length - 1]);
            }
        }
    }
    /*删除select控件中所有的options*/
    function removeAreaCodeOptions() {
        var region = document.getElementById("RegionRealtimeSumAddQueryForm:areacode");
        var length = region.options.length;
        if (length > 0) {
            for (var i = 0; i < length; i++) {
                region.removeChild(region.options[region.options.length - 1]);
            }
        }
    }

    //--------------------界面操作 end ------------------------

</script>