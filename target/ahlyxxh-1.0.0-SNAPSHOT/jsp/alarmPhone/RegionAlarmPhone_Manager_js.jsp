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
    var selectedRegions = new Array();
    $(function () {

        //创建列表
        $("#RegionAlarmPhoneList").datagrid({
            title: '景区预警人员配置',
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
                {field: 'id', title: 'ID', width: 100,hidden:true},
                {field: 'name', title: '姓名', width: 100},
                {field: 'phone', title: '手机号码', width: 100},
                {field: 'editTime', title: '创建时间', width: 100,formatter:function(date){
                    return date==null?'':date.pattern("yyyy-MM-dd HH:mm:ss");
                }},
                {field: 'codeGenerator', title: 'codeGenerator', width: 0, hidden: true}
            ]],
            toolbar: [{
                text: '添加',
                iconCls: 'icon-add',
                handler: RegionAlarmPhoneAdd
            }, {
                text: '修改',
                iconCls: 'icon-edit',
                handler: RegionAlarmPhoneEdit
            }, {
                text: '删除',
                iconCls: 'icon-remove',
                handler: RegionAlarmPhoneDel
            }],
            onDblClickRow: RegionAlarmPhoneEdit
        });

        //创建编辑对话框
        $('#RegionAlarmPhoneDialog').dialog({
            title: '新增景区预警人员',
            modal: true,
            buttons: [{
                text: '确定',
                iconCls: 'icon-ok',
                handler: function () {

                }
            }, {
                text: '取消',
                handler: function () {
                    $('#RegionAlarmPhoneDialog').dialog('close');
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
        $("#btn_select_regions").click(selectRegions);
        initRegionsSelect();
        query();
    }
    
    //检索名字，去除字符前和字符后的空格
    function nameCheck(){
    	
			var name=$("#RegionAlarmPhoneQueryForm\\:name").val();
			name=name.replace(/(^\s+)/,'');
			name=name.replace(/(\s+$)/,'');
			return name	
		
    }

    //查询
    function query() {
    	
        $('#RegionAlarmPhoneList').datagrid('unselectAll');
        var queryObj = {
            regionId: $("#RegionAlarmPhoneQueryForm\\:regionId").val(),
            phone: $("#RegionAlarmPhoneQueryForm\\:phone").val(),
            name: nameCheck(),
            codeGenerator: 'codeGenerator'
        };
        treeSelectCach = null;
        queryFormCach = queryObj;

        reLoadGridData(queryObj);
    }

    function reset() {
        $("#RegionAlarmPhoneQueryForm\\:regionId").val('');
        $("#RegionAlarmPhoneQueryForm\\:phone").val('');
        $("#RegionAlarmPhoneQueryForm\\:name").val('');
    }

    //加载表格数据
    function loadData(data) {
        $('#RegionAlarmPhoneList').datagrid('unselectAll');
        if (data != null && data.length > 0) {
            $('#RegionAlarmPhoneList').datagrid({loadFilter:pagerFilter}).datagrid('loadData', {total:data.length,rows:data}).datagrid('getPager').pagination('select',1);
            //$('#RegionAlarmPhoneList').datagrid('loadData', {total: data.length, rows: data});
        } else {
            $('#RegionAlarmPhoneList').datagrid('loadData', {total: 0, rows: []});
        }
    }


    function selectRegions(){
        var option={
            type:'03',
            title:'选择要预警的景区',
            selectedData:selectedRegions
        };
        commonSelect(option,selectRegionsBack);
    }

    function selectRegionsBack(result){
        selectedRegions=result;
        loadSelectedRegions();
    }

    function loadSelectedRegions(){
        var regionNames="",regionIds="";
        $(selectedRegions).each(function(index,obj){
            regionNames+=obj.name+";";
            regionIds+=obj.unid+";";
        });
        $("#RegionAlarmPhoneForm\\:regions").val(regionNames);
    }

    function getFormObj() {
        var obj = $("#RegionAlarmPhoneForm").getJSON().RegionAlarmPhoneForm;
        return obj;
    }

    function reLoadGridData(queryObj) {
        RegionAlarmPhoneAction.getRegionAlarmPhoneList(queryObj, function (result) {
            if (result.resultCode == "0") {
                loadData(result.returnList);
            } else {
                showMsg("加载景区预警人员列表数据时出错，可能原因为：\n" + result.resultMessage);
            }
        });
    }

    function initRegionsSelect(){
        DWREngine.setAsync(false);
        RegionAlarmLevelAction.queryRegions(function(result){
            if (result.resultCode == "0") {
                var data = result.returnList;
                var html = "<option value=''>--请选择--</option>";
                for(var i=0;i<data.length;i++){
                    html += '<option value='+data[i].regionId+'>'+data[i].regionName+'</option>';
                }
                $('#RegionAlarmPhoneQueryForm\\:regionId').html(html);
            } else {
                showMsg("加载景区列表时出错，可能原因为：\n" + result.resultMessage);
            }
        });
        DWREngine.setAsync(true);
    }

    //--------------------初始化和公用方法 start ------------------------
    //--------------------界面操作 start ------------------------

    function RegionAlarmPhoneAdd() {
        $('#RegionAlarmPhoneForm').clear()

        $('#RegionAlarmPhoneDialog').dialog({
            title: '新增景区预警人员',
            modal: true,
            buttons: [{
                text: '确定',
                iconCls: 'icon-ok',
                handler: RegionAlarmPhoneCreate
            }, {
                text: '取消',
                handler: function () {
                    $('#RegionAlarmPhoneDialog').dialog('close');
                }
            }],
            closed: false
        });
    }

    function RegionAlarmPhoneCreate() {
        var obj = getFormObj();
        if (!jQuery.form("#RegionAlarmPhoneForm").validate())return;
        var pattern = new RegExp("[`~!@#$^&*()=|{}':;',\\[\\]\".<>/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？《》]");
        if(pattern.test(obj.name)) {
            showMsg("姓名不能包含非法字符！");
            return;
        }
        obj.regions=selectedRegions;
        RegionAlarmPhoneAction.createRegionAlarmPhone(obj, function (result) {
            if (result.resultCode == "0") {
                $('#RegionAlarmPhoneDialog').dialog('close');
                var queryObj = treeSelectCach == null ? queryFormCach : treeSelectCach;
                reLoadGridData(queryObj)
                selectedRegions = new Array();
            } else {
                showMsg("创建景区预警人员时出错，可能原因为：\n" + result.resultMessage);
            }
        });
    }

    function RegionAlarmPhoneEdit(index, rowData) {
        var rows = new Array();
        if (null != rowData) {
            rows.push(rowData);
        } else {
            rows = $('#RegionAlarmPhoneList').datagrid('getSelections');
        }
        if (rows.length <= 0) {
            showMsg("请先选择需要修改的景区预警人员!");
            return;
        }
        if (rows.length > 1) {
            showMsg("不能同时修改多个景区预警人员!");
            return;
        }
        //初始化数据
        $("#RegionAlarmPhoneForm").setJSON({RegionAlarmPhoneForm: rows[0]});
        selectedRegions=rows[0].regions;
        loadSelectedRegions();
        $('#RegionAlarmPhoneDialog').dialog({
            title: '修改景区预警人员',
            modal: true,
            buttons: [{
                text: '确定',
                iconCls: 'icon-ok',
                handler: RegionAlarmPhoneUpdate
            }, {
                text: '取消',
                handler: function () {
                	selectedRegions = new Array();
                    $('#RegionAlarmPhoneDialog').dialog('close');
                }
            }],
            closed: false
        });
    }

    function RegionAlarmPhoneUpdate() {
        var obj = getFormObj();
        if (!jQuery.form("#RegionAlarmPhoneForm").validate())return;
        var pattern = new RegExp("[`~!@#$^&*()=|{}':;',\\[\\]\".<>/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？《》]");
        if(pattern.test(obj.name)) {
            showMsg("姓名不能包含非法字符！");
            return;
        }
        obj.regions =  selectedRegions;
        RegionAlarmPhoneAction.updateRegionAlarmPhone(obj, function (result) {
            if (result.resultCode == "0") {
                $('#RegionAlarmPhoneDialog').dialog('close');
                var queryObj = treeSelectCach == null ? queryFormCach : treeSelectCach;
                reLoadGridData(queryObj);
                selectedRegions = new Array();
            } else {
                showMsg("更新景区预警人员时出错，可能原因为：\n" + result.resultMessage);
            }
        });
    }

    function RegionAlarmPhoneDel() {
        var rows = $('#RegionAlarmPhoneList').datagrid('getSelections');
        if (rows.length <= 0) {
            showMsg("请先选择需要删除的景区预警人员!");
            return;
        }
        confirmMsg('确认需要删除这些景区预警人员吗?', function (isdel) {
            if (isdel) {
                var objs = new Array();
                for (var i = 0; i < rows.length; i++) {
                    objs.push({id: rows[i].id});
                }
                RegionAlarmPhoneAction.batchDeleteRegionAlarmPhone(objs, function (result) {
                    if (result.resultCode == "0") {
                        var queryObj = treeSelectCach == null ? queryFormCach : treeSelectCach;
                        reLoadGridData(queryObj);
                    } else {
                        showMsg("删除景区预警人员时出错，可能原因为：\n" + result.resultMessage);
                    }
                });
            }
        });
    }

    //--------------------界面操作 end ------------------------

</script>