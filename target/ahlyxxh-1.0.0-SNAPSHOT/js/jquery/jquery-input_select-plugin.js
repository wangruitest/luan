/**
 * 可输入、搜索的下拉框
 * @author 陈希富
 * @since 2012-10-13
 * 使用示例：
 * inputSelect.init({target:"inputSelect",inputFontSize:18,selectFontSize:18,data:[{value:'111',text:'111',childrens:[{value:'aaa',text:'aaa'}]]);
 */
var inputSelect={
	target:null,
	inputTextId:"cxf_input_select_input_text",
	inputValueId:"cxf_input_select_input_value",
	selectId:"cxf_input_select_select",
    inputWidth:200,
    inputFontSize:25,
    selectWidth:200,
    selectHeight:250,
    selectFontSize:25,
    selectBackground:"#fff",
    selectBorder:"#000 solid 1px",
    selectOverflowY:"auto",
    selectOverflowX:"auto",
    selectLineHeight:35,
    selectLinePaddingLeft:5,
    data:[],
    showData:[],
    selectObj:null,
    selectLiObj:null,
    selectedLiObj:null,
    inputTextObj:null,
    inputValueObj:null,
    targetObj:null,
    /**
     * 初始化
     */
    init:function(option){
    	if(null==option || typeof(option)!="object")return;
    	if(option.target)inputSelect.target=option.target;
    	if(option.inputWidth)inputSelect.inputWidth=option.inputWidth;
    	if(option.inputFontSize)inputSelect.inputFontSize=option.inputFontSize;
    	if(option.selectWidth)inputSelect.selectWidth=option.selectWidth;
    	if(option.selectFontSize)inputSelect.selectFontSize=option.selectFontSize;
    	if(option.selectHeight)inputSelect.selectHeight=option.selectHeight;
    	if(option.selectBackground)inputSelect.selectBackground=option.selectBackground;
    	if(option.selectBorder)inputSelect.selectBorder=option.selectBorder;
    	if(option.selectOverflowY)inputSelect.selectOverflowY=option.selectOverflowY;
    	if(option.selectOverflowX)inputSelect.selectOverflowX=option.selectOverflowX;
    	if(option.selectLineHeight)inputSelect.selectLineHeight=option.selectLineHeight;
    	if(option.selectLinePaddingLeft)inputSelect.selectLinePaddingLeft=option.selectLinePaddingLeft;
    	if(option.data)inputSelect.data=option.data;
    	if(option.data)inputSelect.showData=option.data;
    	
    	inputSelect.htmlInit();
    	inputSelect.styleInit();
    	inputSelect.selectInit();
    	
    	inputSelect.inputTextObj.keyup(inputSelect.inputKeyUp);
    	inputSelect.inputTextObj.focus(function(){inputSelect.inputTextObj.val("");inputSelect.inputValueObj.val("");});
    	inputSelect.selectObj.mouseout(function() {
    		inputSelect.selectObj.css("display","none");
		});
    	inputSelect.selectObj.mouseover(function() {
    		inputSelect.selectObj.css("display","block");
		});
    },
    htmlInit:function(){
    	var inputTextHtml="<input type=\"text\" id=\""+inputSelect.inputTextId+"\"/>";
    	var inputValueHtml="<input type=\"hidden\" id=\""+inputSelect.inputValueId+"\"/>";
    	var selectHtml="<ul id=\""+inputSelect.selectId+"\"/>";
    	inputSelect.targetObj=$("#"+inputSelect.target);
    	inputSelect.targetObj.append(inputTextHtml).append(inputValueHtml).append(selectHtml);
    	inputSelect.selectObj=$("#"+inputSelect.selectId);
    	inputSelect.selectLiObj=$("#"+inputSelect.selectId+" li");
    	inputSelect.inputTextObj=$("#"+inputSelect.inputTextId);
    	inputSelect.inputValueObj=$("#"+inputSelect.inputValueId);
    },
    styleInit:function(){
    	$("#"+inputSelect.inputTextId).css("width",inputSelect.inputWidth+"px");
    	$("#"+inputSelect.inputTextId).css("font-size",inputSelect.inputFontSize+"px");
    	
    	inputSelect.selectObj.css("border",inputSelect.selectBorder);
    	inputSelect.selectObj.css("width",inputSelect.selectWidth+"px");
    	inputSelect.selectObj.css("list-style-type","none");
    	inputSelect.selectObj.css("display","none");
    	inputSelect.selectObj.css("background",inputSelect.selectBackground);
    	inputSelect.selectObj.css("position","absolute");
    	inputSelect.selectObj.css("left","40px");
    	inputSelect.selectObj.css("top",inputSelect.inputFontSize+10+"px");
    	inputSelect.selectObj.css("height",inputSelect.selectHeight+"px");
    	inputSelect.selectObj.css("overflow-y",inputSelect.selectOverflowY);
    	inputSelect.selectObj.css("overflow-x",inputSelect.selectOverflowX);
    },
    inputKeyUp:function(){
    	//获取已选数据，给下拉框选项着色
    	var oldText=inputSelect.inputTextObj.val();
		if(oldText=="")return;
		inputSelect.showData=inputSelect.data;
		inputSelect.filterData(inputSelect.showData,oldText);
		inputSelect.selectInit();
		
		//调整高度
		inputSelect.selectObj.css("display","block");
		if (parseInt(inputSelect.selectObj.scrollHeight) < inputSelect.selectHeight) {
			inputSelect.selectObj.css("height",parseInt(inputSelect.selectObj.scrollHeight)+ "px");
		} else {
			inputSelect.selectObj.css("height",inputSelect.selectHeight+"px");
		}
		
		//初始化
		inputSelect.targetObj.css("position","relative");
    },
    filterData:function(data,filterStr){
    	var isShowParent=false;
    	for(var i=0;i<data.length;i++){
			var obj=data[i];
			obj.showText=obj.text;
			obj.isShow=false;
			if(null!=obj.childrens){
				obj.isShow=inputSelect.filterData(obj.childrens,filterStr);
				isShowParent=obj.isShow;
			}
			var fIndex=obj.text.indexOf(filterStr);
			if(fIndex>=0){		
				var text=obj.text;
				obj.showText=text.substring(0,fIndex)+"<font color='red'>"+filterStr+"</font>"+text.substring(fIndex+filterStr.length,text.length);
				obj.isShow=true;
				isShowParent=true;
			}
		}
    	return isShowParent;
    },
    selectInit:function(){
		inputSelect.clearLi();
		
		inputSelect.loadData(inputSelect.showData,0);
		
		var optionList = new Array();
		optionList = inputSelect.selectObj.find('li'); 
		for(var i = 0;i<optionList.length;i++){
			optionList[i].style.LineHeight=inputSelect.selectLineHeight+"px";
			optionList[i].style.width=inputSelect.selectWidth-inputSelect.selectLinePaddingLeft+"px";
			optionList[i].style.fontSize=inputSelect.selectFontSize+"px";
			optionList[i].style.paddingLeft=inputSelect.selectLinePaddingLeft+"px";
			optionList[i].onmouseover = function(event){
				this.style.background="#e3e3e3";
				this.style.cursor="pointer";
				inputSelect.selectObj.css("display","block");
				inputSelect.selectedLiObj=this;
			};
			optionList[i].onmouseout = function() {
				this.style.background="#ffffff";
			};
			optionList[i].onclick = function() {
				inputSelect.inputTextObj.val(inputSelect.selectedLiObj.showText);
				inputSelect.inputValueObj.val(inputSelect.selectedLiObj.value);
				inputSelect.selectObj.css("display","none");
			};
			
		}//end for
    },
    clearLi:function(){
    	$("#"+inputSelect.selectId+" li").each(function(){
			$(this).remove();
		});
    },
    loadData:function(data,level){
		for(var i=0;i<data.length;i++){
			var obj=data[i];
			if(null==obj.isShow || !obj.isShow)continue;
			var fontStr="";
			for(var j=0;j<level;j++){
				fontStr+="&#160;&#160;";
			}
//			if(level>0){
//				fontStr+="|-";
//			}
			
			if(null!=obj.childrens){
				fontStr+="<img src='../../images/tree_folder_open.gif'/>&#160;";
			}else{
				if(level>0){
					fontStr+="<img src='../../images/tree_file.gif'/>&#160;";
				}else{
					fontStr+="<img src='../../images/tree_folder.gif'/>&#160;";
				}
			}
			
			var showText=obj.showText==null?obj.text:obj.showText;
			var liHtml="<li value=\""+obj.value+"\" showText=\""+obj.text+"\">"+fontStr+showText+"</li>";
			inputSelect.selectObj.append(liHtml);
			if(null!=obj.childrens){
				inputSelect.loadData(obj.childrens,level+1);
			}
		}
    },
    getValue:function(){
    	return inputSelect.inputValueObj.val();
    },
    toShowData:function(data){
    	for(var i=0;i<data.length;i++){
    		alert(showObj(data[i]));
    		if(null!=data[i].childrens){
    			inputSelect.toShowData(data[i].childrens);
    		}
    	}
    }
};
