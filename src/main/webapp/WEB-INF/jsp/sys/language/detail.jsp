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
    
        <c:if test="${!empty languageModel.languageExt.language}">
          <tr><td>语种：</td><td><c:out value="${languageModel.languageExt.language }" escapeXml="true" /></td></tr>
        </c:if>            

        <c:if test="${!empty languageModel.languageExt.individuals}">
          <tr>
            <td>自由译员：</td>
            <td>
              <c:forEach var="var" items="${languageModel.languageExt.individuals}">
                <c:out value="${var.name}" escapeXml="true" />&nbsp;&nbsp;
              </c:forEach>
            </td>
          </tr>
        </c:if>
                  
    </tbody>
  </table>
</div>
</body>
</html>
