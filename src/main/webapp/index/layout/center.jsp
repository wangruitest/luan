<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<script type="text/javascript">
	$(function() {
		$('#layout_center_tabsMenu').menu({
			onClick : function(item) {
				var curTabTitle = $(this).data('tabTitle');
				var type = $(item.target).attr('type');

				if (type === 'refresh') {
					layout_center_refreshTab(curTabTitle);
					return;
				}

				if (type === 'close') {
					var t = $('#layout_center_tabs').tabs('getTab', curTabTitle);
					if (t.panel('options').closable) {
						$('#layout_center_tabs').tabs('close', curTabTitle);
					}
					return;
				}

				var allTabs = $('#layout_center_tabs').tabs('tabs');
				var closeTabsTitle = [];

				$.each(allTabs, function() {
					var opt = $(this).panel('options');
					if (opt.closable && opt.title != curTabTitle && type === 'closeOther') {
						closeTabsTitle.push(opt.title);
					} else if (opt.closable && type === 'closeAll') {
						closeTabsTitle.push(opt.title);
					}
				});

				for ( var i = 0; i < closeTabsTitle.length; i++) {
					$('#layout_center_tabs').tabs('close', closeTabsTitle[i]);
				}
			}
		});
		//加载不同商户的内容
		loadLogo();
		
		$('#layout_center_tabs').tabs({
			fit : true,
			border : false,
			onContextMenu : function(e, title) {
				e.preventDefault();
				$('#layout_center_tabsMenu').menu('show', {
					left : e.pageX,
					top : e.pageY
				}).data('tabTitle', title);
			},
			tools : [ {
				iconCls : 'icon-reload',
				handler : function() {
					var href = $('#layout_center_tabs').tabs('getSelected').panel('options').href;
					if (href) {/*说明tab是以href方式引入的目标页面*/
						var index = $('#layout_center_tabs').tabs('getTabIndex', $('#layout_center_tabs').tabs('getSelected'));
						$('#layout_center_tabs').tabs('getTab', index).panel('refresh');
					} else {/*说明tab是以content方式引入的目标页面*/
						var panel = $('#layout_center_tabs').tabs('getSelected').panel('panel');
						var frame = panel.find('iframe');
						try {
							if (frame.length > 0) {
								for ( var i = 0; i < frame.length; i++) {
									frame[i].contentWindow.document.write('');
									frame[i].contentWindow.close();
									frame[i].src = frame[i].src;
								}
								if ($.browser.msie) {
									CollectGarbage();
								}
							}
						} catch (e) {
						}
					}
				}
			}, {
				iconCls : 'icon-cancel',
				handler : function() {
					var index = $('#layout_center_tabs').tabs('getTabIndex', $('#layout_center_tabs').tabs('getSelected'));
					var tab = $('#layout_center_tabs').tabs('getTab', index);
					if (tab.panel('options').closable) {
						$('#layout_center_tabs').tabs('close', index);
					} else {
						$.messager.alert('提示', '[' + tab.panel('options').title + ']不可以被关闭', 'error');
					}
				}
			} ]
		});
	
	});

	function layout_center_refreshTab(title) {
		$('#layout_center_tabs').tabs('getTab', title).panel('refresh');
	}

	function layout_center_addTabFun(opts) {
		if(!opts.content){
			var height = document.documentElement.clientHeight-138;
			var href="<%=request.getContextPath() %>"+opts.href;
			var content="<iframe align=\"center\" style=\"width:100%;height:"+height+"px;\" frameborder=\"0\" id=\"module\" name=\"module\" scrolling=\"auto\" src=\""+href+"\"></iframe>";
			opts.href="";
			opts.content=content;
		}
		
		var t = $('#layout_center_tabs');
		if (t.tabs('exists', opts.title)) {
			t.tabs('select', opts.title);
		} else {
			t.tabs('add', opts);
		}
	}
	
	function loadLogo(){
		DWREngine.setAsync(false);
		var normalHomePage="";
		 WebLogoCfgAction.getWebLogoCfg(function(data){
		    	if(data.returnList == null || data.returnList.length<=0){
		    		normalHomePage="index/homepage/normal.jsp";
		    		$("#top_logo").attr("src","../images/newLogin/top_05.jpg");	
		    	} else{
		    		var logoCfg =data.returnList[0];
		    		if(logoCfg.ext2=="1"){
		    		normalHomePage="index/homepage/normal.jsp";
		    		$("#top_logo").attr("src","../images/newLogin/top_05.jpg");	
		        	}else if(logoCfg.ext3=="341722"){
		        		normalHomePage="index/homepage/shitainormal.jsp";
		    			$("#top_logo").attr("src","../images/newLogin/top_05_3.jpg");	
		        	}else{
		    		normalHomePage="index/homepage/luannormal.jsp";
		    		$("#top_logo").attr("src","../images/newLogin/top_05_2.jpg");	
		        	}
		    	}
		    	
		    });
		//加载商户配置
		UtilsAction.getBusinessFromUser(function(data){
			if(null!=data){
				
				$.cookie('userType','bussiness', { path: '/', expires: 1 });
				if(null!=data.logoSrc && data.logoSrc!=""){
					$("#top_logo").attr("src","../"+data.logoSrc);
				}
			}
		});
		if(null!=roleHomepageUrl && roleHomepageUrl!="" && roleHomepageUrl!="null"){
			normalHomePage=roleHomepageUrl;
		}
		normalHomePage=normalHomePage.replaceAll("\\\\", "\/");
		//加载首页内容：
		var homePageHtml="<div title=\"首页\" data-options=\"href:'../"+normalHomePage+"'\"></div>";
		$("#layout_center_tabs").append(homePageHtml);
		DWREngine.setAsync(true);
	}
	
</script>
<div id="layout_center_tabs" style="overflow: hidden;">
	 
	 <!--
	<div title="首页" data-options="href:'homepage/normal.jsp'"></div>
	<div title="首页" data-options="href:'layout/portal.jsp'"></div>
	-->
</div>
<div id="layout_center_tabsMenu" style="width: 120px;display:none;height:180px;">
<!-- <div type="refresh">刷新</div>-->
	<div class="menu-sep"></div>
	<div type="close">关闭</div>
	<div type="closeOther">关闭其他</div>
	<div type="closeAll">关闭所有</div>
</div>