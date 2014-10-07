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

        <tr>
          <td>近期照片：</td>
          <td>
            <c:if test="${!empty individualModel.individualExt.photo_suffix}">
              <img src="/ybfiles/individual/${individualModel.individualExt.id}/photo/large${individualModel.individualExt.photo_suffix}" />
            </c:if>            
          </td>
        </tr>

        <tr>
          <td>姓名：</td>
          <td>
            <c:if test="${!empty individualModel.individualExt.name}">
              <c:out value="${individualModel.individualExt.name }" escapeXml="true" />
            </c:if>            
          </td>
        </tr>

        <tr>
          <td>性别：</td>
          <td>
            <c:if test="${ individualModel.individualExt.gender eq 0 }">
              <c:out value="男" escapeXml="true" />
            </c:if>            
            <c:if test="${ individualModel.individualExt.gender eq 1 }">
              <c:out value="女" escapeXml="true" />
            </c:if>            
          </td>
        </tr>
                  
        <tr>
          <td>教育水平：</td>
          <td>
            <c:if test="${!empty individualModel.individualExt.education}">
              <c:out value="${individualModel.individualExt.education.education }" escapeXml="true" />
            </c:if>            
          </td>
        </tr>

        <tr>
          <td>毕业院校：</td>
          <td>
            <c:if test="${!empty individualModel.individualExt.school}">
              <c:out value="${individualModel.individualExt.school.school }" escapeXml="true" />
            </c:if>            
          </td>
        </tr>
                  
        <tr>
          <td>出生年：</td>
          <td>
            <c:if test="${!empty individualModel.individualExt.birth_year}">
              <c:out value="${individualModel.individualExt.birth_year }" escapeXml="true" />
            </c:if>            
          </td>
        </tr>
                  
        <tr>
          <td>所在城市：</td>
          <td>
            <c:if test="${!empty individualModel.individualExt.city}">
              <c:out value="${individualModel.individualExt.city.city }" escapeXml="true" />
            </c:if>            
          </td>
        </tr>

        <tr>
          <td>工作方式：</td>
          <td>
            <c:if test="${ individualModel.individualExt.workstyle eq 0 }">
              <c:out value="全职" escapeXml="true" />
            </c:if>            
            <c:if test="${ individualModel.individualExt.workstyle eq 1 }">
              <c:out value="兼职" escapeXml="true" />
            </c:if>            
          </td>
        </tr>

        <tr>
          <td>语种：</td>
          <td>
            <c:if test="${!empty individualModel.individualExt.languages}">
              <c:forEach var="var" items="${individualModel.individualExt.languages}">
                <c:out value="${var.language}" escapeXml="true" />&nbsp;&nbsp;
              </c:forEach>
            </c:if>            
          </td>
        </tr>

        <tr>
          <td>专业领域：</td>
          <td>
            <c:if test="${!empty individualModel.individualExt.fields}">
              <c:forEach var="var" items="${individualModel.individualExt.fields}">
                <c:out value="${var.field}" escapeXml="true" />&nbsp;&nbsp;
              </c:forEach>
            </c:if>            
          </td>
        </tr>

        <tr>
          <td>翻译类型：</td>
          <td>
            <c:if test="${!empty individualModel.individualExt.transtypes}">
              <c:forEach var="var" items="${individualModel.individualExt.transtypes}">
                <c:out value="${var.transtype}" escapeXml="true" />&nbsp;&nbsp;
              </c:forEach>
            </c:if>            
          </td>
        </tr>

        <tr>
          <td>文档类型：</td>
          <td>
            <c:if test="${!empty individualModel.individualExt.doctypes}">
              <c:forEach var="var" items="${individualModel.individualExt.doctypes}">
                <c:out value="${var.doctype}" escapeXml="true" />&nbsp;&nbsp;
              </c:forEach>
            </c:if>            
          </td>
        </tr>

                  
        <tr>
          <td>语言等级证书：</td>
          <td>
            <c:if test="${!empty individualModel.individualExt.lang_cert}">
              <c:out value="${individualModel.individualExt.lang_cert }" escapeXml="true" />
            </c:if>            
          </td>
        </tr>
                  
        <tr>
          <td>翻译证书：</td>
          <td>
            <c:if test="${!empty individualModel.individualExt.trans_cert}">
              <c:out value="${individualModel.individualExt.trans_cert }" escapeXml="true" />
            </c:if>            
          </td>
        </tr>
                  
        <tr>
          <td>专业证书：</td>
          <td>
            <c:if test="${!empty individualModel.individualExt.prof_cert}">
              <c:out value="${individualModel.individualExt.prof_cert }" escapeXml="true" />
            </c:if>            
          </td>
        </tr>
                  
        <tr>
          <td>工作年限：</td>
          <td>
            <c:if test="${!empty individualModel.individualExt.exp_year}">
              <c:out value="${individualModel.individualExt.exp_year }(年)" escapeXml="true" />
            </c:if>            
          </td>
        </tr>
                  
        <tr>
          <td>翻译经验：</td>
          <td>
            <c:if test="${!empty individualModel.individualExt.exp_trans}">
              <c:out value="${individualModel.individualExt.exp_trans }(万字)" escapeXml="true" />
            </c:if>            
          </td>
        </tr>
                  
        <tr>
          <td>翻译作品：</td>
          <td>
            <c:if test="${!empty individualModel.individualExt.works}">
              <c:out value="${individualModel.individualExt.works }" escapeXml="true" />
            </c:if>            
          </td>
        </tr>

        <tr>
          <td>个人简介：</td>
          <td>
            <c:if test="${!empty individualModel.individualExt.introduct}">
              <c:out value="${individualModel.individualExt.introduct }" escapeXml="true" />
            </c:if>            
          </td>
        </tr>

        <tr>
          <td>个人主页：</td>
          <td>
            <c:if test="${!empty individualModel.individualExt.mainpage}">
              <a href="${individualModel.individualExt.mainpage }" style="color:blue;">
                <c:out value="${individualModel.individualExt.mainpage }" escapeXml="true" />
              </a>
            </c:if>            
          </td>
        </tr>

        <tr>
          <td>认证资料：</td>
          <td>
            <c:if test="${!empty individualModel.individualExt.auth_file}">
              <c:out value="${individualModel.individualExt.auth_file }" escapeXml="true" />
            </c:if>
          </td>
        </tr>
                  
        <tr>
          <td>是否通过认证：</td>
          <td>
            <c:if test="${ individualModel.individualExt.auth_pass eq 1 }">
              <c:out value="是" escapeXml="true" />
            </c:if>            
            <c:if test="${ individualModel.individualExt.auth_pass eq 0 }">
              <c:out value="否" escapeXml="true" />
            </c:if>            
          </td>
        </tr>

                  
        <tr>
          <td>推荐位：</td>
          <td>
            <c:if test="${!empty individualModel.individualExt.recompos}">
              <c:out value="${individualModel.individualExt.recompos.recompos }" escapeXml="true" />
            </c:if>            
          </td>
        </tr>

        <tr>
          <td>邮箱：</td>
          <td>
            <c:if test="${!empty individualModel.individualExt.user.email}">
              <c:out value="${individualModel.individualExt.user.email }" escapeXml="true" />
            </c:if>            
          </td>
        </tr>

        <tr>
          <td>固定电话：</td>
          <td>
            <c:if test="${!empty individualModel.individualExt.user.tel}">
              <c:out value="${individualModel.individualExt.user.tel }" escapeXml="true" />
            </c:if>            
          </td>
        </tr>

        <tr>
          <td>移动电话：</td>
          <td>
            <c:if test="${!empty individualModel.individualExt.user.mobile}">
              <c:out value="${individualModel.individualExt.user.mobile }" escapeXml="true" />
            </c:if>            
          </td>
        </tr>

        <tr>
          <td>传真：</td>
          <td>
            <c:if test="${!empty individualModel.individualExt.user.fax}">
              <c:out value="${individualModel.individualExt.user.fax }" escapeXml="true" />
            </c:if>            
          </td>
        </tr>

        <tr>
          <td>QQ：</td>
          <td>
            <c:if test="${!empty individualModel.individualExt.user.qq}">
              <c:out value="${individualModel.individualExt.user.qq }" escapeXml="true" />
            </c:if>            
          </td>
        </tr>

        <tr>
          <td>微信：</td>
          <td>
            <c:if test="${!empty individualModel.individualExt.user.weixin}">
              <c:out value="${individualModel.individualExt.user.weixin }" escapeXml="true" />
            </c:if>            
          </td>
        </tr>
                  
    </tbody>
  </table>
</div>
</body>
</html>
