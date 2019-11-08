 var map;
 var alltrs=[];
 var oldName="全部";
 var zoom=0;
 
 var levels=['正常','蓝色预警','黄色预警','橙色预警','红色预警'];
 var opts=[{
		strokeColor:"green",    //边线颜色。
     fillColor:"green",      //填充颜色。当参数为空时，圆形将没有填充效果。
     strokeWeight: 3,       //边线的宽度，以像素为单位。
     strokeOpacity: 0.8,    //边线透明度，取值范围0 - 1。
     fillOpacity: 0.6,      //填充的透明度，取值范围0 - 1。
     strokeStyle: 'solid'
		},{
          strokeColor:"blue",    //边线颜色。
          fillColor:"blue",      //填充颜色。当参数为空时，圆形将没有填充效果。
          strokeWeight: 3,       //边线的宽度，以像素为单位。
          strokeOpacity: 0.8,    //边线透明度，取值范围0 - 1。
          fillOpacity: 0.6,      //填充的透明度，取值范围0 - 1。
          strokeStyle: 'solid'}
		,{strokeColor:"yellow",    //边线颜色。
     fillColor:"yellow",      //填充颜色。当参数为空时，圆形将没有填充效果。
     strokeWeight: 3,       //边线的宽度，以像素为单位。
     strokeOpacity: 0.8,    //边线透明度，取值范围0 - 1。
     fillOpacity: 0.6,      //填充的透明度，取值范围0 - 1。
     strokeStyle: 'solid'},{
     strokeColor:"orange",    //边线颜色。
     fillColor:"orange",      //填充颜色。当参数为空时，圆形将没有填充效果。
     strokeWeight: 3,       //边线的宽度，以像素为单位。
     strokeOpacity: 0.8,    //边线透明度，取值范围0 - 1。
     fillOpacity: 0.6,      //填充的透明度，取值范围0 - 1。
     strokeStyle: 'solid'},{
         strokeColor:"red",    //边线颜色。
         fillColor:"red",      //填充颜色。当参数为空时，圆形将没有填充效果。
         strokeWeight: 3,       //边线的宽度，以像素为单位。
         strokeOpacity: 0.8,    //边线透明度，取值范围0 - 1。
         fillOpacity: 0.6,      //填充的透明度，取值范围0 - 1。
         strokeStyle: 'solid'}];  
            
       var  aCenterPoint = {// 各地市的市中心位置
    		    340100 : new BMap.Point(117.233592, 31.82672), // 合肥
    	        340200 : new BMap.Point(118.43955, 31.358825), // 芜湖
    	        340300 : new BMap.Point(117.395863, 32.921631), // 蚌埠
    	        340400 : new BMap.Point(116.984596, 32.628679), // 淮南
    	        340500 : new BMap.Point(118.520195, 31.67681), // 马鞍山
    	        340600 : new BMap.Point(116.804647, 33.963341), // 淮北
    	        340700 : new BMap.Point(117.818511, 30.951581), // 铜陵
    	        340800 : new BMap.Point(117.121138, 30.539035), // 安庆
    	        341000 : new BMap.Point(118.343696, 29.720918),//黄山
    			341100 : new BMap.Point(118.33978, 32.261723), // 滁州
    			341200 : new BMap.Point(115.820572, 32.896378), // 阜阳
    			341300 : new BMap.Point(116.970717, 33.652072), // 宿州
    			341500 : new BMap.Point(116.526047, 31.741413), // 六安
    			341600 : new BMap.Point(115.785196, 33.850588), // 亳州
    			341700 : new BMap.Point(117.497834, 30.670997), // 池州
    			341800 : new BMap.Point(118.765648, 30.946564) // 宣城
        };

		function initMap(regions, cityName){
			  
			  map = new BMap.Map("mapDiv");
			  map.addControl(new BMap.NavigationControl());               // 添加平移缩放控件
			  map.addControl(new BMap.ScaleControl());                    // 添加比例尺控件
			  map.addControl(new BMap.OverviewMapControl());              //添加缩略地图控件
			  map.enableScrollWheelZoom();                            //启用滚轮放大缩小
			  //map.addControl(new BMap.MapTypeControl()); 
			 
			  
			  
			  alltrs = aRegionInfo;
			  
			  if(regions.length>0){
			  		
			  		/*for(var i=0 ;i<regions.length ;i++){
			  			dfregion(regions[i]);
			  			addMark(regions[i],null);
			  			//table.append("<tr><td>"+alltrs[i].regionName+"</td><td>"+alltrs[i].cityName+"</td><td>"+alltrs[i].inNum+"</td><td>"+levels[alltrs[i].colorIndex]+"</td></tr>");
			  		}*/
			  		//showOneInfoWiondow(alltrs[0].regionId);
			  		//regionInit(alltrs[0].regionId);
			  }
			  var nowPage=0;
			  //var regions=alltrs;
			  showAllRegionTable(regions,0);
			  var name=cityName=="全部"?"安徽省":cityName;
			  if(name=="安徽省"){
				  zoom=8;
			  }else{
				  zoom=10;
			  }
			  var point = aCenterPoint[mapcitycode];    // 创建点坐标
			  map.centerAndZoom(point,zoom); 
			  /*if(name!=null&&name!=""&&name!="全部"){
				  getBoundary(map,name);
			  }*/
			  
		}
		
		//分页显示景区
		function showAllRegionTable(regions,nowPage){
			var count=5;
			var start=nowPage*count;
			var end=(nowPage*count+count)>regions.length?regions.length:(nowPage*count+count);
			var pages=Math.ceil(regions.length/count);
			var table=$("#regionRealList");
			map.clearOverlays(); 
			oldCityName="";
			nowCityName=nowCityName=="全部"?"安徽省":nowCityName;
			getBoundary(map,nowCityName);
			$("#regionRealList  tr:not(:first)").html("");
			for (var i = start; i < end; i++) {
				dfregion(regions[i]);
	  			addMark(regions[i],null);
	  			table.append("<tr class='nameTD' onclick='showInfo(" + regions[i].regionId + ")'><td >"+regions[i].regionName+"</td><td>"+regions[i].cityId+"</td><td>"+regions[i].atNum+"</td><td>"+levels[regions[i].colorIndex]+"</td></tr>");
				/*if(i%pageCount==0){
		  			table.append("<tr><td colspan='4' class='pageup'><div class='xw_paga'><div class='paginations' name='Pagination' style='padding: 5px 0; float: right; height: 20px;'></div></div></td></tr>");
				}*/
			}
  			//table.append("<tr><td colspan='4' ><div ><div class='paginations' name='Pagination' style='padding: 5px 0; float: right; height: 20px;'></div></div></td></tr>");
			table.append("<tr><td colspan='4' class='pageup'>");
			$("#regionRealList .pageup").append("<div style='padding: 5px 0; float: right; height: 20px;' name='Pagination' class='paginations'>");
			var prev=(nowPage-1)<0?0:(nowPage-1);
			var next=(nowPage+1)>=pages?pages:(nowPage+1);
			$("#regionRealList .pageup .paginations").append("<span class='current prev' > </span>");
			$("#regionRealList .pageup .paginations span").first().click(function(){
				showAllRegionTable(regions,prev);
			});
			for (var i = 0; i < pages; i++) {
				if(i==nowPage){
					//goPage("+alltrs+","+i+")
					//alert(regions);
					$("#regionRealList .pageup .paginations").append("<span class='current' id='span"+i+"'>"+(i+1)+"</span>");
					/*$("#regionRealList .pageup .paginations #span"+i+"").click(function(){
						 showAllRegionTable(regions,i);
					});*/
				}else{
					$("#regionRealList .pageup .paginations").append("<span class='next' id='span"+i+"'>"+(i+1)+"</span>");
					/*$("#regionRealList .pageup .paginations #span"+i+"").click(function(){
						 showAllRegionTable(regions,i);
					});*/
				}
				
			}
			$("#regionRealList .pageup .paginations span").not(":first").each(function(i){
				//alert(i);
				$(this).click(function(){
					showAllRegionTable(regions,i);
				});
			});
			$("#regionRealList .pageup .paginations").append("<span class='current next' > </span>");
			$("#regionRealList .pageup .paginations span").last().click(function(){
				if(next<pages){
					showAllRegionTable(regions,next);
				}
				
			});
			table.append("</td></tr>");
			oldCityName=nowCityName;
		}
		
		
		//绘制行政quyu
		function getBoundary(map,cityName){    
			
			if(oldCityName==nowCityName){
				return;
			}
			//alert(map+"----------------->"+cityName);
			var bdary = new BMap.Boundary();
			bdary.get(cityName, function(rs){       //获取行政区域
				//alert(rs);
				//map.clearOverlays();        //清除地图覆盖物       
				var count = rs.boundaries.length; //行政区域的点有多少个
				if (count === 0) {
					alert('未能获取当前输入行政区域');
					return ;
				}
	          	var pointArray = [];
				for (var i = 0; i < count; i++) {
					var ply = new BMap.Polygon(rs.boundaries[i], {strokeWeight: 2, strokeColor: "blue", 
						strokeOpacity:0.0, fillOpacity: 0.0, fillColor: "none"}); //建立多边形覆盖物
					map.addOverlay(ply);  //添加覆盖物
					pointArray = pointArray.concat(ply.getPath());
				}    
				map.setViewport(pointArray);    //调整视野                 
			});   
		}

		function regionInit(regionId){

			showOneInfoWiondow(regionId);
		
		}
		
		function addMark(regionInfo,info_html){
			
			//var lnglat = {};
			if(regionInfo.lat != null) {
				var lnglat = new BMap.Point(regionInfo.lng, regionInfo.lat);
				var _marker;
				if(regionInfo.colorIndex>=imgIcons.length){
					_marker=new BMap.Marker(lnglat);
				}else{
				var myIcon =new BMap.Icon(imgIcons[regionInfo.colorIndex], new BMap.Size(23, 25), {
										// 指定定位位置。   
										// 当标注显示在地图上时，其所指向的地理位置距离图标左上    
										// 角各偏移10像素和25像素。您可以看到在本例中该位置即是   
										// 图标中央下端的尖角位置。    
										offset : new BMap.Size(0, 0),
									// 设置图片偏移。   
									// 当您需要从一幅较大的图片中截取某部分作为标注图标时，您   
									// 需要指定大图的偏移位置，此做法与css sprites技术类似。    
										imageOffset: new BMap.Size(0,0)   // 设置图片偏移    
									});
							_marker = new BMap.Marker(lnglat, {icon : myIcon});
						}
						map.addOverlay(_marker);
						//		_marker.addEventListener("click", function(e) {
						//            this.openInfoWindow(new BMap.InfoWindow(info_html));  
						//       });
						_marker.addEventListener("onclick", function(e) {
							//this.openInfoWindow(new BMap.InfoWindow(info_html));
							//  this.setTitle("景区:"+regionInfo.regionName);  
							showOneInfoWiondow(regionInfo.regionId);
						});
					}
				}
		
		function showInfoWindow(regionInfo){

			map.clearOverlays();
			var content = regionInfo.regionName + "人数统计<hr/><div style='font-size:12px'>" +
				"入园人数：" + regionInfo.inNum + "<br/>" +
				"出园人数：" + regionInfo.outNum + "<br/>" +
				"在园人数：" + regionInfo.atNum + "<br/>";
			var lnglat = {};
			if(regionInfo.lat != null) {
				lnglat = new BMap.Point(regionInfo.lng, regionInfo.lat);
			} else {
				lnglat = aCenterPoint[mapcitycode];
				content += "<font color='red'><b>注：</b>景区尚未绘制，位置可能有误。<br/></font>";
			}
			var path = [];
			if(regionInfo.aRegionCoords != null){//绘制景区范围
				if(regionInfo.aRegionCoords.length > 2){
                	for ( var i in regionInfo.aRegionCoords) {
                   	 path.push(new BMap.Point(
                            regionInfo.aRegionCoords[i].lng,
                            regionInfo.aRegionCoords[i].lat));
                	}
				}
			var polygon = new BMap.Polygon(path,opts[regionInfo.colorIndex]);
			map.addOverlay(polygon); 
			}
			var infoWindow = new BMap.InfoWindow(content);
			map.openInfoWindow(infoWindow, lnglat);
			map.centerAndZoom(lnglat,zoom);
		}
		
		function dfregion(regionInfo){
			var path = [];
			if(regionInfo.aRegionCoords != null){//绘制景区范围
				if(regionInfo.aRegionCoords.length > 2){
                	for ( var i in regionInfo.aRegionCoords) {
                   	 path.push(new BMap.Point(
                            regionInfo.aRegionCoords[i].lng,
                            regionInfo.aRegionCoords[i].lat));
                	}
				}
			var polygon = new BMap.Polygon(path,opts[regionInfo.colorIndex]);
			map.addOverlay(polygon); 
			}
		}
		
		function showOneInfoWiondow(regionInfoId){
			var index = 0;
			for(var i in alltrs) {
				if(alltrs[i].regionId == regionInfoId) {
					index = i;
					break;
				}
			}
			map.closeInfoWindow();
			var regionInfo = alltrs[index];
			var content = regionInfo.regionName + "人数统计<hr/><div style='font-size:12px'>" +
					"入园人数：" + regionInfo.inNum + "<br/>" +
					"出园人数：" + regionInfo.outNum + "<br/>" +
					"在园人数：" + regionInfo.atNum + "<br/>";
			var lnglat = {};
			if(regionInfo.lat != null) {
				lnglat = new BMap.Point(regionInfo.lng, regionInfo.lat);
			} else {
				lnglat = aCenterPoint[mapcitycode];
				content += "<font color='red'><b>注：</b>景区尚未绘制，位置可能有误。<br/></font>";
			}
			var optes={
				width:250,     // 信息窗口宽度
	  			height:100     // 信息窗口高度
			};
			var infoWindow = new BMap.InfoWindow(content,optes);
			map.openInfoWindow(infoWindow, lnglat);
			map.centerAndZoom(lnglat,zoom);	
		}
		
		//检索返回结果
		function subAllTrs(name,level){
			var nameTrs=new Array();
			var levelTrs=new Array();
			if(name=='-1'||name==-1){
				nameTrs=alltrs;
			}else{
				for (var i = 0; i < alltrs.length; i++) {
					if(alltrs[i].regionId==name){
						nameTrs.push(alltrs[i]);
					}
				}
			}
			if(level=='-1'||level==-1){
				levelTrs=nameTrs;
			}else{
				for (var i = 0; i < nameTrs.length; i++) {
					if(nameTrs[i].colorIndex==level){
						levelTrs.push(nameTrs[i]);
					}
				}
			}
			return levelTrs;
		}
		
		function searchSubmit(){
			//var cityCode=$("#cityList").val();
			var cityName=$("#cityList").find("option:selected").text();
			//reginChangeCity(cityCode,cityName);
			var spotCode=$("#spotsel").val();
			var typeCode=$("#level").val();
			var subRegins=alltrs;
			//var spotName= $("#spotsel").find("option:selected").text();
			//var levelName= $("#level").find("option:selected").text();
			var subs=subAllTrs(spotCode, typeCode);
			showAllRegionTable(subs, 0);
			initMap(subs, cityName);
		}
		
		