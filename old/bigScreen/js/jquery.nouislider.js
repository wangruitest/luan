(function(b,a){b.fn.noUiSlider=function(e){var n=".nui",c=b(document),k={start:"mousedown"+n+" touchstart"+n,move:"mousemove"+n+" touchmove"+n,end:"mouseup"+n+" touchend"+n},j=b.fn.val,h=["noUi-base","noUi-origin","noUi-handle","noUi-input","noUi-active","noUi-state-tap","noUi-target","-lower","-upper","noUi-connect","noUi-vertical","noUi-horizontal","handles","noUi-background","noUi-z-index"],z={base:[h[0]],origin:[h[1]],handle:[h[2]]},m={to:function(B,C){C=B[0]<0?C+Math.abs(B[0]):C-B[0];return(C*100)/this.len(B)},from:function(B,C){return(C*100)/this.len(B)},is:function(B,C){return((C*this.len(B))/100)+B[0]},len:function(B){return(B[0]>B[1]?B[0]-B[1]:B[1]-B[0])}};if(window.navigator.msPointerEnabled){k={start:"MSPointerDown"+n,move:"MSPointerMove"+n,end:"MSPointerUp"+n}}function i(B){B.stopPropagation()}function x(D,C,B){if(!b.isArray(D)){D=[D]}b.each(D,function(E,F){if(typeof F==="function"){F.call(C,B)}})}function q(B){return(B.data.base.data("target").is('[class*="noUi-state-"], [disabled]'))}function y(F,E){if(E){F.preventDefault()}var C=F,I=F.type.indexOf("touch")===0,D=F.type.indexOf("mouse")===0,G=F.type.indexOf("MSPointer")===0,B,H;F=F.originalEvent;if(I){B=F.changedTouches[0].pageX;H=F.changedTouches[0].pageY}if(D||G){if(!G&&window.pageXOffset===a){window.pageXOffset=document.documentElement.scrollLeft;window.pageYOffset=document.documentElement.scrollTop}B=F.clientX+window.pageXOffset;H=F.clientY+window.pageYOffset}return{pass:C.data,e:F,x:B,y:H}}function t(B){return parseFloat(this.style[B])}function w(F,G){function D(H){return !isNaN(H)&&isFinite(H)}function C(H){return(H instanceof b||typeof H==="string"||H===false)}var E={handles:{r:true,t:function(I,H){H=parseInt(H,10);return(H===1||H===2)}},range:{r:true,t:function(J,I,H){if(I.length!==2){return false}I=[parseFloat(I[0]),parseFloat(I[1])];if(!D(I[0])||!D(I[1])){return false}if(H==="range"&&I[0]===I[1]){return false}if(I[1]<I[0]){return false}J[H]=I;return true}},start:{r:true,t:function(J,I,H){if(J.handles===1){if(b.isArray(I)){I=I[0]}I=parseFloat(I);J.start=[I];return D(I)}return this.parent.range.t(J,I,H)}},connect:{t:function(I,H){return(H===true||H===false||(H==="lower"&&I.handles===1)||(H==="upper"&&I.handles===1))}},orientation:{t:function(I,H){return(H==="horizontal"||H==="vertical")}},margin:{r:true,t:function(J,I,H){I=parseFloat(I);J[H]=I;return D(I)}},serialization:{r:true,t:function(I,H){if(!H.resolution){I.serialization.resolution=0.01}else{switch(H.resolution){case 1:case 0.1:case 0.01:case 0.001:case 0.0001:case 0.00001:break;default:return false}}if(!H.mark){I.serialization.mark="."}else{return(H.mark==="."||H.mark===",")}if(H.to){if(I.handles===1){if(!b.isArray(H.to)){H.to=[H.to]}I.serialization.to=H.to;return C(H.to[0])}return(H.to.length===2&&C(H.to[0])&&C(H.to[1]))}return false}},slide:{t:function(I,H){return typeof H==="function"}},set:{t:function(I,H){return this.parent.slide.t(I,H)}},step:{t:function(J,I,H){return this.parent.margin.t(J,I,H)}},init:function(){var H=this;b.each(H,function(I,J){J.parent=H});delete this.init;return this}},B=E.init();b.each(B,function(I,H){if((H.r&&(!F[I]&&F[I]!==0))||((F[I]||F[I]===0)&&!H.t(F,F[I],I))){if(console&&console.log){console.log("Slider:\t\t\t",G,"\nOption:\t\t\t",I,"\nValue:\t\t\t",F[I])}b.error("Error on noUiSlider initialisation.");return false}})}function o(B,C){return Math.round(B/C)*C}function u(B,C){B=B.toFixed(C.data("decimals"));return B.replace(".",C.data("mark"))}function p(G,H,D){var F=G.data("nui").options,C=G.data("nui").base.data(h[12]),E=G.data("nui").style,B;if(!b.isNumeric(H)){return false}if(H===G[0].gPct(E)){return false}H=H<0?0:H>100?100:H;if(F.step&&!D){H=o(H,m.from(F.range,F.step))}if(H===G[0].gPct(E)){return false}if(G.siblings("."+h[1]).length&&!D&&C){if(G.data("nui").number){B=C[0][0].gPct(E)+F.margin;H=H<B?B:H}else{B=C[1][0].gPct(E)-F.margin;H=H>B?B:H}if(H===G[0].gPct(E)){return false}}if(G.data("nui").number===0&&H>95){G.addClass(h[14])}else{G.removeClass(h[14])}G.css(E,H+"%");G.data("store").val(u(m.is(F.range,H),G.data("nui").target));return true}function g(D,C){var B=D.data("nui").number;if(C.to[B] instanceof b){return C.to[B].data({target:D.data("nui").target,handle:D}).on("change"+n+" blur"+n,function(){var E=[null,null];E[B]=b(this).val();b(this).data("target").val(E,{trusted:false})}).on("change"+n,function(){x(b(this).data("handle").data("nui").options.set,b(this).data("target"))})}if(typeof C.to[B]==="string"){return b('<input type="hidden" class="'+h[3]+'" name="'+C.to[B]+'">').appendTo(D).change(i)}if(C.to[B]===false){return{val:function(E){if(E===a){return this.handleElement.data("nui-val")}this.handleElement.data("nui-val",E)},hasClass:function(){return false},handleElement:D}}}function r(E){E=y(E,true);if(!E){return}var F=E.pass.base,C=F.data("style"),B=E.x-E.pass.startEvent.x,D=C==="left"?F.width():F.height();if(C==="top"){B=E.y-E.pass.startEvent.y}B=E.pass.position+((B*100)/D);p(E.pass.handle,B);x(F.data("options").slide,F.data("target"))}function d(B){if(q(B)){return}var D=B.data.base,C=B.data.handle;C.children().removeClass(h[4]);c.off(k.move);c.off(k.end);b("body").off(n);D.data("target").change();x(C.data("nui").options.set,D.data("target"))}function f(C){if(q(C)){return}C=y(C,true);if(!C){return}var D=C.pass.handle,B=D[0].gPct(D.data("nui").style);D.children().addClass(h[4]);c.on(k.move,{startEvent:C,position:B,base:C.pass.base,handle:D},r);c.on(k.end,{base:C.pass.base,handle:D},d);b("body").on("selectstart"+n,function(){return false})}function s(B){d({data:{base:B.data.base,handle:B.data.handle}});B.stopPropagation()}function v(B){if(q(B)||B.data.base.find("."+h[4]).length){return}B=y(B);if(!B){return}var G,I,H,D=B.pass.base,J=B.pass.handles,C=D.data("style"),E=B[C==="left"?"x":"y"],K=C==="left"?D.width():D.height(),F={handles:[],base:{left:D.offset().left,top:D.offset().top}};for(G=0;G<J.length;G++){F.handles.push({left:J[G].offset().left,top:J[G].offset().top})}H=J.length===1?0:((F.handles[0][C]+F.handles[1][C])/2);if(J.length===1||E<H){I=J[0]}else{I=J[1]}D.addClass(h[5]);setTimeout(function(){D.removeClass(h[5])},300);p(I,(((E-F.base[C])*100)/K));x([I.data("nui").options.slide,I.data("nui").options.set],D.data("target"));D.data("target").change()}function l(){return this.each(function(G,H){H=b(H);H.addClass(h[6]);var E,B,D,F,C=b("<div/>").appendTo(H),I=[],J={base:z.base,origin:[z.origin.concat([h[1]+h[7]]),z.origin.concat([h[1]+h[8]])],handle:[z.handle.concat([h[2]+h[7]]),z.handle.concat([h[2]+h[8]])]};e=b.extend({handles:2,margin:0,orientation:"horizontal"},e)||{};if(!e.serialization){e.serialization={to:[false,false],resolution:0.01,mark:"."}}w(e,H);e.S=e.serialization;if(e.connect){if(e.connect==="lower"){J.base.push(h[9],h[9]+h[7]);J.origin[0].push(h[13])}else{J.base.push(h[9]+h[8],h[13]);J.origin[0].push(h[9])}}else{J.base.push(h[13])}B=e.orientation==="vertical"?"top":"left";D=e.S.resolution.toString().split(".");D=D[0]==="1"?0:D[1].length;if(e.orientation==="vertical"){J.base.push(h[10])}else{J.base.push(h[11])}C.addClass(J.base.join(" ")).data("target",H);H.data({base:C,mark:e.S.mark,decimals:D});for(E=0;E<e.handles;E++){F=b("<div><div/></i>").appendTo(C);F.addClass(J.origin[E].join(" "));F.children().addClass(J.handle[E].join(" "));F.children().on(k.start,{base:C,handle:F},f).on(k.end,{base:C,handle:F},s);F.data("nui",{target:H,decimals:D,options:e,base:C,style:B,number:E}).data("store",g(F,e.S));F[0].gPct=t;I.push(F);p(F,m.to(e.range,e.start[E]))}C.data({options:e,handles:I,style:B});H.data({handles:I});C.on(k.end,{base:C,handles:I},v)})}function A(C,B){if(C===a){var D=[];b.each(b(this).data(h[12]),function(E,F){D.push(F.data("store").val())});return(D.length===1?D[0]:D)}B=B===true?{trigger:true}:(B||{});if(!b.isArray(C)){C=[C]}return this.each(function(E,F){F=b(F);b.each(b(this).data(h[12]),function(I,K){if(C[I]===null||C[I]===a){return}var J,L,H=K.data("nui").options.range,M=C[I],G;B.trusted=true;if(B.trusted===false||C.length===1){B.trusted=false}if(C.length===2&&b.inArray(null,C)>=0){B.trusted=false}if(b.type(M)==="string"){M=M.replace(",",".")}M=m.to(H,parseFloat(M));G=p(K,M,B.trusted);if(B.trigger){x(K.data("nui").options.set,F)}if(!G){J=K.data("store").val();L=m.is(H,K[0].gPct(K.data("nui").style));if(J!==L){K.data("store").val(u(L,F))}}})})}b.fn.val=function(){return this.hasClass(h[6])?A.apply(this,arguments):j.apply(this,arguments)};return l.apply(this,arguments)}}(jQuery));