var myChart;
var domCode = document.getElementById("sidebar-code");
var domGraphic = document.getElementById("graphic");
var domMain = document.getElementById("main");
var domMessage = document.getElementById("wrong-message");
var iconResize = document.getElementById("icon-resize");
var needRefresh = false;
var enVersion = location.hash.indexOf("-en") != -1;
var hash = location.hash.replace("-en", "");
hash = hash.replace("#", "") || (needMap() ? "default" : "macarons");
hash += enVersion ? "-en" : "";
var curTheme;
function requireCallback(b, a) {
    curTheme = themeSelector ? a : {};
    echarts = b;
    refresh();
    window.onresize = myChart.resize
}
var themeSelector = $("#theme-select");
if (themeSelector) {
    themeSelector.html('<option selected="true" name="macarons">macarons</option><option name="infographic">infographic</option><option name="shine">shine</option><option name="dark">dark</option><option name="blue">blue</option><option name="green">green</option><option name="red">red</option><option name="gray">gray</option><option name="helianthus">helianthus</option><option name="roma">roma</option><option name="mint">mint</option><option name="macarons2">macarons2</option><option name="sakura">sakura</option><option name="default">default</option>');
    $(themeSelector).on("change", function() {
        selectChange($(this).val())
    });
    function selectChange(a) {
        var b = a;
        myChart.showLoading();
        $(themeSelector).val(b);
        if (b != "default") {
            window.location.hash = a + (enVersion ? "-en" : "");
            require(["theme/" + b], function(c) {
                curTheme = c;
                setTimeout(refreshTheme, 500)
            })
        } else {
            window.location.hash = enVersion ? "-en" : "";
            curTheme = {};
            setTimeout(refreshTheme, 500)
        }
    }
    function refreshTheme() {
        myChart.hideLoading();
        myChart.setTheme(curTheme)
    }
    if ($(themeSelector).val(hash.replace("-en", "")).val() != hash.replace("-en", "")) {
        $(themeSelector).val("macarons");
        hash = "macarons" + enVersion ? "-en" : "";
        window.location.hash = hash
    }
}
function autoResize() {
    if ($(iconResize).hasClass("glyphicon-resize-full")) {
        focusCode();
        iconResize.className = "glyphicon glyphicon-resize-small"
    } else {
        focusGraphic();
        iconResize.className = "glyphicon glyphicon-resize-full"
    }
}
function focusCode() {
    domCode.className = "col-md-8 ani";
    domGraphic.className = "col-md-4 ani"
}
function focusGraphic() {
    domCode.className = "col-md-4 ani";
    domGraphic.className = "col-md-8 ani";
    if (needRefresh) {
        myChart.showLoading();
        setTimeout(refresh, 1000)
    }
}
var editor = CodeMirror.fromTextArea(document.getElementById("code"), {
    lineNumbers: true
});
editor.setOption("theme", "monokai");
editor.on("change", function() {
    needRefresh = true
});
function refresh(a) {
    if (a) {
        needRefresh = true;
        focusGraphic();
        return
    }
    needRefresh = false;
    if (myChart && myChart.dispose) {
        myChart.dispose()
    }
    myChart = echarts.init(domMain, curTheme);
    window.onresize = myChart.resize;
    (new Function(editor.doc.getValue()))();
    myChart.setOption(option, true);
    domMessage.innerHTML = ""
}
function needMap() {
    var a = location.href;
    return a.indexOf("map") != -1 || a.indexOf("mix3") != -1 || a.indexOf("mix5") != -1 || a.indexOf("dataRange") != -1
}
var echarts;
var developMode = false;
if (developMode) {
    window.esl = null;
    window.define = null;
    window.require = null;
    (function() {
        var a = document.createElement("script");
        a.async = true;
        var e = location.pathname;
        var b = e.slice(e.indexOf("doc")).split("/");
        var c = new Array(b.length - 1);
        a.src = c.join("../") + "asset/js/esl/esl.js";
        if (a.readyState) {
            a.onreadystatechange = d
        } else {
            a.onload = d
        }
        (document.getElementsByTagName("head")[0] || document.body).appendChild(a);
        function d() {
            a.onload = a.onreadystatechange = null;
            setTimeout(f, 100)
        }
        function f() {
            require.config({
                packages: [{
                    name: "echarts",
                    location: "../../src",
                    main: "echarts"
                }, {
                    name: "zrender",
                    location: "../../../zrender/src",
                    main: "zrender"
                }]
            });
            launchExample()
        }
    }
    )()
} else {
    require.config({
        paths: {
            echarts: "./www/js"
        }
    });
    launchExample()
}
var isExampleLaunched;
function launchExample() {
    if (isExampleLaunched) {
        return
    }
    isExampleLaunched = 1;
    require(["echarts", "theme/" + hash.replace("-en", ""), "echarts/chart/line", "echarts/chart/bar", "echarts/chart/scatter", "echarts/chart/k", "echarts/chart/pie", "echarts/chart/radar", "echarts/chart/force", "echarts/chart/chord", "echarts/chart/gauge", "echarts/chart/funnel", "echarts/chart/eventRiver", "echarts/chart/venn", "echarts/chart/treemap", "echarts/chart/tree", "echarts/chart/wordCloud", "echarts/chart/heatmap", needMap() ? "echarts/chart/map" : "echarts"], requireCallback)
}
;