(function(d){var l=0;function m(s,r){var q=d.data(s,"combobox");var o=q.options;var p=q.data;for(var n=0;n<p.length;n++){if(p[n][o.valueField]==r){return n}}return -1}function g(s,r){var q=d.data(s,"combobox").options;var n=d(s).combo("panel");var p=q.finder.getEl(s,r);if(p.length){if(p.position().top<=0){var o=n.scrollTop()+p.position().top;n.scrollTop(o)}else{if(p.position().top+p.outerHeight()>n.height()){var o=n.scrollTop()+p.position().top+p.outerHeight()-n.height();n.scrollTop(o)}}}}function a(t,p){var r=d.data(t,"combobox").options;var n=d(t).combobox("panel");var q=n.children("div.combobox-item-hover");if(!q.length){q=n.children("div.combobox-item-selected")}q.removeClass("combobox-item-hover");var s="div.combobox-item:visible:not(.combobox-item-disabled):first";var o="div.combobox-item:visible:not(.combobox-item-disabled):last";if(!q.length){q=n.children(p=="next"?s:o)}else{if(p=="next"){q=q.nextAll(s);if(!q.length){q=n.children(s)}}else{q=q.prevAll(s);if(!q.length){q=n.children(o)}}}if(q.length){q.addClass("combobox-item-hover");var u=r.finder.getRow(t,q);if(u){g(t,u[r.valueField]);if(r.selectOnNavigation){k(t,u[r.valueField])}}}}function k(q,p){var o=d.data(q,"combobox").options;var n=d(q).combo("getValues");if(d.inArray(p+"",n)==-1){if(o.multiple){n.push(p)}else{n=[p]}i(q,n);o.onSelect.call(q,o.finder.getRow(q,p))}}function b(r,q){var p=d.data(r,"combobox").options;var n=d(r).combo("getValues");var o=d.inArray(q+"",n);if(o>=0){n.splice(o,1);i(r,n);p.onUnselect.call(r,p.finder.getRow(r,q))}}function i(r,w,q){var n=d.data(r,"combobox").options;var o=d(r).combo("panel");o.find("div.combobox-item-selected").removeClass("combobox-item-selected");var t=[],z=[];for(var p=0;p<w.length;p++){var u=w[p];var y=u;n.finder.getEl(r,u).addClass("combobox-item-selected");var x=n.finder.getRow(r,u);if(x){y=x[n.textField]}t.push(u);z.push(y)}d(r).combo("setValues",t);if(!q){d(r).combo("setText",z.join(n.separator))}}function f(w,r,t){var o=d.data(w,"combobox");var n=o.options;o.data=n.loadFilter.call(w,r);o.groups=[];r=o.data;var p=d(w).combobox("getValues");var z=[];var y=undefined;for(var q=0;q<r.length;q++){var C=r[q];var x=C[n.valueField]+"";var B=C[n.textField];var u=C[n.groupField];if(u){if(y!=u){y=u;o.groups.push(u);z.push('<div id="'+(o.groupIdPrefix+"_"+(o.groups.length-1))+'" class="combobox-group">');z.push(n.groupFormatter?n.groupFormatter.call(w,u):u);z.push("</div>")}}else{y=undefined}var A="combobox-item"+(C.disabled?" combobox-item-disabled":"")+(u?" combobox-gitem":"");z.push('<div id="'+(o.itemIdPrefix+"_"+q)+'" class="'+A+'">');z.push(n.formatter?n.formatter.call(w,C):B);z.push("</div>");if(C.selected&&d.inArray(x,p)==-1){p.push(x)}}d(w).combo("panel").html(z.join(""));if(n.multiple){i(w,p,t)}else{i(w,p.length?[p[p.length-1]]:[],t)}n.onLoadSuccess.call(w,r)}function c(q,n,r,p){var o=d.data(q,"combobox").options;if(n){o.url=n}r=r||{};if(o.onBeforeLoad.call(q,r)==false){return}o.loader.call(q,r,function(s){f(q,s,p)},function(){o.onLoadError.apply(this,arguments)})}function j(v,u){var t=d.data(v,"combobox");var p=t.options;if(p.multiple&&!u){i(v,[],true)}else{i(v,[u],true)}if(p.mode=="remote"){c(v,null,{q:u},true)}else{var n=d(v).combo("panel");n.find("div.combobox-item-selected,div.combobox-item-hover").removeClass("combobox-item-selected combobox-item-hover");n.find("div.combobox-item,div.combobox-group").hide();var s=t.data;var r=[];var o=p.multiple?u.split(p.separator):[u];d.map(o,function(B){B=d.trim(B);var C=undefined;for(var x=0;x<s.length;x++){var D=s[x];if(p.filter.call(v,B,D)){var w=D[p.valueField];var y=D[p.textField];var A=D[p.groupField];var z=p.finder.getEl(v,w).show();if(y.toLowerCase()==B.toLowerCase()){r.push(w);z.addClass("combobox-item-selected")}if(p.groupField&&C!=A){d("#"+t.groupIdPrefix+"_"+d.inArray(A,t.groups)).show();C=A}}}});i(v,r,true)}}function h(u){var o=d(u);var q=o.combobox("options");var n=o.combobox("panel");var p=n.children("div.combobox-item-hover");if(p.length){var v=q.finder.getRow(u,p);var s=v[q.valueField];if(q.multiple){if(p.hasClass("combobox-item-selected")){o.combobox("unselect",s)}else{o.combobox("select",s)}}else{o.combobox("select",s)}}var r=[];d.map(o.combobox("getValues"),function(t){if(m(u,t)>=0){r.push(t)}});o.combobox("setValues",r);if(!q.multiple){o.combobox("hidePanel")}}function e(p){var o=d.data(p,"combobox");var n=o.options;l++;o.itemIdPrefix="_easyui_combobox_i"+l;o.groupIdPrefix="_easyui_combobox_g"+l;d(p).addClass("combobox-f");d(p).combo(d.extend({},n,{onShowPanel:function(){d(p).combo("panel").find("div.combobox-item,div.combobox-group").show();g(p,d(p).combobox("getValue"));n.onShowPanel.call(p)}}));d(p).combo("panel").unbind().bind("mouseover",function(r){d(this).children("div.combobox-item-hover").removeClass("combobox-item-hover");var q=d(r.target).closest("div.combobox-item");if(!q.hasClass("combobox-item-disabled")){q.addClass("combobox-item-hover")}r.stopPropagation()}).bind("mouseout",function(q){d(q.target).closest("div.combobox-item").removeClass("combobox-item-hover");q.stopPropagation()}).bind("click",function(s){var q=d(s.target).closest("div.combobox-item");if(!q.length||q.hasClass("combobox-item-disabled")){return}var t=n.finder.getRow(p,q);if(!t){return}var r=t[n.valueField];if(n.multiple){if(q.hasClass("combobox-item-selected")){b(p,r)}else{k(p,r)}}else{k(p,r);d(p).combo("hidePanel")}s.stopPropagation()})}d.fn.combobox=function(n,o){if(typeof n=="string"){var p=d.fn.combobox.methods[n];if(p){return p(this,o)}else{return this.combo(n,o)}}n=n||{};return this.each(function(){var r=d.data(this,"combobox");if(r){d.extend(r.options,n);e(this)}else{r=d.data(this,"combobox",{options:d.extend({},d.fn.combobox.defaults,d.fn.combobox.parseOptions(this),n),data:[]});e(this);var q=d.fn.combobox.parseData(this);if(q.length){f(this,q)}}if(r.options.data){f(this,r.options.data)}c(this)})};d.fn.combobox.methods={options:function(o){var n=o.combo("options");return d.extend(d.data(o[0],"combobox").options,{originalValue:n.originalValue,disabled:n.disabled,readonly:n.readonly})},getData:function(n){return d.data(n[0],"combobox").data},setValues:function(o,n){return o.each(function(){i(this,n)})},setValue:function(o,n){return o.each(function(){i(this,[n])})},clear:function(n){return n.each(function(){d(this).combo("clear");var o=d(this).combo("panel");o.find("div.combobox-item-selected").removeClass("combobox-item-selected")})},reset:function(n){return n.each(function(){var o=d(this).combobox("options");if(o.multiple){d(this).combobox("setValues",o.originalValue)}else{d(this).combobox("setValue",o.originalValue)}})},loadData:function(o,n){return o.each(function(){f(this,n)})},reload:function(o,n){return o.each(function(){c(this,n)})},select:function(o,n){return o.each(function(){k(this,n)})},unselect:function(o,n){return o.each(function(){b(this,n)})}};d.fn.combobox.parseOptions=function(o){var n=d(o);return d.extend({},d.fn.combo.parseOptions(o),d.parser.parseOptions(o,["valueField","textField","groupField","mode","method","url"]))};d.fn.combobox.parseData=function(q){var p=[];var o=d(q).combobox("options");d(q).children().each(function(){if(this.tagName.toLowerCase()=="optgroup"){var r=d(this).attr("label");d(this).children().each(function(){n(this,r)})}else{n(this)}});return p;function n(s,u){var r=d(s);var v={};v[o.valueField]=r.attr("value")!=undefined?r.attr("value"):r.text();v[o.textField]=r.text();v.selected=r.is(":selected");v.disabled=r.is(":disabled");if(u){o.groupField=o.groupField||"group";v[o.groupField]=u}p.push(v)}};d.fn.combobox.defaults=d.extend({},d.fn.combo.defaults,{valueField:"value",textField:"text",groupField:null,groupFormatter:function(n){return n},mode:"local",method:"post",url:null,data:null,keyHandler:{up:function(n){a(this,"prev");n.preventDefault()},down:function(n){a(this,"next");n.preventDefault()},left:function(n){},right:function(n){},enter:function(n){h(this)},query:function(n,o){j(this,n)}},filter:function(o,p){var n=d(this).combobox("options");return p[n.textField].toLowerCase().indexOf(o.toLowerCase())==0},formatter:function(o){var n=d(this).combobox("options");return o[n.textField]},loader:function(q,p,n){var o=d(this).combobox("options");if(!o.url){return false}d.ajax({type:o.method,url:o.url,data:q,dataType:"json",success:function(r){p(r)},error:function(){n.apply(this,arguments)}})},loadFilter:function(n){return n},finder:{getEl:function(p,o){var n=m(p,o);var q=d.data(p,"combobox").itemIdPrefix+"_"+n;return d("#"+q)},getRow:function(r,q){var o=d.data(r,"combobox");var n=(q instanceof jQuery)?q.attr("id").substr(o.itemIdPrefix.length+1):m(r,q);return o.data[parseInt(n)]}},onBeforeLoad:function(n){},onLoadSuccess:function(){},onLoadError:function(){},onSelect:function(n){},onUnselect:function(n){}})})(jQuery);