package com.funo.report.paging;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

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
public class PagingServlet implements Servlet{
    public void init(ServletConfig parm1) throws ServletException {
        System.out.println("init PagingServlet");
    }
    public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("gb2312");

        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/xml");
        PrintWriter pw = response.getWriter();
        com.funo.report.paging.Paging query=PagingMgt.newInstance(request.getParameter(PagingMgt.PAGING_CLASS_NAME));
        if(query==null){
            pw.write(PagingMgt.genBlankXml());
            pw.close();
            return;
        }
        query.loadPage(request);
        pw.write(query.getQuery_output());
        pw.close();
    }
    public ServletConfig getServletConfig() {
        return null;
    }

    public String getServletInfo() {
        return null;
    }
    public void destroy() {
        System.out.println("destory it");
    }
}
