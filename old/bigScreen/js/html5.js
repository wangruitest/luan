!function(ad,ac){function ab(f,e){var h=f.createElement("p"),g=f.getElementsByTagName("head")[0]||f.documentElement;return h.innerHTML="x<style>"+e+"</style>",g.insertBefore(h.lastChild,g.firstChild)}function aa(){var b=D.elements;return"string"==typeof b?b.split(" "):b}function Z(e,d){var f=D.elements;"string"!=typeof f&&(f=f.join(" ")),"string"!=typeof e&&(e=e.join(" ")),D.elements=f+" "+e,U(d)}function Y(d){var c=E[d[G]];return c||(c={},F++,d[G]=F,E[F]=c),c}function X(b,h,g){if(h||(h=ac),M){return h.createElement(b)}g||(g=Y(h));var f;return f=g.cache[b]?g.cache[b].cloneNode():H.test(b)?(g.cache[b]=g.createElem(b)).cloneNode():g.createElem(b),!f.canHaveChildren||I.test(b)||f.tagUrn?f:g.frag.appendChild(f)}function W(b,l){if(b||(b=ac),M){return b.createDocumentFragment()}l=l||Y(b);for(var k=l.frag.cloneNode(),j=0,f=aa(),d=f.length;d>j;j++){k.createElement(f[j])}return k}function V(d,c){c.cache||(c.cache={},c.createElem=d.createElement,c.createFrag=d.createDocumentFragment,c.frag=c.createFrag()),d.createElement=function(a){return D.shivMethods?X(a,d,c):c.createElem(a)},d.createDocumentFragment=Function("h,f","return function(){var n=f.cloneNode(),c=n.createElement;h.shivMethods&&("+aa().join().replace(/[\w\-:]+/g,function(b){return c.createElem(b),c.frag.createElement(b),'c("'+b+'")'})+");return n}")(D,c.frag)}function U(b){b||(b=ac);var c=Y(b);return !D.shivCSS||O||c.hasCSS||(c.hasCSS=!!ab(b,"article,aside,dialog,figcaption,figure,footer,header,hgroup,main,nav,section{display:block}mark{background:#FF0;color:#000}template{display:none}")),M||V(b,c),b}function T(h){for(var d,l=h.getElementsByTagName("*"),k=l.length,j=RegExp("^(?:"+aa().join("|")+")$","i"),i=[];k--;){d=l[k],j.test(d.nodeName)&&i.push(d.applyElement(S(d)))}return i}function S(g){for(var f,j=g.attributes,i=j.length,h=g.ownerDocument.createElement(N+":"+g.nodeName);i--;){f=j[i],f.specified&&h.setAttribute(f.nodeName,f.nodeValue)}return h.style.cssText=g.style.cssText,h}function R(h){for(var d,l=h.split("{"),k=l.length,j=RegExp("(^|[\\s,>+~])("+aa().join("|")+")(?=[[\\s,>+~#.:]|$)","gi"),i="$1"+N+"\\:$2";k--;){d=l[k]=l[k].split("}"),d[d.length-1]=d[d.length-1].replace(j,i),l[k]=d.join("}")}return l.join("{")}function Q(d){for(var c=d.length;c--;){d[c].removeNode()}}function P(f){function c(){clearTimeout(l._removeSheetTimer),n&&n.removeNode(!0),n=null}var n,m,l=Y(f),k=f.namespaces,j=f.parentWindow;return !L||f.printShived?f:("undefined"==typeof k[N]&&k.add(N),j.attachEvent("onbeforeprint",function(){c();for(var q,p,e,d=f.styleSheets,b=[],a=d.length,s=Array(a);a--;){s[a]=d[a]}for(;e=s.pop();){if(!e.disabled&&C.test(e.media)){try{q=e.imports,p=q.length}catch(r){p=0}for(a=0;p>a;a++){s.push(q[a])}try{b.push(e.cssText)}catch(r){}}}b=R(b.reverse().join("")),m=T(f),n=ab(f,b)}),j.attachEvent("onafterprint",function(){Q(m),clearTimeout(l._removeSheetTimer),l._removeSheetTimer=setTimeout(c,500)}),f.printShived=!0,f)}var O,M,K="3.7.3",J=ad.html5||{},I=/^<|^(?:button|map|select|textarea|object|iframe|option|optgroup)$/i,H=/^(?:a|b|code|div|fieldset|h1|h2|h3|h4|h5|h6|i|label|li|ol|p|q|span|strong|style|table|tbody|td|th|tr|ul)$/i,G="_html5shiv",F=0,E={};!function(){try{var b=ac.createElement("a");b.innerHTML="<xyz></xyz>",O="hidden" in b,M=1==b.childNodes.length||function(){ac.createElement("a");var c=ac.createDocumentFragment();return"undefined"==typeof c.cloneNode||"undefined"==typeof c.createDocumentFragment||"undefined"==typeof c.createElement}()}catch(d){O=!0,M=!0}}();var D={elements:J.elements||"abbr article aside audio bdi canvas data datalist details dialog figcaption figure footer header hgroup main mark meter nav output picture progress section summary template time video",version:K,shivCSS:J.shivCSS!==!1,supportsUnknownElements:M,shivMethods:J.shivMethods!==!1,type:"default",shivDocument:U,createElement:X,createDocumentFragment:W,addElements:Z};ad.html5=D,U(ac);var C=/^$|\b(?:all|print)\b/,N="html5shiv",L=!M&&function(){var a=ac.documentElement;return !("undefined"==typeof ac.namespaces||"undefined"==typeof ac.parentWindow||"undefined"==typeof a.applyElement||"undefined"==typeof a.removeNode||"undefined"==typeof ad.attachEvent)}();D.type+=" print",D.shivPrint=P,P(ac),"object"==typeof module&&module.exports&&(module.exports=D)}("undefined"!=typeof window?window:this,document);