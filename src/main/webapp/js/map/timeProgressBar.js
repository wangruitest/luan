/**
 * 时间播放进度条插件
 * 
 * @author chenxifu@funo.com.cn
 * @version 0.1
 * @since 2015-09-16
 */
function cusSetInterval(fRef, mDelay) {
	if (typeof fRef == "function") {
		var argu = Array.prototype.slice.call(arguments, 2);
		var f = (function() {
			fRef.apply(null, argu);
		});
		return setInterval(f, mDelay);
	}
	return setInterval(fRef, mDelay);
}

(function ($) {
	var timer=null;
	var obj=null;
	
    $.fn.extend({
        "timeProgressBar": function (options) {
            if (!isValid(options))
                return this;
            var opts = $.extend({}, defaults, options);
            defaults=opts;
            obj=this;
            $(this).find(".time-panel-date").text(defaults.dateText);
            $(this).find(".time-panel-time").text(defaults.timeText);
            for(var i=0;i<defaults.hourList.length;i++){
            	$(this).find(".time-panel-progress-text").append("<span class=\"time-panel-progress-tick\">"+defaults.hourList[i]+"</span>");
            }
            $(obj).find(".time-panel-btn").click(playBtnClick);
			if(opts.isAutoRePlay){
					rePlay();
			}
           
            //return this;
        }
    });
    
    //默认参数
    var defaults = {
    	dateText:'',
    	timeText:'',
		initLeft:2,//初始像素
		startPixel:3,//整点开始像素
		speed:500,//速度，表示跨越1个小时区间需要的时间，数值越大，运行速度越慢
		hourPixel:35,//小时跨度
		hourCount:7,//总演示小时数（暂时不可改变）
		hourList:["9","10","11","12","13","14","15","16"],//要显示的小时集合（暂时固定8个小时）
		overHourAction:null,//播放进度到达整点时需要执行的回调函数
		isAutoRePlay:false//是否自动重播
    };
    
    function playBtnClick(){
    	var isPlaying=$(obj).find(".time-panel-btn").attr("isplaying");
    	if(null!=isPlaying && isPlaying=="true"){
    		$(obj).find(".time-panel-btn").attr("isplaying","false");
    		$(obj).find(".time-panel-btn").removeClass().addClass("time-panel-btn");
    	}else{
    		$(obj).find(".time-panel-btn").attr("isplaying","true");
    		$(obj).find(".time-panel-btn").removeClass().addClass("time-panel-btn play");
    		goToPlay();
    	}
    }
    
    function init() {
    	$(obj).find(".time-panel-progress").css("left",defaults.initLeft+"px");
    	
    }
    
    function rePlay(){
    	init();
    	goToPlay();
    }
    
    function goToPlay(){
    	var pixelSpeed=parseInt(defaults.speed/defaults.hourPixel);
    	timer=cusSetInterval($.fn.timeProgressBar.play, pixelSpeed,obj,defaults,overAllTime);
    }
    
    function overAllTime(){
    	clearInterval(timer); 
		timer=null;
		runs=0;
		rePlay();
    }
    
    function pause(){
    	clearInterval(timer); 
    	timer=null;
    }
    
    $.fn.timeProgressBar.play = function (obj,opts,overAlltimeBack) {
    	//到达右顶端（7小时）
    	var left=parseInt($(obj).find(".time-panel-progress").css("left"));
    	if(left==(opts.hourCount*opts.hourPixel+opts.startPixel+1)){
			
    		overAlltimeBack();
    		return;
    	}
    	
    	//是否暂停
    	var isplaying=$(obj).find(".time-panel-btn").attr("isplaying");
    	if(null!=isplaying && isplaying!="true"){
    		pause();
    		return;
    	}
    	
    	//向右移动1像素
    	left+=1;
    	$(obj).find(".time-panel-progress").css("left",left+"px");
    	//判断是否到达整点
    	if((left-opts.startPixel)%opts.hourPixel==0){
    		var hourIndex=(left-opts.startPixel)/opts.hourPixel;
    		if(null!=opts.overHourAction){
    			opts.overHourAction(hourIndex);
    		}
    	}
    };
    
    $.fn.timeProgressBar.pause = function () {
    	
    };
    
    function isValid(options) {
        return !options || (options && typeof options === "object") ? true : false;
    }
})(window.jQuery);