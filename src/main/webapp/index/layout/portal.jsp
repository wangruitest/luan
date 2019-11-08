<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript" charset="utf-8">
var content1="<iframe align=\"center\" style=\"width:100%;height:458px;\" frameborder=\"0\" id=\"module\" name=\"module\" scrolling=\"no\" src=\"";
var content2="\"></iframe>";
	$(function() {
		panels = [ ];

		 $('#layout_portal_portal').portal({
			border : false,
			fit : true,
			onStateChange : function() {
				$.cookie('portal-state', getPortalState(), {
					expires : 7
				});
			}
		});
		var state = $.cookie('portal-state');
		if (!state) {
			state = 'p1,p2,p3:p4,p5,p6';/*冒号代表列，逗号代表行*/
		}
		addPortalPanels(state);
		$('#layout_portal_portal').portal('resize');

		
		$("#dataList").datagrid({
			idField:'unid',
			singleSelect: false,
			pagination: false,
			height:'auto',
			//width:'auto',
			fit:true,
			fitColumns: true,
			columns:[[
				{field:'col1',title:'列一',width:100},
				{field:'col2',title:'列二',width:100},
				{field:'col3',title:'列三',width:100},
				{field:'col4',title:'列四',width:100}
			]]
		});
		var data=[];
		for(var i=0;i<8;i++){
			data.push({col1:'11111',col2:'22222',col3:'33333',col4:'44444'});
		}
		$('#dataList').datagrid('loadData', {total:data.length,rows:data});
	});

	function getPanelOptions(id) {
		for ( var i = 0; i < panels.length; i++) {
			if (panels[i].id == id) {
				return panels[i];
			}
		}
		return undefined;
	}
	function getPortalState() {
		var aa=[];
		for(var columnIndex=0;columnIndex<2;columnIndex++) {
			var cc=[];
			var panels=$('#layout_portal_portal').portal('getPanels',columnIndex);
			for(var i=0;i<panels.length;i++) {
				cc.push(panels[i].attr('id'));
			}
			aa.push(cc.join(','));
		}
		return aa.join(':');
	}
	function addPortalPanels(portalState) {
		var columns = portalState.split(':');
		for (var columnIndex = 0; columnIndex < columns.length; columnIndex++) {
			var cc = columns[columnIndex].split(',');
			for (var j = 0; j < cc.length; j++) {
				var options = getPanelOptions(cc[j]);
				if (options) {
					var p = $('<div/>').attr('id', options.id).appendTo('body');
					p.panel(options);
					$('#layout_portal_portal').portal('add', {
						panel : p,
						columnIndex : columnIndex
					});
				}
			}
		}
	}
</script>
<div id="layout_portal_portal" style="position:relative">
	<div></div>
	<div></div>
</div>