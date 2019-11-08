<script type="text/javascript" src="../../dwr/engine.js"></script>
<script src='../../dwr/util.js'></script>
<script src="../../js/date/WdatePicker.js"></script>
<script src ="../../js/common/common.js"></script>
<link rel="STYLESHEET" type="text/css" href="../../css/common/common.css"> </link>	
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery/jquery-1.8.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery/jquery-easyui-1.3.2/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery/jquery-easyui-1.3.2/locale/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/js/jquery/jquery-easyui-1.3.2/themes/metro/easyui.css" title="default">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/js/jquery/jquery-easyui-1.3.2/themes/icon.css">
<script >
    var fater=getTop();
    function getTop(){
        var maxTop=window.top;
        if(window.parent){
            maxTop=window.parent.top;
        }
        return maxTop;
    }
    function getViewportHeight() {
        if (fater.location.href.indexOf("desktop")>=0) return 407;
        if (window.innerHeight!=window.undefined) return window.innerHeight;
        if (document.compatMode=='CSS1Compat') return document.documentElement.clientHeight;
        if (document.body) return document.body.clientHeight;
        return window.undefined;
    }
    //分页
    function pagerFilter(data){
        if (typeof data.length == 'number' && typeof data.splice == 'function'){	// is array
            data = {
                total: data.length,
                rows: data
            }
        }
        var dg = $(this);
        var opts = dg.datagrid('options');
        var pager = dg.datagrid('getPager');
        pager.pagination({
            showRefresh:false,
            onSelectPage:function(pageNum, pageSize){
                opts.pageNumber = pageNum;
                opts.pageSize = pageSize;
                pager.pagination('refresh',{
                    pageNumber:pageNum,
                    pageSize:pageSize
                });
                dg.datagrid('loadData',data);
            }
        });
        if (!data.originalRows){
            data.originalRows = (data.rows);
        }
        var start = (opts.pageNumber-1)*parseInt(opts.pageSize);
        var end = start + parseInt(opts.pageSize);
        data.rows = (data.originalRows.slice(start, end));
        return data;
    }
    DWREngine.setPreHook(showLoading);
    DWREngine.setPostHook(hideLoading);
    function showLoading() {
        var disabledImageZone = fater.document.getElementById('disabledImageZone');
        var disabledImageZone = fater.document.getElementById('disabledImageZone');
        if (!disabledImageZone) {
            disabledImageZone = fater.document.createElement('div');
            disabledImageZone.setAttribute('id', 'disabledImageZone');
            disabledImageZone.style.position = "absolute";
            disabledImageZone.style.zIndex = "10000";
            disabledImageZone.style.left = "0px";
            disabledImageZone.style.top = "0px";
            disabledImageZone.style.width = "100%";
            disabledImageZone.style.height = "100%";

            var iframe = fater.document.createElement('iframe');
            disabledImageZone.appendChild(iframe);
            iframe.setAttribute('id','markIframe');
            iframe.setAttribute('allowTransparency','true');
            iframe.setAttribute('src',loading_iframe);
            iframe.style.position = "absolute";

            var popHeight=0;
            var popWidth=0;
            var fullHeight = getViewportHeight();
            var fullWidth = getViewportWidth();
            var theBody = fater.document.getElementsByTagName("BODY")[0];
            if (fullHeight > theBody.scrollHeight) {
                popHeight = fullHeight;
            } else {
                popHeight = theBody.scrollHeight;
            }

            if (fullWidth > theBody.scrollWidth) {
                popWidth = fullWidth;
            } else {
                popWidth = theBody.scrollWidth;
            }

            iframe.style.width = popWidth+"px";
            iframe.style.height = popHeight+"px";
            iframe.style.top = "0px";
            iframe.style.left = "0px";

            fater.document.body.appendChild(disabledImageZone);
        }
        fater.document.getElementById('disabledImageZone').style.visibility = 'visible';
    }

    function hideLoading() {
        fater.document.getElementById('disabledImageZone').style.visibility = 'hidden';
    }
</script>