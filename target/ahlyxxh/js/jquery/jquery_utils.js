/**
 * ����input,textarea,select disabled����
 */
function setFieldSleep(obj){
	$(obj).find('input,textarea,select,textarea').attr('disabled',true);
}
/**
 * ����input,textarea,select ReadOnly����
 */
function setFieldReadOnly(obj){
	$(obj).find('input,textarea,textarea').attr('readonly','readonly');
}
/**
 * �Ƴ�input,textarea,select disabled����
 */
function setFieldWeekUp(obj){
	$(obj).find('input,textarea,select').removeAttr('disabled');
	$(obj).find('.disabled').attr('disabled',true);
}
/**
 * ���input,textarea,select,label
 */
function setFieldClear(obj){
	$(obj).find('input[type!="radio"],textarea,select').val('');
	$(obj).find('label').html('');
}
/*jsʵ��sleep���� ��λ������*/
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
 * ��ȡ����ָ���ֶ�����
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
 * ������IE6������select��ǩ
 * @return
 */
function ie6SelectHide() {
	if ( $.browser.msie && $.browser.version==6.0){//����ֻ��IE6��������ʾdialog��ʱ������selectԪ��...
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
 * ������IE6�»ָ������ص�select��ǩ
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

