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
		
						<c:if test="${!empty userModel.userExt.email}">
						<tr><td>登录邮箱：</td><td><c:out value="${userModel.userExt.email }" escapeXml="true" /></td></tr>
						</c:if>				    
							    
				<c:if test="${!empty userModel.userExt.password}">
						<tr><td>密码：</td><td><c:out value="${userModel.userExt.password }" escapeXml="true" /></td></tr>
						</c:if>				    
							    
				<c:if test="${!empty userModel.userExt.tel}">
						<tr><td>固定电话：</td><td><c:out value="${userModel.userExt.tel }" escapeXml="true" /></td></tr>
						</c:if>				    
							    
				<c:if test="${!empty userModel.userExt.mobile}">
						<tr><td>移动电话：</td><td><c:out value="${userModel.userExt.mobile }" escapeXml="true" /></td></tr>
						</c:if>				    
							    
				<c:if test="${!empty userModel.userExt.fax}">
						<tr><td>传真：</td><td><c:out value="${userModel.userExt.fax }" escapeXml="true" /></td></tr>
						</c:if>				    
							    
				<c:if test="${!empty userModel.userExt.qq}">
						<tr><td>QQ号码：</td><td><c:out value="${userModel.userExt.qq }" escapeXml="true" /></td></tr>
						</c:if>				    
							    
				<c:if test="${!empty userModel.userExt.weixin}">
						<tr><td>微信：</td><td><c:out value="${userModel.userExt.weixin }" escapeXml="true" /></td></tr>
						</c:if>				    
							    
				<c:if test="${!empty userModel.userExt.srvcount}">
						<tr><td>发布计数：</td><td><c:out value="${userModel.userExt.srvcount }" escapeXml="true" /></td></tr>
						</c:if>				    
							    
				<c:if test="${!empty userModel.userExt.refcount}">
						<tr><td>推荐计数：</td><td><c:out value="${userModel.userExt.refcount }" escapeXml="true" /></td></tr>
						</c:if>				    
							    
		</tbody>
	</table>
</div>
</body>
</html>