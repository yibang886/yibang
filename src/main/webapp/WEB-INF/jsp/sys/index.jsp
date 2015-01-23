<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/core/include.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>译邦</title>
    <meta name="keywords" content="译邦" />
    <meta name="description" content="译邦" />
    <base target="_blank" />
    <link href="<%=request.getContextPath()%>/resource/ybcss/project.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">
        function goSearch()
        {
            var form = document.getElementById("search_form");
            form.action = "<%=request.getContextPath()%>/index.action;
            form.submit();
        }
    </script>
</head>
<body>
<div class="pwindow yibang">
    <div class="phead">
        <div class="parea">
            <div class="hot-phone">
                客服热线：400-888-8888
            </div>
            <div class="right-tools">
                <a href="">注册</a>
                <a href="" class="login-link">登录</a><span class="spline">|</span><a href="">关于</a>
            </div>            
        </div>
    </div>     
    <div class="pbody">
        <div class="parea head-search clearfix">
            <div class="logo"><img src="<%=request.getContextPath()%>/resource/ybimg/logo.png" alt=""></div>
            <div class="search">
                <form id="search_form" method="get" target="_self">
                    <input name="st" type="text" class="search-input"/>
                    <input type="submit" value="搜索" class="search-btn" onclick="goSearch()"/>
                </form>
            </div>
        </div>
        <div class="pbanner">
            <div class="parea"><img src="<%=request.getContextPath()%>/resource/ybimg/banner.png" alt=""></div>
        </div>
        <div class="pmain-content">
            <div class="parea clearfix">
            <div class="layout-left">

                <div class="company-lst-1">

                    <c:forEach var="companyA1" items="${companiesA1}">
                        <div class="company-card-1 clearfix">
                            <c:if test="${companyA1.auth_pass==1}">
                                <div class="authen-flag"></div>
                            </c:if>
                            <div class="pic-block">
                                <img src="${companyA1.logo}" alt=""/>
                            </div>
                            <h2>${companyA1.name}</h2>
                            <ul class="lst-c1">
                                <li style="overflow:hidden;white-space:nowrap;">
                                    <span class="num">1</span><b>支持语种：</b>
                                    <c:forEach var="lang" items="${companyA1.languages}">
                                        ${lang.language}
                                    </c:forEach>
                                </li>
                                <li style="overflow:hidden;white-space:nowrap;">
                                    <span class="num">2</span><b>支持领域：</b>
                                    <c:forEach var="field" items="${companyA1.fields}">
                                        ${field.field}
                                    </c:forEach>
                                </li>
                                <li style="overflow:hidden;white-space:nowrap;">
                                    <span class="num">3</span><b>翻译类型：</b>
                                    <c:forEach var="transtype" items="${companyA1.transtypes}">
                                        ${transtype.transtype}
                                    </c:forEach>
                                </li>
                                <li style="overflow:hidden;white-space:nowrap;">
                                    <span class="num">4</span><b>文档类型：</b>
                                    <c:forEach var="doctype" items="${companyA1.doctypes}">
                                        ${doctype.doctype}
                                    </c:forEach>
                                </li>
                            </ul>
                            <p class="other-info">
                                <c:if test="${!empty companyA1.user.tel}">
                                    <span class="info-item">电话：${companyA1.user.tel}</span>
                                </c:if>
                                <c:if test="${!empty companyA1.user.mobile}">
                                    <span class="info-item">手机：${companyA1.user.mobile}</span>
                                </c:if>
                                <c:if test="${!empty companyA1.user.qq}">
                                    <span class="info-item">QQ：${companyA1.user.qq}</span>
                                </c:if>
                                <br>
                                <c:if test="${!empty companyA1.user.weixin}">
                                    <span class="info-item">微信：${companyA1.user.weixin}</span>
                                </c:if>
                                <c:if test="${!empty companyA1.user.email}">
                                    <span class="info-item">邮箱：${companyA1.user.email}</span>
                                </c:if>
                            </p>
                        </div>
                    </c:forEach>
                </div>

                <div class="company-lst-2">
                    <c:forEach var="companyA2" items="${companiesA2}">
                        <div class="company-card-2 clearfix">
                            <c:if test="${companyA2.auth_pass==1}">
                                <div class="authen-flag"></div>
                            </c:if>
                            <div class="pic-block">
                                <img src="${companyA2.logo}" alt=""> 
                            </div>
                            <h2>${companyA2.name}</h2>
                            <ul class="lst-c2">
                                <li style="overflow:hidden;white-space:nowrap;">
                                    <b>支持语种：</b>
                                    <c:forEach var="lang" items="${companyA2.languages}">
                                        ${lang.language}
                                    </c:forEach>
                                </li>
                                <li style="overflow:hidden;white-space:nowrap;">
                                    <b>支持领域：</b>
                                    <c:forEach var="field" items="${companyA2.fields}">
                                        ${field.field}
                                    </c:forEach>
                                </li>
                                <li style="overflow:hidden;white-space:nowrap;">
                                    <b>翻译类型：</b>
                                    <c:forEach var="transtype" items="${companyA2.transtypes}">
                                        ${transtype.transtype}
                                    </c:forEach>
                                </li>
                            </ul>
                            <p class="other-info">
                                <c:if test="${!empty companyA2.user.tel}">
                                    <span class="info-item">电话：${companyA2.user.tel}</span>
                                </c:if>
                                <c:if test="${!empty companyA2.user.mobile}">
                                    <span class="info-item">手机：${companyA2.user.mobile}</span>
                                </c:if>
                                <c:if test="${!empty companyA2.user.qq}">
                                    <span class="info-item">QQ：${companyA2.user.qq}</span>
                                </c:if>
                                <br>
                                <c:if test="${!empty companyA2.user.weixin}">
                                    <span class="info-item">微信：${companyA2.user.weixin}</span>
                                </c:if>
                                <c:if test="${!empty companyA2.user.email}">
                                    <span class="info-item">邮箱：${companyA2.user.email}</span>
                                </c:if>
                            </p>
                        </div>                     
                    </c:forEach>

                    <c:forEach var="individualA2" items="${individualsA2}">
                        <div class="company-card-2 clearfix">
                            <c:if test="${individualA2.auth_pass==1}">
                                <div class="authen-flag"></div>
                            </c:if>
                            <div class="pic-block">
                                <img src="${individualA2.photo}" alt=""> 
                            </div>
                            <h2>${individualA2.name}</h2>
                            <ul class="lst-c2">
                                <li style="overflow:hidden;white-space:nowrap;">
                                    <b>支持语种：</b>
                                    <c:forEach var="lang" items="${individualA2.languages}">
                                        ${lang.language}
                                    </c:forEach>
                                </li>
                                <li style="overflow:hidden;white-space:nowrap;">
                                    <b>支持领域：</b>
                                    <c:forEach var="field" items="${individualA2.fields}">
                                        ${field.field}
                                    </c:forEach>
                                </li>
                                <li style="overflow:hidden;white-space:nowrap;">
                                    <b>翻译类型：</b>
                                    <c:forEach var="transtype" items="${individualA2.transtypes}">
                                        ${transtype.transtype}
                                    </c:forEach>
                                </li>
                            </ul>
                            <p class="other-info">
                                <c:if test="${!empty individualA2.user.tel}">
                                    <span class="info-item">电话：${individualA2.user.tel}</span>
                                </c:if>
                                <c:if test="${!empty individualA2.user.mobile}">
                                    <span class="info-item">手机：${individualA2.user.mobile}</span>
                                </c:if>
                                <c:if test="${!empty individualA2.user.qq}">
                                    <span class="info-item">QQ：${individualA2.user.qq}</span>
                                </c:if>
                                <br>
                                <c:if test="${!empty individualA2.user.weixin}">
                                    <span class="info-item">微信：${individualA2.user.weixin}</span>
                                </c:if>
                                <c:if test="${!empty individualA2.user.email}">
                                    <span class="info-item">邮箱：${individualA2.user.email}</span>
                                </c:if>
                            </p>
                        </div>                     
                    </c:forEach>
                </div>

                <div class="company-lst-3">
                    <c:forEach var="companyA3" items="${companiesA3}">
                        <div class="company-card-3 clearfix">                        
                            <div class="pic-block">
                                <img src="${companyA3.logo}" alt=""><i></i>
                            </div>
                            <h2>
                                <b>${companyA3.name}</b>
                                <c:if test="${companyA3.auth_pass==1}">
                                    <div class="authen-s-flag1"></div>
                                </c:if>
                            </h2>
                            <p class="other-info">
                                <b>支持语种：</b>
                                <c:forEach var="lang" items="${companyA3.languages}">
                                    ${lang.language}
                                </c:forEach>
                                ----
                                <b>支持领域：</b>
                                <c:forEach var="field" items="${companyA3.fields}">
                                    ${field.field}
                                </c:forEach>
                                ----
                                <b>翻译类型：</b>
                                <c:forEach var="transtype" items="${companyA3.transtypes}">
                                    ${transtype.transtype}
                                </c:forEach>

                                <br>

                                <c:if test="${!empty companyA3.user.tel}">
                                    <span class="info-item">电话：${companyA3.user.tel}</span>
                                </c:if>
                                &nbsp;&nbsp;
                                <c:if test="${!empty companyA3.user.mobile}">
                                    <span class="info-item">手机：${companyA3.user.mobile}</span>
                                </c:if>
                                &nbsp;&nbsp;
                                <c:if test="${!empty companyA3.user.qq}">
                                    <span class="info-item">QQ：${companyA3.user.qq}</span>
                                </c:if>
                                &nbsp;&nbsp;
                                <c:if test="${!empty companyA3.user.weixin}">
                                    <span class="info-item">微信：${companyA3.user.weixin}</span>
                                </c:if>
                                &nbsp;&nbsp;
                                <c:if test="${!empty companyA3.user.email}">
                                    <span class="info-item">邮箱：${companyA3.user.email}</span>
                                </c:if>
                            </p>
                        </div> 
                    </c:forEach>

                    <c:forEach var="individualA3" items="${individualsA3}">
                        <div class="company-card-3 clearfix">                        
                            <div class="pic-block">
                                <img src="${individualA3.photo}" alt=""><i></i>
                            </div>
                            <h2>
                                <b>${individualA3.name}</b>
                                <c:if test="${individualA3.auth_pass==1}">
                                    <div class="authen-s-flag1"></div>
                                </c:if>
                            </h2>
                            <p class="other-info">
                                <b>支持语种：</b>
                                <c:forEach var="lang" items="${individualA3.languages}">
                                    ${lang.language}
                                </c:forEach>
                                ----
                                <b>支持领域：</b>
                                <c:forEach var="field" items="${individualA3.fields}">
                                    ${field.field}
                                </c:forEach>
                                ----
                                <b>翻译类型：</b>
                                <c:forEach var="transtype" items="${individualA3.transtypes}">
                                    ${transtype.transtype}
                                </c:forEach>

                                <br>

                                <c:if test="${!empty individualA3.user.tel}">
                                    <span class="info-item">电话：${individualA3.user.tel}</span>
                                </c:if>
                                &nbsp;&nbsp;
                                <c:if test="${!empty individualA3.user.mobile}">
                                    <span class="info-item">手机：${individualA3.user.mobile}</span>
                                </c:if>
                                &nbsp;&nbsp;
                                <c:if test="${!empty individualA3.user.qq}">
                                    <span class="info-item">QQ：${individualA3.user.qq}</span>
                                </c:if>
                                &nbsp;&nbsp;
                                <c:if test="${!empty individualA3.user.weixin}">
                                    <span class="info-item">微信：${individualA3.user.weixin}</span>
                                </c:if>
                                &nbsp;&nbsp;
                                <c:if test="${!empty individualA3.user.email}">
                                    <span class="info-item">邮箱：${individualA3.user.email}</span>
                                </c:if>
                            </p>
                        </div> 
                    </c:forEach>
                </div>
            </div>
            <div class="layout-right">
                <div class="r-mod r-m1">
                    <div class="r-mod-til">
                        <h2>查找翻译服务</h2>
                    </div>
                    <div class="r-mod-bd">
                        <a href="search.action" target="_self" class="r-link">查找翻译服务 &gt;</a>
                    </div>
                </div>
                <div class="r-mod r-m2">
                    <div class="r-mod-til">
                        <h2>发布翻译服务</h2>
                    </div>
                    <div class="r-mod-bd">
                        <a href="" class="r-link r-link2">我是翻译公司 &gt;</a>
                        <a href="" class="r-link">我是个人译员 &gt;</a>
                    </div>
                </div>

                <div class="r-mod wx-mod">
                    <div class="r-mod-til">
                        <h2>关注译邦</h2>
                    </div>
                    <div class="r-mod-bd">
                        <div class="pic">
                            <img src="http://img1.cache.netease.com/ent/2014/10/25/201410251652584a1a5.jpg" alt="">
                        </div>
                        <h3>微信号：yibang126</h3>
                        <p>
                            公司QQ群：1258745845 <br>
                            译员QQ群：1258745845
                        </p>
                    </div>
                </div>

                <div class="r-mod rec-company">
                    <div class="r-mod-til">
                        <h2>推荐公司</h2>
                    </div>
                    <div class="r-mod-bd">
                        <ul class="lst-rc">
                            <c:forEach var="companyA4" items="${companiesA4}">
                                <li>
                                    <img class="pic" src="${companyA4.logo}" alt="">
                                    <h2>
                                        <a href="">${companyA4.name}</a>
                                        <c:if test="${companyA4.auth_pass==1}">
                                            <span class="authen-s-flag1"></span>
                                        </c:if>
                                        <c:if test="${companyA4.auth_pass!=1}">
                                            <span class="authen-s-flag2"></span>
                                        </c:if>
                                    </h2>
                                    <p style="overflow:hidden;white-space:nowrap;"> 
                                        <c:if test="${!empty companyA4.user.mobile}">
                                            <span class="info-item">手机：${companyA4.user.mobile}</span>
                                        </c:if>
                                        &nbsp;&nbsp;
                                        <c:if test="${!empty companyA4.user.qq}">
                                            <span class="info-item">QQ：${companyA4.user.qq}</span>
                                        </c:if>
                                        &nbsp;&nbsp;
                                        <c:if test="${!empty companyA4.user.email}">
                                            <span class="info-item">邮箱：${companyA4.user.email}</span>
                                        </c:if>
                                        &nbsp;&nbsp;
                                        <c:if test="${!empty companyA4.user.tel}">
                                            <span class="info-item">电话：${companyA4.user.tel}</span>
                                        </c:if>
                                        &nbsp;&nbsp;
                                        <c:if test="${!empty companyA4.user.weixin}">
                                            <span class="info-item">微信：${companyA4.user.weixin}</span>
                                        </c:if>
                                    </p> 
                                </li> 
                            </c:forEach>


                            <c:forEach var="individualA4" items="${individualsA4}">
                                <li>
                                    <img class="pic" src="${individualA4.photo}" alt="">
                                    <h2>
                                      <a href="">${individualA4.name}</a>
                                        <c:if test="${individualA4.auth_pass==1}">
                                            <span class="authen-s-flag1"></span>
                                        </c:if>
                                        <c:if test="${individualA4.auth_pass!=1}">
                                            <span class="authen-s-flag2"></span>
                                        </c:if>
                                    </h2>
                                    <p style="overflow:hidden;white-space:nowrap;"> 
                                        <c:if test="${!empty individualA4.user.mobile}">
                                            <span class="info-item">手机：${individualA4.user.mobile}</span>
                                        </c:if>
                                        &nbsp;&nbsp;
                                        <c:if test="${!empty individualA4.user.qq}">
                                            <span class="info-item">QQ：${individualA4.user.qq}</span>
                                        </c:if>
                                        &nbsp;&nbsp;
                                        <c:if test="${!empty individualA4.user.email}">
                                            <span class="info-item">邮箱：${individualA4.user.email}</span>
                                        </c:if>
                                        &nbsp;&nbsp;
                                        <c:if test="${!empty individualA4.user.tel}">
                                            <span class="info-item">电话：${individualA4.user.tel}</span>
                                        </c:if>
                                        &nbsp;&nbsp;
                                        <c:if test="${!empty individualA4.user.weixin}">
                                            <span class="info-item">微信：${individualA4.user.weixin}</span>
                                        </c:if>
                                    </p> 
                                </li> 
                            </c:forEach>
                        </ul>
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
                                  <img width="110" height="50" alt="中国互联网协会" src="http://i1.sinaimg.cn/home/main/index2013/footerlogo/footer_logo01.gif" data-src="http://i1.sinaimg.cn/home/main/index2013/footerlogo/footer_logo01.gif"></a>
                          </li>                    
                         <li>
                              <a href="http://www.itrust.org.cn" target="_blank">
                                  <img width="110" height="50" alt="中国互联网协会" src="http://i1.sinaimg.cn/home/main/index2013/footerlogo/footer_logo01.gif" data-src="http://i1.sinaimg.cn/home/main/index2013/footerlogo/footer_logo01.gif"></a>
                          </li>
                          <li>
                              <a href="http://www.bj.cyberpolice.cn/index.htm" target="_blank">
                                  <img src="http://i1.sinaimg.cn/home/main/index2013/footerlogo/footer_logo05.gif" data-src="http://i1.sinaimg.cn/home/main/index2013/footerlogo/footer_logo05.gif" width="105" height="50" alt="网络110报警服务"></a>
                          </li>

                          <li>
                              <a href="https://ss.knet.cn/verifyseal.dll?sn=2010091500100002145&amp;ct=df&amp;a=1&amp;pa=0.14296675658609825" target="_blank">
                                  <img src="http://i1.sinaimg.cn/home/main/index2013/footerlogo/footer_logo10_1.gif" data-src="http://i1.sinaimg.cn/home/main/index2013/footerlogo/footer_logo10_1.gif" width="123" height="50" alt="可信网站"></a>
                          </li>
                      </ul>
            </div>        
        </div>                  
    </div>
</div>
</body>
</html>
