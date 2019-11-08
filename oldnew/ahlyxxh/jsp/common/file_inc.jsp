<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<% 
	String downFlag=Math.random()+"";
 	session.setAttribute("downFlag", downFlag);
%>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery/ajaxfileupload.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery/jquery.base64.js"></script>
<script type="text/javascript">

    //-------------文件下载-----------
    var ROOT_URL="<%=request.getContextPath()%>";
    var file_iframe_src = ROOT_URL+'/FileDownload?downloadFileName=';
    var downFlag2="<%=downFlag%>";
    
    //下载文件
    function fileDownload(downloadFileName,saveFileName){
    	downFlag2=parseFloat(downFlag2)*21.9+"";
    	if(null==saveFileName)saveFileName="";
    	if(null==downloadFileName){
    		showMsg("未指定需要下载的文件名称!");
    		return;
    		
    	}
    	document.getElementById("fileDownload").src=file_iframe_src+downloadFileName+'&saveFileName='+saveFileName+'&random='+encodeURI(downFlag2);
    }
    
    
    //-------------文件上传------------
    /**
     * 文件上传实现
     * @param filePath 文件路径
     * @param callBack 上传结束后的回调函数
              callBack 回调函数接收一个返回json对象，json对象数据格式如下：
              {
    			fileName:'文件名称',
    			fileId:'文件标识'
              }
     * @param subfixs  所要限制的文件类型集合，用逗号隔开(如：txt,rar,xls,doc)
     * @param fileField 需要上传文件所在的域名称，默认使用 'myfile'名称
     * 
     *
     * 使用说明：
     * 
       1.在需要上传文件的页面引入本页面，如：
         <jsp\:include flush=\'true\' page=\'../common/file_inc.jsp\'></jsp\:include>
         
       2.编写回调函数，接收上传文件成功后的返回值，如：
         function fileUploadBack(result){
     		alert(result.fileName);
     	 }
       
       3.在页面需要的位置上加入上传文件域，如：
         <input type=\"text\" id=\"path\" />
		 <input id=\"myfile\" name=\"myfile\" type=\"file\" onchange=\"$(\'#path\').val(this.value);\" class=\"fileUpload\" hidefocus>
		 <button type=\"button\" >浏览</button>
		 <button onclick=\"fileUpload($(\'#path\').val(),fileUploadBack,\'txt\')\" type=\"button\" >上传</button>
     */
     
    function fileUpload(filePath,callBack,subfixs,fileField){
   		if(filePath == "") {
   			showMsg("请先选择需要上传的文件！");
   			return ;
   		}
   		
   		//判断格式
   		if(null!=subfixs && subfixs!="*.*"){
	   		var fileSubfix = filePath.substring(filePath.lastIndexOf(".")+1); 
	   		if(subfixs.indexOf(fileSubfix)<0){  
	   			showMsg("文件类型不在允许范围内，请重新选择文件！");
                return ;  
	        }
   		}
   		$.ajaxFileUpload({
   			url : '<%=request.getContextPath() %>/FileUpload',
   			secureuri : false,
   			fileElementId : fileField || 'myfile',
   			dataType : 'json',
   			beforeSend : function() {
   			},
   			success : function(data, status) {
   				if (null!=data && data.success=="true") {
   					var fileName=data.saveFileName;
   					var relativeFileName=data.relativeFileName;
   					var fileId=fileName.substring(0,fileName.lastIndexOf("."));
   					var result={
   							fileName:fileName,
   							relativeFileName:relativeFileName,
   							fileId:fileId
   					}
   					callBack(result);
   				} else if(null!=data.message){
   					var base64CodeStr=data.message;//.replaceAll("@@@","\r\n");
   					base64CodeStr=$.base64.atob(base64CodeStr,true,'utf8')
   					showMsg(base64CodeStr);
   				}else{
   					showMsg("文件上传出错！");
   				}
   			}
   		});
    }
    
    
</script>
<iframe src="" id="fileDownload" name="fileDownload" style="display: none"></iframe>