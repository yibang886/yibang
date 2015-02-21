<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.yb.sys.entity.UserExt" %>
<%@ include file="/core/include.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>译邦-用户主页</title>
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

<div class="pwindow individual-page">
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

	<%--
        <div class="parea head-search clearfix">
            <div class="logo"><img src="<%=request.getContextPath()%>/resource/ybimg/logo.png" alt=""></div>
            <div class="search">
                <form id="search_form" method="get" target="_self">
                    <input name="st" type="text" class="search-input"/>
                    <input type="submit" value="搜索" class="search-btn" onclick="goTextSearch()"/>
                </form>
            </div>
        </div>
	--%>

        <div class="pmain-content">
            <div class="parea">
                <div class="parea-wrap">

                    <div class="common-info clearfix">
                        
                        <div class="c-info-mcnt-2">
                            <div class="info-banner">
                                <img src="<%=request.getContextPath()%>/resource/ybimg/myspace-banner.png" alt="">
                            </div>
                            <!-- 个人信息 -->
                            <div class="common-info-mod">
                                <div class="cinfo-hd">
                                    <h2>基本信息</h2>
                                </div>
                                <div class="cinfo-bd">
                                    <div class="c-info-cnt">
                                        <ul class="info-show-lst">
                                            <li class="short-info-show clear-left">
                                                <span class="label">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</span>
                                                <p>${individualModel.individualExt.name}</p>
                                            </li>
                                            <li class="short-info-show clear-left">
                                                <span class="label">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</span>
                                                <p>
                                                    <c:choose>
                                                        <c:when test="${individualModel.individualExt.gender==0}">男</c:when>
                                                        <c:otherwise>女</c:otherwise>
                                                    </c:choose>
                                                </p>
                                            </li>

                                            <li class="short-info-show">
                                                <span class="label">出生年月：</span>
                                                <p>${individualModel.individualExt.birth_year}</p>
                                            </li>

                                            <li class="short-info-show clear-left">
                                                <span class="label">教育水平：</span>
                                                <p>${individualModel.individualExt.education.education}</p>
                                            </li>

                                            <li class="short-info-show">
                                                <span class="label">毕业院校：</span>
                                                <p>${individualModel.individualExt.school.school}</p>
                                            </li>

                                            <li class="short-info-show clear-left">
                                                <span class="label">所在城市：</span>
                                                <p>${individualModel.individualExt.city.city}</p>
                                            </li>

                                            <li class="short-info-show">
                                                <span class="label">工作方式：</span>
                                                <p>
                                                    <c:choose>
                                                        <c:when  test="${individualModel.individualExt.workstyle==0}">全职</c:when>
                                                        <c:otherwise>兼职</c:otherwise>
                                                    </c:choose>
                                                </p>
                                            </li>

                                            <li class="clear"></li>

                                            <li>
                                                <span class="label">个人简介：</span>
                                                <p>${individualModel.individualExt.introduct}</p>
                                            </li>

                                            <li>
                                                <span class="label">个人主页：</span>
                                                <p><a href="${individualModel.individualExt.mainpage}" style="color:blue;">${individualModel.individualExt.mainpage}</a></p>
                                            </li>
                                        </ul>

                                        <div class="c-info-img">
                                            <img src="${individualModel.individualExt.photo}" alt="" style="width:165px;height:132px;">
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
                                                <c:if test="${!empty individualModel.individualExt.languages}">
                                                    <c:forEach var="var" items="${individualModel.individualExt.languages}">
                                                        <c:out value="${var.language}" escapeXml="true" />&nbsp;&nbsp;
                                                    </c:forEach>
                                                </c:if>            
                                            </li>
                                            <li>
                                                <span class="label">翻译类型：</span>
                                                <c:if test="${!empty individualModel.individualExt.transtypes}">
                                                    <c:forEach var="var" items="${individualModel.individualExt.transtypes}">
                                                        <c:out value="${var.transtype}" escapeXml="true" />&nbsp;&nbsp;
                                                    </c:forEach>
                                                </c:if>            
                                            </li>
                                            <li>
                                                <span class="label">专业领域：</span>
                                                <c:if test="${!empty individualModel.individualExt.fields}">
                                                    <c:forEach var="var" items="${individualModel.individualExt.fields}">
                                                        <c:out value="${var.field}" escapeXml="true" />&nbsp;&nbsp;
                                                    </c:forEach>
                                                </c:if>            
                                            </li>
                                            <li>
                                                <span class="label">文档类型：</span>
                                                <c:if test="${!empty individualModel.individualExt.doctypes}">
                                                    <c:forEach var="var" items="${individualModel.individualExt.doctypes}">
                                                        <c:out value="${var.doctype}" escapeXml="true" />&nbsp;&nbsp;
                                                    </c:forEach>
                                                </c:if>            
                                            </li>
                                            <li>
                                                <span class="label">工作经验：</span>
                                                <p>
                                                    <c:choose>
                                                        <c:when test="${!empty individualModel.individualExt.exp_year}">
                                                            ${individualModel.individualExt.exp_year}&nbsp;&nbsp;年
                                                        </c:when>
                                                        <c:otherwise>
                                                            0&nbsp;&nbsp;年
                                                        </c:otherwise>
                                                    </c:choose>
                                                </p>
                                            </li>

                                            <li>
                                                <span class="label">翻译经验：</span>
                                                <p>
                                                    <c:choose>
                                                        <c:when test="${!empty individualModel.individualExt.exp_trans}">
                                                            ${individualModel.individualExt.exp_trans}&nbsp;&nbsp;万字
                                                        </c:when>
                                                        <c:otherwise>
                                                            0&nbsp;&nbsp;万字
                                                        </c:otherwise>
                                                    </c:choose>
                                                </p>
                                            </li>
                                            <li>
                                                <span class="label">翻译作品：</span>
                                                <p>${individualModel.individualExt.works}</p>
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
                                            <c:if test="${!empty individualModel.individualExt.langcert}">
                                                <li class="pic-info-li short-info-show-2">
                                                    <span class="label">语言等级证书</span>
                                                    <p class=""><img data-bigimg="${individualModel.individualExt.langcert}" src="${individualModel.individualExt.langcert}" alt="" style="width:330px;height:264px;"></p>
                                                </li>
                                            </c:if>
                                            <c:if test="${!empty individualModel.individualExt.transcert}">
                                                <li class="pic-info-li short-info-show-2">
                                                    <span class="label">翻译证书</span>
                                                    <p class=""><img src="${individualModel.individualExt.transcert}" alt="" style="width:330px;height:264px;"></p>
                                                </li>
                                            </c:if>
                                            <c:if test="${!empty individualModel.individualExt.profcert}">
                                                <li class="pic-info-li short-info-show-2">
                                                    <span class="label">专业证书</span>
                                                    <p class=""><img src="${individualModel.individualExt.profcert}" alt="" style="width:330px;height:264px;"></p>
                                                </li>
                                            </c:if>
                                            <c:if test="${!empty individualModel.individualExt.authfile}">
                                                <li class="pic-info-li short-info-show-2">
                                                    <span class="label">认证资料</span>
                                                    <p class=""><img src="${individualModel.individualExt.authfile}" alt="" style="width:330px;height:264px;"></p>
                                                </li>
                                            </c:if>
                                            <li class="clear-left short-info-show">
                                                <span class="label">审核状态：</span>
                                                <c:choose>
                                                    <c:when test="${individualModel.individualExt.valid_pass==0}"><p>待审核</p></c:when>
                                                    <c:when test="${individualModel.individualExt.valid_pass==1}"><p>审核通过</p></c:when>
                                                    <c:otherwise><p>审核未通过</p></c:otherwise>
                                                </c:choose>
                                            </li>
                                            <li class="short-info-show">
                                                <span class="label">认证状态：</span>
                                                <c:choose>
                                                    <c:when test="${individualModel.individualExt.auth_pass==0}"><p>待认证</p></c:when>
                                                    <c:when test="${individualModel.individualExt.auth_pass==1}"><p>认证通过</p></c:when>
                                                    <c:otherwise><p>认证未通过</p></c:otherwise>
                                                </c:choose>
                                            </li>
                                            <li class="clear-left short-info-show">
                                                <span class="label">推荐位：</span>
                                                <p>${individualModel.individualExt.recompos.recompos}</p>
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
