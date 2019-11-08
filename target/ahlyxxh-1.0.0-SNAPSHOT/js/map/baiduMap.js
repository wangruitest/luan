 var map;
 var trp=null;
 var allP=[];
 var opts={
 			strokeColor:"red",    //边线颜色。
            fillColor:"red",      //填充颜色。当参数为空时，圆形将没有填充效果。
            strokeWeight: 3,       //边线的宽度，以像素为单位。
            strokeOpacity: 0.8,    //边线透明度，取值范围0 - 1。
            fillOpacity: 0.6,      //填充的透明度，取值范围0 - 1。
            strokeStyle: 'solid'
 };
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
        // 0599，南平
        };
		function initMap(){

			  map = new BMap.Map("mapDiv");
			  map.addControl(new BMap.NavigationControl());               // 添加平移缩放控件
			  map.addControl(new BMap.ScaleControl());                    // 添加比例尺控件
			  map.addControl(new BMap.OverviewMapControl());              //添加缩略地图控件
			  map.enableScrollWheelZoom();                            //启用滚轮放大缩小
			//  map.addControl(new BMap.MapTypeControl()); //三维 2D
			  var point = aCenterPoint[mapcitycode];    // 创建点坐标
			  map.centerAndZoom(point,13);  

		}

		function initCenter(rp){
		
			$("#setPoint").attr("style","display:;margin:10px;10px;");
			$("#editPoin").attr("style","display:;margin:10px;10px;");
			$("#savePoint").attr("style","display:none;");
			$("#delPoin").attr("style","display:none");
			$("#endPoin").attr("style","display:none");
			map.setDefaultCursor("hand");
			allP=[];
			trp = rp;
			map.clearOverlays();
			if(trp.aRegionCoords != null){//绘制景区范围
				if(trp.aRegionCoords.length > 2){
					var path = [];
                	for ( var i in trp.aRegionCoords) {
                   	 path.push(new BMap.Point(
                            trp.aRegionCoords[i].lng,
                            trp.aRegionCoords[i].lat));
                	}
				}
			var polygon = new BMap.Polygon(path,opts);
			map.addOverlay(polygon); 
			}else{
			
			}
			if(trp.lat != null){//绘制中心点
				var marker = new BMap.Marker(new BMap.Point(trp.lng, trp.lat));
				map.addOverlay(marker);
			  	map.centerAndZoom(new BMap.Point(trp.lng, trp.lat),16);
			}else{
				var point = aCenterPoint[mapcitycode];    // 创建点坐标
			  	map.centerAndZoom(point,13);  
			}
			map.removeEventListener("click", eventClick);
			map.removeEventListener("click", eventGeionClick);
		}


		function setinit(){
			map.clearOverlays();
			var point = aCenterPoint[mapcitycode];    // 创建点坐标
			map.setDefaultCursor("hand");
			map.centerAndZoom(point,13);
		}
		

		function delRegionPolygon(parm){
		}
		function setCenterPoint(){//绘制中心点
			if(trp == null ){
			 	alert("请选择景点");
			 	return ;
			}
			$("#savePoint").attr("style","display:;margin:10px;10px;");
			$("#setPoint").attr("style","display:none;");
			$("#editPoin").attr("style","display:none");
			map.setDefaultCursor("crosshair");
			map.removeEventListener("click", eventGeionClick);
			map.addEventListener("click", eventClick);
			
		}
		
		function editPoin(){//绘制景区范围
			if(trp == null ){
			 	alert("请选择景点");
			 	return ;
			}
			p=[];
			allP=[];
			$("#delPoin").attr("style","display:;margin:10px;10px;");
			$("#endPoin").attr("style","display:;margin:10px;10px;");
			$("#setPoint").attr("style","display:none;");
			$("#editPoin").attr("style","display:none;");
			map.setDefaultCursor("crosshair");
			map.removeEventListener("click", eventClick);
			map.clearOverlays();
			if(trp.lat != null){//保留中心点
					var marker = new BMap.Marker(new BMap.Point(trp.lng, trp.lat));
					map.addOverlay(marker);
			}
			map.addEventListener("click", eventGeionClick);
			
		}
		
		
		
		function eventClick(e){//中心点事件
			map.clearOverlays();
			var marker = new BMap.Marker(new BMap.Point(e.point.lng, e.point.lat));
			trp.lng=e.point.lng;
			trp.lat=e.point.lat;
			map.addOverlay(marker);
			
			if(trp.aRegionCoords != null){//保留景区范围
				if(trp.aRegionCoords.length > 2){
					var path = [];
                	for ( var i in trp.aRegionCoords) {
                   	 path.push(new BMap.Point(
                            trp.aRegionCoords[i].lng,
                            trp.aRegionCoords[i].lat));
                	}
				}
			var polygon = new BMap.Polygon(path,opts);
			map.addOverlay(polygon); 
			}
			
		}
		
		function eventGeionClick(e){//绘制景区事件
			allP.push(new BMap.Point(e.point.lng, e.point.lat)); //存储曲线上每个点的经纬度
			polygon = new BMap.Polygon(allP,opts);
			if (allP.length < 3) {
				if(allP.length==1){
					var icon = new BMap.Icon('../../images/1.png', new BMap.Size(20, 32), {  
						anchor: new BMap.Size(10, 30)  
					});
					
					var mkr1 =new BMap.Marker(allP[0], {
					icon: icon  
					});
					map.addOverlay(mkr1);
					return;
				}
				var polyline = new BMap.Polyline(allP,{strokeColor:"red", strokeWeight:2, strokeOpacity:0.5});
				map.addOverlay(polyline);
				return;
			}else{
				map.clearOverlays();
			}
			map.addOverlay(polygon); 
			
			
			
			if(trp.lat != null){//保留中心点
					var marker = new BMap.Marker(new BMap.Point(trp.lng, trp.lat));
					map.addOverlay(marker);
			}
		}
		
		
		function endPoin(){//绘制完成
			if (allP.length < 4) {
				alert("绘制地图必须超过3个点!");
				return;
			}
			trp.aRegionCoords.length=0;
			for ( var i = 0; i < allP.length; i++) {
				trp.aRegionCoords.push({
                        id : 0,
                        regionId : trp.regionId,
                        coordsIndex : i + 1,
                        lat : allP[i].lat,
                        lng : allP[i].lng
                    });
			}
			map.setDefaultCursor("hand");
			uptRegionCoords(trp);
		}
		function delPoin(){
			if (allP.length < 4) {
				alert("必须超过3个点才能删除!");
				return;
			}
			map.clearOverlays();
			if(trp.lat != null){//保留中心点
					var marker = new BMap.Marker(new BMap.Point(trp.lng, trp.lat));
					map.addOverlay(marker);
			}
			allP.pop();//删除最后一个点
			polygon = new BMap.Polygon(allP,opts);
			map.addOverlay(polygon); 
		}
		
		function restInit(regionid){
			map.clearOverlays();
			var point = aCenterPoint[mapcitycode];    // 创建点坐标
			map.setDefaultCursor("hand");
			map.centerAndZoom(point,13);
			trp=regionid;
 			allP=[];
 			map.removeEventListener("click", eventClick);
			map.removeEventListener("click", eventGeionClick);
		}
		
		