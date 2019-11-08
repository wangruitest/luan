<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<script type="text/javascript">
	var queryFormCach=null;
	var treeSelectCach=null;
	$(function(){
		//初始化表单元素
		initForm();
		
	});//结束初始化函数

//--------------------初始化和公用方法 start ------------------------
	function initForm(){
		$("#btn_editor").click(TouristResourceEdit);
		
		if(type == 1){
			var tr = document.getElementById("editor_tr");
			tr.style.display = "none";
		}
		
		var id = "1";
		TouristResourceAction.getTouristResourceById(id,function(result){
			if(result.resultCode=="0"){
				$("#TouristResourceViewForm").setJSON({TouristResourceViewForm:result.returnObject});
			}else{
				showMsg("加载数据时出错，可能原因为：\n"+result.resultMessage);
			}
		});
	}
	
//--------------------初始化和公用方法 start ------------------------
//--------------------界面操作 start ------------------------
	
	function getFormObj(){
		var obj = $("#TouristResourceForm").getJSON().TouristResourceForm;
		return obj;
	}
	
	function TouristResourceEdit(){
		var resourcediv = document.getElementById("TouristResourceDialog");
		resourcediv.style.display = "";
		var id = "1";
		TouristResourceAction.getTouristResourceById(id,function(result){
			if(result.resultCode=="0"){
				$("#TouristResourceForm").setJSON({TouristResourceForm:result.returnObject});
			}else{
				showMsg("加载数据时出错，可能原因为：\n"+result.resultMessage);
			}
		});
		$('#TouristResourceDialog').dialog({
			title:'修改旅游资源',
			modal:true,
			buttons:[{
				text:'确定',
				iconCls:'icon-ok',
				handler:TouristResourceUpdate
			},{
				text:'取消',
				handler:function(){
					$('#TouristResourceDialog').dialog('close');
				}
			}],
			closed:false
		});
	}
	
	function TouristResourceUpdate(){
		var obj=getFormObj();
		if(!jQuery.form("#TouristResourceForm").validate())return;
		
		TouristResourceAction.updateTouristResource(obj,function(result){
			if(result.resultCode=="0"){
				$('#TouristResourceDialog').dialog('close');
				showMsg("修改成功");
				initForm();
			}else{
				showMsg("更新旅游资源时出错，可能原因为：\n"+result.resultMessage);
			}
		});
	}
	
	
//--------------------界面操作 end ------------------------

</script>