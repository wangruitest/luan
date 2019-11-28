(function(d){function i(l){d(l).addClass("numberbox numberbox-f");var j=d('<input type="hidden">').insertAfter(l);var k=d(l).attr("name");if(k){j.attr("name",k);d(l).removeAttr("name").attr("numberboxName",k)}return j}function h(k){var j=d.data(k,"numberbox").options;var l=j.onChange;j.onChange=function(){};g(k,j.parser.call(k,j.value));j.onChange=l;j.originalValue=f(k)}function e(n,l){var k=d.data(n,"numberbox").options;if(l){k.width=l}var m=d(n);var j=d('<div style="display:none"></div>').insertBefore(m);m.appendTo("body");if(isNaN(k.width)){k.width=m.outerWidth()}m._outerWidth(k.width)._outerHeight(k.height);m.css("line-height",m.height()+"px");m.insertAfter(j);j.remove()}function f(j){return d.data(j,"numberbox").field.val()}function g(n,m){var l=d.data(n,"numberbox");var k=l.options;var j=f(n);m=k.parser.call(n,m);k.value=m;l.field.val(m);d(n).val(k.formatter.call(n,m));if(j!=m){k.onChange.call(n,m,j)}}function b(k){var j=d.data(k,"numberbox").options;d(k).unbind(".numberbox").bind("keypress.numberbox",function(l){return j.filter.call(k,l)}).bind("blur.numberbox",function(){g(k,d(this).val());d(this).val(j.formatter.call(k,f(k)))}).bind("focus.numberbox",function(){var l=f(k);if(l!=j.parser.call(k,d(this).val())){d(this).val(j.formatter.call(k,l))}})}function a(k){if(d.fn.validatebox){var j=d.data(k,"numberbox").options;d(k).validatebox(j)}}function c(l,k){var j=d.data(l,"numberbox").options;if(k){j.disabled=true;d(l).attr("disabled",true)}else{j.disabled=false;d(l).removeAttr("disabled")}}d.fn.numberbox=function(l,j){if(typeof l=="string"){var k=d.fn.numberbox.methods[l];if(k){return k(this,j)}else{return this.validatebox(l,j)}}l=l||{};return this.each(function(){var m=d.data(this,"numberbox");if(m){d.extend(m.options,l)}else{m=d.data(this,"numberbox",{options:d.extend({},d.fn.numberbox.defaults,d.fn.numberbox.parseOptions(this),l),field:i(this)});d(this).removeAttr("disabled");d(this).css({imeMode:"disabled"})}c(this,m.options.disabled);e(this);b(this);a(this);h(this)})};d.fn.numberbox.methods={options:function(j){return d.data(j[0],"numberbox").options},destroy:function(j){return j.each(function(){d.data(this,"numberbox").field.remove();d(this).validatebox("destroy");d(this).remove()})},resize:function(k,j){return k.each(function(){e(this,j)})},disable:function(j){return j.each(function(){c(this,true)})},enable:function(j){return j.each(function(){c(this,false)})},fix:function(j){return j.each(function(){g(this,d(this).val())})},setValue:function(k,j){return k.each(function(){g(this,j)})},getValue:function(j){return f(j[0])},clear:function(j){return j.each(function(){var k=d.data(this,"numberbox");k.field.val("");d(this).val("")})},reset:function(j){return j.each(function(){var k=d(this).numberbox("options");d(this).numberbox("setValue",k.originalValue)})}};d.fn.numberbox.parseOptions=function(k){var j=d(k);return d.extend({},d.fn.validatebox.parseOptions(k),d.parser.parseOptions(k,["width","height","decimalSeparator","groupSeparator","suffix",{min:"number",max:"number",precision:"number"}]),{prefix:(j.attr("prefix")?j.attr("prefix"):undefined),disabled:(j.attr("disabled")?true:undefined),value:(j.val()||undefined)})};d.fn.numberbox.defaults=d.extend({},d.fn.validatebox.defaults,{width:"auto",height:22,disabled:false,value:"",min:null,max:null,precision:0,decimalSeparator:".",groupSeparator:"",prefix:"",suffix:"",filter:function(k){var j=d(this).numberbox("options");if(k.which==45){return(d(this).val().indexOf("-")==-1?true:false)}var l=String.fromCharCode(k.which);if(l==j.decimalSeparator){return(d(this).val().indexOf(l)==-1?true:false)}else{if(l==j.groupSeparator){return true}else{if((k.which>=48&&k.which<=57&&k.ctrlKey==false&&k.shiftKey==false)||k.which==0||k.which==8){return true}else{if(k.ctrlKey==true&&(k.which==99||k.which==118)){return true}else{return false}}}}},formatter:function(m){if(!m){return m}m=m+"";var k=d(this).numberbox("options");var l=m,j="";var n=m.indexOf(".");if(n>=0){l=m.substring(0,n);j=m.substring(n+1,m.length)}if(k.groupSeparator){var o=/(\d+)(\d{3})/;while(o.test(l)){l=l.replace(o,"$1"+k.groupSeparator+"$2")}}if(j){return k.prefix+l+k.decimalSeparator+j+k.suffix}else{return k.prefix+l+k.suffix}},parser:function(j){j=j+"";var k=d(this).numberbox("options");if(parseFloat(j)!=j){if(k.prefix){j=d.trim(j.replace(new RegExp("\\"+d.trim(k.prefix),"g"),""))}if(k.suffix){j=d.trim(j.replace(new RegExp("\\"+d.trim(k.suffix),"g"),""))}if(k.groupSeparator){j=d.trim(j.replace(new RegExp("\\"+k.groupSeparator,"g"),""))}if(k.decimalSeparator){j=d.trim(j.replace(new RegExp("\\"+k.decimalSeparator,"g"),"."))}j=j.replace(/\s/g,"")}var l=parseFloat(j).toFixed(k.precision);if(isNaN(l)){l=""}else{if(typeof(k.min)=="number"&&l<k.min){l=k.min.toFixed(k.precision)}else{if(typeof(k.max)=="number"&&l>k.max){l=k.max.toFixed(k.precision)}}}return l},onChange:function(k,j){}})})(jQuery);