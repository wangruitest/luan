(function(a){function c(d){a(d).addClass("progressbar");a(d).html('<div class="progressbar-text"></div><div class="progressbar-value"><div class="progressbar-text"></div></div>');return a(d)}function b(g,d){var f=a.data(g,"progressbar").options;var e=a.data(g,"progressbar").bar;if(d){f.width=d}e._outerWidth(f.width)._outerHeight(f.height);e.find("div.progressbar-text").width(e.width());e.find("div.progressbar-text,div.progressbar-value").css({height:e.height()+"px",lineHeight:e.height()+"px"})}a.fn.progressbar=function(d,e){if(typeof d=="string"){var f=a.fn.progressbar.methods[d];if(f){return f(this,e)}}d=d||{};return this.each(function(){var g=a.data(this,"progressbar");if(g){a.extend(g.options,d)}else{g=a.data(this,"progressbar",{options:a.extend({},a.fn.progressbar.defaults,a.fn.progressbar.parseOptions(this),d),bar:c(this)})}a(this).progressbar("setValue",g.options.value);b(this)})};a.fn.progressbar.methods={options:function(d){return a.data(d[0],"progressbar").options},resize:function(e,d){return e.each(function(){b(this,d)})},getValue:function(d){return a.data(d[0],"progressbar").options.value},setValue:function(e,d){if(d<0){d=0}if(d>100){d=100}return e.each(function(){var g=a.data(this,"progressbar").options;var h=g.text.replace(/{value}/,d);var f=g.value;g.value=d;a(this).find("div.progressbar-value").width(d+"%");a(this).find("div.progressbar-text").html(h);if(f!=d){g.onChange.call(this,d,f)}})}};a.fn.progressbar.parseOptions=function(d){return a.extend({},a.parser.parseOptions(d,["width","height","text",{value:"number"}]))};a.fn.progressbar.defaults={width:"auto",height:22,value:0,text:"{value}%",onChange:function(e,d){}}})(jQuery);