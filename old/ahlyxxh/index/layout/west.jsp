<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<style>
	ul {
		margin: 0px;
		padding: 0px;
		list-style: none;
	}

	.leftMenu ul {
		/* margin-right: 10px;
		margin-left: 5px; */
		background-repeat: no-repeat;
		margin-top: 0px;
		clear: both;
	}

	.leftMenu li {
		/* background: url(<%=request.getContextPath()%>/images/arrowbullet.jpg) no-repeat !important;
		background-position: 5px 12px !important; */
		display: block;
		/* padding-left: 21px; */
		font-size: 18px;
		line-height: 46px;
		cursor: pointer;
	}

	.leftMenu span {
		/* background-image: url(<%=request.getContextPath()%>/images/titlebar_itemBg.jpg); */
		height: 100%;
		width: 160px;
	}

	/* .leftMenu div.selected { */
		/* background: url(<%=request.getContextPath()%>/images/titlebar_itemBg.jpg) no-repeat !important;
		background-position: -6px 8px !important; */
		/* background-color: #DAEEFF;
		width: 100%; */
	/* } */

	.leftMenu div {
		padding-left: 50px;
		background: url(<%=request.getContextPath()%>/images/arrowbullet.png) no-repeat !important;
		background-position: 30px 14px !important;

	}

	.leftMenu li.selected {
		/* background: url(<%=request.getContextPath()%>/images/titlebar_itemBg.jpg) no-repeat !important;
		background-position: -6px 8px !important; */
		background-color: #DAEEFF;
		width: 100%;
	}

	.leftMenu ul li {
		border-bottom: 1px solid #dadada;
	}

	.panel-title {
		height: 48px;
		line-height: 48px;
		font-size: 18px;
		padding-left: 40px;
	}
	.panel-header{
		width:280px;
	}
	.panel-icon{
		left:15px;
	}
</style>
<script>
	/**
	 * 菜单树数据
	 * 示例:
	 [{
	 unid:'module1',
	 title:'模块1',
	 icon:'icon-redo',
	 closable:false,
	 href:'moduleShow.jsp',
	 modules:[{
	 unid:'childModule1',
	 title:'子模块1',
	 icon:'icon-redo',
	 closable:false,
	 href:'moduleShow.jsp'
	 }]
	 }]
	 */
	var menus = new Array();
	var curMenuId = "";

	//加载菜单数据
	DWREngine.setAsync(false);
	SysMenuAction.getSysMenusByCurUser(function (result) {
		if (result.resultCode == "0") {
			loadMenus(result.returnList);
			//为菜单绑定事件
		} else {
			showMsg("加载菜单列表数据时出错，可能原因为：\n" + result.resultMessage);
		}
	});
	DWREngine.setAsync(true);
	menuInit();

	function objToMenuJson(obj) {
		var href = obj.url;
		if (href.indexOf("?") > 0) {
			href += "&unid=" + obj.unid;
		} else {
			href += "?unid=" + obj.unid;
		}
		var menu = {
			unid: obj.unid,
			title: obj.displayName || obj.name,
			icon: obj.menuIcon,
			closable: true,
			href: href
		};

		return menu;
	}

	function loadMenus(menuDatas) {
		//组装数据
		for (var i = 0; i < menuDatas.length; i++) {
			var obj = menuDatas[i];
			if (null == obj.punid) {
				var parentMenu = objToMenuJson(obj);
				var modules = new Array();
				for (var j = 0; j < menuDatas.length; j++) {
					if (menuDatas[j].punid == obj.unid) {
						modules.push(objToMenuJson(menuDatas[j]));
					}
				}

				parentMenu.modules = modules;
				menus.push(parentMenu);
			}
		}
		/**
		$(menuDatas).each(function(index,obj){
			if(null==obj.punid){
				var parentMenu=objToMenuJson(obj);
				var modules=new Array();
				$(menuDatas).each(function(childIndex,childObj){
					if(childObj.punid==obj.unid){
						modules.push(objToMenuJson(childObj));
					}
				});
				parentMenu.modules=modules;
				menus.push(parentMenu);
			}
		});
		 */
		for (var z = 0; z < menus.length; z++) {
			var obj = menus[z];
			var menuHtml = "<div title=\"" + obj.title + "\" data-options=\"iconCls:'" + obj.icon + "'\">";
			menuHtml += "<div class=leftMenu>";
			menuHtml += "<ul>";
			if (null != obj.modules) {
				for (var k = 0; k < obj.modules.length; k++) {
					menuHtml += "<li id='" + obj.modules[k].unid + "'><div>"
						+ obj.modules[k].title + "</div></li>";
				}
			}
			menuHtml += "</ul>";
			menuHtml += "</div>";
			menuHtml += "</div>";
			$("#menuBar").append(menuHtml);
		}
		/*
		for(var z=0;z<menus.length;z++){
			var obj=menus[z];
			var menuHtml="<div class=leftMenu>";
			menuHtml+="<ul>";
			if(null!=obj.modules){
				for(var k=0;k<obj.modules.length;k++){
					menuHtml+="<li id='"+obj.modules[k].unid+"'><div>"+obj.modules[k].title+"</div></li>";
				}
			}
			menuHtml+="</ul>";
			menuHtml+="</div>";
			
			$('#menuBar').accordion('add',{
				title:obj.title,
				content:menuHtml
			});
			
			//$("#menuBar").append(menuHtml);
		}
		//$('#menuBar').accordion({});
		/**
		//解析数据并展示
		$(menus).each(function(){
			var menuHtml="<div title=\""+this.title+"\" data-options=\"iconCls:'"+this.icon+"'\">";
			menuHtml+="<div class=leftMenu>";
			menuHtml+="<ul>";
			if(this.modules){
				$(this.modules).each(function(){
					menuHtml+="<li id='"+this.unid+"'><div>"+this.title+"</div></li>";
				});
			}
			menuHtml+="</ul>";
			menuHtml+="</div>";
			menuHtml+="</div>";
			$("#menuBar").append(menuHtml);
		});
		 */
	}

	function menuInit() {
		$(".leftMenu li").bind("mouseover", function () {
			// $(this).find("div").addClass("selected");
			$(this).addClass("selected");
		});
		$(".leftMenu li").bind("mouseout", function () {
			// console.log($(this).attr("id"),curMenuId);
			if (curMenuId != $(this).attr("id")) {
				// $(this).find("div").removeClass("selected");
				$(this).removeClass("selected");
			}
		});
		$(".leftMenu li").bind("click", function () {
			allUnSelected();
			// $(this).find("div").addClass("selected");
			$(this).addClass("selected");
			curMenuId = $(this).attr("id");
			menuClick(curMenuId);
		});
	}

	function allUnSelected() {
		$(".leftMenu li").each(function () {
			// $(this).find("div").removeClass("selected");
			$(this).removeClass("selected");
		});
	}

	function menuClick(menuId) {
		var currentModule = findModule(menuId);
		if (currentModule) {
			layout_center_addTabFun(currentModule);
		}
		/**
		layout_center_addTabFun({
			tabId:menuId,
			title : "页签标题",
			closable : true,
			iconCls : "icon-redo",
			href : url
		});
		 */
	}

	function findModule(moduleId) {
		var result = null;
		$(menus).each(function () {
			if (this.modules) {
				$(this.modules).each(function () {
					if (this.unid == moduleId) {
						result = this;
					}
				});
			}
		});
		return result;
	}
</script>
<div class="easyui-accordion" data-options="fit:true,border:false" id="menuBar">
	<!-- 
		<div title="XX管理模块1" data-options="iconCls:'icon-redo'">
			 <div class=leftMenu>
			   <ul>
			    <li id="1"><div>待办任务</div></li>
			    <li id="2"><div>在办任务&#160;</div></li>
			    <li id="3"><div>已办任务</div></li>
			    <li id="4"><div>任务查询</div></li>
			   </ul>
			  </div>
		</div>
	 -->
</div>