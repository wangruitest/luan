var mapObj = {
    curCityCode : mapcitycode, // 当前地市区号
    map : {}, // 地图对象
    config : {
        mapDiv : 'mapDiv', // 地图DIV
        mapToolDiv : 'mapToolDiv', // 地图控件DIV
        mapOptions : { // 地图配置
            center : new FMap.FLngLat(118.623306, 24.914152),
            zooms : [ 4, 18 ],
            level : 13
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
            var tool = mapObj.toolHandle.newTool(title);
            this.toolsArray.push(tool);
            this.toolDiv.appendChild(tool);
            return tool;
        },
        clearToolsArray : function() { // 删除"重置地图"(即第一个控件)以外的所有控件
            if (this.toolsArray) {
                for ( var i = 1; i < mapObj.toolHandle.toolsArray.length; i++) {
                    this.toolDiv.removeChild(mapObj.toolHandle.toolsArray[i]);
                }
                this.toolsArray.splice(0,
                        mapObj.toolHandle.toolsArray.length - 1);
            }
        }
    },
    core : { // 地图核心操作
        init : function() { // 地图初始化操作
            mapObj.config.mapOptions.center = mapObj.config.aCenterPoint[mapObj.curCityCode];
            mapObj.map = new FMap.FMap(mapObj.config.mapDiv,
                    mapObj.config.mapOptions);
            mapObj.toolHandle.toolDiv = document
                    .getElementById(mapObj.config.mapToolDiv);
            mapObj.toolHandle.addTool("重置地图").onclick = function() {
                mapObj.core.setCenter(
                        mapObj.config.aCenterPoint[mapObj.curCityCode], 13);
            };
            if (typeof initAllRegion != "undefined") {
                setTimeout("initAllRegion()", "1000");
            }
            mapObj.core.setCenter(
                    mapObj.config.aCenterPoint[mapObj.curCityCode], 13);
        },
        setCenter : function(lnglat, zoom) {
            if (typeof zoom != "undefined") {
                mapObj.map.setZoom(zoom);
            }
            mapObj.map.setCenter(lnglat);
        }
    }
};