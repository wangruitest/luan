<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" %>
<script type="text/javascript">
	Function.prototype.method = function(name, func) {
	  this.prototype[name] = func;
	  return this;
	};
	if(!String.prototype.trim){ //判断下浏览器是否自带有trim()方法
	String.method('trim', function() {
	return this.replace(/^\s+|\s+$/g, '');
	});
	String.method('ltrim', function() {
	return this.replace(/^\s+/g, '');
	});
	String.method('rtrim', function() {
	return this.replace(/\s+$/g, '');
	});
	}


    var queryFormCach = null;
    var treeSelectCach = null;
    $(function () {

        //创建列表
        $("#RegionAlarmLevelList").datagrid({
            title: '景区预警阀值管理',
            idField: 'id',
            rownumbers:true,
            singleSelect : false,
            pagination : true,
            height : getViewportHeight()-50,
            pageSize: 20,
            fitColumns : true,
            frozenColumns: [[
                {field: 'ck', checkbox: true}
            ]],
            columns: [[
                {field: 'id', title:'编号', hidden:true},
                {field: 'regionName', title: '景区名称', width: 100},
                {field: 'level1Num', title: '红色预警(人数)', width: 100},
                {field: 'level2Num', title: '橙色预警(人数)', width: 100},
                {field: 'level3Num', title: '黄色预警(人数)', width: 100},
                {field: 'level4Num', title: '蓝色预警(人数)', width: 100},
                {field: 'editTime', title: '更新时间', width: 100,formatter:function(date){
                    return date==null?'':date.pattern("yyyy-MM-dd HH:mm:ss");
                }},
                {field: 'currentLevelName', title: '当前预警级别',align:'center', width: 100,styler:function(value,row,index){
                    if (value == '红色预警'){
                        return 'background-color:red;color:#fff;';
                    }else if(value =='橙色预警'){
                        return 'background-color:#FF9900;color:#fff;';
                    }else if(value =='黄色预警'){
                        return 'background-color:#FFFF77;color:#222222;';
                    }else if(value =='蓝色预警'){
                        return 'background-color:#0099FF;color:#fff;';
                    }}},
                {field: 'currentLevel', title: '预警级别',hidden:true},
                {field: 'codeGenerator', title: 'codeGenerator', width: 0, hidden: true}
            ]],
            toolbar: [{
                text: '添加',
                iconCls: 'icon-add',
                handler: RegionAlarmLevelAdd
            }, {
                text: '修改',
                iconCls: 'icon-edit',
                handler: RegionAlarmLevelEdit
            }, {
                text: '删除',
                iconCls: 'icon-remove',
                handler: RegionAlarmLevelDel
            }],
            onDblClickRow: RegionAlarmLevelEdit
        });

        //创建编辑对话框
        $('#RegionAlarmLevelDialog').dialog({
            title: '新增景区预警信息',
            modal: true,
            buttons: [{
                text: '确定',
                iconCls: 'icon-ok',
                handler: function () {

                }
            }, {
                text: '取消',
                handler: function () {
                    $('#RegionAlarmLevelDialog').dialog('close');
                }
            }],
            closed: true
        });

        //初始化表单元素
        initForm();

    });//结束初始化函数

    //--------------------初始化和公用方法 start ------------------------
    function initForm() {
        $("#btn_query").click(query);
        $("#btn_reset").click(reset);
        query();
    }

    //查询
    function query() {
        $('#RegionAlarmLevelList').datagrid('unselectAll');
        var queryObj = {
            regionName: $("#RegionAlarmLevelQueryForm\\:regionName").val(),
            currentLevel: $("#RegionAlarmLevelQueryForm\\:currentLevel").val(),
            codeGenerator: 'codeGenerator'
        };
        treeSelectCach = null;
        queryFormCach = queryObj;

        reLoadGridData(queryObj);
    }

    function reset() {
        $("#RegionAlarmLevelQueryForm\\:regionName").val('');
        $("#RegionAlarmLevelQueryForm\\:currentLevel").val('');
    }

    //加载表格数据
    function loadData(data) {
        $('#RegionAlarmLevelList').datagrid('unselectAll');
        if (data != null && data.length > 0) {
            $('#RegionAlarmLevelList').datagrid({loadFilter:pagerFilter}).datagrid('loadData', {total:data.length,rows:data}).datagrid('getPager').pagination('select',1);

            //$('#RegionAlarmLevelList').datagrid('loadData', {total: data.length, rows: data});
        } else {
            $('#RegionAlarmLevelList').datagrid('loadData', {total: 0, rows: []});
        }
    }


    function getFormObj() {
        var obj = $("#RegionAlarmLevelForm").getJSON().RegionAlarmLevelForm;
        return obj;
    }

    function reLoadGridData(queryObj) {
        RegionAlarmLevelAction.getRegionAlarmLevelList(queryObj, function (result) {
            if (result.resultCode == "0") {
                loadData(result.returnList);
            } else {
                showMsg("加载景区预警列表数据时出错，可能原因为：\n" + result.resultMessage);
            }
        });
    }


    //--------------------初始化和公用方法 start ------------------------
    //--------------------界面操作 start ------------------------

    function RegionAlarmLevelAdd() {
        $('#RegionAlarmLevelForm').clear();

        $('#RegionAlarmLevelDialog').dialog({
            title: '新增景区预警阀值',
            modal: true,
            buttons: [{
                text: '确定',
                iconCls: 'icon-ok',
                handler: RegionAlarmLevelCreate
            }, {
                text: '取消',
                handler: function () {
                    $('#RegionAlarmLevelDialog').dialog('close');
                }
            }],
            closed: false
        });
        initRegionsSelect();
    }

    function validAlarmLevel(){
        var level1Num = $('#RegionAlarmLevelForm\\:level1Num').val();
        var level2Num = $('#RegionAlarmLevelForm\\:level2Num').val();
        var level3Num = $('#RegionAlarmLevelForm\\:level3Num').val();
        var level4Num = $('#RegionAlarmLevelForm\\:level4Num').val();
        if(parseInt(level1Num)<=parseInt(level2Num)){
            showMsg("红色预警人数必须大于橙色预警人数");
            return false;
        }
        if(parseInt(level2Num)<=parseInt(level3Num)){
            showMsg("橙色预警人数必须大于黄色预警人数");
            return false;
        }
        if(parseInt(level3Num)<=parseInt(level4Num)){
            showMsg("黄色预警人数必须大于蓝色预警人数");
            return false;
        }
        return true;
    }

    function RegionAlarmLevelCreate() {
        var obj = getFormObj();
        if (!jQuery.form("#RegionAlarmLevelForm").validate())return;
        if(!validAlarmLevel()) return;
        RegionAlarmLevelAction.createRegionAlarmLevel(obj, function (result) {
            if (result.resultCode == "0") {
                $('#RegionAlarmLevelDialog').dialog('close');
                var queryObj = treeSelectCach == null ? queryFormCach : treeSelectCach;
                reLoadGridData(queryObj);
            } else {
                showMsg("创建景区预警时出错，可能原因为：\n" + result.resultMessage);
            }
        });
    }

    function RegionAlarmLevelEdit(index, rowData) {
        var rows = new Array();
        if (null != rowData) {
            rows.push(rowData);
        } else {
            rows = $('#RegionAlarmLevelList').datagrid('getSelections');
        }
        if (rows.length <= 0) {
            showMsg("请先选择需要修改的景区!");
            return;
        }
        if (rows.length > 1) {
            showMsg("不能同时修改多个景区!");
            return;
        }
        initRegionsSelect();
        //初始化数据
        $("#RegionAlarmLevelForm").setJSON({RegionAlarmLevelForm: rows[0]});

        $('#RegionAlarmLevelDialog').dialog({
            title: '修改景区预警阀值',
            modal: true,
            buttons: [{
                text: '确定',
                iconCls: 'icon-ok',
                handler: RegionAlarmLevelUpdate
            }, {
                text: '取消',
                handler: function () {
                    $('#RegionAlarmLevelDialog').dialog('close');
                }
            }],
            closed: false
        });
    }

    function RegionAlarmLevelUpdate() {
        var obj = getFormObj();
        if (!jQuery.form("#RegionAlarmLevelForm").validate())return;
        if(!validAlarmLevel()) return;
        RegionAlarmLevelAction.updateRegionAlarmLevel(obj, function (result) {
            if (result.resultCode == "0") {
                $('#RegionAlarmLevelDialog').dialog('close');
                var queryObj = treeSelectCach == null ? queryFormCach : treeSelectCach;
                reLoadGridData(queryObj);
            } else {
                showMsg("更新景区预警阀值时出错，可能原因为：\n" + result.resultMessage);
            }
        });
    }

    function initRegionsSelect(){
        DWREngine.setAsync(false);
        RegionAlarmLevelAction.queryRegions(function(result){
            if (result.resultCode == "0") {
                var data = result.returnList;
                var html = '';
                for(var i=0;i<data.length;i++){
                    html += '<option value='+data[i].regionId+'>'+data[i].regionName+'</option>';
                }
                $('#RegionAlarmLevelForm\\:regionId').html(html);
            } else {
                showMsg("加载景区列表时出错，可能原因为：\n" + result.resultMessage);
            }
        });
        DWREngine.setAsync(true);
    }

    function RegionAlarmLevelDel() {
        var rows = $('#RegionAlarmLevelList').datagrid('getSelections');
        if (rows.length <= 0) {
            showMsg("请先选择需要删除的景区!");
            return;
        }
        confirmMsg('确认需要删除这些景区阀值吗?', function (isdel) {
            if (isdel) {
                var objs = new Array();
                for (var i = 0; i < rows.length; i++) {
                    objs.push({id: rows[i].id});
                }
                RegionAlarmLevelAction.batchDeleteRegionAlarmLevel(objs, function (result) {
                    if (result.resultCode == "0") {
                        var queryObj = treeSelectCach == null ? queryFormCach : treeSelectCach;
                        reLoadGridData(queryObj);
                    } else {
                        showMsg("删除景区预警阀值时出错，可能原因为：\n" + result.resultMessage);
                    }
                });
            }
        });
    }

    //--------------------界面操作 end ------------------------

</script>