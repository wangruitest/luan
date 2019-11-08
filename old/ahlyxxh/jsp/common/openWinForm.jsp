<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	request.setAttribute("home", request.getContextPath());
 %>
 <!-- 
 	用于打开较大表单页面使用：
 	调用openWinForm方法，传入相关参数信息：
 	options={
 		title:'标题',//可选，默认显示：'通用表单窗口'
 		toolbar:[
 			{text:'按钮一',iconCls:'icon-add',handler:btn1Fun,handlerType:1},
 			{text:'按钮二',iconCls:'icon-ok',handler:'btn2Fun',handlerType:2}
 			],
 			//可选，按钮集。handlerType为1时执行打开页事件（直接方法），为2时执行被打开页事件（间接方法）
 		width:200,//可选，默认900
 		height:300,//可选，默认580
 		formUrl:'jsp/test/test.jsp?unid=0',//必填，从jsp级开始
 		otherParams:{item1:1,item2:'a'},//可选，url的其它参数
 		onBeforeClose:onBeforeCloseFun,//可选，关闭窗口时调用的事件
 		isShowClose:true   //可选，是否显示关闭窗口按钮，默认显示
 	}
 	//调用
 	top.openWinForm(options);
  -->
<script>
	var winFormOptions={};
	
	function openWinForm(options){
		winFormOptions=options;
		
		//构造表单url
		var optionsUrl="";
		var formUrl="";
		if(null!=options.otherParams){
			for(items in options.otherParams){
				var str="optionsUrl+='&'+items+'='+options.otherParams."+items;
				eval(str);
			}
		}
		if(options.formUrl.indexOf("?")>0){
			formUrl=options.formUrl+optionsUrl;
		}else{
			formUrl=options.formUrl+"?1=1"+optionsUrl;
		}
		$('#open_form_frame').attr('src','../'+formUrl);
		
		//窗口参数
		$('#open_form_window').window({
			onBeforeClose:winFormExit,
            title:options.title || '表单窗口',
            width:options.width || 900,
            height:options.height || 580,
            top:($(window).height() - (options.height || 580)) * 0.5,    
            left:($(window).width() - (options.width || 900)) * 0.5 
	    });
		
		//设置窗口操作按钮集
		$('#winFormToolBar').html("");
		if(null!=options.toolbar){
			for(var i=0;i<options.toolbar.length;i++){
				var btnOption=options.toolbar[i];
				var btnFunStr="btnFunParentExcute("+i+")";
				if(null!=btnOption.handlerType && btnOption.handlerType==2){
					btnFunStr="btnFunFrameExcute("+i+")";
				}
				var btnHtml="<a class=\"easyui-linkbutton\" data-options=\"iconCls:'"+btnOption.iconCls+"'\" href=\"javascript:void(0)\" onclick=\"javascript:"+btnFunStr+"\">"+btnOption.text+"</a>";
				$('#winFormToolBar').append(btnHtml);
			}
		}
		if(null==options.isShowClose || options.isShowClose){
			var closeBtnHtml="<a class=\"easyui-linkbutton\" data-options=\"iconCls:'icon-cancel'\" href=\"javascript:void(0)\" onclick=\"javascript:winFormClose()\">退出</a>";
			$('#winFormToolBar').append(closeBtnHtml);
		}
		
		//打开窗口
		$('#open_form_window').window('open');
		$('#winFormToolBar a').linkbutton({iconAlign:'left'});
	}
	
	function winFormExit(){
		if(null!=winFormOptions.onBeforeClose){
			winFormOptions.onBeforeClose();
		}
		$('#open_form_window').window('close',true);
	}
	function winFormClose(){
		$('#open_form_frame').attr('src','');
		$('#open_form_window').window('close');
	}
	
	function btnFunFrameExcute(index){
		if(null!=winFormOptions.toolbar[index].handler){
			var funScript="window.open_form_frame."+winFormOptions.toolbar[index].handler+"()";
			eval(funScript);
		}
	}
	function btnFunParentExcute(index){
		if(null!=winFormOptions.toolbar[index].handler){
			winFormOptions.toolbar[index].handler();
		}
	}
	
</script>
<div id="open_form_window" class="easyui-window" title="通用表单窗口" data-options="iconCls:'exicon-application_form',closed:true,modal:true,collapsible:false,minimizable:false" style="width:900px;height:580px;padding:0px;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center'" style="padding:0px;">
				<iframe id="open_form_frame" src='' style="width:100%;height: 100%;margin: 0;padding: 0;border: 0;" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes"></iframe>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:2px 0 0;" id="winFormToolBar">
			<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="javascript:winFormClose()">退出</a>
			</div>
		</div>
</div>
