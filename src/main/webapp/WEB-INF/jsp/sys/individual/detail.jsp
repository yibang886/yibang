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
		
						<c:if test="${!empty individualModel.individualExt.user_id}">
						<tr><td>发布用户：</td><td><c:out value="${individualModel.individualExt.user_id }" escapeXml="true" /></td></tr>
						</c:if>				    
							    
				<c:if test="${!empty individualModel.individualExt.name}">
						<tr><td>姓名：</td><td><c:out value="${individualModel.individualExt.name }" escapeXml="true" /></td></tr>
						</c:if>				    
							    
				<c:if test="${!empty individualModel.individualExt.gender}">
						<tr><td>性别：</td><td><c:out value="${individualModel.individualExt.gender }" escapeXml="true" /></td></tr>
						</c:if>				    
							    
				<c:if test="${!empty individualModel.individualExt.edu_id}">
						<tr><td>教育水平：</td><td><c:out value="${individualModel.individualExt.edu_id }" escapeXml="true" /></td></tr>
						</c:if>				    
							    
				<c:if test="${!empty individualModel.individualExt.sch_id}">
						<tr><td>毕业院校：</td><td><c:out value="${individualModel.individualExt.sch_id }" escapeXml="true" /></td></tr>
						</c:if>				    
							    
				<c:if test="${!empty individualModel.individualExt.birth_year}">
						<tr><td>出生：</td><td><c:out value="${individualModel.individualExt.birth_year }" escapeXml="true" /></td></tr>
						</c:if>				    
							    
				<c:if test="${!empty individualModel.individualExt.city_id}">
						<tr><td>所在城市：</td><td><c:out value="${individualModel.individualExt.city_id }" escapeXml="true" /></td></tr>
						</c:if>				    
							    
				<c:if test="${!empty individualModel.individualExt.mainpage}">
						<tr><td>个人主页：</td><td><c:out value="${individualModel.individualExt.mainpage }" escapeXml="true" /></td></tr>
						</c:if>				    
							    
				<c:if test="${!empty individualModel.individualExt.workstyle}">
						<tr><td>工作方式：</td><td><c:out value="${individualModel.individualExt.workstyle }" escapeXml="true" /></td></tr>
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
						<tr><td>工作年限：</td><td><c:out value="${individualModel.individualExt.exp_year }" escapeXml="true" /></td></tr>
						</c:if>				    
							    
				<c:if test="${!empty individualModel.individualExt.exp_trans}">
						<tr><td>翻译经验：</td><td><c:out value="${individualModel.individualExt.exp_trans }" escapeXml="true" /></td></tr>
						</c:if>				    
							    
				<c:if test="${!empty individualModel.individualExt.works}">
						<tr><td>翻译作品：</td><td><c:out value="${individualModel.individualExt.works }" escapeXml="true" /></td></tr>
						</c:if>				    
							    
				<c:if test="${!empty individualModel.individualExt.introduct}">
						<tr><td>个人简介：</td><td><c:out value="${individualModel.individualExt.introduct }" escapeXml="true" /></td></tr>
						</c:if>				    
							    
				<c:if test="${!empty individualModel.individualExt.photo}">
						<tr><td>近期照片：</td><td><c:out value="${individualModel.individualExt.photo }" escapeXml="true" /></td></tr>
						</c:if>				    
							    
				<c:if test="${!empty individualModel.individualExt.auth_file}">
						<tr><td>认证资料：</td><td><c:out value="${individualModel.individualExt.auth_file }" escapeXml="true" /></td></tr>
						</c:if>				    
							    
				<c:if test="${!empty individualModel.individualExt.auth_pass}">
						<tr><td>是否认证：</td><td><c:out value="${individualModel.individualExt.auth_pass }" escapeXml="true" /></td></tr>
						</c:if>				    
							    
				<c:if test="${!empty individualModel.individualExt.recompos_id}">
						<tr><td>推荐位：</td><td><c:out value="${individualModel.individualExt.recompos_id }" escapeXml="true" /></td></tr>
						</c:if>				    
							    
							    
		</tbody>
	</table>
</div>
</body>
</html>
