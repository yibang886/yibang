<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/core/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页大图编辑页</title>
<%@ include file="/core/includecss.jsp"%>
<style type="text/css">
  .myinput { background-color: #FFFFFF; border: none }
</style>
</head>
<body>
<div id="wrapper">
  <%-- Yuanguo: make use of "operationType" to decide to doCreate or doEdit; see goCreate and goEdit in IndividualController.java --%>
  <c:if test="${ individualModel.operationType eq 'create' }">
    <input type="button" value="新建" onclick="doCreate()" />
  </c:if>
  <c:if test="${ individualModel.operationType eq 'edit' }">
    <input type="button" value="保存" onclick="doEdit()"/>
  </c:if>

  <form id="form" name="individualForm" method="post">
    <table class="table_add">
      <thead>
        <tr>
          <td>发布用户：</td>
          <td>
            <input type="text" name="individualExt.user.id" value="<c:out value="${ individualModel.individualExt.user.id }" escapeXml="true" />" style="width:700px;" readonly="true" class="myinput" />
          </td>
        </tr>

        <tr>
          <td>邮箱：</td>
          <td>
            <input type="text" name="individualExt.user.email" value="<c:out value="${ individualModel.individualExt.user.email }" escapeXml="true" />" style="width:700px;" readonly="true" class="myinput" />
          </td>
        </tr>

        <tr>
          <td>固定电话：</td>
          <td>
            <input type="text" name="individualExt.user.tel" value="<c:out value="${ individualModel.individualExt.user.tel }" escapeXml="true" />" style="width:700px;" readonly="true" class="myinput" />
          </td>
        </tr>

        <tr>
          <td>移动电话：</td>
          <td>
            <input type="text" name="individualExt.user.mobile" value="<c:out value="${ individualModel.individualExt.user.mobile }" escapeXml="true" />" style="width:700px;" readonly="true" class="myinput" />
          </td>
        </tr>

        <tr>
          <td>传真：</td>
          <td>
            <input type="text" name="individualExt.user.fax" value="<c:out value="${ individualModel.individualExt.user.fax }" escapeXml="true" />" style="width:700px;" readonly="true" class="myinput" />
          </td>
        </tr>

        <tr>
          <td>QQ：</td>
          <td>
            <input type="text" name="individualExt.user.qq" value="<c:out value="${ individualModel.individualExt.user.qq }" escapeXml="true" />" style="width:700px;" readonly="true" class="myinput" />
          </td>
        </tr>

        <tr>
          <td>微信：</td>
          <td>
            <input type="text" name="individualExt.user.weixin" value="<c:out value="${ individualModel.individualExt.user.weixin }" escapeXml="true" />" style="width:700px;" readonly="true" class="myinput" />
          </td>
        </tr>
        
        <tr>
          <td>姓名：</td>
          <td>
            <input type="text" name="individualExt.name" value="<c:out value="${ individualModel.individualExt.name }" escapeXml="true" />" style="width:700px;"/>
          </td>
        </tr>
        
        <tr>
          <td>性别：</td>
          <td>
            <select name="individualExt.gender">
              <option value="0" <c:if test="${individualModel.individualExt.gender==0}"><c:out value="selected"/></c:if> >男</option>
              <option value="1" <c:if test="${individualModel.individualExt.gender==1}"><c:out value="selected"/></c:if> >女</option>
            </select>
          </td>
        </tr>
        
        <tr>
          <td>教育水平：</td>
          <td>
            <select name="individualExt.education.id">
              <c:forEach items="${individualModel.educationEnum}" var="var">
                <option value="${var.id}" <c:if test="${individualModel.individualExt.education.id==var.id}"><c:out value="selected"/></c:if> >
                  ${var.education}
                </option>
              </c:forEach>
              <option value="100">haha</option>
            </select>
          </td>
        </tr>
        
        <tr>
          <td>毕业院校：</td>
          <td>
            <select name="individualExt.school.id">
              <c:forEach items="${individualModel.schoolEnum}" var="var">
                <option value="${var.id}" <c:if test="${individualModel.individualExt.school.id==var.id}"><c:out value="selected"/></c:if> >
                  ${var.school}
                </option>
              </c:forEach>
            </select>
          </td>
        </tr>
        
        <tr>
          <td>出生：</td>
          <td>
            <input type="text" name="individualExt.birth_year" value="<c:out value="${ individualModel.individualExt.birth_year }" escapeXml="true" />" style="width:700px;"/>
          </td>
        </tr>
        
        <tr>
          <td>所在城市：</td>
          <td>
            <select name="individualExt.city.id">
              <c:forEach items="${individualModel.cityEnum}" var="var">
                <option value="${var.id}" <c:if test="${individualModel.individualExt.city.id==var.id}"><c:out value="selected"/></c:if> >
                  ${var.city}
                </option>
              </c:forEach>
            </select>
          </td>
        </tr>
        
        <tr>
          <td>个人主页：</td>
          <td>
            <input type="text" name="individualExt.mainpage" value="<c:out value="${ individualModel.individualExt.mainpage }" escapeXml="true" />" style="width:700px;"/>
          </td>
        </tr>
        
        <tr>
          <td>工作方式：</td>
          <td>
            <select name="individualExt.workstyle">
              <option value="0" <c:if test="${individualModel.individualExt.workstyle==0}"><c:out value="selected"/></c:if> >全职</option>
              <option value="1" <c:if test="${individualModel.individualExt.workstyle==1}"><c:out value="selected"/></c:if> >兼职</option>
            </select>
          </td>
        </tr>
        
        <tr>
          <td>语言等级证书：</td>
          <td>
            <input type="text" name="individualExt.lang_cert" value="<c:out value="${ individualModel.individualExt.lang_cert }" escapeXml="true" />" style="width:700px;"/>
          </td>
        </tr>
        
        <tr>
          <td>翻译证书：</td>
          <td>
            <input type="text" name="individualExt.trans_cert" value="<c:out value="${ individualModel.individualExt.trans_cert }" escapeXml="true" />" style="width:700px;"/>
          </td>
        </tr>
        
        <tr>
          <td>专业证书：</td>
          <td>
            <input type="text" name="individualExt.prof_cert" value="<c:out value="${ individualModel.individualExt.prof_cert }" escapeXml="true" />" style="width:700px;"/>
          </td>
        </tr>
        
        <tr>
          <td>工作经验（单位：年）：</td>
          <td>
            <input type="text" name="individualExt.exp_year" value="<c:out value="${ individualModel.individualExt.exp_year }" escapeXml="true" />" style="width:700px;"/>
          </td>
        </tr>
        
        <tr>
          <td>翻译经验（单位：万字）：</td>
          <td><input type="text" name="individualExt.exp_trans" value="<c:out value="${ individualModel.individualExt.exp_trans }" escapeXml="true" />" style="width:700px;"/>
          </td>
        </tr>
        
        <tr>
          <td>翻译作品：</td>
          <td>
            <input type="text" name="individualExt.works" value="<c:out value="${ individualModel.individualExt.works }" escapeXml="true" />" style="width:700px;"/>
          </td>
        </tr>
        
        <tr>
          <td>个人简介：</td>
          <td>
            <input type="text" name="individualExt.introduct" value="<c:out value="${ individualModel.individualExt.introduct }" escapeXml="true" />" style="width:700px;"/>
          </td>
        </tr>
        
        <%--
        <tr>
          <td>近期照片：</td>
          <td>
            <input type="text" name="individualExt.photo_suffix" value="<c:out value="${ individualModel.individualExt.photo_suffix }" escapeXml="true" />" style="width:700px;"/>
          </td>
        </tr>
        --%>
        
        <tr>
          <td>认证资料：</td>
          <td>
            <input type="text" name="individualExt.auth_file" value="<c:out value="${ individualModel.individualExt.auth_file }" escapeXml="true" />" style="width:700px;"/>
          </td>
        </tr>
        
        <tr>
          <td>是否认证通过：</td>
          <td>
            <select name="individualExt.auth_pass">
              <option value="0" <c:if test="${individualModel.individualExt.auth_pass==0}"><c:out value="selected"/></c:if> >否</option>
              <option value="1" <c:if test="${individualModel.individualExt.auth_pass==1}"><c:out value="selected"/></c:if> >是</option>
            </select>
          </td>
        </tr>
        
        <tr>
          <td>推荐位：</td>
          <td>
            <select name="individualExt.recompos.id">
              <c:forEach items="${individualModel.recomposEnum}" var="var">
                <option value="${var.id}" <c:if test="${individualModel.individualExt.recompos.id==var.id}"><c:out value="selected"/></c:if> >
                  ${var.recompos}
                </option>
              </c:forEach>
            </select>
          </td>
        </tr>

      </thead>
      <tbody></tbody>
    </table>

    <%-- Yuanguo: for "edit", the existing "id" is kept --%>
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
