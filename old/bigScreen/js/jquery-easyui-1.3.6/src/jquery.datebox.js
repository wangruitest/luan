(function(c){function b(h){var g=c.data(h,"datebox");var f=g.options;c(h).addClass("datebox-f").combo(c.extend({},f,{onShowPanel:function(){i();d(h,c(h).datebox("getText"),true);f.onShowPanel.call(h)}}));c(h).combo("textbox").parent().addClass("datebox");if(!g.calendar){j()}d(h,f.value);function j(){var k=c(h).combo("panel").css("overflow","hidden");k.panel("options").onBeforeDestroy=function(){var t=c(this).find(".calendar-shared");if(t.length){t.insertBefore(t[0].pholder)}};var m=c('<div class="datebox-calendar-inner"></div>').appendTo(k);if(f.sharedCalendar){var q=c(f.sharedCalendar);if(!q[0].pholder){q[0].pholder=c('<div class="calendar-pholder" style="display:none"></div>').insertAfter(q)}q.addClass("calendar-shared").appendTo(m);if(!q.hasClass("calendar")){q.calendar()}g.calendar=q}else{g.calendar=c("<div></div>").appendTo(m).calendar()}c.extend(g.calendar.calendar("options"),{fit:true,border:false,onSelect:function(t){var u=c(this.target).datebox("options");d(this.target,u.formatter.call(this.target,t));c(this.target).combo("hidePanel");u.onSelect.call(h,t)}});var p=c('<div class="datebox-button"><table cellspacing="0" cellpadding="0" style="width:100%"><tr></tr></table></div>').appendTo(k);var r=p.find("tr");for(var o=0;o<f.buttons.length;o++){var n=c("<td></td>").appendTo(r);var l=f.buttons[o];var s=c('<a href="javascript:void(0)"></a>').html(c.isFunction(l.text)?l.text(h):l.text).appendTo(n);s.bind("click",{target:h,handler:l.handler},function(t){t.data.handler.call(this,t.data.target)})}r.find("td").css("width",(100/f.buttons.length)+"%")}function i(){var l=c(h).combo("panel");var m=l.children("div.datebox-calendar-inner");l.children()._outerWidth(l.width());g.calendar.appendTo(m);g.calendar[0].target=h;if(f.panelHeight!="auto"){var k=l.height();l.children().not(m).each(function(){k-=c(this).outerHeight()});m._outerHeight(k)}g.calendar.calendar("resize")}}function e(g,f){d(g,f,true)}function a(i){var g=c.data(i,"datebox");var f=g.options;var h=g.calendar.calendar("options").current;if(h){d(i,f.formatter.call(i,h));c(i).combo("hidePanel")}}function d(k,i,g){var h=c.data(k,"datebox");var f=h.options;var j=h.calendar;c(k).combo("setValue",i);j.calendar("moveTo",f.parser.call(k,i));if(!g){if(i){i=f.formatter.call(k,j.calendar("options").current);c(k).combo("setValue",i).combo("setText",i)}else{c(k).combo("setText",i)}}}c.fn.datebox=function(f,g){if(typeof f=="string"){var h=c.fn.datebox.methods[f];if(h){return h(this,g)}else{return this.combo(f,g)}}f=f||{};return this.each(function(){var i=c.data(this,"datebox");if(i){c.extend(i.options,f)}else{c.data(this,"datebox",{options:c.extend({},c.fn.datebox.defaults,c.fn.datebox.parseOptions(this),f)})}b(this)})};c.fn.datebox.methods={options:function(g){var f=g.combo("options");return c.extend(c.data(g[0],"datebox").options,{originalValue:f.originalValue,disabled:f.disabled,readonly:f.readonly})},calendar:function(f){return c.data(f[0],"datebox").calendar},setValue:function(g,f){return g.each(function(){d(this,f)})},reset:function(f){return f.each(function(){var g=c(this).datebox("options");c(this).datebox("setValue",g.originalValue)})}};c.fn.datebox.parseOptions=function(f){return c.extend({},c.fn.combo.parseOptions(f),c.parser.parseOptions(f,["sharedCalendar"]))};c.fn.datebox.defaults=c.extend({},c.fn.combo.defaults,{panelWidth:180,panelHeight:"auto",sharedCalendar:null,keyHandler:{up:function(f){},down:function(f){},left:function(f){},right:function(f){},enter:function(f){a(this)},query:function(f,g){e(this,f)}},currentText:"Today",closeText:"Close",okText:"Ok",buttons:[{text:function(f){return c(f).datebox("options").currentText},handler:function(f){c(f).datebox("calendar").calendar({year:new Date().getFullYear(),month:new Date().getMonth()+1,current:new Date()});a(f)}},{text:function(f){return c(f).datebox("options").closeText},handler:function(f){c(this).closest("div.combo-panel").panel("close")}}],formatter:function(g){var i=g.getFullYear();var f=g.getMonth()+1;var h=g.getDate();return f+"/"+h+"/"+i},parser:function(g){var f=Date.parse(g);if(!isNaN(f)){return new Date(f)}else{return new Date()}},onSelect:function(f){}})})(jQuery);