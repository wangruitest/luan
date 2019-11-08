<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	request.setAttribute("home", request.getContextPath());
%>
<script type='text/javascript' src='${home}/dwr/interface/SysRoleAction.js'></script>
<script type='text/javascript' src='${home}/dwr/interface/SysOperatorAction.js'></script>
<script>
	/**
	 * 通用选择框：选择系统人员、系统角色
	 * 调用方式：
	 * 1.先在需要调用的页面中引入本页面
	 * 2.js调用 commonSelect(options,selectUsersBack);
	                参数说明：
	     (1)options={
		        type: 数据类型---必填，其中  01-选择人员,02-选择角色
	       		title: 窗口标题---默认:'通用选择框',
	   		    width: 窗口宽度---默认:700,
	   		    height: 窗口高度---默认:700,
	   		    shadow: 窗口阴影---默认:true,
	   		    modal: 窗口模态---默认:true,
	   		    selectedData:[{已选对象1},{已选对象2}],已经选择的对象，显示在已选区
	       }
	     (2)selectUsersBack:为回调函数，接收选择完的数据对象列表，如：
	     	function selectUsersBack(result){
	 		}
	     	其中result为对象列表，对象格式为：
	     	obj={
	     		unid:'标识',
	     		name:'文字'
	     	}
	 */
	 
	var commonSelectWin=null;
	$(function(){
	});
	
	function commonSelect(options,callback){
		if(!checkOptions(options)){
			showMsg("调用[通用选择框]时，输入参数不对！请参考详细说明！");
			return;
		}
		if(null==callback){
			showMsg("无回调函数！无法打开[通用选择框]！");
			return;
		}
		//创建编辑对话框
		$('#commonSelectWin').removeAttr('style');
		commonSelectWin=$('#commonSelectWin').dialog({
			title: options.title || '通用选择框',
		    width: options.width || 700,
		    height: options.height || 350,
		    shadow: options.shadow || true,
		    modal: options.modal || true,
			buttons:[{
				text:'确定',
				iconCls:'icon-ok',
				handler:function(){
					callback(getSelectedData());
					$('#commonSelectWin').dialog('close');
				}
			},{
				text:'取消',
				handler:function(){
					$('#commonSelectWin').dialog('close');
				}
			}],
			closed:false
		});
		
		//绑定按钮事件
		initBtnEvent();
		
		//加载数据
		loadCommonSelectData(options);
	}
	
	function checkOptions(options){
		if(null==options)return false;
		if(null==options.type)return false;
		return true;
	}
	
	function initBtnEvent(){
		$("#common_toSelect").dblclick(commonSelectItemAdd);
		$("#common_selected").dblclick(commonSelectItemDel);
		$("#common_select_add").click(commonSelectItemAdd);
		$("#common_select_del").click(commonSelectItemDel);
		$("#common_select_add_all").click(commonSelectItemAddAll);
		$("#common_select_del_all").click(commonSelectItemDelAll);
	}
	
	function commonSelectItemAdd(){
		var value=$("#common_toSelect").find("option:selected").val();
		var text=$("#common_toSelect").find("option:selected").text();
		if(null==value || null==text)return;
		$("#common_toSelect").find("option:selected").remove();
		$("#common_selected").append("<option value='"+value+"'>"+text+"</option>");   
	}
	function commonSelectItemDel(){
		var value=$("#common_selected").find("option:selected").val();
		var text=$("#common_selected").find("option:selected").text();
		if(null==value || null==text)return;
		$("#common_selected").find("option:selected").remove();   
		$("#common_toSelect").append("<option value='"+value+"'>"+text+"</option>");  
	}
	function commonSelectItemAddAll(){
		$("#common_toSelect option").each(function(){
			var value=$(this).val();
			var text=$(this).text();
			$("#common_selected").append("<option value='"+value+"'>"+text+"</option>");   
		});
		$("#common_toSelect").empty();
	}
	function commonSelectItemDelAll(){
		$("#common_selected option").each(function(){
			var value=$(this).val();
			var text=$(this).text();
			$("#common_toSelect").append("<option value='"+value+"'>"+text+"</option>");   
		});
		$("#common_selected").empty();
	}
	
	function getSelectedData(){
		var result=new Array();
		$("#common_selected option").each(function(){
			var item={
				userId:$(this).val(),
				operatorname:$(this).text()
			};
			result.push(item);
		});
		return result;
	}
	
	function loadCommonSelectData(options){
		$("#common_selected").empty();
		$("#common_toSelect").empty();
		//处理旧数据
		var selectedUnids="";
		$(options.selectedData).each(function(index,obj){
			selectedUnids+=obj.userId+";";
			var value=obj.userId;
			var text=obj.operatorname;
			$("#common_selected").append("<option value='"+value+"'>"+text+"</option>");  
		});
		
		//加载系统用户
		if(options.type=="01"){
			SysOperatorAction.getAllSysOperator(function(result){
				if(result.resultCode=="0"){
					$(result.returnList).each(function(index,obj){
						var value=obj.unid;
						var text=obj.name;
						if(selectedUnids.indexOf(value+";")<0){
							$("#common_toSelect").append("<option value='"+value+"'>"+text+"</option>");  
						}
					});
				}else{
					showMsg("加载列表数据时出错，可能原因为：\n"+result.resultMessage);
				}
			});
		}else if(options.type=="02"){//加载系统角色
			SysRoleAction.getSysRoleList(null,function(result){
				if(result.resultCode=="0"){
					$(result.returnList).each(function(index,obj){
						var value=obj.unid;
						var text=obj.name;
						if(selectedUnids.indexOf(value+";")<0){
							$("#common_toSelect").append("<option value='"+value+"'>"+text+"</option>");  
						}
					});
				}else{
					showMsg("加载列表数据时出错，可能原因为：\n"+result.resultMessage);
				}
			});
		}
	}
</script>
<div id="commonSelectWin" style="display: none">
	<table style="width: 100%;height: 90%;table-layout: fixed;">
		<tr>
			<td valign="top" style="width: 40%;height: 100%">
				待选列表：<br/>
				<select size="15" style="width: 100%;height: 95%" id="common_toSelect">
				</select>
			</td>
			<td valign="middle" style="width: 10%;height: 100%" align="center">
				<input type="button" value="添加" id="common_select_add"/><br/><br/>
				<input type="button" value="删除" id="common_select_del"/><br/><br/>
				<input type="button" value="添加全部" id="common_select_add_all"/><br/><br/>
				<input type="button" value="删除全部" id="common_select_del_all"/><br/><br/>
			</td>
			<td valign="top" style="width: 40%;height: 100%">
				已选列表：<br/>
				<select size="15" style="width: 100%;height: 95%" id="common_selected">
				</select>
			</td>
			
		</tr>
	</table>
</div>
