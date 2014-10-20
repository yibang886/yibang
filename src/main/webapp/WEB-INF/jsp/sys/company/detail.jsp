<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/core/include.jsp"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HTML Page Title</title>
<%@ include file="/core/includecss.jsp"%>

<script type="text/javascript">
function showHideImg(id)
{
  var img = document.getElementById(id);
  if(img.style.display == "block")
  {
    img.style.display = "none";
  }
  else if(img.style.display == "none")
  {
    img.style.display = "block";
  }
}

function clickRadio(operationType, username)
{
  var checkedRadioId;
  var radios = document.getElementsByName("passFailUnknown");
  for(var i=0; i< radios.length; i++)
  {
    var radio = radios[i];
    if(radio.checked == true)
    {
      checkedRadioId = radio.id;
      break;
    }
  }

  var op;
  if(operationType == "authenticate")
  {
    op = "认证";
  }
  else if(operationType == "validate")
  {
    op = "审核";
  }

  if(checkedRadioId == "pass")
  {
    var txtArea = document.getElementById("emailContent");
    txtArea.value = username+"您好！\n" + 
                    "恭喜你！你已经通过译邦翻译平台的"+op+"！";
  }
  else if(checkedRadioId == "fail")
  {
    var txtArea = document.getElementById("emailContent");
    txtArea.value = username+"您好！\n" +
                    "很遗憾！您未能通过译邦翻译平台的"+op+"。请重新认真填写您公司的资料！";
  }
  else
  {
    var txtArea = document.getElementById("emailContent");
    txtArea.value = "";
  }
}

function submitOrCancel(subOrCan, operationType, compId)
{
  var form = document.getElementById("form");

  if(subOrCan == "submit")
  {
    var checkedRadioId;
    var radios = document.getElementsByName("passFailUnknown");
    for(var i=0; i< radios.length; i++)
    {
      var radio = radios[i];
      if(radio.checked == true)
      {
        checkedRadioId = radio.id;
        break;
      }
    }

    form.action = "<%=request.getContextPath()%>/company/doValidateAuthenticate.action?submitOrCancel=submit&operationType="+operationType+"&compId="+compId+"&result="+checkedRadioId;
    form.submit();
  }
  else
  {
    form.action = "<%=request.getContextPath()%>/company/doValidateAuthenticate.action?submitOrCancel=cancel&operationType="+operationType;
    form.submit();
  }
}

function goBack()
{
  var form = document.getElementById("form");
  form.action = "<%=request.getContextPath()%>/company/query.action";
  form.submit();
}
</script>
</head>

<body>
<div id="wrapper">
  <table border="0" cellpadding="0" cellspacing="0" class="table_date" id="dataTable">
    <tr>
      <th width="15%"><div>项目 </div></th>
      <th width="85%"><div>信息 </div></th>
    </tr>

    <tr>
      <td><div>公司logo：</div></td>
      <td>
        <div>
          <c:if test="${!empty entityModel.companyExt.logo_suffix}">
            <img src="/ybfiles/company/${entityModel.companyExt.id}/logo/large${entityModel.companyExt.logo_suffix}" />
          </c:if>
        </div>
      </td>
    </tr>
    
    <tr>
      <td><div>公司名称：</div></td>
      <td>
        <div>
          <c:if test="${!empty entityModel.companyExt.name}">
            <c:out value="${entityModel.companyExt.name}" escapeXml="true"/>
          </c:if>
        </div>
      </td>
    </tr>

    <tr>
      <td><div>所在城市：</div></td>
      <td>
        <div>
          <c:if test="${!empty entityModel.companyExt.city}">
            <c:out value="${entityModel.companyExt.city.city}" escapeXml="true"/>
          </c:if>
        </div>
      </td>
    </tr>

    <tr>
      <td><div>公司地址：</div></td>
      <td>
        <div>
          <c:if test="${!empty entityModel.companyExt.address}">
            <c:out value="${entityModel.companyExt.address}" escapeXml="true"/>
          </c:if>
        </div>
      </td>
    </tr>

    <tr>
      <td><div>公司网站：</div></td>
      <td>
        <div>
          <c:if test="${!empty entityModel.companyExt.website}">
            <a href="${entityModel.companyExt.website}" style="color:blue;">
              <c:out value="${entityModel.companyExt.website}" escapeXml="true" />
            </a>
          </c:if>
        </div>
      </td>
    </tr>

    <tr>
      <td><div>公司简介：</div></td>
      <td>
        <div>
          <c:if test="${!empty entityModel.companyExt.inroduct}">
            <c:out value="${entityModel.companyExt.inroduct}" escapeXml="true"/>
          </c:if>
        </div>
      </td>
    </tr>

    <tr>
      <td><div>语种：</div></td>
      <td>
        <div>
          <c:if test="${!empty entityModel.companyExt.languages}">
            <c:forEach var="var" items="${entityModel.companyExt.languages}">
              <c:out value="${var.language}" escapeXml="true" />&nbsp;&nbsp;
            </c:forEach>
          </c:if>            
        </div>
      </td>
    </tr>

    <tr>
      <td><div>专业领域：</div></td>
      <td>
        <div>
          <c:if test="${!empty entityModel.companyExt.fields}">
            <c:forEach var="var" items="${entityModel.companyExt.fields}">
              <c:out value="${var.field}" escapeXml="true" />&nbsp;&nbsp;
            </c:forEach>
          </c:if>            
        </div>
      </td>
    </tr>

    <tr>
      <td><div>翻译类型：</div></td>
      <td>
        <div>
          <c:if test="${!empty entityModel.companyExt.transtypes}">
            <c:forEach var="var" items="${entityModel.companyExt.transtypes}">
              <c:out value="${var.transtype}" escapeXml="true" />&nbsp;&nbsp;
            </c:forEach>
          </c:if>            
        </div>
      </td>
    </tr>

    <tr>
      <td><div>文档类型：</div></td>
      <td>
        <div>
          <c:if test="${!empty entityModel.companyExt.doctypes}">
            <c:forEach var="var" items="${entityModel.companyExt.doctypes}">
              <c:out value="${var.doctype}" escapeXml="true" />&nbsp;&nbsp;
            </c:forEach>
          </c:if>            
        </div>
      </td>
    </tr>

    <tr>
      <td><div>认证资料：</div></td>
      <td>
        <div>
          <c:if test="${!empty entityModel.companyExt.authfile_suffix}">
            <a onclick="showHideImg('authfile')" style="color:red;">[点击显示与隐藏图片]</a>
            <img src="/ybfiles/company/${entityModel.companyExt.id}/authentication_file/raw${entityModel.companyExt.authfile_suffix}"style='display:none' id='authfile'/>
          </c:if>
        </div>
      </td>
    </tr>

    <tr>
      <td><div>审核状态：</div></td>
      <td>
        <div>
          <c:if test="${ entityModel.companyExt.valid_pass eq 0 }">
            <c:out value="待审核" escapeXml="true" />
          </c:if>            
          <c:if test="${ entityModel.companyExt.valid_pass eq 1 }">
            <c:out value="审核通过" escapeXml="true" />
          </c:if>            
          <c:if test="${ entityModel.companyExt.valid_pass eq 2 }">
            <c:out value="审核未通过" escapeXml="true" />
          </c:if>            
        </div>
      </td>
    </tr>

    <tr>
      <td><div>认证状态：</div></td>
      <td>
        <div>
          <c:if test="${ entityModel.companyExt.auth_pass eq 0 }">
            <c:out value="待认证" escapeXml="true" />
          </c:if>            
          <c:if test="${ entityModel.companyExt.auth_pass eq 1 }">
            <c:out value="认证通过" escapeXml="true" />
          </c:if>            
          <c:if test="${ entityModel.companyExt.auth_pass eq 2 }">
            <c:out value="认证未通过" escapeXml="true" />
          </c:if>            
        </div>
      </td>
    </tr>

    <tr>
      <td><div>推荐位：</div></td>
      <td>
        <div>
          <c:if test="${!empty entityModel.companyExt.recompos}">
            <c:out value="${entityModel.companyExt.recompos.recompos }" escapeXml="true" />
          </c:if>            
        </div>
      </td>
    </tr>

    <tr>
      <td><div>邮箱：</div></td>
      <td>
        <div>
          <c:if test="${!empty entityModel.companyExt.user.email}">
            <c:out value="${entityModel.companyExt.user.email }" escapeXml="true" />
          </c:if>            
        </div>
      </td>
    </tr>

    <tr>
      <td><div>固定电话：</div></td>
      <td>
        <div>
          <c:if test="${!empty entityModel.companyExt.user.tel}">
            <c:out value="${entityModel.companyExt.user.tel }" escapeXml="true" />
          </c:if>            
        </div>
      </td>
    </tr>

    <tr>
      <td><div>移动电话：</div></td>
      <td>
        <div>
          <c:if test="${!empty entityModel.companyExt.user.mobile}">
            <c:out value="${entityModel.companyExt.user.mobile }" escapeXml="true" />
          </c:if>            
        </div>
      </td>
    </tr>

    <tr>
      <td><div>传真：</div></td>
      <td>
        <div>
          <c:if test="${!empty entityModel.companyExt.user.fax}">
            <c:out value="${entityModel.companyExt.user.fax }" escapeXml="true" />
          </c:if>            
        </div>
      </td>
    </tr>

    <tr>
      <td><div>QQ：</div></td>
      <td>
        <div>
          <c:if test="${!empty entityModel.companyExt.user.qq}">
            <c:out value="${entityModel.companyExt.user.qq }" escapeXml="true" />
          </c:if>            
        </div>
      </td>
    </tr>

    <tr>
      <td><div>微信：</div></td>
      <td>
        <div>
          <c:if test="${!empty entityModel.companyExt.user.weixin}">
            <c:out value="${entityModel.companyExt.user.weixin }" escapeXml="true" />
          </c:if>            
        </div>
      </td>
    </tr>

  </table>

  <form id="form" name="companyForm" method="post">

    <c:if test="${ entityModel.operationType eq 'validate' || entityModel.operationType eq 'authenticate' }">
      <table border="0" cellpadding="0" cellspacing="0" class="table_date" id="valid_auth">
  
        <tr>
          <th width="15%">
            <div>
              <c:if test="${ entityModel.operationType eq 'validate' }">请审核此公司</c:if>
              <c:if test="${ entityModel.operationType eq 'authenticate' }">请认证此公司</c:if>
            </div>
          </th>
          <th width="85%"><div></div></th>
        </tr>
  
        <tr>
          <td>
            <div>
              <c:if test="${ entityModel.operationType eq 'validate' }">审核结果</c:if>
              <c:if test="${ entityModel.operationType eq 'authenticate' }">认证结果</c:if>
            </div>
          </td>
          <td>
            <div>
              <input type="radio" name="passFailUnknown" id="pass" onclick="clickRadio('${entityModel.operationType}','${entityModel.companyExt.name}')"/>通过
              <input type="radio" name="passFailUnknown" id="fail" onclick="clickRadio('${entityModel.operationType}','${entityModel.companyExt.name}')"/>未通过
              <input type="radio" name="passFailUnknown" id="unknown" onclick="clickRadio('${entityModel.operationType}','${entityModel.companyExt.name}')"/>
                <c:if test="${ entityModel.operationType eq 'validate' }">暂不审核</c:if>
                <c:if test="${ entityModel.operationType eq 'authenticate' }">暂不认证</c:if>
            </div>
          </td>
        </tr>
  
        <tr>
          <td>
            <div>邮件内容</div>
          </td>
          <td>
            <div><textarea name="emailContent" rows="5" cols="80" id="emailContent"></textarea></div>
          </td>
        </tr>
        <tr>
          <td>
            <input type="button" id="valid_auth_button" onclick="submitOrCancel('submit','${entityModel.operationType}', ${entityModel.companyExt.id})" value="提交"/>
            <input type="button" id="valid_auth_button" onclick="submitOrCancel('cancel','${entityModel.operationType}', ${entityModel.companyExt.id})" value="取消"/>
          </td>
        </tr>
      </table>
    </c:if>


    <c:if test="${entityModel.operationType eq 'view'}">
      <input type="button" value="返回" onclick="goBack()"/>
    </c:if>

    <%-- pass query condions back to controller; --%>
    <%--
    <input type="hidden" value="${entityModel.companyQueryCon.name}" name="companyQueryCon.name"/>

    <input type="hidden" value="${entityModel.companyQueryCon.city_id}" name="companyQueryCon.city_id"/>

    <input type="hidden" value="${entityModel.companyQueryCon.address}" name="companyQueryCon.address"/>

    <input type="hidden" value="${entityModel.companyQueryCon.website}" name="companyQueryCon.website"/>

    <input type="hidden" value="${entityModel.companyQueryCon.inroduct}" name="companyQueryCon.inroduct"/>

    <input type="hidden" value="${entityModel.companyQueryCon.logo_suffix}" name="companyQueryCon.logo_suffix"/>

    <input type="hidden" value="${entityModel.companyQueryCon.authfile_suffix}" name="companyQueryCon.authfile_suffix"/>

    <input type="hidden" value="${entityModel.companyQueryCon.recompos_id}" name="companyQueryCon.recompos_id"/>
    --%>

    <input type="hidden" value="${entityModel.companyQueryCon.auth_pass}" name="companyQueryCon.auth_pass"/>
    <input type="hidden" value="${entityModel.companyQueryCon.valid_pass}" name="companyQueryCon.valid_pass"/>

  </form>

</div>
</body>

</html>
