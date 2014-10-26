package com.yb.sys.filter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;  

import com.yb.sys.entity.UserExt;

public class LoginFilter implements Filter
{
  private static Logger logger = LoggerFactory.getLogger(LoginFilter.class);

  @Override
  public void doFilter(ServletRequest servletRequest,
                       ServletResponse servletResponse,
                       FilterChain filterChain) throws IOException, ServletException
  {
    if (!(servletRequest instanceof HttpServletRequest) || !(servletResponse instanceof HttpServletResponse))
    {
      throw new ServletException("OncePerRequestFilter just supports HTTP requests");
    }

    HttpServletRequest httpRequest = (HttpServletRequest) servletRequest;
    HttpServletResponse httpResponse = (HttpServletResponse) servletResponse;

    HttpSession session = httpRequest.getSession(true);

    Object object = session.getAttribute("user");

    UserExt user = (object==null ? null:(UserExt)object);

    if (user == null)
    {
      if(httpRequest.getRequestURI().contains("admin"))
      {
        logger.debug(httpRequest.getRequestURI());
        httpResponse.sendRedirect(httpRequest.getContextPath()+"/login.jsp");
        return;
      }
    }
    filterChain.doFilter(servletRequest, servletResponse);
    return;
  }

  @Override  
  public void init(FilterConfig filterConfig) throws ServletException 
  {  
  }

  @Override  
  public void destroy() 
  {  
  }
}
