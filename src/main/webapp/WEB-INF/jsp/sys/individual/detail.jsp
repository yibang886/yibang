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
          <c:if test="${!empty individualModel.individualExt.photo_suffix}">
            <img src="/ybfiles/individual/${individualModel.individualExt.id}/photo/large${individualModel.individualExt.photo_suffix}" />
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
          <c:if test="${!empty individualModel.individualExt.langcert_suffix}">
            <a onclick="showHideImg('langcert')" style="color:red;">[点击显示与隐藏图片]</a> 
            <img src="/ybfiles/individual/${individualModel.individualExt.id}/language_cert/raw${individualModel.individualExt.langcert_suffix}" style='display:none' id='langcert'/>
          </c:if>            
        </div>
      </td>
    </tr>
              
    <tr>
      <td><div>翻译证书：</div></td>
      <td>
        <div>
          <c:if test="${!empty individualModel.individualExt.transcert_suffix}">
            <a onclick="showHideImg('transcert')" style="color:red;">[点击显示与隐藏图片]</a> 
            <img src="/ybfiles/individual/${individualModel.individualExt.id}/translation_cert/raw${individualModel.individualExt.transcert_suffix}" style='display:none' id='transcert'/>
          </c:if>            
        </div>
      </td>
    </tr>
              
    <tr>
      <td><div>专业证书：</div></td>
      <td>
        <div>
          <c:if test="${!empty individualModel.individualExt.profcert_suffix}">
            <a onclick="showHideImg('profcert')" style="color:red;">[点击显示与隐藏图片]</a> 
            <img src="/ybfiles/individual/${individualModel.individualExt.id}/profession_cert/raw${individualModel.individualExt.profcert_suffix}" style='display:none' id='profcert'/>
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
          <c:if test="${!empty individualModel.individualExt.authfile_suffix}">
            <a onclick="showHideImg('authfile')" style="color:red;">[点击显示与隐藏图片]</a>
            <img src="/ybfiles/individual/${individualModel.individualExt.id}/authentication_file/raw${individualModel.individualExt.authfile_suffix}"style='display:none' id='authfile'/>
          </c:if>
        </div>
      </td>
    </tr>
              
    <tr>
      <td><div>是否通过认证：</div></td>
      <td>
        <div>
          <c:if test="${ individualModel.individualExt.auth_pass eq 1 }">
            <c:out value="是" escapeXml="true" />
          </c:if>            
          <c:if test="${ individualModel.individualExt.auth_pass eq 0 }">
            <c:out value="否" escapeXml="true" />
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
</div>
</body>
</html>
