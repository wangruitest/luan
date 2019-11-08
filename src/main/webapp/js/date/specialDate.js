/**
 * 特殊日期——2月29日处理
 */
function isSpecDate(time) {
	
			//alert("事件判断"+time.M);
			//var timeValue=time.M+'-'+time.d;
 			if(time.M==2&&time.d==29){
 			$("#showTb").attr("checked",false).attr("disabled","disabled");
 				}
 			else{
 			$('#showTb').removeAttr("disabled");
 				};
		}
		
function loseFocus(time) {
			time.blur();
		}


function isBigger(time){
	
}