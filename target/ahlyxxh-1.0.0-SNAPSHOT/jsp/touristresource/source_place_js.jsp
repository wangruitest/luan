<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<script type="text/javascript">
	var data = null;
	var datas = [];
	var total = 0;
	$(function(){
		//初始化表单元素
		initForm();
		
	});//结束初始化函数

//--------------------初始化和公用方法 start ------------------------
	function initForm(){
		var obj = {
				region : 10,//显示的条数
				guide : 0 //是否显示其他（1：为显示，其他为不显示，默认为显示）
		};
		
		TouristResourceAction.getSourcePlace(obj,function(result){
			data = result;
			var jsonobj=eval('('+data+')'); 
			total = jsonobj.total;
			var datavalue = jsonobj.datavalue;
			var dataobj = eval(datavalue); 
			for(var i=0;i<dataobj.length;i++){ 
				datas.push(dataobj[i]); 
			} 
			alert("dataobj = " + datas);
			//setTimeout('aa()',5000); 
		});
		
		}

</script>