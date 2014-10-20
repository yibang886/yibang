<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/core/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页大图编辑页</title>
<%@ include file="/core/includecss.jsp"%>

<script type="text/javascript">

function strEndWith(str, suffix)
{
  var reg=new RegExp(suffix+"$");
  return reg.test(str);
}

function doUploadFile(usecase,fileType,userId,skip)  
{
  if(skip==0) //not skip
  {
    var msg="";
    if(fileType=="logo")
    {
      msg="公司logo";
    }
    else if(fileType=="authentication_file")
    {
      msg="认证资料扫描图片";
    }
    else
    {
      alert("上传文件类型("+fileType+")非法， 暂时不能上传文件，请点击'跳过'");
      return "";
    }

    var fileName = document.getElementById("upfile").value;

    if(fileName=="")
    {
      alert("请选择'"+msg+"文件'，然后点击'上传'");
      return "";
    }

    if( !strEndWith(fileName,".png") && 
        !strEndWith(fileName,".jpg") && 
        !strEndWith(fileName,".jpe") && 
        !strEndWith(fileName,".jpeg") &&
        !strEndWith(fileName,".gif") &&
        !strEndWith(fileName,".jfif") )
    {
      alert(msg+"只能为.png，.jpg，.jpe，.jpeg，.gif或.jfif文件");
      return "";
    }
  }

  var form = document.getElementById("uploadForm");

  //Yuanguo: company/edit.jsp has two usecases: 
  //   1. user entity publishes (creates) an company enity; 
  //   2. company entity modification operation; 
  //Thus, we need to know which case it is; it determines the action of the form (/user/doUploadFile.action or /company/doUploadFile.action).
  form.action = "<%=request.getContextPath()%>/"
                  +((usecase=="publish")?"user":"company")   //company has 'one-to-one' map with user, so their ID are the same;
                  +"/doUploadFile.action?dataId="+userId+"&fileType="+fileType+"&skip="+skip;

  form.submit();
}
</script>

</head>

<body>

<div id="wrapper">

  <form id="uploadForm" name="uploadForm" method="post" enctype="multipart/form-data">
    <table class="table_add">
      <thead>

        <tr>
          <c:if test="${ entityModel.fileType eq 'logo' }">
            <td>
              <b>上传公司logo</b>
            </td>
          </c:if>
          <c:if test="${ entityModel.fileType eq 'authentication_file' }">
            <td>
              <b>上传认证资料</b>
            </td>
          </c:if>
        </tr>

        <tr>
          <td>文件：</td>
          <td><input type="file" id="upfile" name="upfile" multiple="false"/></td>
        </tr>

      </thead>
    </table>

    <%--
       pass query condions back to controller;
    --%>
    <input type="hidden" value="${entityModel.companyQueryCon.auth_pass}" name="companyQueryCon.auth_pass"/>
    <input type="hidden" value="${entityModel.companyQueryCon.valid_pass}" name="companyQueryCon.valid_pass"/>
    <c:forEach items="${entityModel.companyQueryCon.languages}" var="var">
      <input type="checkbox" style="display:none" name="langCheckbox" value="${var.id}" checked="true"/>
    </c:forEach>

  </form>

  <table class="table_add">
    <tr>
      <td>
        <input type="button" value="上传" onclick="doUploadFile('<c:out value="${entityModel.operationType}" escapeXml="true" />', '<c:out value="${ entityModel.fileType }" escapeXml="true" />', '<c:out value="${ entityModel.dataId }" escapeXml="true" />', 0)" />
      </td>
      <td>
        <input type="button" value="跳过" onclick="doUploadFile('<c:out value="${entityModel.operationType}" escapeXml="true" />', '<c:out value="${ entityModel.fileType }" escapeXml="true" />', '<c:out value="${ entityModel.dataId }" escapeXml="true" />', 1)" />
      </td>
    </tr>
  <table>

</div>

</body>
</html>
