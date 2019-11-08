//判断一个文本数据是否全为数字
function bNumber(AString){
  for(i=0;i<AString.length;i++)
    if((AString.charAt(i)>'9')||(AString.charAt(i)<'0'))
      return false;
  return true;
}

	//判断字符串是否为空格(为空格返回true,否则返回false)
function checkSpace(str){
	var sw=/^\s*$/;
		
	if(sw.test(str)){
		return true;
	}else{
		return false;
	}
}

//去除头尾空格
function trim(sSrc){
  var sDesc = '';
  var ibegin = 0;
  var iend = 0;
  var status = 0;//0:未开始 1:在内容中间
  
  for (i=0; i<sSrc.length; i++){
  	if (sSrc.charAt(i) != ' ' && sSrc.charAt(i) != '\t') {
  		if(status == 0){
  		  ibegin = i;
  		  status = 1;
  		 }
  		if(status == 1){
  		  iend = i + 1;
  		}
  	}
  }
  
  if(ibegin == iend) 
    return '';
  
  return sSrc.substring(ibegin,iend);
}

//判断一个文本数据是否包含中文内容return true:包含;false:不包含
function bIncludeChinese(AString){
  for(i=0;i<AString.length;i++)
    if(AString.charCodeAt(i)>=160)
    	return true;
  return false;
}

//取文本的长度
function getTextLength(sText){
  nLength=0;
  for(i=0;i<sText.length;i++)
    if(sText.charCodeAt(i)>=160)
      nLength=nLength+2;
    else nLength++;
  return nLength;
}

//判断一个对象的内容是否为空值
function bNull(oObject, sDescription){
  if (trim(oObject.value) == ""){
    alert(sDescription+"不能为空，请重新输入！");
    try{
    	oObject.select();
    }catch(e){
    }
    return true;
  }
  return false;
}

//判断一个对象的内容是否越界
function bOutOfLength(oObject, sDescription, nMaxLength){
  nLength=getTextLength(oObject.value);
  if (nLength>nMaxLength){
    alert(sDescription+"长度不能超过"+nMaxLength+"个字符!");
    try{
    	oObject.focus();
    }catch(e){
    }
    return true;
  }
  return false;
}

//判断文件名是否不合法
function bIllegalFileName(sFileName, sDescription){
  if (sFileName.indexOf("/") >= 0 ||
      sFileName.indexOf("\\") >= 0 ||
      sFileName.indexOf(":") >= 0 ||
      sFileName.indexOf("*") >= 0 ||
      sFileName.indexOf("#") >= 0 ||
      sFileName.indexOf("?") >= 0 ||
      sFileName.indexOf("\"") >= 0 ||
      sFileName.indexOf("<") >= 0 ||
      sFileName.indexOf(">") >= 0 ||
      sFileName.indexOf("|") >= 0 ||
      sFileName.indexOf(";") >= 0 ||
      sFileName.indexOf(",") >= 0 ||
      sFileName.indexOf("%") >= 0){
    alert(sDescription + "中不能包含下列任何字符之一：\n/\\:*#?\"<>|;,%");
    return true;;
  }
  if (trim(sFileName) == ""){
    alert(sDescription + "中不能全是空格");
    return true;
  }
  return false;
}

//将null转为空格
function parseNull(sSourceStr){
  if (sSourceStr == null || sSourceStr == "null"){
    sSourceStr = "";
  }
  return sSourceStr;
}

//将字符串转化为Span对象显示字符     
function parseSpanStr(aaData){
  if (aaData != null){
    re1 = new RegExp("\r\n", "g");
    re2 = new RegExp("\r", "g");
    re3 = new RegExp("\n", "g");
    for (var i=0; i<aaData.length;i++){
      for (var j=0; j<aaData[0].length;j++){
        if (aaData[i][j] == "" || aaData[i][j] == "null"){
          aaData[i][j] = "&nbsp;";
        } else {
          aaData[i][j] = aaData[i][j].replace(re1, "<br>");
          aaData[i][j] = aaData[i][j].replace(re2, "<br>");
          aaData[i][j] = aaData[i][j].replace(re3, "<br>");
        }
      }
    }
  }
  return aaData;
}

//将字符串转换成HTML
function replaceStr2Html(sSourceStr) {
  if (trim(sSourceStr) != "" && trim(sSourceStr) != "null"){
    sSourceStr = sSourceStr.replace(/&/g, "&amp;");
    sSourceStr = sSourceStr.replace(/</g, "&lt;");
    sSourceStr = sSourceStr.replace(/\"/g, "&quot;");
    sSourceStr = sSourceStr.replace(/\'/g, "‘");
    sSourceStr = sSourceStr.replace(/\u00AE/g, "&reg;");
    sSourceStr = sSourceStr.replace(/\u00A9/g, "&copy;");
    sSourceStr = sSourceStr.replace(/\u2122/g, "&trade;");
    sSourceStr = sSourceStr.replace(/\r\n/g, "<br>");
    sSourceStr = sSourceStr.replace(/\r/g, "<br>");
    sSourceStr = sSourceStr.replace(/\n/g, "<br>");
  }
  else {
    sSourceStr = "&nbsp;";
  }
  return sSourceStr;
}

//将空串转为&nbsp;
function parseNull2nbsp(sSourceStr){
  if (trim(sSourceStr) == "" || trim(sSourceStr) == "null"){
    sSourceStr = "&nbsp;";
  }
  return sSourceStr;
}

//清空变更输入框
function setFormEmpty(oForm){
  try{
    for(i=0; i<oForm.elements.length; i++){
      if(oForm.elements[i].tagName!=null){
        if(oForm.elements[i].tagName.toUpperCase()=="INPUT"
            && (oForm.elements[i].type.toUpperCase()=="BUTTON"
             || oForm.elements[i].type.toUpperCase()=="SUBMIT"
             || oForm.elements[i].type.toUpperCase()=="RESET"
             || oForm.elements[i].type.toUpperCase()=="HIDDEN"
            )){
            continue;
        }
        if(oForm.elements[i].tagName.toUpperCase()=="INPUT" ||
          oForm.elements[i].tagName.toUpperCase()=="TEXTAREA"){
          oForm.elements[i].value = "";
        }
        if(oForm.elements[i].tagName.toUpperCase()=="INPUT" ||
          oForm.elements[i].type.toUpperCase()=="CHECKBOX"){
          oForm.elements[i].checked = false;
        }
        if(oForm.elements[i].tagName.toUpperCase()=="SELECT"){
          if (oForm.elements[i].options.length > 0){
            oForm.elements[i].options[0].selected = true;
          }
        }
      }
    }
  }
  catch(ex){
    alert(ex.description);
  }
}

//清空变更输入框，不清空 RADIO 与 CHECKBOX 的值
function setFormEmpty_NotRadio(oForm){
  try{
    for(i=0; i<oForm.elements.length; i++){
      if(oForm.elements[i].tagName!=null){
        if(oForm.elements[i].tagName.toUpperCase()=="INPUT"
            && (oForm.elements[i].type.toUpperCase()=="BUTTON"
             || oForm.elements[i].type.toUpperCase()=="SUBMIT"
             || oForm.elements[i].type.toUpperCase()=="RESET"
             || oForm.elements[i].type.toUpperCase()=="HIDDEN"
             || oForm.elements[i].type.toUpperCase()=="RADIO"
             || oForm.elements[i].type.toUpperCase()=="CHECKBOX"
            )){
            continue;
        }
        if(oForm.elements[i].tagName.toUpperCase()=="INPUT" ||
          oForm.elements[i].tagName.toUpperCase()=="TEXTAREA"){
          oForm.elements[i].value = "";
        }
        if(oForm.elements[i].tagName.toUpperCase()=="SELECT" && oForm.elements[i].length>0){
          oForm.elements[i].options[0].selected = true;
        }
      }
    }
  }
  catch(ex){
    alert( "setFormEmpty_NotRadio err:" + ex.description);
  }
}

//设置Form元素的ReadOnly属性
function setFormReadOnly(oForm, bReadOnly){
 try{
   for(i=0; i<oForm.elements.length; i++){
     if(oForm.elements[i].tagName.toUpperCase()=="INPUT"
          && (oForm.elements[i].type.toUpperCase()=="BUTTON"
           || oForm.elements[i].type.toUpperCase()=="SUBMIT"
           || oForm.elements[i].type.toUpperCase()=="RESET"
           || oForm.elements[i].type.toUpperCase()=="HIDDEN"
          )){
          continue;
      }
      if(oForm.elements[i].tagName.toUpperCase()=="SELECT" ||
         oForm.elements[i].type.toUpperCase()=="CHECKBOX" ||
         oForm.elements[i].type.toUpperCase()=="RADIO")
        oForm.elements[i].disabled = bReadOnly;
      else
        oForm.elements[i].readOnly = bReadOnly;
        
      if (oForm.elements[i].id.startsWith("show_")){ //下拉树的文本框强制为只读
        oForm.elements[i].readOnly = true;
      }
      
      if(oForm.elements[i].tagName.toUpperCase()!="OBJECT"){
	      if(bReadOnly){
	        oForm.elements[i].style.color="#a7a6aa";
	        oForm.elements[i].style.backgroundColor="#EEEEEE";
	        if(oForm.elements[i].tagName.toUpperCase()!="SELECT" &&
             oForm.elements[i].type.toUpperCase()!="CHECKBOX" &&
             oForm.elements[i].type.toUpperCase()!="RADIO"){
	          oForm.elements[i].style.border="1px solid #c9c7ba";
	        }
	      }
	      else{
	        oForm.elements[i].style.color="#000000";
	        oForm.elements[i].style.backgroundColor="#FFFFFF";
	        if(oForm.elements[i].tagName.toUpperCase()!="SELECT" &&
             oForm.elements[i].type.toUpperCase()!="CHECKBOX" &&
             oForm.elements[i].type.toUpperCase()!="RADIO"){
	          oForm.elements[i].style.border="1px solid #a7a6aa";
	        }
	      }
    	}
    }
  }
  catch(ex){
    alert(ex.description);
  }
}

//设置文本及下拉框的状态
function setTextObjEnabled(oObjId, bEnabled){
  if (!bEnabled){
    oObjId.style.color="#a7a6aa";
    oObjId.style.backgroundColor="#EEEEEE";
    oObjId.style.border="1px solid #c9c7ba";
  }
  else{
    oObjId.style.color="#000000";
	  oObjId.style.backgroundColor="#FFFFFF";
	  oObjId.style.border="1px solid #a7a6aa";
  }

  oObjId.disabled = !bEnabled;
}

//设置单选CheckBox框的状态
function setCheckObjEnabled(oObjId, bEnabled){
  oObjId.disabled = !bEnabled;
}

//设置多选CheckBox框的状态
function setMultiCheckEnabled(oObjId,bEnabled){
  if (typeof(oObjId)!="undefined" && oObjId!=null ){
    for (i=0;i<oObjId.length;i++){
      oObjId[i].disabled=!bEnabled;
    }
  }
}

//设置多选CheckBox框是否全部选中
function setAllChecked(oObjId, bChecked){
  if (typeof(oObjId)!="undefined" && oObjId!=null ){
    if (typeof(oObjId.length) == "undefined"){
      oObjId.checked = bChecked;
    }
    else {
      for (var i=0; i<oObjId.length; i++){
        oObjId[i].checked = bChecked;
      }
    }
  }
}

//设置多选CheckBox框的初始值
function setMultiCheckValue(oObjId,sValue){
  if (typeof(oObjId)!="undefined" && oObjId!=null ){
    for (i=0;i<oObjId.length;i++){
      if (sValue.indexOf(oObjId[i].value)>=0){
        oObjId[i].checked=true;
      }
      else{
        oObjId[i].checked=false;
      }
    }
  }
}

//设置单选Radio框的初始值
function setRadioCheckValue(oObjId,sValue){
  if (typeof(oObjId)!="undefined" && oObjId!=null ){
    for (i=0;i<oObjId.length;i++){
      if (sValue == oObjId[i].value){
        oObjId[i].checked=true;
        return false;
      }
    }
  }
}

//读取单选Radio框的值
function getRadioCheckValue(oObjId){
  if (typeof(oObjId)!="undefined" && oObjId!=null ){
    for (i=0;i<oObjId.length;i++){
      if (oObjId[i].checked){
        return oObjId[i].value;
      }
    }
  }
}

//设置多选CheckBox框的初始值
function setMultiCheck(oObjId,iOffset){
  if (typeof(oObjId)!="undefined" && oObjId!=null ){
    if (oObjId.length-1 >= iOffset){
      oObjId[iOffset].checked=true;
    }
  }
}

//获取多选CheckBox框的初始值
function getMultiCheckValue(oObjId, splitFlag){
  var checkValue = "";
  if (splitFlag == null){
    splitFlag = String.fromCharCode(1);
  }
  
  if (typeof(oObjId)!="undefined" && oObjId!=null ){
    if (typeof(oObjId.length) == "undefined"){
      if (oObjId.checked){
        checkValue += oObjId.value;
      }
    }
    else {
      for (i=0; i<oObjId.length; i++){
        if (oObjId[i].checked){
          if (checkValue != ""){
            checkValue += splitFlag;
          }
          
          checkValue += oObjId[i].value;
        }
      }
    }
  }
  return checkValue;
}

//设置Checkbox框状态 参数:Checkbox框名称 设置为选中状态所需要的值 当前传入的值
function setCheckbox(oCheck,sValue,sSourceValue){
  if (sValue==sSourceValue){ //当前传入的值等于设置Checkbox框为选中状态所需要的值
    oCheck.checked=true;
  }
  else{
    oCheck.checked=false;
  }
}

//根据Checkbox状态获取值 参数:Checkbox框名称 选中时传回的值 未选中时传的值
function getCheckboxValue(oCheck,sCheckedValue,sNoCheckedValue){
  var sReturnValue="";
  if (oCheck.checked){
    sReturnValue=sCheckedValue;
  }
  else{
    sReturnValue=sNoCheckedValue;
  }
  return sReturnValue;
}

//获取下拉框当前被选中项的显示名称
function getSelectItemName(oObjId){
  var sName = "";
  if (typeof(oObjId)!="undefined" && oObjId!=null && oObjId.options.length > 0){
    sName = oObjId.options[oObjId.selectedIndex].innerText;
  }
  return sName;
}

//复制下拉框项目
function copySelectItems(oSourceObj, oDestObj){
  if (typeof(oSourceObj)!="undefined" && oSourceObj!=null && typeof(oDestObj)!="undefined" && oDestObj!=null ){
    delAllSelectItem(oDestObj);
    for (i=0;i<oSourceObj.options.length;i++){
      //完全复制下拉框内容
      var aaData = new Array();
      aaData[0] = new Array();
      aaData[0][0] = oSourceObj[i].value;
      aaData[0][1] = oSourceObj[i].innerText;
      addSelectItem(oDestObj,aaData);
      //连双方下拉框默认值也一样
      if (oSourceObj[i].selected){
        setSelectItemsValue(oDestObj,oSourceObj[i].value);
      }
    }
  }
}

//将 selSource 选中的项移动到 selDest 中。
function moveSelectItem(selSource, selDest){
  try{
  	var aItem = new Array();
  	for(var i=selSource.length-1; i>=0; i--){
  		if(selSource[i].selected){
  			var item = selSource[i];
  			selSource.remove(i);
  			aItem[aItem.length] = item;
  		}
  	}
  	
  	//为了顺序一致
  	for(var i=aItem.length-1; i>=0; i--){
  		selDest.add(aItem[i]);
  	}
  	selDest.selectedIndex = -1;
  }
  catch(ex){
  	alert(ex.description);
  }
}

//设置下拉框的初始值
function setSelectItemsValue(oObjId, sValue){
  if (typeof(oObjId)!="undefined" && oObjId!=null ){
    for (i=0;i<oObjId.options.length;i++){
      if (oObjId.options[i].value==sValue){
        oObjId.options[i].selected=true;
        break;
      }
    }
  }
}

//设置选中下拉框中的第几个值
function setSelectedItem(oObjId, iOffset){
  if (typeof(oObjId)!="undefined" && oObjId!=null ){
    if (oObjId.options.length-1>=iOffset){
      oObjId.options[iOffset].selected=true;
    }
  }
}

//设置下拉框的内容为"所有"
function setSeleteItem2All(oObjId){
  delAllSelectItem(oObjId);
  var aaData = new Array();
  aaData[0] = new Array();
  aaData[0][0] = "";
  aaData[0][1] = "--所有--";
  addSelectItem(oObjId,aaData);
}

//设置下拉框的内容为"提取数据出错"
function setSelectItem2Err(oObjId){
  delAllSelectItem(oObjId);
  var aaData = new Array();
  aaData[0] = new Array();
  aaData[0][0] = "";
  aaData[0][1] = "";
  addSelectItem(oObjId,aaData);
}

//删除所有下拉框内容
function delAllSelectItem(oObjId){
  if (typeof(oObjId)!="undefined" && oObjId!=null && oObjId.options.length > 0){
    oObjId.length = 0;
  }
}

//添加下拉框内容
function addSelectItem(oObjId,aaData){
  if (typeof(oObjId)!="undefined" && oObjId!=null ){
    if (typeof(aaData)!="undefined" && aaData!=null ){
      for (var i=0;i<aaData.length;i++){
        var oOption=document.createElement("OPTION");
        oObjId.options.add(oOption);
        oOption.value=aaData[i][0];
        oOption.innerText=aaData[i][1];
      }
    }
  }
}

//删除下拉框内容
function delSelectItem(oObjId,aaData){
  if (typeof(oObjId)!="undefined" && oObjId!=null && oObjId.options.length > 0){
    if (typeof(aaData)!="undefined" && aaData!=null){
      for (var i=0;i<aaData.length;i++){
        for (j=oObjId.options.length-1;j>=0;j--){
          if (oObjId.options[j].value==aaData[i][0]){
            oObjId.options.remove(j);
            break;
          }
        }
      }
    }
  }
}

//修改下拉框内容
function updateSelectItem(oObjId,aaData){
  if (typeof(oObjId)!="undefined" && oObjId!=null){
    if (typeof(aaData)!="undefined" && aaData!=null){
      for (var i=0;i<aaData.length;i++){
        for (j=oObjId.options.length-1;j>=0;j--){
          if (oObjId.options[j].value==aaData[i][0]){
            oObjId.options[j].innerText = aaData[i][1];
            break;
          }
        }
      }
    }
  }
}

//取当前日期的相对时间 返回值格式:YYYY/MM/DD 24HH:MI:SS
function getRelativeDateTime(iRelativeHour){
  var dtDateTime=new Date();
  var iHours=dtDateTime.getHours()+parseInt(iRelativeHour);
  dtDateTime.setHours(iHours);
  var sYear=dtDateTime.getFullYear();
  var sMonth=dtDateTime.getMonth()+1;
  var sDay=dtDateTime.getDate();
  var sHour=dtDateTime.getHours();
  var sMinute=dtDateTime.getMinutes();
  var sSecond=dtDateTime.getSeconds();
  if (sMonth<10) sMonth="0"+sMonth;
  if (sDay<10) sDay="0"+sDay;
  if (sHour<10) sHour="0"+sHour;
  if (sMinute<10) sMinute="0"+sMinute;
  if (sSecond<10) sSecond="0"+sSecond;
  var relativeDateTime=sYear+"/"+sMonth+"/"+sDay+" "+sHour+":"+sMinute+":"+sSecond;
  return relativeDateTime;
}

//将yyyyMM日期格式转化为标准的日期格式
function getStandDate(sSimpleDate){
  var sDestDate = "";
  if (sSimpleDate != ""){
    sDestDate = sSimpleDate.substring(0,4) + "/" +
                sSimpleDate.substring(4) + "/01 00:00:00" ;
  }
  return sDestDate;
}

//返回日期的字符串值：YYYY/MM/DD
function getFullDate(sSourceDate){
	eval("dtDate=new Date('"+sSourceDate+"')");
	var sYear=dtDate.getFullYear();
	var sMonth=dtDate.getMonth()+1;
	var sDay=dtDate.getDate();
	if (sMonth<10) sMonth="0"+sMonth;
	if (sDay<10) sDay="0"+sDay;
  currDate=''+sYear+"/"+sMonth+"/"+sDay;
  return currDate;
}

//返回时间的字符串值：24HH:MI:SS
function getFullTime(sSourceDate){
	eval("dtDate=new Date('"+sSourceDate+"')");
	var sHour=dtDate.getHours();
	var sMinute=dtDate.getMinutes();
	var sSecond=dtDate.getSeconds();
	if (sHour<10) sHour="0"+sHour;
	if (sMinute<10) sMinute="0"+sMinute;
	if (sSecond<10) sSecond="0"+sSecond;
  currTime=''+sHour+":"+sMinute+":"+sSecond;
  return currTime;
}

//返回日期的字符串值：YYYY-MM-DD
function getShortDate(sSourceDate){
  if (parseNull(sSourceDate) == ""){
    return "";
  }
  
	eval("dtDate=new Date('"+sSourceDate+"')");
	var sYear=dtDate.getFullYear();
	var sMonth=dtDate.getMonth()+1;
	var sDay=dtDate.getDate();
	if (sMonth<10) sMonth="0"+sMonth;
	if (sDay<10) sDay="0"+sDay;
  currDate=''+sYear+"-"+sMonth+"-"+sDay;
  return currDate;
}

//返回日期的字符串值：YYYY-MM-DD HH24:MI
function getSpecDate(sSourceDate){
  if (parseNull(sSourceDate) == ""){
    return "";
  }
  
	eval("dtDate=new Date('"+sSourceDate+"')");
	var sYear=dtDate.getFullYear();
	var sMonth=dtDate.getMonth()+1;
	var sDay=dtDate.getDate();
	var sHour=dtDate.getHours();
	var sMinute=dtDate.getMinutes();
	if (sMonth<10) sMonth="0"+sMonth;
	if (sDay<10) sDay="0"+sDay;
	if (sHour<10) sHour="0"+sHour;
	if (sMinute<10) sMinute="0"+sMinute;
  currDate=''+sYear+"-"+sMonth+"-"+sDay+' ' + sHour+":"+sMinute;
  return currDate;
}

//设置一个Cookie的值,并设置一周后过期
function setCookie(name, value){
	var oneWeek = 7*24*60*60*1000;
	var expDate = new Date();
	expDate.setTime(expDate.getTime() + oneWeek);
	document.cookie = name + "=" + escape(value) + "; expires=" + 
	                  expDate.toGMTString() + "; path=/";
}

//根据Cookie名字,取的相应的Cookie值
function getCookie(name){
	var result = "";
	var myCookie = " " + document.cookie + ";";
	var searchName = " " + name + "=";
	var startOfCookie = myCookie.indexOf(searchName);
	var endOfCookie;
	if(startOfCookie != -1){
		startOfCookie += searchName.length;
		endOfCookie = myCookie.indexOf(";", startOfCookie);
		result = unescape(myCookie.substring(startOfCookie, endOfCookie));
	}
	return result;
}

//触发连动事件
function fireEventWithDisabled(oObjId, sEventName){
   oObjId.disabled = false;
   oObjId.fireEvent("onchange");
   oObjId.disabled = true;  
}

//将数组转化为字符串
function uniteStr(aData, split_str){
  if(aData == null || aData.length <= 0){ //数组没东东
    return "";
  }
  
  if (typeof(split_str) == "undefined")
    split_str = ";";
  
  var sReturnStr = "";
  for (var i=0; i<aData.length; i++){
    sReturnStr += aData[i] + split_str;
  }
  
  return sReturnStr.substr(0, sReturnStr.length - 1);
}

//转换Y/N为true/false
function parseYN(flag){
  if (flag == "Y")
    return "true";
  else 
    return "false";
}

//收缩或是展开某个区域
function openOrhideArea(that, area_name){
  if (that.src.endsWith("up.gif")){
    that.title = "点击展开";
    that.src = that.src.replace("up.gif", "down.gif");
    document.all(area_name).style.display = "none";
  }
  else {
    that.title = "点击隐藏";
    that.src = that.src.replace("down.gif", "up.gif");
    document.all(area_name).style.display = "block";
  }
}

Array.prototype.sortByNumber = function(i, bAsc){
	var sortFun = function(param1,param2){
		try{
			var p1 = parseFloat(param1[i]);
			var p2 = parseFloat(param2[i]);
			
			if(p1 == p2) return 0;
			else if(p1 > p2) return 1;
			else if(p1 < p2) return -1;	
			
		}
		catch(ex){
		}
	}
	
	if (bAsc){ //正向排序
	  return this.sort(sortFun);
	}
	else {
	  var aaDest = new Array();
	  var iCurrPos = 0;
	  
	  var aaTemp = this.sort(sortFun);
	  for (var i = aaTemp.length - 1; i >=0; i--){
	    aaDest[iCurrPos] = aaTemp[i];
	    iCurrPos++;
	  }
	  
	  return aaDest;
	}
}

Array.prototype.sortByDate = function(i, bAsc){
	var sortFun = function(param1,param2){
		try{
			var p1 = new Date(param1[i]);
			var p2 = new Date(param2[i]);
			
			if(p1 == p2) return 0;
			else if(p1 > p2) return 1;
			else if(p1 < p2) return -1;
			
		}
		catch(ex){
		}
	}
	
	if (bAsc){ //正向排序
	  return this.sort(sortFun);
	}
	else {
	  var aaDest = new Array();
	  var iCurrPos = 0;
	  
	  var aaTemp = this.sort(sortFun);
	  for (var i = aaTemp.length - 1; i >=0; i--){
	    aaDest[iCurrPos] = aaTemp[i];
	    iCurrPos++;
	  }
	  
	  return aaDest;
	}
}

Array.prototype.sortByChar = function(i, bAsc){
	var sortFun = function(param1,param2){
		try{
			var p1 = param1[i];
			var p2 = param2[i];
			
			return p1.localeCompare(p2);
		}
		catch(ex){
		}
	}
  
	if (bAsc){ //正向排序
	  return this.sort(sortFun);
	}
	else {
	  var aaDest = new Array();
	  var iCurrPos = 0;
	  
	  var aaTemp = this.sort(sortFun);
	  for (var i = aaTemp.length - 1; i >=0; i--){
	    aaDest[iCurrPos] = aaTemp[i];
	    iCurrPos++;
	  }
	  
	  return aaDest;
	}
}

//删除数组元素 参数:dx 数组下标
Array.prototype.remove=function(dx){
  if(isNaN(dx)||dx>this.length){ //下标不是数字或者超出数组大小
    return false;
  }
  for(var i=0,n=0;i<this.length;i++)
  {
    if(this[i]!=this[dx])
    {
      this[n++]=this[i];
    }
  }
  this.length-=1;
}

//增加数组元素 参数:obj 增加的数组元素对象
Array.prototype.add=function(obj){
  if(obj==null){ //增加的数组元素为空
    return false;
  }
  this.length+=1;
  this[this.length-1] = obj;
}

//将数组转化为字符串
Array.prototype.toString=function(split_str){
  if(this.length<=0){ //数组没东东
    return "";
  }
  
  if (typeof(split_str) == "undefined")
    split_str = ";";
  
  var sReturnStr = "";
  for (var i=0; i<this.length; i++){
    sReturnStr += this[i] + split_str;
  }
  
  return sReturnStr.substr(0, sReturnStr.length - 1);
}

//@#=========================================================================================
//@# 以下定义String对象的常用操作
String.prototype.contains = function(textToCheck){
	return (this.indexOf(textToCheck) > -1) ;
}

String.prototype.startsWith = function(value){
	return (this.substr(0, value.length) == value) ;
}

String.prototype.endsWith = function(value, ignoreCase){
	var L1 = this.length ;
	var L2 = value.length ;
	
	if (L2 > L1)
		return false ;

	if (ignoreCase){
		var oRegex = new RegExp(value + '$' , 'i') ;
		return oRegex.test(this) ;
	}
	else
		return (L2 == 0 || this.substr(L1 - L2, L2) == value) ;
}

String.prototype.remove = function(start, length){
	var s = '' ;
	
	if (start > 0)
		s = this.substring(0, start) ;
	
	if (start + length < this.length)
		s += this.substring(start + length , this.length) ;
		
	return s ;
}

String.prototype.trim = function(){
	return this.replace(/(^\s*)|(\s*$)/g, '') ;
}

String.prototype.ltrim = function(){
	return this.replace(/^\s*/g, '') ;
}

String.prototype.rtrim = function(){
	return this.replace(/\s*$/g, '') ;
}

String.prototype.replaceNewLineChars = function(replacement){
	return this.replace(/\n/g, replacement) ;
}

String.prototype.isNumeric = function(){
	return this.match(/^[+-]?\d*[.]?\d*$/gi)!=null;
}

String.prototype.isInteger = function(){
	return this.match(/^[+-]?\d*$/gi)!=null;
}

String.prototype.isEmail = function(){
  if (this == ""){
    return true;
  }
  else {
	  return /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/.test(this); 
	}
}
//@#=========================================================================================
