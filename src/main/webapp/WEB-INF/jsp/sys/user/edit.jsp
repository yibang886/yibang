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
    <c:if test="${ userModel.operationType eq 'create' }">
    <input type="button" value="新建" onclick="doCreate()" />
    </c:if>
    <c:if test="${ userModel.operationType eq 'edit' }">
    <input type="button" value="保存" onclick="doEdit()"/>
    </c:if>
    <form id="form" name="userForm" method="post">
    <table class="table_add">
      <thead>
        <tr>
          <td>登录邮箱：</td>
          <td>
            <input type="text" name="userExt.email" value="<c:out value="${ userModel.userExt.email }" escapeXml="true" />" style="width:700px;"/>
          </td>
        </tr>
        
        <tr>
          <td>密码：</td>
          <td>
            <input type="text" name="userExt.password" value="<c:out value="${ userModel.userExt.password }" escapeXml="true" />" style="width:700px;"/>
          </td>
        </tr>
        
        <tr>
          <td>固定电话：</td>
          <td>
            <input type="text" name="userExt.tel" value="<c:out value="${ userModel.userExt.tel }" escapeXml="true" />" style="width:700px;"/>
          </td>
        </tr>
        
        <tr>
          <td>移动电话：</td>
          <td>
            <input type="text" name="userExt.mobile" value="<c:out value="${ userModel.userExt.mobile }" escapeXml="true" />" style="width:700px;"/>
          </td>
        </tr>

        <tr>
          <td>传真：</td>
          <td>
            <input type="text" name="userExt.fax" value="<c:out value="${ userModel.userExt.fax }" escapeXml="true" />" style="width:700px;"/>
          </td>
        </tr>
        
        <tr>
          <td>QQ号码：</td>
          <td>
            <input type="text" name="userExt.qq" value="<c:out value="${ userModel.userExt.qq }" escapeXml="true" />" style="width:700px;"/>
          </td>
        </tr>

        <tr>
          <td>微信：</td>
          <td>
            <input type="text" name="userExt.weixin" value="<c:out value="${ userModel.userExt.weixin }" escapeXml="true" />" style="width:700px;"/>
          </td>
        </tr>

        <tr>
          <td>用户类型：</td>
          <td>
            <input type="text" name="userExt.user_type" value="<c:out value="${ userModel.userExt.user_type }" escapeXml="true" />" style="width:700px;"/>
          </td>
        </tr>
        
        <tr>
          <td>发布计数：</td>
          <td>
            <input type="text" name="userExt.srvcount" value="<c:out value="${ userModel.userExt.srvcount }" escapeXml="true" />" style="width:700px;"/>
          </td>
        </tr>

        <tr>
          <td>推荐计数：</td>
          <td><input type="text" name="userExt.refcount" value="<c:out value="${ userModel.userExt.refcount }" escapeXml="true" />" style="width:700px;"/>
          </td>
        </tr>

      </thead>
      <tbody></tbody>
    </table>
    <c:if test="${ userModel.operationType eq 'edit' }">
    <input type="hidden" value="${ userModel.userExt.id }" name="userExt.id"/>
    </c:if>
    </form>
</div>

<script type="text/javascript">
function doCreate(){
    var form = document.getElementById("form");
    form.action = "<%=request.getContextPath()%>/user/doCreate.action";
    form.submit();
}

function doEdit(){
    var form = document.getElementById("form");
    form.action = "<%=request.getContextPath()%>/user/doEdit.action";
    form.submit();
}
</script>
</body>
</html>
