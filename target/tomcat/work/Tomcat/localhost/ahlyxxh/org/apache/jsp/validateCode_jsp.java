/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.37
 * Generated at: 2019-05-22 15:16:48 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.awt.*;
import java.awt.image.*;
import java.util.*;
import javax.imageio.*;

public final class validateCode_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("image/jpeg;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
  //设置页面不缓存
   response.setHeader("Pragma","No-cache");
   response.setHeader("Cahce-Control","no-cache");
   response.setDateHeader("Expires",0);
   //在内存中创建图片
   int width=60,height=20;
   BufferedImage image=new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
   //获取图形上下文
   Graphics g= image.getGraphics();
   //生成随机类
   Random random= new Random();
   //设置背景颜色
   g.setColor(new Color(160,200,100));
   g.fillRect(0,0,width,height);
   //设置字体
   g.setFont(new Font("Times New Roman",Font.PLAIN,18));
   //随机产生50条干扰线，使图形中的验证码不易被其他的程序探测到
    g.setColor(new Color(160,200,200));
   for(int i=0;i<50;i++)
   {
     int x=random.nextInt(width);
     int y=random.nextInt(height);
     int x1=random.nextInt(width);
     int y1=random.nextInt(height);
     g.drawLine(x,y,x+x1,y+y1);
   }
   //随机产生验证码（4为数字）
   String sRand="";
   for(int i=0;i<4;i++)
   {
     String rand=String.valueOf(random.nextInt(10));
     sRand+=rand;
     //将验证码显示到图象
     g.setColor(new Color(20+random.nextInt(110),20+random.nextInt(110),20+random.nextInt(110)));
     g.drawString(rand,13*i+6,16);
   }
   session.setAttribute("randdd",sRand);  //////将产生的验证码存储到sesson中
   g.dispose();
   ImageIO.write(image,"JPEG",response.getOutputStream());
   out.clear(); //***********
   out=pageContext.pushBody();//**********
 
      out.write("\r\n");
      out.write("\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
