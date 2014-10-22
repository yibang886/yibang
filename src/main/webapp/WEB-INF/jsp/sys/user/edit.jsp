<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/core/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页大图编辑页</title>
<%@ include file="/core/includecss.jsp"%>

<script>
  function changeColor(name,color)
  {
    document.getElementsByName(name)[0].style.color=color;
  }
</script>

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
          <td>登录邮箱(必填)：</td>
          <td>
            <c:if test="${ userModel.operationType eq 'edit' }">
              <input type="text" name="userExt.email" value="<c:out value="${ userModel.userExt.email }" escapeXml="true" />" style="width:700px;"/>
            </c:if>
            <c:if test="${ userModel.operationType eq 'create' }">
              <input type="text" name="userExt.email" value="请填写电子邮箱" style="width:700px;"/>
            </c:if>
          </td>
        </tr>
        
        <tr>
          <td>密码(必填)：</td>
          <td>
            <c:if test="${ userModel.operationType eq 'edit' }">
              <input type="password" name="userExt.password" value="<c:out value="${ userModel.userExt.password }" escapeXml="true" />" style="width:700px;"/>
            </c:if>
            <c:if test="${ userModel.operationType eq 'create' }">
              <input type="password" name="userExt.password" value="123456" style="width:700px;"/>
            </c:if>
          </td>
        </tr>

        <tr>
          <td>用户类型(必填)：</td>
          <td>
            <select name="userExt.user_type">
              <c:if test="${ userModel.operationType eq 'edit' }">
                <option value="0" <c:if test="${userModel.userExt.user_type==0}"><c:out value="selected"/></c:if> >个人译员</option>
                <option value="1" <c:if test="${userModel.userExt.user_type==1}"><c:out value="selected"/></c:if> >翻译公司</option>
              </c:if>
              <c:if test="${ userModel.operationType eq 'create' }">
                <option value="0" selected="true">个人译员</option>
                <option value="1">翻译公司</option>
              </c:if>
            </select>
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
          <td>金币数：</td>
          <td>
            <c:if test="${ userModel.operationType eq 'edit' }">
              <input type="text" name="userExt.coin" value="<c:out value="${ userModel.userExt.coin }" escapeXml="true" />" style="width:700px;"/>
            </c:if>
            <c:if test="${ userModel.operationType eq 'create' }">
              <input type="text" name="userExt.coin" value="0" style="width:700px;"/>
            </c:if>
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
