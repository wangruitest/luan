package com.funo.report.paging;

import javax.servlet.ServletRequest;

import com.funo.util.Result;

/**
 * <p>Title: funo_webframe</p>
 *
 * <p>Description: 福诺WEB框架</p>
 *
 * <p>Copyright: Copyright (c) 2010</p>
 *
 * <p>Company: FUNO</p>
 *
 * @author luojz
 * @version 1.0
 */
public abstract class Paging {
	
    /**
     * 是否分页
     */
    private boolean is_paging = false;
    /**
     * 总记录数
     */
    private int total_count;
    /**
     * 每页记录数
     */
    private int page_count = 20;

    /**
     * 当前页数
     */
    private int current_page;

    /**
     * 查询输出符合dhtmlxgrid格式的XML
     */
    private String query_output;

    /**
     * 加载页面公共参数
     * @param request ServletRequest
     */
    private void loadParameter(ServletRequest request){
        String sIs_paging=request.getParameter(PagingMgt.IS_PAGING);
        String sPage_count=request.getParameter(PagingMgt.PAGE_COUNT);
        String sCurrent_page=request.getParameter(PagingMgt.CURRENT_PAGE);

        if(sIs_paging!=null&&sIs_paging.equalsIgnoreCase("true")){
            this.is_paging = true;
        }
        try {
            page_count = Integer.parseInt(sPage_count);
        } catch (Exception ex) {}
        try {
            current_page = Integer.parseInt(sCurrent_page);
        } catch (Exception ex) {}
    }

    /**
     * 加载页面
     * @param request ServletRequest
     */
    public void loadPage(ServletRequest request){
        loadParameter(request);

        String[] aRowID=null;
        String[][] aaData = null;

        //查询数据
        Result rsQuery = null;
        int begin_index = -1;
        int end_index = -1;
        if(is_paging){
            begin_index = (current_page-1)*page_count+1;
            end_index = current_page*page_count;
        }
        rsQuery = queryData(request,begin_index,end_index);
        aRowID=rsQuery.aResult;
        aaData = rsQuery.aaResult;
        total_count = rsQuery.iTotalNum;

        //拼凑符合DHTMLXGRID的XML字符串
        StringBuffer sbOutput = new StringBuffer();
        sbOutput.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n");
        sbOutput.append("  <rows total_record=\""+total_count+"\">\r\n");
        if(aaData!=null){
            for (int i = 0; i < aaData.length; i++) {
                if(aaData[i]==null||aaData[i].length==0)continue;
                String rowid = i+"";
                if(aRowID!=null&&aRowID.length>i)rowid = aRowID[i];
                sbOutput.append("    <row id=\""+rowid+"\">\r\n");
                for (int j = 0; j < aaData[i].length; j++) {
                    sbOutput.append("      <cell><![CDATA["+aaData[i][j]+"]]></cell>\r\n");
                }
                sbOutput.append("    </row>\r\n");
            }
        }
        sbOutput.append("  </rows>\r\n");
        query_output = sbOutput.toString();
        sbOutput.setLength(0);
        sbOutput = null;
    }

    /**
     * 查询数据，如果有分页，则是当前页的数据
     * @param request ServletRequest
     * @param begin_index int
     * @param end_index int
     * @return Result 二维数组表示数据，一维数组表示id，一维二维长度要相等
     */
    public abstract Result queryData(ServletRequest request,int begin_index,int end_index);

    public int getCurrent_page() {
        return current_page;
    }

    public int getTotal_count() {
        return total_count;
    }

    public String getQuery_output() {
        return query_output;
    }

    public int getPage_count() {
        return page_count;
    }

    public boolean isIs_paging() {
        return is_paging;
    }

    public void setIs_paging(boolean is_paging) {
        this.is_paging = is_paging;
    }

    public void setCurrent_page(int current_page) {
        this.current_page = current_page;
    }

    public void setPage_count(int page_count) {
        this.page_count = page_count;
    }
}

