
var rb = {
	aRegionInfo : [],
	infoWindow : null,
	config : {
		aPolygonColor : ['#7CFF00', '#FFFF00', '#FF0000'], //景区颜色：绿、黄、红
		polygonOptions : { //景区区域的option
			id:"",
 			path:[],
 			strokeColor:[], 
 			strokeOpacity:0.5,
			gonWeight:1,
			fillColor:[],
			fillOpacity:0.5,
			strokeStyle:"solid"
		},
		infoWindowOptions : {
			content : "",
			offset : new FMap.FPixel(-60,-120),
			size : new FMap.FSize(200 ,100)
		}
	},
	initAllRegion : function(aRegionInfo) { //初始化显示所有的景区信息
		rb.aRegionInfo = aRegionInfo;
		for(var i in rb.aRegionInfo) {
			rb.showRegion(rb.aRegionInfo[i], i);
		}
	},
	centerRegion : function(regionId) { //居中显示景区信息
		var index = 0;
		for(var i in aRegionInfo) {
			if(aRegionInfo[i].regionId == regionId) {
				index = i;
				break;
			}
		}
		rb.showInfoWindow(aRegionInfo[index]);
	},
	showRegion : function(regionInfo, id) { //显示景区信息
		if(regionInfo.aRegionCoords.length == 0) {
			return;
		}
		var path = [];
		for(var i in regionInfo.aRegionCoords) {
			path.push(new FMap.FLngLat(regionInfo.aRegionCoords[i].lng, regionInfo.aRegionCoords[i].lat));
		}
		rb.config.polygonOptions.id = "gon" + id;
		rb.config.polygonOptions.path = path;
		rb.config.polygonOptions.strokeColor = rb.config.aPolygonColor[regionInfo.colorIndex];
		rb.config.polygonOptions.fillColor = rb.config.aPolygonColor[regionInfo.colorIndex];
		mapObj.map.addOverlays(new FMap.FPolygon(rb.config.polygonOptions));
	},
	showInfoWindow : function(regionInfo) {
		var content = regionInfo.regionName + "人数统计<hr/><div style='font-size:12px'>" +
			"入园人数：" + regionInfo.inNum + "<br/>" +
			"出园人数：" + regionInfo.outNum + "<br/>" +
			"在园人数：" + regionInfo.atNum + "<br/>";
		var lnglat = {};
		if(regionInfo.lat != null) {
			lnglat = new FMap.FLngLat(regionInfo.lng, regionInfo.lat);
		} else {
			lnglat = mapObj.config.aCenterPoint[mapObj.curCityCode];
			content += "<font color='red'><b>注：</b>景区尚未绘制，位置可能有误。<br/></font>";
		}
		if(rb.infoWindow == null) {
			rb.config.infoWindowOptions.content = content; 
			rb.infoWindow = new FMap.FInfoWindow(rb.config.infoWindowOptions);
		} else {
			rb.infoWindow.setContent(content);
		}
		mapObj.core.setCenter(lnglat, 13);
		rb.infoWindow.open(mapObj.map, lnglat);
	}
	
};