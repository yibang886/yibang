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

function clickRadio(operationType)
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

  var txtArea = document.getElementById("emailContent");
  var mailCnt ;

  if(checkedRadioId == "pass")
  {
    if(operationType == "authenticate")
    {
      mailCnt = "您好！\n\n" +
              "感谢您对译邦网的关注与信任。\n" + 
              "您所提交的资料已通过认证，您的信息将优先展示给所有译邦网的用户，让潜在的客户找到您。\n" + 
              "请参考以下链接，了解如何让您的信息在译邦网上得到更多的展示机会：\n" +
              "http://fanyi360.cn/yibang/advertise.action\n\n" +
              "如果您有任何需求或疑问，欢迎与我们联系！\n" + 
              "电话：028-6580-6596\n" +
              "传真：028-6580-6596\n" +
              "邮箱：yibang886@163.com\n" +
              "QQ：2107201709\n\n" +
              "感谢您的关注与支持！\n";
    }
    else if(operationType == "validate")
    {
      mailCnt = "您好！\n\n" +
              "感谢您对译邦网的关注与信任。\n" +
              "您所提交的信息已通过审核，您的信息将有机会展示给所有译邦网的用户，让潜在的客户找到您。\n" +
              "如果您还没有通过提交相关资质进行认证，建议您及时上传所要求的文件完成认证。认证后的信息将优先展示，并且更容易获得客户的信任，也让您更容易与客户建立联系。\n" +
              "如果您已经进行过认证，您可以通过以下链接，了解如何让您的信息在译邦网上得到更多的展示机会：\n" +
              "http://fanyi360.cn/yibang/advertise.action\n\n" +
              "感谢您的关注与支持！\n";
    }
  }
  else if(checkedRadioId == "fail")
  {
    if(operationType == "authenticate")
    {
      mailCnt = "您好！\n\n" +
              "感谢您对译邦网的关注与信任。\n" +
              "很抱歉的通知你，您所提交的资料未能通过认证。未能通过认证的原因如下：\n" +
              "1. 资料不完整；\n" + 
              "2. 图片不清楚；\n" +
              "3. 其它原因; \n\n" +
              "请您重新提交相关资料，我们将再次为您服务。\n" + 
              "在您通过认证后，您的信息将优先展示给所有译邦网的用户，让潜在的客户找到您。\n" + 
              "在您通过认证后，您还可以通过以下链接，了解如何让您的信息在译邦网上得到更多的展示机会：\n" +
              "http://fanyi360.cn/yibang/advertise.action\n\n" +
              "感谢您的关注与支持！\n";
    }
    else if(operationType == "validate")
    {
      mailCnt = "您好！\n\n" +
            "感谢您对译邦网的关注与信任。\n" +
            "很抱歉的通知您，您所提交的信息未能通过审核。未能通过审核的原因如下：\n" +
            "1. 信息不完整；\n" +
            "2. 信息不真实；\n" +
            "3. 违反国家有关规定；\n" +
            "4. 其它原因; \n\n" +
            "请您修改以上信息并重新提交，我们将再次为您服务。\n" +
            "您所提交的信息通过审核后，将有机会展示给所有译邦网的用户，让潜在的客户找到您。\n" +
            "同时我们也建议您提交相关资质进行认证。认证后的信息将优先展示，并且更容易获得客户的信任，也让您更容易与客户建立联系。\n" +
            "在您通过了审核与认证以后，您还可以通过以下链接，了解如何让您的信息在译邦网上得到更多的展示机会：\n" +
            "http://fanyi360.cn/yibang/advertise.action\n\n" +
            "感谢您的关注与支持！\n";
    }
  }
  else
  {
    mailCnt = "";
  }
  txtArea.value = mailCnt;
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
          <c:if test="${!empty entityModel.companyExt.logo}">
            <img src="${entityModel.companyExt.logo}" />
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
          <c:if test="${!empty entityModel.companyExt.authfile}">
            <a onclick="showHideImg('authfile')" style="color:red;">[点击显示与隐藏图片]</a>
            <img src="${entityModel.companyExt.authfile}" style='display:none' id='authfile'/>
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
              <input type="radio" name="passFailUnknown" id="pass" onclick="clickRadio('${entityModel.operationType}')"/>通过
              <input type="radio" name="passFailUnknown" id="fail" onclick="clickRadio('${entityModel.operationType}')"/>未通过
              <input type="radio" name="passFailUnknown" id="unknown" onclick="clickRadio('${entityModel.operationType}')"/>
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
            <div><textarea name="emailContent" rows="15" cols="80" id="emailContent"></textarea></div>
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

    <input type="hidden" value="${entityModel.companyQueryCon.logo}" name="companyQueryCon.logo"/>

    <input type="hidden" value="${entityModel.companyQueryCon.authfile}" name="companyQueryCon.authfile"/>

    <input type="hidden" value="${entityModel.companyQueryCon.recompos_id}" name="companyQueryCon.recompos_id"/>
    --%>

    <input type="hidden" value="${entityModel.companyQueryCon.auth_pass}" name="companyQueryCon.auth_pass"/>
    <input type="hidden" value="${entityModel.companyQueryCon.valid_pass}" name="companyQueryCon.valid_pass"/>

  </form>

</div>
</body>

</html>
