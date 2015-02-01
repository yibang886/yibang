<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
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
    <link href="<%=request.getContextPath()%>/resource/ybcss/project.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="pwindow i-translate-page">
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
            <form action="">
                <input type="text" class="search-input">
                <input type="submit" value="搜索" class="search-btn">
            </form>
            </div>
        </div>

        <div class="pmain-content">
            <div class="parea">
                <div class="parea-wrap">

                    <div class="breadcrumb clearfix">
                        <div class="crumb">
                            <a href="">主页</a> &gt; 
                            <c:choose>
                                <c:when test="${page==0}"><a>我的状态</a></c:when>
                                <c:when test="${page==1}"><a>修改基本信息</a></c:when>
                                <c:otherwise><a>发布修改服务</a></c:otherwise>
                            </c:choose>
                            <a href=""></a>
                        </div>
                        <div class="back-index">
                            <a href="">返回主页</a>
                        </div>
                    </div>

                    <div class="common-info clearfix">
                        
                        <div class="c-info-sidebar">
                            <ul class="side-nav-lst">
                                <c:choose>
                                    <c:when test="${page==0}">
                                        <li class="current"><a class="nav-info">我的状态</a></li>
                                        <li><a class="nav-info-modify" href="home.action?type=0&id=${userId}&page=1" target="_self">修改基本信息</a></li>
                                        <li><a class="nav-publish" href="home.action?type=0&id=${userId}&page=2" target="_self">发布修改服务</a></li>
                                    </c:when>
                                    <c:when test="${page==1}">
                                        <li><a class="nav-info" href="home.action?type=0&id=${userId}&page=0" target="_self">我的状态</a></li>
                                        <li class="current"><a class="nav-info-modify">修改基本信息</a></li>
                                        <li><a class="nav-publish" href="home.action?type=0&id=${userId}&page=2" target="_self">发布修改服务</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li><a class="nav-info" href="home.action?type=0&id=${userId}&page=0" target="_self">我的状态</a></li>
                                        <li><a class="nav-info-modify" href="home.action?type=0&id=${userId}&page=1" target="_self">修改基本信息</a></li>
                                        <li class="current"><a class="nav-publish">发布修改服务</a></li>
                                    </c:otherwise>
                                </c:choose>
                            </ul>
                        </div>

                        <div class="c-info-mcnt">
                            <div class="c-info-wrap">
                                <div class="common-info-mod2">
                                    <div class="cinfo-hd">
                                        <c:choose>
                                            <c:when test="${page==0}"><h2>我的状态</h2></c:when>
                                            <c:when test="${page==1}"><h2>修改基本信息(带*号项为必填项)</h2></c:when>
                                            <c:otherwise><h2>发布修改服务(带*号项为必填项)</h2></c:otherwise>
                                        </c:choose>
                                    </div>

                                    <c:choose>
                                        <c:when test="${page==0}">
                                        </c:when>
                                        <c:when test="${page==1}">
                                            <div class="cinfo-bd">
                                                <form class="c-info-form modify-info-form" method="post" id="userForm" target="_self">
                                                    <div class="form-group">
                                                        <span class="form-label">登录邮箱(*)</span>
                                                        <div class="form-control">
                                                            <input required id="emailInput" name="userExt.email" type="email" 
                                                                            value="<c:out value="${ userModel.userExt.email }" escapeXml="true" />" readonly>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <span class="form-label">登录密码(*)</span>
                                                        <div class="form-control">
                                                            <input required id="pwdInput" name="userExt.password" type="password" 
                                                                            value="<c:out value="${ userModel.userExt.password }" escapeXml="true" />" />
                                                            &nbsp;&nbsp;(6到10位密码)
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <span class="form-label">用户类型(*)</span>
                                                        <div class="form-control">
                                                            <select required name="userExt.user_type">
                                                                <option value="0" <c:if test="${userModel.userExt.user_type==0}"><c:out value="selected"/></c:if> >个人译员</option>
                                                                <option value="1" <c:if test="${userModel.userExt.user_type==1}"><c:out value="selected"/></c:if> >翻译公司</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <span class="form-label">移动电话(*)</span>
                                                        <div class="form-control">
                                                            <input required id="mobInput" name="userExt.mobile" type="digits" 
                                                                            value="<c:out value="${ userModel.userExt.mobile }" escapeXml="true" />" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <span class="form-label">固定电话</span>
                                                        <div class="form-control">
                                                            <input id="telInput" name="userExt.tel" type="digits" value="<c:out value="${ userModel.userExt.tel }" escapeXml="true" />" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <span class="form-label">传真</span>
                                                        <div class="form-control">
                                                            <input id="faxInput" name="userExt.fax" type="digits" value="<c:out value="${ userModel.userExt.fax }" escapeXml="true" />" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <span class="form-label">QQ号</span>
                                                        <div class="form-control">
                                                            <input id="qqInput" name="userExt.qq" type="digits" value="<c:out value="${ userModel.userExt.qq }" escapeXml="true" />" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <span class="form-label">微信号</span>
                                                        <div class="form-control">
                                                            <input id="wxInput" name="userExt.weixin" type="text" value="<c:out value="${ userModel.userExt.weixin }" escapeXml="true" />" />
                                                        </div>
                                                    </div> 
                
                                                    <input type="hidden" value="${userId}" name="userExt.id"/>
                
                                                    <div class="form-btns">
                                                        <input class="form-submit blue-btn form-submit-s" type="button" value="保存" onclick="doUserEdit(0)">
                                                        <input class="form-submit blue-btn form-submit-s" type="button" value="取消" onclick="doUserEdit(1)">
                                                    </div>                         
                                                </form>
                                            </div>
                                        </c:when>
                                        <c:otherwise>   <%-- publish or edit individual translation service --%>
                                            <div class="cinfo-bd">
                                                <ul class="publish-flow clearfix">
                                                    <c:choose>
                                                      <c:when test="${step>=1}">
                                                    <li class="step current">
                                                      </c:when>
                                                      <c:otherwise>
                                                    <li class="step">
                                                      </c:otherwise>
                                                    </c:choose>
                                                        <span>1</span>
                                                        <p>填写基本信息</p>
                                                        <i></i>
                                                    </li>
                                                    <c:choose>
                                                      <c:when test="${step>=2}">
                                                    <li class="step current">
                                                      </c:when>
                                                      <c:otherwise>
                                                    <li class="step">
                                                      </c:otherwise>
                                                    </c:choose>
                                                        <span>2</span>
                                                        <p>上传照片</p>
                                                        <i></i>
                                                    </li>
                                                    <c:choose>
                                                      <c:when test="${step>=3}">
                                                    <li class="step current">
                                                      </c:when>
                                                      <c:otherwise>
                                                    <li class="step">
                                                      </c:otherwise>
                                                    </c:choose>
                                                        <span>3</span>
                                                        <p>上传语言等级证书</p>
                                                        <i></i>                                                
                                                    </li>
                                                    <c:choose>
                                                      <c:when test="${step>=4}">
                                                    <li class="step current">
                                                      </c:when>
                                                      <c:otherwise>
                                                    <li class="step">
                                                      </c:otherwise>
                                                    </c:choose>
                                                        <span>4</span>
                                                        <p>上传翻译证书</p>
                                                        <i></i>                                                
                                                    </li>
                                                    <c:choose>
                                                      <c:when test="${step>=5}">
                                                    <li class="step current">
                                                      </c:when>
                                                      <c:otherwise>
                                                    <li class="step">
                                                      </c:otherwise>
                                                    </c:choose>
                                                        <span>5</span>
                                                        <p>上传专业证书</p>
                                                        <i></i>                                                
                                                    </li>
                                                    <c:choose>
                                                      <c:when test="${step>=6}">
                                                    <li class="step current">
                                                      </c:when>
                                                      <c:otherwise>
                                                    <li class="step">
                                                      </c:otherwise>
                                                    </c:choose>
                                                        <span>6</span>
                                                        <p>上传认证资料</p>                                              
                                                    </li>
                                                </ul>
                                                <c:choose>
                                                    <c:when test="${step==1}">
                                                        <form class="c-info-form translate-form i-translate-form" method="post" novalidate="novalidate" id="indivForm" target="_self">
                                                            <div class="clearfix">
                                                                <div class="form-group form-item2">
                                                                    <span class="form-label">姓名(*)</span>
                                                                    <div class="form-control">
                                                                        <input required name="individualExt.name" type="text" id="iNameIpt"
                                                                                        value="<c:out value="${ individualModel.individualExt.name }" escapeXml="true" />" />
                                                                    </div>
                                                                </div>
                                                                <div class="form-group form-item2">
                                                                    <span class="form-label">性别(*)</span>
                                                                    <div class="form-control">
                                                                        <select name="individualExt.gender">
                                                                            <c:choose>
                                                                                <c:when test="${ !empty individualModel.individualExt }">
                                                                                    <option value="0" <c:if test="${individualModel.individualExt.gender==0}"><c:out value="selected"/></c:if> >男</option>
                                                                                    <option value="1" <c:if test="${individualModel.individualExt.gender==1}"><c:out value="selected"/></c:if> >女</option>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <option value="0" selected="true">男</option>
                                                                                    <option value="1">女</option>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group form-item2">
                                                                    <span class="form-label">教育水平(*)</span>
                                                                    <div class="form-control">
                                                                        <select required name="individualExt.education.id">
                                                                            <c:choose>
                                                                                <c:when test="${ !empty individualModel.individualExt }">
                                                                                    <c:forEach items="${individualModel.educationEnum}" var="var">
                                                                                        <option value="${var.id}" <c:if test="${individualModel.individualExt.education.id==var.id}"><c:out value="selected"/></c:if> >
                                                                                            ${var.education}
                                                                                        </option>
                                                                                    </c:forEach>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <c:forEach items="${individualModel.educationEnum}" var="var">
                                                                                        <option value="${var.id}">
                                                                                            ${var.education}
                                                                                        </option>
                                                                                    </c:forEach>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group form-item2">
                                                                    <span class="form-label">毕业院校(*)</span>
                                                                    <div class="form-control">
                                                                        <select required name="individualExt.school.id">
                                                                            <c:choose>
                                                                                <c:when test="${ !empty individualModel.individualExt }">
                                                                                    <c:forEach items="${individualModel.schoolEnum}" var="var">
                                                                                        <option value="${var.id}" <c:if test="${individualModel.individualExt.school.id==var.id}"><c:out value="selected"/></c:if> >
                                                                                            ${var.school}
                                                                                        </option>
                                                                                    </c:forEach>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <c:forEach items="${individualModel.schoolEnum}" var="var">
                                                                                        <option value="${var.id}">
                                                                                            ${var.school}
                                                                                        </option>
                                                                                    </c:forEach>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group form-item2">
                                                                    <span class="form-label">出生年份(*)</span>
                                                                    <div class="form-control">
                                                                        <c:choose>
                                                                            <c:when test="${ !empty individualModel.individualExt }">
                                                                                <select required name="individualExt.birth_year">
                                                                                    <c:forEach var="year" begin="1970" end="2014" step="1">
                                                                                        <option value="${year}" <c:if test="${individualModel.individualExt.birth_year==year}"><c:out value="selected"/></c:if> >
                                                                                            ${year}
                                                                                        </option>
                                                                                    </c:forEach>
                                                                                </select>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <select required name="individualExt.birth_year">
                                                                                    <c:forEach var="year" begin="1970" end="2014" step="1">
                                                                                        <option value="${year}" <c:if test="${year==1985}"><c:out value="selected"/></c:if> >
                                                                                            ${year}
                                                                                        </option>
                                                                                    </c:forEach>
                                                                                </select>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group form-item2">
                                                                    <span class="form-label">工作方式(*)</span>
                                                                    <div class="form-control">
                                                                        <select required name="individualExt.workstyle">
                                                                            <c:choose>
                                                                                <c:when test="${ !empty individualModel.individualExt }">
                                                                                    <option value="0" <c:if test="${individualModel.individualExt.workstyle==0}"><c:out value="selected"/></c:if> >全职</option>
                                                                                    <option value="1" <c:if test="${individualModel.individualExt.workstyle==1}"><c:out value="selected"/></c:if> >兼职</option>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <option value="0" selected="true">全职</option>
                                                                                    <option value="1">兼职</option>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </select>
                                                                    </div>
                                                                </div> 
                                                            </div>                                                   
                                                            <div class="form-group">
                                                                <span class="form-label">所在城市(*)</span>
                                                                <div class="form-control">
                                                                    <select required name="individualExt.city.id">
                                                                        <c:choose>
                                                                            <c:when test="${ !empty individualModel.individualExt }">
                                                                                <c:forEach items="${individualModel.cityEnum}" var="var">
                                                                                    <option value="${var.id}" <c:if test="${individualModel.individualExt.city.id==var.id}"><c:out value="selected"/></c:if> >
                                                                                        ${var.city}
                                                                                    </option>
                                                                                </c:forEach>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <c:forEach items="${individualModel.cityEnum}" var="var">
                                                                                    <option value="${var.id}">
                                                                                        ${var.city}
                                                                                    </option>
                                                                                </c:forEach>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <span class="form-label">语种</span>
                                                                <div class="form-control">
                                                                    <c:choose>
                                                                        <c:when test="${ !empty individualModel.individualExt }">
                                                                            <c:forEach items="${individualModel.languageEnum}" var="var">
                                                                               <c:choose> 
                                                                                   <c:when test="${var.id <= 10}">
                                                                               <span id="lg${var.id}" class="checkbox ">
                                                                                   </c:when>
                                                                                   <c:otherwise>
                                                                               <span id="lg${var.id}" class="checkbox hide-check">
                                                                                   </c:otherwise>
                                                                               </c:choose> 
                                                                                    <input name="langCheckbox" value="${var.id}" type="checkbox" 
                                                                                           <c:forEach items="${individualModel.individualExt.languages}" var="lang">
                                                                                             <c:if test="${lang.id==var.id}">
                                                                                               <c:out value="checked"/>
                                                                                             </c:if>
                                                                                           </c:forEach> /> 
                                                                                    ${var.language}
                                                                                </span>
                                                                            </c:forEach>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <c:forEach items="${individualModel.languageEnum}" var="var">
                                                                               <c:choose> 
                                                                                   <c:when test="${var.id <= 10}">
                                                                               <span id="lg${var.id}" class="checkbox ">
                                                                                   </c:when>
                                                                                   <c:otherwise>
                                                                               <span id="lg${var.id}" class="checkbox hide-check">
                                                                                   </c:otherwise>
                                                                               </c:choose> 
                                                                                    <input name="langCheckbox" value="${var.id}" type="checkbox"/>${var.language}
                                                                                </span>
                                                                            </c:forEach>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                    <a class="more-check" id="lg_more_hide" onclick="more_hide('lg','lg_more_hide', ${fn:length(individualModel.languageEnum)})">更多&gt;&gt;</a>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <span class="form-label">专业领域</span>
                                                                <div class="form-control">
                                                                    <c:choose>
                                                                        <c:when test="${ !empty individualModel.individualExt }">
                                                                            <c:forEach items="${individualModel.fieldEnum}" var="var">
                                                                               <c:choose> 
                                                                                   <c:when test="${var.id <= 10}">
                                                                               <span id="fd${var.id}" class="checkbox ">
                                                                                   </c:when>
                                                                                   <c:otherwise>
                                                                               <span id="fd${var.id}" class="checkbox hide-check">
                                                                                   </c:otherwise>
                                                                               </c:choose> 
                                                                                    <input name="fieldCheckbox" value="${var.id}" type="checkbox" 
                                                                                           <c:forEach items="${individualModel.individualExt.fields}" var="field">
                                                                                               <c:if test="${field.id==var.id}">
                                                                                                   <c:out value="checked"/>
                                                                                               </c:if>
                                                                                           </c:forEach> />
                                                                                    ${var.field}
                                                                                </span>
                                                                            </c:forEach>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <c:forEach items="${individualModel.fieldEnum}" var="var">
                                                                               <c:choose> 
                                                                                   <c:when test="${var.id <= 10}">
                                                                               <span id="fd${var.id}" class="checkbox ">
                                                                                   </c:when>
                                                                                   <c:otherwise>
                                                                               <span id="fd${var.id}" class="checkbox hide-check">
                                                                                   </c:otherwise>
                                                                               </c:choose> 
                                                                                   <input name="fieldCheckbox" value="${var.id}" type="checkbox"/>${var.field}
                                                                               </span>
                                                                            </c:forEach>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                    <a class="more-check" id="fd_more_hide" onclick="more_hide('fd','fd_more_hide', ${fn:length(individualModel.fieldEnum)})">更多&gt;&gt;</a>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <span class="form-label">文档类型</span>
                                                                <div class="form-control">
                                                                    <c:choose>
                                                                        <c:when test="${ !empty individualModel.individualExt }">
                                                                            <c:forEach items="${individualModel.doctypeEnum}" var="var">
                                                                               <c:choose> 
                                                                                   <c:when test="${var.id <= 10}">
                                                                               <span id="dt${var.id}" class="checkbox ">
                                                                                   </c:when>
                                                                                   <c:otherwise>
                                                                               <span id="dt${var.id}" class="checkbox hide-check">
                                                                                   </c:otherwise>
                                                                               </c:choose> 
                                                                                    <input name="doctypeCheckbox" value="${var.id}" type="checkbox" 
                                                                                           <c:forEach items="${individualModel.individualExt.doctypes}" var="doctype">
                                                                                               <c:if test="${doctype.id==var.id}">
                                                                                                   <c:out value="checked"/>
                                                                                               </c:if>
                                                                                           </c:forEach> />
                                                                                    ${var.doctype}
                                                                                </span>
                                                                            </c:forEach>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <c:forEach items="${individualModel.doctypeEnum}" var="var">
                                                                               <c:choose> 
                                                                                   <c:when test="${var.id <= 10}">
                                                                               <span id="dt${var.id}" class="checkbox ">
                                                                                   </c:when>
                                                                                   <c:otherwise>
                                                                               <span id="dt${var.id}" class="checkbox hide-check">
                                                                                   </c:otherwise>
                                                                               </c:choose> 
                                                                                   <input name="doctypeCheckbox" value="${var.id}" type="checkbox"/>${var.doctype}
                                                                               </span>
                                                                            </c:forEach>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                    <a class="more-check" id="dt_more_hide" onclick="more_hide('dt','dt_more_hide', ${fn:length(individualModel.doctypeEnum)})">更多&gt;&gt;</a>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <span class="form-label">翻译类型</span>
                                                                <div class="form-control">
                                                                    <c:choose>
                                                                        <c:when test="${ !empty individualModel.individualExt }">
                                                                            <c:forEach items="${individualModel.transtypeEnum}" var="var">
                                                                               <span class="checkbox ">
                                                                                    <input name="transtypeCheckbox" value="${var.id}" type="checkbox" 
                                                                                        <c:forEach items="${individualModel.individualExt.transtypes}" var="transtype">
                                                                                            <c:if test="${transtype.id==var.id}">
                                                                                                <c:out value="checked"/>
                                                                                            </c:if>
                                                                                        </c:forEach> />
                                                                                    ${var.transtype}
                                                                                </span>
                                                                            </c:forEach>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <c:forEach items="${individualModel.transtypeEnum}" var="var">
                                                                                <span class="checkbox ">
                                                                                    <input name="transtypeCheckbox" value="${var.id}" type="checkbox"/>${var.transtype}
                                                                               </span>
                                                                            </c:forEach>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </div>
                                                            </div>
                                                            <div class="clearfix">
                                                                <div class="form-group form-item2">
                                                                    <span class="form-label">工作经验</span>
                                                                    <div class="form-control">
                                                                        <input id="expYIpt" type="text" name="individualExt.exp_year" value="<c:out value="${ individualModel.individualExt.exp_year }" escapeXml="true" />" />
                                                                        <span class="unit">年</span>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group form-item2">
                                                                    <span class="form-label">翻译经验</span>
                                                                    <div class="form-control">
                                                                        <input id="expTIpt" type="text" name="individualExt.exp_trans" value="<c:out value="${ individualModel.individualExt.exp_trans }" escapeXml="true" />" />
                                                                        <span class="unit">万字</span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <span class="form-label">翻译作品</span>
                                                                <div class="form-control">
                                                                    <c:choose>
                                                                        <c:when test="${ !empty individualModel.individualExt }">
                                                                            <textarea id="worksTA" name="individualExt.works" rows="3">${individualModel.individualExt.works}</textarea>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <textarea id="worksTA" name="individualExt.works" rows="3">限长128个中文字符或者256个英文字符</textarea>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <span class="form-label">个人简介</span>
                                                                <div class="form-control">
                                                                    <c:choose>
                                                                        <c:when test="${ !empty individualModel.individualExt }">
                                                                            <textarea id="introTA" name="individualExt.introduct" rows="3">${individualModel.individualExt.introduct}</textarea>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <textarea id="introTA" name="individualExt.introduct" rows="3">限长512个中文字符或者1024个英文字符</textarea>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <span class="form-label">个人主页</span>
                                                                <div class="form-control">
                                                                    <input type="text" name="individualExt.mainpage" value="<c:out value="${ individualModel.individualExt.mainpage }" escapeXml="true" />" />
                                                                </div>
                                                            </div>
                
                                                            <input type="hidden" value="${individualModel.individualExt.id}" name="individualExt.id"/>
                        
                                                            <div class="form-btns">
                                                                <input class="form-submit blue-btn form-submit-s" type="button" value="保存" onclick="doCreateOrEditIndiv(${userId}, 1, 0)">
                                                                <input class="form-submit blue-btn form-submit-s" type="button" value="取消" onclick="doCreateOrEditIndiv(${userId}, 1, 1)">
                                                            </div>                         
                                                        </form>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="img-upload clearfix">
                                                            <div class="img-preview"></div>
                                                            <div class="img-upload-form">
                                                                <form id="uploadForm" name="uploadForm" method="post" enctype="multipart/form-data" target="_self">
                                                                    <input id="upfile" name="upfile" class="upload-input" type="file" multiple="false" />
                                                                    <p>请选择小于2M的图片</p>
                                                                    <div class="form-btns">
                                                                        <input class="form-submit blue-btn form-submit-s" type="button" value="提交" onclick="doCreateOrEditIndiv(${userId}, ${step}, 0)">
                                                                        <input class="form-submit blue-btn form-submit-s" type="button" value="跳过" onclick="doCreateOrEditIndiv(${userId}, ${step}, 1)">
                                                                    </div> 
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>                               
                            </div>
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
<script src="ybjs/jquery-1.7.2.js"></script>
<script src="ybjs/jquery.validate.min.js"></script>
<script src="ybjs/messages_zh.js"></script>
<script src="ybjs/form.js"></script>

<script type="text/javascript">
    //IE doesn't support string trim, this makes it support;
    String.prototype.trim=function(){return this.replace(/(^\s*)|(\s*$)/g,"");}

    function validateUser()
    {
        var digitPattern = /^\d+(\.\d+)?$/;

        var pwd = document.getElementById("pwdInput").value;
        if(pwd==null || pwd=="")
        {
            alert("密码不能为空");
            return 0;
        }
        if(pwd.length < 6 || pwd.length > 10)
        {
            alert("密码长度必须6到10位");
            return 0;
        }

        var mob = document.getElementById("mobInput").value;
        if(mob!=null) mob=mob.trim();
        if(mob==null || mob=="")
        {
            alert("移动电话号码不能为空");
            return 0;
        }

        if(!digitPattern.test(mob))
        {
            alert("移动电话号码必须为数字");
            return 0;
        }
        if(mob.length < 11 || mob.length > 16)
        {
            alert("移动电话号码长度不正确");
            return 0;
        }

        var tel = document.getElementById("telInput").value;
        if(tel!=null) 
        {
            tel=tel.trim();
            if(tel != "")
            {
                if(!digitPattern.test(tel))
                {
                    alert("固定电话号码必须为数字");
                    return 0;
                }
                if(tel.length < 7 || tel.length > 16)
                {
                    alert("固定电话号码长度不正确");
                    return 0;
                }
            }
        }

        var fax = document.getElementById("faxInput").value;
        if(fax!=null) 
        {
            fax=fax.trim();
            if(fax != "")
            {
                if(!digitPattern.test(fax))
                {
                    alert("传真号码必须为数字");
                    return 0;
                }
                if(fax.length < 7 || fax.length > 16)
                {
                    alert("传真号码长度不正确");
                    return 0;
                }
            }
        }

        var qq = document.getElementById("qqInput").value;
        if(qq!=null) 
        {
            qq=qq.trim();
            if(qq != "")
            {
                if(!digitPattern.test(qq))
                {
                    alert("QQ号码必须为数字");
                    return 0;
                }
                if(qq.length < 4 || qq.length > 16)
                {
                    alert("QQ号码长度不正确");
                    return 0;
                }
            }
        }

        var wx = document.getElementById("wxInput").value;
        if(wx!=null) 
        {
            wx=wx.trim();
            if(wx != "")
            {
                if(getLength(wx) > 32)
                {
                    alert("微信号码长度不正确");
                    return 0;
                }
            }
        }

        return 1;
    }

    function doUserEdit(cancel){
        var form = document.getElementById("userForm");
        if(cancel==1)
        {
            document.getElementById("pwdInput").value="";
            document.getElementById("mobInput").value="";
            document.getElementById("telInput").value="";
            document.getElementById("faxInput").value="";
            document.getElementById("qqInput").value="";
            document.getElementById("wxInput").value="";
            form.action = "<%=request.getContextPath()%>/doUserEdit.action?cancel=1";
            form.submit();
        }
        else
        {
            if(validateUser()==1)
            {
                form.action = "<%=request.getContextPath()%>/doUserEdit.action";
                form.submit();
            }
        }
    }


    function HiddenSettingsObj()
    {
        this["lg"]=1; //language:         controlled by user and hidden initially;
        this["dt"]=1; //doc type:         controlled by user and hidden initially;
        this["fd"]=1; //field:            controlled by user and hidden initially;
    }

    //global variables;
    hiddenSettingsObj = new HiddenSettingsObj();

    function isIE()
    {  
      if (window.navigator.userAgent.toLowerCase().indexOf("msie")>=1) 
        return true; 
      else 
        return false; 
    } 

    function more_hide(cond, elemtId, total)
    {
      var more_hide_elemt = document.getElementById(elemtId);

      if(hiddenSettingsObj[cond] == 1) //hidden currently, so expand
      {
        for (var i=1; i<=total; i++) 
        {
          var elmt = document.getElementById(cond+i);
          if(elmt != null)
            elmt.className = "checkbox";
        }

        //set to expanded
        if(isIE())
          more_hide_elemt.innerText = "隐藏<<";
        else
          more_hide_elemt.textContent = "隐藏<<";
        hiddenSettingsObj[cond] = 0; 
      }
      else //expanded currently, so hide
      {
        for (var i=1; i<=total; i++) 
        {
          var elmt = document.getElementById(cond+i);
          if(elmt != null)
          {
            if(i<=10)
              elmt.className = "checkbox";
            else
              elmt.className = "checkbox hide-check";
          }
        }

        //set to hidden
        if(isIE())
          more_hide_elemt.innerText = "更多>>";
        else
          more_hide_elemt.textContent = "更多>>";
        hiddenSettingsObj[cond] = 1; 
      }
    }

    function getLength(str)
    {
        var count = 0;
        for(var i = 0; i < str.length; i++) 
        {
            count++;
            if(escape(str.charAt(i)).length > 4) count++;
        }
        return count;
    }


    function validateIndiv()
    {
        var name = document.getElementById("iNameIpt").value;
        if(name!=null) name=name.trim();

        if(name==null || name=="")
        {
            alert("姓名不能为空");
            return 0;
        }

        if( getLength(name) > 16)
        {
            alert("姓名长度不正确");
            return 0;
        }

        var digitPattern = /^\d+(\.\d+)?$/;

        var expY = document.getElementById("expYIpt").value;
        if(expY!=null) 
        {
            expY=expY.trim();
            if(expY != "")
            {
                if(!digitPattern.test(expY))
                {
                    alert("工作经验(年)必须为数字");
                    return 0;
                }
            }
        }

        var expT = document.getElementById("expTIpt").value;
        if(expT!=null) 
        {
            expT=expT.trim();
            if(expT != "")
            {
                if(!digitPattern.test(expT))
                {
                    alert("翻译经验(万字)必须为数字");
                    return 0;
                }
            }
        }

        var works = document.getElementById("worksTA").value;
        if(works!=null) 
        {
            works = works.trim();
            if(getLength(works)>256)
            {
                alert("翻译作品长度太大");
                return 0;
            }
        }

        var intro = document.getElementById("introTA").value;
        if(intro!=null) 
        {
            intro = intro.trim();
            if(getLength(intro)>1024)
            {
                alert("个人简介长度太大");
                return 0;
            }
        }

        return 1;
    }

    function strEndWith(str, suffix)
    {
        var reg=new RegExp(suffix+"$");
        return reg.test(str);
    }

    //step 1 can be canclled and other steps can be skipped. Thus if step is 1, the last parameter indicates cancel or not, and
    //if the step is not 1, the last parameter indicates skip or not;
    function doCreateOrEditIndiv(userId, step, cancelOrSkip)
    {
        var action = "<%=request.getContextPath()%>/doCreateOrEditIndiv.action?id="+userId+"&step="+step;

        if(step == 1) //step 1
        {
            var indivForm = document.getElementById("indivForm");
            if(cancelOrSkip==1)
            {
                indivForm.action = action+"&cancel=1";
                indivForm.submit();
            }
            else
            {
                indivForm.action = action;
                if(validateIndiv()==1)
                {
                    indivForm.submit();
                }
            }
        }
        else //not step 1
        {
            var upForm = document.getElementById("uploadForm");
            if(cancelOrSkip==1)
            {
                upForm.action = action+"&skip=1";
                upForm.submit();
            }
            else
            {
                var fileName = document.getElementById("upfile").value;
                if(fileName!=null) fileName=fileName.trim();

                if(fileName==null || fileName=="")
                {
                    alert("请选择文件");
                    return;
                }

                if( !strEndWith(fileName,".png") && 
                    !strEndWith(fileName,".jpg") && 
                    !strEndWith(fileName,".jpe") && 
                    !strEndWith(fileName,".jpeg") &&
                    !strEndWith(fileName,".gif") &&
                    !strEndWith(fileName,".jfif") )
                {
                    alert("只能选择.png，.jpg，.jpe，.jpeg，.gif或.jfif文件");
                    return;
                }

                upForm.action = action;
                upForm.submit();
            }
        }
    }
</script>
</body>
</html>
