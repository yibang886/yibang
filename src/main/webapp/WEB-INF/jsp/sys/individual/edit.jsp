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
          <td>审核状态：</td>
          <td>
            <select name="individualExt.valid_pass">
              <c:if test="${ entityModel.operationType eq 'edit' }">
                <option value="0" <c:if test="${entityModel.individualExt.valid_pass==0}"><c:out value="selected"/></c:if> >待审核</option>
                <option value="1" <c:if test="${entityModel.individualExt.valid_pass==1}"><c:out value="selected"/></c:if> >审核通过</option>
                <option value="2" <c:if test="${entityModel.individualExt.valid_pass==2}"><c:out value="selected"/></c:if> >审核未通过</option>
              </c:if>
              <c:if test="${ entityModel.operationType eq 'publish' }">
                <option value="0" selected="true" >待审核</option>
                <option value="1">审核通过</option>
                <option value="2">审核未通过</option>
              </c:if>
            </select>
          </td>
        </tr>
        
        <tr>
          <td>认证状态：</td>
          <td>
            <select name="individualExt.auth_pass">
              <c:if test="${ entityModel.operationType eq 'edit' }">
                <option value="0" <c:if test="${entityModel.individualExt.auth_pass==0}"><c:out value="selected"/></c:if> >待认证</option>
                <option value="1" <c:if test="${entityModel.individualExt.auth_pass==1}"><c:out value="selected"/></c:if> >认证通过</option>
                <option value="2" <c:if test="${entityModel.individualExt.auth_pass==2}"><c:out value="selected"/></c:if> >认证未通过</option>
              </c:if>
              <c:if test="${ entityModel.operationType eq 'publish' }">
                <option value="0" selected="true" >待认证</option>
                <option value="1">认证通过</option>
                <option value="2">认证未通过</option>
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
                  <option value="${var.id}" selected="true"> <%-- if all set selected, the last one will take effect --%>
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

    <c:if test="${ entityModel.operationType eq 'edit' }">
      <%-- Yuanguo: for "edit", the existing "id" is kept --%>
      <input type="hidden" value="${ entityModel.individualExt.id }" name="individualExt.id"/>

      <%-- pass query condions back to controller; --%>
      <input type="hidden" value="${entityModel.individualQueryCon.auth_pass}" name="individualQueryCon.auth_pass"/>
      <input type="hidden" value="${entityModel.individualQueryCon.valid_pass}" name="individualQueryCon.valid_pass"/>
      <c:forEach items="${entityModel.individualQueryCon.languages}" var="var">
        <input type="checkbox" style="display:none" name="langCheckbox" value="${var.id}" checked="true"/>
      </c:forEach>
    </c:if>

  </form>

  <%-- Yuanguo: make use of "operationType" to decide to doPublish or doEdit; see goPublish in UserController.java and goEdit in IndividualController.java --%>
  <c:if test="${ entityModel.operationType eq 'publish' }">
    <input type="button" value="发布" onclick="doPublish(${entityModel.dataId})" />
    <input type="button" value="取消" onclick="cancelIt('publish')"/>
  </c:if>
  <c:if test="${ entityModel.operationType eq 'edit' }">
    <input type="button" value="保存" onclick="doEdit()"/>
    <input type="button" value="取消" onclick="cancelIt('edit')"/>
  </c:if>


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

function cancelIt(operationType)
{
  var form = document.getElementById("form");
  if(operationType == "publish")
  {
    form.action = "<%=request.getContextPath()%>/user/query.action";
    form.submit();
  }
  else if (operationType == "edit")
  {
    form.action = "<%=request.getContextPath()%>/individual/query.action";
    form.submit();
  }
}


</script>
</body>
</html>
