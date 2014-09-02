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
    <c:if test="${ doctypeModel.operationType eq 'create' }">
    <input type="button" value="新建" onclick="doCreate()" />
    </c:if>
    <c:if test="${ doctypeModel.operationType eq 'edit' }">
    <input type="button" value="保存" onclick="doEdit()"/>
    </c:if>
    <form id="form" name="doctypeForm" method="post">
    <table class="table_add">
        <thead>
          <tr>
            <td>文档类型：</td>
            <td><input type="text" name="doctypeExt.doctype" value="<c:out value="${ doctypeModel.doctypeExt.doctype }" escapeXml="true" />" style="width:700px;"/></td>
          </tr>
        </thead>
        <tbody></tbody>
    </table>
    <c:if test="${ doctypeModel.operationType eq 'edit' }">
    <input type="hidden" value="${ doctypeModel.doctypeExt.id }" name="doctypeExt.id"/>
    </c:if>
    </form>
</div>

<script type="text/javascript">
function doCreate(){
    var form = document.getElementById("form");
    form.action = "<%=request.getContextPath()%>/doctype/doCreate.action";
    form.submit();
}

function doEdit(){
    var form = document.getElementById("form");
    form.action = "<%=request.getContextPath()%>/doctype/doEdit.action";
    form.submit();
}
</script>
</body>
</html>
