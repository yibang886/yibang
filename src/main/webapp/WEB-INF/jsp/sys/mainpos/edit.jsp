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
    <c:if test="${ mainposModel.operationType eq 'create' }">
    <input type="button" value="新建" onclick="doCreate()" />
    </c:if>
    <c:if test="${ mainposModel.operationType eq 'edit' }">
    <input type="button" value="保存" onclick="doEdit()"/>
    </c:if>
    <form id="form" name="mainposForm" method="post">
    <table class="table_add">
        <thead>
                                          <tr><td>主页推荐位：</td><td><input type="text" name="mainposExt.mainpos" value="<c:out value="${ mainposModel.mainposExt.mainpos }" escapeXml="true" />" style="width:700px;"/></td></tr>
        </thead>
        <tbody></tbody>
    </table>
    <c:if test="${ mainposModel.operationType eq 'edit' }">
    <input type="hidden" value="${ mainposModel.mainposExt.id }" name="mainposExt.id"/>
    </c:if>
    </form>
</div>

<script type="text/javascript">
function doCreate(){
    var form = document.getElementById("form");
    form.action = "<%=request.getContextPath()%>/mainpos/doCreate.action";
    form.submit();
}

function doEdit(){
    var form = document.getElementById("form");
    form.action = "<%=request.getContextPath()%>/mainpos/doEdit.action";
    form.submit();
}
</script>
</body>
</html>
