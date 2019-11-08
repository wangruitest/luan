<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<script>
	var chooseBusinessBack=null;

	function chooseBusiness(callBack){
		chooseBusinessBack=callBack;
		$('#business_manager_frame').attr('src','../business/Business_Manager.jsp?unid=F5E40454532A43BBAB8399EB1900E31F&type=3');
		$('#choose_business_window').window('open');
	}
	
	function chooseBusinessWindowOK(){
		
		if(null!=chooseBusinessBack){
			
			var rows=window.business_manager_frame.getSelectedRows();
			if (rows.length<=0) {
				showMsg("请先选择商户!");
				return;
			}
			if(rows.length>1){
				showMsg("只能选择一家商户");
				return;
			}
			chooseBusinessBack(rows);
			closeChooseBusinessWindow();
		}
	}

	function closeChooseBusinessWindow(){
		$('#business_manager_frame').attr('src','');
		$('#choose_business_window').window('close');
	}
</script>
<div id="choose_business_window" class="easyui-window" title="选择商户" data-options="iconCls:'icon-save',closed:true,modal:true,collapsible:false,minimizable:false,top:50" style="width:900px;height:360px;padding:0px;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center'" style="padding:0px;">
				<iframe id="business_manager_frame" src='' style="width:100%;height: 100%;margin: 0;padding: 0;border: 0;" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes"></iframe>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:2px 0 0;">
				
				<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="javascript:chooseBusinessWindowOK()">确定</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="javascript:closeChooseBusinessWindow()">取消</a>
			</div>
		</div>
</div>
