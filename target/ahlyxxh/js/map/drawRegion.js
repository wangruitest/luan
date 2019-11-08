
var drawRegion = { // 景区绘制功能类，依赖map.js
    regionInfo : null, // 初始的景区信息
    endRegionPolygon : null,// 修改后的景区信息
    centerMarker : null,// 景区中心店标记
    aPoint : [], // 地图上点的集合
    beginMarker : null, // 景区多边形起始点标记
    regionPolygon : null, // 景区多边形
    config : {
        cellMarkerOptions : { // 基站标记的option
            //icon : new FMap.FIcon("../../js/map/images/cell.png", 13, 16),
            offset : new FMap.FPixel(-6, -16),
            visible : true,
            draggable : false
        },
        beginMarkerOptions : { // 景区起始点标记的option
            id : "centerB",
            position : {},
            icon : new FMap.FIcon("../../js/map/images/beginMarker.png", 23, 32),
            offset : new FMap.FPixel(-13, -32),
            visible : true,
            draggable : false
        },
        centerMarkerOptions : { // 景区中心标记的option
            id : "centerM",
            position : {},
            icon : new FMap.FIcon("../../js/map/images/centerMarker.png", 23,
                    32),
            offset : new FMap.FPixel(-13, -32),
            visible : true,
            draggable : false
        },
        polygonOptions : { // 景区区域的option
            id : "gon",
            path : [],
            strokeColor : '#FF0000',
            strokeOpacity : 0.3,
            strokeWeight : 1,
            fillColor : '#FF0000',
            fillOpacity : 0.3,
            strokeStyle : "solid"
        }
    },
    divTitle : {
        beginRegionCenter : '定位中心',
        endRegionCenter : '结束定位',
        beginRegionDesign : '绘制景区',
        delRegionPoint : '删除一点',
        reRegionDesign : '重新绘制',
        endRegionDesign : '结束绘制'
    },
    addCenterMarker : function(regionInfo) {

    },
    addRegionPolygon : function(regionInfo) {

    },
    initRegion : function(regionInfo) { // 点击景区信息时在地图上展示该景区的范围及中心位置
        mapObj.map.clearOverlays();
        drawRegion.regionInfo = regionInfo;

        mapObj.map.clearbind("default");

        // 展示景区范围
        if (drawRegion.regionInfo.aRegionCoords != null) {
            if (drawRegion.regionInfo.aRegionCoords.length > 2) {
                var path = [];
                for ( var i in drawRegion.regionInfo.aRegionCoords) {
                    path.push(new FMap.FLngLat(
                            drawRegion.regionInfo.aRegionCoords[i].lng,
                            drawRegion.regionInfo.aRegionCoords[i].lat));
                }
                drawRegion.config.polygonOptions.path = path;
                drawRegion.regionPolygon = new FMap.FPolygon(
                        drawRegion.config.polygonOptions);
                mapObj.map.addOverlays(drawRegion.regionPolygon);
            } else {
                drawRegion.regionPolygon = null;
            }
        } else {
            drawRegion.regionPolygon = null;
        }
        // 展示景区中心
        if (drawRegion.regionInfo.lat != null) {
            drawRegion.config.centerMarkerOptions.position = new FMap.FLngLat(
                    drawRegion.regionInfo.lng, drawRegion.regionInfo.lat);
            drawRegion.centerMarker = new FMap.FMarker(
                    drawRegion.config.centerMarkerOptions);
            drawRegion.centerMarker.icon.image = "../../js/map/images/centerMarker.png";
            mapObj.map.addOverlays(drawRegion.centerMarker);
            mapObj.core.setCenter(
                    drawRegion.config.centerMarkerOptions.position, 13);
        } else {
            drawRegion.centerMarker = null;
            mapObj.core.setCenter(
                    mapObj.config.aCenterPoint[mapObj.curCityCode], 13);
        }
        drawRegion.initDiv();
    },
    initDiv : function() {// 对地图工具控件进行初始化
        mapObj.toolHandle.clearToolsArray();
        // 新增“显示基站”按钮
        var showCellTool = mapObj.toolHandle.addTool("显示基站");
        showCellTool.onclick = drawRegion.showCell;
        // 新增“定位中心”按钮
        var beginMarkCenterTool = mapObj.toolHandle
                .addTool(drawRegion.divTitle.beginRegionCenter);
        beginMarkCenterTool.onclick = drawRegion.beginMarkCenter;
        // 新增“绘制景区”按钮
        var beginMarkPolygonTool = mapObj.toolHandle
                .addTool(drawRegion.divTitle.beginRegionDesign);
        beginMarkPolygonTool.onclick = drawRegion.beginMarkPolygon;

    },
    beginMarkCenter : function() {// 点击“开始定位”按钮
        mapObj.toolHandle.clearToolsArray();

        // 新增“结束定位”按钮
        var endMarkCenterTool = mapObj.toolHandle
                .addTool(drawRegion.divTitle.endRegionCenter);
        endMarkCenterTool.onclick = drawRegion.endMarkCenter;
        // 绑定地图点击操作
        if (drawRegion.regionPolygon != null) {
            mapObj.map.bind(drawRegion.regionPolygon, 'click',
                    drawRegion.markCenter);
        } else {
            mapObj.map.bind(mapObj.map, 'click', drawRegion.markCenter);
        }

        if (drawRegion.centerMarker == null) {
            mapObj.map.removeOverlays(drawRegion.config.centerMarkerOptions.id);
            drawRegion.centerMarker = null;
        }
        drawRegion.clearCell();
    },
    markCenter : function(e) {// 定位景区中心点的逻辑
        if (drawRegion.centerMarker == null) {
            drawRegion.config.centerMarkerOptions.position = e.lnglat;
            drawRegion.centerMarker = new FMap.FMarker(
                    drawRegion.config.centerMarkerOptions);
            drawRegion.centerMarker.icon.image = "../../js/map/images/centerMarker.png";
            mapObj.map.addOverlays(drawRegion.centerMarker);
        } else {
            drawRegion.centerMarker.setPosition(e.lnglat);
        }
    },
    endMarkCenter : function() { // 点击“结束定位”按钮
        if (drawRegion.centerMarker == null) {
            if (!confirm('尚未定位景区中心，是否确定结束定位？')) {
                return;
            }
        } else { // 中心点存在的情况，提示是否保存
            if (confirm('是否保存中心点？')) {
                drawRegion.regionInfo.lat = drawRegion.centerMarker
                        .getPosition().lat;
                drawRegion.regionInfo.lng = drawRegion.centerMarker
                        .getPosition().lng;
                uptRegionLatLng(drawRegion.regionInfo);
            }
        }
        drawRegion.initRegion(drawRegion.regionInfo);
    },
    beginMarkPolygon : function() { // 点击“绘制景区”按钮
        mapObj.toolHandle.clearToolsArray();
        // 新增“删除一点”按钮
        var delPointTool = mapObj.toolHandle
                .addTool(drawRegion.divTitle.delRegionPoint);
        delPointTool.onclick = drawRegion.delPoint;
        // 新增“重新绘制”按钮
        var rePolygonTool = mapObj.toolHandle
                .addTool(drawRegion.divTitle.reRegionDesign);
        rePolygonTool.onclick = drawRegion.rePolygon;
        // 新增“结束绘制”按钮
        var endPolygonTool = mapObj.toolHandle
                .addTool(drawRegion.divTitle.endRegionDesign);
        endPolygonTool.onclick = drawRegion.endPolygon;
        // 绑定地图点击操作
        mapObj.map.bind(mapObj.map, 'click', drawRegion.addPoint);
        // 如果景区区域信息存在，则清空地图
        drawRegion.aPoint.length = 0;
        drawRegion.regionPolygon = null;
        mapObj.map.removeOverlays(drawRegion.config.polygonOptions.id);
        drawRegion.clearCell();
    },
    addPoint : function(e) { // 开始绘制景区后，点击地图的操作
        if (drawRegion.regionPolygon == null) {
            drawRegion.regionPolygon = new FMap.FPolygon(
                    drawRegion.config.polygonOptions);
            mapObj.map.addOverlays(drawRegion.regionPolygon);
        }
        // 第一点的操作
        if (drawRegion.aPoint.length == 0) {
            drawRegion.config.beginMarkerOptions.position = e.lnglat;
            drawRegion.beginMarker = new FMap.FMarker(
                    drawRegion.config.beginMarkerOptions);
            drawRegion.beginMarker.icon.image = "../../js/map/images/beginMarker.png";
            mapObj.map.addOverlays(drawRegion.beginMarker);
        }
        // 其他点的操作
        drawRegion.aPoint.push(e.lnglat);
        drawRegion.regionPolygon.setPath(drawRegion.aPoint);
    },
    delPoint : function() { // 点击“删除一点”按钮的操作
        if (drawRegion.aPoint.length == 0) {
            alert('当前没有已绘制的点');
            return;
        }
        if (drawRegion.aPoint.length == 1) {
            mapObj.map.removeOverlays(drawRegion.config.beginMarkerOptions.id);
            drawRegion.beginMarker = null;
        }
        drawRegion.aPoint.pop();
        drawRegion.regionPolygon.setPath(drawRegion.aPoint);
    },
    rePolygon : function() { // 点击“重新绘制”按钮的操作
        if (drawRegion.beginMarker != null) {
            mapObj.map.removeOverlays(drawRegion.config.beginMarkerOptions.id);
            drawRegion.beginMarker = null;
        }

        if (drawRegion.regionPolygon != null) {
            mapObj.map.removeOverlays(drawRegion.config.polygonOptions.id);
            drawRegion.regionPolygon = null;

        }
        drawRegion.aPoint.length = 0;
    },
    endPolygon : function() { // 点击“结束绘制”按钮的操作
        if (drawRegion.aPoint.length < 3) {// 没有绘制点小于3个时的操作
            if (!confirm('当前绘制点不足3个，是否确定结束绘制？')) {
                return;
            }
        } else {
            if (confirm('是否保存绘制信息？')) {
                drawRegion.regionInfo.aRegionCoords.length = 0;
                for ( var i = 0; i < drawRegion.aPoint.length; i++) {
                    drawRegion.regionInfo.aRegionCoords.push({
                        id : 0,
                        regionId : drawRegion.regionInfo.regionId,
                        coordsIndex : i + 1,
                        lat : drawRegion.aPoint[i].lat,
                        lng : drawRegion.aPoint[i].lng
                    });
                }
                uptRegionCoords(drawRegion.regionInfo);
            }
        }
        drawRegion.initRegion(drawRegion.regionInfo);
    },
    showCell : function() {
        $(this).find("div").attr("title", "隐藏基站");
        $(this).find("div").html("隐藏基站");
        this.onclick = drawRegion.hidCell;
        if(drawRegion.regionInfo.aCellCfg) {
            for(var i in drawRegion.regionInfo.aCellCfg) {
                var m = document.createElement("div");
                m.className = "cell";
                var n = document.createElement("span");
                n.innerHTML = drawRegion.regionInfo.aCellCfg[i].cellname;
                m.appendChild(n);
                var cellMarker = new FMap.FMarker($.extend(drawRegion.config.cellMarkerOptions, {
                    position : new FMap.FLngLat(drawRegion.regionInfo.aCellCfg[i].longitude, drawRegion.regionInfo.aCellCfg[i].latitude),
                    id : drawRegion.regionInfo.aCellCfg[i].id,
                    content : m
                }));
                //cellMarker.icon.image = "../../js/map/images/cell.png";
                mapObj.map.addOverlays(cellMarker);
            }
        }
    },
    hidCell : function() {
        $(this).find("div").attr("title", "显示基站");
        $(this).find("div").html("显示基站");
        this.onclick = drawRegion.showCell;
        drawRegion.clearCell();
    },
    clearCell : function() {
        if(drawRegion.regionInfo.aCellCfg) {
            for(var i in drawRegion.regionInfo.aCellCfg) {
                mapObj.map.removeOverlays(drawRegion.regionInfo.aCellCfg[i].id);
            }
        }
    }
};