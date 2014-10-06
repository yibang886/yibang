<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/core/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页大图编辑页</title>
<%@ include file="/core/includecss.jsp"%>
<script type="text/javascript">
function doPublish(){
    var form = document.getElementById("form");
    form.action = "<%=request.getContextPath()%>/user/doPublish.action";
    form.submit();
}
</script>
</head>

<body>
<div id="wrapper">

  <input type="button" value="发布" onclick="doPublish()" />

  <form id="form" name="userForm" method="post">
    <table class="table_add">
      <thead>

        <tr>
          <td>
            <b>当前用户</b>
          </td>
        </tr>

        <tr>
          <td>用户ID：</td>
          <td>
            <input type="text" name="userExt.id" value="<c:out value="${ userModel.userExt.id }" escapeXml="true" />" style="width:700px; border:none;" readonly="true"/>
          </td>
        </tr>

        <tr>
          <td>用户类型：</td>
          <td>
            <input type="text" name="userExt.user_type" value="<c:out value="${ userModel.userExt.user_type }" escapeXml="true" />" style="width:700px; border:none;" readonly="true"/>
          </td>
        </tr>

        <tr>
          <td>邮箱：</td>
          <td>
            <input type="text" name="userExt.email" value="<c:out value="${ userModel.userExt.email }" escapeXml="true" />" style="width:700px; border:none;" readonly="true"/>
          </td>
        </tr>

        <tr>
          <td>
            <b>翻译服务信息</b>
          </td>
        </tr>

        <tr>
          <td>姓名：</td>
          <td>
            <input type="text" name="individualExt.name" value="请填写真实姓名" style="width:700px;"/>
          </td>
        </tr>
        
        <%--
        <tr>
          <td>性别：</td>
          <td>
            <input type="text" name="individualExt.gender" value="0" style="width:700px;"/>
          </td>
        </tr>
        --%>

        <tr>
          <td>性别：</td>
          <td>
            <select name="individualExt.gender">
              <option value="0" selected="true">男</option>
              <option value="1">女</option>
            </select>
          </td>
        </tr>
        
        <%--
        <tr>
          <td>教育水平：</td>
          <td>
            <input type="text" name="individualExt.edu_id" value="2" style="width:700px;"/>
          </td>
        </tr>
        --%>
        <tr>
          <td>教育水平：</td>
          <td>
            <select name="individualExt.education.id">
              <c:forEach items="${userModel.educationEnum}" var="var">
                <option value="${var.id}" <c:if test="${var.id==1}"><c:out value="selected"/></c:if> >
                  ${var.education}
                </option>
              </c:forEach>
              <option value="100">haha</option>
            </select>
          </td>
        </tr>
        
        <%--
        <tr>
          <td>毕业院校：</td>
          <td>
            <input type="text" name="individualExt.sch_id" value="3" style="width:700px;"/>
          </td>
        </tr>
        --%>
        <tr>
          <td>毕业院校：</td>
          <td>
            <select name="individualExt.school.id">
              <c:forEach items="${userModel.schoolEnum}" var="var">
                <option value="${var.id}" <c:if test="${var.id==1}"><c:out value="selected"/></c:if> >
                  ${var.school}
                </option>
              </c:forEach>
            </select>
          </td>
        </tr>
        
        <tr>
          <td>出生：</td>
          <td>
            <input type="text" name="individualExt.birth_year" value="1988" style="width:700px;"/>
          </td>
        </tr>
        
        <%--
        <tr>
          <td>所在城市：</td>
          <td>
            <input type="text" name="individualExt.city_id" value="1" style="width:700px;"/>
          </td>
        </tr>
        --%>
        <tr>
          <td>所在城市：</td>
          <td>
            <select name="individualExt.city.id">
              <c:forEach items="${userModel.cityEnum}" var="var">
                <option value="${var.id}" <c:if test="${var.id==1}"><c:out value="selected"/></c:if> >
                  ${var.city}
                </option>
              </c:forEach>
            </select>
          </td>
        </tr>

        
        <tr>
          <td>个人主页：</td>
          <td>
            <input type="text" name="individualExt.mainpage" value="www.main.page.com.cn" style="width:700px;"/>
          </td>
        </tr>
        
        <%--
        <tr>
          <td>工作方式：</td>
          <td>
            <input type="text" name="individualExt.workstyle" value="0" style="width:700px;"/>
          </td>
        </tr>
        --%>
        <tr>
          <td>工作方式：</td>
          <td>
            <select name="individualExt.workstyle">
              <option value="0" selected="true">全职</option>
              <option value="1">兼职</option>
            </select>
          </td>
        </tr>
        
        <%--
        <tr>
          <td>语言等级证书：</td>
          <td>
            <input type="text" name="individualExt.lang_cert" value="language-cert" style="width:700px;"/>
          </td>
        </tr>
        
        <tr>
          <td>翻译证书：</td>
          <td>
            <input type="text" name="individualExt.trans_cert" value="translation-cert" style="width:700px;"/>
          </td>
        </tr>
        
        <tr>
          <td>专业证书：</td>
          <td>
            <input type="text" name="individualExt.prof_cert" value="profession-cert" style="width:700px;"/>
          </td>
        </tr>
        --%>
        
        <tr>
          <td>工作年限：</td>
          <td>
            <input type="text" name="individualExt.exp_year" value="4" style="width:700px;"/>
          </td>
        </tr>
        
        <tr>
          <td>翻译经验：</td>
          <td><input type="text" name="individualExt.exp_trans" value="18" style="width:700px;"/>
          </td>
        </tr>
        
        <tr>
          <td>翻译作品：</td>
          <td>
            <input type="text" name="individualExt.works" value="C++" style="width:700px;"/>
          </td>
        </tr>
        
        <tr>
          <td>个人简介：</td>
          <td>
            <input type="text" name="individualExt.introduct" value="hardworking, profound" style="width:700px;"/>
          </td>
        </tr>
        
        <%--
        <tr>
          <td>认证资料：</td>
          <td>
            <input type="text" name="individualExt.auth_file" value="authentication-file" style="width:700px;"/>
          </td>
        </tr>
        --%>

        <%--
        <tr>
          <td>是否认证：</td>
          <td>
            <input type="text" name="individualExt.auth_pass" value="0" style="width:700px;"/>
          </td>
        </tr>
        --%>
        <tr>
          <td>是否认证通过：</td>
          <td>
            <select name="individualExt.auth_pass">
              <option value="0" selected="true">否</option>
              <option value="1">是</option>
            </select>
          </td>
        </tr>
        
        <%--
        <tr>
          <td>推荐位：</td>
          <td>
            <input type="text" name="individualExt.recompos_id" value="1" style="width:700px;"/>
          </td>
        </tr>
        --%>
        <tr>
          <td>推荐位：</td>
          <td>
            <select name="individualExt.recompos.id">
              <c:forEach items="${userModel.recomposEnum}" var="var">
                <option value="${var.id}" <c:if test="${var.id==1}"><c:out value="selected"/></c:if> >
                  ${var.recompos}
                </option>
              </c:forEach>
            </select>
          </td>
        </tr>

      </thead>
      <tbody></tbody>
    </table>
  </form>
</div>

</body>
</html>
