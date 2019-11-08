var drawMap = {
    curCityCode : mapcitycode, // 当前地市区号
    map : {},// 地图对象
    aPoint : [], // 地图上点的集合
    beginMarker : null, // 景区多边形起始点标记
    config : {
        mapDiv : 'mapDiv', // 地图DIV
        mapToolDiv : 'mapToolDiv', // 地图控件DIV
        mapOptions : { // 地图配置
            center : new FMap.FLngLat(118.623306, 24.914152),
            zooms : [ 4, 18 ],
            level : 13
        },
        beginMarkerOptions : { // 景区起始点标记的option
            id : "",
            position : {},
            icon : new FMap.FIcon("../../js/map/images/beginMarker.png", 23, 32),
            offset : new FMap.FPixel(-13, -32),
            visible : true,
            draggable : false
        },
        polygonOptions : { // 景区区域的option
            id : "",
            path : [],
            strokeColor : '#FF0000',
            strokeOpacity : 0.3,
            strokeWeight : 1,
            fillColor : '#FF0000',
            fillOpacity : 0.3,
            strokeStyle : "solid"
        },
        aCenterPoint : {// 各地市的市中心位置
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
        }
    },
    markersArray : [], // 地图图层数组，当新增或删除图层时对其进行新增或删除操作
    toolHandle : { // 地图工具
        toolDiv : {},// 地图控件DIV
        toolsArray : [], // 地图控件数组，当新增或删除控件时对其进行新增或删除操作
        newTool : function(title) { // 创建新控件时调用
            var toolControlDiv = document.createElement('DIV');
            toolControlDiv.style.padding = '5px';
            var toolTextDiv = document.createElement('DIV');
            toolTextDiv.style.borderColor = '#36648B';
            toolTextDiv.style.backgroundColor = 'white';
            toolTextDiv.style.borderStyle = 'solid';
            toolTextDiv.style.borderWidth = '2px';
            toolTextDiv.style.width = '60px';
            toolTextDiv.style.height = '18px';
            toolTextDiv.style.lineHeight = '18px';
            toolTextDiv.style.cursor = 'pointer';
            toolTextDiv.style.textAlign = 'center';
            toolTextDiv.style.fontSize = '12px';
            toolTextDiv.title = title;
            toolTextDiv.style.fontFamily = 'Arial,sans-serif';
            toolTextDiv.style.fontSize = '12px';
            toolTextDiv.style.paddingLeft = '4px';
            toolTextDiv.style.paddingRight = '4px';
            toolTextDiv.innerHTML = title;
            toolControlDiv.appendChild(toolTextDiv);
            return toolControlDiv;
        },
        addTool : function(title) { // 增加一个新控件
            var tool = drawMap.toolHandle.newTool(title);
            this.toolsArray.push(tool);
            this.toolDiv.appendChild(tool);
            return tool;
        },
        clearToolsArray : function() {// 删除"重置地图"(即第一个控件)以外的所有控件
            if (this.toolsArray) {
                for ( var i = 1; i < drawMap.toolHandle.toolsArray.length; i++) {
                    this.toolDiv.removeChild(drawMap.toolHandle.toolsArray[i]);
                }
                this.toolsArray.splice(0,
                        drawMap.toolHandle.toolsArray.length - 1);
            }

        },

        drawPolygon : { // 区域绘制操作
            tabIndex : 0, // 当前准备新增的tab编号
            markersArray : [], // 起始点标记的集合
            polygon : null, // 当前绘制的多边形
            polygonsArray : [], // 多边形集合
            initUI : function() {
                drawMap.toolHandle.clearToolsArray();
                // 初始化并隐藏多边形
                drawMap.aPoint.length = 0;

                drawMap.toolHandle.addTool("开始选择").onclick = function() {
                    drawMap.toolHandle.drawPolygon.startChoose();
                };
            },
            startChoose : function() {
                if (jq('#tt').tabs('tabs').length >= 15) {
                    alert('最多只允许选择15个区域');
                    return;
                }
                drawMap.toolHandle.drawPolygon.tabIndex = getTabIndex();
                // 删除原有按钮
                drawMap.toolHandle.clearToolsArray();
                // 创建 删除一点 控件
                drawMap.toolHandle.addTool("删除一点").onclick = function() {
                    drawMap.toolHandle.drawPolygon.delLastPoint();
                };
                // 创建 结束选择 控件
                drawMap.toolHandle.addTool("结束选择").onclick = function() {
                    drawMap.toolHandle.drawPolygon.endChoose();
                };
                drawMap.map.bind(drawMap.map, 'click',
                        drawMap.toolHandle.drawPolygon.addPoint);

                // drawMap.toolHandle.drawPolygon.polygon
                                                                // = null;
                // drawMap.map.removeOverlays(drawMap.config.polygonOptions.id);
            },
            addPoint : function(e) { // 开始选择后，点击地图的操作
                if (drawMap.toolHandle.drawPolygon.polygon == null) {
                    drawMap.config.polygonOptions.id = 'gon'
                            + drawMap.toolHandle.drawPolygon.tabIndex;
                    drawMap.toolHandle.drawPolygon.polygon = new FMap.FPolygon(
                            drawMap.config.polygonOptions);
                    drawMap.map
                            .addOverlays(drawMap.toolHandle.drawPolygon.polygon);
                }
                // 第一点的操作
                if (drawMap.aPoint.length == 0) {
                    drawMap.config.beginMarkerOptions.position = e.lnglat;
                    drawMap.config.beginMarkerOptions.id = '区域-'
                            + drawMap.toolHandle.drawPolygon.tabIndex;
                    drawMap.beginMarker = new FMap.FMarker(
                            drawMap.beginMarker = new FMap.FMarker(
                                    drawMap.config.beginMarkerOptions));
                    drawMap.map.addOverlays(drawMap.beginMarker);
                }
                // 其他点的操作
                drawMap.aPoint.push(e.lnglat);
                drawMap.toolHandle.drawPolygon.polygon.setPath(drawMap.aPoint);
            },
            delLastPoint : function() {
                if (drawMap.aPoint.length == 0) {
                    alert('当前没有已绘制的点');
                    return;
                }
                if (drawMap.aPoint.length == 1) {
                    drawMap.map
                            .removeOverlays(drawMap.config.beginMarkerOptions.id);
                    drawMap.beginMarker = null;
                }
                drawMap.aPoint.pop();
                drawMap.toolHandle.drawPolygon.polygon.setPath(drawMap.aPoint);
            },
            endChoose : function() {
                if (!confirm('确定结束选择？')) {
                    return;
                }
                if (drawMap.aPoint.length < 3) {
                    alert('数据点小于3');
                    return;
                }
                var marker = drawMap.beginMarker;
                drawMap.map.bind(marker, 'click', function() {
                    drawMap.toolHandle.drawPolygon.delTab(marker);
                });
                drawMap.toolHandle.drawPolygon.markersArray
                        .push(drawMap.beginMarker);
                drawMap.beginMarker = null;
                drawMap.toolHandle.drawPolygon.polygonsArray
                        .push(drawMap.toolHandle.drawPolygon.polygon);
                drawMap.toolHandle.drawPolygon.polygon = null;
                drawMap.map.unbind(drawMap.map, 'click',
                        drawMap.toolHandle.drawPolygon.addPoint);
                addTab(drawMap.toolHandle.drawPolygon.tabIndex, drawMap.aPoint);
                drawMap.toolHandle.drawPolygon.initUI();
            },
            delTab : function(marker) {
                delTab(marker.id);
            },
            removePolygon : function(title) {
                var delIndex = 0;
                for ( var i in drawMap.toolHandle.drawPolygon.markersArray) {
                    if (drawMap.toolHandle.drawPolygon.markersArray[i].id == title) {
                        delIndex = i;
                        break;
                    }
                }
                // drawMap.toolHandle.drawPolygon.markersArray.pop(drawMap.toolHandle.drawPolygon.markersArray[i]);
                // drawMap.toolHandle.drawPolygon.polygonsArray.pop(drawMap.toolHandle.drawPolygon.polygonsArray[i]);
                // drawMap.map.removeOverlays(drawMap.config.beginMarkerOptions.id);
                // drawMap.map.removeOverlays(drawMap.config.polygonOptions.id);

                drawMap.map
                        .removeOverlays(drawMap.toolHandle.drawPolygon.polygonsArray[delIndex].id);
                drawMap.map
                        .removeOverlays(drawMap.toolHandle.drawPolygon.markersArray[delIndex].id);
                drawMap.toolHandle.drawPolygon.markersArray.splice(delIndex, 1);
                drawMap.toolHandle.drawPolygon.polygonsArray
                        .splice(delIndex, 1);

            },
            drawSelectedPolygons : function() {
            }
        }
    },
    core : { // 地图核心操作
        init : function() { // 地图初始化操作
            drawMap.config.mapOptions.center = drawMap.config.aCenterPoint[drawMap.curCityCode];
            drawMap.map = new FMap.FMap(drawMap.config.mapDiv,
                    drawMap.config.mapOptions);
            drawMap.toolHandle.toolDiv = document
                    .getElementById(drawMap.config.mapToolDiv);
            drawMap.toolHandle.addTool("重置地图").onclick = function() {
                drawMap.core.setCenter(
                        drawMap.config.aCenterPoint[drawMap.curCityCode], 13);
            };
            drawMap.toolHandle.drawPolygon.initUI();
            drawMap.core.setCenter(
                    drawMap.config.aCenterPoint[drawMap.curCityCode], 13);
        },
        setCenter : function(lnglat, zoom) {
            if (typeof zoom != "undefined") {
                drawMap.map.setZoom(zoom);
            }
            drawMap.map.setCenter(lnglat);
        }
    }
};