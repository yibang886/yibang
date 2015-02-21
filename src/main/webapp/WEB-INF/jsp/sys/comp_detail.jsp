<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.yb.sys.entity.UserExt" %>
<%@ include file="/core/include.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>译邦-公司主页</title>
    <meta name="keywords" content="译邦" />
    <meta name="description" content="译邦" />
    <base target="_blank" />

    <%--
    <link href="<%=request.getContextPath()%>/resource/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    --%>
    <link href="<%=request.getContextPath()%>/resource/ybcss/project.css" rel="stylesheet" type="text/css" />
    <%--
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap.min.js"></script>
    --%>
</head>
<body>

<%! UserExt baseUserExt = null; %>
<% baseUserExt = (UserExt)request.getSession().getAttribute("user"); %>
               
<div class="pwindow company-page">
    <div class="phead">
        <div class="parea">
            <div class="hot-phone">
                客服热线：028-6580-6596
            </div>
            <div class="right-tools">
                <a href="goRegister.action" target="_self">注册</a>

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
        <div class="pmain-content">
            <div class="parea">
                <div class="parea-wrap">
                    <div class="common-info clearfix">
                        <div class="c-info-mcnt-2">
                            <div class="info-banner">
                                <img src="<%=request.getContextPath()%>/resource/ybimg/myspace-banner.png" alt="">
                            </div>
                            <!-- 公司信息 -->
                            <div class="common-info-mod">
                                <div class="cinfo-hd">
                                    <h2>公司信息</h2>
                                </div>
                                <div class="cinfo-bd">
                                    <div class="c-info-cnt">
                                        <ul class="info-show-lst">
                                            <li>
                                                <span class="label">公司名词：</span>
                                                <p>${companyModel.companyExt.name}</p>
                                            </li>
                                            <li>
                                                <span class="label">所在城市：</span>
                                                <p>${companyModel.companyExt.city.city}</p>
                                            </li>
                                            <li>
                                                <span class="label">公司地址：</span>
                                                <p>${companyModel.companyExt.address}</p>
                                            </li>
                                            <li>
                                                <span class="label">公司网站：</span>
						<p><a href="${companyModel.companyExt.website}" style="color:blue;">${companyModel.companyExt.website}</a></p>
                                            </li>
                                            <li>
                                                <span class="label">公司简介：</span>
                                                <p>${companyModel.companyExt.inroduct}</p>
                                            </li>
                                        </ul>

                                        <div class="c-info-img">
                                            <img src="${companyModel.companyExt.logo}" alt=""  style="width:165px;height:132px;">
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <!-- 公司信息 -->
                            <!-- 翻译能力 -->
                            <div class="common-info-mod">
                                <div class="cinfo-hd">
                                    <h2>翻译能力</h2>
                                </div>
                                <div class="cinfo-bd">
                                    <div class="c-info-cnt">
                                        <ul class="info-show-lst">
                                            <li>
                                                <span class="label">语&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;种：</span>
                                                <c:if test="${!empty companyModel.companyExt.languages}">
                                                    <c:forEach var="var" items="${companyModel.companyExt.languages}">
                                                        <c:out value="${var.language}" escapeXml="true" />&nbsp;&nbsp;
                                                    </c:forEach>
                                                </c:if>            
                                            </li>
                                            <li>
                                                <span class="label">翻译类型：</span>
                                                <c:if test="${!empty companyModel.companyExt.transtypes}">
                                                    <c:forEach var="var" items="${companyModel.companyExt.transtypes}">
                                                        <c:out value="${var.transtype}" escapeXml="true" />&nbsp;&nbsp;
                                                    </c:forEach>
                                                </c:if>            
                                            </li>
                                            <li>
                                                <span class="label">专业领域：</span>
                                                <c:if test="${!empty companyModel.companyExt.fields}">
                                                    <c:forEach var="var" items="${companyModel.companyExt.fields}">
                                                        <c:out value="${var.field}" escapeXml="true" />&nbsp;&nbsp;
                                                    </c:forEach>
                                                </c:if>            
                                            </li>
                                            <li>
                                                <span class="label">文档类型：</span>
                                                <c:if test="${!empty companyModel.companyExt.doctypes}">
                                                    <c:forEach var="var" items="${companyModel.companyExt.doctypes}">
                                                        <c:out value="${var.doctype}" escapeXml="true" />&nbsp;&nbsp;
                                                    </c:forEach>
                                                </c:if>            
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!-- 翻译能力 -->                            
                            <!-- 审核能力 -->
                            <div class="common-info-mod">
                                <div class="cinfo-hd">
                                    <h2>审核与认证</h2>
                                </div>
                                <div class="cinfo-bd">
                                    <div class="c-info-cnt">
                                        <ul class="info-show-lst">
                                            <c:if test="${!empty companyModel.companyExt.authfile}">
                                                <li class="pic-info-li">
                                                    <span class="label">认证资料</span>
                                                    <p class=""><img data-bigimg="${companyModel.companyExt.authfile}"  
                                                                     src="${companyModel.companyExt.authfile}" alt="" style="width:330px;height:264px;"></p>
                                                </li>
                                            </c:if>
                                            <li class="clear-left short-info-show">
                                                <span class="label">审核状态：</span>
                                                <c:choose>
                                                    <c:when test="${companyModel.companyExt.valid_pass==0}"><p>待审核</p></c:when>
                                                    <c:when test="${companyModel.companyExt.valid_pass==1}"><p>审核通过</p></c:when>
                                                    <c:otherwise><p>审核未通过</p></c:otherwise>
                                                </c:choose>
                                            </li>
                                            <li class="short-info-show">
                                                <span class="label">认证状态：</span>
                                                <c:choose>
                                                    <c:when test="${companyModel.companyExt.auth_pass==0}"><p>待认证</p></c:when>
                                                    <c:when test="${companyModel.companyExt.auth_pass==1}"><p>认证通过</p></c:when>
                                                    <c:otherwise><p>认证未通过</p></c:otherwise>
                                                </c:choose>
                                            </li>
                                            <li class="clear-left short-info-show">
                                                <span class="label">推荐位：</span>
                                                <p>${companyModel.companyExt.recompos.recompos}</p>
                                            </li>
                                            <li class="short-info-show">
                                                <span class="label">金币数：</span>
                                                <p>${userModel.userExt.coin}</p>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!-- 审核能力 -->
                            <!-- 联系方式 -->
                            <div class="common-info-mod">
                                <div class="cinfo-hd">
                                    <h2>联系方式</h2>
                                </div>
                                <div class="cinfo-bd">
                                    <div class="c-info-cnt">
                                        <ul class="info-show-lst">
                                            <li class="short-info-show"><span class="label">邮箱：</span><p>${userModel.userExt.email}</p></li>
                                            <li class="short-info-show"><span class="label">QQ：</span><p>${userModel.userExt.qq}</p></li>
                                            <li class="short-info-show"><span class="label">移动电话：</span><p>${userModel.userExt.mobile}</p></li>
                                            <li class="short-info-show"><span class="label">微信：</span><p>${userModel.userExt.weixin}</p></li>
                                            <li class="short-info-show"><span class="label">传真：</span><p>${userModel.userExt.fax}</p></li>
                                            <li class="short-info-show"><span class="label">固定电话：</span><p>${userModel.userExt.tel}</p></li>
                                        </ul>
                                    </div>
                                </div>
                            </div> 
                            <!-- 联系方式 -->                           
                        </div>


                    </div>

                </div>               
            </div>
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
