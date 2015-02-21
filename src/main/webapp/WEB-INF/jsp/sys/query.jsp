<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.yb.sys.entity.UserExt" %>
<%@ page import="com.yb.sys.entity.CompanyExt" %>
<%@ page import="com.yb.sys.entity.IndividualExt" %>
<%@ include file="/core/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>译邦-搜索结果页</title>
    <meta name="keywords" content="译邦" />
    <meta name="description" content="译邦" />
    <base target="_blank" />
    <link href="<%=request.getContextPath()%>/resource/ybcss/project.css" rel="stylesheet" type="text/css" />
</head>

<body>

    <c:if test="${empty companies && empty individuals}">
        <h2>未能找到满足条件的翻译服务提供者, 请尝试其他条件！</h2>
    </c:if>

    <c:if test="${!empty companies}">
        <c:forEach var="comp" items="${companies}">
            <div class="company-card-3 clearfix">                        
                <div class="pic-block">
                    <a href="detail.action?id=${comp.id}"><img src="${comp.logo}" alt=""></a><i></i>
                </div>
                <h2>
                    <b><a href="detail.action?id=${comp.id}">${comp.name}</a></b>
                    <c:if test="${comp.auth_pass==1}">
                        <div class="authen-s-flag1"></div>
                    </c:if>
                </h2>
                <p class="other-info">
                    <b>支持语种：</b>
                    <c:forEach var="lang" items="${comp.languages}">
                        ${lang.language}
                    </c:forEach>
                    ----
                    <b>支持领域：</b>
                    <c:forEach var="field" items="${comp.fields}">
                        ${field.field}
                    </c:forEach>
                    ----
                    <b>翻译类型：</b>
                    <c:forEach var="transtype" items="${comp.transtypes}">
                        ${transtype.transtype}
                    </c:forEach>
    
                    <br>
    
                    <c:if test="${!empty comp.user.tel}">
                        <span class="info-item">电话：${comp.user.tel}</span>
                    </c:if>
                    &nbsp;&nbsp;
                    <c:if test="${!empty comp.user.mobile}">
                        <span class="info-item">手机：${comp.user.mobile}</span>
                    </c:if>
                    &nbsp;&nbsp;
                    <c:if test="${!empty comp.user.qq}">
                        <span class="info-item">QQ：${comp.user.qq}</span>
                    </c:if>
                    &nbsp;&nbsp;
                    <c:if test="${!empty comp.user.weixin}">
                        <span class="info-item">微信：${comp.user.weixin}</span>
                    </c:if>
                    &nbsp;&nbsp;
                    <c:if test="${!empty comp.user.email}">
                        <span class="info-item">邮箱：${comp.user.email}</span>
                    </c:if>
                </p>
            </div> 
        </c:forEach>
    </c:if>

    <c:if test="${!empty individuals}">
        <c:forEach var="indiv" items="${individuals}">
            <div class="company-card-3 clearfix">                        
                <div class="pic-block">
                    <a href="detail.action?id=${indiv.id}"><img src="${indiv.photo}" alt=""></a><i></i>
                </div>
                <h2>
                    <b><a href="detail.action?id=${indiv.id}">${indiv.name}</a></b>
                    <c:if test="${indiv.auth_pass==1}">
                        <div class="authen-s-flag1"></div>
                    </c:if>
                </h2>
                <p class="other-info">
                    <b>支持语种：</b>
                    <c:forEach var="lang" items="${indiv.languages}">
                        ${lang.language}
                    </c:forEach>
                    ----
                    <b>支持领域：</b>
                    <c:forEach var="field" items="${indiv.fields}">
                        ${field.field}
                    </c:forEach>
                    ----
                    <b>翻译类型：</b>
                    <c:forEach var="transtype" items="${indiv.transtypes}">
                        ${transtype.transtype}
                    </c:forEach>
    
                    <br>
    
                    <c:if test="${!empty indiv.user.tel}">
                        <span class="info-item">电话：${indiv.user.tel}</span>
                    </c:if>
                    &nbsp;&nbsp;
                    <c:if test="${!empty indiv.user.mobile}">
                        <span class="info-item">手机：${indiv.user.mobile}</span>
                    </c:if>
                    &nbsp;&nbsp;
                    <c:if test="${!empty indiv.user.qq}">
                        <span class="info-item">QQ：${indiv.user.qq}</span>
                    </c:if>
                    &nbsp;&nbsp;
                    <c:if test="${!empty indiv.user.weixin}">
                        <span class="info-item">微信：${indiv.user.weixin}</span>
                    </c:if>
                    &nbsp;&nbsp;
                    <c:if test="${!empty indiv.user.email}">
                        <span class="info-item">邮箱：${indiv.user.email}</span>
                    </c:if>
                </p>
            </div> 
        </c:forEach>
    </c:if>


</body>
</html>
