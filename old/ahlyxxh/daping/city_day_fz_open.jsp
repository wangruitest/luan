 <html>
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <TITLE>福州市日概览</TITLE>   
 <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery/jquery-1.8.1.min.js"></script>  
 <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery/fullScreenApi.js"></script> 
 <SCRIPT language="JavaScript"> 
 	$(function(){
	    $('#fullscreenbtn').click(goToFull);
	});
 	function goToFull(){
        if(window.fullScreenApi.supportsFullScreen){
            window.fullScreenApi.requestFullScreen(document.getElementById('fz618Detail'));
        }else{
            alert('当前浏览器不支持完全全屏功能，请使用360(极速模式)或谷歌浏览器，谢谢！');
        }
    }
 </script>
 <body>
<br/>
<br/>
<div id="fullscreenbtn" style="text-align: center;">
	<font color="red"><b>请再次点击下面的图片切换到全屏模式！</b><br/><br/></font>
    <img id="fullscreenbox" style="width: 726px;height: 380px;" src="<%=request.getContextPath() %>/daping/images/city_day_fz.png" alt="点击切换到全屏" />
</div>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<iframe id="fz618Detail" style="width: 100%" src="<%=request.getContextPath() %>/daping/city_day_view.jsp?cityCode=591"></iframe>

</BODY>
 </HTML>