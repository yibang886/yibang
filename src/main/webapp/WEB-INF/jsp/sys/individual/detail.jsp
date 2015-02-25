<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/core/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户名</title>
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
		"http://www.fanyi360.cn/yibang/advertise.action\n\n" +
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
		"http://www.fanyi360.cn/yibang/advertise.action\n\n" +
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
		"http://www.fanyi360.cn/yibang/advertise.action\n\n" +
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
              "http://www.fanyi360.cn/yibang/advertise.action\n\n" +
              "感谢您的关注与支持！\n";
      }
    }
    else
    {
      mailCnt = "";
    }
    txtArea.value = mailCnt;
  }

  function submitOrCancel(subOrCan, operationType, indivId)
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

      form.action = "<%=request.getContextPath()%>/individual/doValidateAuthenticate.action?submitOrCancel=submit&operationType="+operationType+"&indivId="+indivId+"&result="+checkedRadioId;
      form.submit();
    }
    else
    {
      form.action = "<%=request.getContextPath()%>/individual/doValidateAuthenticate.action?submitOrCancel=cancel&operationType="+operationType;
      form.submit();
    }
  }

  function goBack()
  {
    var form = document.getElementById("form");
    form.action = "<%=request.getContextPath()%>/individual/query.action";
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
      <td><div>近期照片：</div></td>
      <td>
        <div>
          <c:if test="${!empty individualModel.individualExt.photo}">
            <img src="${individualModel.individualExt.photo}" />
          </c:if>            
        </div>
      </td>
    </tr>

    <tr>
      <td><div>姓名：</div></td>
      <td>
        <div>
          <c:if test="${!empty individualModel.individualExt.name}">
            <c:out value="${individualModel.individualExt.name }" escapeXml="true" />
          </c:if>            
        </div>
      </td>
    </tr>

    <tr>
      <td><div>性别：</div></td>
      <td>
        <div>
          <c:if test="${ individualModel.individualExt.gender eq 0 }">
            <c:out value="男" escapeXml="true" />
          </c:if>            
          <c:if test="${ individualModel.individualExt.gender eq 1 }">
            <c:out value="女" escapeXml="true" />
          </c:if>            
        </div>
      </td>
    </tr>
              
    <tr>
      <td><div>教育水平：</div></td>
      <td>
        <div>
          <c:if test="${!empty individualModel.individualExt.education}">
            <c:out value="${individualModel.individualExt.education.education }" escapeXml="true" />
          </c:if>            
        </div>
      </td>
    </tr>

    <tr>
      <td><div>毕业院校：</div></td>
      <td>
        <div>
          <c:if test="${!empty individualModel.individualExt.school}">
            <c:out value="${individualModel.individualExt.school.school }" escapeXml="true" />
          </c:if>            
        </div>
      </td>
    </tr>
              
    <tr>
      <td><div>出生年：</div></td>
      <td>
        <div>
          <c:if test="${!empty individualModel.individualExt.birth_year}">
            <c:out value="${individualModel.individualExt.birth_year }" escapeXml="true" />
          </c:if>            
        </div>
      </td>
    </tr>
              
    <tr>
      <td><div>所在城市：</div></td>
      <td>
        <div>
          <c:if test="${!empty individualModel.individualExt.city}">
            <c:out value="${individualModel.individualExt.city.city }" escapeXml="true" />
          </c:if>            
        </div>
      </td>
    </tr>

    <tr>
      <td><div>工作方式：</div></td>
      <td>
        <div>
          <c:if test="${ individualModel.individualExt.workstyle eq 0 }">
            <c:out value="全职" escapeXml="true" />
          </c:if>            
          <c:if test="${ individualModel.individualExt.workstyle eq 1 }">
            <c:out value="兼职" escapeXml="true" />
          </c:if>            
        </div>
      </td>
    </tr>

    <tr>
      <td><div>语种：</div></td>
      <td>
        <div>
          <c:if test="${!empty individualModel.individualExt.languages}">
            <c:forEach var="var" items="${individualModel.individualExt.languages}">
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
          <c:if test="${!empty individualModel.individualExt.fields}">
            <c:forEach var="var" items="${individualModel.individualExt.fields}">
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
          <c:if test="${!empty individualModel.individualExt.transtypes}">
            <c:forEach var="var" items="${individualModel.individualExt.transtypes}">
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
          <c:if test="${!empty individualModel.individualExt.doctypes}">
            <c:forEach var="var" items="${individualModel.individualExt.doctypes}">
              <c:out value="${var.doctype}" escapeXml="true" />&nbsp;&nbsp;
            </c:forEach>
          </c:if>            
        </div>
      </td>
    </tr>

    <tr>
      <td><div>语言等级证书：</div></td>
      <td>
        <div>
          <c:if test="${!empty individualModel.individualExt.langcert}">
            <a onclick="showHideImg('langcert')" style="color:red;">[点击显示与隐藏图片]</a> 
            <img src="${individualModel.individualExt.langcert}" style='display:none' id='langcert'/>
          </c:if>            
        </div>
      </td>
    </tr>
              
    <tr>
      <td><div>翻译证书：</div></td>
      <td>
        <div>
          <c:if test="${!empty individualModel.individualExt.transcert}">
            <a onclick="showHideImg('transcert')" style="color:red;">[点击显示与隐藏图片]</a> 
            <img src="${individualModel.individualExt.transcert}" style='display:none' id='transcert'/>
          </c:if>            
        </div>
      </td>
    </tr>
              
    <tr>
      <td><div>专业证书：</div></td>
      <td>
        <div>
          <c:if test="${!empty individualModel.individualExt.profcert}">
            <a onclick="showHideImg('profcert')" style="color:red;">[点击显示与隐藏图片]</a> 
            <img src="${individualModel.individualExt.profcert}" style='display:none' id='profcert'/>
          </c:if>            
        </div>
      </td>
    </tr>
              
    <tr>
      <td><div>工作经验：</div></td>
      <td>
        <div>
          <c:if test="${!empty individualModel.individualExt.exp_year}">
            <c:out value="${individualModel.individualExt.exp_year }(年)" escapeXml="true" />
          </c:if>            
        </div>
      </td>
    </tr>
              
    <tr>
      <td><div>翻译经验：</div></td>
      <td>
        <div>
          <c:if test="${!empty individualModel.individualExt.exp_trans}">
            <c:out value="${individualModel.individualExt.exp_trans }(万字)" escapeXml="true" />
          </c:if>            
        </div>
      </td>
    </tr>
              
    <tr>
      <td><div>翻译作品：</div></td>
      <td>
        <div>
          <c:if test="${!empty individualModel.individualExt.works}">
            <c:out value="${individualModel.individualExt.works }" escapeXml="true" />
          </c:if>            
        </div>
      </td>
    </tr>

    <tr>
      <td><div>个人简介：</div></td>
      <td>
        <div>
          <c:if test="${!empty individualModel.individualExt.introduct}">
            <c:out value="${individualModel.individualExt.introduct }" escapeXml="true" />
          </c:if>            
        </div>
      </td>
    </tr>

    <tr>
      <td><div>个人主页：</div></td>
      <td>
        <div>
          <c:if test="${!empty individualModel.individualExt.mainpage}">
            <a href="${individualModel.individualExt.mainpage }" style="color:blue;">
              <c:out value="${individualModel.individualExt.mainpage }" escapeXml="true" />
            </a>
          </c:if>            
        </div>
      </td>
    </tr>

    <tr>
      <td><div>认证资料：</div></td>
      <td>
        <div>
          <c:if test="${!empty individualModel.individualExt.authfile}">
            <a onclick="showHideImg('authfile')" style="color:red;">[点击显示与隐藏图片]</a>
            <img src="${individualModel.individualExt.authfile}"style='display:none' id='authfile'/>
          </c:if>
        </div>
      </td>
    </tr>

    <tr>
      <td><div>审核状态：</div></td>
      <td>
        <div>
          <c:if test="${ individualModel.individualExt.valid_pass eq 0 }">
            <c:out value="待审核" escapeXml="true" />
          </c:if>            
          <c:if test="${ individualModel.individualExt.valid_pass eq 1 }">
            <c:out value="审核通过" escapeXml="true" />
          </c:if>            
          <c:if test="${ individualModel.individualExt.valid_pass eq 2 }">
            <c:out value="审核未通过" escapeXml="true" />
          </c:if>            
        </div>
      </td>
    </tr>
              
    <tr>
      <td><div>认证状态：</div></td>
      <td>
        <div>
          <c:if test="${ individualModel.individualExt.auth_pass eq 0 }">
            <c:out value="待认证" escapeXml="true" />
          </c:if>            
          <c:if test="${ individualModel.individualExt.auth_pass eq 1 }">
            <c:out value="认证通过" escapeXml="true" />
          </c:if>            
          <c:if test="${ individualModel.individualExt.auth_pass eq 2 }">
            <c:out value="认证未通过" escapeXml="true" />
          </c:if>            
        </div>
      </td>
    </tr>

    <tr>
      <td><div>推荐位：</div></td>
      <td>
        <div>
          <c:if test="${!empty individualModel.individualExt.recompos}">
            <c:out value="${individualModel.individualExt.recompos.recompos }" escapeXml="true" />
          </c:if>            
        </div>
      </td>
    </tr>

    <tr>
      <td><div>邮箱：</div></td>
      <td>
        <div>
          <c:if test="${!empty individualModel.individualExt.user.email}">
            <c:out value="${individualModel.individualExt.user.email }" escapeXml="true" />
          </c:if>            
        </div>
      </td>
    </tr>

    <tr>
      <td><div>固定电话：</div></td>
      <td>
        <div>
          <c:if test="${!empty individualModel.individualExt.user.tel}">
            <c:out value="${individualModel.individualExt.user.tel }" escapeXml="true" />
          </c:if>            
        </div>
      </td>
    </tr>

    <tr>
      <td><div>移动电话：</div></td>
      <td>
        <div>
          <c:if test="${!empty individualModel.individualExt.user.mobile}">
            <c:out value="${individualModel.individualExt.user.mobile }" escapeXml="true" />
          </c:if>            
        </div>
      </td>
    </tr>

    <tr>
      <td><div>传真：</div></td>
      <td>
        <div>
          <c:if test="${!empty individualModel.individualExt.user.fax}">
            <c:out value="${individualModel.individualExt.user.fax }" escapeXml="true" />
          </c:if>            
        </div>
      </td>
    </tr>

    <tr>
      <td><div>QQ：</div></td>
      <td>
        <div>
          <c:if test="${!empty individualModel.individualExt.user.qq}">
            <c:out value="${individualModel.individualExt.user.qq }" escapeXml="true" />
          </c:if>            
        </div>
      </td>
    </tr>

    <tr>
      <td><div>微信：</div></td>
      <td>
        <div>
          <c:if test="${!empty individualModel.individualExt.user.weixin}">
            <c:out value="${individualModel.individualExt.user.weixin }" escapeXml="true" />
          </c:if>            
        </div>
      </td>
    </tr>
  </table>

  <form id="form" name="validAuthForm" method="post">
    <c:if test="${ individualModel.operationType eq 'validate' || individualModel.operationType eq 'authenticate' }">
      <table border="0" cellpadding="0" cellspacing="0" class="table_date" id="valid_auth">
  
        <tr>
          <th width="15%">
            <div>
              <c:if test="${ individualModel.operationType eq 'validate' }">请审核此译员</c:if>
              <c:if test="${ individualModel.operationType eq 'authenticate' }">请认证此译员</c:if>
            </div>
          </th>
          <th width="85%"><div></div></th>
        </tr>
  
        <tr>
          <td>
            <div>
              <c:if test="${ individualModel.operationType eq 'validate' }">审核结果</c:if>
              <c:if test="${ individualModel.operationType eq 'authenticate' }">认证结果</c:if>
            </div>
          </td>
          <td>
            <div>
              <input type="radio" name="passFailUnknown" id="pass" onclick="clickRadio('${individualModel.operationType}')"/>通过
              <input type="radio" name="passFailUnknown" id="fail" onclick="clickRadio('${individualModel.operationType}')"/>未通过
              <input type="radio" name="passFailUnknown" id="unknown" onclick="clickRadio('${individualModel.operationType}')"/>
                <c:if test="${ individualModel.operationType eq 'validate' }">暂不审核</c:if>
                <c:if test="${ individualModel.operationType eq 'authenticate' }">暂不认证</c:if>
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
            <input type="button" id="valid_auth_button" onclick="submitOrCancel('submit','${individualModel.operationType}', ${individualModel.individualExt.id})" value="提交"/>
            <input type="button" id="valid_auth_button" onclick="submitOrCancel('cancel','${individualModel.operationType}', ${individualModel.individualExt.id})" value="取消"/>
          </td>
        </tr>
      </table>
    </c:if>

    <c:if test="${individualModel.operationType eq 'view'}">
      <input type="button" value="返回" onclick="goBack()"/>
    </c:if>

    <%--
       pass query condions back to controller;
    --%>
    <input type="hidden" value="${individualModel.individualQueryCon.auth_pass}" name="individualQueryCon.auth_pass"/>
    <input type="hidden" value="${individualModel.individualQueryCon.valid_pass}" name="individualQueryCon.valid_pass"/>
    <c:forEach items="${individualModel.individualQueryCon.languages}" var="var">
      <input type="checkbox" style="display:none" name="langCheckbox" value="${var.id}" checked="true"/>
    </c:forEach>

  </form>

</div>
</body>
</html>
