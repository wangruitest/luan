 var width = document.documentElement.clientWidth-100;
 var height= document.documentElement.clientHeight-100;
 
 var areaCodes="";
 var areaCount=0; 

$(function() {
		$("#gridbox").datagrid({
			singleSelect: true,
			pagination: false,
			width:1104,
			height:330,
			fitColumns: true,
			frozenColumns:[[
			                {field:'ck',checkbox:false}
						]],
			columns:[[
				{field:'PROVINCES',title:'地区名称',width:100},
				{field:'TOURISTCOUNT',title:'游客数量',width:100},
				{field:'TIME',title:'统计时间',width:100}
			]]
		});
	 	var isDialogLoad=0;
		$( "#dialog-form" ).dialog({
			autoOpen: false,
			closed:true,
			height: 350,
			width : 550,
			modal : true,
			resizeable: false,
			maxHeight:300,
			buttons: {
				"确定": function() {
					areaCodes="";
					$.each($(":checkbox:checked"),function(i,content){
						areaCount = i+1;
						areaCodes = areaCodes + ",'" + content.id +"'";
					});
					if(areaCount==0){
						alert("请选择要显示的景区！");
						return;
					}else{
						areaCodes = areaCodes.substring(1);
					}
					if(areaCount>9){
						alert("对不起，选择景区的个数不能超过9个！");
						return;
					}
					$( this ).dialog( {closed:true} );
				},
				"取消": function() {
					$( this ).dialog( {closed:true} );
				}
			}
		});
		
		$( "#set" ).click(function() {
				$( "#dialog-form" ).dialog({closed:true} );
				if(isDialogLoad==0){
					//从数据库获取地区数据
					dwr.engine.setAsync(false);
					var str;
					ReportDwrUtil.getAllProvinces(function(data){str = data;});
					dwr.engine.setAsync(true);
					//获取多选框
					getProvinceList(str);	
					isDialogLoad = 1;
				}
		});
		
		//获取省份列表
		function getProvinceList(str){
			var areaCodesArr = str.split(",");
			for(var i=0;i<areaCodesArr.length/15-1;i++){
				var newRow ="<tr>";
				for(var j=0;j<15;j++){
					newRow = newRow+ "<td><a href='#'><p id='"+areaCodesArr[i*15+j]+"' onclick='getCityByProvince(this);'>"+areaCodesArr[i*15+j]+"</p></a></td>";
				}
				var newRow = newRow+"</tr>";
				$('#province_tb').append(newRow);
			}
			if(areaCodesArr.length%15!=0){
				var newRow = "<tr>";
				for(var i=0;i<areaCodesArr.length%10;i++){
					var tdCnt = areaCodesArr[Math.floor(areaCodesArr.length/15)*15+i];
					newRow = newRow + "<td><a href='#'><p id='"+tdCnt+"' onclick='getCityByProvince(this);'>"+tdCnt+"</p></a></td>"
				}
				$('#province_tb').append(newRow);
			}
		}
		
		$("#tabs").tabs({fit:true});
		//initloginerCityList();
	});
 
	 function getCityByProvince(province){
			//从数据库获取地区数据
			dwr.engine.setAsync(false);
			var str;
			ReportDwrUtil.getCityByProvince(province.id,function(data){str = data;});
			dwr.engine.setAsync(true);
			getCityCheckBox(str,province.id);
		}

	function getCityCheckBox(str,province){
		//判断该div是否存在
		var isExist = document.getElementById(province+"c");
		if(isExist==null){
			var cityArr = str.split(",");
			var citys = document.getElementById("dialog-form");
			var provinceDiv = document.createElement("div");
			provinceDiv.className = "province_title";
			provinceDiv.innerHTML = province;
			provinceDiv.id = province+"c";
			citys.appendChild(provinceDiv);
			var cityDiv = document.createElement("div");
			cityDiv.className = "city";
			var string="";
			var k=0;
			for(var i=0;i<cityArr.length;i=i+2){
				string= string+ cityArr[i]+"<input type='checkbox' id='"+cityArr[i+1]+"' value='"+cityArr[i]+"'/>";
				if(++k==9){
					string = string+"<br/>";
					k=0;
				}
			}
			cityDiv.innerHTML = string;
			citys.appendChild(cityDiv);	
		}else{
			isExist = null;
		}
	}