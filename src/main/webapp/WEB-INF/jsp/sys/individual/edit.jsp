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
  <%-- Yuanguo: make use of "operationType" to decide to doCreate or doEdit; see goCreate and goEdit in IndividualController.java --%>
  <c:if test="${ entityModel.operationType eq 'publish' }">
    <input type="button" value="发布" onclick="doPublish(${entityModel.dataId})" />
  </c:if>
  <c:if test="${ entityModel.operationType eq 'edit' }">
    <input type="button" value="保存" onclick="doEdit()"/>
  </c:if>

  <form id="form" name="individualForm" method="post">
    <table class="table_add">
      <thead>
        
        <tr>
          <td>姓名：</td>
          <td>
            <c:if test="${ entityModel.operationType eq 'edit' }">
              <input type="text" name="individualExt.name" value="<c:out value="${ entityModel.individualExt.name }" escapeXml="true" />" style="width:700px;"/>
            </c:if>
            <c:if test="${ entityModel.operationType eq 'publish' }">
              <input type="text" name="individualExt.name" value="<c:out value="请填写真实姓名" escapeXml="true" />" style="width:700px;"/>
            </c:if>
          </td>
        </tr>
        
        <tr>
          <td>性别：</td>
          <td>
            <select name="individualExt.gender">
              <c:if test="${ entityModel.operationType eq 'edit' }">
                <option value="0" <c:if test="${entityModel.individualExt.gender==0}"><c:out value="selected"/></c:if> >男</option>
                <option value="1" <c:if test="${entityModel.individualExt.gender==1}"><c:out value="selected"/></c:if> >女</option>
              </c:if>
              <c:if test="${ entityModel.operationType eq 'publish' }">
                <option value="0" selected="true">男</option>
                <option value="1">女</option>
              </c:if>
            </select>
          </td>
        </tr>
        
        <tr>
          <td>教育水平：</td>
          <td>
            <select name="individualExt.education.id">
              <c:if test="${ entityModel.operationType eq 'edit' }">
                <c:forEach items="${entityModel.educationEnum}" var="var">
                  <option value="${var.id}" <c:if test="${entityModel.individualExt.education.id==var.id}"><c:out value="selected"/></c:if> >
                    ${var.education}
                  </option>
                </c:forEach>
              </c:if>
              <c:if test="${ entityModel.operationType eq 'publish' }">
                <c:forEach items="${entityModel.educationEnum}" var="var">
                  <option value="${var.id}">
                    ${var.education}
                  </option>
                </c:forEach>
              </c:if>
            </select>
          </td>
        </tr>
        
        <tr>
          <td>毕业院校：</td>
          <td>
            <select name="individualExt.school.id">
              <c:if test="${ entityModel.operationType eq 'edit' }">
                <c:forEach items="${entityModel.schoolEnum}" var="var">
                  <option value="${var.id}" <c:if test="${entityModel.individualExt.school.id==var.id}"><c:out value="selected"/></c:if> >
                    ${var.school}
                  </option>
                </c:forEach>
              </c:if>
              <c:if test="${ entityModel.operationType eq 'publish' }">
                <c:forEach items="${entityModel.schoolEnum}" var="var">
                  <option value="${var.id}">
                    ${var.school}
                  </option>
                </c:forEach>
              </c:if>
            </select>
          </td>
        </tr>
        
        <tr>
          <td>出生年：</td>
          <td>
            <c:if test="${ entityModel.operationType eq 'edit' }">
              <input type="text" name="individualExt.birth_year" value="<c:out value="${ entityModel.individualExt.birth_year }" escapeXml="true" />" style="width:700px;"/>
            </c:if>
            <c:if test="${ entityModel.operationType eq 'publish' }">
              <input type="text" name="individualExt.birth_year" value="1980" style="width:700px;"/>
            </c:if>
          </td>
        </tr>
        
        <tr>
          <td>所在城市：</td>
          <td>
            <select name="individualExt.city.id">
              <c:if test="${ entityModel.operationType eq 'edit' }">
                <c:forEach items="${entityModel.cityEnum}" var="var">
                  <option value="${var.id}" <c:if test="${entityModel.individualExt.city.id==var.id}"><c:out value="selected"/></c:if> >
                    ${var.city}
                  </option>
                </c:forEach>
              </c:if>
              <c:if test="${ entityModel.operationType eq 'publish' }">
                <c:forEach items="${entityModel.cityEnum}" var="var">
                  <option value="${var.id}">
                    ${var.city}
                  </option>
                </c:forEach>
              </c:if>
            </select>
          </td>
        </tr>
        
        <tr>
          <td>工作方式：</td>
          <td>
            <select name="individualExt.workstyle">
              <c:if test="${ entityModel.operationType eq 'edit' }">
                <option value="0" <c:if test="${entityModel.individualExt.workstyle==0}"><c:out value="selected"/></c:if> >全职</option>
                <option value="1" <c:if test="${entityModel.individualExt.workstyle==1}"><c:out value="selected"/></c:if> >兼职</option>
              </c:if>
              <c:if test="${ entityModel.operationType eq 'publish' }">
                <option value="0" selected="true">全职</option>
                <option value="1">兼职</option>
              </c:if>
            </select>
          </td>
        </tr>

        <tr>
          <td>语种：</td>
          <td>
            <table id="lang_table">
              <tr>
                <td colspan="10">
                  <input type="button" value="全选" onclick="checkboxSelect('langCheckbox','all')"/>
                  &nbsp;&nbsp;
                  <input type="button" value="反选" onclick="checkboxSelect('langCheckbox','none')"/>
                </td>
              </tr>
              <tr>
                <c:if test="${ entityModel.operationType eq 'edit' }">
                  <c:forEach items="${entityModel.languageEnum}" var="var" varStatus="varStat">
                    <c:if test="${varStat.index%10==0&&varStat.index!=0}"></tr><tr></c:if>
                      <td>
                        <input  type="checkbox" 
                                name="langCheckbox" 
                                value="${var.id}"
                                <c:forEach items="${entityModel.individualExt.languages}" var="lang">
                                  <c:if test="${lang.id==var.id}">
                                    <c:out value="checked"/>
                                  </c:if>
                                </c:forEach>
                        />${var.language}
                      </td>
                  </c:forEach>
                </c:if>
                <c:if test="${ entityModel.operationType eq 'publish' }">
                  <c:forEach items="${entityModel.languageEnum}" var="var" varStatus="varStat">
                    <c:if test="${varStat.index%10==0&&varStat.index!=0}"></tr><tr></c:if>
                      <td>
                        <input  type="checkbox" name="langCheckbox" value="${var.id}"/>${var.language}
                      </td>
                  </c:forEach>
                </c:if>
              </tr>
            </table>
          </td>
        </tr>

        <tr>
          <td>专业领域：</td>
          <td>
            <table id="field_table">
              <tr>
                <td colspan="10">
                  <input type="button" value="全选" onclick="checkboxSelect('fieldCheckbox','all')"/>
                  &nbsp;&nbsp;
                  <input type="button" value="反选" onclick="checkboxSelect('fieldCheckbox','none')"/>
                </td>
              </tr>
              <tr>
                <c:if test="${ entityModel.operationType eq 'edit' }">
                  <c:forEach items="${entityModel.fieldEnum}" var="var" varStatus="varStat">
                    <c:if test="${varStat.index%10==0&&varStat.index!=0}"></tr><tr></c:if>
                      <td>
                        <input  type="checkbox" 
                                name="fieldCheckbox" 
                                value="${var.id}"
                                <c:forEach items="${entityModel.individualExt.fields}" var="field">
                                  <c:if test="${field.id==var.id}">
                                    <c:out value="checked"/>
                                  </c:if>
                                </c:forEach>
                        />${var.field}
                      </td>
                  </c:forEach>
                </c:if>
                <c:if test="${ entityModel.operationType eq 'publish' }">
                  <c:forEach items="${entityModel.fieldEnum}" var="var" varStatus="varStat">
                    <c:if test="${varStat.index%10==0&&varStat.index!=0}"></tr><tr></c:if>
                      <td>
                        <input  type="checkbox" name="fieldCheckbox" value="${var.id}"/>${var.field}
                      </td>
                  </c:forEach>
                </c:if>
              </tr>
            </table>
          </td>
        </tr>

        <tr>
          <td>翻译类型：</td>
          <td>
            <table id="transtype_table">
              <tr>
                <td colspan="10">
                  <input type="button" value="全选" onclick="checkboxSelect('transtypeCheckbox','all')"/>
                  &nbsp;&nbsp;
                  <input type="button" value="反选" onclick="checkboxSelect('transtypeCheckbox','none')"/>
                </td>
              </tr>
              <tr>
                <c:if test="${ entityModel.operationType eq 'edit' }">
                  <c:forEach items="${entityModel.transtypeEnum}" var="var" varStatus="varStat">
                    <c:if test="${varStat.index%10==0&&varStat.index!=0}"></tr><tr></c:if>
                      <td>
                        <input  type="checkbox" 
                                name="transtypeCheckbox" 
                                value="${var.id}"
                                <c:forEach items="${entityModel.individualExt.transtypes}" var="transtype">
                                  <c:if test="${transtype.id==var.id}">
                                    <c:out value="checked"/>
                                  </c:if>
                                </c:forEach>
                        />${var.transtype}
                      </td>
                  </c:forEach>
                </c:if>
                <c:if test="${ entityModel.operationType eq 'publish' }">
                  <c:forEach items="${entityModel.transtypeEnum}" var="var" varStatus="varStat">
                    <c:if test="${varStat.index%10==0&&varStat.index!=0}"></tr><tr></c:if>
                      <td>
                        <input  type="checkbox" name="transtypeCheckbox" value="${var.id}"/>${var.transtype}
                      </td>
                  </c:forEach>
                </c:if>
              </tr>
            </table>
          </td>
        </tr>

        <tr>
          <td>文档类型：</td>
          <td>
            <table id="doctype_table">
              <tr>
                <td colspan="10">
                  <input type="button" value="全选" onclick="checkboxSelect('doctypeCheckbox','all')"/>
                  &nbsp;&nbsp;
                  <input type="button" value="反选" onclick="checkboxSelect('doctypeCheckbox','none')"/>
                </td>
              </tr>
              <tr>
                <c:if test="${ entityModel.operationType eq 'edit' }">
                  <c:forEach items="${entityModel.doctypeEnum}" var="var" varStatus="varStat">
                    <c:if test="${varStat.index%10==0&&varStat.index!=0}"></tr><tr></c:if>
                      <td>
                        <input  type="checkbox" 
                                name="doctypeCheckbox" 
                                value="${var.id}"
                                <c:forEach items="${entityModel.individualExt.doctypes}" var="doctype">
                                  <c:if test="${doctype.id==var.id}">
                                    <c:out value="checked"/>
                                  </c:if>
                                </c:forEach>
                        />${var.doctype}
                      </td>
                  </c:forEach>
                </c:if>
                <c:if test="${ entityModel.operationType eq 'publish' }">
                  <c:forEach items="${entityModel.doctypeEnum}" var="var" varStatus="varStat">
                    <c:if test="${varStat.index%10==0&&varStat.index!=0}"></tr><tr></c:if>
                      <td>
                        <input  type="checkbox" name="doctypeCheckbox" value="${var.id}"/>${var.doctype}
                      </td>
                  </c:forEach>
                </c:if>
              </tr>
            </table>
          </td>
        </tr>
        
        <tr>
          <td>工作经验（单位：年）：</td>
          <td>
            <c:if test="${ entityModel.operationType eq 'edit' }">
              <input type="text" name="individualExt.exp_year" value="<c:out value="${ entityModel.individualExt.exp_year }" escapeXml="true" />" style="width:700px;"/>
            </c:if>
            <c:if test="${ entityModel.operationType eq 'publish' }">
              <input type="text" name="individualExt.exp_year" value="0" style="width:700px;"/>
            </c:if>
          </td>
        </tr>
        
        <tr>
          <td>翻译经验（单位：万字）：</td>
          <td>
            <c:if test="${ entityModel.operationType eq 'edit' }">
              <input type="text" name="individualExt.exp_trans" value="<c:out value="${ entityModel.individualExt.exp_trans }" escapeXml="true" />" style="width:700px;"/>
            </c:if>
            <c:if test="${ entityModel.operationType eq 'publish' }">
              <input type="text" name="individualExt.exp_trans" value="0" style="width:700px;"/>
            </c:if>
          </td>
        </tr>
        
        <tr>
          <td>翻译作品：</td>
          <td>
            <c:if test="${ entityModel.operationType eq 'edit' }">
              <input type="text" name="individualExt.works" value="<c:out value="${ entityModel.individualExt.works }" escapeXml="true" />" style="width:700px;"/>
            </c:if>
            <c:if test="${ entityModel.operationType eq 'publish' }">
              <input type="text" name="individualExt.works" value="" style="width:700px;"/>
            </c:if>
          </td>
        </tr>

        <tr>
          <td>个人简介：</td>
          <td>
            <c:if test="${ entityModel.operationType eq 'edit' }">
              <input type="text" name="individualExt.introduct" value="<c:out value="${ entityModel.individualExt.introduct }" escapeXml="true" />" style="width:700px;"/>
            </c:if>
            <c:if test="${ entityModel.operationType eq 'publish' }">
              <input type="text" name="individualExt.introduct" value="" style="width:700px;"/>
            </c:if>
          </td>
        </tr>

        <tr>
          <td>个人主页：</td>
          <td>
            <c:if test="${ entityModel.operationType eq 'edit' }">
              <input type="text" name="individualExt.mainpage" value="<c:out value="${ entityModel.individualExt.mainpage }" escapeXml="true" />" style="width:700px;"/>
            </c:if>
            <c:if test="${ entityModel.operationType eq 'publish' }">
              <input type="text" name="individualExt.mainpage" value="" style="width:700px;"/>
            </c:if>
          </td>
        </tr>
        
        <tr>
          <td>是否认证通过：</td>
          <td>
            <select name="individualExt.auth_pass">
              <c:if test="${ entityModel.operationType eq 'edit' }">
                <option value="0" <c:if test="${entityModel.individualExt.auth_pass==0}"><c:out value="selected"/></c:if> >否</option>
                <option value="1" <c:if test="${entityModel.individualExt.auth_pass==1}"><c:out value="selected"/></c:if> >是</option>
              </c:if>
              <c:if test="${ entityModel.operationType eq 'publish' }">
                <option value="0" selected="true" >否</option>
                <option value="1">是</option>
              </c:if>
            </select>
          </td>
        </tr>
        
        <tr>
          <td>推荐位：</td>
          <td>
            <select name="individualExt.recompos.id">
              <c:if test="${ entityModel.operationType eq 'edit' }">
                <c:forEach items="${entityModel.recomposEnum}" var="var">
                  <option value="${var.id}" <c:if test="${entityModel.individualExt.recompos.id==var.id}"><c:out value="selected"/></c:if> >
                    ${var.recompos}
                  </option>
                </c:forEach>
              </c:if>
              <c:if test="${ entityModel.operationType eq 'publish' }">
                <c:forEach items="${entityModel.recomposEnum}" var="var">
                  <option value="${var.id}">
                    ${var.recompos}
                  </option>
                </c:forEach>
              </c:if>
            </select>
          </td>
        </tr>

      </thead>
      <tbody></tbody>
    </table>

    <%-- Yuanguo: for "edit", the existing "id" is kept --%>
    <c:if test="${ entityModel.operationType eq 'edit' }">
      <input type="hidden" value="${ entityModel.individualExt.id }" name="individualExt.id"/>
    </c:if>
  </form>
</div>

<script type="text/javascript">
function doPublish(userId)
{
    var form = document.getElementById("form");
    form.action = "<%=request.getContextPath()%>/user/doPublish.action?dataId="+userId;
    form.submit();
}

function doEdit()
{
    var form = document.getElementById("form");
    form.action = "<%=request.getContextPath()%>/individual/doEdit.action";
    form.submit();
}

function checkboxSelect(name, all_none)
{
  var checkboxes = document.getElementsByName(name); 
  var checked;
  if(all_none=="all")
  {
    checked=true;
  }
  else
  {
    checked=false;
  }

  for(var i=0; i<checkboxes.length; i++)
  {
    checkboxes[i].checked = checked;
  }
}


</script>
</body>
</html>
