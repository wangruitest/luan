<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" %>
<script type="text/javascript">
    var queryFormCach = null;
    var treeSelectCach = null;
    $(function () {

        //创建列表
        $("#RegionRemainList").datagrid({
            title:'景区驻留时间分析',
            idField: 'unid',
            singleSelect: false,
            rownumbers:true,
            pagination: true,
            height : getViewportHeight()-90,
            pageSize: 30,
            border:false,
            //fit: true,
            fitColumns: true,
            columns: [[
                {field: 'stattime', title: '统计时间', width: 100},
//	{field:'zertoonehCount',title:'0-1小时',width:100},
                {field: 'onetotwohCount', title: '0-2小时', width: 100},
                {field: 'twotosixhCount', title: '2-6小时', width: 100},
                {field: 'sixhtodayCount', title: '6-24小时', width: 100},
                {field: 'daytotwodCount', title: '24-48小时', width: 100},
                {field: 'moretwodCount', title: '48小时以上', width: 100},
                {field: 'codeGenerator', title: 'codeGenerator', width: 0, hidden: true}
            ]]
        });

        //初始化表单元素
        initForm();

        $("#tabs").tabs({
            fit:true,
            border:false,
            onSelect:function(){
                //query();
                searchValidate();
            }
        });

    });//结束初始化函数

    //--------------------初始化和公用方法 start ------------------------
    function initForm() {
        var today = new Date();
        var month  = today.getMonth();
        var endMonth, beginMonth;
        if(month == 0) {
            endMonth = today.getFullYear()-1 + "-" + 12;
        }else{
            endMonth = today.getFullYear() + "-" + month;
        }
        today.setMonth(today.getMonth()-6);
        month  = today.getMonth();
        if(month == 0) {
            beginMonth =  today.getFullYear()-1 + "-" + 12;
        }else{
            beginMonth =  today.getFullYear() + "-" + month;
        }
        $("#RegionRemainQueryForm\\:mbegintime").val(beginMonth);
        $("#RegionRemainQueryForm\\:mendtime").val(endMonth);
        $("#btn_reset").click(reset);
        initloginerCityList();
        cityChange();
        toSearchTypeChange();
        //query();
        searchValidate();

    }

    //查询
    function query() {
        $('#RegionRemainList').datagrid('unselectAll');
        var region = $("#RegionRemainQueryForm\\:regionId").val();
        if(region==null||region.length==0){
            showMsg("请选择要查询的景区");
            return ;
        }
        var queryObj = {
            areaCode: $("#RegionRemainQueryForm\\:areaCode").val(),
            cityCode: $("#RegionRemainQueryForm\\:cityCode").val(),
            regionId: $("#RegionRemainQueryForm\\:regionId").val(),
            searchtype: $("#RegionRemainQueryForm\\:searchtype").val(),
            ybegintime: $("#RegionRemainQueryForm\\:ybegintime").val(),
            yendtime: $("#RegionRemainQueryForm\\:yendtime").val(),
            qbegintime: $("#RegionRemainQueryForm\\:qbegintime").val(),
            qendtime: $("#RegionRemainQueryForm\\:qendtime").val(),
            qquarterbegin: $("#RegionRemainQueryForm\\:qquarterbegin").val(),
            qquarterend: $("#RegionRemainQueryForm\\:qquarterend").val(),
            mbegintime: $("#RegionRemainQueryForm\\:mbegintime").val(),
            mendtime: $("#RegionRemainQueryForm\\:mendtime").val(),
            codeGenerator: 'codeGenerator'
        };
        treeSelectCach = null;
        queryFormCach = queryObj;

        reLoadGridData(queryObj);

    }


    function reset() {
        $("#RegionRemainQueryForm\\:areaCode").val('');
        $("#RegionRemainQueryForm\\:cityCode").val('');
        $("#RegionRemainQueryForm\\:regionId").val('');
        $("#RegionRemainQueryForm\\:searchtype").val('');
        $("#RegionRemainQueryForm\\:ybegintime").val('');
        $("#RegionRemainQueryForm\\:yendtime").val('');
        $("#RegionRemainQueryForm\\:qbegintime").val('');
        $("#RegionRemainQueryForm\\:qendtime").val('');
        $("#RegionRemainQueryForm\\:qquarterbegin").val('');
        $("#RegionRemainQueryForm\\:qquarterend").val('');
        $("#RegionRemainQueryForm\\:mbegintime").val('');
        $("#RegionRemainQueryForm\\:mendtime").val('');
    }

    //加载表格数据
    function loadData(data) {
        $('#RegionRemainList').datagrid('unselectAll');
        if (data != null && data.length > 0) {
            $('#RegionRemainList').datagrid({loadFilter:pagerFilter}).datagrid('loadData', {total:data.length,rows:data})
        } else {
            $('#RegionRemainList').datagrid('loadData', {total: 0, rows: []});
        }
    }


    function getFormObj() {
        var obj = $("#RegionRemainForm").getJSON().RegionRemainForm;
        return obj;
    }

    function reLoadGridData(queryObj) {
        RegionRemainAction.getRegionRemainList(queryObj, function (result) {
            if (result.resultCode == "0") {
                var tab= $('.tabs-selected span:first').html()
                if(tab=='数据列表'){
                    loadData(result.returnList);
                }else{
                    try{
                        var obj = result.returnObject;
                        var barOption = eval("(" + obj + ")");
                        var barDiv = document.getElementById("RegionRemainListCHART0");
                        var height = document.documentElement.clientHeight-108;
                        barDiv.style.height=height+"px";
                        var barChart = echarts.init(barDiv);
                        barChart.clear();
                        barChart.setOption(barOption);
                    }catch(e){}
                }
            } else {
                showMsg("加载景区游客驻留时间分析列表数据时出错，可能原因为：\n" + result.resultMessage);
            }
        });
    }


    //--------------------初始化和公用方法 start ------------------------
    //--------------------界面操作 start ------------------------
    /**
     * 查询验证
     * @return
     */
    function searchValidate() {
        var searchtype = document.getElementById("RegionRemainQueryForm:searchtype").value;
        if (searchtype == "") {
            alert("请选择查询方式！");
            return;
        }
        var beginTime = document.getElementById("RegionRemainQueryForm:" + searchtype + "begintime").value;
        var endTime = document.getElementById("RegionRemainQueryForm:" + searchtype + "endtime").value;
        if (beginTime == "") {
            alert("请选择开始时间！");
            return;
        }
        if (endTime == "") {
            alert("请选择结束时间！");
            return;
        }
        if (searchtype == 'q') {
            var qBegin = document.getElementById("RegionRemainQueryForm:qquarterbegin").value;
            var qEnd = document.getElementById("RegionRemainQueryForm:qquarterend").value;
            if (beginTime == endTime && qBegin > qEnd) {
                alert('开始时间不能大于结束时间');
                return;
            }
        }
        query();
    }

    function initloginerCityList() {
        var cityid = document.getElementById("RegionRemainQueryForm:cityCode");
        dwr.engine.setAsync(false);
        UtilsAction.getMyCitycode(function (data) {
            if (null == data || null == data.returnList)return;
            for (var i = 0; i < data.returnList.length; i++) {
                //页面不需要省级，排除
                if (data.returnList[i]['cityid'] != '340000') {
                    var varItem = new Option(data.returnList[i]['name'], data.returnList[i]['cityid']);
                    cityid.options.add(varItem);
                }
            }
        });
        dwr.engine.setAsync(true);
    }

    function cityChange() {
        var cityid = document.getElementById("RegionRemainQueryForm:cityCode").value;
        var aLevel = document.getElementById("RegionRemainQueryForm:aLevel").value;
        var regionId = document.getElementById("RegionRemainQueryForm:regionId");
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
        var cityid = document.getElementById("RegionRemainQueryForm:cityCode").value;
        var aLevel = document.getElementById("RegionRemainQueryForm:aLevel").value;
        var regionId = document.getElementById("RegionRemainQueryForm:regionId");
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

    /*删除select控件中所有的options*/
    function removeAllOptions() {
        var region = document.getElementById("RegionRemainQueryForm:regionId");
        var length = region.options.length;
        if (length > 0) {
            for (var i = 0; i < length; i++) {
                region.removeChild(region.options[region.options.length - 1]);
            }
        }
    }

    function toSearchTypeChange() {
        var prefix = ["y", "q", "m"];
        searchTypeChange(prefix);
    }
    /**
     * 设置查询方式
     * @param prefixs
     * @return
     */
    function searchTypeChange(prefixs) {
        var searchType = document.getElementById("RegionRemainQueryForm:searchtype").value;
        if (searchType == "") {
            searchType = "0";
        }
        var flag;
        for (var i = 0; i < prefixs.length; i++) {
            searchType == prefixs[i] ? flag = "" : flag = "none";
            document.getElementById(prefixs[i] + "Search").style.display = flag;
        }
    }


    //--------------------界面操作 end ------------------------

</script>