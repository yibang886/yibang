<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/core/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户名</title>
<%@ include file="/core/includecss.jsp"%>
</head>
<body>
<div id="wrapper">
  <table class="table_add">
    <tbody>

        <c:if test="${!empty individualModel.individualExt.photo_suffix}">
            <tr>
              <td>近期照片：</td>
              <td><img src="/ybfiles/individual/${individualModel.individualExt.id}/photo/large${individualModel.individualExt.photo_suffix}" /></td>
            </tr>
        </c:if>            

        <c:if test="${!empty individualModel.individualExt.name}">
          <tr><td>姓名：</td><td><c:out value="${individualModel.individualExt.name }" escapeXml="true" /></td></tr>
        </c:if>            
                  
        <c:if test="${ individualModel.individualExt.gender eq 0 }">
          <tr><td>性别：</td><td><c:out value="男" escapeXml="true" /></td></tr>
        </c:if>            

        <c:if test="${ individualModel.individualExt.gender eq 1 }">
          <tr><td>性别：</td><td><c:out value="女" escapeXml="true" /></td></tr>
        </c:if>            
                  
        <c:if test="${!empty individualModel.individualExt.education}">
          <tr><td>教育水平：</td><td><c:out value="${individualModel.individualExt.education.education }" escapeXml="true" /></td></tr>
        </c:if>            

        <c:if test="${!empty individualModel.individualExt.school}">
          <tr><td>毕业院校：</td><td><c:out value="${individualModel.individualExt.school.school }" escapeXml="true" /></td></tr>
        </c:if>            
                  
        <c:if test="${!empty individualModel.individualExt.birth_year}">
          <tr><td>出生：</td><td><c:out value="${individualModel.individualExt.birth_year }" escapeXml="true" /></td></tr>
        </c:if>            
                  
        <c:if test="${!empty individualModel.individualExt.city}">
          <tr><td>所在城市：</td><td><c:out value="${individualModel.individualExt.city.city }" escapeXml="true" /></td></tr>
        </c:if>            

        <c:if test="${ individualModel.individualExt.workstyle eq 0 }">
          <tr><td>工作方式：</td><td><c:out value="全职" escapeXml="true" /></td></tr>
        </c:if>            

        <c:if test="${ individualModel.individualExt.workstyle eq 1 }">
          <tr><td>工作方式：</td><td><c:out value="兼职" escapeXml="true" /></td></tr>
        </c:if>            

        <c:if test="${!empty individualModel.individualExt.languages}">
          <tr>
            <td>语种：</td>
            <td>
              <c:forEach var="var" items="${individualModel.individualExt.languages}">
                <c:out value="${var.language}" escapeXml="true" />&nbsp;&nbsp;
              </c:forEach>
            </td>
          </tr>
        </c:if>            

        <c:if test="${!empty individualModel.individualExt.fields}">
          <tr>
            <td>专业领域：</td>
            <td>
              <c:forEach var="var" items="${individualModel.individualExt.fields}">
                <c:out value="${var.field}" escapeXml="true" />&nbsp;&nbsp;
              </c:forEach>
            </td>
          </tr>
        </c:if>            

        <c:if test="${!empty individualModel.individualExt.transtypes}">
          <tr>
            <td>翻译类型：</td>
            <td>
              <c:forEach var="var" items="${individualModel.individualExt.transtypes}">
                <c:out value="${var.transtype}" escapeXml="true" />&nbsp;&nbsp;
              </c:forEach>
            </td>
          </tr>
        </c:if>            

        <c:if test="${!empty individualModel.individualExt.doctypes}">
          <tr>
            <td>文档类型：</td>
            <td>
              <c:forEach var="var" items="${individualModel.individualExt.doctypes}">
                <c:out value="${var.doctype}" escapeXml="true" />&nbsp;&nbsp;
              </c:forEach>
            </td>
          </tr>
        </c:if>            

                  
        <c:if test="${!empty individualModel.individualExt.lang_cert}">
          <tr><td>语言等级证书：</td><td><c:out value="${individualModel.individualExt.lang_cert }" escapeXml="true" /></td></tr>
        </c:if>            
                  
        <c:if test="${!empty individualModel.individualExt.trans_cert}">
          <tr><td>翻译证书：</td><td><c:out value="${individualModel.individualExt.trans_cert }" escapeXml="true" /></td></tr>
        </c:if>            
                  
        <c:if test="${!empty individualModel.individualExt.prof_cert}">
          <tr><td>专业证书：</td><td><c:out value="${individualModel.individualExt.prof_cert }" escapeXml="true" /></td></tr>
        </c:if>            
                  
        <c:if test="${!empty individualModel.individualExt.exp_year}">
          <tr><td>工作年限：</td><td><c:out value="${individualModel.individualExt.exp_year }(年)" escapeXml="true" /></td></tr>
        </c:if>            
                  
        <c:if test="${!empty individualModel.individualExt.exp_trans}">
          <tr><td>翻译经验：</td><td><c:out value="${individualModel.individualExt.exp_trans }(万字)" escapeXml="true" /></td></tr>
        </c:if>            
                  
        <c:if test="${!empty individualModel.individualExt.works}">
          <tr><td>翻译作品：</td><td><c:out value="${individualModel.individualExt.works }" escapeXml="true" /></td></tr>
        </c:if>            

        <c:if test="${!empty individualModel.individualExt.auth_file}">
          <tr><td>认证资料：</td><td><c:out value="${individualModel.individualExt.auth_file }" escapeXml="true" /></td></tr>
        </c:if>            
                  
        <c:if test="${ individualModel.individualExt.auth_pass eq 0 }">
          <tr><td>是否通过认证：</td><td><c:out value="否" escapeXml="true" /></td></tr>
        </c:if>            

        <c:if test="${ individualModel.individualExt.auth_pass eq 1 }">
          <tr><td>是否通过认证：</td><td><c:out value="是" escapeXml="true" /></td></tr>
        </c:if>            

        <c:if test="${!empty individualModel.individualExt.introduct}">
          <tr><td>个人简介：</td><td><c:out value="${individualModel.individualExt.introduct }" escapeXml="true" /></td></tr>
        </c:if>            

        <!--
        <c:if test="${!empty individualModel.individualExt.mainpage}">
          <tr><td>个人主页：</td><td><c:out value="${individualModel.individualExt.mainpage }" escapeXml="true" /></td></tr>
        </c:if>            
        -->

        <c:if test="${!empty individualModel.individualExt.mainpage}">
          <tr>
            <td>个人主页：</td>
            <td>
              <a href="${individualModel.individualExt.mainpage }" style="color:blue;">
                <c:out value="${individualModel.individualExt.mainpage }" escapeXml="true" />
              </a>
            </td>
          </tr>
        </c:if>            
                  
        <c:if test="${!empty individualModel.individualExt.recompos}">
          <tr>
            <td>推荐位：</td>
            <td>
              <c:out value="${individualModel.individualExt.recompos.recompos }" escapeXml="true" />
            </td>
          </tr>
        </c:if>            

        <c:if test="${!empty individualModel.individualExt.user.email}">
          <tr><td>邮箱：</td><td><c:out value="${individualModel.individualExt.user.email }" escapeXml="true" /></td></tr>
        </c:if>            

        <c:if test="${!empty individualModel.individualExt.user.tel}">
          <tr><td>固定电话：</td><td><c:out value="${individualModel.individualExt.user.tel }" escapeXml="true" /></td></tr>
        </c:if>            

        <c:if test="${!empty individualModel.individualExt.user.mobile}">
          <tr><td>移动电话：</td><td><c:out value="${individualModel.individualExt.user.mobile }" escapeXml="true" /></td></tr>
        </c:if>            

        <c:if test="${!empty individualModel.individualExt.user.fax}">
          <tr><td>传真：</td><td><c:out value="${individualModel.individualExt.user.fax }" escapeXml="true" /></td></tr>
        </c:if>            

        <c:if test="${!empty individualModel.individualExt.user.qq}">
          <tr><td>QQ：</td><td><c:out value="${individualModel.individualExt.user.qq }" escapeXml="true" /></td></tr>
        </c:if>            

        <c:if test="${!empty individualModel.individualExt.user.weixin}">
          <tr><td>微信：</td><td><c:out value="${individualModel.individualExt.user.weixin }" escapeXml="true" /></td></tr>
        </c:if>            
                  
    </tbody>
  </table>
</div>
</body>
</html>
