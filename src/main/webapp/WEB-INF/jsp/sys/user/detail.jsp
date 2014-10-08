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
  <table border="0" cellpadding="0" cellspacing="0" class="table_date" id="dataTable">
    <tr>
      <th width="15%"><div>项目 </div></th>
      <th width="85%"><div>信息 </div></th>
    </tr>
    
    <tr>
      <td><div>登录邮箱：</div></td>
      <td>
        <div>
          <c:if test="${!empty userModel.userExt.email}">
            <c:out value="${userModel.userExt.email }" escapeXml="true" />
          </c:if>            
        </div>
      </td>
    </tr>
    
    <tr>
      <td><div>密码：</div></td>
      <td>
        <div>
          <c:if test="${!empty userModel.userExt.password}">
            <c:out value="${userModel.userExt.password}" escapeXml="true"/>
          </c:if>            
        </div>
      </td>
    </tr>
                  
    <tr>
      <td><div>固定电话：</div></td>
      <td>
        <div>
          <c:if test="${!empty userModel.userExt.tel}">
            <c:out value="${userModel.userExt.tel}" escapeXml="true"/>
          </c:if>            
        </div>
      </td>
    </tr>

    <tr>
      <td><div>移动电话：</div></td>
      <td>
        <div>
          <c:if test="${!empty userModel.userExt.mobile}">
            <c:out value="${userModel.userExt.mobile}" escapeXml="true"/>
          </c:if>            
        </div>
      </td>
    </tr>
                  
    <tr>
      <td><div>传真：</div></td>
      <td>
        <div>
          <c:if test="${!empty userModel.userExt.fax}">
            <c:out value="${userModel.userExt.fax}" escapeXml="true"/>
          </c:if>            
        </div>
      </td>
    </tr>

    <tr>
      <td><div>QQ号码：</div></td>
      <td>
        <div>
          <c:if test="${!empty userModel.userExt.qq}">
            <c:out value="${userModel.userExt.qq}" escapeXml="true"/>
          </c:if>            
        </div>
      </td>
    </tr>

    <tr>
      <td><div>微信：</div></td>
      <td>
        <div>
          <c:if test="${!empty userModel.userExt.weixin}">
            <c:out value="${userModel.userExt.weixin}" escapeXml="true"/>
          </c:if>            
        </div>
      </td>
    </tr>

    <tr>
      <td><div>用户类型：</div></td>
      <td>
        <div>
          <c:if test="${userModel.userExt.user_type==0}">个人译员</c:if>            
          <c:if test="${userModel.userExt.user_type==1}">翻译公司</c:if>            
        </div>
      </td>
    </tr>
                  
    <tr>
      <td><div>金币数：</div></td>
      <td>
        <div>
          <c:if test="${!empty userModel.userExt.coin}">
            <c:out value="${userModel.userExt.coin}" escapeXml="true"/>
          </c:if>            
        </div>
      </td>
    </tr>
  </table>
</div>
</body>
</html>
