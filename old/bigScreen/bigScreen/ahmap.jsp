<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="ECharts">
    <meta name="author" content="kener.linfeng@gmail.com">
    <title>昨日本省游客前十城市子页面</title>
    <link href="<%=path %>/css/font-awesome.min.css" rel="stylesheet">
    <link href="<%=path %>/css/bootstrap.css" rel="stylesheet">
    <link href="<%=path %>/css/carousel.css" rel="stylesheet">
    <link href="<%=path %>/css/echartsHome.css" rel="stylesheet">
    <script src="<%=path %>/js/codemirror.js"></script>
    <script src="<%=path %>/js/javascript.js"></script>
    <link href="<%=path %>/css/codemirror.css" rel="stylesheet">
    <link href="<%=path %>/css/monokai.css" rel="stylesheet">
    <style type="text/css">
        body{overflow: hidden;background-color:rgba(30,50,75,0.37);background:none;padding: 0;margin: 0;}
    </style>
</head>
<body>
    <div class="well " style="display: none;">
    	<div class="nav-header"><a href="#" onclick="autoResize()" class="glyphicon glyphicon-resize-full" id ="icon-resize" ></a>option</div>
        <textarea id="code" name="code">
        </textarea>
    </div><!--/.well -->
    <div id="main" class="main" style="height: 530px;background: none;"></div>
    <select id="theme-select" style="display: none;"></select>
    <script src="<%=path %>/js/jquery.min.js"></script>
    <script type="text/javascript">
	//图表在iframe中自适应显示
	var mh=$(".main").height();
	var hh=parent.window.$(".ahmapArea").height();
	$(".main").height(hh);
	
	getAhmapTouristInfor();
	window.setInterval("getAhmapTouristInfor()", 300000); //五分钟执行一次
	function getAhmapTouristInfor(){
		var arrCities = [];//前十城市
		var ayyCitiesNum = [];//前十城市游客数量
		var alltourists = '';//游客总数
		var touristPercent = [];//前十游客数量占比
		
		var longitude='';//城市或区县经度
		var latitude='';//城市或区县纬度
		var simple_name='';//城市名或区县名简称
		var areacode = '';//城市或区县id
		var falg = '';//城市区县标示，0：省，1：市，2：区县
		
		$.ajax({
			url:"<%=path%>/bigScreenCfg/getBigScreenCfg.html",
			async:false,
			dataType:"json",
			success:function(data){
				for ( var i = 0; i < data.length; i++) {
					longitude = data[i].longitude;
					latitude = data[i].latitude;
					simple_name = data[i].simple_name;
					areacode = data[i].areaCode;
					flag = data[i].flag;
					
				}
				// $("#code").html("option = {\n"
	    	// 		    +"color: ['gold','aqua','lime'],\n"
	    	// 		    +"tooltip : {\n"
	    	// 		    +"   show: true,\n"
	    	// 		    +"   trigger: 'item',\n"
	    	// 		    +"   formatter: '{b}'\n"
	    	// 		    +"},\n"
	    	// 		    +"series : [\n"
	    	// 		    +"    {\n"
	    	// 		    +"        name: '安徽',\n"
	    	// 		    +"        type: 'map',\n"
	    	// 		    +"        roam: true,\n"
	    	// 		    +"        hoverable: false,\n"
	    	// 		    +"        mapType: '安徽',\n"
	    	// 		    +"        itemStyle:{\n"
	    	// 		    +"            normal:{\n"
	    	// 		    +"                borderColor:'rgba(100,149,237,1)',\n"
	    	// 		    +"                borderWidth:0.5,\n"
	    	// 		    +"                areaStyle:{\n"
	    	// 		    +"                    color: '#1b1b1b'\n"
	    	// 		    +"                }\n"
	    	// 		    +"            }\n"
	    	// 		    +"        },\n"
	    	// 		    +"        data:[],\n"
	    	// 		    +"        markLine : {\n"
	    	// 		    +"            smooth:true,\n"
	    	// 		    +"            symbol: ['none', 'circle'],\n"
	    	// 		    +"            symbolSize : 1,\n"
	    	// 		    +"            itemStyle : {\n"
	    	// 		    +"                normal: {\n"
	    	// 		    +"                    color:'#fff',\n"
	    	// 		    +"                    borderWidth:1,\n"
	    	// 		    +"                    borderColor:'rgba(30,144,255,0.5)'\n"
	    	// 		    +"                }\n"
	    	// 		    +"            },\n"
	    	// 		    +"            data : [\n"
	    	// 		    +"            ],\n"
	    	// 		    +"        },\n"
	    	// 		    +"        geoCoord: {\n"
	    	// 		    +"            '芜湖':[118.38,31.09],\n"
	    	// 		    +"            '合肥': [117.69,31.6581],\n"
	    	// 		    +"            '安庆': [116.59,30.61],\n"
	    	// 		    +"            '阜阳': [115.65,32.98],\n"
	    	// 		    +"            '亳州': [116.25,33.38],\n"
	    	// 		    +"            '宿州': [117.25,33.88],\n"
	    	// 		    +"            '蚌埠': [117.45,33.08],\n"
	    	// 		    +"            '滁州': [117.95,32.48],\n"
	    	// 		    +"            '淮南': [116.70,32.78],\n"
	    	// 		    +"            '淮北': [116.75,33.68],\n"
	    	// 		    +"            '铜陵': [117.89,30.9581],\n"
	    	// 		    +"            '马鞍山':[118.58,31.59],\n"
	    	// 		    +"            '池州': [117.49,30.33],\n"
	    	// 		    +"            '黄山':[118.28,29.899],\n"
	    	// 		    +"            '宣城':[118.98,30.69],\n"
	    	// 		    +"            '六安':[116.5005646164,31.7470318307],\n"
	    	// 		    +"            '"+simple_name+"': ["+longitude+","+latitude+"],\n"
	    	// 		    +"        }\n"
	    	// 		    +"    },\n"
	    	// 		    +"    {\n"
	    	// 		    +"        name: '安徽 Top10',\n"
	    	// 		    +"        type: 'map',\n"
	    	// 		    +"        mapType: '安徽',\n"
	    	// 		    +"        data:[],\n"
	    	// 		    +"        markLine : {\n"
	    	// 		    +"            smooth:true,\n"
	    	// 		    +"            effect : {\n"
	    	// 		    +"                show: true,\n"
	    	// 		    +"                scaleSize: 1,\n"
	    	// 		    +"                period: 30,\n"
	    	// 		    +"                color: '#fff',\n"
	    	// 		    +"                shadowBlur: 10\n"
	    	// 		    +"            },\n"
	    	// 		    +"            itemStyle : {\n"
	    	// 		    +"                normal: {\n"
	    	// 		    +"                    borderWidth:1,\n"
	    	// 		    +"                    lineStyle: {\n"
	    	// 		    +"                        type: 'solid',\n"
	    	// 		    +"                        shadowBlur: 10\n"
	    	// 		    +"                    }\n"
	    	// 		    +"                }\n"
	    	// 		    +"            },\n"
	    	// 		    +"            data : [\n"
	    	// 		    +"                [{name:'阜阳'}, {name:'"+simple_name+"'}],\n"
	    	// 		    +"                [{name:'安庆'}, {name:'"+simple_name+"'}],\n"
	    	// 		    +"                [{name:'亳州'}, {name:'"+simple_name+"'}],\n"
	    	// 		    +"                [{name:'芜湖'}, {name:'"+simple_name+"'}],\n"
	    	// 		    +"                [{name:'淮北'}, {name:'"+simple_name+"'}],\n"
	    	// 		    +"                [{name:'蚌埠'}, {name:'"+simple_name+"'}],\n"
	    	// 		    +"                [{name:'淮南'}, {name:'"+simple_name+"'}],\n"
	    	// 		    +"                [{name:'滁州'}, {name:'"+simple_name+"'}],\n"
	    	// 		    +"                [{name:'合肥'}, {name:'"+simple_name+"'}],\n"
	    	// 		    +"                [{name:'铜陵'}, {name:'"+simple_name+"'}],\n"
	    	// 		    +"                [{name:'马鞍山'}, {name:'"+simple_name+"'}],\n"
	    	// 		    +"                [{name:'池州'}, {name:'"+simple_name+"'}],\n"
	    	// 		    +"                [{name:'宣城'}, {name:'"+simple_name+"'}],\n"
	    	// 		    +"                [{name:'黄山'}, {name:'"+simple_name+"'}],\n"
	    	// 		    +"                [{name:'宿州'}, {name:'"+simple_name+"'}],\n"
	    	// 		    +"                [{name:'六安'}, {name:'"+simple_name+"'}],\n"
	    	// 		    +"            ]\n"
	    	// 		    +"        },\n"
	    	// 		    +"        markPoint : {\n"
	    	// 		    +"            symbol:'emptyCircle',\n"
	    	// 		    +"            symbolSize : function (v){\n"
	    	// 		    +"                return 10 + v/15\n"
	    	// 		    +"            },\n"
	    	// 		    +"            effect : {\n"
	    	// 		    +"                show: true,\n"
	    	// 		    +"                shadowBlur : 0\n"
	    	// 		    +"            },\n"
	    	// 		    +"            itemStyle:{\n"
	    	// 		    +"                normal:{\n"
	    	// 		    +"                    label:{show:false}\n"
	    	// 		    +"                },\n"
	    	// 		    +"                emphasis: {\n"
	    	// 		    +"                    label:{position:'top'}\n"
	    	// 		    +"                }\n"
	    	// 		    +"            },\n"
	    	// 		    +"            data : [\n"
	    	// 		    +"            ]\n"
	    	// 		    +"        }\n"
	    	// 		    +"    },\n"
	    	// 		    +"]\n"
	    	// 		    +"};\n");
			}
		});
		
		$.ajax({
	        type : "post",
	        async : false, //同步执行
	        url : "<%=path%>/bigScreenYesterdayVisitors/getProvinceYesterdayVisitors.html",//这个方法与index的方法重复但尝试合并为一个方法暂时未能成功
	        data : {
	        	areacode : areacode,
	        	flag : flag
	        },
	        dataType : "json", //返回数据形式为json
	        success : function(result) {
		        if (result.data.length>0) {
		        	var yesterdayVisitors = result.data;
		        	alltourists = yesterdayVisitors[0].alltourists;
		            for(var i=0;i<yesterdayVisitors.length;i++){
		            	arrCities.push(yesterdayVisitors[i].cities);
		            	ayyCitiesNum.push(yesterdayVisitors[i].tourist);
		            	touristPercent.push((yesterdayVisitors[i].tourist/alltourists*100).toFixed(1));
		            }
		            $("#code").html("option = {\n"
		    			    +"color: ['gold','aqua','lime'],\n"
		    			    +"tooltip : {\n"
		    			    +"   show: true,\n"
		    			    +"   trigger: 'item',\n"
		    			    +"   formatter: '{b}'\n"
		    			    +"},\n"
		    			    +"series : [\n"
		    			    +"    {\n"
		    			    +"        name: '安徽',\n"
		    			    +"        type: 'map',\n"
		    			    +"        roam: true,\n"
		    			    +"        hoverable: false,\n"
		    			    +"        mapType: '安徽',\n"
		    			    +"        itemStyle:{\n"
		    			    +"            normal:{\n"
		    			    +"                borderColor:'rgba(100,149,237,1)',\n"
		    			    +"                borderWidth:0.5,\n"
		    			    +"                areaStyle:{\n"
		    			    +"                    color: '#1b1b1b'\n"
		    			    +"                }\n"
		    			    +"            }\n"
		    			    +"        },\n"
		    			    +"        data:[],\n"
		    			    +"        markLine : {\n"
		    			    +"            smooth:true,\n"
		    			    +"            symbol: ['none', 'circle'],\n"
		    			    +"            symbolSize : 1,\n"
		    			    +"            itemStyle : {\n"
		    			    +"                normal: {\n"
		    			    +"                    color:'#fff',\n"
		    			    +"                    borderWidth:1,\n"
		    			    +"                    borderColor:'rgba(30,144,255,0.5)'\n"
		    			    +"                }\n"
		    			    +"            },\n"
		    			    +"            data : [\n"
		    			    +"            ],\n"
		    			    +"        },\n"
		    			    +"        geoCoord: {\n"
		    			    +"            '芜湖':[118.38,31.09],\n"
		    			    +"            '合肥': [117.69,31.6581],\n"
		    			    +"            '安庆': [116.59,30.61],\n"
		    			    +"            '阜阳': [115.65,32.98],\n"
		    			    +"            '亳州': [116.25,33.38],\n"
		    			    +"            '宿州': [117.25,33.88],\n"
		    			    +"            '蚌埠': [117.45,33.08],\n"
		    			    +"            '滁州': [117.95,32.48],\n"
		    			    +"            '淮南': [116.70,32.78],\n"
		    			    +"            '淮北': [116.75,33.68],\n"
		    			    +"            '铜陵': [117.89,30.9581],\n"
		    			    +"            '马鞍山':[118.58,31.59],\n"
		    			    +"            '池州': [117.49,30.33],\n"
		    			    +"            '黄山':[118.28,29.899],\n"
		    			    +"            '宣城':[118.98,30.69],\n"
		    			    +"            '六安':[116.5005646164,31.7470318307],\n"
		    			    +"            '"+simple_name+"': ["+longitude+","+latitude+"],\n"
		    			    +"        }\n"
		    			    +"    },\n"
		    			    +"    {\n"
		    			    +"        name: '安徽 Top10',\n"
		    			    +"        type: 'map',\n"
		    			    +"        mapType: '安徽',\n"
		    			    +"        data:[],\n"
		    			    +"        markLine : {\n"
		    			    +"            smooth:true,\n"
		    			    +"            effect : {\n"
		    			    +"                show: true,\n"
		    			    +"                scaleSize: 1,\n"
		    			    +"                period: 30,\n"
		    			    +"                color: '#fff',\n"
		    			    +"                shadowBlur: 10\n"
		    			    +"            },\n"
		    			    +"            itemStyle : {\n"
		    			    +"                normal: {\n"
		    			    +"                    borderWidth:1,\n"
		    			    +"                    lineStyle: {\n"
		    			    +"                        type: 'solid',\n"
		    			    +"                        shadowBlur: 10\n"
		    			    +"                    }\n"
		    			    +"                }\n"
		    			    +"            },\n"
		    			    +"            data : [\n"
		    			    +"                [{name:'"+arrCities[0].substring(0,arrCities[0].length-1)+"'}, {name:'"+simple_name+"'}],\n"
		    			    +"                [{name:'"+arrCities[1].substring(0,arrCities[1].length-1)+"'}, {name:'"+simple_name+"'}],\n"
		    			    +"                [{name:'"+arrCities[2].substring(0,arrCities[2].length-1)+"'}, {name:'"+simple_name+"'}],\n"
		    			    +"                [{name:'"+arrCities[3].substring(0,arrCities[3].length-1)+"'}, {name:'"+simple_name+"'}],\n"
		    			    +"                [{name:'"+arrCities[4].substring(0,arrCities[4].length-1)+"'}, {name:'"+simple_name+"'}],\n"
		    			    +"                [{name:'"+arrCities[5].substring(0,arrCities[5].length-1)+"'}, {name:'"+simple_name+"'}],\n"
		    			    +"                [{name:'"+arrCities[6].substring(0,arrCities[6].length-1)+"'}, {name:'"+simple_name+"'}],\n"
		    			    +"                [{name:'"+arrCities[7].substring(0,arrCities[7].length-1)+"'}, {name:'"+simple_name+"'}],\n"
		    			    +"                [{name:'"+arrCities[8].substring(0,arrCities[8].length-1)+"'}, {name:'"+simple_name+"'}],\n"
		    			    +"                [{name:'"+arrCities[9].substring(0,arrCities[9].length-1)+"'}, {name:'"+simple_name+"'}],\n"
		    			    +"            ]\n"
		    			    +"        },\n"
		    			    +"        markPoint : {\n"
		    			    +"            symbol:'emptyCircle',\n"
		    			    +"            symbolSize : function (v){\n"
		    			    +"                return (5+v/5)*1.2\n"
		    			    +"            },\n"
		    			    +"            effect : {\n"
		    			    +"                show: true,\n"
		    			    +"                shadowBlur : 0\n"
		    			    +"            },\n"
		    			    +"            itemStyle:{\n"
		    			    +"                normal:{\n"
		    			    +"                    label:{show:false}\n"
		    			    +"                },\n"
		    			    +"                emphasis: {\n"
		    			    +"                    label:{position:'top'}\n"
		    			    +"                }\n"
		    			    +"            },\n"
		    			    +"            data : [\n"
		    			    +"              {name:'"+arrCities[0].substring(0,arrCities[0].length-1)+"',value:"+touristPercent[0]+"},\n"
		    			    +"              {name:'"+arrCities[1].substring(0,arrCities[1].length-1)+"',value:"+touristPercent[1]+"},\n"
		    			    +"              {name:'"+arrCities[2].substring(0,arrCities[2].length-1)+"',value:"+touristPercent[2]+"},\n"
		    			    +"              {name:'"+arrCities[3].substring(0,arrCities[3].length-1)+"',value:"+touristPercent[3]+"},\n"
		    			    +"              {name:'"+arrCities[4].substring(0,arrCities[4].length-1)+"',value:"+touristPercent[4]+"},\n"
		    			    +"              {name:'"+arrCities[5].substring(0,arrCities[5].length-1)+"',value:"+touristPercent[5]+"},\n"
		    			    +"              {name:'"+arrCities[6].substring(0,arrCities[6].length-1)+"',value:"+touristPercent[6]+"},\n"
		    			    +"              {name:'"+arrCities[7].substring(0,arrCities[7].length-1)+"',value:"+touristPercent[7]+"},\n"
		    			    +"              {name:'"+arrCities[8].substring(0,arrCities[8].length-1)+"',value:"+touristPercent[8]+"},\n"
		    			    +"              {name:'"+arrCities[9].substring(0,arrCities[9].length-1)+"',value:"+touristPercent[9]+"},\n"
		    			    +"            ]\n"
		    			    +"        }\n"
		    			    +"    },\n"
		    			    +"]\n"
		    			    +"};\n");
		        }else{//显示无迁徙的空地图
		        	$("#code").html("option = {\n"
		    			    +"color: ['gold','aqua','lime'],\n"
		    			    +"tooltip : {\n"
		    			    +"   show: true,\n"
		    			    +"   trigger: 'item',\n"
		    			    +"   formatter: '{b}'\n"
		    			    +"},\n"
		    			    +"series : [\n"
		    			    +"    {\n"
		    			    +"        name: '安徽',\n"
		    			    +"        type: 'map',\n"
		    			    +"        roam: true,\n"
		    			    +"        hoverable: false,\n"
		    			    +"        mapType: '安徽',\n"
		    			    +"        itemStyle:{\n"
		    			    +"            normal:{\n"
		    			    +"                borderColor:'rgba(100,149,237,1)',\n"
		    			    +"                borderWidth:0.5,\n"
		    			    +"                areaStyle:{\n"
		    			    +"                    color: '#1b1b1b'\n"
		    			    +"                }\n"
		    			    +"            }\n"
		    			    +"        },\n"
		    			    +"        data:[],\n"
		    			    +"        markLine : {\n"
		    			    +"            smooth:true,\n"
		    			    +"            symbol: ['none', 'circle'],\n"
		    			    +"            symbolSize : 1,\n"
		    			    +"            itemStyle : {\n"
		    			    +"                normal: {\n"
		    			    +"                    color:'#fff',\n"
		    			    +"                    borderWidth:1,\n"
		    			    +"                    borderColor:'rgba(30,144,255,0.5)'\n"
		    			    +"                }\n"
		    			    +"            },\n"
		    			    +"            data : [\n"
		    			    +"            ],\n"
		    			    +"        },\n"
		    			    +"        geoCoord: {\n"
		    			    +"            '芜湖':[118.38,31.09],\n"
		    			    +"            '合肥': [117.69,31.6581],\n"
		    			    +"            '安庆': [116.59,30.61],\n"
		    			    +"            '阜阳': [115.65,32.98],\n"
		    			    +"            '亳州': [116.25,33.38],\n"
		    			    +"            '宿州': [117.25,33.88],\n"
		    			    +"            '蚌埠': [117.45,33.08],\n"
		    			    +"            '滁州': [117.95,32.48],\n"
		    			    +"            '淮南': [116.70,32.78],\n"
		    			    +"            '淮北': [116.75,33.68],\n"
		    			    +"            '铜陵': [117.89,30.9581],\n"
		    			    +"            '马鞍山':[118.58,31.59],\n"
		    			    +"            '池州': [117.49,30.33],\n"
		    			    +"            '黄山':[118.28,29.899],\n"
		    			    +"            '宣城':[118.98,30.69],\n"
		    			    +"            '六安':[116.5005646164,31.7470318307],\n"
		    			    +"            '"+simple_name+"': ["+longitude+","+latitude+"],\n"
		    			    +"        }\n"
		    			    +"    },\n"
		    			    +"    {\n"
		    			    +"        name: '安徽 Top10',\n"
		    			    +"        type: 'map',\n"
		    			    +"        mapType: '安徽',\n"
		    			    +"        data:[],\n"
		    			    +"        markLine : {\n"
		    			    +"            smooth:true,\n"
		    			    +"            effect : {\n"
		    			    +"                show: true,\n"
		    			    +"                scaleSize: 1,\n"
		    			    +"                period: 30,\n"
		    			    +"                color: '#fff',\n"
		    			    +"                shadowBlur: 10\n"
		    			    +"            },\n"
		    			    +"            itemStyle : {\n"
		    			    +"                normal: {\n"
		    			    +"                    borderWidth:1,\n"
		    			    +"                    lineStyle: {\n"
		    			    +"                        type: 'solid',\n"
		    			    +"                        shadowBlur: 10\n"
		    			    +"                    }\n"
		    			    +"                }\n"
		    			    +"            },\n"
		    			    +"            data : [\n"
		    			    +"                [{name:'阜阳'}, {name:'"+simple_name+"'}],\n"
		    			    +"                [{name:'安庆'}, {name:'"+simple_name+"'}],\n"
		    			    +"                [{name:'亳州'}, {name:'"+simple_name+"'}],\n"
		    			    +"                [{name:'芜湖'}, {name:'"+simple_name+"'}],\n"
		    			    +"                [{name:'淮北'}, {name:'"+simple_name+"'}],\n"
		    			    +"                [{name:'蚌埠'}, {name:'"+simple_name+"'}],\n"
		    			    +"                [{name:'淮南'}, {name:'"+simple_name+"'}],\n"
		    			    +"                [{name:'滁州'}, {name:'"+simple_name+"'}],\n"
		    			    +"                [{name:'合肥'}, {name:'"+simple_name+"'}],\n"
		    			    +"                [{name:'铜陵'}, {name:'"+simple_name+"'}],\n"
		    			    +"                [{name:'马鞍山'}, {name:'"+simple_name+"'}],\n"
		    			    +"                [{name:'池州'}, {name:'"+simple_name+"'}],\n"
		    			    +"                [{name:'宣城'}, {name:'"+simple_name+"'}],\n"
		    			    +"                [{name:'黄山'}, {name:'"+simple_name+"'}],\n"
		    			    +"                [{name:'宿州'}, {name:'"+simple_name+"'}],\n"
		    			    +"                [{name:'六安'}, {name:'"+simple_name+"'}],\n"
		    			    +"            ]\n"
		    			    +"        },\n"
		    			    +"        markPoint : {\n"
		    			    +"            symbol:'emptyCircle',\n"
		    			    +"            symbolSize : function (v){\n"
		    			    +"                return 10 + v/15\n"
		    			    +"            },\n"
		    			    +"            effect : {\n"
		    			    +"                show: true,\n"
		    			    +"                shadowBlur : 0\n"
		    			    +"            },\n"
		    			    +"            itemStyle:{\n"
		    			    +"                normal:{\n"
		    			    +"                    label:{show:false}\n"
		    			    +"                },\n"
		    			    +"                emphasis: {\n"
		    			    +"                    label:{position:'top'}\n"
		    			    +"                }\n"
		    			    +"            },\n"
		    			    +"            data : [\n"
		    			    +"            ]\n"
		    			    +"        }\n"
		    			    +"    },\n"
		    			    +"]\n"
		    			    +"};\n");
		        }
	        }
	    });
	};
	</script>
    <script src="<%=path %>/js/bootstrap.min.js"></script>
    <script src="<%=path %>/js/echarts/echarts.js"></script>
    <script src="<%=path %>/js/echartsExample.js"></script>
</body>
</html>
