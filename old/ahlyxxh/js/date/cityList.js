$(function(){
	
	cityListInit();
});
 

function cityListInit() {
	var allCityArr={
			"cityList":[
			         {"name":"六安市","code":"341500"},
			         {"name":"芜湖市","code":"340200"}, 
			         {"name":"蚌埠市","code":"340300"}, 
			         {"name":"淮南市","code":"340400"}, 
			         {"name":"马鞍山市","code":"340500"}, 
			         {"name":"淮北市","code":"340600"}, 
			         {"name":"铜陵市","code":"340700"}, 
			         {"name":"安庆市","code":"340800"}, 
			         {"name":"黄山市","code":"341000"}, 
			         {"name":"滁州市","code":"341100"}, 
			         {"name":"阜阳市","code":"341200"}, 
			         {"name":"宿州市","code":"341300"}, 
			         {"name":"合肥市","code":"340100"}, 
			         {"name":"亳州市","code":"341600"}, 
			         {"name":"池州市","code":"341700"}, 
			         {"name":"宣城市","code":"341800"}
				]			
	};
	//图片logo设置
    WebLogoCfgAction.getWebLogoCfg(function(data){
    	if(data.returnList == null || data.returnList.length <=0){
    		return false;
    	}
    	var htmlTemp = '';
    	if(1!=data.returnList[0].ext2||"1"!=data.returnList[0].ext2){
    		for(var arrIndex=0;arrIndex<allCityArr.cityList.length;arrIndex++){
    			var city = allCityArr.cityList[arrIndex];
    			if(city.code == data.returnList[0].ext2){
    			//htmlTemp += '';
    			// htmlTemp += '<span class="tdSpan" style="margin-bottom: 3px;"><input name="ctiys" type="checkbox" value='+city.code+'/>'+city.name+'</span>';
    			htmlTemp += '<span style=""><input name="ctiys" type="checkbox" style="margin-bottom: 8px;" value='+city.code+'/>'+city.name+'</span>';
    			break;
    			};			
    		}
    	}else{
    		var titleFlag = true;
    		var maanshan=false;
    		/*for(var arrIndex=0;arrIndex<allCityArr.cityList.length;arrIndex++){
    			var city = allCityArr.cityList[arrIndex];
    			if(city.name=='马鞍山市'&&city.code=='340500'){
    				maanshan=true;
    				break;
    			}
    		}*/
    		for(var arrIndex=0;arrIndex<allCityArr.cityList.length;arrIndex++){
    			var city = allCityArr.cityList[arrIndex];
    			//htmlTemp += '<input name="ctiys" type="checkbox" value='+city.code+'/>';
    			if(city.name!='马鞍山市'&&city.code!='340500'){
    				htmlTemp += '<span class="tdSpan" style="margin-bottom: 3px;margin-right:3px;"><input name="ctiys" type="checkbox" value='+city.code+'  />'+city.name+'</span>';	
    			}
    			if((1+arrIndex)%8==0){
    				if(titleFlag){
    					//if(city.name=='马鞍山市'&&city.code=='340500'){
    						//if(maanshan){
    					htmlTemp += '<span class="tdSpan" style="margin-bottom: 3px;margin-right:3px;"><input name="ctiys" type="checkbox" value="340500"  />马鞍山市</span>';	
    						//}
    					//}
    					htmlTemp+='<font color="red">&nbsp;&nbsp;勾选显示该列数据</font></br>';
    					titleFlag = false;
    				}else{
    					
    					
            			
    					htmlTemp+='</br>';
    				}
    				
    			}
    		}
    	}
    	$("#mdd_bar_2").html(htmlTemp);        	
    });
}

