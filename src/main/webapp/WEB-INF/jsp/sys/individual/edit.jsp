<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/core/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页大图编辑页</title>
<%@ include file="/core/includecss.jsp"%>
</head>
<body>
<div id="wrapper">
    <c:if test="${ individualModel.operationType eq 'create' }">
    <input type="button" value="新建" onclick="doCreate()" />
    </c:if>
    <c:if test="${ individualModel.operationType eq 'edit' }">
    <input type="button" value="保存" onclick="doEdit()"/>
    </c:if>
    <form id="form" name="individualForm" method="post">
    <table class="table_add">
        <thead>
                                          <tr><td>发布用户：</td><td><input type="text" name="individualExt.user_id" value="<c:out value="${ individualModel.individualExt.user_id }" escapeXml="true" />" style="width:700px;"/></td></tr>
                                          <tr><td>姓名：</td><td><input type="text" name="individualExt.name" value="<c:out value="${ individualModel.individualExt.name }" escapeXml="true" />" style="width:700px;"/></td></tr>
                                          <tr><td>性别：</td><td><input type="text" name="individualExt.gender" value="<c:out value="${ individualModel.individualExt.gender }" escapeXml="true" />" style="width:700px;"/></td></tr>
                                          <tr><td>教育水平：</td><td><input type="text" name="individualExt.edu_id" value="<c:out value="${ individualModel.individualExt.edu_id }" escapeXml="true" />" style="width:700px;"/></td></tr>
                                          <tr><td>毕业院校：</td><td><input type="text" name="individualExt.sch_id" value="<c:out value="${ individualModel.individualExt.sch_id }" escapeXml="true" />" style="width:700px;"/></td></tr>
                                          <tr><td>出生：</td><td><input type="text" name="individualExt.birth_year" value="<c:out value="${ individualModel.individualExt.birth_year }" escapeXml="true" />" style="width:700px;"/></td></tr>
                                          <tr><td>所在城市：</td><td><input type="text" name="individualExt.city_id" value="<c:out value="${ individualModel.individualExt.city_id }" escapeXml="true" />" style="width:700px;"/></td></tr>
                                          <tr><td>个人主页：</td><td><input type="text" name="individualExt.mainpage" value="<c:out value="${ individualModel.individualExt.mainpage }" escapeXml="true" />" style="width:700px;"/></td></tr>
                                          <tr><td>工作方式：</td><td><input type="text" name="individualExt.workstyle" value="<c:out value="${ individualModel.individualExt.workstyle }" escapeXml="true" />" style="width:700px;"/></td></tr>
                                          <tr><td>语言等级证书：</td><td><input type="text" name="individualExt.lang_cert" value="<c:out value="${ individualModel.individualExt.lang_cert }" escapeXml="true" />" style="width:700px;"/></td></tr>
                                          <tr><td>翻译证书：</td><td><input type="text" name="individualExt.trans_cert" value="<c:out value="${ individualModel.individualExt.trans_cert }" escapeXml="true" />" style="width:700px;"/></td></tr>
                                          <tr><td>专业证书：</td><td><input type="text" name="individualExt.prof_cert" value="<c:out value="${ individualModel.individualExt.prof_cert }" escapeXml="true" />" style="width:700px;"/></td></tr>
                                          <tr><td>工作年限：</td><td><input type="text" name="individualExt.exp_year" value="<c:out value="${ individualModel.individualExt.exp_year }" escapeXml="true" />" style="width:700px;"/></td></tr>
                                          <tr><td>翻译经验：</td><td><input type="text" name="individualExt.exp_trans" value="<c:out value="${ individualModel.individualExt.exp_trans }" escapeXml="true" />" style="width:700px;"/></td></tr>
                                          <tr><td>翻译作品：</td><td><input type="text" name="individualExt.works" value="<c:out value="${ individualModel.individualExt.works }" escapeXml="true" />" style="width:700px;"/></td></tr>
                                          <tr><td>个人简介：</td><td><input type="text" name="individualExt.introduct" value="<c:out value="${ individualModel.individualExt.introduct }" escapeXml="true" />" style="width:700px;"/></td></tr>
                                          <tr><td>近期照片：</td><td><input type="text" name="individualExt.photo" value="<c:out value="${ individualModel.individualExt.photo }" escapeXml="true" />" style="width:700px;"/></td></tr>
                                          <tr><td>认证资料：</td><td><input type="text" name="individualExt.auth_file" value="<c:out value="${ individualModel.individualExt.auth_file }" escapeXml="true" />" style="width:700px;"/></td></tr>
                                          <tr><td>是否认证：</td><td><input type="text" name="individualExt.auth_pass" value="<c:out value="${ individualModel.individualExt.auth_pass }" escapeXml="true" />" style="width:700px;"/></td></tr>
                                          <tr><td>推荐位：</td><td><input type="text" name="individualExt.recompos_id" value="<c:out value="${ individualModel.individualExt.recompos_id }" escapeXml="true" />" style="width:700px;"/></td></tr>
        </thead>
        <tbody></tbody>
    </table>
    <c:if test="${ individualModel.operationType eq 'edit' }">
    <input type="hidden" value="${ individualModel.individualExt.id }" name="individualExt.id"/>
    </c:if>
    </form>
</div>

<script type="text/javascript">
function doCreate(){
    var form = document.getElementById("form");
    form.action = "<%=request.getContextPath()%>/individual/doCreate.action";
    form.submit();
}

function doEdit(){
    var form = document.getElementById("form");
    form.action = "<%=request.getContextPath()%>/individual/doEdit.action";
    form.submit();
}
</script>
</body>
</html>
