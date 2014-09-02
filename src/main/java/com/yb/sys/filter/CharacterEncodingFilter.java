package com.yb.sys.filter;


import java.io.IOException;  
  
import javax.servlet.Filter;  
import javax.servlet.FilterChain;  
import javax.servlet.FilterConfig;  
import javax.servlet.ServletException;  
import javax.servlet.ServletRequest;  
import javax.servlet.ServletResponse;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  

public class CharacterEncodingFilter extends HttpServlet implements Filter {  

  private static final long serialVersionUID = 1L;  
  private FilterConfig filterConfig;   
                
  public void init(FilterConfig filterConfig) throws ServletException {   
    this.filterConfig = filterConfig;
  }   

  public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) {
    try {
      String encoding=filterConfig.getInitParameter("encoding");//从web.xml配置文件中取出参数
      request.setCharacterEncoding(encoding);
      filterChain.doFilter(request, response);
    }
    catch (ServletException sx) {
      filterConfig.getServletContext().log(sx.getMessage());
    }
    catch (IOException iox) {
      filterConfig.getServletContext().log(iox.getMessage());
    }   
  }

  public void destroy() 
  {
  }
  
  protected void doGet(HttpServletRequest arg0, HttpServletResponse arg1) throws ServletException, IOException {
    super.doGet(arg0, arg1);   
  }
  
  protected void doPost(HttpServletRequest arg0, HttpServletResponse arg1) throws ServletException, IOException {   
    super.doPost(arg0, arg1);   
  }   

}
