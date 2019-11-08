<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setAttribute("home", request.getContextPath());
%>
<html>
<head>
<title>今日接待游客</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<jsp:include flush='true' page='../common/fpjs_inc.jsp'></jsp:include>

	<script type='text/javascript' src='${home}/dwr/interface/TouristResourceAction.js'></script>
</head>
<body>

<div id="wrapper">

	<div id="back">
         <div id="upperHalfBack">
         		<img src="${home}/images/fpjs/spacer.png" />
         		<img id="hoursUp8Back" class="imgclass" src="${home}/images/fpjs/Single/Up/AM/0.png" style="display: none;"/>
         		<img id="hoursUp7Back" class="imgclass" src="${home}/images/fpjs/Single/Up/AM/0.png" style="display: none;"/>
         		<img id="hoursUp6Back" class="imgclass" src="${home}/images/fpjs/Single/Up/AM/0.png" style="display: none;"/>
         		<img id="hoursUp5Back" class="imgclass" src="${home}/images/fpjs/Single/Up/AM/0.png" style="display: none;"/>
         		<img id="hoursUp4Back" class="imgclass" src="${home}/images/fpjs/Single/Up/AM/0.png" style="display: none;"/>
         		<img id="hoursUp3Back" class="imgclass" src="${home}/images/fpjs/Single/Up/AM/0.png" style="display: none;"/>
         		<img id="hoursUp2Back" class="imgclass" src="${home}/images/fpjs/Single/Up/AM/0.png" style="display: none;"/>
         		<img id="hoursUp1Back" class="imgclass" src="${home}/images/fpjs/Single/Up/AM/0.png" style="display: none;"/>
         		<img id="hoursUp0Back" class="imgclass" src="${home}/images/fpjs/Single/Up/AM/0.png" style="height: 32px"/>
         </div>
         <div id="lowerHalfBack">
         		<img src="${home}/images/fpjs/spacer.png" />
         		<img id="hoursDown8Back" class="imgclass" src="${home}/images/fpjs/Single/Down/AM/0.png"  style="display: none;"/>
         		<img id="hoursDown7Back" class="imgclass" src="${home}/images/fpjs/Single/Down/AM/0.png"  style="display: none;"/>
         		<img id="hoursDown6Back" class="imgclass" src="${home}/images/fpjs/Single/Down/AM/0.png"  style="display: none;"/>
         		<img id="hoursDown5Back" class="imgclass" src="${home}/images/fpjs/Single/Down/AM/0.png"  style="display: none;"/>
         		<img id="hoursDown4Back" class="imgclass" src="${home}/images/fpjs/Single/Down/AM/0.png"  style="display: none;"/>
         		<img id="hoursDown3Back" class="imgclass" src="${home}/images/fpjs/Single/Down/AM/0.png"  style="display: none;"/>
         		<img id="hoursDown2Back" class="imgclass" src="${home}/images/fpjs/Single/Down/AM/0.png"  style="display: none;"/>
         		<img id="hoursDown1Back" class="imgclass" src="${home}/images/fpjs/Single/Down/AM/0.png"  style="display: none;"/>
         		<img id="hoursDown0Back" class="imgclass" src="${home}/images/fpjs/Single/Down/AM/0.png" style="height: 32px" />
         </div>
	</div>
    
    <div id="front">
         <div id="upperHalf">
         		<img src="${home}/images/fpjs/spacer.png" />
         		<img id="hoursUp8" class="imgclass" src="${home}/images/fpjs/Single/Up/AM/0.png" style="display: none;"/>
         		<img id="hoursUp7" class="imgclass" src="${home}/images/fpjs/Single/Up/AM/0.png" style="display: none;"/>
         		<img id="hoursUp6" class="imgclass" src="${home}/images/fpjs/Single/Up/AM/0.png" style="display: none;"/>
         		<img id="hoursUp5" class="imgclass" src="${home}/images/fpjs/Single/Up/AM/0.png" style="display: none;"/>
         		<img id="hoursUp4" class="imgclass" src="${home}/images/fpjs/Single/Up/AM/0.png" style="display: none;"/>
         		<img id="hoursUp3" class="imgclass" src="${home}/images/fpjs/Single/Up/AM/0.png" style="display: none;"/>
         		<img id="hoursUp2" class="imgclass" src="${home}/images/fpjs/Single/Up/AM/0.png" style="display: none;"/>
         		<img id="hoursUp1" class="imgclass" src="${home}/images/fpjs/Single/Up/AM/0.png" style="display: none;"/>
         		<img id="hoursUp0" class="imgclass" src="${home}/images/fpjs/Single/Up/AM/0.png" style="height: 32px"/>
         </div>
         <div id="lowerHalf">
         		<img src="${home}/images/fpjs/spacer.png" />
         		<img id="hoursDown8" class="imgclass" src="${home}/images/fpjs/Single/Down/AM/0.png" style="display: none;"/>
         		<img id="hoursDown7" class="imgclass" src="${home}/images/fpjs/Single/Down/AM/0.png" style="display: none;"/>
         		<img id="hoursDown6" class="imgclass" src="${home}/images/fpjs/Single/Down/AM/0.png" style="display: none;"/>
         		<img id="hoursDown5" class="imgclass" src="${home}/images/fpjs/Single/Down/AM/0.png" style="display: none;"/>
         		<img id="hoursDown4" class="imgclass" src="${home}/images/fpjs/Single/Down/AM/0.png" style="display: none;"/>
         		<img id="hoursDown3" class="imgclass" src="${home}/images/fpjs/Single/Down/AM/0.png" style="display: none;"/>
        		<img id="hoursDown2" class="imgclass" src="${home}/images/fpjs/Single/Down/AM/0.png" style="display: none;"/>
        		<img id="hoursDown1" class="imgclass" src="${home}/images/fpjs/Single/Down/AM/0.png" style="display: none;"/>
         		<img id="hoursDown0" class="imgclass" src="${home}/images/fpjs/Single/Down/AM/0.png" style="height: 32px"/>
         </div>
	</div>  
</div>

<div id="awrapper">

	<div id="aback">
         <div id="aupperHalfBack">
         		<img src="${home}/images/fpjs/spacer.png" />
         		<img id="ahoursUp8Back" class="imgclass" src="${home}/images/fpjs/Single/Up/AM/0.png" style="display: none;"/>
         		<img id="ahoursUp7Back" class="imgclass" src="${home}/images/fpjs/Single/Up/AM/0.png" style="display: none;"/>
         		<img id="ahoursUp6Back" class="imgclass" src="${home}/images/fpjs/Single/Up/AM/0.png" style="display: none;"/>
         		<img id="ahoursUp5Back" class="imgclass" src="${home}/images/fpjs/Single/Up/AM/0.png" style="display: none;"/>
         		<img id="ahoursUp4Back" class="imgclass" src="${home}/images/fpjs/Single/Up/AM/0.png" style="display: none;"/>
         		<img id="ahoursUp3Back" class="imgclass" src="${home}/images/fpjs/Single/Up/AM/0.png" style="display: none;"/>
         		<img id="ahoursUp2Back" class="imgclass" src="${home}/images/fpjs/Single/Up/AM/0.png" style="display: none;"/>
         		<img id="ahoursUp1Back" class="imgclass" src="${home}/images/fpjs/Single/Up/AM/0.png" style="display: none;"/>
         		<img id="ahoursUp0Back" class="imgclass" src="${home}/images/fpjs/Single/Up/AM/0.png" style="height: 32px"/>
         </div>
         <div id="alowerHalfBack">
         		<img src="${home}/images/fpjs/spacer.png" />
         		<img id="ahoursDown8Back" class="imgclass" src="${home}/images/fpjs/Single/Down/AM/0.png"  style="display: none;"/>
         		<img id="ahoursDown7Back" class="imgclass" src="${home}/images/fpjs/Single/Down/AM/0.png"  style="display: none;"/>
         		<img id="ahoursDown6Back" class="imgclass" src="${home}/images/fpjs/Single/Down/AM/0.png"  style="display: none;"/>
         		<img id="ahoursDown5Back" class="imgclass" src="${home}/images/fpjs/Single/Down/AM/0.png"  style="display: none;"/>
         		<img id="ahoursDown4Back" class="imgclass" src="${home}/images/fpjs/Single/Down/AM/0.png"  style="display: none;"/>
         		<img id="ahoursDown3Back" class="imgclass" src="${home}/images/fpjs/Single/Down/AM/0.png"  style="display: none;"/>
         		<img id="ahoursDown2Back" class="imgclass" src="${home}/images/fpjs/Single/Down/AM/0.png"  style="display: none;"/>
         		<img id="ahoursDown1Back" class="imgclass" src="${home}/images/fpjs/Single/Down/AM/0.png"  style="display: none;"/>
         		<img id="ahoursDown0Back" class="imgclass" src="${home}/images/fpjs/Single/Down/AM/0.png" style="height: 32px" />
         </div>
	</div>
    
    <div id="afront">
         <div id="aupperHalf">
         		<img src="${home}/images/fpjs/spacer.png" />
         		<img id="ahoursUp8" class="imgclass" src="${home}/images/fpjs/Single/Up/AM/0.png" style="display: none;"/>
         		<img id="ahoursUp7" class="imgclass" src="${home}/images/fpjs/Single/Up/AM/0.png" style="display: none;"/>
         		<img id="ahoursUp6" class="imgclass" src="${home}/images/fpjs/Single/Up/AM/0.png" style="display: none;"/>
         		<img id="ahoursUp5" class="imgclass" src="${home}/images/fpjs/Single/Up/AM/0.png" style="display: none;"/>
         		<img id="ahoursUp4" class="imgclass" src="${home}/images/fpjs/Single/Up/AM/0.png" style="display: none;"/>
         		<img id="ahoursUp3" class="imgclass" src="${home}/images/fpjs/Single/Up/AM/0.png" style="display: none;"/>
         		<img id="ahoursUp2" class="imgclass" src="${home}/images/fpjs/Single/Up/AM/0.png" style="display: none;"/>
         		<img id="ahoursUp1" class="imgclass" src="${home}/images/fpjs/Single/Up/AM/0.png" style="display: none;"/>
         		<img id="ahoursUp0" class="imgclass" src="${home}/images/fpjs/Single/Up/AM/0.png" style="height: 32px"/>
         </div>
         <div id="alowerHalf">
         		<img src="${home}/images/fpjs/spacer.png" />
         		<img id="ahoursDown8" class="imgclass" src="${home}/images/fpjs/Single/Down/AM/0.png" style="display: none;"/>
         		<img id="ahoursDown7" class="imgclass" src="${home}/images/fpjs/Single/Down/AM/0.png" style="display: none;"/>
         		<img id="ahoursDown6" class="imgclass" src="${home}/images/fpjs/Single/Down/AM/0.png" style="display: none;"/>
         		<img id="ahoursDown5" class="imgclass" src="${home}/images/fpjs/Single/Down/AM/0.png" style="display: none;"/>
         		<img id="ahoursDown4" class="imgclass" src="${home}/images/fpjs/Single/Down/AM/0.png" style="display: none;"/>
         		<img id="ahoursDown3" class="imgclass" src="${home}/images/fpjs/Single/Down/AM/0.png" style="display: none;"/>
        		<img id="ahoursDown2" class="imgclass" src="${home}/images/fpjs/Single/Down/AM/0.png" style="display: none;"/>
        		<img id="ahoursDown1" class="imgclass" src="${home}/images/fpjs/Single/Down/AM/0.png" style="display: none;"/>
         		<img id="ahoursDown0" class="imgclass" src="${home}/images/fpjs/Single/Down/AM/0.png" style="height: 32px"/>
         </div>
	</div>  
</div>

</body>
<script type="text/javascript">
//旧的数值（现在显示的数值）
var str = "1";
var str1 = "2";
//最新数值（下个要显示的数值）
var newstr = "2";
var newstr1 = "4";
function start(){
	var chgid = "";
	addHtml(newstr,str,chgid);
	str = newstr;
	var sj = random(0,10);//获取随机变化数值
	var add = parseInt(str) +sj;
	newstr = add + "";

}
function start1(){
	var chgid = "a";
	addHtml(newstr1,str1,chgid);
	str1 = newstr1;
	var sj = random(0,10);//获取随机变化数值
	var add = parseInt(str1) +sj;
	newstr1 = add + "";
	
}

setInterval('start()', 5000);
setInterval('start1()', 5000);
</script>

</html>
