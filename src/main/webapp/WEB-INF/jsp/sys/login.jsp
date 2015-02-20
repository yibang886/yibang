<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.yb.sys.entity.UserExt" %>
<%@ include file="/core/include.jsp"%>

<%
UserExt baseUserExt = (UserExt)request.getSession().getAttribute("user");
if(baseUserExt!=null)
{ 
  if( baseUserExt.getuser_type()==0 ) //individual
  {
    response.sendRedirect(request.getContextPath()+"/home.action?id="+baseUserExt.getId()+"&type=0");
  }
  else if( baseUserExt.getuser_type()==1 ) //company
  {
    response.sendRedirect(request.getContextPath()+"/home.action?id="+baseUserExt.getId()+"&type=1");
  }
}
%>

<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>译邦-登录</title>
    <meta name="keywords" content="译邦" />
    <meta name="description" content="译邦" />
    <base target="_blank" />
    <link href="<%=request.getContextPath()%>/resource/ybcss/project.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="pwindow login-page">
    <div class="phead">
        <div class="parea">
            <div class="hot-phone">
                客服热线：400-888-8888
            </div>
            <div class="right-tools">
                <a href="">注册</a>
                <a href="" class="login-link">登录</a>
                <span class="spline">|</span><a href="aboutYibang.action" target="_self">关于</a>
            </div>            
        </div>
    </div>     
    <div class="pbody">
        <div class="login-area">
            <div class="login-cnt">
                <div class="login-form">
                    <form action="<%=request.getContextPath()%>/doLogin.action" target="_self">
                        <div class="login-form-item">
                            <label for="">用户邮箱：</label>
                            <input type="text" name="email">
                        </div>
                        <div class="login-form-item">
                            <label for="">登录密码：</label>
                            <input type="password" name="password">
                        </div>

                        <input class="submit-btn" type="submit" value="登录">

                        <%--
                        <div class="login-bottom">
                            <label class="checkbox"><input type="checkbox" name="savelogin" checked>下次自动登录</label>
                            <a class="forget-pw" href="" >忘记密码</a>
                        </div>                        
                        --%>
                    </form>                    
                    <div style="color:red">${error}</div>
                </div>
            </div>
        </div>      
    </div>  
    <div class="pfoot">
        <div class="parea">
            <div class="flinks">
                <div class="flinks-l">
                    <a href="">首页</a> | 
                    <a href="">合作机构</a> | 
                    <a href="">在线翻译 </a> |  
                    <a href="">关于译邦 </a> | 
                    <a href="">新手指引 </a> | 
                    <a href="">广告服务</a> | 
                    <a href="">联系我们</a>            
                </div>
                <div class="flinks-r">
                    © 2014 译邦 All rights reserved 译邦信息服务(北京)有限公司 京ICP证 100953号
                </div>
            </div>
            <div class="frel-lst">
                    <ul>
                        <li style="margin-left:0px;">
                              <a href="http://www.itrust.org.cn" target="_blank">
                                  <img width="110" height="50" alt="中国互联网协会" src="http://i1.sinaimg.cn/home/main/index2013/footerlogo/footer_logo01.gif"></a>
                          </li>                    
                         <li>
                              <a href="http://www.itrust.org.cn" target="_blank">
                                  <img width="110" height="50" alt="中国互联网协会" src="http://i1.sinaimg.cn/home/main/index2013/footerlogo/footer_logo01.gif"></a>
                          </li>
                          <li>
                              <a href="http://www.bj.cyberpolice.cn/index.htm" target="_blank">
                                  <img src="http://i1.sinaimg.cn/home/main/index2013/footerlogo/footer_logo05.gif" width="105" height="50" alt="网络110报警服务"></a>
                          </li>

                          <li>
                              <a href="https://ss.knet.cn/verifyseal.dll?sn=2010091500100002145&amp;ct=df&amp;a=1&amp;pa=0.14296675658609825" target="_blank">
                                  <img src="http://i1.sinaimg.cn/home/main/index2013/footerlogo/footer_logo10_1.gif"  width="123" height="50" alt="可信网站"></a>
                          </li>
                      </ul>
            </div>        
        </div>                  
    </div>
</div>
</body>
</html>
