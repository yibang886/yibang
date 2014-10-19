<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/core/include.jsp"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HTML Page Title</title>
<%@ include file="/core/includecss.jsp"%>

<script type="text/javascript">
function doCreate()
{
  var form = document.getElementById("form");
  form.action = "<%=request.getContextPath()%>/company/doCreate.action";
  form.submit();
}

function doEdit()
{
  var form = document.getElementById("form");
  form.action = "<%=request.getContextPath()%>/company/doEdit.action";
  form.submit();
}

function cancelIt()
{
  var form = document.getElementById("form");
  form.action = "<%=request.getContextPath()%>/company/query.action";
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

</head>

<body>
<div id="wrapper">
  <form id="form" name="companyForm" method="post">
    <table class="table_add">
      <thead>
        <tr>
          <td>公司名称：</td>
          <td>
            <c:if test="${entityModel.operationType eq 'edit'}">
              <input type="text" name="companyExt.name" value="<c:out value="${entityModel.companyExt.name}" escapeXml="true"/>" style="width:700px;"/>
            </c:if>
            <c:if test="${entityModel.operationType eq 'publish'}">
              <input type="text" name="companyExt.name" value="<c:out value="请如实填写" escapeXml="true" />" style="width:700px;"/>
            </c:if>
          </td>
        </tr>

        <tr>
          <td>所在城市：</td>
          <td>
            <select name="companyExt.city.id">
              <c:if test="${ entityModel.operationType eq 'edit' }">
                <c:forEach items="${entityModel.cityEnum}" var="var">
                  <option value="${var.id}" <c:if test="${entityModel.companyExt.city.id==var.id}"><c:out value="selected"/></c:if> >
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
          <td>公司地址：</td>
          <td>
            <c:if test="${entityModel.operationType eq 'edit'}">
              <input type="text" name="companyExt.address" value="<c:out value="${entityModel.companyExt.address}" escapeXml="true"/>" style="width:700px;"/>
            </c:if>
            <c:if test="${entityModel.operationType eq 'publish'}">
              <input type="text" name="companyExt.address" value="<c:out value="请如实填写" escapeXml="true" />" style="width:700px;"/>
            </c:if>
          </td>
        </tr>

        <tr>
          <td>公司网站：</td>
          <td>
            <c:if test="${entityModel.operationType eq 'edit'}">
              <input type="text" name="companyExt.website" value="<c:out value="${entityModel.companyExt.website}" escapeXml="true"/>" style="width:700px;"/>
            </c:if>
            <c:if test="${entityModel.operationType eq 'publish'}">
              <input type="text" name="companyExt.website" value="<c:out value="请如实填写" escapeXml="true" />" style="width:700px;"/>
            </c:if>
          </td>
        </tr>

        <tr>
          <td>公司简介：</td>
          <td>
            <c:if test="${entityModel.operationType eq 'edit'}">
              <input type="text" name="companyExt.inroduct" value="<c:out value="${entityModel.companyExt.inroduct}" escapeXml="true"/>" style="width:700px;"/>
            </c:if>
            <c:if test="${entityModel.operationType eq 'publish'}">
              <input type="text" name="companyExt.inroduct" value="<c:out value="请如实填写" escapeXml="true" />" style="width:700px;"/>
            </c:if>
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
                                <c:forEach items="${entityModel.companyExt.languages}" var="lang">
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
                                <c:forEach items="${entityModel.companyExt.fields}" var="field">
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
                                <c:forEach items="${entityModel.companyExt.transtypes}" var="transtype">
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
                                <c:forEach items="${entityModel.companyExt.doctypes}" var="doctype">
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


        <%--
        <tr>
          <td>公司logo：</td>
          <td>
            <c:if test="${entityModel.operationType eq 'edit'}">
              <input type="text" name="companyExt.logo_suffix" value="<c:out value="${entityModel.companyExt.logo_suffix}" escapeXml="true"/>" style="width:700px;"/>
            </c:if>
            <c:if test="${entityModel.operationType eq 'publish'}">
              <input type="text" name="companyExt.logo_suffix" value="<c:out value="请如实填写" escapeXml="true" />" style="width:700px;"/>
            </c:if>
          </td>
        </tr>

        <tr>
          <td>认证资料：</td>
          <td>
            <c:if test="${entityModel.operationType eq 'edit'}">
              <input type="text" name="companyExt.authfile_suffix" value="<c:out value="${entityModel.companyExt.authfile_suffix}" escapeXml="true"/>" style="width:700px;"/>
            </c:if>
            <c:if test="${entityModel.operationType eq 'publish'}">
              <input type="text" name="companyExt.authfile_suffix" value="<c:out value="请如实填写" escapeXml="true" />" style="width:700px;"/>
            </c:if>
          </td>
        </tr>
        --%>

        <tr>
          <td>审核状态：</td>
          <td>
            <select name="companyExt.valid_pass">
              <c:if test="${ entityModel.operationType eq 'edit' }">
                <option value="0" <c:if test="${entityModel.companyExt.valid_pass==0}"><c:out value="selected"/></c:if> >待审核</option>
                <option value="1" <c:if test="${entityModel.companyExt.valid_pass==1}"><c:out value="selected"/></c:if> >审核通过</option>
                <option value="2" <c:if test="${entityModel.companyExt.valid_pass==2}"><c:out value="selected"/></c:if> >审核未通过</option>
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
            <select name="companyExt.auth_pass">
              <c:if test="${ entityModel.operationType eq 'edit' }">
                <option value="0" <c:if test="${entityModel.companyExt.auth_pass==0}"><c:out value="selected"/></c:if> >待认证</option>
                <option value="1" <c:if test="${entityModel.companyExt.auth_pass==1}"><c:out value="selected"/></c:if> >认证通过</option>
                <option value="2" <c:if test="${entityModel.companyExt.auth_pass==2}"><c:out value="selected"/></c:if> >认证未通过</option>
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
            <select name="companyExt.recompos.id">
              <c:if test="${ entityModel.operationType eq 'edit' }">
                <c:forEach items="${entityModel.recomposEnum}" var="var">
                  <option value="${var.id}" <c:if test="${entityModel.companyExt.recompos.id==var.id}"><c:out value="selected"/></c:if> >
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

    <%-- for "edit", the existing "id" is kept --%>
    <c:if test="${entityModel.operationType eq 'edit'}">
      <input type="hidden" value="${entityModel.companyExt.id}" name="companyExt.id"/>
    </c:if>

    <%-- pass query condions back to controller; --%>
    <%--
    <input type="hidden" value="${entityModel.companyQueryCon.name}" name="${companyQueryCon.name}"/>

    <input type="hidden" value="${entityModel.companyQueryCon.city_id}" name="${companyQueryCon.city_id}"/>

    <input type="hidden" value="${entityModel.companyQueryCon.address}" name="${companyQueryCon.address}"/>

    <input type="hidden" value="${entityModel.companyQueryCon.website}" name="${companyQueryCon.website}"/>

    <input type="hidden" value="${entityModel.companyQueryCon.inroduct}" name="${companyQueryCon.inroduct}"/>

    <input type="hidden" value="${entityModel.companyQueryCon.logo_suffix}" name="${companyQueryCon.logo_suffix}"/>

    <input type="hidden" value="${entityModel.companyQueryCon.authfile_suffix}" name="${companyQueryCon.authfile_suffix}"/>

    <input type="hidden" value="${entityModel.companyQueryCon.recompos_id}" name="${companyQueryCon.recompos_id}"/>
    --%>

    <input type="hidden" value="${entityModel.companyQueryCon.auth_pass}" name="${companyQueryCon.auth_pass}"/>
    <input type="hidden" value="${entityModel.companyQueryCon.valid_pass}" name="${companyQueryCon.valid_pass}"/>

  </form>

  <c:if test="${entityModel.operationType eq 'publish'}">
    <input type="button" value="发布" onclick="doCreate()" />
    <input type="button" value="取消" onclick="cancelIt()"/>
  </c:if>
  <c:if test="${entityModel.operationType eq 'edit'}">
    <input type="button" value="保存" onclick="doEdit()"/>
    <input type="button" value="取消" onclick="cancelIt()"/>
  </c:if>
</div>

</body>
</html>
