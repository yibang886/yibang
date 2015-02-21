<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.yb.sys.entity.UserExt" %>
<%@ include file="/core/include.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>译邦</title>
    <meta name="keywords" content="译邦" />
    <meta name="description" content="译邦" />
    <base target="_blank" />

    <link href="<%=request.getContextPath()%>/resource/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="<%=request.getContextPath()%>/resource/ybcss/project.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap.min.js"></script>
</head>
<body>
<div class="pwindow yibang">
    <div class="phead">
        <div class="parea">
            <div class="hot-phone">
                客服热线：028-6580-6596
            </div>
            <div class="right-tools">
                <a href="goRegister.action" target="_self">注册</a>

                <%! UserExt baseUserExt = null; %>
                <% baseUserExt = (UserExt)request.getSession().getAttribute("user"); %>
               
                <c:choose>
                    <c:when test="<%= baseUserExt==null %>">
                        <a class="login-link" href="goLogin.action" target="_self">登录</a>
                    </c:when>
                    <c:otherwise>
                      <ul class="nav navbar-nav">
                        <li class="dropdown">
                          <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <%= baseUserExt.getemail() %>
                            <b class="caret"></b>
                          </a>
                          <ul class="dropdown-menu">
                            <li><a href="home?id=${user.id}&type=${user.user_type}" target="_self">空间</a></li>
                            <li><a href="<%=request.getContextPath()%>/logout.action" target="_self">退出</a></li>
                          </ul>
                        </li>
                      </ul>
                    </c:otherwise>
                </c:choose>

                <span class="spline">|</span><a href="aboutYibang.action" target="_self">关于</a>
            </div>            
        </div>
    </div>     
    <div class="pbody">
        <div class="parea head-search clearfix">
            <div class="logo"><img src="<%=request.getContextPath()%>/resource/ybimg/logo.png" alt=""></div>
            <div class="search">
                <form id="search_form" method="get" target="_self">
                    <input name="st" type="text" class="search-input"/>
                    <input type="submit" value="搜索" class="search-btn" onclick="goTextSearch()"/>
                </form>
            </div>
        </div>

        <div class="pmain-content">
            <div class="parea">
                <div class="parea-wrap">

                    <div class="breadcrumb clearfix">
                        <div class="crumb">
                            <a href="index.action" target="_self">主页</a> &gt; 
                            <c:choose>
                                <c:when test="${info_type=='err'}">
                                    <a>错误信息</a>
                                </c:when>
                                <c:otherwise>
                                    <a>提示信息</a>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="back-index">
                            <a href="index.action" target="_self">返回主页</a>
                        </div>
                    </div>

                    <div class="common-info clearfix"/>
                </div>
            </div>
        </div>

        <div class="pbanner">
            <div class="parea">
                <img src="<%=request.getContextPath()%>/resource/ybimg/banner.png" alt="" />
            </div>
        </div>

        <div class="pmain-content">
            <br/>
            <br/>
            <br/>
            <br/>

            <div class="parea clearfix">
                <div class="layout-left">

                    <c:if test="${!empty title}">
                        <div><p>
                            <c:choose>
                                <c:when test="${info_type=='err'}">
                                    <font size="+2" color="red">
                                </c:when>
                                <c:otherwise>
                                    <font size="+2">
                                </c:otherwise>
                            </c:choose>
                                ${title}
                            </font>
                        </p></div>
                        <br/>
                    </c:if>

		    <%-- at most 8 paragraphs --%>
                    <c:if test="${!empty para1}">
                        <div><p>
                            <c:choose>
                                <c:when test="${info_type=='err'}">
                                    <font size="+0.5" color="red">
                                </c:when>
                                <c:otherwise>
                                    <font size="+0.5">
                                </c:otherwise>
                            </c:choose>
                                ${para1}
                            </font>
                        </p></div>
                    </c:if>

                    <c:if test="${!empty para2}">
                        <div><p>
                            <c:choose>
                                <c:when test="${info_type=='err'}">
                                    <font size="+0.5" color="red">
                                </c:when>
                                <c:otherwise>
                                    <font size="+0.5">
                                </c:otherwise>
                            </c:choose>
                                ${para2}
                            </font>
                        </p></div>
                    </c:if>

                    <c:if test="${!empty para3}">
                        <div><p>
                            <c:choose>
                                <c:when test="${info_type=='err'}">
                                    <font size="+0.5" color="red">
                                </c:when>
                                <c:otherwise>
                                    <font size="+0.5">
                                </c:otherwise>
                            </c:choose>
                                ${para3}
                            </font>
                        </p></div>
                    </c:if>

                    <c:if test="${!empty para4}">
                        <div><p>
                            <c:choose>
                                <c:when test="${info_type=='err'}">
                                    <font size="+0.5" color="red">
                                </c:when>
                                <c:otherwise>
                                    <font size="+0.5">
                                </c:otherwise>
                            </c:choose>
                                ${para4}
                            </font>
                        </p></div>
                    </c:if>

                    <c:if test="${!empty para5}">
                        <div><p>
                            <c:choose>
                                <c:when test="${info_type=='err'}">
                                    <font size="+0.5" color="red">
                                </c:when>
                                <c:otherwise>
                                    <font size="+0.5">
                                </c:otherwise>
                            </c:choose>
                                ${para5}
                            </font>
                        </p></div>
                    </c:if>

                    <c:if test="${!empty para6}">
                        <div><p>
                            <c:choose>
                                <c:when test="${info_type=='err'}">
                                    <font size="+0.5" color="red">
                                </c:when>
                                <c:otherwise>
                                    <font size="+0.5">
                                </c:otherwise>
                            </c:choose>
                                ${para6}
                            </font>
                        </p></div>
                    </c:if>

                    <c:if test="${!empty para7}">
                        <div><p>
                            <c:choose>
                                <c:when test="${info_type=='err'}">
                                    <font size="+0.5" color="red">
                                </c:when>
                                <c:otherwise>
                                    <font size="+0.5">
                                </c:otherwise>
                            </c:choose>
                                ${para7}
                            </font>
                        </p></div>
                    </c:if>

                    <c:if test="${!empty para8}">
                        <div><p>
                            <c:choose>
                                <c:when test="${info_type=='err'}">
                                    <font size="+0.5" color="red">
                                </c:when>
                                <c:otherwise>
                                    <font size="+0.5">
                                </c:otherwise>
                            </c:choose>
                                ${para8}
                            </font>
                        </p></div>
                    </c:if>
		    <%-- at most 8 paragraphs --%>

                </div>
            </div>
            <br/>
            <br/>
            <br/>
        </div>        
    </div>  
    <div class="pfoot">
        <div class="parea">
            <div class="flinks">
                <div class="flinks-l">
                    <a href="index.action" target="_self">首页</a> | 
                    <a href="disclaimer.action" target="_self">免责声明</a> | 
                    <a href="aboutYibang.action" target="_self">关于译邦 </a> | 
                    <a href="onlineServ.action" target="_self">在线翻译 </a> |  
                    <a href="ally.action" target="_self">合作机构</a> | 
                    <a href="advertise.action" target="_self">广告服务 </a> | 
                    <a href="contactUs.action" target="_self">联系我们</a>            
                </div>
                <div class="flinks-r">
                    © 2014 译邦 All rights reserved 译邦信息服务(北京)有限公司 京ICP证 100953号
                </div>
            </div>
            <div class="frel-lst">
                    <ul>
                        <li style="margin-left:0px;">
                              <a href="http://www.itrust.org.cn" target="_blank">
                                  <img width="110" height="50" alt="中国互联网协会" src="http://i1.sinaimg.cn/home/main/index2013/footerlogo/footer_logo01.gif" data-src="http://i1.sinaimg.cn/home/main/index2013/footerlogo/footer_logo01.gif" /></a>
                          </li>                    
                          <li>
                              <a href="http://www.bj.cyberpolice.cn/index.htm" target="_blank">
                                  <img src="http://i1.sinaimg.cn/home/main/index2013/footerlogo/footer_logo05.gif" data-src="http://i1.sinaimg.cn/home/main/index2013/footerlogo/footer_logo05.gif" width="105" height="50" alt="网络110报警服务" /></a>
                          </li>

                          <li>
                              <a href="https://ss.knet.cn/verifyseal.dll?sn=2010091500100002145&amp;ct=df&amp;a=1&amp;pa=0.14296675658609825" target="_blank">
                                  <img src="http://i1.sinaimg.cn/home/main/index2013/footerlogo/footer_logo10_1.gif" data-src="http://i1.sinaimg.cn/home/main/index2013/footerlogo/footer_logo10_1.gif" width="123" height="50" alt="可信网站" /></a>
                          </li>
                      </ul>
            </div>        
        </div>                  
    </div>
</div>

<script type="text/javascript">
    function goTextSearch()
    {
        var form = document.getElementById("search_form");
        form.action = "<%=request.getContextPath()%>/search.action";
        form.submit();
    }
</script>

</body>
</html>
