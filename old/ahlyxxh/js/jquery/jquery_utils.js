/**
 * 设置input,textarea,select disabled属性
 */
function setFieldSleep(obj){
	$(obj).find('input,textarea,select,textarea').attr('disabled',true);
}
/**
 * 设置input,textarea,select ReadOnly属性
 */
function setFieldReadOnly(obj){
	$(obj).find('input,textarea,textarea').attr('readonly','readonly');
}
/**
 * 移除input,textarea,select disabled属性
 */
function setFieldWeekUp(obj){
	$(obj).find('input,textarea,select').removeAttr('disabled');
	$(obj).find('.disabled').attr('disabled',true);
}
/**
 * 清空input,textarea,select,label
 */
function setFieldClear(obj){
	$(obj).find('input[type!="radio"],textarea,select').val('');
	$(obj).find('label').html('');
}
/*js实现sleep功能 单位：毫秒*/
function sleep(numberMillis) {
    var now = new Date();
    var exitTime = now.getTime() + numberMillis;
    while (true) {
        now = new Date();
        if (now.getTime() > exitTime)
            return;
    }
}
/**
 * 获取对象指定字段属性
 */
function getObjValue(obj,fieldName){
	var value = null;
	eval("value=obj."+fieldName);
	if(!value && value!=0){
		value=""
	}
	//alert(name+":"+value);
	return value;
}

/**
 * 用于在IE6下隐藏select标签
 * @return
 */
function ie6SelectHide() {
	if ( $.browser.msie && $.browser.version==6.0){//这里只有IE6才用在显示dialog的时候隐藏select元素...
		$("select").each(function(){
			if( !this.ie6 ) {
				this.ie6 = 1;
				$(this).hide();
			} else {
				this.ie6 = Number(this.ie6)+1;
			}//if
		});
	}//if
	window.scroll(0,0);
}

/**
 * 用于在IE6下恢复被隐藏的select标签
 * @return
 */
function ie6SelectShow() {
	if ( $.browser.msie && $.browser.version==6.0){
		$("select").each(function(){
			if( this.ie6 ) {
				this.ie6 = Number(this.ie6)-1;
			}//if
			if( !this.ie6 ) {
				$(this).show();
			}//if
		});
	}//if
	window.scroll(0,0);
}

